@implementation DynamicTypeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.DynamicTypeLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
