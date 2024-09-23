@implementation NSString(AXUtilsExtensions)

- (BOOL)axContainsString:()AXUtilsExtensions options:
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;

  v6 = a3;
  if (v6)
  {
    v7 = a4 & 1;
    v8 = a1;
    v9 = v6;
    if ((a4 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", &stru_1E28C88D8);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", &stru_1E28C88D8);
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
      v9 = (id)v14;
    }
    v15 = objc_msgSend(v8, "rangeOfString:options:", v9, v7) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (uint64_t)axContainsString:()AXUtilsExtensions
{
  return objc_msgSend(a1, "axContainsString:options:", a3, 0);
}

- (uint64_t)axIsLanguageCode
{
  if ((objc_msgSend(a1, "axIsGenericLanguageCode") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "axIsRegionalLanguageCode");
}

- (BOOL)axIsGenericLanguageCode
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) == 0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(a1, "length") == 2 || objc_msgSend(a1, "length") == 3;
  else
    v4 = 0;

  return v4;
}

- (uint64_t)axIsRegionalLanguageCode
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 2)
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "axIsGenericLanguageCode"))
      v4 = objc_msgSend(v3, "axIsGenericLanguageCode");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)axLanguageCode
{
  id v2;
  void *v3;

  if (objc_msgSend(a1, "axIsGenericLanguageCode"))
  {
    v2 = a1;
  }
  else if (objc_msgSend(a1, "axIsRegionalLanguageCode"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)axRegionCode
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "axIsRegionalLanguageCode"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)axCapitalizeFirstLetter
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "substringToIndex:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "substringFromIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a1;
  }
  return v5;
}

@end
