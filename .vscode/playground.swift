import Foundation

func countVietnameseCharacters(in latinString: String) -> Int {
    let telexEncoding: [String: Character] = [
        "aw": "ă", "aa": "â", "dd": "đ", 
        "ee": "ê", "oo": "ô", "ow": "ơ", "w": "ư"
    ]

    let sortedEncodingPairs = telexEncoding.keys.sorted { $0.count > $1.count }
    var count = 0
    var index = latinString.startIndex

    while index < latinString.endIndex {
        var matchedEncoding: String?

        for encoding in sortedEncodingPairs {
            let endIndex = latinString.index(index, offsetBy: encoding.count, limitedBy: latinString.endIndex) ?? latinString.endIndex
            
            if latinString[index..<endIndex] == encoding {
                matchedEncoding = encoding
                break
            }
        }

        if let encoding = matchedEncoding {
            count += 1
            index = latinString.index(index, offsetBy: encoding.count)
        } else {
            index = latinString.index(after: index)
        }
    }

    return count
}

// Sử dụng hàm
let inputString = "hfdawhwhcoomddeehhoo"
let vietnameseCharactersCount = countVietnameseCharacters(in: inputString)
print(vietnameseCharactersCount) // Kết quả: 4