@implementation NCNotificationListCountIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListCountIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBUILegibilityLabel"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("_titleLabel"), "NCNotificationListCountIndicatorButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("_subtitleString"), "NSString");
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("NCNotificationListCountIndicatorViewController"), CFSTR("NCNotificationListCountIndicatorViewDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("_titleLabelRepresentsNotificationCount"), "BOOL");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredListViewController"), CFSTR("listModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("rootListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCountIndicatorViewController"), CFSTR("notificationListCountIndicatorViewTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCountIndicatorViewController"), CFSTR("notificationListCountIndicatorViewLongPressed:presentingView:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("_titleString"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("_titleSymbol"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCountIndicatorView"), CFSTR("_contentHidden"), "BOOL");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;

  -[NCNotificationListCountIndicatorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[NCNotificationListCountIndicatorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_contentHidden")) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[NCNotificationListCountIndicatorViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_titleString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListCountIndicatorViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_subtitleString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListCountIndicatorViewAccessibility;
  v3 = -[NCNotificationListCountIndicatorViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[NCNotificationListCountIndicatorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    v3 |= *MEMORY[0x24BDF73B0];
    return v3;
  }
  -[NCNotificationListCountIndicatorViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_subtitleString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  void *v4;
  NCNotificationListCountIndicatorViewAccessibility *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NCNotificationListCountIndicatorViewAccessibility *v12;
  NCNotificationListCountIndicatorViewAccessibility *v13;
  NCNotificationListCountIndicatorViewAccessibility *v14;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  NCNotificationListCountIndicatorViewAccessibility *v21;
  NCNotificationListCountIndicatorViewAccessibility *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  NCNotificationListCountIndicatorViewAccessibility *v33;

  -[NCNotificationListCountIndicatorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListCountIndicatorViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v5 = (NCNotificationListCountIndicatorViewAccessibility *)objc_claimAutoreleasedReturnValue();
  v6 = -[NCNotificationListCountIndicatorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_titleLabelRepresentsNotificationCount"));
  objc_msgSend(v4, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NCNotificationListCountIndicatorViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_titleSymbol"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("circlebadge.fill")))
    {

LABEL_7:
      v9 = MEMORY[0x24BDAC760];
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke;
      v31 = &unk_2503BDD90;
      v32 = v4;
      v33 = self;
      AXPerformSafeBlock();
      v23 = v9;
      v24 = 3221225472;
      v25 = __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_2;
      v26 = &unk_2503BDCC8;
      v27 = v7;
      AXPerformBlockOnMainThreadAfterDelay();

      goto LABEL_8;
    }
  }
  -[NCNotificationListCountIndicatorViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_subtitleString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  if (v8)
    goto LABEL_7;
  if (!v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationListCountIndicatorViewAccessibility;
    v10 = -[NCNotificationListCountIndicatorViewAccessibility accessibilityActivate](&v15, sel_accessibilityActivate);
    goto LABEL_9;
  }
  if (v6)
    v12 = v5;
  else
    v12 = self;
  v13 = v12;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_3;
  v19 = &unk_2503BDDB8;
  v20 = v4;
  v21 = self;
  v22 = v13;
  v14 = v13;
  AXPerformSafeBlock();
  AXPerformBlockOnMainThreadAfterDelay();

LABEL_8:
  v10 = 1;
LABEL_9:

  return v10;
}

uint64_t __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationListCountIndicatorViewTapped:", *(_QWORD *)(a1 + 40));
}

void __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("listModel"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("masterListView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

uint64_t __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationListCountIndicatorViewLongPressed:presentingView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_4()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (id)automationElements
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_allSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
