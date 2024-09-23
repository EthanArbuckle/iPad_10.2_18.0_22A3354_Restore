@implementation VUIRootControllerConfigAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIRootControllerConfig");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
