@implementation SFNavigationBarMetrics

+ (id)traitsAffectingBarMetrics
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)_contentSizeCategoryForFontsWithPreferredCategory:(NSString *)a1
{
  NSString *v3;
  NSString *v4;
  UIContentSizeCategory v5;
  UIContentSizeCategory *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (UIContentSizeCategory)*MEMORY[0x1E0DC4918];
    if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) != NSOrderedAscending
      && UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC4938]))
    {
      if (UIContentSizeCategoryIsAccessibilityCategory(v4))
        v6 = (UIContentSizeCategory *)MEMORY[0x1E0DC48D0];
      else
        v6 = (UIContentSizeCategory *)MEMORY[0x1E0DC48F0];
      v5 = *v6;
      if (UIContentSizeCategoryCompareToCategory(*v6, v4) != NSOrderedAscending)
        v5 = v4;
    }
    a1 = v5;
  }

  return a1;
}

- (SFNavigationBarMetrics)init
{
  SFNavigationBarMetrics *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SFNavigationBarMetrics *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFNavigationBarMetrics;
  v2 = -[SFNavigationBarMetrics init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "legibilityWeight");

    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = (void *)*MEMORY[0x1E0DC4918];
    -[SFNavigationBarMetrics _updateForContentSizeCategory:legibilityWeight:]((uint64_t)v2, v7, v4);

    -[SFNavigationBarMetrics _updateMetrics]((uint64_t)v2);
    v8 = v2;
  }

  return v2;
}

- (uint64_t)_updateForContentSizeCategory:(uint64_t)a3 legibilityWeight:
{
  id v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  _BOOL4 v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    -[SFNavigationBarMetrics _contentSizeCategoryForFontsWithPreferredCategory:]((NSString *)a1, v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 16);
    if (v7)
    {
      objc_msgSend(v7, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v8, v6) != NSOrderedSame;

    }
    else
    {
      v9 = 1;
    }
    _SFToolbarContentSizeCategoryForPreferredCategory();
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 208);
    if (v11)
    {
      objc_msgSend(v11, "preferredContentSizeCategory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v12, v10))
      {

      }
      else
      {
        v13 = objc_msgSend(*(id *)(a1 + 208), "legibilityWeight");

        v14 = v13 != a3 || v9;
        if (v14 != 1)
        {
          a1 = 0;
          goto LABEL_13;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v15;

    v17 = (void *)MEMORY[0x1E0DC3E88];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollectionWithTraitsFromCollections:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 208);
    *(_QWORD *)(a1 + 208) = v21;

    a1 = 1;
LABEL_13:

  }
  return a1;
}

- (void)_updateMetrics
{
  double v2;
  double v3;
  _BOOL4 IsAccessibilityCategory;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;

  if (a1)
  {
    v2 = *(double *)(a1 + 104);
    v3 = *MEMORY[0x1E0D4F1F8];
    objc_msgSend(*(id *)(a1 + 16), "preferredContentSizeCategory");
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v30);
    v5 = 1.0;
    if (IsAccessibilityCategory)
      _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection();
    *(double *)(a1 + 136) = v5;
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 50.0);
    *(double *)(a1 + 72) = ceil(v7);
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 44.0);
    v9 = ceil(v8);
    if (v9 < 56.0 && *(_BYTE *)(a1 + 8) != 0)
      v9 = 56.0;
    *(double *)(a1 + 80) = v9;
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 10.0);
    *(_QWORD *)(a1 + 144) = v11;
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 19.0);
    *(double *)(a1 + 24) = ceil(v12);
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 7.0);
    *(_QWORD *)(a1 + 160) = v13;
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 36.0);
    *(_QWORD *)(a1 + 168) = v14;
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), 12.0);
    *(_QWORD *)(a1 + 200) = v15;
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), -4.0);
    *(_QWORD *)(a1 + 176) = v16;
    _SFOnePixel();
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16));
    *(_QWORD *)(a1 + 184) = v17;
    _SFOnePixel();
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), -v18);
    *(_QWORD *)(a1 + 192) = v19;
    v20 = 13.5;
    if (v2 > v3)
    {
      v21 = 10.5;
    }
    else
    {
      v20 = 10.0;
      v21 = 7.5;
    }
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), v20);
    *(_QWORD *)(a1 + 88) = v22;
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(_QWORD *)(a1 + 16), v21);
    *(_QWORD *)(a1 + 96) = v23;
    v24 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v25 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    v26 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    *(_BYTE *)(a1 + 56) = 1;
    v27 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = 0;

    v28 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = 0;

    v29 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

  }
}

