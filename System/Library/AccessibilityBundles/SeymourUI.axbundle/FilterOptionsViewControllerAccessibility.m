@implementation FilterOptionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.FilterOptionsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.FilterOptionsViewController"), CFSTR("updateTitleView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.FilterOptionsViewController"), CFSTR("subtitleLabel"), "@", 0);

}

- (void)updateTitleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIAccessibilityNotifications v10;
  void *v11;
  objc_super v12;
  char v13;

  -[FilterOptionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)FilterOptionsViewControllerAccessibility;
  -[FilterOptionsViewControllerAccessibility updateTitleView](&v12, sel_updateTitleView);
  -[FilterOptionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    abort();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = *MEMORY[0x24BDF71E8];
      objc_msgSend(v7, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v10, v11);

    }
  }

}

@end
