@implementation TabOverviewNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.TabOverviewNavigationBarTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("MobileSafari.TabOverviewNavigationBarTitleView"), CFSTR("UITextFieldDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.TabOverviewNavigationBarTitleView"), CFSTR("textFieldDidEndEditing:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewNavigationBarTitleView"), CFSTR("titleButton"), "UIButton");

}

- (void)textFieldDidEndEditing:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TabOverviewNavigationBarTitleViewAccessibility;
  -[TabOverviewNavigationBarTitleViewAccessibility textFieldDidEndEditing:](&v6, sel_textFieldDidEndEditing_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[TabOverviewNavigationBarTitleViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

@end
