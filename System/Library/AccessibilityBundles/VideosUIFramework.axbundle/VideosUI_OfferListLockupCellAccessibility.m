@implementation VideosUI_OfferListLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.OfferListLockupCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.OfferListLockupCell"), CFSTR("containerView"), "Optional<VUIBaseView>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FocusableTextView"), CFSTR("_auxilliaryTextView"), "VUITextView");
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.ASCListItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASCLockupContentView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASCLockupContentView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASCLockupContentView"), CFSTR("offerButton"), "@", 0);

}

- (id)_axContainerView
{
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  id v6;

  -[VideosUI_OfferListLockupCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("containerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "axContainsString:", CFSTR("OfferListLockupContentView"));

  if (v5)
    v6 = v2;
  else
    v6 = 0;

  return v6;
}

- (id)_axASCLockupView
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[VideosUI_OfferListLockupCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("containerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349244BC](CFSTR("VideosUI.ASCListItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_accessibilityDescendantOfType:", MEMORY[0x2349244BC](CFSTR("ASCLockupContentView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_axContainerPrimaryButton
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[VideosUI_OfferListLockupCellAccessibility _axContainerView](self, "_axContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("primaryButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axContainerSecondaryButton
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[VideosUI_OfferListLockupCellAccessibility _axContainerView](self, "_axContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("secondaryButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  -[VideosUI_OfferListLockupCellAccessibility _axContainerView](self, "_axContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_OfferListLockupCellAccessibility _axASCLockupView](self, "_axASCLockupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v7);

    -[VideosUI_OfferListLockupCellAccessibility _axContainerPrimaryButton](self, "_axContainerPrimaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v9);

    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("descriptionTextView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("_auxilliaryTextView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("_accessibilityGetValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v12);

    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("subBodyLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v14);

    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("mediaTagsView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v16);

  }
  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("titleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v18);

    objc_msgSend(v4, "safeValueForKey:", CFSTR("subtitleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessibilityLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v20);

    objc_msgSend(v4, "safeValueForKey:", CFSTR("offerButton"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessibilityLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v22);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)VideosUI_OfferListLockupCellAccessibility;
    -[VideosUI_OfferListLockupCellAccessibility accessibilityLabel](&v26, sel_accessibilityLabel);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;

  return v24;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGPoint result;

  -[VideosUI_OfferListLockupCellAccessibility _axContainerPrimaryButton](self, "_axContainerPrimaryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[VideosUI_OfferListLockupCellAccessibility _axASCLockupView](self, "_axASCLockupView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("offerButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "accessibilityActivationPoint");
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)VideosUI_OfferListLockupCellAccessibility;
      -[VideosUI_OfferListLockupCellAccessibility accessibilityActivationPoint](&v15, sel_accessibilityActivationPoint);
    }
    v6 = v11;
    v8 = v12;

  }
  v13 = v6;
  v14 = v8;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VideosUI_OfferListLockupCellAccessibility;
  -[VideosUI_OfferListLockupCellAccessibility accessibilityCustomActions](&v20, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VideosUI_OfferListLockupCellAccessibility _axContainerPrimaryButton](self, "_axContainerPrimaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("offer.cell.purchase"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __71__VideosUI_OfferListLockupCellAccessibility_accessibilityCustomActions__block_invoke;
    v17[3] = &unk_2503D25D8;
    objc_copyWeak(&v18, &location);
    v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, v17);

    objc_msgSend(v4, "axSafelyAddObject:", v9);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  -[VideosUI_OfferListLockupCellAccessibility _axContainerSecondaryButton](self, "_axContainerSecondaryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_initWeak(&location, v10);
    v11 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v10, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __71__VideosUI_OfferListLockupCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v15[3] = &unk_2503D25D8;
    objc_copyWeak(&v16, &location);
    v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, v15);

    objc_msgSend(v4, "axSafelyAddObject:", v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v4;
}

@end
