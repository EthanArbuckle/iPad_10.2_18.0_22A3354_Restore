@implementation NSString(BCSNSStringExtras)

- (uint64_t)_bcs_trimmedString
{
  if (_bcs_trimmedString_once != -1)
    dispatch_once(&_bcs_trimmedString_once, &__block_literal_global_6);
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:", _bcs_trimmedString_whitespaceCharacterSet);
}

- (id)_bcs_unescapedString
{
  uint64_t v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;
  unsigned int v8;
  int v9;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("\\"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1;
  }
  else
  {
    v4 = v2;
    v5 = objc_msgSend(a1, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v5);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "substringToIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

    if (v4 < v5)
    {
      v7 = 0;
      do
      {
        v8 = objc_msgSend(a1, "characterAtIndex:", v4);
        v9 = v7 | (v8 != 92);
        if ((v9 & 1) != 0)
          objc_msgSend(v3, "appendFormat:", CFSTR("%C"), v8);
        v7 = v9 ^ 1;
        ++v4;
      }
      while (v5 != v4);
    }
  }
  return v3;
}

- (uint64_t)_bcs_urlEncodedQueryValue
{
  if (_bcs_urlEncodedQueryValue_once != -1)
    dispatch_once(&_bcs_urlEncodedQueryValue_once, &__block_literal_global_7);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", _bcs_urlEncodedQueryValue_queryValueAllowedCharacters);
}

- (uint64_t)_bcs_stringForcingLeftToRightDirection
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("⁦\u202A%@\u202C⁩"), a1);
}

- (__CFString)_bcs_stringWithEnclosingDoubleQuotesRemoved
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  __CFString *v5;

  v2 = objc_msgSend(a1, "length");
  v3 = v2 - 1;
  if (v2 > 1
    && (v4 = v2, objc_msgSend(a1, "characterAtIndex:", 0) == 34)
    && objc_msgSend(a1, "characterAtIndex:", v3) == 34)
  {
    if (v4 == 2)
    {
      v5 = &stru_24D788C60;
    }
    else
    {
      objc_msgSend(a1, "substringWithRange:", 1, v4 - 2);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (BOOL)_bcs_hasCaseInsensitivePrefix:()BCSNSStringExtras
{
  return a3 && objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_bcs_looksLikeEmailAddress
{
  unint64_t v2;
  _BOOL8 result;
  unint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend(a1, "length");
  if (v2 < 3)
    return 0;
  v4 = v2;
  v5 = objc_msgSend(a1, "rangeOfString:", CFSTR("@"));
  result = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 == v4 - 1)
      return 0;
    return objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("@"), 0, v5 + 1, v4 + ~v5) == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end
