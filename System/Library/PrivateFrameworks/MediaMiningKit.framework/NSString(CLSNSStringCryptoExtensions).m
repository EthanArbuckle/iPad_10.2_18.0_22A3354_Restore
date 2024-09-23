@implementation NSString(CLSNSStringCryptoExtensions)

- (id)cls_sha1HashData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cls_sha1Hash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cls_sha1HashString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "cls_sha1HashData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cls_hexString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
