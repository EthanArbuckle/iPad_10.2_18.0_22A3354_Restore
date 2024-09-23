@implementation DynamicTypeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.DynamicTypeTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
