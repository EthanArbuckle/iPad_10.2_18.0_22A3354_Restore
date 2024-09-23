@implementation NSString(CPLAdditions)

- (id)cplStringByAppendingPathExtension:()CPLAdditions fallbackExtension:
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length")
    || (objc_msgSend(a1, "stringByAppendingPathExtension:", v6), (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend(v7, "length")
      || (objc_msgSend(a1, "stringByAppendingPathExtension:", v7), (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = a1;
    }
  }

  return v8;
}

- (id)cpl_redactedShareURL
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cpl_redactedShareURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
