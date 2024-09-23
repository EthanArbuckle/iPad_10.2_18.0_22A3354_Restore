@implementation HMProxyObjectAssoc

- (HMProxyObjectAssoc)self
{
  return (HMProxyObjectAssoc *)objc_getAssociatedObject(self, &HMProxyObjectAssocTargetKey);
}

@end
