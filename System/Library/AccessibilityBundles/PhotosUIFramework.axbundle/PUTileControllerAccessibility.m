@implementation PUTileControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUTileController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axConformsToFullScreenTileControllerDelegate
{
  return 0;
}

@end
