@implementation NCToggleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCToggleControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:", CFSTR("SBFTouchPassThroughView"));
    objc_msgSend(v3, "validateClass:", CFSTR("CSCoverSheetViewBase"));
  }
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListCoalescingControlsView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCToggleControl"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCToggleControl"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCToggleControl"), CFSTR("_previewInteractionPlatterPresenter"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCToggleControl"), CFSTR("clickInteractionPresenterDidPresent:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCToggleControl"), CFSTR("clickInteractionPresenterDidDismiss:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCClickInteractionPresenter"), CFSTR("_presentedControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCClickInteractionPresenter"), CFSTR("_containerView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCClickInteractionPresentedControl"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCoalescingHeaderCell"), CFSTR("handlerDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCoalescingControlsCell"), CFSTR("handlerDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationGroupList"), CFSTR("leadingNotificationRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("content"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContent"), CFSTR("header"), "@", 0);

}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  v4.receiver = self;
  v4.super_class = (Class)NCToggleControlAccessibility;
  return -[NCToggleControlAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  -[NCToggleControlAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v9.receiver = self;
    v9.super_class = (Class)NCToggleControlAccessibility;
    -[NCToggleControlAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  if ((-[NCToggleControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) & 1) == 0)
  {
    v7 = v3;
    goto LABEL_6;
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("confirm.action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  -[NCToggleControlAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("handlerDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("leadingNotificationRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("header"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[NCToggleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewInteractionPlatterPresenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_presentedControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v5, self, sel__axPerformPreviewInteractionAction);
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_axPerformPreviewInteractionAction
{
  void *v3;
  void *v4;
  void *v5;

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_opt_class();
  -[NCToggleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewInteractionPlatterPresenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_presentedControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendActionsForControlEvents:", 64);
  return 1;
}

- (void)_axSetPreviewInteractionAncestorsModal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[NCToggleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewInteractionPlatterPresenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_containerView"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityViewIsModal:", v3);
  -[NCToggleControlAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349233D4](CFSTR("SBFPagedScrollView")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityViewIsModal:", v3);

  -[NCToggleControlAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityViewIsModal:", v3);

}

uint64_t __71__NCToggleControlAccessibility__axSetPreviewInteractionAncestorsModal___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  MEMORY[0x2349233D4](CFSTR("SBFTouchPassThroughView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    MEMORY[0x2349233D4](CFSTR("CSCoverSheetViewBase"));
    v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3 & 1;
}

- (void)clickInteractionPresenterDidPresent:(id)a3
{
  NCToggleControlAccessibility *v3;
  id v4;
  void *v5;
  objc_super v6;

  v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)NCToggleControlAccessibility;
  v4 = a3;
  -[NCToggleControlAccessibility clickInteractionPresenterDidPresent:](&v6, sel_clickInteractionPresenterDidPresent_, v4);
  -[NCToggleControlAccessibility _axSetPreviewInteractionAncestorsModal:](v3, "_axSetPreviewInteractionAncestorsModal:", 1, v6.receiver, v6.super_class);
  LODWORD(v3) = *MEMORY[0x24BDF72C8];
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_presentedControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v5);
}

- (void)clickInteractionPresenterDidDismiss:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCToggleControlAccessibility;
  -[NCToggleControlAccessibility clickInteractionPresenterDidDismiss:](&v4, sel_clickInteractionPresenterDidDismiss_, a3);
  -[NCToggleControlAccessibility _axSetPreviewInteractionAncestorsModal:](self, "_axSetPreviewInteractionAncestorsModal:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

@end
