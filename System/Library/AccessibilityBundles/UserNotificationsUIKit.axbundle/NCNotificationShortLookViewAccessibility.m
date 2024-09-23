@implementation NCNotificationShortLookViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationShortLookView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axShortViewTitle
{
  JUMPOUT(0x2349234C4);
}

- (void)_axSetShortViewTitle:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PLPlatterView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PLPlatterHeaderContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCDimmableView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationRequestContentProvider"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationStructuredListViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationSeamlessContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationShortLookView"), CFSTR("setTitle:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("staticContentProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequestContentProvider"), CFSTR("notificationRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("defaultEnvironmentActions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationAction"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_canPan"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("delegate"), "@", 0);
  if (AXProcessIsSpringBoard())
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("_dismissPresentedBannerAnimated:reason:forceIfSticky:"), "v", "B", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationViewController"), CFSTR("_notificationRequest"), "NCNotificationRequest");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationShortLookView"), CFSTR("_notificationContentView"), "UIView<NCNotificationContentDisplaying>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_dateLabel"), "UILabel<BSUIDateLabel>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_utilityButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("options"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationOptions"), CFSTR("dismissAutomatically"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationShortLookViewController"), CFSTR("presentLongLookAnimated:trigger:completion:"), "v", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationShortLookView"), CFSTR("_auxiliaryOptionsView"), "NCAuxiliaryOptionsView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCAuxiliaryOptionsView"), CFSTR("auxiliaryOptionsVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("isGrouped"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("count"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("sectionIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationShortLookView"), CFSTR("contentSummaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListCell"));

}

- (unint64_t)_accessibilityAutomationType
{
  return 8;
}

- (BOOL)_accessibilityBannerIsSticky
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[NCNotificationShortLookViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349233D4](CFSTR("NCDimmableView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_notificationRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("dismissAutomatically")) ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[NCNotificationShortLookViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_auxiliaryOptionsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("auxiliaryOptionsVisible")) ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  if (-[NCNotificationShortLookViewAccessibility _axIsGrouped](self, "_axIsGrouped"))
  {
    accessibilityLocalizedString(CFSTR("notification.grouped"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[NCNotificationShortLookViewAccessibility _accessibilityListCellParent](self, "_accessibilityListCellParent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationListCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NCNotificationShortLookViewAccessibility _accessibilityListCellParent](self, "_accessibilityListCellParent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_axIsInCollapsedStack"))
    {
      accessibilityLocalizedString(CFSTR("notification.collapsed.stack"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  -[NCNotificationShortLookViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349233D4](CFSTR("PLPlatterHeaderContentView")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("_dateLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[NCNotificationShortLookViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_notificationContentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationContentView"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x2349233D4](CFSTR("NCNotificationSeamlessContentView")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v12, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  -[NCNotificationShortLookViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentSummaryText"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    accessibilityLocalizedString(CFSTR("notifications.text.summary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v16;
    AXCFormattedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  -[NCNotificationShortLookViewAccessibility _axShortViewTitle](self, "_axShortViewTitle", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)accessibilityIdentifier
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookViewAccessibility;
  -[NCNotificationShortLookViewAccessibility accessibilityIdentifier](&v6, sel_accessibilityIdentifier);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("NotificationShortLookView");
  v4 = v2;

  return v4;
}

- (BOOL)_axShowLongLook
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__NCNotificationShortLookViewAccessibility__axShowLongLook__block_invoke;
  v4[3] = &unk_2503BE1C0;
  v4[4] = &v5;
  -[NCNotificationShortLookViewAccessibility _axPerformBlockOnNotificationController:](self, "_axPerformBlockOnNotificationController:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __59__NCNotificationShortLookViewAccessibility__axShowLongLook__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __59__NCNotificationShortLookViewAccessibility__axShowLongLook__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "presentLongLookAnimated:trigger:completion:", 1, 6, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_axDismiss
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __54__NCNotificationShortLookViewAccessibility__axDismiss__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_axNCNotificationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_dismissPresentedBannerAnimated:reason:forceIfSticky:", 1, CFSTR("Accessibility"), 1);
    objc_msgSend(*(id *)(a1 + 32), "accessibilityElementDidLoseFocus");
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_notificationRequest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeStringForKey:", CFSTR("sectionIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
    v6 = CFSTR("reply.action");
  else
    v6 = CFSTR("more.action");
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v7, self, sel__axMore_);
  -[NCNotificationShortLookViewAccessibility _accessibilityListViewParent](self, "_accessibilityListViewParent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak(&location, self);
    v11 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("dismiss"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __70__NCNotificationShortLookViewAccessibility_accessibilityCustomActions__block_invoke;
    v18 = &unk_2503BDE88;
    objc_copyWeak(&v19, &location);
    v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, &v15);

    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("AXNotificationDismissAction"));
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v8, v13, v15, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __70__NCNotificationShortLookViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axDismiss");

  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v2;

  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axNotifyWillBeginUserInteraction:", 1);

}

- (void)accessibilityElementDidLoseFocus
{
  void *v3;
  id v4;

  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axNotifyWillBeginUserInteraction:", 1);

  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axNotifyDidEndUserInteraction");

}

- (BOOL)_accessibilityResetBannerTimer
{
  void *v3;
  void *v4;

  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axNotifyWillBeginUserInteraction:", 1);

  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axNotifyDidEndUserInteraction");

  return 1;
}

- (id)_accessibilityListViewParent
{
  void *v2;
  void *v3;

  -[NCNotificationShortLookViewAccessibility _accessibilityListCellParent](self, "_accessibilityListCellParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityListCellParent
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NCNotificationShortLookViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349233D4](CFSTR("NCNotificationListCell")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axNCNotificationViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[NCNotificationShortLookViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349233D4](CFSTR("NCDimmableView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  int v6;
  void *v8;
  int v9;
  objc_super v10;

  if (a3 == 4)
  {
    -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "safeBoolForKey:", CFSTR("_canPan"));

    if (v9)
      return -[NCNotificationShortLookViewAccessibility _axDismiss](self, "_axDismiss");
  }
  else if (a3 == 3)
  {
    -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("_canPan"));

    if (v6)
      return -[NCNotificationShortLookViewAccessibility _axShowLongLook](self, "_axShowLongLook");
  }
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationShortLookViewAccessibility;
  return -[NCNotificationShortLookViewAccessibility accessibilityScroll:](&v10, sel_accessibilityScroll_, a3);
}

- (BOOL)_axIsGrouped
{
  void *v2;
  BOOL v3;

  -[NCNotificationShortLookViewAccessibility _accessibilityListViewParent](self, "_accessibilityListViewParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("isGrouped")))
    v3 = (unint64_t)objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("count")) > 1;
  else
    v3 = 0;

  return v3;
}

- (void)_axPerformBlockOnNotificationController:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[NCNotificationShortLookViewAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5[2](v5, v4);

}

- (BOOL)_accessibilityIsBannerNotificationElement
{
  return 1;
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationShortLookViewAccessibility;
  v4 = a3;
  -[NCNotificationShortLookViewAccessibility setTitle:](&v5, sel_setTitle_, v4);
  -[NCNotificationShortLookViewAccessibility _axSetShortViewTitle:](self, "_axSetShortViewTitle:", v4, v5.receiver, v5.super_class);

}

@end
