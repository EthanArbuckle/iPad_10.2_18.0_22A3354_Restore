@implementation QLPreviewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLPreviewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("QLPreviewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewController"), CFSTR("internalNavigationController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewController"), CFSTR("updateOverlayAnimated: animatedButtons: forceRefresh: withTraitCollection:"), "v", "B", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewController"), CFSTR("_listButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewController"), CFSTR("additionalRightBarButtonItems"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLPreviewControllerAccessibility;
  -[QLPreviewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilityKeyboardDidAppear_, *MEMORY[0x24BDF7A00], 0);

}

- (void)_accessibilityKeyboardDidAppear:(id)a3
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)updateOverlayAnimated:(BOOL)a3 animatedButtons:(BOOL)a4 forceRefresh:(BOOL)a5 withTraitCollection:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)QLPreviewControllerAccessibility;
  -[QLPreviewControllerAccessibility updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:](&v18, sel_updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection_, v8, v7, v6, v10);
  objc_opt_class();
  -[QLPreviewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("internalNavigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "safeValueForKey:", CFSTR("navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("leftBarButtonItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v15);

  objc_msgSend(v12, "safeValueForKey:", CFSTR("navigationItem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeValueForKey:", CFSTR("leftBarButtonItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityTraits:", *MEMORY[0x24BEBB100] | *MEMORY[0x24BDF73B0]);

}

- (id)_listButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewControllerAccessibility;
  -[QLPreviewControllerAccessibility _listButton](&v5, sel__listButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("list.button.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
