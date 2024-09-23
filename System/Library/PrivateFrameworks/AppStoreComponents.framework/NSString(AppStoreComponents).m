@implementation NSString(AppStoreComponents)

- (id)asc_sha246HashData
{
  void *v1;
  void *v2;
  id v3;
  const void *v4;
  CC_LONG v5;
  id v6;

  objc_msgSend(a1, "dataUsingEncoding:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(v1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v2);
  CC_SHA256(v4, v5, (unsigned __int8 *)objc_msgSend(v6, "mutableBytes"));

  return v6;
}

- (id)asc_sha246Hash
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "asc_sha246HashData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)collapsingNewlines
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("([\\v]+)"), CFSTR("\n"), 1024, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

@end
