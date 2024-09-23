@implementation UIView(AssociatedAssetUUID)

- (id)associatedAssetUUID
{
  return objc_getAssociatedObject(a1, sel_associatedAssetUUID);
}

- (void)setAssociatedAssetUUID:()AssociatedAssetUUID
{
  objc_setAssociatedObject(a1, sel_associatedAssetUUID, a3, (void *)1);
}

@end
