@implementation SFTabGroupCapsuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFTabGroupCapsuleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFTabGroupCapsuleView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFTabGroupCapsuleView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFCapsuleCollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleCollectionView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WBTabGroup"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBTabGroup"), CFSTR("uuid"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBTabGroup"), CFSTR("displayTitle"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFTabGroupCapsuleViewAccessibility;
  -[SFTabGroupCapsuleViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SFTabGroupCapsuleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  -[SFTabGroupCapsuleViewAccessibility _accessibilityAllTabGroups](self, "_accessibilityAllTabGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabGroupCapsuleViewAccessibility _accessibilityLabelFrom:](self, "_accessibilityLabelFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityLabelFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[SFTabGroupCapsuleViewAccessibility _accessibilityScrollStatusFrom:](self, "_accessibilityScrollStatusFrom:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabGroupCapsuleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityMobileSafariLocalizedString(CFSTR("tab.group"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFTabGroupCapsuleViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SFTabGroupCapsuleViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityCapsuleCollectionView
{
  SFTabGroupCapsuleViewAccessibility *v2;
  SFTabGroupCapsuleViewAccessibility *v3;
  SFTabGroupCapsuleViewAccessibility *v4;
  SFTabGroupCapsuleViewAccessibility *v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    do
    {
      MEMORY[0x23491571C](CFSTR("SFCapsuleCollectionView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v3;
      else
        v4 = 0;
      -[SFTabGroupCapsuleViewAccessibility superview](v3, "superview");
      v5 = (SFTabGroupCapsuleViewAccessibility *)objc_claimAutoreleasedReturnValue();

      if (v4)
        break;
      v3 = v5;
    }
    while (v5);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }

  return v4;
}

- (id)_accessibilityTabGroupSwitcherViewControllerFrom:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491571C](CFSTR("TabGroupSwitcherViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (int64_t)_accessibilityIndexOfSelfIn:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[SFTabGroupCapsuleViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safeStringForKey:", CFSTR("displayTitle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v5);

      if ((v9 & 1) != 0)
        break;
      if (++v6 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v6 = -1;
  }

  return v6;
}

- (id)_accessibilityAllTabGroups
{
  void *v3;
  void *v4;
  void *v5;

  -[SFTabGroupCapsuleViewAccessibility _accessibilityCapsuleCollectionView](self, "_accessibilityCapsuleCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabGroupCapsuleViewAccessibility _accessibilityTabGroupSwitcherViewControllerFrom:](self, "_accessibilityTabGroupSwitcherViewControllerFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_tabGroups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityScrollStatusFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[SFTabGroupCapsuleViewAccessibility _accessibilityIndexOfSelfIn:](self, "_accessibilityIndexOfSelfIn:", v4) == -1)
  {
    v9 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMobileSafariLocalizedString(CFSTR("tab.group"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "count");
    AXFormatInteger();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@ of %@"), v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  -[SFTabGroupCapsuleViewAccessibility _accessibilityCapsuleCollectionView](self, "_accessibilityCapsuleCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabGroupCapsuleViewAccessibility _accessibilityTabGroupSwitcherViewControllerFrom:](self, "_accessibilityTabGroupSwitcherViewControllerFrom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_tabController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491571C](CFSTR("TabController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("_tabGroups"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("activeTabGroup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    if ((unint64_t)(a3 - 1) > 5
      || (v11 = v10 + qword_2327B5758[a3 - 1], v11 < 0)
      || v11 >= (unint64_t)objc_msgSend(v8, "count"))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeStringForKey:", CFSTR("uuid"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v16 = v7;
      v17 = v13;
      v18 = v6;
      v19 = v5;
      v20 = v8;
      AXPerformSafeBlock();
      v14 = *((_BYTE *)v22 + 24) != 0;

      _Block_object_dispose(&v21, 8);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __58__SFTabGroupCapsuleViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  UIAccessibilityNotifications v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKeyPath:", CFSTR("tabCollectionViewProvider.tabOverview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__SFTabGroupCapsuleViewAccessibility_accessibilityScroll___block_invoke_2;
  v6[3] = &unk_250296B68;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performUpdatesWithoutTabCloseAnimation:", v6);

  objc_msgSend(*(id *)(a1 + 48), "capsuleCollectionView:contentViewForItemAtIndex:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491571C](CFSTR("SFTabGroupCapsuleView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _AXAssert();
  MEMORY[0x23491571C](CFSTR("SFTabGroupCapsuleView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v3);
    v4 = *MEMORY[0x24BDF72E0];
    objc_msgSend(v3, "_accessibilityLabelFrom:", *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }

}

uint64_t __58__SFTabGroupCapsuleViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveTabGroupUUID:", *(_QWORD *)(a1 + 40));
}

@end
