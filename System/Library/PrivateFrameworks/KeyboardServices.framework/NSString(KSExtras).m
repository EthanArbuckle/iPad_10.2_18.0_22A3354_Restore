@implementation NSString(KSExtras)

+ (uint64_t)_characterSetWithPattern:()KSExtras
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HIDWORD(v10) = 0;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x7D0)
    v5 = 2000;
  else
    v5 = v4;
  v6 = objc_retainAutorelease(v3);
  if (objc_msgSend(v6, "_fastCharacterContents"))
  {
    v7 = uset_openPattern();
  }
  else
  {
    MEMORY[0x24BDAC7A8]();
    objc_msgSend(v6, "getCharacters:range:", (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v5);
    v7 = uset_openPattern();
  }
  if (SHIDWORD(v10) >= 1)
    NSLog(CFSTR("Couldn’t create USet from pattern %@"), v6);

  return v7;
}

- (BOOL)_contentsExclusivelyInCharacterSet:()KSExtras
{
  unint64_t v2;
  uint64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  if (v2 >= 0x7D0)
    v3 = 2000;
  else
    v3 = v2;
  v4 = objc_retainAutorelease(a1);
  if (objc_msgSend(v4, "_fastCharacterContents"))
  {
    v5 = uset_containsAllCodePoints();
  }
  else
  {
    MEMORY[0x24BDAC7A8]();
    objc_msgSend(v4, "getCharacters:range:", (char *)v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v3);
    v5 = uset_containsAllCodePoints();
  }
  return v5 != 0;
}

- (uint64_t)_containsCJKSymbolsAndPunctuation
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NSString_KSExtras___containsCJKSymbolsAndPunctuation__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = a1;
  if (_containsCJKSymbolsAndPunctuation___onceToken != -1)
    dispatch_once(&_containsCJKSymbolsAndPunctuation___onceToken, block);
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", _containsCJKSymbolsAndPunctuation___nonCJKSymbolsSet) ^ 1;
}

- (uint64_t)_containsIdeographicCharacters
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonIdeographicCharacterSet")) ^ 1;
}

+ (uint64_t)_nonIdeographicCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NSString_KSExtras___nonIdeographicCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonIdeographicCharacterSet___onceToken != -1)
    dispatch_once(&_nonIdeographicCharacterSet___onceToken, block);
  return _nonIdeographicCharacterSet___nonIdeographicCharacterSet;
}

- (BOOL)_containsEmoji
{
  return CEMStringContainsEmoji() != 0;
}

- (uint64_t)_containsHiraganaKatakanaOrBopomofo
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonHiraganaKatakanaOrBopomofoSet")) ^ 1;
}

+ (uint64_t)_nonHiraganaKatakanaOrBopomofoSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NSString_KSExtras___nonHiraganaKatakanaOrBopomofoSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonHiraganaKatakanaOrBopomofoSet___onceToken != -1)
    dispatch_once(&_nonHiraganaKatakanaOrBopomofoSet___onceToken, block);
  return _nonHiraganaKatakanaOrBopomofoSet___nonHiraganaKatakanaOrBopomofoSet;
}

@end
