@implementation TabOverviewItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.TabOverviewItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MobileSafari.TabOverviewItemView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewItemView"), CFSTR("thumbnailView"), "TabThumbnailView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewItemView"), CFSTR("configuration"), "Configuration");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewItemView[class].Configuration"), CFSTR("canBeClosed"), "Bool");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewItemView[class].Configuration"), CFSTR("isPinned"), "Bool");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewItemView[class].Configuration"), CFSTR("isSelected"), "Bool");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewItemView[class].Configuration"), CFSTR("showsMultipleSelectionIndicator"), "Bool");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.TabThumbnailView"), CFSTR("trailingCornerButtonReceivedTap"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabThumbnailView"), CFSTR("trailingCornerButton"), "CornerButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.TabOverview"), CFSTR("indexInAllItemsForItemView:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.TabOverview"), CFSTR("totalItemCount"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TabOverviewItemViewAccessibility;
  -[TabOverviewItemViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("thumbnailView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("trailingCornerButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilitySafariServicesLocalizedString(CFSTR("close.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeSwiftBoolForKey:", CFSTR("canBeClosed"));
  v6 = MEMORY[0x24BDAC760];
  if ((v5 & 1) == 0)
    goto LABEL_4;
  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "safeSwiftBoolForKey:", CFSTR("showsMultipleSelectionIndicator")))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "safeSwiftBoolForKey:", CFSTR("isPinned"));

  if ((v13 & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilitySafariServicesLocalizedString(CFSTR("close.button"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke;
    v19[3] = &unk_250296978;
    objc_copyWeak(&v20, &location);
    v16 = (void *)objc_msgSend(v14, "initWithName:actionHandler:", v15, v19);

    objc_msgSend(v16, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_CLOSE"));
    objc_msgSend(v3, "addObject:", v16);

    objc_destroyWeak(&v20);
  }
LABEL_5:
  v8 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityMobileSafariLocalizedString(CFSTR("show.context.menu"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke_2;
  v17[3] = &unk_250296978;
  objc_copyWeak(&v18, &location);
  v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, v17);

  objc_msgSend(v3, "addObject:", v10);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("thumbnailView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingCornerButtonReceivedTap");

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

uint64_t __62__TabOverviewItemViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "safeSwiftValueForKey:", CFSTR("thumbnailView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityShowContextMenuForElement:targetPointValue:", v2, 0);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if ((AXRequestingClient() & 0xFFFFFFFFFFFFFFFDLL) == 5)
  {
    v3 = (void *)MEMORY[0x24BDBCE30];
    -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("thumbnailView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("trailingCornerButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TabOverviewItemViewAccessibility;
    -[TabOverviewItemViewAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("thumbnailView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("trailingCornerButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_NSRange)_accessibilityRowRange
{
  id v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _NSRange result;

  -[TabOverviewItemViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491571C](CFSTR("MobileSafari.TabOverview"), a2));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v3 = v12[3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    v4 = v8[3];
  }

  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  v5 = v3;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

uint64_t __58__TabOverviewItemViewAccessibility__accessibilityRowRange__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "indexInAllItemsForItemView:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "totalItemCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BEBB188];
  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeSwiftBoolForKey:", CFSTR("isSelected"));

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("configuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeSwiftBoolForKey:", CFSTR("showsMultipleSelectionIndicator"))
    && (objc_msgSend(v2, "safeSwiftBoolForKey:", CFSTR("isSelected")) & 1) == 0)
  {
    accessibilityMobileSafariLocalizedString(CFSTR("tab.overview.selection.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityScrollToVisible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabOverviewItemViewAccessibility;
  return -[TabOverviewItemViewAccessibility _accessibilityScrollToVisible](&v3, sel__accessibilityScrollToVisible);
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v8;
  objc_super v9;
  objc_super v10;

  -[TabOverviewItemViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeSwiftBoolForKey:", CFSTR("isPinned"));

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)TabOverviewItemViewAccessibility;
    -[TabOverviewItemViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityMobileSafariLocalizedString(CFSTR("tab.pinned"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TabOverviewItemViewAccessibility;
    -[TabOverviewItemViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
