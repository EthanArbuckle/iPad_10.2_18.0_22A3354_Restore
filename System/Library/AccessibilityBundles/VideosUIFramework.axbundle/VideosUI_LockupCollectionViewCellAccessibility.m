@implementation VideosUI_LockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.LockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VUIStackingPosterView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIStackingPosterView"), CFSTR("mainImageComponent"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIStackingPosterView"), CFSTR("components"), "@");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.LockupCollectionViewCell"), CFSTR("stackingPosterView"), "VUIStackingPosterView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("selectionView"), "Optional<VUIImageView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("isLockupSelected"), "Bool");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("scorecardView"), "Optional<_UIHostingView<ScoreboardImageWrapper>>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIBaseCollectionViewCell"), CFSTR("vuiCollectionViewCellInteractor"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.MultiViewPlayerHUDTemplateController"));
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.MultiPlayerViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.PageSwipeUpView"));

}

+ (id)specialCharacters
{
  if (specialCharacters_onceToken != -1)
    dispatch_once(&specialCharacters_onceToken, &__block_literal_global_14);
  return (id)specialCharacters_specialCharacters;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
  v3 = -[VideosUI_LockupCollectionViewCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityOverlayView](self, "_accessibilityOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("selectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v5 != 0) & objc_msgSend(v4, "safeSwiftBoolForKey:", CFSTR("isLockupSelected"))) != 0)
    v6 = *MEMORY[0x24BDF7400];
  else
    v6 = 0;
  v7 = v6 | v3;

  return v7;
}

- (id)accessibilityAttributedLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityStackingPosterView](self, "_accessibilityStackingPosterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityOverlayView](self, "_accessibilityOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_LockupCollectionViewCellAccessibility _axAttributedLabelFromComponentsOfStackingPosterView:overlayView:](self, "_axAttributedLabelFromComponentsOfStackingPosterView:overlayView:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
    -[VideosUI_LockupCollectionViewCellAccessibility accessibilityAttributedLabel](&v8, sel_accessibilityAttributedLabel);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityOverlayView](self, "_accessibilityOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityStackingPosterView](self, "_accessibilityStackingPosterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_LockupCollectionViewCellAccessibility _axLabelFromComponentsOfStackingPosterView:overlayView:](self, "_axLabelFromComponentsOfStackingPosterView:overlayView:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend((id)objc_opt_class(), "specialCharacters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsString:", v12))
        {
          objc_msgSend((id)objc_opt_class(), "specialCharacters");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          accessibilityLocalizedString(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "accessibilityValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    v24 = 0;
    objc_opt_class();
    -[VideosUI_LockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("vuiCollectionViewCellInteractor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x2349244BC](CFSTR("VideosUI.MultiViewPlayerHUDTemplateController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      accessibilityLocalizedString(CFSTR("multiview.selected.cell"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);

    }
    else
    {
      objc_msgSend(v6, "addObject:", v16);
    }

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
    -[VideosUI_LockupCollectionViewCellAccessibility accessibilityValue](&v23, sel_accessibilityValue);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)accessibilityHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosUI_LockupCollectionViewCellAccessibility;
  -[VideosUI_LockupCollectionViewCellAccessibility accessibilityHint](&v3, sel_accessibilityHint);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityStackingPosterView
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  -[VideosUI_LockupCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("stackingPosterView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogAppAccessibility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232B81000, v3, OS_LOG_TYPE_DEFAULT, "stackingPosterView was found! It seems like AX accessnotes are working", buf, 2u);
    }

    v5 = v2;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_232B81000, v3, OS_LOG_TYPE_DEFAULT, "stackingPosterView was nil. It seems like AX accessnotes are not working", v8, 2u);
    }

    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityFindSubviewDescendant:", &__block_literal_global_232_0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_accessibilityOverlayView
{
  void *v2;
  void *v3;
  void *v4;

  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityStackingPosterView](self, "_accessibilityStackingPosterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_mainImageComponent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_235);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityTextBadge:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("accessibilityTextBadge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("textBadge"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VUITextBadgeView")));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)_axLabelFromComponentsOfStackingPosterView:(id)a3 overlayView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("animatedLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
    objc_msgSend(v7, "addObject:", v9);
  objc_msgSend(v5, "safeValueForKey:", CFSTR("mainImageComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "length"))
    objc_msgSend(v7, "addObject:", v11);
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("components"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        v17 = v11;
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "accessibilityLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "length"))
          objc_msgSend(v7, "addObject:", v11);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v14);
  }

  objc_msgSend(v6, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
    objc_msgSend(v7, "addObject:", v19);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v20, "length"))
    objc_msgSend(v7, "addObject:", v20);
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("accessibilityAppImageView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "length"))
    objc_msgSend(v7, "addObject:", v22);
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("accessibilityLogoImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accessibilityLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
    objc_msgSend(v7, "addObject:", v24);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("accessibilityProgressView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeCGFloatForKey:", CFSTR("accessibilityProgress"));
  v27 = v26;

  if (v27 <= 0.01)
  {
    v31 = 0;
  }
  else
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("content.percentage.complete"));
    v29 = objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)v29;
  }

  if (objc_msgSend(v31, "length"))
    objc_msgSend(v7, "addObject:", v31);
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("accessibilityBadgeView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "accessibilityLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v33, "length"))
    objc_msgSend(v7, "addObject:", v33);
  -[VideosUI_LockupCollectionViewCellAccessibility _accessibilityTextBadge:](self, "_accessibilityTextBadge:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "accessibilityLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v35, "length"))
    objc_msgSend(v7, "addObject:", v35);
  objc_opt_class();
  objc_msgSend(v6, "safeSwiftValueForKey:", CFSTR("scorecardView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "accessibilityLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v38, "length"))
    objc_msgSend(v7, "addObject:", v38);
  objc_msgSend(v7, "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "componentsJoinedByString:", CFSTR(", "));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)_axAttributedLabelFromComponentsOfStackingPosterView:(id)a3 overlayView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[VideosUI_LockupCollectionViewCellAccessibility _axLabelFromComponentsOfStackingPosterView:overlayView:](self, "_axLabelFromComponentsOfStackingPosterView:overlayView:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend((id)objc_opt_class(), "specialCharacters", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12), &stru_2503D3D30);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v7);
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("accessibilityLogoImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_msgSend(v7, "rangeOfString:", v16);
    v19 = v18;
    v26 = *MEMORY[0x24BDF7368];
    v27 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttributes:range:", v20, v17, v19);

  }
  return v14;
}

@end
