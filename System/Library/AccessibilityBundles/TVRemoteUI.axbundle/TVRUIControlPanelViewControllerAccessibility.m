@implementation TVRUIControlPanelViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUIControlPanelViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIControlPanelViewController"), CFSTR("currentButtonPanel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIButtonPanelView"), CFSTR("leftButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIButtonPanelView"), CFSTR("primaryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIButtonPanelView"), CFSTR("rightButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIButtonPanelView"), CFSTR("pagingButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIControlPanelViewControllerAccessibility;
  -[TVRUIControlPanelViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[TVRUIControlPanelViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewControllerAccessibility _axElements](self, "_axElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElements:", v4);

}

- (id)_axElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TVRUIControlPanelViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentButtonPanel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("leftButtons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  objc_msgSend(v2, "safeValueForKey:", CFSTR("primaryButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  objc_msgSend(v2, "safeArrayForKey:", CFSTR("rightButtons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v6);

  objc_msgSend(v2, "safeValueForKey:", CFSTR("pagingButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  return v3;
}

@end
