@implementation NSString(AAAFoundation)

+ (id)URLQueryValueAllowedCharacterSet
{
  if (URLQueryValueAllowedCharacterSet__onceToken != -1)
    dispatch_once(&URLQueryValueAllowedCharacterSet__onceToken, &__block_literal_global_0);
  return (id)URLQueryValueAllowedCharacterSet__URLQueryValueAllowedCharacterSet;
}

- (id)aaf_urlEncoded
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "URLQueryValueAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)aaf_toBase64DecodedData
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(a1, "aaf_base64Padded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBase64EncodedString:options:", v3, 0);

  return v4;
}

- (id)aaf_toBase64DecodedString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "aaf_toBase64DecodedData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);

  return v2;
}

- (id)aaf_toBase64EncodedString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)aaf_base64Padded
{
  uint64_t v2;
  const __CFString *v3;
  id v4;

  v2 = objc_msgSend(a1, "length") & 3;
  if (v2 == 3)
  {
    v3 = CFSTR("=");
  }
  else
  {
    if (v2 != 2)
    {
      v4 = a1;
      return v4;
    }
    v3 = CFSTR("==");
  }
  objc_msgSend(a1, "stringByAppendingString:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)aaf_toSHA256Data
{
  const char *v1;
  CC_LONG v2;
  unsigned __int8 md[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)aaf_toSHA256String
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "aaf_toSHA256Data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aaf_toHexString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
