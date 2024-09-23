@implementation PLContactPhotoOverlayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLContactPhotoOverlay");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end
