@implementation CPSPermissionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSPermissionsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CPSPermissionsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSPermissionsViewController"), CFSTR("_notificationItemView"), "CPSPermissionItemView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSPermissionsViewController"), CFSTR("_locationConfirmationItemView"), "CPSPermissionItemView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPSPermissionsViewControllerAccessibility;
  -[CPSPermissionsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[CPSPermissionsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_notificationItemView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationConfirmationItemView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewControllerAccessibility _axVisualEffectContentView](self, "_axVisualEffectContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "axSafelyAddObject:", v5);
  objc_msgSend(v8, "axSafelyAddObject:", v4);
  objc_msgSend(v3, "setAccessibilityElements:", v8);

}

- (id)_axVisualEffectContentView
{
  void *v2;
  void *v3;
  void *v4;

  -[CPSPermissionsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __71__CPSPermissionsViewControllerAccessibility__axVisualEffectContentView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPSPermissionsViewControllerAccessibility;
  -[CPSPermissionsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CPSPermissionsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
