@implementation FMSettingsUpdateViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMSettingsUpdateViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMSettingsUpdateViewController"), CFSTR("accessibilityButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMSettingsUpdateViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMSettingsUpdateViewControllerAccessibility;
  -[FMSettingsUpdateViewControllerAccessibility viewDidLoad](&v6, sel_viewDidLoad);
  objc_opt_class();
  -[FMSettingsUpdateViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BEBB100] | v5);

}

@end
