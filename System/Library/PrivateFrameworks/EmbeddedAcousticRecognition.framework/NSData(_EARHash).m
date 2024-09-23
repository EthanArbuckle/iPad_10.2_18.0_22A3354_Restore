@implementation NSData(_EARHash)

- (id)_ear_sha256
{
  void *v1;
  void *v2;

  sha256Data(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  hexString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
