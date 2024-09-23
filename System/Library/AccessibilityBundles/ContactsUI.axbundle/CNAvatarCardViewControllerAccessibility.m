@implementation CNAvatarCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAvatarCardViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAvatarCardViewControllerAccessibility;
  -[CNAvatarCardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[CNAvatarCardViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("context.menu.dismiss"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v7);

    objc_msgSend(v6, "_accessibilitySetSortPriority:", -1);
  }

}

uint64_t __85__CNAvatarCardViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490B8B0](CFSTR("UIVisualEffectView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardViewControllerAccessibility;
  -[CNAvatarCardViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNAvatarCardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
