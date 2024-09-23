@implementation CCUIWiFiMenuModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIWiFiMenuModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIWiFiMenuModuleViewController"), CFSTR("_networks"), "NSArray");
}

- (BOOL)_accessibilityControlCenterMenuItemAtIndexIsValid:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_opt_class();
  -[CCUIWiFiMenuModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_networks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v6, "count") > (unint64_t)a3;
  return a3;
}

@end
