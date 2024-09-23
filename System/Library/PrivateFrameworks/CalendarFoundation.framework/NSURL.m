@implementation NSURL

id __55__NSURL_CalClassAdditions__isEqualToURLIgnoringScheme___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "hostWithoutWWW");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v5, "appendString:", v6);
    objc_msgSend(v2, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
      objc_msgSend(v5, "appendFormat:", CFSTR("?%@"), v7);
    objc_msgSend(v2, "fragment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
      objc_msgSend(v5, "appendFormat:", CFSTR("#%@"), v8);
    objc_msgSend(v5, "stringByRemovingPercentEscapes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
