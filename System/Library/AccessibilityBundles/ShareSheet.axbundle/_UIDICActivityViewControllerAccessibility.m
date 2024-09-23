@implementation _UIDICActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDICActivityViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityPresentedControllerModalizes
{
  return 1;
}

@end
