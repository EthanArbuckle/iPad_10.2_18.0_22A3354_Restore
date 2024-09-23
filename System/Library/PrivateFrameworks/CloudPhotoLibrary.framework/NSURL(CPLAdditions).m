@implementation NSURL(CPLAdditions)

- (id)cpl_redactedShareURL
{
  void *v2;
  id v3;
  id v4;
  const char *v5;
  CC_LONG v6;
  void *v7;
  uint64_t i;
  void *v9;
  CC_SHA256_CTX c;
  unsigned __int8 md[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("redacted.icloud.com")))
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "absoluteString");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v6 = strlen(v5);
    CC_SHA256_Update(&c, v5, v6);
    CC_SHA256_Final(md, &c);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 32; ++i)
      objc_msgSend(v7, "appendFormat:", CFSTR("%02x"), md[i]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://redacted.icloud.com/photos"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
