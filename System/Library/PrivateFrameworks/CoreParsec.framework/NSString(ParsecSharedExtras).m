@implementation NSString(ParsecSharedExtras)

- (uint64_t)parsec_hasPrefix:()ParsecSharedExtras
{
  if (a3)
    return objc_msgSend(a1, "hasPrefix:");
  else
    return 0;
}

- (BOOL)parsec_isCaseInsensitiveEqualToString:()ParsecSharedExtras
{
  return a3 && objc_msgSend(a1, "compare:options:", a3, 3) == 0;
}

- (BOOL)parsec_hasCaseInsensitivePrefix:()ParsecSharedExtras
{
  return a3 && objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parsec_hasCaseInsensitiveSuffix:()ParsecSharedExtras
{
  return a3 && objc_msgSend(a1, "rangeOfString:options:", a3, 13) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parsec_hasLocalizedCaseInsensitivePrefix:()ParsecSharedExtras
{
  id v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "length"), v6 <= objc_msgSend(a1, "length")))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "compare:options:range:locale:", v5, 1, 0, v6, v8) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)parsec_base64DecodedData
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", a1, 0);
}

- (BOOL)parsec_caseInsensitiveContainsString:()ParsecSharedExtras
{
  return a3 && objc_msgSend(a1, "rangeOfString:options:", a3, 1) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)parsec_readableURLStringAfterRemovingSubdomains
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  __CFString *v15;
  void *v16;
  char v17;
  uint64_t v18;

  v2 = (void *)objc_msgSend(a1, "copy");
  v3 = objc_msgSend(MEMORY[0x1E0C99E98], "parsec_hostAndPortRangeFromURLString:", v2);
  v5 = v4;
  v6 = objc_msgSend(v2, "parsec_hasPrefix:", CFSTR("http://"));
  v7 = objc_msgSend(v2, "parsec_hasPrefix:", CFSTR("https://"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && (v6 | v7) != 0)
  {
    v9 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(":"), 4, v3, v5);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      v11 = v3 + v5 - v9;
      if (objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("]"), 0, v9, v11) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v10, v11, &stru_1E39232C8);
        v12 = objc_claimAutoreleasedReturnValue();

        v5 -= v11;
        v2 = (void *)v12;
      }
    }
  }
  if ((v6 & 1) != 0)
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      return v2;
  }
  else
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = 0;
    else
      v13 = v7;
    if ((v13 & 1) == 0)
      return v2;
  }
  objc_msgSend(v2, "substringWithRange:", v3, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("www.");
  if ((objc_msgSend(v14, "parsec_hasPrefix:", CFSTR("www.")) & 1) != 0
    || (v15 = CFSTR("m."), objc_msgSend(v14, "parsec_hasPrefix:", CFSTR("m."))))
  {
    objc_msgSend(v14, "parsec_getHighLevelDomainFromHost");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqualToString:", v16);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v3, -[__CFString length](v15, "length"), &stru_1E39232C8);
      v18 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v18;
    }
  }

  return v2;
}

+ (uint64_t)parsec_stringByBase64EncodingData:()ParsecSharedExtras
{
  return objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
}

@end
