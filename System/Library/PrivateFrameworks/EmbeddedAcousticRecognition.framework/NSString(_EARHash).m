@implementation NSString(_EARHash)

- (id)_ear_sha256
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sha256Data(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hexString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
