@implementation PUPhotoEditToolControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoEditToolControllerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsTouchContainer
{
  return 1;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

@end
