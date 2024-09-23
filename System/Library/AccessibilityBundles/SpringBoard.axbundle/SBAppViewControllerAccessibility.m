@implementation SBAppViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
