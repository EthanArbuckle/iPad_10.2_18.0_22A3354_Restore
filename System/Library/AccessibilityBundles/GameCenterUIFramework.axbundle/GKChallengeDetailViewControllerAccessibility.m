@implementation GKChallengeDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKChallengeDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityChallengeDetailElements
{
  JUMPOUT(0x23490F934);
}

- (void)_setAccessibilityChallengeDetailElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("GKChallengeDetailViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("categoryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("descriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("playerAvatarView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("challengeByNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("shouldShowPlay"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("playNowButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("declineButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKChallengeDetailViewController"), CFSTR("updateIconViewWithSubView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GameCenterUI.AchievementBadge"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityIsAchievementLocked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityIsAchievementCompleted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityIsAchievementInProgress"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityProgress"), "d", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  double v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  float v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)GKChallengeDetailViewControllerAccessibility;
  -[GKChallengeDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v26, sel__accessibilityLoadAccessibilityInformation);
  -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityDescendantOfType:", MEMORY[0x23490F8D4](CFSTR("GameCenterUI.AchievementBadge")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", &__block_literal_global_3);
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsAchievementLocked"));
  v6 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsAchievementCompleted"));
  v7 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsAchievementInProgress"));
  objc_msgSend(v4, "safeCGFloatForKey:", CFSTR("accessibilityProgress"));
  if (v5)
  {
    v9 = CFSTR("LOCKED");
LABEL_5:
    AXGameCenterUIFrameworkLocString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v6)
  {
    v9 = CFSTR("COMPLETED");
    goto LABEL_5;
  }
  if (!v7)
  {
    v11 = 0;
    goto LABEL_7;
  }
  v16 = v8;
  AXGameCenterUIFrameworkLocString(CFSTR("IN_PROGRESS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 / 100.0;
  MEMORY[0x23490F8EC](0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_7:
  v12 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v24[3] = &unk_2502165D0;
  v13 = v11;
  v25 = v13;
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v24);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v22[3] = &unk_2502165F8;
  v14 = v4;
  v23 = v14;
  objc_msgSend(v3, "_setAccessibilityPathBlock:", v22);
  objc_initWeak(&location, self);
  -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v19[3] = &unk_250216620;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v15, "_setAccessibilityElementsBlock:", v19);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

uint64_t __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

id __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityCirclePathBasedOnBoundsWidth");
}

id __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axElementsOfView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_axElementsOfView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  -[GKChallengeDetailViewControllerAccessibility _accessibilityChallengeDetailElements](self, "_accessibilityChallengeDetailElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:");
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("categoryLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v20);
    v8 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke;
    v24[3] = &unk_250216648;
    v19 = v4;
    v25 = v19;
    v9 = v5;
    v26 = v9;
    v10 = v6;
    v27 = v10;
    objc_msgSend(v7, "_setAccessibilityLabelBlock:", v24);
    objc_msgSend(v7, "_setIsAccessibilityElementBlock:", &__block_literal_global_234);
    objc_msgSend(v3, "axSafelyAddObject:", v7);
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerAvatarView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("challengeByNameLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v13);
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_3;
    v22[3] = &unk_2502165D0;
    v23 = v12;
    v15 = v12;
    objc_msgSend(v14, "_setAccessibilityLabelBlock:", v22);
    objc_msgSend(v14, "_setIsAccessibilityElementBlock:", &__block_literal_global_235);
    objc_msgSend(v3, "axSafelyAddObject:", v14);
    if (-[GKChallengeDetailViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowPlay")))
    {
      -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playNowButton"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObject:", v16);

    }
    -[GKChallengeDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("declineButton"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v17);
    -[GKChallengeDetailViewControllerAccessibility _setAccessibilityChallengeDetailElements:](self, "_setAccessibilityChallengeDetailElements:", v3);

  }
  return v3;
}

id __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  objc_msgSend(a1[4], "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_2()
{
  return 1;
}

id __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_4()
{
  return 1;
}

- (void)updateIconViewWithSubView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKChallengeDetailViewControllerAccessibility;
  -[GKChallengeDetailViewControllerAccessibility updateIconViewWithSubView:](&v4, sel_updateIconViewWithSubView_, a3);
  -[GKChallengeDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
