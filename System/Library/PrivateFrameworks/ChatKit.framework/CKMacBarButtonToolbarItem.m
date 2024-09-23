@implementation CKMacBarButtonToolbarItem

- (CKMacBarButtonToolbarItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMacBarButtonToolbarItem;
  return -[CKMacToolbarItem init](&v3, sel_init);
}

@end