- (uint64_t)updateForTraitCollection:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SFNavigationBarMetrics _updateForContentSizeCategory:legibilityWeight:](a1, v5, objc_msgSend(v4, "legibilityWeight"));

    v7 = objc_opt_respondsToSelector();
    if ((v7 & 1) == 0 || (v6 & 1) != 0)
    {
      if (((v7 | v6) & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      v8 = objc_msgSend(v4, "_presentationSemanticContext") == 2;
      if (*(unsigned __int8 *)(a1 + 8) != v8)
      {
        *(_BYTE *)(a1 + 8) = v8;
LABEL_7:
        -[SFNavigationBarMetrics _updateMetrics](a1);
        a1 = 1;
        goto LABEL_9;
      }
    }
    a1 = 0;
  }
LABEL_9:

  return a1;
}

- (uint64_t)updateForStatusBarHeight:(uint64_t)result
{
  if (result)
  {
    if (*(double *)(result + 104) == a2)
    {
      return 0;
    }
    else
    {
      *(double *)(result + 104) = a2;
      -[SFNavigationBarMetrics _updateMetrics](result);
      return 1;
    }
  }
  return result;
}

- (double)barHeightWithBarMetricsCategory:(uint64_t)a1
{
  uint64_t v2;

  if (!a1)
    return 0.0;
  v2 = 72;
  if (a2 == 1)
    v2 = 80;
  return *(double *)(a1 + v2);
}

- (double)squishHeightQuantizationOffsetWithBarMetricsCategory:(uint64_t)a1
{
  uint64_t v2;

  if (!a1)
    return 0.0;
  v2 = 88;
  if (a2 == 1)
    v2 = 96;
  return *(double *)(a1 + v2);
}

- (_QWORD)defaultLabelFont
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC37E8];
      objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
      objc_msgSend(v4, "systemFontOfSize:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scaledFontForFont:compatibleWithTraitCollection:", v5, v1[2]);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v1[4];
      v1[4] = v6;

      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)defaultBoldFont
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC37E8];
      objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
      objc_msgSend(v4, "boldSystemFontOfSize:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scaledFontForFont:compatibleWithTraitCollection:", v5, v1[2]);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v1[5];
      v1[5] = v6;

      v2 = (void *)v1[5];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)narrowEditingLabelFont
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[6];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 15.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scaledFontForFont:compatibleWithTraitCollection:", v4, v1[2]);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v1[6];
      v1[6] = v5;

      v2 = (void *)v1[6];
    }
    a1 = v2;
  }
  return a1;
}

- (double)narrowEditingScaleFactor
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  double v10;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 56))
  {
    *(_BYTE *)(a1 + 56) = 0;
    v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v2, "setText:", CFSTR("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"));
    -[SFNavigationBarMetrics defaultLabelFont]((_QWORD *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFont:", v3);

    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], v5);
    v7 = v6;
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v8, "setText:", CFSTR("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"));
    -[SFNavigationBarMetrics narrowEditingLabelFont]((_QWORD *)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v8, "sizeThatFits:", v4, v5);
    *(double *)(a1 + 64) = v10 / v7;

  }
  return *(double *)(a1 + 64);
}

- (_QWORD)accessoryImageSymbolConfiguration
{
  _QWORD *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[14];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
      objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v1[2]);
      v5 = v4;

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 1, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v1[14];
      v1[14] = v6;

      v2 = (void *)v1[14];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)squishedAccessoryImageSymbolConfiguration
{
  _QWORD *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[15];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v1[2], 12.0);
      v5 = v4;

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v1[15];
      v1[15] = v6;

      v2 = (void *)v1[15];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)mediumButtonImageSymbolConfiguration
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[16];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "_sf_staticConfigurationWithTextStyle:scale:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], 2, a1[26]);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[16];
      v1[16] = v3;

      v2 = (void *)v1[16];
    }
    a1 = v2;
  }
  return a1;
}

- (double)urlOutlineCornerRadius
{
  if (a1)
    return *(double *)(a1 + 144);
  else
    return 0.0;
}

- (double)minimumBarHeight
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (double)urlContainerTop
{
  if (a1)
    return *(double *)(a1 + 160);
  else
    return 0.0;
}

- (double)urlOutlineHeight
{
  if (a1)
    return *(double *)(a1 + 168);
  else
    return 0.0;
}

- (double)urlLabelVerticalOffset
{
  if (a1)
    return *(double *)(a1 + 176);
  else
    return 0.0;
}

- (double)distanceFromLabelBaselineToURLOutlineBottom
{
  if (a1)
    return *(double *)(a1 + 200);
  else
    return 0.0;
}

- (uint64_t)traitCollectionForButtonMetrics
{
  if (result)
    return *(_QWORD *)(result + 208);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollectionForButtonMetrics, 0);
  objc_storeStrong((id *)&self->_mediumButtonImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_squishedAccessoryImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_accessoryImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_narrowEditingLabelFont, 0);
  objc_storeStrong((id *)&self->_defaultBoldFont, 0);
  objc_storeStrong((id *)&self->_defaultLabelFont, 0);
  objc_storeStrong((id *)&self->_traitCollectionForFontMetrics, 0);
}

@end
