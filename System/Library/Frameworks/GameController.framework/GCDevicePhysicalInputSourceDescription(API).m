@implementation GCDevicePhysicalInputSourceDescription(API)

- (id)sfSymbolsName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "symbol");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sfSymbolsName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
