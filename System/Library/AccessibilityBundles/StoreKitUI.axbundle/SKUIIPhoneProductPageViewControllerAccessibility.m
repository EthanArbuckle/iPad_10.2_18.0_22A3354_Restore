@implementation SKUIIPhoneProductPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIIPhoneProductPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
