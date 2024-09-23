@implementation NSFileProviderDomain(BRAdditions)

- (uint64_t)br_isCiconiaDomain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("Ciconia-"));

  return v2;
}

@end
