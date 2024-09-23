@implementation TUISystemInputAssistantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUISystemInputAssistantView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUISystemInputAssistantView"), CFSTR("_didTapExpandButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUISystemInputAssistantView"), CFSTR("setShowsExpandableButtonBarItems:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUISystemInputAssistantView"), CFSTR("centerPageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUISystemInputAssistantPageView"), CFSTR("expandButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUISystemInputAssistantViewAccessibility;
  -[TUISystemInputAssistantViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[TUISystemInputAssistantViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("centerPageView.expandButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("expand.toolbar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axAddCurrentGroup:(id)a3 toElements:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v9[0] = CFSTR("GroupElements");
    v9[1] = CFSTR("GroupTraits");
    v10[0] = v5;
    v10[1] = &unk_2503B7648;
    v9[2] = CFSTR("GroupScanBehaviorTraits");
    v10[2] = &unk_2503B7660;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    objc_msgSend(v6, "addObject:", v7);

    goto LABEL_6;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 160;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (BOOL)_isPredictionOrCandidateView:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldReturnScannerGroups:", 0);
  objc_msgSend(v4, "leafNodePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78__TUISystemInputAssistantViewAccessibility__accessibilityScannerGroupElements__block_invoke;
  v25[3] = &unk_2503B4DC0;
  v25[4] = self;
  v19 = v5;
  v26 = v19;
  objc_msgSend(v4, "setLeafNodePredicate:", v25);
  v20 = v4;
  -[TUISystemInputAssistantViewAccessibility _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[TUISystemInputAssistantViewAccessibility _isPredictionOrCandidateView:](self, "_isPredictionOrCandidateView:", v13))
        {
          v14 = v13;

          -[TUISystemInputAssistantViewAccessibility _axAddCurrentGroup:toElements:](self, "_axAddCurrentGroup:toElements:", v10, v3);
          v10 = 0;
          v9 = v14;
        }
        else
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "addObject:", v13);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[TUISystemInputAssistantViewAccessibility _axAddCurrentGroup:toElements:](self, "_axAddCurrentGroup:toElements:", v10, v3);
  objc_msgSend(v20, "setLeafNodePredicate:", v19);
  objc_msgSend(v20, "setShouldReturnScannerGroups:", 1);
  objc_msgSend(v9, "_accessibilityLeafDescendantsWithOptions:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v3;
  }
  v17 = v16;

  return v17;
}

uint64_t __78__TUISystemInputAssistantViewAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isPredictionOrCandidateView:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v4;
}

- (void)setShowsExpandableButtonBarItems:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUISystemInputAssistantViewAccessibility;
  -[TUISystemInputAssistantViewAccessibility setShowsExpandableButtonBarItems:](&v4, sel_setShowsExpandableButtonBarItems_, a3);
  -[TUISystemInputAssistantViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_didTapExpandButton:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISystemInputAssistantViewAccessibility;
  -[TUISystemInputAssistantViewAccessibility _didTapExpandButton:](&v3, sel__didTapExpandButton_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__TUISystemInputAssistantViewAccessibility__didTapExpandButton___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFirstDescendant");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v1);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
