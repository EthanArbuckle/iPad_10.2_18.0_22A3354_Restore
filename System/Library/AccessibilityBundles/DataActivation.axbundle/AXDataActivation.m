@implementation AXDataActivation

+ (void)accessibilityInitializeBundle
{
  uint64_t v2;
  void *v3;

  if (!_Failover)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)AXDataActivation), "init");
    v3 = (void *)_Failover;
    _Failover = v2;

  }
}

@end
