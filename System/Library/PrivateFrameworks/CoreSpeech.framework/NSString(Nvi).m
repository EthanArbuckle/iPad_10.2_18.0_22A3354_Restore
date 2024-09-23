@implementation NSString(Nvi)

- (id)shortFormForUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
