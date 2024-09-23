@implementation PSRootControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSRootController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
