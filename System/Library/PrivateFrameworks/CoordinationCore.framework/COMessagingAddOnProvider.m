@implementation COMessagingAddOnProvider

- (id)serviceAddOn
{
  return objc_alloc_init(COMessagingAddOn);
}

@end
