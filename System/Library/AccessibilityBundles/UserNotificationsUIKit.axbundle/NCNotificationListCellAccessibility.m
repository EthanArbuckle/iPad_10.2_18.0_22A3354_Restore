@implementation NCNotificationListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationShortLookView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationRichShortLookView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationShortLookViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListView"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCAuxiliaryOptionsSupporting"), CFSTR("auxiliaryOptionButtons"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("NCAuxiliaryOptionsView"), CFSTR("NCAuxiliaryOptionsSupporting"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCell"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCell"), CFSTR("actionProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationShortLookViewController"), CFSTR("clickPresentationInteractionManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationGroupList"), CFSTR("sectionIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_dateLabel"), "UILabel<BSUIDateLabel>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_lookView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationShortLookView"), CFSTR("_auxiliaryOptionsView"), "NCAuxiliaryOptionsView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCAuxiliaryOptionsView"), CFSTR("_optionsSummaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationCombinedSectionList"), CFSTR("NCNotificationStructuredSectionList"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("NCNotificationStaticContentAccepting"), CFSTR("title"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("NCNotificationStaticContentAccepting"), CFSTR("contentSummaryText"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationStaticContentAccepting"), CFSTR("date"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationStaticContentAccepting"), CFSTR("primaryText"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationStaticContentAccepting"), CFSTR("primarySubtitleText"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationStaticContentAccepting"), CFSTR("secondaryText"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLClickPresentationInteractionManager"), CFSTR("clickPresentationInteractionShouldBegin:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("BSUIDefaultDateLabel"));
  objc_msgSend(v3, "validateClass:", CFSTR("BSUIRelativeDateLabel"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationListCellActionProviding"), CFSTR("supplementaryActionsForNotificationListCell:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationListCellActionProviding"), CFSTR("defaultActionForNotificationListCell:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAction"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCell"), CFSTR("_swipeInteraction"), "PLSwipeInteraction");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSwipeInteraction"), CFSTR("_actionButtonsPresentingView"), "PLActionButtonsPresentingView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLActionButtonsPresentingView"), CFSTR("actionButtonsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterActionButtonsView"), CFSTR("buttonsStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("notificationRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCell"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("isGrouped"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("count"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationGroupList"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("isNotificationGroupListInCollapsedStack:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("NCNotificationListView"), CFSTR("NCNotificationListViewProtocol"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationListViewProtocol"), CFSTR("visibleViewAtIndex:"));

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  if (-[NCNotificationListCellAccessibility _axIsCollapsedGroup](self, "_axIsCollapsedGroup")
    || -[NCNotificationListCellAccessibility _axIsInCollapsedStack](self, "_axIsInCollapsedStack"))
  {
    AXPerformBlockOnMainThreadAfterDelay();
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationListCellAccessibility;
    return -[NCNotificationListCellAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
  else
  {
    -[NCNotificationListCellAccessibility _accessibilityOpenAction](self, "_accessibilityOpenAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      AXPerformSafeBlock();

    }
    return 1;
  }
}

void __60__NCNotificationListCellAccessibility_accessibilityActivate__block_invoke()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("notification.expanded"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

uint64_t __60__NCNotificationListCellAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NCNotificationListCellAccessibility _accessibilityCellActions](self, "_accessibilityCellActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_314), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = v6;
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListCellAccessibility axCustomActionsForActions:](self, "axCustomActionsForActions:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v18[3] = &__block_descriptor_40_e25_B32__0__UIAction_8Q16_B24l;
  v18[4] = v8;
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListCellAccessibility axCustomActionsForActions:](self, "axCustomActionsForActions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v13);

  -[NCNotificationListCellAccessibility _axLookView](self, "_axLookView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityCustomActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "ax_filteredArrayUsingBlock:", &__block_literal_global_318);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v16);
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  return v3;
}

uint64_t __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "safeValueForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationListCellActionIdentifierClear")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("NCNotificationGroupListActionIdentifierClear"));

  }
  return v4;
}

BOOL __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a1 + 32) != a3;
}

uint64_t __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXNotificationDismissAction")) ^ 1;

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[NCNotificationListCellAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("notificationRequest"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb")) ^ 1;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v4;
  BOOL v5;

  if (-[NCNotificationListCellAccessibility _axIsInCollapsedStack](self, "_axIsInCollapsedStack"))
    return -[NCNotificationListCellAccessibility _axIsLeadingView](self, "_axIsLeadingView");
  -[NCNotificationListCellAccessibility _axLookView](self, "_axLookView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)accessibilityElementsHidden
{
  _BOOL4 v3;

  v3 = -[NCNotificationListCellAccessibility _axIsInCollapsedStack](self, "_axIsInCollapsedStack");
  if (v3)
    LOBYTE(v3) = !-[NCNotificationListCellAccessibility _axIsLeadingView](self, "_axIsLeadingView");
  return v3;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;

  if (-[NCNotificationListCellAccessibility _axIsInCollapsedStack](self, "_axIsInCollapsedStack"))
  {
    accessibilityLocalizedString(CFSTR("notification.cell.collapsed.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationListCellAccessibility _axLookView](self, "_axLookView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityHint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_axLookView
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[NCNotificationListCellAccessibility _axNCNotificationViewController](self, "_axNCNotificationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    v12 = 0;
    v6 = v2;
    AXPerformSafeBlock();
    v3 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }
  else
  {
    AXLogUI();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[NCNotificationListCellAccessibility _axLookView].cold.1((uint64_t)v2, v4);

    v3 = 0;
  }

  return v3;
}

void __50__NCNotificationListCellAccessibility__axLookView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lookView");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axNCNotificationViewController
{
  return (id)-[NCNotificationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentViewController"));
}

- (BOOL)_axIsCollapsedGroup
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isGrouped")))
    v4 = (unint64_t)objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("count")) > 1;
  else
    v4 = 0;

  return v4;
}

- (id)_accessibilityListViewParent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349233D4](CFSTR("NCNotificationListView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v21;
  void *v22;

  -[NCNotificationListCellAccessibility _axLookView](self, "_axLookView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationRichShortLookView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeStringForKey:", CFSTR("primaryText"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeStringForKey:", CFSTR("primarySubtitleText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeStringForKey:", CFSTR("secondaryText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349233D4](CFSTR("BSUIRelativeDateLabel")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      -[NCNotificationListCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349233D4](CFSTR("BSUIDefaultDateLabel")));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;
      if (v21)
      {
        objc_msgSend(v21, "accessibilityLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      goto LABEL_8;
    }
    objc_msgSend(v8, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  MEMORY[0x2349233D4](CFSTR("NCNotificationShortLookView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    AXDateStringForFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("primaryText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("primarySubtitleText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("secondaryText"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[NCNotificationListCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("contentSummaryText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v3, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListCellAccessibility;
  -[NCNotificationListCellAccessibility accessibilityIdentifier](&v6, sel_accessibilityIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("NotificationCell");

  return v4;
}

- (id)_accessibilityOpenAction
{
  id v2;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  -[NCNotificationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionProvider"));
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void __63__NCNotificationListCellAccessibility__accessibilityOpenAction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultActionForNotificationListCell:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityCellActions
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  char v13;

  -[NCNotificationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionProvider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_opt_class();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v3 = v2;
  AXPerformSafeBlock();
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    abort();

  return v5;
}

void __64__NCNotificationListCellAccessibility__accessibilityCellActions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "supplementaryActionsForNotificationListCell:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityCellButtons
{
  void *v2;
  void *v3;

  -[NCNotificationListCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_swipeInteraction._actionButtonsPresentingView.actionButtonsView.buttonsStackView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)automationElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NCNotificationListCellAccessibility _accessibilityCellButtons](self, "_accessibilityCellButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[NCNotificationListCellAccessibility _axLookView](self, "_axLookView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_auxiliaryOptionsView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  -[NCNotificationListCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  return v3;
}

- (id)axCustomActionsForActions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(v10, "image");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accessibilityLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v11, "length"))
        {
          v13 = objc_alloc(MEMORY[0x24BDF6788]);
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __65__NCNotificationListCellAccessibility_axCustomActionsForActions___block_invoke;
          v16[3] = &unk_2503BE058;
          v16[4] = v10;
          v14 = (void *)objc_msgSend(v13, "initWithName:actionHandler:", v11, v16);
          objc_msgSend(v4, "axSafelyAddObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t __65__NCNotificationListCellAccessibility_axCustomActionsForActions___block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

void __65__NCNotificationListCellAccessibility_axCustomActionsForActions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NCNotificationListCellAccessibility _axLookView](self, "_axLookView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_auxiliaryOptionsView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("_optionsSummaryLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("auxiliaryOptionButtons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setAccessibilityContainer:", self, (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v8;
}

- (BOOL)_axIsInCollapsedStack
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[NCNotificationListCellAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349233D4](CFSTR("NCNotificationGroupList"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v8 = v5;
    v9 = v3;
    AXPerformSafeBlock();
    v6 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __60__NCNotificationListCellAccessibility__axIsInCollapsedStack__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isNotificationGroupListInCollapsedStack:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_axIsLeadingView
{
  void *v2;
  void *v3;
  id v4;
  char v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[NCNotificationListCellAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = v3;
  AXPerformSafeBlock();
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  v5 = objc_msgSend(v4, "isEqual:", v2, v7, 3221225472, __55__NCNotificationListCellAccessibility__axIsLeadingView__block_invoke, &unk_2503BE008);

  return v5;
}

void __55__NCNotificationListCellAccessibility__axIsLeadingView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleViewAtIndex:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_axLookView
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_232B20000, a2, OS_LOG_TYPE_DEBUG, "Found unrecognized selector for VC: %@", (uint8_t *)&v2, 0xCu);
}

@end
