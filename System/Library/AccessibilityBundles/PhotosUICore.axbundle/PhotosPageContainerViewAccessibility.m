@implementation PhotosPageContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PhotosUICore.PhotosPageContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityViewIsVisible
{
  return 0;
}

@end
