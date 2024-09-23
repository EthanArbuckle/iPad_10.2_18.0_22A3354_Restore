@implementation NSHTTPCookie(SafariServicesExtras)

- (uint64_t)sf_matchesTopLevelDomain:()SafariServicesExtras
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "characterAtIndex:", 0) == 46)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(a1, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "hasSuffix:", v8);

    }
  }

  return v7;
}

@end
