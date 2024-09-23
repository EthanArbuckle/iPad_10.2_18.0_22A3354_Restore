@implementation NSString(MercuryBase64)

- (BOOL)vcp_isMercuryBase64
{
  return objc_msgSend(a1, "length") == 22
      && strspn((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+%") == 22;
}

- (id)vcp_mercuryBase64ToLocalIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (objc_msgSend(a1, "vcp_isMercuryBase64"))
  {
    v2 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:", v3, 0);
    while (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("%"), CFSTR("/"), 0, v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v3, 0);
      v2 = v6;
    }
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("=="));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v9), "bytes"));
      v11 = (void *)MEMORY[0x1E0CD1398];
      objc_msgSend(v10, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localIdentifierWithUUID:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
