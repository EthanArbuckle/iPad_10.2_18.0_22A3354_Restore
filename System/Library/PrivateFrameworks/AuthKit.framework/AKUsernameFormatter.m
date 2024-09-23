@implementation AKUsernameFormatter

+ (id)formattedUsernameFromUsername:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
    if (AAAFoundationSwiftLibraryCore())
      getAAFPhoneNumberFormatterClass();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "normalizedFormatFor:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "_isPhoneNumber:", v7))
    {
      objc_msgSend(CFSTR("+"), "stringByAppendingString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayFormatFor:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }
    if (v5)
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_isPhoneNumber:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "rangeOfString:options:", CFSTR("^[0-9]*$"), 1024);
  v5 = v4;
  v6 = objc_msgSend(v3, "length");

  return v5 == v6;
}

@end
