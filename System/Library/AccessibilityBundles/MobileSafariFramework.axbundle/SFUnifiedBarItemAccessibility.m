@implementation SFUnifiedBarItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedBarItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
