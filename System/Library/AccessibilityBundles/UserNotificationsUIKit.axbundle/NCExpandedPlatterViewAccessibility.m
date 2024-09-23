@implementation NCExpandedPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCExpandedPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBFTouchPassThroughView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCExpandedPlatterView"), CFSTR("_notificationContentView"), "NCNotificationSeamlessContentView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCExpandedPlatterView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCExpandedPlatterViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("NCExpandedPlatterViewControllerDelegate"), CFSTR("expandedPlatterViewController:requestsDismissalWithReason:userInfo:"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NCExpandedPlatterViewAccessibility;
  -[NCExpandedPlatterViewAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  -[NCExpandedPlatterViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);
  -[NCExpandedPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_notificationContentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)NCExpandedPlatterViewAccessibility;
    -[NCExpandedPlatterViewAccessibility accessibilityCustomActions](&v16, sel_accessibilityCustomActions);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v6);

    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("dismiss"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v13 = &unk_2503BDE88;
    objc_copyWeak(&v14, &location);
    v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, &v10);

    objc_msgSend(v5, "axSafelyAddObject:", v9, v10, v11, v12, v13);
    objc_msgSend(v4, "setAccessibilityCustomActions:", v5);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

uint64_t __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349233D4](CFSTR("SBFTouchPassThroughView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "expandedPlatterViewController:requestsDismissalWithReason:userInfo:", v7, CFSTR("dismissalReasonHomeAction"), 0);

}

@end
