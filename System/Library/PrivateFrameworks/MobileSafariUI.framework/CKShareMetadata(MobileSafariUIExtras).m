@implementation CKShareMetadata(MobileSafariUIExtras)

- (id)safari_originatingWindowScene
{
  return objc_getAssociatedObject(a1, &originatingWindowSceneKey);
}

- (void)safari_setOriginatingWindowScene:()MobileSafariUIExtras
{
  objc_setAssociatedObject(a1, &originatingWindowSceneKey, a3, (void *)1);
}

@end
