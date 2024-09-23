@implementation NSString(TranslationAdditions)

- (BOOL)lt_validSubrange:()TranslationAdditions
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)objc_msgSend(a1, "length");
}

- (id)lt_wordRangesWithLocale:()TranslationAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDDFD68];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x24BDDFD18];
  v18[0] = *MEMORY[0x24BDDFD18];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTagSchemes:", v8);

  objc_msgSend(v9, "setString:", a1);
  v10 = objc_msgSend(a1, "length");
  objc_msgSend(v5, "lt_nlLanguageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "setLanguage:range:", v11, 0, v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__NSString_TranslationAdditions__lt_wordRangesWithLocale___block_invoke;
  v16[3] = &unk_250694D40;
  v17 = v12;
  v13 = v12;
  objc_msgSend(v9, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v10, 0, v7, 38, v16);
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (CFIndex)lt_codeUnitsRangeFromCodePointsRange:()TranslationAdditions
{
  CFIndex result;
  CFIndex Length;
  uint64_t v9;
  CFIndex v10;
  CFIndex v11;
  uint64_t v12;
  CFIndex v13;

  if (!(a3 | a4))
    return 0;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    Length = CFStringGetLength(theString);
    v9 = a3 + a4;
    if (Length >= 1)
    {
      v10 = Length;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        if ((CFStringGetCharacterAtIndex(theString, v13) & 0xFC00) != 0xDC00)
        {
          if (a3 == v12)
            v11 = v13;
          if (v9 == v12)
          {
            v12 = v9;
            goto LABEL_15;
          }
          ++v12;
        }
        if (v10 == ++v13)
          goto LABEL_15;
      }
    }
    v12 = 0;
    v11 = 0;
LABEL_15:
    if (v12 == v9)
      return v11;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)lt_codePointsRangeFromCodeUnitsRange:()TranslationAdditions
{
  uint64_t v4;
  CFIndex v5;
  CFIndex v8;
  CFIndex i;
  uint64_t v11;

  if (!(a3 | a4))
    return 0;
  v5 = a3;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 < -[__CFString length](a1, "length"))
  {
    v8 = v5 + a4;
    if (v5 + a4 <= (unint64_t)-[__CFString length](a1, "length"))
    {
      if (v5 < 1)
      {
        v5 = 0;
        v4 = 0;
      }
      else
      {
        v4 = 0;
        for (i = 0; i != v5; ++i)
        {
          if ((CFStringGetCharacterAtIndex(a1, i) & 0xFC00) != 0xD800)
            ++v4;
        }
      }
      if ((CFStringGetCharacterAtIndex(a1, v5) & 0xFC00) == 0xDC00)
        return 0x7FFFFFFFFFFFFFFFLL;
      if (v5 < v8)
      {
        v11 = 0;
        do
        {
          if ((CFStringGetCharacterAtIndex(a1, v5) & 0xFC00) != 0xD800)
            ++v11;
          ++v5;
        }
        while (v8 != v5);
        v5 = v8;
      }
      if (v8 != -[__CFString length](a1, "length") && (CFStringGetCharacterAtIndex(a1, v5) & 0xFC00) == 0xDC00)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v4;
}

- (uint64_t)lt_localeIdentifier
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
}

- (BOOL)lt_isWhiteSpaceOnlyString
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) == 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

@end
