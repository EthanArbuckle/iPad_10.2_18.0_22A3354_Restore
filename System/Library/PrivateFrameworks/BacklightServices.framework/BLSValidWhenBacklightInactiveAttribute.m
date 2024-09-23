@implementation BLSValidWhenBacklightInactiveAttribute

+ (id)ignoreWhenBacklightInactivates
{
  return objc_alloc_init(BLSIgnoreWhenBacklightInactivatesAttribute);
}

+ (id)cancelWhenBacklightInactivates
{
  return objc_alloc_init(BLSCancelWhenBacklightInactivatesAttribute);
}

@end
