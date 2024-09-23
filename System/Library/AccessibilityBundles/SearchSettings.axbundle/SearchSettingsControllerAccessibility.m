@implementation SearchSettingsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchSettingsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("SearchSettingsController"));
}

@end
