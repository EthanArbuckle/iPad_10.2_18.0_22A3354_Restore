@implementation VUIPromoMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIPromoMetadataView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPromoMetadataView"), CFSTR("skipInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVPMediaItemSkipInfo"), CFSTR("promoInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPromoMetadataView"), CFSTR("titleImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPromoMetadataView"), CFSTR("mediaTagsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVPMediaItemPromoInfo"), CFSTR("canonicalId"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPromoMetadataView"), CFSTR("skipButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPromoMetadataView"), CFSTR("onlySkipButtonAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPromoMetadataView"), CFSTR("upNextButton"), "@", 0);

}

- (id)_axPromoInfo
{
  return (id)-[VUIPromoMetadataViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("skipInfo.promoInfo"));
}

- (id)_axTitleImageView
{
  return (id)-[VUIPromoMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleImageView"));
}

- (id)_axMediaTagsView
{
  return (id)-[VUIPromoMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaTagsView"));
}

- (id)_axSkipButton
{
  return (id)-[VUIPromoMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("skipButton"));
}

- (BOOL)_axOnlySkipButtonAvailable
{
  return -[VUIPromoMetadataViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("onlySkipButtonAvailable"));
}

- (id)_axUpNextButton
{
  return (id)-[VUIPromoMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("upNextButton"));
}

- (id)_axCanonicalId
{
  void *v2;
  void *v3;

  -[VUIPromoMetadataViewAccessibility _axPromoInfo](self, "_axPromoInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("canonicalId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axMetadataLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[VUIPromoMetadataViewAccessibility _axTitleImageView](self, "_axTitleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataViewAccessibility _axMediaTagsView](self, "_axMediaTagsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VUIPromoMetadataViewAccessibility;
  -[VUIPromoMetadataViewAccessibility _accessibilityLoadAccessibilityInformation](&v21, sel__accessibilityLoadAccessibilityInformation);
  -[VUIPromoMetadataViewAccessibility _axTitleImageView](self, "_axTitleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  -[VUIPromoMetadataViewAccessibility _axTitleImageView](self, "_axTitleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataViewAccessibility _axPromoInfo](self, "_axPromoInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  -[VUIPromoMetadataViewAccessibility _axTitleImageView](self, "_axTitleImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF73C0];
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  -[VUIPromoMetadataViewAccessibility _axMediaTagsView](self, "_axMediaTagsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAccessibilityElement:", 1);

  -[VUIPromoMetadataViewAccessibility _axMediaTagsView](self, "_axMediaTagsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityTraits:", v8);

  objc_initWeak(&location, self);
  -[VUIPromoMetadataViewAccessibility _axSkipButton](self, "_axSkipButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilitySetShouldIncludeRowRangeInElementDescription:", 1);

  -[VUIPromoMetadataViewAccessibility _axSkipButton](self, "_axSkipButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v18[3] = &unk_2503D2838;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v12, "_setAccessibilityRowRangeBlock:", v18);

  -[VUIPromoMetadataViewAccessibility _axUpNextButton](self, "_axUpNextButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_accessibilitySetShouldIncludeRowRangeInElementDescription:", 1);

  -[VUIPromoMetadataViewAccessibility _axUpNextButton](self, "_axUpNextButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v16[3] = &unk_2503D2838;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v15, "_setAccessibilityRowRangeBlock:", v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

id __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_axOnlySkipButtonAvailable") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 2, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_axOnlySkipButtonAvailable") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 1, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIPromoMetadataViewAccessibility;
  -[VUIPromoMetadataViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIPromoMetadataViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)updateWithInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIPromoMetadataViewAccessibility;
  -[VUIPromoMetadataViewAccessibility updateWithInfo:](&v4, sel_updateWithInfo_, a3);
  -[VUIPromoMetadataViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VUIPromoMetadataViewAccessibility;
  -[VUIPromoMetadataViewAccessibility didMoveToSuperview](&v2, sel_didMoveToSuperview);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __55__VUIPromoMetadataViewAccessibility_didMoveToSuperview__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "_axSkipButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

@end
