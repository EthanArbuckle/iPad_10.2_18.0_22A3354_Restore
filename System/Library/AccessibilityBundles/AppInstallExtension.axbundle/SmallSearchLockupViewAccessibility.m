@implementation SmallSearchLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.SmallSearchLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("accessibilitytUserRatingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("accessibilityRatingCountLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("accessibilityIsAd"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("accessibilityAdButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("accessibilityDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("accessibilitySearchTagsRibbonView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AppInstallExtension.SmallSearchLockupView"), CFSTR("AppInstallExtension.BaseLockupView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.BaseLockupView"), CFSTR("accessibilityTitleLabel"), "@", 0);

}

- (id)_accessibilityAdvertisement
{
  return accessibilityAppStoreLocalizedString(CFSTR("advertisement.button"));
}

- (id)accessibilityLabel
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  __CFString *v19;
  objc_super v20;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  objc_super v27;

  v3 = -[SmallSearchLockupViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsAd"));
  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRatingCountLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitytUserRatingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDescriptionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityAppStoreLocalizedString(CFSTR("user.ratings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v27.receiver = self;
    v27.super_class = (Class)SmallSearchLockupViewAccessibility;
    -[SmallSearchLockupViewAccessibility accessibilityLabel](&v27, sel_accessibilityLabel);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v5;
    v19 = v11;
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SmallSearchLockupViewAccessibility subviews](self, "subviews");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __56__SmallSearchLockupViewAccessibility_accessibilityLabel__block_invoke;
    v22[3] = &unk_2501531C8;
    v22[4] = &v23;
    -[__CFString enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v22);
    if (*((_BYTE *)v24 + 24))
    {
      v21.receiver = self;
      v21.super_class = (Class)SmallSearchLockupViewAccessibility;
      -[SmallSearchLockupViewAccessibility accessibilityLabel](&v21, sel_accessibilityLabel);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityAppStoreLocalizedString(CFSTR("editors.choice"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = v6;
      __UIAXStringForVariables();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)SmallSearchLockupViewAccessibility;
      -[SmallSearchLockupViewAccessibility accessibilityLabel](&v20, sel_accessibilityLabel);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v6;
      v19 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v23, 8);
  }

  if (v3)
  {
    -[SmallSearchLockupViewAccessibility _accessibilityAdvertisement](self, "_accessibilityAdvertisement", v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }

  return v13;
}

void __56__SmallSearchLockupViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  MEMORY[0x234905BBC](CFSTR("AppStore.EditorsChoiceView"));
  isKindOfClass = objc_opt_isKindOfClass();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SmallSearchLockupViewAccessibility;
  -[SmallSearchLockupViewAccessibility _accessibilitySupplementaryFooterViews](&v10, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAdButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SmallSearchLockupViewAccessibility _accessibilityAdvertisement](self, "_accessibilityAdvertisement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityMetadataRibbonView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "axSafelyAddObject:", v7);
  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySearchTagsRibbonView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "axSafelyAddObject:", v8);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SmallSearchLockupViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SmallSearchLockupViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[SmallSearchLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234905BC8](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
