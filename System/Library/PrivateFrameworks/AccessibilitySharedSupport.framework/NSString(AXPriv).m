@implementation NSString(AXPriv)

+ (uint64_t)_characterSetWithPattern:()AXPriv
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HIDWORD(v12) = 0;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  if (objc_msgSend(v5, "_fastCharacterContents"))
  {
    v9 = uset_openPattern();
  }
  else
  {
    MEMORY[0x1E0C80A78](0, v6, v7, v8);
    objc_msgSend(v5, "getCharacters:range:", (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v4);
    v9 = uset_openPattern();
  }
  if (SHIDWORD(v12) >= 1)
    NSLog(CFSTR("Couldn’t create USet from pattern %@"), v5);

  return v9;
}

+ (uint64_t)_ideographSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NSString_AXPriv___ideographSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ideographSet___onceToken != -1)
    dispatch_once(&_ideographSet___onceToken, block);
  return _ideographSet___ideographSet;
}

+ (uint64_t)_japaneseLetterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NSString_AXPriv___japaneseLetterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_japaneseLetterSet___onceToken != -1)
    dispatch_once(&_japaneseLetterSet___onceToken, block);
  return _japaneseLetterSet___japaneseLetterSet;
}

- (uint64_t)_isOnlyIdeographs
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_ideographSet"));
}

- (uint64_t)_isJapanesePhrase
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_japaneseLetterSet"));
}

@end
