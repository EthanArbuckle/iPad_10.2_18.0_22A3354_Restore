@implementation CKUIBehaviorMac

- (id)theme
{
  if (theme_once_0 != -1)
    dispatch_once(&theme_once_0, &__block_literal_global_167);
  return (id)theme_sBehavior_0;
}

void __24__CKUIBehaviorMac_theme__block_invoke()
{
  CKUIThemeMac *v0;
  void *v1;

  v0 = objc_alloc_init(CKUIThemeMac);
  v1 = (void *)theme_sBehavior_0;
  theme_sBehavior_0 = (uint64_t)v0;

}

- (BOOL)canPresentOverKeyboard
{
  if (canPresentOverKeyboard_once_0 != -1)
    dispatch_once(&canPresentOverKeyboard_once_0, &__block_literal_global_20);
  return canPresentOverKeyboard_sBehavior_0;
}

void __41__CKUIBehaviorMac_canPresentOverKeyboard__block_invoke()
{
  canPresentOverKeyboard_sBehavior_0 = 1;
}

- (double)minWindowWidthPrimaryColumnOffset
{
  if (minWindowWidthPrimaryColumnOffset_once != -1)
    dispatch_once(&minWindowWidthPrimaryColumnOffset_once, &__block_literal_global_21);
  return *(double *)&minWindowWidthPrimaryColumnOffset_sBehavior;
}

void __52__CKUIBehaviorMac_minWindowWidthPrimaryColumnOffset__block_invoke()
{
  minWindowWidthPrimaryColumnOffset_sBehavior = 0x4075400000000000;
}

- (CGSize)minWindowSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CKUIBehaviorMac_minWindowSize__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (minWindowSize_once != -1)
    dispatch_once(&minWindowSize_once, block);
  v2 = *(double *)&minWindowSize_sBehavior_0;
  v3 = *(double *)&minWindowSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

double __32__CKUIBehaviorMac_minWindowSize__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "minConversationListWidth");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "minWindowWidthPrimaryColumnOffset");
  result = v3 + v4;
  minWindowSize_sBehavior_0 = *(_QWORD *)&result;
  minWindowSize_sBehavior_1 = 0x4074000000000000;
  return result;
}

- (id)chromeEffectForInterfaceStyle:(int64_t)a3
{
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 2.0;
  if (a3 == 2)
  {
    v5 = 1.0;
    v6 = 0;
  }
  else
  {
    v6 = 5;
  }
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectSaturate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEABE0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectCompositingColor:withMode:alpha:", v9, v6, 0.7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEABE0];
  v15[0] = v4;
  v15[1] = v7;
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectCombiningEffects:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)effectPreviewOverlayEffect
{
  return 0;
}

- (BOOL)useMacToolbar
{
  if (useMacToolbar_once_0 != -1)
    dispatch_once(&useMacToolbar_once_0, &__block_literal_global_27);
  return useMacToolbar_sBehavior;
}

void __32__CKUIBehaviorMac_useMacToolbar__block_invoke()
{
  void *v0;
  char v1;

  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "macToolbarEnabled");

  }
  else
  {
    v1 = 0;
  }
  useMacToolbar_sBehavior = v1;
}

- (double)macToolbarImagePointSize
{
  if (macToolbarImagePointSize_once != -1)
    dispatch_once(&macToolbarImagePointSize_once, &__block_literal_global_29_1);
  return *(double *)&macToolbarImagePointSize_sBehavior;
}

void __43__CKUIBehaviorMac_macToolbarImagePointSize__block_invoke()
{
  macToolbarImagePointSize_sBehavior = 0x4036000000000000;
}

- (id)macToolbarFaceTimeImageName
{
  if (macToolbarFaceTimeImageName_once != -1)
    dispatch_once(&macToolbarFaceTimeImageName_once, &__block_literal_global_30);
  return (id)macToolbarFaceTimeImageName_sBehavior;
}

void __46__CKUIBehaviorMac_macToolbarFaceTimeImageName__block_invoke()
{
  void *v0;

  v0 = (void *)macToolbarFaceTimeImageName_sBehavior;
  macToolbarFaceTimeImageName_sBehavior = (uint64_t)CFSTR("video");

}

- (id)macToolbarJoinedFaceTimeVideoImageName
{
  if (macToolbarJoinedFaceTimeVideoImageName_once != -1)
    dispatch_once(&macToolbarJoinedFaceTimeVideoImageName_once, &__block_literal_global_33);
  return (id)macToolbarJoinedFaceTimeVideoImageName_sBehavior;
}

void __57__CKUIBehaviorMac_macToolbarJoinedFaceTimeVideoImageName__block_invoke()
{
  void *v0;

  v0 = (void *)macToolbarJoinedFaceTimeVideoImageName_sBehavior;
  macToolbarJoinedFaceTimeVideoImageName_sBehavior = (uint64_t)CFSTR("video.fill");

}

- (id)macToolbarJoinedFaceTimeAudioImageName
{
  if (macToolbarJoinedFaceTimeAudioImageName_once != -1)
    dispatch_once(&macToolbarJoinedFaceTimeAudioImageName_once, &__block_literal_global_36_0);
  return (id)macToolbarJoinedFaceTimeAudioImageName_sBehavior;
}

void __57__CKUIBehaviorMac_macToolbarJoinedFaceTimeAudioImageName__block_invoke()
{
  void *v0;

  v0 = (void *)macToolbarJoinedFaceTimeAudioImageName_sBehavior;
  macToolbarJoinedFaceTimeAudioImageName_sBehavior = (uint64_t)CFSTR("phone.fill");

}

- (id)macToolbarJoinableFaceTimeVideoImageName
{
  if (macToolbarJoinableFaceTimeVideoImageName_once != -1)
    dispatch_once(&macToolbarJoinableFaceTimeVideoImageName_once, &__block_literal_global_39);
  return (id)macToolbarJoinableFaceTimeVideoImageName_sBehavior;
}

void __59__CKUIBehaviorMac_macToolbarJoinableFaceTimeVideoImageName__block_invoke()
{
  void *v0;

  v0 = (void *)macToolbarJoinableFaceTimeVideoImageName_sBehavior;
  macToolbarJoinableFaceTimeVideoImageName_sBehavior = (uint64_t)CFSTR("video.fill");

}

- (id)macToolbarJoinableFaceTimeAudioImageName
{
  if (macToolbarJoinableFaceTimeAudioImageName_once != -1)
    dispatch_once(&macToolbarJoinableFaceTimeAudioImageName_once, &__block_literal_global_40);
  return (id)macToolbarJoinableFaceTimeAudioImageName_sBehavior;
}

void __59__CKUIBehaviorMac_macToolbarJoinableFaceTimeAudioImageName__block_invoke()
{
  void *v0;

  v0 = (void *)macToolbarJoinableFaceTimeAudioImageName_sBehavior;
  macToolbarJoinableFaceTimeAudioImageName_sBehavior = (uint64_t)CFSTR("phone.fill");

}

- (id)macToolbarDetailsImageName
{
  if (macToolbarDetailsImageName_once != -1)
    dispatch_once(&macToolbarDetailsImageName_once, &__block_literal_global_41_0);
  return (id)macToolbarDetailsImageName_sBehavior;
}

void __45__CKUIBehaviorMac_macToolbarDetailsImageName__block_invoke()
{
  void *v0;

  v0 = (void *)macToolbarDetailsImageName_sBehavior;
  macToolbarDetailsImageName_sBehavior = (uint64_t)CFSTR("info.circle");

}

- (id)macToolbarFaceTimeImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CKUIBehaviorMac_macToolbarFaceTimeImage__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macToolbarFaceTimeImage_once != -1)
    dispatch_once(&macToolbarFaceTimeImage_once, block);
  return (id)macToolbarFaceTimeImage_sBehavior;
}

void __42__CKUIBehaviorMac_macToolbarFaceTimeImage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "macToolbarFaceTimeImageName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "macToolbarImagePointSize");
  objc_msgSend(v2, "imageNamed:pointSize:insets:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)macToolbarFaceTimeImage_sBehavior;
  macToolbarFaceTimeImage_sBehavior = v3;

}

- (id)macToolbarDetailsImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CKUIBehaviorMac_macToolbarDetailsImage__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macToolbarDetailsImage_once != -1)
    dispatch_once(&macToolbarDetailsImage_once, block);
  return (id)macToolbarDetailsImage_sBehavior;
}

void __41__CKUIBehaviorMac_macToolbarDetailsImage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "macToolbarDetailsImageName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "macToolbarImagePointSize");
  objc_msgSend(v2, "imageNamed:pointSize:insets:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)macToolbarDetailsImage_sBehavior;
  macToolbarDetailsImage_sBehavior = v3;

}

- (id)macToolbarSymbolConfiguration
{
  if (macToolbarSymbolConfiguration_once != -1)
    dispatch_once(&macToolbarSymbolConfiguration_once, &__block_literal_global_44_0);
  return (id)macToolbarSymbolConfiguration_sBehavior;
}

void __48__CKUIBehaviorMac_macToolbarSymbolConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 5, 3, 13.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)macToolbarSymbolConfiguration_sBehavior;
  macToolbarSymbolConfiguration_sBehavior = v0;

}

- (double)bottomConversationListSpace
{
  void *v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  double v11;
  BOOL v13;

  CKPreferredContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)bottomConversationListSpace_sContentSizeCategory_bottomConversationListSpace_0, (UIContentSizeCategory)v3)|| bottomConversationListSpace_sIsBoldTextEnabled_bottomConversationListSpace_0 != IsBoldTextEnabled|| (*(double *)&bottomConversationListSpace_sTextFontSize_bottomConversationListSpace_0 == v5? (v13 = *(double *)&bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0 == v6): (v13 = 0), !v13|| (objc_msgSend((id)bottomConversationListSpace_sCustomTextFontName_bottomConversationListSpace_0, "isEqualToString:", v9, *(double *)&bottomConversationListSpace_sTextFontSize_bottomConversationListSpace_0, *(double *)&bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0) & 1) == 0))
  {
    -[CKUIBehavior conversationListSummaryBodyLeading](self, "conversationListSummaryBodyLeading");
    bottomConversationListSpace_sBehavior_0 = v10;
    objc_storeStrong((id *)&bottomConversationListSpace_sContentSizeCategory_bottomConversationListSpace_0, v3);
    bottomConversationListSpace_sIsBoldTextEnabled_bottomConversationListSpace_0 = IsBoldTextEnabled;
    bottomConversationListSpace_sTextFontSize_bottomConversationListSpace_0 = *(_QWORD *)&v5;
    bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&bottomConversationListSpace_sCustomTextFontName_bottomConversationListSpace_0, v8);
  }
  v11 = *(double *)&bottomConversationListSpace_sBehavior_0;

  return v11;
}

- (unint64_t)defaultConversationLoadMoreCount
{
  if (defaultConversationLoadMoreCount_once_0 != -1)
    dispatch_once(&defaultConversationLoadMoreCount_once_0, &__block_literal_global_48);
  if (defaultConversationLoadMoreCount_sBehavior_0)
    return 100;
  else
    return 0;
}

void __51__CKUIBehaviorMac_defaultConversationLoadMoreCount__block_invoke()
{
  defaultConversationLoadMoreCount_sBehavior_0 = 1;
}

- (Class)navigationBarClass
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CKUIBehaviorMac_navigationBarClass__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (navigationBarClass_once_0 != -1)
    dispatch_once(&navigationBarClass_once_0, block);
  return (Class)(id)navigationBarClass_sBehavior_0;
}

id __37__CKUIBehaviorMac_navigationBarClass__block_invoke(uint64_t a1)
{
  id result;
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CKUIBehaviorMac;
  result = objc_msgSendSuper2(&v2, sel_navigationBarClass);
  navigationBarClass_sBehavior_0 = (uint64_t)result;
  return result;
}

- (BOOL)suppressPinActivityForState:(id)a3
{
  return objc_msgSend(a3, "isSelected");
}

- (BOOL)shouldUnreadIndicatorChangeOnSelection
{
  if (shouldUnreadIndicatorChangeOnSelection_once_0[0] != -1)
    dispatch_once(shouldUnreadIndicatorChangeOnSelection_once_0, &__block_literal_global_49_0);
  return shouldUnreadIndicatorChangeOnSelection_sBehavior;
}

void __57__CKUIBehaviorMac_shouldUnreadIndicatorChangeOnSelection__block_invoke()
{
  shouldUnreadIndicatorChangeOnSelection_sBehavior = 1;
}

- (double)conversationListContactImageDiameter
{
  if (conversationListContactImageDiameter_once_0 != -1)
    dispatch_once(&conversationListContactImageDiameter_once_0, &__block_literal_global_50_1);
  return *(double *)&conversationListContactImageDiameter_sBehavior_0;
}

void __55__CKUIBehaviorMac_conversationListContactImageDiameter__block_invoke()
{
  conversationListContactImageDiameter_sBehavior_0 = 0x4044000000000000;
}

- (double)conversationListCellCloseButtonWidth
{
  if (conversationListCellCloseButtonWidth_once != -1)
    dispatch_once(&conversationListCellCloseButtonWidth_once, &__block_literal_global_51_0);
  return *(double *)&conversationListCellCloseButtonWidth_sBehavior;
}

void __55__CKUIBehaviorMac_conversationListCellCloseButtonWidth__block_invoke()
{
  conversationListCellCloseButtonWidth_sBehavior = 0x402E000000000000;
}

- (double)conversationListCellCloseButtonHeight
{
  if (conversationListCellCloseButtonHeight_once != -1)
    dispatch_once(&conversationListCellCloseButtonHeight_once, &__block_literal_global_52_0);
  return *(double *)&conversationListCellCloseButtonHeight_sBehavior;
}

void __56__CKUIBehaviorMac_conversationListCellCloseButtonHeight__block_invoke()
{
  conversationListCellCloseButtonHeight_sBehavior = 0x402E000000000000;
}

- (id)conversationListSenderFont
{
  NSString *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  CKPreferredContentSizeCategory();
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  v11 = (id *)&unk_1EE116000;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListSenderFont_sContentSizeCategory_conversationListSenderFont_0, v2)|| conversationListSenderFont_sIsIncreaseContrastEnabled_conversationListSenderFont_0 != v3|| conversationListSenderFont_sIsBoldTextEnabled_conversationListSenderFont_0 != IsBoldTextEnabled|| (v10 = conversationListSenderFont_sTextFontSize_conversationListSenderFont_0, *(double *)&conversationListSenderFont_sTextFontSize_conversationListSenderFont_0 != v5)|| (v10 = conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0, *(double *)&conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0 != v6)|| (objc_msgSend((id)conversationListSenderFont_sCustomTextFontName_conversationListSenderFont_0, "isEqualToString:", v9, *(double *)&conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538], *(double *)&v10);
    v22 = v2;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0DC13C0];
    v23 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id *)&unk_1EE116000;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, 0.0);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = v14;
    v19 = (void *)conversationListSenderFont_sBehavior_0;
    conversationListSenderFont_sBehavior_0 = v18;
    v2 = v22;

    objc_storeStrong((id *)&conversationListSenderFont_sContentSizeCategory_conversationListSenderFont_0, v22);
    conversationListSenderFont_sIsIncreaseContrastEnabled_conversationListSenderFont_0 = v3;
    conversationListSenderFont_sIsBoldTextEnabled_conversationListSenderFont_0 = IsBoldTextEnabled;
    conversationListSenderFont_sTextFontSize_conversationListSenderFont_0 = *(_QWORD *)&v5;
    conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&conversationListSenderFont_sCustomTextFontName_conversationListSenderFont_0, v8);
  }
  v20 = v11[461];

  return v20;
}

- (id)conversationListSummaryFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListSummaryFont_sContentSizeCategory_conversationListSummaryFont_0, (UIContentSizeCategory)v2)|| conversationListSummaryFont_sIsIncreaseContrastEnabled_conversationListSummaryFont_0 != v3|| conversationListSummaryFont_sIsBoldTextEnabled_conversationListSummaryFont_0 != IsBoldTextEnabled|| (v10 = conversationListSummaryFont_sTextFontSize_conversationListSummaryFont_0, *(double *)&conversationListSummaryFont_sTextFontSize_conversationListSummaryFont_0 != v5)|| (v10 = conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0, *(double *)&conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0 != v6)|| (objc_msgSend((id)conversationListSummaryFont_sCustomTextFontName_conversationListSummaryFont_0, "isEqualToString:", v9, *(double *)&conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590], *(double *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 12.0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)conversationListSummaryFont_sBehavior_0;
    conversationListSummaryFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&conversationListSummaryFont_sContentSizeCategory_conversationListSummaryFont_0, v2);
    conversationListSummaryFont_sIsIncreaseContrastEnabled_conversationListSummaryFont_0 = v3;
    conversationListSummaryFont_sIsBoldTextEnabled_conversationListSummaryFont_0 = IsBoldTextEnabled;
    conversationListSummaryFont_sTextFontSize_conversationListSummaryFont_0 = *(_QWORD *)&v5;
    conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&conversationListSummaryFont_sCustomTextFontName_conversationListSummaryFont_0, v8);
  }
  v14 = (id)conversationListSummaryFont_sBehavior_0;

  return v14;
}

- (id)conversationListBoldSummaryFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListBoldSummaryFont_sContentSizeCategory_conversationListBoldSummaryFont_0, (UIContentSizeCategory)v2)|| conversationListBoldSummaryFont_sIsIncreaseContrastEnabled_conversationListBoldSummaryFont_0 != v3|| conversationListBoldSummaryFont_sIsBoldTextEnabled_conversationListBoldSummaryFont_0 != IsBoldTextEnabled|| (v10 = conversationListBoldSummaryFont_sTextFontSize_conversationListBoldSummaryFont_0, *(double *)&conversationListBoldSummaryFont_sTextFontSize_conversationListBoldSummaryFont_0 != v5)|| (v10 = conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0, *(double *)&conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0 != v6)|| (objc_msgSend((id)conversationListBoldSummaryFont_sCustomTextFontName_conversationListBoldSummaryFont_0, "isEqualToString:", v9, *(double *)&conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 2, 0, *(double *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 12.0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)conversationListBoldSummaryFont_sBehavior_0;
    conversationListBoldSummaryFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&conversationListBoldSummaryFont_sContentSizeCategory_conversationListBoldSummaryFont_0, v2);
    conversationListBoldSummaryFont_sIsIncreaseContrastEnabled_conversationListBoldSummaryFont_0 = v3;
    conversationListBoldSummaryFont_sIsBoldTextEnabled_conversationListBoldSummaryFont_0 = IsBoldTextEnabled;
    conversationListBoldSummaryFont_sTextFontSize_conversationListBoldSummaryFont_0 = *(_QWORD *)&v5;
    conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&conversationListBoldSummaryFont_sCustomTextFontName_conversationListBoldSummaryFont_0, v8);
  }
  v14 = (id)conversationListBoldSummaryFont_sBehavior_0;

  return v14;
}

- (id)conversationListPinnedConversationNameFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListPinnedConversationNameFont_sContentSizeCategory_conversationListPinnedConversationNameFont_0, (UIContentSizeCategory)v2)|| conversationListPinnedConversationNameFont_sIsIncreaseContrastEnabled_conversationListPinnedConversationNameFont_0 != v3|| conversationListPinnedConversationNameFont_sIsBoldTextEnabled_conversationListPinnedConversationNameFont_0 != IsBoldTextEnabled|| (v10 = conversationListPinnedConversationNameFont_sTextFontSize_conversationListPinnedConversationNameFont_0, *(double *)&conversationListPinnedConversationNameFont_sTextFontSize_conversationListPinnedConversationNameFont_0 != v5)|| (v10 = conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0, *(double *)&conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0 != v6)|| (objc_msgSend((id)conversationListPinnedConversationNameFont_sCustomTextFontName_conversationListPinnedConversationNameFont_0, "isEqualToString:", v9, *(double *)&conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0) & 1) == 0)
  {
    +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E0CEB590], *MEMORY[0x1E0CEB3F8], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)conversationListPinnedConversationNameFont_sBehavior_0;
    conversationListPinnedConversationNameFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&conversationListPinnedConversationNameFont_sContentSizeCategory_conversationListPinnedConversationNameFont_0, v2);
    conversationListPinnedConversationNameFont_sIsIncreaseContrastEnabled_conversationListPinnedConversationNameFont_0 = v3;
    conversationListPinnedConversationNameFont_sIsBoldTextEnabled_conversationListPinnedConversationNameFont_0 = IsBoldTextEnabled;
    conversationListPinnedConversationNameFont_sTextFontSize_conversationListPinnedConversationNameFont_0 = *(_QWORD *)&v5;
    conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&conversationListPinnedConversationNameFont_sCustomTextFontName_conversationListPinnedConversationNameFont_0, v8);
  }
  v13 = (id)conversationListPinnedConversationNameFont_sBehavior_0;

  return v13;
}

- (double)pinnedConversationActivityBroadShadowLightRadius
{
  if (pinnedConversationActivityBroadShadowLightRadius_once_0 != -1)
    dispatch_once(&pinnedConversationActivityBroadShadowLightRadius_once_0, &__block_literal_global_58_0);
  return *(double *)&pinnedConversationActivityBroadShadowLightRadius_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityBroadShadowLightRadius__block_invoke()
{
  pinnedConversationActivityBroadShadowLightRadius_sBehavior_0 = 0x4014000000000000;
}

- (double)pinnedConversationActivityBroadShadowDarkRadius
{
  if (pinnedConversationActivityBroadShadowDarkRadius_once_0 != -1)
    dispatch_once(&pinnedConversationActivityBroadShadowDarkRadius_once_0, &__block_literal_global_59_0);
  return *(double *)&pinnedConversationActivityBroadShadowDarkRadius_sBehavior_0;
}

void __66__CKUIBehaviorMac_pinnedConversationActivityBroadShadowDarkRadius__block_invoke()
{
  pinnedConversationActivityBroadShadowDarkRadius_sBehavior_0 = 0x4014000000000000;
}

- (double)pinnedConversationActivityTightShadowLightRadius
{
  if (pinnedConversationActivityTightShadowLightRadius_once_0 != -1)
    dispatch_once(&pinnedConversationActivityTightShadowLightRadius_once_0, &__block_literal_global_60_0);
  return *(double *)&pinnedConversationActivityTightShadowLightRadius_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityTightShadowLightRadius__block_invoke()
{
  pinnedConversationActivityTightShadowLightRadius_sBehavior_0 = 0x3FF0000000000000;
}

- (double)pinnedConversationActivityTightShadowDarkRadius
{
  if (pinnedConversationActivityTightShadowDarkRadius_once_0 != -1)
    dispatch_once(&pinnedConversationActivityTightShadowDarkRadius_once_0, &__block_literal_global_61_0);
  return *(double *)&pinnedConversationActivityTightShadowDarkRadius_sBehavior_0;
}

void __66__CKUIBehaviorMac_pinnedConversationActivityTightShadowDarkRadius__block_invoke()
{
  pinnedConversationActivityTightShadowDarkRadius_sBehavior_0 = 0x3FF0000000000000;
}

- (double)pinnedConversationActivityBroadShadowLightOpacity
{
  if (pinnedConversationActivityBroadShadowLightOpacity_once_0 != -1)
    dispatch_once(&pinnedConversationActivityBroadShadowLightOpacity_once_0, &__block_literal_global_62_0);
  return *(double *)&pinnedConversationActivityBroadShadowLightOpacity_sBehavior_0;
}

void __68__CKUIBehaviorMac_pinnedConversationActivityBroadShadowLightOpacity__block_invoke()
{
  pinnedConversationActivityBroadShadowLightOpacity_sBehavior_0 = 0x3FBEB851EB851EB8;
}

- (double)pinnedConversationActivityBroadShadowDarkOpacity
{
  if (pinnedConversationActivityBroadShadowDarkOpacity_once_0 != -1)
    dispatch_once(&pinnedConversationActivityBroadShadowDarkOpacity_once_0, &__block_literal_global_63_1);
  return *(double *)&pinnedConversationActivityBroadShadowDarkOpacity_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityBroadShadowDarkOpacity__block_invoke()
{
  pinnedConversationActivityBroadShadowDarkOpacity_sBehavior_0 = 0x3FD47AE147AE147BLL;
}

- (double)pinnedConversationActivityTightShadowLightOpacity
{
  if (pinnedConversationActivityTightShadowLightOpacity_once_0 != -1)
    dispatch_once(&pinnedConversationActivityTightShadowLightOpacity_once_0, &__block_literal_global_64_0);
  return *(double *)&pinnedConversationActivityTightShadowLightOpacity_sBehavior_0;
}

void __68__CKUIBehaviorMac_pinnedConversationActivityTightShadowLightOpacity__block_invoke()
{
  pinnedConversationActivityTightShadowLightOpacity_sBehavior_0 = 0x3FC3333333333333;
}

- (double)pinnedConversationActivityTightShadowDarkOpacity
{
  if (pinnedConversationActivityTightShadowDarkOpacity_once_0 != -1)
    dispatch_once(&pinnedConversationActivityTightShadowDarkOpacity_once_0, &__block_literal_global_65_2);
  return *(double *)&pinnedConversationActivityTightShadowDarkOpacity_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityTightShadowDarkOpacity__block_invoke()
{
  pinnedConversationActivityTightShadowDarkOpacity_sBehavior_0 = 0x3FC3333333333333;
}

- (CGSize)pinnedConversationActivityBroadShadowLightOffset
{
  double v2;
  double v3;
  CGSize result;

  if (pinnedConversationActivityBroadShadowLightOffset_once_0 != -1)
    dispatch_once(&pinnedConversationActivityBroadShadowLightOffset_once_0, &__block_literal_global_66_2);
  v2 = *(double *)&pinnedConversationActivityBroadShadowLightOffset_sBehavior_1_0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityBroadShadowLightOffset__block_invoke()
{
  pinnedConversationActivityBroadShadowLightOffset_sBehavior_1_0 = 0x4014000000000000;
}

- (CGSize)pinnedConversationActivityBroadShadowDarkOffset
{
  double v2;
  double v3;
  CGSize result;

  if (pinnedConversationActivityBroadShadowDarkOffset_once_0 != -1)
    dispatch_once(&pinnedConversationActivityBroadShadowDarkOffset_once_0, &__block_literal_global_67_1);
  v2 = *(double *)&pinnedConversationActivityBroadShadowDarkOffset_sBehavior_1_0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

void __66__CKUIBehaviorMac_pinnedConversationActivityBroadShadowDarkOffset__block_invoke()
{
  pinnedConversationActivityBroadShadowDarkOffset_sBehavior_1_0 = 0x4014000000000000;
}

- (CGSize)pinnedConversationActivityTightShadowLightOffset
{
  double v2;
  double v3;
  CGSize result;

  if (pinnedConversationActivityTightShadowLightOffset_once_0 != -1)
    dispatch_once(&pinnedConversationActivityTightShadowLightOffset_once_0, &__block_literal_global_68_1);
  v3 = *((double *)&pinnedConversationActivityTightShadowLightOffset_sBehavior_0 + 1);
  v2 = *(double *)&pinnedConversationActivityTightShadowLightOffset_sBehavior_0;
  result.height = v3;
  result.width = v2;
  return result;
}

__n128 __67__CKUIBehaviorMac_pinnedConversationActivityTightShadowLightOffset__block_invoke()
{
  __n128 result;

  result = *(__n128 *)MEMORY[0x1E0C9D820];
  pinnedConversationActivityTightShadowLightOffset_sBehavior_0 = *MEMORY[0x1E0C9D820];
  return result;
}

- (CGSize)pinnedConversationActivityTightShadowDarkOffset
{
  double v2;
  double v3;
  CGSize result;

  if (pinnedConversationActivityTightShadowDarkOffset_once_0 != -1)
    dispatch_once(&pinnedConversationActivityTightShadowDarkOffset_once_0, &__block_literal_global_69_1);
  v3 = *((double *)&pinnedConversationActivityTightShadowDarkOffset_sBehavior_0 + 1);
  v2 = *(double *)&pinnedConversationActivityTightShadowDarkOffset_sBehavior_0;
  result.height = v3;
  result.width = v2;
  return result;
}

__n128 __66__CKUIBehaviorMac_pinnedConversationActivityTightShadowDarkOffset__block_invoke()
{
  __n128 result;

  result = *(__n128 *)MEMORY[0x1E0C9D820];
  pinnedConversationActivityTightShadowDarkOffset_sBehavior_0 = *MEMORY[0x1E0C9D820];
  return result;
}

- (double)conversationListSenderToDateHorizontalPadding
{
  if (conversationListSenderToDateHorizontalPadding_once_0 != -1)
    dispatch_once(&conversationListSenderToDateHorizontalPadding_once_0, &__block_literal_global_70_1);
  return *(double *)&conversationListSenderToDateHorizontalPadding_sBehavior_0;
}

void __64__CKUIBehaviorMac_conversationListSenderToDateHorizontalPadding__block_invoke()
{
  conversationListSenderToDateHorizontalPadding_sBehavior_0 = 0x4020000000000000;
}

- (UIEdgeInsets)conversationListPinnedCellTitleLabelVerticalPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (conversationListPinnedCellTitleLabelVerticalPadding_once_0 != -1)
    dispatch_once(&conversationListPinnedCellTitleLabelVerticalPadding_once_0, &__block_literal_global_71_2);
  v2 = *(double *)&conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_0_0;
  v3 = *(double *)&conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_2_0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

void __70__CKUIBehaviorMac_conversationListPinnedCellTitleLabelVerticalPadding__block_invoke()
{
  conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_0_0 = 0x4018000000000000;
  conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_2_0 = 0x4024000000000000;
}

- (double)conversationListCellRoundSelectorLeftInset
{
  void *v2;
  int IsBoldTextEnabled;
  double v4;
  double v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  double v9;
  BOOL v11;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = CKUserPreferenceFontSize();
  v5 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("None");
  v8 = v7;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellRoundSelectorLeftInset_sContentSizeCategory_conversationListCellRoundSelectorLeftInset_0, (UIContentSizeCategory)v2)|| conversationListCellRoundSelectorLeftInset_sIsBoldTextEnabled_conversationListCellRoundSelectorLeftInset_0 != IsBoldTextEnabled|| (*(double *)&conversationListCellRoundSelectorLeftInset_sTextFontSize_conversationListCellRoundSelectorLeftInset_0 == v4? (v11 = *(double *)&conversationListCellRoundSelectorLeftInset_sCustomTextFontSize_conversationListCellRoundSelectorLeftInset_0 == v5): (v11 = 0), !v11|| (objc_msgSend((id)conversationListCellRoundSelectorLeftInset_sCustomTextFontName_conversationListCellRoundSelectorLeftInset_0, "isEqualToString:", v8, *(double *)&conversationListCellRoundSelectorLeftInset_sTextFontSize_conversationListCellRoundSelectorLeftInset_0, *(double *)&conversationListCellRoundSelectorLeftInset_sCustomTextFontSize_conversationListCellRoundSelectorLeftInset_0) & 1) == 0))
  {
    conversationListCellRoundSelectorLeftInset_sBehavior = 0x4024000000000000;
    objc_storeStrong((id *)&conversationListCellRoundSelectorLeftInset_sContentSizeCategory_conversationListCellRoundSelectorLeftInset_0, v2);
    conversationListCellRoundSelectorLeftInset_sIsBoldTextEnabled_conversationListCellRoundSelectorLeftInset_0 = IsBoldTextEnabled;
    conversationListCellRoundSelectorLeftInset_sTextFontSize_conversationListCellRoundSelectorLeftInset_0 = *(_QWORD *)&v4;
    conversationListCellRoundSelectorLeftInset_sCustomTextFontSize_conversationListCellRoundSelectorLeftInset_0 = *(_QWORD *)&v5;
    objc_storeStrong((id *)&conversationListCellRoundSelectorLeftInset_sCustomTextFontName_conversationListCellRoundSelectorLeftInset_0, v7);
  }
  v9 = *(double *)&conversationListCellRoundSelectorLeftInset_sBehavior;

  return v9;
}

- (double)conversationListCellRoundSelectorRightInset
{
  void *v2;
  int IsBoldTextEnabled;
  double v4;
  double v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  double v9;
  BOOL v11;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = CKUserPreferenceFontSize();
  v5 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("None");
  v8 = v7;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellRoundSelectorRightInset_sContentSizeCategory_conversationListCellRoundSelectorRightInset_0, (UIContentSizeCategory)v2)|| conversationListCellRoundSelectorRightInset_sIsBoldTextEnabled_conversationListCellRoundSelectorRightInset_0 != IsBoldTextEnabled|| (*(double *)&conversationListCellRoundSelectorRightInset_sTextFontSize_conversationListCellRoundSelectorRightInset_0 == v4? (v11 = *(double *)&conversationListCellRoundSelectorRightInset_sCustomTextFontSize_conversationListCellRoundSelectorRightInset_0 == v5): (v11 = 0), !v11|| (objc_msgSend((id)conversationListCellRoundSelectorRightInset_sCustomTextFontName_conversationListCellRoundSelectorRightInset_0, "isEqualToString:", v8, *(double *)&conversationListCellRoundSelectorRightInset_sTextFontSize_conversationListCellRoundSelectorRightInset_0, *(double *)&conversationListCellRoundSelectorRightInset_sCustomTextFontSize_conversationListCellRoundSelectorRightInset_0) & 1) == 0))
  {
    conversationListCellRoundSelectorRightInset_sBehavior = 0x4024000000000000;
    objc_storeStrong((id *)&conversationListCellRoundSelectorRightInset_sContentSizeCategory_conversationListCellRoundSelectorRightInset_0, v2);
    conversationListCellRoundSelectorRightInset_sIsBoldTextEnabled_conversationListCellRoundSelectorRightInset_0 = IsBoldTextEnabled;
    conversationListCellRoundSelectorRightInset_sTextFontSize_conversationListCellRoundSelectorRightInset_0 = *(_QWORD *)&v4;
    conversationListCellRoundSelectorRightInset_sCustomTextFontSize_conversationListCellRoundSelectorRightInset_0 = *(_QWORD *)&v5;
    objc_storeStrong((id *)&conversationListCellRoundSelectorRightInset_sCustomTextFontName_conversationListCellRoundSelectorRightInset_0, v7);
  }
  v9 = *(double *)&conversationListCellRoundSelectorRightInset_sBehavior;

  return v9;
}

- (double)conversationListCellLeftMargin
{
  void *v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v15;

  CKPreferredContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellLeftMargin_sContentSizeCategory_conversationListCellLeftMargin_0, (UIContentSizeCategory)v3)|| conversationListCellLeftMargin_sIsBoldTextEnabled_conversationListCellLeftMargin_0 != IsBoldTextEnabled|| (*(double *)&conversationListCellLeftMargin_sTextFontSize_conversationListCellLeftMargin_0 == v5? (v15 = *(double *)&conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0 == v6): (v15 = 0), !v15|| (objc_msgSend((id)conversationListCellLeftMargin_sCustomTextFontName_conversationListCellLeftMargin_0, "isEqualToString:", v9, *(double *)&conversationListCellLeftMargin_sTextFontSize_conversationListCellLeftMargin_0, *(double *)&conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0) & 1) == 0))
  {
    -[CKUIBehaviorMac unreadIndicatorTotalMargins](self, "unreadIndicatorTotalMargins");
    v11 = v10;
    -[CKUIBehaviorMac unreadIndicatorImageViewSize](self, "unreadIndicatorImageViewSize");
    *(double *)&conversationListCellLeftMargin_sBehavior_0 = v11 + v12;
    objc_storeStrong((id *)&conversationListCellLeftMargin_sContentSizeCategory_conversationListCellLeftMargin_0, v3);
    conversationListCellLeftMargin_sIsBoldTextEnabled_conversationListCellLeftMargin_0 = IsBoldTextEnabled;
    conversationListCellLeftMargin_sTextFontSize_conversationListCellLeftMargin_0 = *(_QWORD *)&v5;
    conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&conversationListCellLeftMargin_sCustomTextFontName_conversationListCellLeftMargin_0, v8);
  }
  v13 = *(double *)&conversationListCellLeftMargin_sBehavior_0;

  return v13;
}

- (double)conversationListCellRightMargin
{
  void *v2;
  int IsBoldTextEnabled;
  double v4;
  double v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  double v9;
  BOOL v11;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = CKUserPreferenceFontSize();
  v5 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("None");
  v8 = v7;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellRightMargin_sContentSizeCategory_conversationListCellRightMargin_0, (UIContentSizeCategory)v2)|| conversationListCellRightMargin_sIsBoldTextEnabled_conversationListCellRightMargin_0 != IsBoldTextEnabled|| (*(double *)&conversationListCellRightMargin_sTextFontSize_conversationListCellRightMargin_0 == v4? (v11 = *(double *)&conversationListCellRightMargin_sCustomTextFontSize_conversationListCellRightMargin_0 == v5): (v11 = 0), !v11|| (objc_msgSend((id)conversationListCellRightMargin_sCustomTextFontName_conversationListCellRightMargin_0, "isEqualToString:", v8, *(double *)&conversationListCellRightMargin_sTextFontSize_conversationListCellRightMargin_0, *(double *)&conversationListCellRightMargin_sCustomTextFontSize_conversationListCellRightMargin_0) & 1) == 0))
  {
    conversationListCellRightMargin_sBehavior_0 = 0x4024000000000000;
    objc_storeStrong((id *)&conversationListCellRightMargin_sContentSizeCategory_conversationListCellRightMargin_0, v2);
    conversationListCellRightMargin_sIsBoldTextEnabled_conversationListCellRightMargin_0 = IsBoldTextEnabled;
    conversationListCellRightMargin_sTextFontSize_conversationListCellRightMargin_0 = *(_QWORD *)&v4;
    conversationListCellRightMargin_sCustomTextFontSize_conversationListCellRightMargin_0 = *(_QWORD *)&v5;
    objc_storeStrong((id *)&conversationListCellRightMargin_sCustomTextFontName_conversationListCellRightMargin_0, v7);
  }
  v9 = *(double *)&conversationListCellRightMargin_sBehavior_0;

  return v9;
}

- (CGSize)unreadIndicatorImageViewSize
{
  double v2;
  double v3;
  CGSize result;

  if (unreadIndicatorImageViewSize_once_0 != -1)
    dispatch_once(&unreadIndicatorImageViewSize_once_0, &__block_literal_global_72_3);
  v2 = *(double *)&unreadIndicatorImageViewSize_sBehavior_0_0;
  v3 = *(double *)&unreadIndicatorImageViewSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __47__CKUIBehaviorMac_unreadIndicatorImageViewSize__block_invoke()
{
  unreadIndicatorImageViewSize_sBehavior_0_0 = 0x4022000000000000;
  unreadIndicatorImageViewSize_sBehavior_1_0 = 0x4022000000000000;
}

- (double)unreadIndicatorTotalMargins
{
  if (unreadIndicatorTotalMargins_once != -1)
    dispatch_once(&unreadIndicatorTotalMargins_once, &__block_literal_global_73_2);
  return *(double *)&unreadIndicatorTotalMargins_sBehavior;
}

void __46__CKUIBehaviorMac_unreadIndicatorTotalMargins__block_invoke()
{
  unreadIndicatorTotalMargins_sBehavior = 0x4022000000000000;
}

- (double)conversationListContactImageTrailingSpace
{
  if (conversationListContactImageTrailingSpace_once_0 != -1)
    dispatch_once(&conversationListContactImageTrailingSpace_once_0, &__block_literal_global_74_1);
  return *(double *)&conversationListContactImageTrailingSpace_sBehavior_0;
}

void __60__CKUIBehaviorMac_conversationListContactImageTrailingSpace__block_invoke()
{
  conversationListContactImageTrailingSpace_sBehavior_0 = 0x4018000000000000;
}

- (double)legacyMacAppMinConversationListWidth
{
  if (legacyMacAppMinConversationListWidth_once != -1)
    dispatch_once(&legacyMacAppMinConversationListWidth_once, &__block_literal_global_75_1);
  return *(double *)&legacyMacAppMinConversationListWidth_sBehavior;
}

void __55__CKUIBehaviorMac_legacyMacAppMinConversationListWidth__block_invoke()
{
  legacyMacAppMinConversationListWidth_sBehavior = 0x4056000000000000;
}

- (double)legacyMacAppSnapToMinConversationListWidth
{
  if (legacyMacAppSnapToMinConversationListWidth_once != -1)
    dispatch_once(&legacyMacAppSnapToMinConversationListWidth_once, &__block_literal_global_76_4);
  return *(double *)&legacyMacAppSnapToMinConversationListWidth_sBehavior;
}

void __61__CKUIBehaviorMac_legacyMacAppSnapToMinConversationListWidth__block_invoke()
{
  legacyMacAppSnapToMinConversationListWidth_sBehavior = 0x4070E00000000000;
}

- (double)conversationListDragDistanceThreshold
{
  if (conversationListDragDistanceThreshold_once != -1)
    dispatch_once(&conversationListDragDistanceThreshold_once, &__block_literal_global_77_1);
  return *(double *)&conversationListDragDistanceThreshold_sBehavior;
}

void __56__CKUIBehaviorMac_conversationListDragDistanceThreshold__block_invoke()
{
  conversationListDragDistanceThreshold_sBehavior = 0x402E000000000000;
}

- (CGSize)minConversationListWidthComposeButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (minConversationListWidthComposeButtonSize_once != -1)
    dispatch_once(&minConversationListWidthComposeButtonSize_once, &__block_literal_global_78_1);
  v2 = *(double *)&minConversationListWidthComposeButtonSize_sBehavior_0;
  v3 = *(double *)&minConversationListWidthComposeButtonSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __60__CKUIBehaviorMac_minConversationListWidthComposeButtonSize__block_invoke()
{
  minConversationListWidthComposeButtonSize_sBehavior_0 = 0x4046000000000000;
  minConversationListWidthComposeButtonSize_sBehavior_1 = 0x403C000000000000;
}

- (double)minConversationListWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CKUIBehaviorMac_minConversationListWidth__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (minConversationListWidth_once_0 != -1)
    dispatch_once(&minConversationListWidth_once_0, block);
  return *(double *)&minConversationListWidth_sBehavior_0;
}

double __43__CKUIBehaviorMac_minConversationListWidth__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "conversationListCellRoundSelectorLeftInset");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "conversationListCellLeftMargin");
  v5 = v3 + v4;
  objc_msgSend(*(id *)(a1 + 32), "conversationListContactImageDiameter");
  v7 = v5 + v6;
  objc_msgSend(*(id *)(a1 + 32), "conversationListContactImageTrailingSpace");
  v9 = v7 + v8;
  objc_msgSend(*(id *)(a1 + 32), "conversationListCellRightMargin");
  v11 = v9 + v10;
  objc_msgSend(*(id *)(a1 + 32), "conversationListCellRoundSelectorRightInset");
  result = v11 + v12;
  minConversationListWidth_sBehavior_0 = *(_QWORD *)&result;
  return result;
}

- (double)snapToMinConversationListWidth
{
  if (snapToMinConversationListWidth_once != -1)
    dispatch_once(&snapToMinConversationListWidth_once, &__block_literal_global_79_1);
  return *(double *)&snapToMinConversationListWidth_sBehavior;
}

void __49__CKUIBehaviorMac_snapToMinConversationListWidth__block_invoke()
{
  snapToMinConversationListWidth_sBehavior = 0x4074000000000000;
}

- (double)snapToMinConversationListCellWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CKUIBehaviorMac_snapToMinConversationListCellWidth__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (snapToMinConversationListCellWidth_once != -1)
    dispatch_once(&snapToMinConversationListCellWidth_once, block);
  return *(double *)&snapToMinConversationListCellWidth_sBehavior;
}

double __53__CKUIBehaviorMac_snapToMinConversationListCellWidth__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "snapToMinConversationListWidth");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "conversationListCellRoundSelectorLeftInset");
  v5 = v3 - v4;
  objc_msgSend(*(id *)(a1 + 32), "conversationListCellRoundSelectorRightInset");
  result = v5 - v6;
  snapToMinConversationListCellWidth_sBehavior = *(_QWORD *)&result;
  return result;
}

- (double)defaultConversationListWidth
{
  if (defaultConversationListWidth_once != -1)
    dispatch_once(&defaultConversationListWidth_once, &__block_literal_global_80_1);
  return *(double *)&defaultConversationListWidth_sBehavior;
}

void __47__CKUIBehaviorMac_defaultConversationListWidth__block_invoke()
{
  defaultConversationListWidth_sBehavior = 0x4074000000000000;
}

- (double)maxConversationListWidth
{
  if (maxConversationListWidth_once_0 != -1)
    dispatch_once(&maxConversationListWidth_once_0, &__block_literal_global_81_0);
  return *(double *)&maxConversationListWidth_sBehavior_0;
}

void __43__CKUIBehaviorMac_maxConversationListWidth__block_invoke()
{
  maxConversationListWidth_sBehavior_0 = 0x407F400000000000;
}

- (double)conversationListMinimumWidthForHiddenContactImage
{
  if (conversationListMinimumWidthForHiddenContactImage_once_0 != -1)
    dispatch_once(&conversationListMinimumWidthForHiddenContactImage_once_0, &__block_literal_global_82_1);
  return *(double *)&conversationListMinimumWidthForHiddenContactImage_sBehavior_0;
}

void __68__CKUIBehaviorMac_conversationListMinimumWidthForHiddenContactImage__block_invoke()
{
  conversationListMinimumWidthForHiddenContactImage_sBehavior_0 = 0x406F400000000000;
}

- (double)conversationListPinnedCellSelectedBackgroundCornerRadius
{
  if (conversationListPinnedCellSelectedBackgroundCornerRadius_once_0 != -1)
    dispatch_once(&conversationListPinnedCellSelectedBackgroundCornerRadius_once_0, &__block_literal_global_83_1);
  return *(double *)&conversationListPinnedCellSelectedBackgroundCornerRadius_sBehavior_0;
}

void __75__CKUIBehaviorMac_conversationListPinnedCellSelectedBackgroundCornerRadius__block_invoke()
{
  conversationListPinnedCellSelectedBackgroundCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)expandedToolbarHeightForMiiC
{
  if (expandedToolbarHeightForMiiC_once != -1)
    dispatch_once(&expandedToolbarHeightForMiiC_once, &__block_literal_global_84_3);
  return *(double *)&expandedToolbarHeightForMiiC_sBehavior;
}

void __47__CKUIBehaviorMac_expandedToolbarHeightForMiiC__block_invoke()
{
  expandedToolbarHeightForMiiC_sBehavior = 0x404E000000000000;
}

- (BOOL)showsHoverToDeleteButton
{
  if (showsHoverToDeleteButton_once_0 != -1)
    dispatch_once(&showsHoverToDeleteButton_once_0, &__block_literal_global_85_1);
  return 0;
}

- (BOOL)showsHoverToDeleteButtonForNewCompose
{
  if (showsHoverToDeleteButtonForNewCompose_once_0 != -1)
    dispatch_once(&showsHoverToDeleteButtonForNewCompose_once_0, &__block_literal_global_86_1);
  return showsHoverToDeleteButtonForNewCompose_sBehavior;
}

void __56__CKUIBehaviorMac_showsHoverToDeleteButtonForNewCompose__block_invoke()
{
  showsHoverToDeleteButtonForNewCompose_sBehavior = 1;
}

- (BOOL)supportsOrbPreviewsInConversationList
{
  if (supportsOrbPreviewsInConversationList_once_0 != -1)
    dispatch_once(&supportsOrbPreviewsInConversationList_once_0, &__block_literal_global_87_0);
  return 0;
}

- (BOOL)searchControllerObscuresConversationList
{
  if (searchControllerObscuresConversationList_once_0 != -1)
    dispatch_once(&searchControllerObscuresConversationList_once_0, &__block_literal_global_88_1);
  return 0;
}

- (BOOL)shouldShowAvatarForWidth:(double)a3
{
  _BOOL4 v4;

  v4 = -[CKUIBehaviorPad canShowContactPhotosInConversationList](self, "canShowContactPhotosInConversationList", a3);
  if (v4)
    LOBYTE(v4) = -[CKUIBehaviorMac contactPhotosEnabled](self, "contactPhotosEnabled");
  return v4;
}

- (BOOL)contactPhotosEnabled
{
  return 1;
}

- (UIEdgeInsets)toFieldScrollViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (toFieldScrollViewInsets_once_0 != -1)
    dispatch_once(&toFieldScrollViewInsets_once_0, &__block_literal_global_89_2);
  v2 = *(double *)&toFieldScrollViewInsets_sBehavior_0;
  v3 = *(double *)&toFieldScrollViewInsets_sBehavior_1;
  v4 = *(double *)&toFieldScrollViewInsets_sBehavior_3;
  v5 = 0.0;
  result.right = v4;
  result.bottom = v5;
  result.left = v3;
  result.top = v2;
  return result;
}

void __42__CKUIBehaviorMac_toFieldScrollViewInsets__block_invoke()
{
  toFieldScrollViewInsets_sBehavior_0 = 0x4004000000000000;
  toFieldScrollViewInsets_sBehavior_1 = 0x401E000000000000;
  toFieldScrollViewInsets_sBehavior_3 = 0x4024000000000000;
}

- (double)toFieldInterItemSpacing
{
  if (toFieldInterItemSpacing_once != -1)
    dispatch_once(&toFieldInterItemSpacing_once, &__block_literal_global_90_0);
  return *(double *)&toFieldInterItemSpacing_sBehavior;
}

void __42__CKUIBehaviorMac_toFieldInterItemSpacing__block_invoke()
{
  toFieldInterItemSpacing_sBehavior = 0x4014000000000000;
}

- (double)toFieldYOffset
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CKUIBehaviorMac_toFieldYOffset__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (toFieldYOffset_once != -1)
    dispatch_once(&toFieldYOffset_once, block);
  return *(double *)&toFieldYOffset_sBehavior;
}

double __33__CKUIBehaviorMac_toFieldYOffset__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "macAppKitToolbarHeight");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "macAppKitToolbarHeight");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "toFieldPreferredHeight");
  result = (v3 - fmin(v5, v6)) * 0.5;
  toFieldYOffset_sBehavior = *(_QWORD *)&result;
  return result;
}

- (double)toFieldXOffset
{
  if (toFieldXOffset_once != -1)
    dispatch_once(&toFieldXOffset_once, &__block_literal_global_91_2);
  return *(double *)&toFieldXOffset_sBehavior;
}

void __33__CKUIBehaviorMac_toFieldXOffset__block_invoke()
{
  toFieldXOffset_sBehavior = 0x4012000000000000;
}

- (BOOL)presentsAutocompleteInAPopover
{
  if (presentsAutocompleteInAPopover_once_0 != -1)
    dispatch_once(&presentsAutocompleteInAPopover_once_0, &__block_literal_global_92_1);
  return presentsAutocompleteInAPopover_sBehavior;
}

void __49__CKUIBehaviorMac_presentsAutocompleteInAPopover__block_invoke()
{
  presentsAutocompleteInAPopover_sBehavior = 1;
}

- (id)audioHintFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioHintFont_sContentSizeCategory_audioHintFont_0, (UIContentSizeCategory)v2)|| audioHintFont_sIsIncreaseContrastEnabled_audioHintFont_0 != v3|| audioHintFont_sIsBoldTextEnabled_audioHintFont_0 != IsBoldTextEnabled|| (v10 = audioHintFont_sTextFontSize_audioHintFont_0, *(double *)&audioHintFont_sTextFontSize_audioHintFont_0 != v5)|| (v10 = audioHintFont_sCustomTextFontSize_audioHintFont_0, *(double *)&audioHintFont_sCustomTextFontSize_audioHintFont_0 != v6)|| (objc_msgSend((id)audioHintFont_sCustomTextFontName_audioHintFont_0, "isEqualToString:", v9, *(double *)&audioHintFont_sCustomTextFontSize_audioHintFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)audioHintFont_sBehavior_0;
    audioHintFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&audioHintFont_sContentSizeCategory_audioHintFont_0, v2);
    audioHintFont_sIsIncreaseContrastEnabled_audioHintFont_0 = v3;
    audioHintFont_sIsBoldTextEnabled_audioHintFont_0 = IsBoldTextEnabled;
    audioHintFont_sTextFontSize_audioHintFont_0 = *(_QWORD *)&v5;
    audioHintFont_sCustomTextFontSize_audioHintFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&audioHintFont_sCustomTextFontName_audioHintFont_0, v8);
  }
  v13 = (id)audioHintFont_sBehavior_0;

  return v13;
}

- (BOOL)isSendButtonEnabledOnPlatform
{
  if (isSendButtonEnabledOnPlatform_once_0 != -1)
    dispatch_once(&isSendButtonEnabledOnPlatform_once_0, &__block_literal_global_93_1);
  return 0;
}

- (BOOL)isEntryViewInputAccessory
{
  if (isEntryViewInputAccessory_once_0 != -1)
    dispatch_once(&isEntryViewInputAccessory_once_0, &__block_literal_global_94_1);
  return 0;
}

- (BOOL)isEntryViewFirstResponderOnViewAppearance
{
  if (isEntryViewFirstResponderOnViewAppearance_once_0 != -1)
    dispatch_once(&isEntryViewFirstResponderOnViewAppearance_once_0, &__block_literal_global_95_1);
  return isEntryViewFirstResponderOnViewAppearance_sBehavior;
}

void __60__CKUIBehaviorMac_isEntryViewFirstResponderOnViewAppearance__block_invoke()
{
  isEntryViewFirstResponderOnViewAppearance_sBehavior = 1;
}

- (BOOL)entryViewFollowsKeyboardLayoutGuide
{
  if (entryViewFollowsKeyboardLayoutGuide_once_0 != -1)
    dispatch_once(&entryViewFollowsKeyboardLayoutGuide_once_0, &__block_literal_global_96_2);
  return 0;
}

- (BOOL)isEntryViewCollapsable
{
  if (isEntryViewCollapsable_once_0 != -1)
    dispatch_once(&isEntryViewCollapsable_once_0, &__block_literal_global_97_0);
  return 0;
}

- (BOOL)entryViewSupportsPhotoButton
{
  if (entryViewSupportsPhotoButton_once_0 != -1)
    dispatch_once(&entryViewSupportsPhotoButton_once_0, &__block_literal_global_98);
  return 0;
}

- (BOOL)browserButtonShouldUseMenu
{
  if (browserButtonShouldUseMenu_once_0 != -1)
    dispatch_once(&browserButtonShouldUseMenu_once_0, &__block_literal_global_99_2);
  return browserButtonShouldUseMenu_sBehavior;
}

void __45__CKUIBehaviorMac_browserButtonShouldUseMenu__block_invoke()
{
  browserButtonShouldUseMenu_sBehavior = 1;
}

- (UIEdgeInsets)messageEntryContentViewSendLaterDateInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (messageEntryContentViewSendLaterDateInsets_once_0 != -1)
    dispatch_once(&messageEntryContentViewSendLaterDateInsets_once_0, &__block_literal_global_100_0);
  v2 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_0_0;
  v3 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_1_0;
  v4 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_2_0;
  v5 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __61__CKUIBehaviorMac_messageEntryContentViewSendLaterDateInsets__block_invoke()
{
  messageEntryContentViewSendLaterDateInsets_sBehavior_0_0 = 0x401E000000000000;
  messageEntryContentViewSendLaterDateInsets_sBehavior_1_0 = 0x4024000000000000;
  messageEntryContentViewSendLaterDateInsets_sBehavior_2_0 = 0x401E000000000000;
  messageEntryContentViewSendLaterDateInsets_sBehavior_3_0 = 0x4021000000000000;
}

- (double)sendButtonSize
{
  if (sendButtonSize_once_0 != -1)
    dispatch_once(&sendButtonSize_once_0, &__block_literal_global_101_1);
  return *(double *)&sendButtonSize_sBehavior_0;
}

void __33__CKUIBehaviorMac_sendButtonSize__block_invoke()
{
  sendButtonSize_sBehavior_0 = 0x4035000000000000;
}

- (double)emojiButtonSize
{
  if (emojiButtonSize_once != -1)
    dispatch_once(&emojiButtonSize_once, &__block_literal_global_102_1);
  return *(double *)&emojiButtonSize_sBehavior;
}

void __34__CKUIBehaviorMac_emojiButtonSize__block_invoke()
{
  emojiButtonSize_sBehavior = 0x4037000000000000;
}

- (double)stopButtonSize
{
  if (stopButtonSize_once != -1)
    dispatch_once(&stopButtonSize_once, &__block_literal_global_103_1);
  return *(double *)&stopButtonSize_sBehavior;
}

void __33__CKUIBehaviorMac_stopButtonSize__block_invoke()
{
  stopButtonSize_sBehavior = 0x403B000000000000;
}

- (CGSize)entryViewPlusButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (entryViewPlusButtonSize_once_0 != -1)
    dispatch_once(&entryViewPlusButtonSize_once_0, &__block_literal_global_104_1);
  v2 = *(double *)&entryViewPlusButtonSize_sBehavior_0_0;
  v3 = *(double *)&entryViewPlusButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __42__CKUIBehaviorMac_entryViewPlusButtonSize__block_invoke()
{
  entryViewPlusButtonSize_sBehavior_0_0 = 0x4038000000000000;
  entryViewPlusButtonSize_sBehavior_1_0 = 0x4038000000000000;
}

- (double)entryViewWithSendMenuBottomContentInsetWithKeyboardVisible
{
  if (entryViewWithSendMenuBottomContentInsetWithKeyboardVisible_once_0 != -1)
    dispatch_once(&entryViewWithSendMenuBottomContentInsetWithKeyboardVisible_once_0, &__block_literal_global_105_0);
  return 0.0;
}

- (double)entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible
{
  if (entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible_once_0 != -1)
    dispatch_once(&entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible_once_0, &__block_literal_global_106_0);
  return 0.0;
}

- (int64_t)sendMenuPlusSymbolScale
{
  if (sendMenuPlusSymbolScale_once_0 != -1)
    dispatch_once(&sendMenuPlusSymbolScale_once_0, &__block_literal_global_107_2);
  return sendMenuPlusSymbolScale_sBehavior_0;
}

void __42__CKUIBehaviorMac_sendMenuPlusSymbolScale__block_invoke()
{
  sendMenuPlusSymbolScale_sBehavior_0 = 1;
}

- (double)entryViewCoverMinHeight
{
  if (entryViewCoverMinHeight_once_0 != -1)
    dispatch_once(&entryViewCoverMinHeight_once_0, &__block_literal_global_108_0);
  return *(double *)&entryViewCoverMinHeight_sBehavior_0;
}

void __42__CKUIBehaviorMac_entryViewCoverMinHeight__block_invoke()
{
  entryViewCoverMinHeight_sBehavior_0 = 0x403B000000000000;
}

- (BOOL)entryViewCoverHasOuterStroke
{
  if (entryViewCoverHasOuterStroke_once_0 != -1)
    dispatch_once(&entryViewCoverHasOuterStroke_once_0, &__block_literal_global_109_1);
  return 0;
}

- (UIEdgeInsets)entryViewVerticalTextFieldInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (entryViewVerticalTextFieldInsets_once_0 != -1)
    dispatch_once(&entryViewVerticalTextFieldInsets_once_0, &__block_literal_global_110_1);
  v2 = *(double *)&entryViewVerticalTextFieldInsets_sBehavior_0_0;
  v3 = *(double *)&entryViewVerticalTextFieldInsets_sBehavior_2_0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

void __51__CKUIBehaviorMac_entryViewVerticalTextFieldInsets__block_invoke()
{
  entryViewVerticalTextFieldInsets_sBehavior_0_0 = 0x4014000000000000;
  entryViewVerticalTextFieldInsets_sBehavior_2_0 = 0x4014000000000000;
}

- (UIEdgeInsets)entryViewVerticalCoverInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (entryViewVerticalCoverInsets_once_0 != -1)
    dispatch_once(&entryViewVerticalCoverInsets_once_0, &__block_literal_global_111_1);
  v2 = *(double *)&entryViewVerticalCoverInsets_sBehavior_0_0;
  v3 = *(double *)&entryViewVerticalCoverInsets_sBehavior_2_0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

void __47__CKUIBehaviorMac_entryViewVerticalCoverInsets__block_invoke()
{
  entryViewVerticalCoverInsets_sBehavior_0_0 = 0x4028000000000000;
  entryViewVerticalCoverInsets_sBehavior_2_0 = 0x4030000000000000;
}

- (double)entryViewCoverHorizontalMargin
{
  if (entryViewCoverHorizontalMargin_once != -1)
    dispatch_once(&entryViewCoverHorizontalMargin_once, &__block_literal_global_112_1);
  return *(double *)&entryViewCoverHorizontalMargin_sBehavior;
}

void __49__CKUIBehaviorMac_entryViewCoverHorizontalMargin__block_invoke()
{
  entryViewCoverHorizontalMargin_sBehavior = 0x4030000000000000;
}

- (double)entryViewMaxHeight
{
  if (entryViewMaxHeight_once_0 != -1)
    dispatch_once(&entryViewMaxHeight_once_0, &__block_literal_global_113_1);
  return *(double *)&entryViewMaxHeight_sBehavior_0;
}

void __37__CKUIBehaviorMac_entryViewMaxHeight__block_invoke()
{
  entryViewMaxHeight_sBehavior_0 = 0x4072C00000000000;
}

- (id)entryViewAudioButtonName
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CKUIBehaviorMac_entryViewAudioButtonName__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (entryViewAudioButtonName_once != -1)
    dispatch_once(&entryViewAudioButtonName_once, block);
  return (id)entryViewAudioButtonName_sBehavior_0;
}

void __43__CKUIBehaviorMac_entryViewAudioButtonName__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "audioButtonName");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)entryViewAudioButtonName_sBehavior_0;
  entryViewAudioButtonName_sBehavior_0 = v1;

}

- (BOOL)entryViewSupportsPlusButton
{
  if (entryViewSupportsPlusButton_once_0 != -1)
    dispatch_once(&entryViewSupportsPlusButton_once_0, &__block_literal_global_114_1);
  return entryViewSupportsPlusButton_sBehavior_0;
}

void __46__CKUIBehaviorMac_entryViewSupportsPlusButton__block_invoke()
{
  entryViewSupportsPlusButton_sBehavior_0 = 1;
}

- (BOOL)entryViewSupportsBrowserButton
{
  if (entryViewSupportsBrowserButton_once_0 != -1)
    dispatch_once(&entryViewSupportsBrowserButton_once_0, &__block_literal_global_115_2);
  return 0;
}

- (id)audioButtonName
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAudioMessagesEntryViewRecordingEnabled");

  if (v3)
    return CFSTR("EntryViewWaveformImageMac");
  else
    return CFSTR("waveform");
}

- (UIEdgeInsets)messageEntryContentViewSendLaterInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (messageEntryContentViewSendLaterInsets_once_0 != -1)
    dispatch_once(&messageEntryContentViewSendLaterInsets_once_0, &__block_literal_global_120_1);
  v2 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_0_0;
  v3 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_1_0;
  v4 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_2_0;
  v5 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __57__CKUIBehaviorMac_messageEntryContentViewSendLaterInsets__block_invoke()
{
  messageEntryContentViewSendLaterInsets_sBehavior_0_0 = 0x401C000000000000;
  messageEntryContentViewSendLaterInsets_sBehavior_1_0 = 0x401C000000000000;
  messageEntryContentViewSendLaterInsets_sBehavior_2_0 = 0x401E000000000000;
  messageEntryContentViewSendLaterInsets_sBehavior_3_0 = 0x401C000000000000;
}

- (double)entryViewMaxSendLaterHeight
{
  if (entryViewMaxSendLaterHeight_once_0 != -1)
    dispatch_once(&entryViewMaxSendLaterHeight_once_0, &__block_literal_global_121_3);
  return *(double *)&entryViewMaxSendLaterHeight_sBehavior_0;
}

void __46__CKUIBehaviorMac_entryViewMaxSendLaterHeight__block_invoke()
{
  entryViewMaxSendLaterHeight_sBehavior_0 = 0x403B000000000000;
}

- (id)entryViewAppButtonName
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)entryViewAppButtonName_sContentSizeCategory_entryViewAppButtonName_0, (UIContentSizeCategory)v2)|| entryViewAppButtonName_sIsIncreaseContrastEnabled_entryViewAppButtonName_0 != v3|| entryViewAppButtonName_sIsBoldTextEnabled_entryViewAppButtonName_0 != IsBoldTextEnabled|| *(double *)&entryViewAppButtonName_sTextFontSize_entryViewAppButtonName_0 != v5|| *(double *)&entryViewAppButtonName_sCustomTextFontSize_entryViewAppButtonName_0 != v6|| (objc_msgSend((id)entryViewAppButtonName_sCustomTextFontName_entryViewAppButtonName_0, "isEqualToString:", v9, *(double *)&entryViewAppButtonName_sCustomTextFontSize_entryViewAppButtonName_0) & 1) == 0)
  {
    v10 = (void *)entryViewAppButtonName_sBehavior_0;
    entryViewAppButtonName_sBehavior_0 = (uint64_t)CFSTR("appstore.capsule.2.fill");

    objc_storeStrong((id *)&entryViewAppButtonName_sContentSizeCategory_entryViewAppButtonName_0, v2);
    entryViewAppButtonName_sIsIncreaseContrastEnabled_entryViewAppButtonName_0 = v3;
    entryViewAppButtonName_sIsBoldTextEnabled_entryViewAppButtonName_0 = IsBoldTextEnabled;
    entryViewAppButtonName_sTextFontSize_entryViewAppButtonName_0 = *(_QWORD *)&v5;
    entryViewAppButtonName_sCustomTextFontSize_entryViewAppButtonName_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&entryViewAppButtonName_sCustomTextFontName_entryViewAppButtonName_0, v8);
  }
  v11 = (id)entryViewAppButtonName_sBehavior_0;

  return v11;
}

- (id)entryViewMacEmojiButtonImage
{
  if (entryViewMacEmojiButtonImage_once != -1)
    dispatch_once(&entryViewMacEmojiButtonImage_once, &__block_literal_global_124);
  return (id)entryViewMacEmojiButtonImage_sBehavior;
}

void __47__CKUIBehaviorMac_entryViewMacEmojiButtonImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("face.grinning"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryViewMacEmojiButtonImage_sBehavior;
  entryViewMacEmojiButtonImage_sBehavior = v0;

}

- (id)entryViewMacCancelButtonName
{
  if (entryViewMacCancelButtonName_once != -1)
    dispatch_once(&entryViewMacCancelButtonName_once, &__block_literal_global_128_0);
  return (id)entryViewMacCancelButtonName_sBehavior;
}

void __47__CKUIBehaviorMac_entryViewMacCancelButtonName__block_invoke()
{
  void *v0;

  v0 = (void *)entryViewMacCancelButtonName_sBehavior;
  entryViewMacCancelButtonName_sBehavior = (uint64_t)CFSTR("mac-cancel");

}

- (id)entryViewMacStopButtonName
{
  if (entryViewMacStopButtonName_once != -1)
    dispatch_once(&entryViewMacStopButtonName_once, &__block_literal_global_131);
  return (id)entryViewMacStopButtonName_sBehavior;
}

void __45__CKUIBehaviorMac_entryViewMacStopButtonName__block_invoke()
{
  void *v0;

  v0 = (void *)entryViewMacStopButtonName_sBehavior;
  entryViewMacStopButtonName_sBehavior = (uint64_t)CFSTR("mac-stop");

}

- (BOOL)forceMinTranscriptMarginInsets
{
  if (forceMinTranscriptMarginInsets_once_0 != -1)
    dispatch_once(&forceMinTranscriptMarginInsets_once_0, &__block_literal_global_134_0);
  return forceMinTranscriptMarginInsets_sBehavior;
}

void __49__CKUIBehaviorMac_forceMinTranscriptMarginInsets__block_invoke()
{
  forceMinTranscriptMarginInsets_sBehavior = 1;
}

- (UIEdgeInsets)entryViewHorizontalCoverInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD block[5];
  UIEdgeInsets result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUIBehaviorMac_entryViewHorizontalCoverInsets__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (entryViewHorizontalCoverInsets_once_0 != -1)
    dispatch_once(&entryViewHorizontalCoverInsets_once_0, block);
  v2 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_0_0;
  v3 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_1_0;
  v4 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_2_0;
  v5 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

uint64_t __49__CKUIBehaviorMac_entryViewHorizontalCoverInsets__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "minTranscriptMarginInsets");
  entryViewHorizontalCoverInsets_sBehavior_0_0 = v2;
  entryViewHorizontalCoverInsets_sBehavior_1_0 = v3;
  entryViewHorizontalCoverInsets_sBehavior_2_0 = v4;
  entryViewHorizontalCoverInsets_sBehavior_3_0 = v5;
  return result;
}

- (double)entryViewAppButtonImagePointSize
{
  if (entryViewAppButtonImagePointSize_once_0 != -1)
    dispatch_once(&entryViewAppButtonImagePointSize_once_0, &__block_literal_global_135_0);
  return *(double *)&entryViewAppButtonImagePointSize_sBehavior_0;
}

void __51__CKUIBehaviorMac_entryViewAppButtonImagePointSize__block_invoke()
{
  entryViewAppButtonImagePointSize_sBehavior_0 = 0x4030000000000000;
}

- (double)entryContentViewTextLeftOffset
{
  if (entryContentViewTextLeftOffset_once_0 != -1)
    dispatch_once(&entryContentViewTextLeftOffset_once_0, &__block_literal_global_136_1);
  return *(double *)&entryContentViewTextLeftOffset_sBehavior_0;
}

void __49__CKUIBehaviorMac_entryContentViewTextLeftOffset__block_invoke()
{
  entryContentViewTextLeftOffset_sBehavior_0 = 0x4018000000000000;
}

- (CGSize)transcriptTypingIndicatorDefaultSize
{
  double v2;
  double v3;
  CGSize result;

  if (transcriptTypingIndicatorDefaultSize_once_0 != -1)
    dispatch_once(&transcriptTypingIndicatorDefaultSize_once_0, &__block_literal_global_137);
  v2 = *(double *)&transcriptTypingIndicatorDefaultSize_sBehavior_0_0;
  v3 = *(double *)&transcriptTypingIndicatorDefaultSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __55__CKUIBehaviorMac_transcriptTypingIndicatorDefaultSize__block_invoke()
{
  transcriptTypingIndicatorDefaultSize_sBehavior_0_0 = 0x404A000000000000;
  transcriptTypingIndicatorDefaultSize_sBehavior_1_0 = 0x403D000000000000;
}

- (CGSize)transcriptTypingIndicatorLargeBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  if (transcriptTypingIndicatorLargeBubbleSize_once_0 != -1)
    dispatch_once(&transcriptTypingIndicatorLargeBubbleSize_once_0, &__block_literal_global_138_3);
  v2 = *(double *)&transcriptTypingIndicatorLargeBubbleSize_sBehavior_0_0;
  v3 = *(double *)&transcriptTypingIndicatorLargeBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __59__CKUIBehaviorMac_transcriptTypingIndicatorLargeBubbleSize__block_invoke()
{
  transcriptTypingIndicatorLargeBubbleSize_sBehavior_0_0 = 0x4046000000000000;
  transcriptTypingIndicatorLargeBubbleSize_sBehavior_1_0 = 0x403B000000000000;
}

- (CGPoint)transcriptTypingIndicatorLargeBubbleGrowOffset
{
  double v2;
  double v3;
  CGPoint result;

  if (transcriptTypingIndicatorLargeBubbleGrowOffset_once_0 != -1)
    dispatch_once(&transcriptTypingIndicatorLargeBubbleGrowOffset_once_0, &__block_literal_global_139_2);
  v2 = *(double *)&transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_0_0;
  v3 = *(double *)&transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_1_0;
  result.y = v3;
  result.x = v2;
  return result;
}

void __65__CKUIBehaviorMac_transcriptTypingIndicatorLargeBubbleGrowOffset__block_invoke()
{
  transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_0_0 = 0x400C000000000000;
  transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_1_0 = 0xC010000000000000;
}

- (CGPoint)transcriptTypingIndicatorLargeBubbleOffset
{
  double v2;
  double v3;
  CGPoint result;

  if (transcriptTypingIndicatorLargeBubbleOffset_once_0 != -1)
    dispatch_once(&transcriptTypingIndicatorLargeBubbleOffset_once_0, &__block_literal_global_140);
  v2 = *(double *)&transcriptTypingIndicatorLargeBubbleOffset_sBehavior_0_0;
  v3 = *(double *)&transcriptTypingIndicatorLargeBubbleOffset_sBehavior_1_0;
  result.y = v3;
  result.x = v2;
  return result;
}

void __61__CKUIBehaviorMac_transcriptTypingIndicatorLargeBubbleOffset__block_invoke()
{
  transcriptTypingIndicatorLargeBubbleOffset_sBehavior_0_0 = 0x4028000000000000;
  transcriptTypingIndicatorLargeBubbleOffset_sBehavior_1_0 = 0xC033000000000000;
}

- (double)paddleOverlayRadius
{
  if (paddleOverlayRadius_once_0 != -1)
    dispatch_once(&paddleOverlayRadius_once_0, &__block_literal_global_141_0);
  return *(double *)&paddleOverlayRadius_sBehavior_0;
}

void __38__CKUIBehaviorMac_paddleOverlayRadius__block_invoke()
{
  paddleOverlayRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)paddleDividerInset
{
  if (paddleDividerInset_once_0 != -1)
    dispatch_once(&paddleDividerInset_once_0, &__block_literal_global_142_1);
  return *(double *)&paddleDividerInset_sBehavior;
}

void __37__CKUIBehaviorMac_paddleDividerInset__block_invoke()
{
  paddleDividerInset_sBehavior = 0x4024000000000000;
}

- (id)mentionsCellNameFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v5, "fontWithDescriptor:size:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)waveformHeight
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CKUIBehaviorMac_waveformHeight__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (waveformHeight_once_0 != -1)
    dispatch_once(&waveformHeight_once_0, block);
  return *(double *)&waveformHeight_sBehavior_0;
}

uint64_t __33__CKUIBehaviorMac_waveformHeight__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "audioWaveformHeight");
  waveformHeight_sBehavior_0 = v2;
  return result;
}

- (double)minimumWaveformHeight
{
  if (minimumWaveformHeight_once_0 != -1)
    dispatch_once(&minimumWaveformHeight_once_0, &__block_literal_global_143);
  return *(double *)&minimumWaveformHeight_sBehavior_0;
}

void __40__CKUIBehaviorMac_minimumWaveformHeight__block_invoke()
{
  minimumWaveformHeight_sBehavior_0 = 0x4010000000000000;
}

- (CGSize)audioProgressViewSize
{
  double v2;
  double v3;
  CGSize result;

  if (audioProgressViewSize_once_0 != -1)
    dispatch_once(&audioProgressViewSize_once_0, &__block_literal_global_144_0);
  v2 = *(double *)&audioProgressViewSize_sBehavior_0_0;
  v3 = *(double *)&audioProgressViewSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __40__CKUIBehaviorMac_audioProgressViewSize__block_invoke()
{
  audioProgressViewSize_sBehavior_0_0 = 0x4036000000000000;
  audioProgressViewSize_sBehavior_1_0 = 0x4036000000000000;
}

- (double)audioWaveformHeight
{
  void *v2;
  int v3;
  double result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRichAudioMessagesEnabled");

  result = 35.0;
  if (!v3)
    return 23.0;
  return result;
}

- (id)appMenuTitleFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)appMenuTitleFont_sContentSizeCategory_appMenuTitleFont, (UIContentSizeCategory)v2)|| appMenuTitleFont_sIsIncreaseContrastEnabled_appMenuTitleFont != v3|| appMenuTitleFont_sIsBoldTextEnabled_appMenuTitleFont != IsBoldTextEnabled|| (v10 = appMenuTitleFont_sTextFontSize_appMenuTitleFont, *(double *)&appMenuTitleFont_sTextFontSize_appMenuTitleFont != v5)|| (v10 = appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont, *(double *)&appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont != v6)|| (objc_msgSend((id)appMenuTitleFont_sCustomTextFontName_appMenuTitleFont, "isEqualToString:", v9, *(double *)&appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)appMenuTitleFont_sBehavior;
    appMenuTitleFont_sBehavior = v11;

    objc_storeStrong((id *)&appMenuTitleFont_sContentSizeCategory_appMenuTitleFont, v2);
    appMenuTitleFont_sIsIncreaseContrastEnabled_appMenuTitleFont = v3;
    appMenuTitleFont_sIsBoldTextEnabled_appMenuTitleFont = IsBoldTextEnabled;
    appMenuTitleFont_sTextFontSize_appMenuTitleFont = *(_QWORD *)&v5;
    appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont = *(_QWORD *)&v6;
    objc_storeStrong((id *)&appMenuTitleFont_sCustomTextFontName_appMenuTitleFont, v8);
  }
  v13 = (id)appMenuTitleFont_sBehavior;

  return v13;
}

- (id)appMenuPhotosIconForTraitCollection:(id)a3
{
  id v3;
  double v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "displayScale");
  if (v4 == 1.0)
    v5 = CFSTR("Mac-PhotosIcon1x");
  else
    v5 = CFSTR("Mac-PhotosIcon2x");
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:compatibleWithTraitCollection:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appMenuEffectsIconForTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:compatibleWithTraitCollection:", CFSTR("Mac-EffectsIcon"), a3);
}

- (id)appMenuHashtagImagesIconForTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:compatibleWithTraitCollection:", CFSTR("Mac-HashtagImagesIcon"), a3);
}

- (id)appMenuAnimojiStickersIconForTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:compatibleWithTraitCollection:", CFSTR("Mac-StickersIcon"), a3);
}

- (id)appMenuEmojiIconForTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:compatibleWithTraitCollection:", CFSTR("Emoji"), a3);
}

- (id)appMenuApplePayIconForTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:compatibleWithTraitCollection:", CFSTR("Mac-ApplePayIcon"), a3);
}

- (double)popoverPadding
{
  if (popoverPadding_once != -1)
    dispatch_once(&popoverPadding_once, &__block_literal_global_159_1);
  return *(double *)&popoverPadding_sBehavior;
}

void __33__CKUIBehaviorMac_popoverPadding__block_invoke()
{
  popoverPadding_sBehavior = 0x401C000000000000;
}

- (double)popoverHeightPadding
{
  if (popoverHeightPadding_once != -1)
    dispatch_once(&popoverHeightPadding_once, &__block_literal_global_160_0);
  return *(double *)&popoverHeightPadding_sBehavior;
}

void __39__CKUIBehaviorMac_popoverHeightPadding__block_invoke()
{
  popoverHeightPadding_sBehavior = 0x4030000000000000;
}

- (double)popOverWidth
{
  if (popOverWidth_once != -1)
    dispatch_once(&popOverWidth_once, &__block_literal_global_161_1);
  return *(double *)&popOverWidth_sBehavior;
}

void __31__CKUIBehaviorMac_popOverWidth__block_invoke()
{
  popOverWidth_sBehavior = 0x406F800000000000;
}

- (double)popOverWidthInDetailsView
{
  if (popOverWidthInDetailsView_once != -1)
    dispatch_once(&popOverWidthInDetailsView_once, &__block_literal_global_162_0);
  return *(double *)&popOverWidthInDetailsView_sBehavior;
}

void __44__CKUIBehaviorMac_popOverWidthInDetailsView__block_invoke()
{
  popOverWidthInDetailsView_sBehavior = 0x4070400000000000;
}

- (double)popOverMaxHeight
{
  if (popOverMaxHeight_once != -1)
    dispatch_once(&popOverMaxHeight_once, &__block_literal_global_163_1);
  return *(double *)&popOverMaxHeight_sBehavior;
}

void __35__CKUIBehaviorMac_popOverMaxHeight__block_invoke()
{
  popOverMaxHeight_sBehavior = 0x4079000000000000;
}

- (double)popOverMaxHeightInDetailsView
{
  if (popOverMaxHeightInDetailsView_once != -1)
    dispatch_once(&popOverMaxHeightInDetailsView_once, &__block_literal_global_164_1);
  return *(double *)&popOverMaxHeightInDetailsView_sBehavior;
}

void __48__CKUIBehaviorMac_popOverMaxHeightInDetailsView__block_invoke()
{
  popOverMaxHeightInDetailsView_sBehavior = 0x406F400000000000;
}

- (double)autocompletePopOverLeftOffset
{
  if (autocompletePopOverLeftOffset_once != -1)
    dispatch_once(&autocompletePopOverLeftOffset_once, &__block_literal_global_165_1);
  return *(double *)&autocompletePopOverLeftOffset_sBehavior;
}

void __48__CKUIBehaviorMac_autocompletePopOverLeftOffset__block_invoke()
{
  autocompletePopOverLeftOffset_sBehavior = 0x4040000000000000;
}

- (id)iosMacDetailsButtonText
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)iosMacDetailsButtonText_sContentSizeCategory_iosMacDetailsButtonText, (UIContentSizeCategory)v2)|| iosMacDetailsButtonText_sIsIncreaseContrastEnabled_iosMacDetailsButtonText != v3|| iosMacDetailsButtonText_sIsBoldTextEnabled_iosMacDetailsButtonText != IsBoldTextEnabled|| *(double *)&iosMacDetailsButtonText_sTextFontSize_iosMacDetailsButtonText != v5|| *(double *)&iosMacDetailsButtonText_sCustomTextFontSize_iosMacDetailsButtonText != v6|| (objc_msgSend((id)iosMacDetailsButtonText_sCustomTextFontName_iosMacDetailsButtonText, "isEqualToString:", v9, *(double *)&iosMacDetailsButtonText_sCustomTextFontSize_iosMacDetailsButtonText) & 1) == 0)
  {
    if (iosMacDetailsButtonText_onceToken != -1)
      dispatch_once(&iosMacDetailsButtonText_onceToken, &__block_literal_global_166_1);
    objc_storeStrong((id *)&iosMacDetailsButtonText_sBehavior, (id)iosMacDetailsButtonText_detailsText);
    objc_storeStrong((id *)&iosMacDetailsButtonText_sContentSizeCategory_iosMacDetailsButtonText, v2);
    iosMacDetailsButtonText_sIsIncreaseContrastEnabled_iosMacDetailsButtonText = v3;
    iosMacDetailsButtonText_sIsBoldTextEnabled_iosMacDetailsButtonText = IsBoldTextEnabled;
    iosMacDetailsButtonText_sTextFontSize_iosMacDetailsButtonText = *(_QWORD *)&v5;
    iosMacDetailsButtonText_sCustomTextFontSize_iosMacDetailsButtonText = *(_QWORD *)&v6;
    objc_storeStrong((id *)&iosMacDetailsButtonText_sCustomTextFontName_iosMacDetailsButtonText, v8);
  }
  v10 = (id)iosMacDetailsButtonText_sBehavior;

  return v10;
}

void __42__CKUIBehaviorMac_iosMacDetailsButtonText__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("MarzipanDetailButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iosMacDetailsButtonText_blueTextColor;
  iosMacDetailsButtonText_blueTextColor = v0;

  v10[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = *MEMORY[0x1E0DC1140];
  v11[0] = v2;
  v11[1] = iosMacDetailsButtonText_blueTextColor;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)iosMacDetailsButtonText_attributes;
  iosMacDetailsButtonText_attributes = v3;

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "initWithString:attributes:", v7, iosMacDetailsButtonText_attributes);
  v9 = (void *)iosMacDetailsButtonText_detailsText;
  iosMacDetailsButtonText_detailsText = v8;

}

- (id)navbarDefaultLabelFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)navbarDefaultLabelFont_sContentSizeCategory_navbarDefaultLabelFont_0, (UIContentSizeCategory)v2)|| navbarDefaultLabelFont_sIsIncreaseContrastEnabled_navbarDefaultLabelFont_0 != v3|| navbarDefaultLabelFont_sIsBoldTextEnabled_navbarDefaultLabelFont_0 != IsBoldTextEnabled|| (v10 = navbarDefaultLabelFont_sTextFontSize_navbarDefaultLabelFont_0, *(double *)&navbarDefaultLabelFont_sTextFontSize_navbarDefaultLabelFont_0 != v5)|| (v10 = navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0, *(double *)&navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0 != v6)|| (objc_msgSend((id)navbarDefaultLabelFont_sCustomTextFontName_navbarDefaultLabelFont_0, "isEqualToString:", v9, *(double *)&navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)navbarDefaultLabelFont_sBehavior_0;
    navbarDefaultLabelFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&navbarDefaultLabelFont_sContentSizeCategory_navbarDefaultLabelFont_0, v2);
    navbarDefaultLabelFont_sIsIncreaseContrastEnabled_navbarDefaultLabelFont_0 = v3;
    navbarDefaultLabelFont_sIsBoldTextEnabled_navbarDefaultLabelFont_0 = IsBoldTextEnabled;
    navbarDefaultLabelFont_sTextFontSize_navbarDefaultLabelFont_0 = *(_QWORD *)&v5;
    navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&navbarDefaultLabelFont_sCustomTextFontName_navbarDefaultLabelFont_0, v8);
  }
  v13 = (id)navbarDefaultLabelFont_sBehavior_0;

  return v13;
}

- (double)marzNavigationBarHeight
{
  if (marzNavigationBarHeight_once != -1)
    dispatch_once(&marzNavigationBarHeight_once, &__block_literal_global_176_1);
  return *(double *)&marzNavigationBarHeight_sBehavior;
}

void __42__CKUIBehaviorMac_marzNavigationBarHeight__block_invoke()
{
  int v0;
  double v1;
  id v2;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "useMacToolbar");
  v1 = 50.0;
  if (v0)
    v1 = 40.0;
  marzNavigationBarHeight_sBehavior = *(_QWORD *)&v1;

}

- (double)macAppKitToolbarHeight
{
  if (macAppKitToolbarHeight_once != -1)
    dispatch_once(&macAppKitToolbarHeight_once, &__block_literal_global_177_0);
  return *(double *)&macAppKitToolbarHeight_sBehavior;
}

void __41__CKUIBehaviorMac_macAppKitToolbarHeight__block_invoke()
{
  macAppKitToolbarHeight_sBehavior = 0x404A000000000000;
}

- (double)macToolbarStoplightButtonsLeadingPadding
{
  if (macToolbarStoplightButtonsLeadingPadding_once != -1)
    dispatch_once(&macToolbarStoplightButtonsLeadingPadding_once, &__block_literal_global_178_3);
  return *(double *)&macToolbarStoplightButtonsLeadingPadding_sBehavior;
}

void __59__CKUIBehaviorMac_macToolbarStoplightButtonsLeadingPadding__block_invoke()
{
  macToolbarStoplightButtonsLeadingPadding_sBehavior = 0x4052000000000000;
}

- (double)macEffectPickerTitleLeadingPadding
{
  if (macEffectPickerTitleLeadingPadding_once != -1)
    dispatch_once(&macEffectPickerTitleLeadingPadding_once, &__block_literal_global_179_0);
  return *(double *)&macEffectPickerTitleLeadingPadding_sBehavior;
}

void __53__CKUIBehaviorMac_macEffectPickerTitleLeadingPadding__block_invoke()
{
  macEffectPickerTitleLeadingPadding_sBehavior = 0x402E000000000000;
}

- (BOOL)effectPickerPresentsSelectionView
{
  if (effectPickerPresentsSelectionView_once_0 != -1)
    dispatch_once(&effectPickerPresentsSelectionView_once_0, &__block_literal_global_180_0);
  return 0;
}

- (BOOL)effectPickerShowsCloseButton
{
  if (effectPickerShowsCloseButton_once_0 != -1)
    dispatch_once(&effectPickerShowsCloseButton_once_0, &__block_literal_global_181_0);
  return effectPickerShowsCloseButton_sBehavior;
}

void __47__CKUIBehaviorMac_effectPickerShowsCloseButton__block_invoke()
{
  effectPickerShowsCloseButton_sBehavior = 1;
}

- (double)macConversationListToolbarHeight
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKUIBehaviorMac_macConversationListToolbarHeight__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macConversationListToolbarHeight_once != -1)
    dispatch_once(&macConversationListToolbarHeight_once, block);
  return *(double *)&macConversationListToolbarHeight_sBehavior;
}

double __51__CKUIBehaviorMac_macConversationListToolbarHeight__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "macAppKitToolbarHeight");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "marzNavigationBarHeight");
  result = v3 + v4;
  macConversationListToolbarHeight_sBehavior = *(_QWORD *)&result;
  return result;
}

- (UIEdgeInsets)searchNavbarCanvasInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (searchNavbarCanvasInsets_once != -1)
    dispatch_once(&searchNavbarCanvasInsets_once, &__block_literal_global_182_2);
  v2 = *(double *)&searchNavbarCanvasInsets_sBehavior_0;
  v3 = *(double *)&searchNavbarCanvasInsets_sBehavior_1;
  v4 = *(double *)&searchNavbarCanvasInsets_sBehavior_2;
  v5 = *(double *)&searchNavbarCanvasInsets_sBehavior_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __43__CKUIBehaviorMac_searchNavbarCanvasInsets__block_invoke()
{
  int v0;
  double v1;
  double v2;
  double v3;
  id v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v4, "useMacToolbar");
  v1 = 18.0;
  v2 = 10.0;
  if (v0)
    v1 = 10.0;
  v3 = 12.0;
  if (v0)
    v3 = 0.0;
  else
    v2 = 12.0;
  searchNavbarCanvasInsets_sBehavior_0 = *(_QWORD *)&v3;
  searchNavbarCanvasInsets_sBehavior_1 = 0x4024000000000000;
  searchNavbarCanvasInsets_sBehavior_2 = *(_QWORD *)&v2;
  searchNavbarCanvasInsets_sBehavior_3 = *(_QWORD *)&v1;

}

- (double)spaceBetweenSearchBarAndComposeButton
{
  if (spaceBetweenSearchBarAndComposeButton_once != -1)
    dispatch_once(&spaceBetweenSearchBarAndComposeButton_once, &__block_literal_global_183_1);
  return *(double *)&spaceBetweenSearchBarAndComposeButton_sBehavior;
}

void __56__CKUIBehaviorMac_spaceBetweenSearchBarAndComposeButton__block_invoke()
{
  spaceBetweenSearchBarAndComposeButton_sBehavior = 0x4024000000000000;
}

- (CGSize)browserButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (browserButtonSize_once_0 != -1)
    dispatch_once(&browserButtonSize_once_0, &__block_literal_global_184);
  v2 = *(double *)&browserButtonSize_sBehavior_0_0;
  v3 = *(double *)&browserButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __36__CKUIBehaviorMac_browserButtonSize__block_invoke()
{
  browserButtonSize_sBehavior_0_0 = 0x4042000000000000;
  browserButtonSize_sBehavior_1_0 = 0x403A000000000000;
}

- (CGSize)cancelButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (cancelButtonSize_once != -1)
    dispatch_once(&cancelButtonSize_once, &__block_literal_global_185_0);
  v2 = *(double *)&cancelButtonSize_sBehavior_0;
  v3 = *(double *)&cancelButtonSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __35__CKUIBehaviorMac_cancelButtonSize__block_invoke()
{
  cancelButtonSize_sBehavior_0 = 0x4038000000000000;
  cancelButtonSize_sBehavior_1 = 0x4038000000000000;
}

- (id)searchBarFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchBarFont_sContentSizeCategory_searchBarFont, (UIContentSizeCategory)v2)|| searchBarFont_sIsIncreaseContrastEnabled_searchBarFont != v3|| searchBarFont_sIsBoldTextEnabled_searchBarFont != IsBoldTextEnabled|| (v10 = searchBarFont_sTextFontSize_searchBarFont, *(double *)&searchBarFont_sTextFontSize_searchBarFont != v5)|| (v10 = searchBarFont_sCustomTextFontSize_searchBarFont, *(double *)&searchBarFont_sCustomTextFontSize_searchBarFont != v6)|| (objc_msgSend((id)searchBarFont_sCustomTextFontName_searchBarFont, "isEqualToString:", v9, *(double *)&searchBarFont_sCustomTextFontSize_searchBarFont) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)searchBarFont_sBehavior;
    searchBarFont_sBehavior = v11;

    objc_storeStrong((id *)&searchBarFont_sContentSizeCategory_searchBarFont, v2);
    searchBarFont_sIsIncreaseContrastEnabled_searchBarFont = v3;
    searchBarFont_sIsBoldTextEnabled_searchBarFont = IsBoldTextEnabled;
    searchBarFont_sTextFontSize_searchBarFont = *(_QWORD *)&v5;
    searchBarFont_sCustomTextFontSize_searchBarFont = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchBarFont_sCustomTextFontName_searchBarFont, v8);
  }
  v13 = (id)searchBarFont_sBehavior;

  return v13;
}

- (id)chatNavbarColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CKUIBehaviorMac_chatNavbarColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (chatNavbarColor_once != -1)
    dispatch_once(&chatNavbarColor_once, block);
  return (id)chatNavbarColor_sBehavior;
}

void __34__CKUIBehaviorMac_chatNavbarColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "useMacToolbar") & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v1 = objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)chatNavbarColor_sBehavior;
  chatNavbarColor_sBehavior = v1;

}

- (double)chatNavbarLeftMargin
{
  if (chatNavbarLeftMargin_once != -1)
    dispatch_once(&chatNavbarLeftMargin_once, &__block_literal_global_186_0);
  return *(double *)&chatNavbarLeftMargin_sBehavior;
}

void __39__CKUIBehaviorMac_chatNavbarLeftMargin__block_invoke()
{
  chatNavbarLeftMargin_sBehavior = 0x402F000000000000;
}

- (double)chatNavbarRightMargin
{
  if (chatNavbarRightMargin_once != -1)
    dispatch_once(&chatNavbarRightMargin_once, &__block_literal_global_187_0);
  return *(double *)&chatNavbarRightMargin_sBehavior;
}

void __40__CKUIBehaviorMac_chatNavbarRightMargin__block_invoke()
{
  chatNavbarRightMargin_sBehavior = 0x4034000000000000;
}

- (CGSize)macNSToolbarItemSize
{
  double v2;
  double v3;
  CGSize result;

  if (macNSToolbarItemSize_once != -1)
    dispatch_once(&macNSToolbarItemSize_once, &__block_literal_global_188_0);
  v2 = *(double *)&macNSToolbarItemSize_sBehavior_0;
  v3 = *(double *)&macNSToolbarItemSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __39__CKUIBehaviorMac_macNSToolbarItemSize__block_invoke()
{
  macNSToolbarItemSize_sBehavior_0 = 0x403F000000000000;
  macNSToolbarItemSize_sBehavior_1 = 0x403C000000000000;
}

- (CGSize)macJoinFaceTimeNSToolbarItemSize
{
  double v2;
  double v3;
  CGSize result;

  if (macJoinFaceTimeNSToolbarItemSize_once != -1)
    dispatch_once(&macJoinFaceTimeNSToolbarItemSize_once, &__block_literal_global_189_1);
  v2 = *(double *)&macJoinFaceTimeNSToolbarItemSize_sBehavior_0;
  v3 = *(double *)&macJoinFaceTimeNSToolbarItemSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __51__CKUIBehaviorMac_macJoinFaceTimeNSToolbarItemSize__block_invoke()
{
  macJoinFaceTimeNSToolbarItemSize_sBehavior_0 = 0x4051800000000000;
  macJoinFaceTimeNSToolbarItemSize_sBehavior_1 = 0x403C000000000000;
}

- (double)macNSToolbarItemInterItemSpacing
{
  if (macNSToolbarItemInterItemSpacing_once != -1)
    dispatch_once(&macNSToolbarItemInterItemSpacing_once, &__block_literal_global_190_1);
  return *(double *)&macNSToolbarItemInterItemSpacing_sBehavior;
}

void __51__CKUIBehaviorMac_macNSToolbarItemInterItemSpacing__block_invoke()
{
  macNSToolbarItemInterItemSpacing_sBehavior = 0x4028000000000000;
}

- (double)macNavbarBottomMargin
{
  if (macNavbarBottomMargin_once != -1)
    dispatch_once(&macNavbarBottomMargin_once, &__block_literal_global_191_0);
  return *(double *)&macNavbarBottomMargin_sBehavior;
}

void __40__CKUIBehaviorMac_macNavbarBottomMargin__block_invoke()
{
  macNavbarBottomMargin_sBehavior = 0x402E000000000000;
}

- (double)macNavbarLeftMargin
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CKUIBehaviorMac_macNavbarLeftMargin__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macNavbarLeftMargin_once != -1)
    dispatch_once(&macNavbarLeftMargin_once, block);
  return *(double *)&macNavbarLeftMargin_sBehavior;
}

uint64_t __38__CKUIBehaviorMac_macNavbarLeftMargin__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v2;

  result = objc_msgSend(*(id *)(a1 + 32), "useMacToolbar");
  v2 = 13.0;
  if ((_DWORD)result)
    v2 = 20.0;
  macNavbarLeftMargin_sBehavior = *(_QWORD *)&v2;
  return result;
}

- (double)macNavbarRightMargin
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CKUIBehaviorMac_macNavbarRightMargin__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macNavbarRightMargin_once != -1)
    dispatch_once(&macNavbarRightMargin_once, block);
  return *(double *)&macNavbarRightMargin_sBehavior;
}

uint64_t __39__CKUIBehaviorMac_macNavbarRightMargin__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v2;

  result = objc_msgSend(*(id *)(a1 + 32), "useMacToolbar");
  v2 = 12.0;
  if ((_DWORD)result)
    v2 = 20.0;
  macNavbarRightMargin_sBehavior = *(_QWORD *)&v2;
  return result;
}

- (double)macToLabelTrailingMargin
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CKUIBehaviorMac_macToLabelTrailingMargin__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macToLabelTrailingMargin_once != -1)
    dispatch_once(&macToLabelTrailingMargin_once, block);
  return *(double *)&macToLabelTrailingMargin_sBehavior;
}

uint64_t __43__CKUIBehaviorMac_macToLabelTrailingMargin__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v2;

  result = objc_msgSend(*(id *)(a1 + 32), "useMacToolbar");
  v2 = 9.0;
  if ((_DWORD)result)
    v2 = 0.0;
  macToLabelTrailingMargin_sBehavior = *(_QWORD *)&v2;
  return result;
}

- (double)macTitleTrailingMargin
{
  if (macTitleTrailingMargin_once != -1)
    dispatch_once(&macTitleTrailingMargin_once, &__block_literal_global_192_2);
  return 0.0;
}

- (double)macTotalMarginWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CKUIBehaviorMac_macTotalMarginWidth__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (macTotalMarginWidth_once != -1)
    dispatch_once(&macTotalMarginWidth_once, block);
  return *(double *)&macTotalMarginWidth_sBehavior;
}

double __38__CKUIBehaviorMac_macTotalMarginWidth__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "macNavbarLeftMargin");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "macToLabelTrailingMargin");
  v5 = v3 + v4;
  objc_msgSend(*(id *)(a1 + 32), "macTitleTrailingMargin");
  v7 = v5 + v6;
  objc_msgSend(*(id *)(a1 + 32), "macNavbarRightMargin");
  result = v7 + v8;
  macTotalMarginWidth_sBehavior = *(_QWORD *)&result;
  return result;
}

- (id)audioBalloonTimeFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioBalloonTimeFont_sContentSizeCategory_audioBalloonTimeFont_0, (UIContentSizeCategory)v2)|| audioBalloonTimeFont_sIsIncreaseContrastEnabled_audioBalloonTimeFont_0 != v3|| audioBalloonTimeFont_sIsBoldTextEnabled_audioBalloonTimeFont_0 != IsBoldTextEnabled|| (v10 = audioBalloonTimeFont_sTextFontSize_audioBalloonTimeFont_0, *(double *)&audioBalloonTimeFont_sTextFontSize_audioBalloonTimeFont_0 != v5)|| (v10 = audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0, *(double *)&audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0 != v6)|| (objc_msgSend((id)audioBalloonTimeFont_sCustomTextFontName_audioBalloonTimeFont_0, "isEqualToString:", v9, *(double *)&audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortMonospacedPreferredFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)audioBalloonTimeFont_sBehavior_0;
    audioBalloonTimeFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&audioBalloonTimeFont_sContentSizeCategory_audioBalloonTimeFont_0, v2);
    audioBalloonTimeFont_sIsIncreaseContrastEnabled_audioBalloonTimeFont_0 = v3;
    audioBalloonTimeFont_sIsBoldTextEnabled_audioBalloonTimeFont_0 = IsBoldTextEnabled;
    audioBalloonTimeFont_sTextFontSize_audioBalloonTimeFont_0 = *(_QWORD *)&v5;
    audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&audioBalloonTimeFont_sCustomTextFontName_audioBalloonTimeFont_0, v8);
  }
  v13 = (id)audioBalloonTimeFont_sBehavior_0;

  return v13;
}

- (id)audioBalloonSpeedFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioBalloonSpeedFont_sContentSizeCategory_audioBalloonSpeedFont_0, (UIContentSizeCategory)v2)|| audioBalloonSpeedFont_sIsIncreaseContrastEnabled_audioBalloonSpeedFont_0 != v3|| audioBalloonSpeedFont_sIsBoldTextEnabled_audioBalloonSpeedFont_0 != IsBoldTextEnabled|| (v10 = audioBalloonSpeedFont_sTextFontSize_audioBalloonSpeedFont_0, *(double *)&audioBalloonSpeedFont_sTextFontSize_audioBalloonSpeedFont_0 != v5)|| (v10 = audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0, *(double *)&audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0 != v6)|| (objc_msgSend((id)audioBalloonSpeedFont_sCustomTextFontName_audioBalloonSpeedFont_0, "isEqualToString:", v9, *(double *)&audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortMonospacedPreferredFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)audioBalloonSpeedFont_sBehavior_0;
    audioBalloonSpeedFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&audioBalloonSpeedFont_sContentSizeCategory_audioBalloonSpeedFont_0, v2);
    audioBalloonSpeedFont_sIsIncreaseContrastEnabled_audioBalloonSpeedFont_0 = v3;
    audioBalloonSpeedFont_sIsBoldTextEnabled_audioBalloonSpeedFont_0 = IsBoldTextEnabled;
    audioBalloonSpeedFont_sTextFontSize_audioBalloonSpeedFont_0 = *(_QWORD *)&v5;
    audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&audioBalloonSpeedFont_sCustomTextFontName_audioBalloonSpeedFont_0, v8);
  }
  v13 = (id)audioBalloonSpeedFont_sBehavior_0;

  return v13;
}

- (id)audioBalloonTranscriptionFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioBalloonTranscriptionFont_sContentSizeCategory_audioBalloonTranscriptionFont_0, (UIContentSizeCategory)v2)|| audioBalloonTranscriptionFont_sIsIncreaseContrastEnabled_audioBalloonTranscriptionFont_0 != v3|| audioBalloonTranscriptionFont_sIsBoldTextEnabled_audioBalloonTranscriptionFont_0 != IsBoldTextEnabled|| (v10 = audioBalloonTranscriptionFont_sTextFontSize_audioBalloonTranscriptionFont_0, *(double *)&audioBalloonTranscriptionFont_sTextFontSize_audioBalloonTranscriptionFont_0 != v5)|| (v10 = audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0, *(double *)&audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0 != v6)|| (objc_msgSend((id)audioBalloonTranscriptionFont_sCustomTextFontName_audioBalloonTranscriptionFont_0, "isEqualToString:", v9, *(double *)&audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)audioBalloonTranscriptionFont_sBehavior_0;
    audioBalloonTranscriptionFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&audioBalloonTranscriptionFont_sContentSizeCategory_audioBalloonTranscriptionFont_0, v2);
    audioBalloonTranscriptionFont_sIsIncreaseContrastEnabled_audioBalloonTranscriptionFont_0 = v3;
    audioBalloonTranscriptionFont_sIsBoldTextEnabled_audioBalloonTranscriptionFont_0 = IsBoldTextEnabled;
    audioBalloonTranscriptionFont_sTextFontSize_audioBalloonTranscriptionFont_0 = *(_QWORD *)&v5;
    audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&audioBalloonTranscriptionFont_sCustomTextFontName_audioBalloonTranscriptionFont_0, v8);
  }
  v13 = (id)audioBalloonTranscriptionFont_sBehavior_0;

  return v13;
}

- (BOOL)transcriptMinBottomInsetIsEntryViewHeight
{
  if (transcriptMinBottomInsetIsEntryViewHeight_once_0 != -1)
    dispatch_once(&transcriptMinBottomInsetIsEntryViewHeight_once_0, &__block_literal_global_193_1);
  return transcriptMinBottomInsetIsEntryViewHeight_sBehavior;
}

void __60__CKUIBehaviorMac_transcriptMinBottomInsetIsEntryViewHeight__block_invoke()
{
  transcriptMinBottomInsetIsEntryViewHeight_sBehavior = 1;
}

- (UIEdgeInsets)minTranscriptMarginInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (minTranscriptMarginInsets_once_0 != -1)
    dispatch_once(&minTranscriptMarginInsets_once_0, &__block_literal_global_194_1);
  v2 = *(double *)&minTranscriptMarginInsets_sBehavior_1_0;
  v3 = *(double *)&minTranscriptMarginInsets_sBehavior_3_0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

void __44__CKUIBehaviorMac_minTranscriptMarginInsets__block_invoke()
{
  minTranscriptMarginInsets_sBehavior_1_0 = 0x4030000000000000;
  minTranscriptMarginInsets_sBehavior_3_0 = 0x4030000000000000;
}

- (double)balloonMaxWidthPercent
{
  if (balloonMaxWidthPercent_once_0 != -1)
    dispatch_once(&balloonMaxWidthPercent_once_0, &__block_literal_global_195_0);
  return *(double *)&balloonMaxWidthPercent_sBehavior_0;
}

void __41__CKUIBehaviorMac_balloonMaxWidthPercent__block_invoke()
{
  balloonMaxWidthPercent_sBehavior_0 = 0x3FE4CCCCCCCCCCCDLL;
}

- (id)balloonTextFont
{
  void *v3;
  int v4;
  int IsBoldTextEnabled;
  double v6;
  double v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v6 = CKUserPreferenceFontSize();
  v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v8, "length"))
    v9 = v8;
  else
    v9 = CFSTR("None");
  v10 = v9;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)balloonTextFont_sContentSizeCategory_balloonTextFont_0, (UIContentSizeCategory)v3)|| balloonTextFont_sIsIncreaseContrastEnabled_balloonTextFont_0 != v4|| balloonTextFont_sIsBoldTextEnabled_balloonTextFont_0 != IsBoldTextEnabled|| (v11 = balloonTextFont_sTextFontSize_balloonTextFont_0, *(double *)&balloonTextFont_sTextFontSize_balloonTextFont_0 != v6)|| (v11 = balloonTextFont_sCustomTextFontSize_balloonTextFont_0, *(double *)&balloonTextFont_sCustomTextFontSize_balloonTextFont_0 != v7)|| (objc_msgSend((id)balloonTextFont_sCustomTextFontName_balloonTextFont_0, "isEqualToString:", v10, *(double *)&balloonTextFont_sCustomTextFontSize_balloonTextFont_0) & 1) == 0)
  {
    -[CKUIBehaviorMac balloonTextFontUserDefaults](self, "balloonTextFontUserDefaults", *(double *)&v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)balloonTextFont_sBehavior_0;
    balloonTextFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&balloonTextFont_sContentSizeCategory_balloonTextFont_0, v3);
    balloonTextFont_sIsIncreaseContrastEnabled_balloonTextFont_0 = v4;
    balloonTextFont_sIsBoldTextEnabled_balloonTextFont_0 = IsBoldTextEnabled;
    balloonTextFont_sTextFontSize_balloonTextFont_0 = *(_QWORD *)&v6;
    balloonTextFont_sCustomTextFontSize_balloonTextFont_0 = *(_QWORD *)&v7;
    objc_storeStrong((id *)&balloonTextFont_sCustomTextFontName_balloonTextFont_0, v9);
  }
  v14 = (id)balloonTextFont_sBehavior_0;

  return v14;
}

- (id)transcriptRegularFont
{
  void *v3;
  int v4;
  int IsBoldTextEnabled;
  double v6;
  double v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  CKPreferredContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v6 = CKUserPreferenceFontSize();
  v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v8, "length"))
    v9 = v8;
  else
    v9 = CFSTR("None");
  v10 = v9;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptRegularFont_sContentSizeCategory_transcriptRegularFont_0, (UIContentSizeCategory)v3)|| transcriptRegularFont_sIsIncreaseContrastEnabled_transcriptRegularFont_0 != v4|| transcriptRegularFont_sIsBoldTextEnabled_transcriptRegularFont_0 != IsBoldTextEnabled|| (v11 = transcriptRegularFont_sTextFontSize_transcriptRegularFont_0, *(double *)&transcriptRegularFont_sTextFontSize_transcriptRegularFont_0 != v6)|| (v11 = transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0, *(double *)&transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0 != v7)|| (objc_msgSend((id)transcriptRegularFont_sCustomTextFontName_transcriptRegularFont_0, "isEqualToString:", v10, *(double *)&transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0) & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)CKUIBehaviorMac;
    -[CKUIBehavior transcriptRegularFont](&v17, sel_transcriptRegularFont, *(double *)&v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "__ck_fontScaledByUserPreference");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)transcriptRegularFont_sBehavior_0;
    transcriptRegularFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptRegularFont_sContentSizeCategory_transcriptRegularFont_0, v3);
    transcriptRegularFont_sIsIncreaseContrastEnabled_transcriptRegularFont_0 = v4;
    transcriptRegularFont_sIsBoldTextEnabled_transcriptRegularFont_0 = IsBoldTextEnabled;
    transcriptRegularFont_sTextFontSize_transcriptRegularFont_0 = *(_QWORD *)&v6;
    transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0 = *(_QWORD *)&v7;
    objc_storeStrong((id *)&transcriptRegularFont_sCustomTextFontName_transcriptRegularFont_0, v9);
  }
  v15 = (id)transcriptRegularFont_sBehavior_0;

  return v15;
}

- (id)transcriptMessageStatusFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptMessageStatusFont_sContentSizeCategory_transcriptMessageStatusFont_0, (UIContentSizeCategory)v2)|| transcriptMessageStatusFont_sIsIncreaseContrastEnabled_transcriptMessageStatusFont_0 != v3|| transcriptMessageStatusFont_sIsBoldTextEnabled_transcriptMessageStatusFont_0 != IsBoldTextEnabled|| *(double *)&transcriptMessageStatusFont_sTextFontSize_transcriptMessageStatusFont_0 != v5|| *(double *)&transcriptMessageStatusFont_sCustomTextFontSize_transcriptMessageStatusFont_0 != v6|| (objc_msgSend((id)transcriptMessageStatusFont_sCustomTextFontName_transcriptMessageStatusFont_0, "isEqualToString:", v9, *(double *)&transcriptMessageStatusFont_sCustomTextFontSize_transcriptMessageStatusFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_fontForStyle:weight:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0DC1438]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_fontScaledByUserPreference");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)transcriptMessageStatusFont_sBehavior_0;
    transcriptMessageStatusFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&transcriptMessageStatusFont_sContentSizeCategory_transcriptMessageStatusFont_0, v2);
    transcriptMessageStatusFont_sIsIncreaseContrastEnabled_transcriptMessageStatusFont_0 = v3;
    transcriptMessageStatusFont_sIsBoldTextEnabled_transcriptMessageStatusFont_0 = IsBoldTextEnabled;
    transcriptMessageStatusFont_sTextFontSize_transcriptMessageStatusFont_0 = *(_QWORD *)&v5;
    transcriptMessageStatusFont_sCustomTextFontSize_transcriptMessageStatusFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&transcriptMessageStatusFont_sCustomTextFontName_transcriptMessageStatusFont_0, v8);
  }
  v13 = (id)transcriptMessageStatusFont_sBehavior_0;

  return v13;
}

- (id)transcriptMessageStatusDateFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptMessageStatusDateFont_sContentSizeCategory_transcriptMessageStatusDateFont_0, (UIContentSizeCategory)v2)|| transcriptMessageStatusDateFont_sIsIncreaseContrastEnabled_transcriptMessageStatusDateFont_0 != v3|| transcriptMessageStatusDateFont_sIsBoldTextEnabled_transcriptMessageStatusDateFont_0 != IsBoldTextEnabled|| *(double *)&transcriptMessageStatusDateFont_sTextFontSize_transcriptMessageStatusDateFont_0 != v5|| *(double *)&transcriptMessageStatusDateFont_sCustomTextFontSize_transcriptMessageStatusDateFont_0 != v6|| (objc_msgSend((id)transcriptMessageStatusDateFont_sCustomTextFontName_transcriptMessageStatusDateFont_0, "isEqualToString:", v9, *(double *)&transcriptMessageStatusDateFont_sCustomTextFontSize_transcriptMessageStatusDateFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_fontForStyle:weight:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0DC1440]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_fontScaledByUserPreference");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)transcriptMessageStatusDateFont_sBehavior_0;
    transcriptMessageStatusDateFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&transcriptMessageStatusDateFont_sContentSizeCategory_transcriptMessageStatusDateFont_0, v2);
    transcriptMessageStatusDateFont_sIsIncreaseContrastEnabled_transcriptMessageStatusDateFont_0 = v3;
    transcriptMessageStatusDateFont_sIsBoldTextEnabled_transcriptMessageStatusDateFont_0 = IsBoldTextEnabled;
    transcriptMessageStatusDateFont_sTextFontSize_transcriptMessageStatusDateFont_0 = *(_QWORD *)&v5;
    transcriptMessageStatusDateFont_sCustomTextFontSize_transcriptMessageStatusDateFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&transcriptMessageStatusDateFont_sCustomTextFontName_transcriptMessageStatusDateFont_0, v8);
  }
  v13 = (id)transcriptMessageStatusDateFont_sBehavior_0;

  return v13;
}

- (id)transcriptBoldFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptBoldFont_sContentSizeCategory_transcriptBoldFont_0, (UIContentSizeCategory)v2)|| transcriptBoldFont_sIsIncreaseContrastEnabled_transcriptBoldFont_0 != v3|| transcriptBoldFont_sIsBoldTextEnabled_transcriptBoldFont_0 != IsBoldTextEnabled|| *(double *)&transcriptBoldFont_sTextFontSize_transcriptBoldFont_0 != v5|| *(double *)&transcriptBoldFont_sCustomTextFontSize_transcriptBoldFont_0 != v6|| (objc_msgSend((id)transcriptBoldFont_sCustomTextFontName_transcriptBoldFont_0, "isEqualToString:", v9, *(double *)&transcriptBoldFont_sCustomTextFontSize_transcriptBoldFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_fontForStyle:weight:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0DC1438]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_fontScaledByUserPreference");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)transcriptBoldFont_sBehavior_0;
    transcriptBoldFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&transcriptBoldFont_sContentSizeCategory_transcriptBoldFont_0, v2);
    transcriptBoldFont_sIsIncreaseContrastEnabled_transcriptBoldFont_0 = v3;
    transcriptBoldFont_sIsBoldTextEnabled_transcriptBoldFont_0 = IsBoldTextEnabled;
    transcriptBoldFont_sTextFontSize_transcriptBoldFont_0 = *(_QWORD *)&v5;
    transcriptBoldFont_sCustomTextFontSize_transcriptBoldFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&transcriptBoldFont_sCustomTextFontName_transcriptBoldFont_0, v8);
  }
  v13 = (id)transcriptBoldFont_sBehavior_0;

  return v13;
}

- (id)transcriptLightFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptLightFont_sContentSizeCategory_transcriptLightFont_0, (UIContentSizeCategory)v2)|| transcriptLightFont_sIsIncreaseContrastEnabled_transcriptLightFont_0 != v3|| transcriptLightFont_sIsBoldTextEnabled_transcriptLightFont_0 != IsBoldTextEnabled|| *(double *)&transcriptLightFont_sTextFontSize_transcriptLightFont_0 != v5|| *(double *)&transcriptLightFont_sCustomTextFontSize_transcriptLightFont_0 != v6|| (objc_msgSend((id)transcriptLightFont_sCustomTextFontName_transcriptLightFont_0, "isEqualToString:", v9, *(double *)&transcriptLightFont_sCustomTextFontSize_transcriptLightFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_fontForStyle:weight:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0DC1430]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_fontScaledByUserPreference");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)transcriptLightFont_sBehavior_0;
    transcriptLightFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&transcriptLightFont_sContentSizeCategory_transcriptLightFont_0, v2);
    transcriptLightFont_sIsIncreaseContrastEnabled_transcriptLightFont_0 = v3;
    transcriptLightFont_sIsBoldTextEnabled_transcriptLightFont_0 = IsBoldTextEnabled;
    transcriptLightFont_sTextFontSize_transcriptLightFont_0 = *(_QWORD *)&v5;
    transcriptLightFont_sCustomTextFontSize_transcriptLightFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&transcriptLightFont_sCustomTextFontName_transcriptLightFont_0, v8);
  }
  v13 = (id)transcriptLightFont_sBehavior_0;

  return v13;
}

- (id)transcriptButtonTextFont
{
  void *v3;
  int v4;
  int IsBoldTextEnabled;
  double v6;
  double v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v6 = CKUserPreferenceFontSize();
  v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v8, "length"))
    v9 = v8;
  else
    v9 = CFSTR("None");
  v10 = v9;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptButtonTextFont_sContentSizeCategory_transcriptButtonTextFont_0, (UIContentSizeCategory)v3)|| transcriptButtonTextFont_sIsIncreaseContrastEnabled_transcriptButtonTextFont_0 != v4|| transcriptButtonTextFont_sIsBoldTextEnabled_transcriptButtonTextFont_0 != IsBoldTextEnabled|| (v11 = transcriptButtonTextFont_sTextFontSize_transcriptButtonTextFont_0, *(double *)&transcriptButtonTextFont_sTextFontSize_transcriptButtonTextFont_0 != v6)|| (v11 = transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0, *(double *)&transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0 != v7)|| (objc_msgSend((id)transcriptButtonTextFont_sCustomTextFontName_transcriptButtonTextFont_0, "isEqualToString:", v10, *(double *)&transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0) & 1) == 0)
  {
    -[CKUIBehaviorMac transcriptBoldFont](self, "transcriptBoldFont", *(double *)&v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)transcriptButtonTextFont_sBehavior_0;
    transcriptButtonTextFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&transcriptButtonTextFont_sContentSizeCategory_transcriptButtonTextFont_0, v3);
    transcriptButtonTextFont_sIsIncreaseContrastEnabled_transcriptButtonTextFont_0 = v4;
    transcriptButtonTextFont_sIsBoldTextEnabled_transcriptButtonTextFont_0 = IsBoldTextEnabled;
    transcriptButtonTextFont_sTextFontSize_transcriptButtonTextFont_0 = *(_QWORD *)&v6;
    transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0 = *(_QWORD *)&v7;
    objc_storeStrong((id *)&transcriptButtonTextFont_sCustomTextFontName_transcriptButtonTextFont_0, v9);
  }
  v14 = (id)transcriptButtonTextFont_sBehavior_0;

  return v14;
}

- (id)transcriptSenderFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptSenderFont_sContentSizeCategory_transcriptSenderFont_0, (UIContentSizeCategory)v2)|| transcriptSenderFont_sIsIncreaseContrastEnabled_transcriptSenderFont_0 != v3|| transcriptSenderFont_sIsBoldTextEnabled_transcriptSenderFont_0 != IsBoldTextEnabled|| *(double *)&transcriptSenderFont_sTextFontSize_transcriptSenderFont_0 != v5|| *(double *)&transcriptSenderFont_sCustomTextFontSize_transcriptSenderFont_0 != v6|| (objc_msgSend((id)transcriptSenderFont_sCustomTextFontName_transcriptSenderFont_0, "isEqualToString:", v9, *(double *)&transcriptSenderFont_sCustomTextFontSize_transcriptSenderFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_fontForStyle:weight:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0DC1440]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_fontScaledByUserPreference");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)transcriptSenderFont_sBehavior_0;
    transcriptSenderFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&transcriptSenderFont_sContentSizeCategory_transcriptSenderFont_0, v2);
    transcriptSenderFont_sIsIncreaseContrastEnabled_transcriptSenderFont_0 = v3;
    transcriptSenderFont_sIsBoldTextEnabled_transcriptSenderFont_0 = IsBoldTextEnabled;
    transcriptSenderFont_sTextFontSize_transcriptSenderFont_0 = *(_QWORD *)&v5;
    transcriptSenderFont_sCustomTextFontSize_transcriptSenderFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&transcriptSenderFont_sCustomTextFontName_transcriptSenderFont_0, v8);
  }
  v13 = (id)transcriptSenderFont_sBehavior_0;

  return v13;
}

- (id)previewTitleFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)previewTitleFont_sContentSizeCategory_previewTitleFont_0, (UIContentSizeCategory)v2)|| previewTitleFont_sIsIncreaseContrastEnabled_previewTitleFont_0 != v3|| previewTitleFont_sIsBoldTextEnabled_previewTitleFont_0 != IsBoldTextEnabled|| (v10 = previewTitleFont_sTextFontSize_previewTitleFont_0, *(double *)&previewTitleFont_sTextFontSize_previewTitleFont_0 != v5)|| (v10 = previewTitleFont_sCustomTextFontSize_previewTitleFont_0, *(double *)&previewTitleFont_sCustomTextFontSize_previewTitleFont_0 != v6)|| (objc_msgSend((id)previewTitleFont_sCustomTextFontName_previewTitleFont_0, "isEqualToString:", v9, *(double *)&previewTitleFont_sCustomTextFontSize_previewTitleFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortPreferredFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)previewTitleFont_sBehavior_0;
    previewTitleFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&previewTitleFont_sContentSizeCategory_previewTitleFont_0, v2);
    previewTitleFont_sIsIncreaseContrastEnabled_previewTitleFont_0 = v3;
    previewTitleFont_sIsBoldTextEnabled_previewTitleFont_0 = IsBoldTextEnabled;
    previewTitleFont_sTextFontSize_previewTitleFont_0 = *(_QWORD *)&v5;
    previewTitleFont_sCustomTextFontSize_previewTitleFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&previewTitleFont_sCustomTextFontName_previewTitleFont_0, v8);
  }
  v13 = (id)previewTitleFont_sBehavior_0;

  return v13;
}

- (double)transcriptContactImageDiameter
{
  if (transcriptContactImageDiameter_once_0 != -1)
    dispatch_once(&transcriptContactImageDiameter_once_0, &__block_literal_global_198_1);
  return *(double *)&transcriptContactImageDiameter_sBehavior_0;
}

void __49__CKUIBehaviorMac_transcriptContactImageDiameter__block_invoke()
{
  transcriptContactImageDiameter_sBehavior_0 = 0x403C000000000000;
}

- (double)transcriptDrawerGestureAcceleration
{
  void *v2;
  int IsBoldTextEnabled;
  double v4;
  double v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  double v9;
  BOOL v11;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = CKUserPreferenceFontSize();
  v5 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("None");
  v8 = v7;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptDrawerGestureAcceleration_sContentSizeCategory_transcriptDrawerGestureAcceleration_0, (UIContentSizeCategory)v2)|| transcriptDrawerGestureAcceleration_sIsBoldTextEnabled_transcriptDrawerGestureAcceleration_0 != IsBoldTextEnabled|| (*(double *)&transcriptDrawerGestureAcceleration_sTextFontSize_transcriptDrawerGestureAcceleration_0 == v4? (v11 = *(double *)&transcriptDrawerGestureAcceleration_sCustomTextFontSize_transcriptDrawerGestureAcceleration_0 == v5): (v11 = 0), !v11|| (objc_msgSend((id)transcriptDrawerGestureAcceleration_sCustomTextFontName_transcriptDrawerGestureAcceleration_0, "isEqualToString:", v8, *(double *)&transcriptDrawerGestureAcceleration_sTextFontSize_transcriptDrawerGestureAcceleration_0, *(double *)&transcriptDrawerGestureAcceleration_sCustomTextFontSize_transcriptDrawerGestureAcceleration_0) & 1) == 0))
  {
    transcriptDrawerGestureAcceleration_sBehavior_0 = 0x4014000000000000;
    objc_storeStrong((id *)&transcriptDrawerGestureAcceleration_sContentSizeCategory_transcriptDrawerGestureAcceleration_0, v2);
    transcriptDrawerGestureAcceleration_sIsBoldTextEnabled_transcriptDrawerGestureAcceleration_0 = IsBoldTextEnabled;
    transcriptDrawerGestureAcceleration_sTextFontSize_transcriptDrawerGestureAcceleration_0 = *(_QWORD *)&v4;
    transcriptDrawerGestureAcceleration_sCustomTextFontSize_transcriptDrawerGestureAcceleration_0 = *(_QWORD *)&v5;
    objc_storeStrong((id *)&transcriptDrawerGestureAcceleration_sCustomTextFontName_transcriptDrawerGestureAcceleration_0, v7);
  }
  v9 = *(double *)&transcriptDrawerGestureAcceleration_sBehavior_0;

  return v9;
}

- (double)balloonContiguousSpace
{
  if (balloonContiguousSpace_once_0 != -1)
    dispatch_once(&balloonContiguousSpace_once_0, &__block_literal_global_199_1);
  return *(double *)&balloonContiguousSpace_sBehavior_0;
}

void __41__CKUIBehaviorMac_balloonContiguousSpace__block_invoke()
{
  balloonContiguousSpace_sBehavior_0 = 0x4008000000000000;
}

- (double)balloonNonContiguousSpace
{
  if (balloonNonContiguousSpace_once_0 != -1)
    dispatch_once(&balloonNonContiguousSpace_once_0, &__block_literal_global_200_3);
  return *(double *)&balloonNonContiguousSpace_sBehavior_0;
}

void __44__CKUIBehaviorMac_balloonNonContiguousSpace__block_invoke()
{
  balloonNonContiguousSpace_sBehavior_0 = 0x4024000000000000;
}

- (id)replyBalloonTextFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)replyBalloonTextFont_sContentSizeCategory_replyBalloonTextFont_0, (UIContentSizeCategory)v2)|| replyBalloonTextFont_sIsIncreaseContrastEnabled_replyBalloonTextFont_0 != v3|| replyBalloonTextFont_sIsBoldTextEnabled_replyBalloonTextFont_0 != IsBoldTextEnabled|| (v10 = replyBalloonTextFont_sTextFontSize_replyBalloonTextFont_0, *(double *)&replyBalloonTextFont_sTextFontSize_replyBalloonTextFont_0 != v5)|| (v10 = replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0, *(double *)&replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0 != v6)|| (objc_msgSend((id)replyBalloonTextFont_sCustomTextFontName_replyBalloonTextFont_0, "isEqualToString:", v9, *(double *)&replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortPreferredFontForTextStyle:", *MEMORY[0x1E0CEB558], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)replyBalloonTextFont_sBehavior_0;
    replyBalloonTextFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&replyBalloonTextFont_sContentSizeCategory_replyBalloonTextFont_0, v2);
    replyBalloonTextFont_sIsIncreaseContrastEnabled_replyBalloonTextFont_0 = v3;
    replyBalloonTextFont_sIsBoldTextEnabled_replyBalloonTextFont_0 = IsBoldTextEnabled;
    replyBalloonTextFont_sTextFontSize_replyBalloonTextFont_0 = *(_QWORD *)&v5;
    replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&replyBalloonTextFont_sCustomTextFontName_replyBalloonTextFont_0, v8);
  }
  v13 = (id)replyBalloonTextFont_sBehavior_0;

  return v13;
}

- (double)transcriptReplyPreviewContextContactImageDiameter
{
  if (transcriptReplyPreviewContextContactImageDiameter_once_0 != -1)
    dispatch_once(&transcriptReplyPreviewContextContactImageDiameter_once_0, &__block_literal_global_201_1);
  return *(double *)&transcriptReplyPreviewContextContactImageDiameter_sBehavior_0;
}

void __68__CKUIBehaviorMac_transcriptReplyPreviewContextContactImageDiameter__block_invoke()
{
  transcriptReplyPreviewContextContactImageDiameter_sBehavior_0 = 0x4032000000000000;
}

- (CGSize)mediaObjectCachedIconSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUIBehaviorMac_mediaObjectCachedIconSize__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (mediaObjectCachedIconSize_once_0 != -1)
    dispatch_once(&mediaObjectCachedIconSize_once_0, block);
  v2 = *(double *)&mediaObjectCachedIconSize_sBehavior_0_0;
  v3 = *(double *)&mediaObjectCachedIconSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __44__CKUIBehaviorMac_mediaObjectCachedIconSize__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v2;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "searchPhotosThumbnailWidth");
  v3 = v2 * 0.5;
  if (v3 < 60.0)
    v3 = 60.0;
  mediaObjectCachedIconSize_sBehavior_0_0 = *(_QWORD *)&v3;
  mediaObjectCachedIconSize_sBehavior_1_0 = *(_QWORD *)&v3;
  return result;
}

- (double)replyLineWidth
{
  if (replyLineWidth_once_0 != -1)
    dispatch_once(&replyLineWidth_once_0, &__block_literal_global_202_1);
  return *(double *)&replyLineWidth_sBehavior_0;
}

void __33__CKUIBehaviorMac_replyLineWidth__block_invoke()
{
  replyLineWidth_sBehavior_0 = 0x4008000000000000;
}

- (double)replyLineViewVerticalPadding
{
  if (replyLineViewVerticalPadding_once_0 != -1)
    dispatch_once(&replyLineViewVerticalPadding_once_0, &__block_literal_global_203_2);
  return *(double *)&replyLineViewVerticalPadding_sBehavior_0;
}

void __47__CKUIBehaviorMac_replyLineViewVerticalPadding__block_invoke()
{
  replyLineViewVerticalPadding_sBehavior_0 = 0x401C000000000000;
}

- (double)replyLineViewHorizontalPadding
{
  if (replyLineViewHorizontalPadding_once_0 != -1)
    dispatch_once(&replyLineViewHorizontalPadding_once_0, &__block_literal_global_204_1);
  return *(double *)&replyLineViewHorizontalPadding_sBehavior_0;
}

void __49__CKUIBehaviorMac_replyLineViewHorizontalPadding__block_invoke()
{
  replyLineViewHorizontalPadding_sBehavior_0 = 0x401C000000000000;
}

- (double)replyLineViewContactImageLayoutHorizontalPadding
{
  if (replyLineViewContactImageLayoutHorizontalPadding_once_0 != -1)
    dispatch_once(&replyLineViewContactImageLayoutHorizontalPadding_once_0, &__block_literal_global_205_2);
  return *(double *)&replyLineViewContactImageLayoutHorizontalPadding_sBehavior_0;
}

void __67__CKUIBehaviorMac_replyLineViewContactImageLayoutHorizontalPadding__block_invoke()
{
  replyLineViewContactImageLayoutHorizontalPadding_sBehavior_0 = 0x3FE0000000000000;
}

- (double)replyLineBracketRadius
{
  if (replyLineBracketRadius_once_0 != -1)
    dispatch_once(&replyLineBracketRadius_once_0, &__block_literal_global_206_2);
  return *(double *)&replyLineBracketRadius_sBehavior_0;
}

void __41__CKUIBehaviorMac_replyLineBracketRadius__block_invoke()
{
  replyLineBracketRadius_sBehavior_0 = 0x4033000000000000;
}

- (double)replyLineViewMaxWidth
{
  if (replyLineViewMaxWidth_once_0 != -1)
    dispatch_once(&replyLineViewMaxWidth_once_0, &__block_literal_global_207_2);
  return *(double *)&replyLineViewMaxWidth_sBehavior_0;
}

void __40__CKUIBehaviorMac_replyLineViewMaxWidth__block_invoke()
{
  replyLineViewMaxWidth_sBehavior_0 = 0x403E000000000000;
}

- (double)transcriptQuickActionButtonDiameter
{
  if (transcriptQuickActionButtonDiameter_once_0 != -1)
    dispatch_once(&transcriptQuickActionButtonDiameter_once_0, &__block_literal_global_208_1);
  return *(double *)&transcriptQuickActionButtonDiameter_sBehavior_0;
}

void __54__CKUIBehaviorMac_transcriptQuickActionButtonDiameter__block_invoke()
{
  transcriptQuickActionButtonDiameter_sBehavior_0 = 0x403C000000000000;
}

- (id)quickSaveButtonImage
{
  if (quickSaveButtonImage_once_0 != -1)
    dispatch_once(&quickSaveButtonImage_once_0, &__block_literal_global_209_1);
  return (id)quickSaveButtonImage_sBehavior_0;
}

void __39__CKUIBehaviorMac_quickSaveButtonImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.and.arrow.down"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 12.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithSymbolConfiguration:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)quickSaveButtonImage_sBehavior_0;
  quickSaveButtonImage_sBehavior_0 = v1;

}

- (id)quickSavePinImage
{
  if (quickSavePinImage_once != -1)
    dispatch_once(&quickSavePinImage_once, &__block_literal_global_212_1);
  return (id)quickSavePinImage_sBehavior;
}

void __36__CKUIBehaviorMac_quickSavePinImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("pin"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 12.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithSymbolConfiguration:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)quickSavePinImage_sBehavior;
  quickSavePinImage_sBehavior = v1;

}

- (BOOL)canPluginBalloonsUseOpaqueMask
{
  if (canPluginBalloonsUseOpaqueMask_once_0 != -1)
    dispatch_once(&canPluginBalloonsUseOpaqueMask_once_0, &__block_literal_global_215_2);
  return 0;
}

- (CGSize)balloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (balloonMaskSize_once_0 != -1)
    dispatch_once(&balloonMaskSize_once_0, &__block_literal_global_216_1);
  v2 = *(double *)&balloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&balloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __34__CKUIBehaviorMac_balloonMaskSize__block_invoke()
{
  balloonMaskSize_sBehavior_0_0 = 0x4045800000000000;
  balloonMaskSize_sBehavior_1_0 = 0x403B000000000000;
}

- (CGSize)skinnyBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (skinnyBalloonMaskSize_once_0 != -1)
    dispatch_once(&skinnyBalloonMaskSize_once_0, &__block_literal_global_217_2);
  v2 = *(double *)&skinnyBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&skinnyBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __40__CKUIBehaviorMac_skinnyBalloonMaskSize__block_invoke()
{
  skinnyBalloonMaskSize_sBehavior_0_0 = 0x4042800000000000;
  skinnyBalloonMaskSize_sBehavior_1_0 = 0x403B000000000000;
}

- (double)balloonMaskTailWidth
{
  if (balloonMaskTailWidth_once_0 != -1)
    dispatch_once(&balloonMaskTailWidth_once_0, &__block_literal_global_218_3);
  return *(double *)&balloonMaskTailWidth_sBehavior_0;
}

void __39__CKUIBehaviorMac_balloonMaskTailWidth__block_invoke()
{
  balloonMaskTailWidth_sBehavior_0 = 0x4014000000000000;
}

- (double)replyBalloonMaskTailWidth
{
  if (replyBalloonMaskTailWidth_once != -1)
    dispatch_once(&replyBalloonMaskTailWidth_once, &__block_literal_global_219_1);
  return *(double *)&replyBalloonMaskTailWidth_sBehavior;
}

void __44__CKUIBehaviorMac_replyBalloonMaskTailWidth__block_invoke()
{
  replyBalloonMaskTailWidth_sBehavior = 0x4008000000000000;
}

- (double)replyBalloonMinHeight
{
  if (replyBalloonMinHeight_once_0 != -1)
    dispatch_once(&replyBalloonMinHeight_once_0, &__block_literal_global_220_2);
  return *(double *)&replyBalloonMinHeight_sBehavior_0;
}

void __40__CKUIBehaviorMac_replyBalloonMinHeight__block_invoke()
{
  replyBalloonMinHeight_sBehavior_0 = 0x4034000000000000;
}

- (CGSize)multilineBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (multilineBalloonMaskSize_once_0 != -1)
    dispatch_once(&multilineBalloonMaskSize_once_0, &__block_literal_global_221_1);
  v2 = *(double *)&multilineBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&multilineBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __43__CKUIBehaviorMac_multilineBalloonMaskSize__block_invoke()
{
  multilineBalloonMaskSize_sBehavior_0_0 = 0x4045800000000000;
  multilineBalloonMaskSize_sBehavior_1_0 = 0x403C000000000000;
}

- (CGSize)taillessMultilineBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (taillessMultilineBalloonMaskSize_once_0 != -1)
    dispatch_once(&taillessMultilineBalloonMaskSize_once_0, &__block_literal_global_222_1);
  v2 = *(double *)&taillessMultilineBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&taillessMultilineBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __51__CKUIBehaviorMac_taillessMultilineBalloonMaskSize__block_invoke()
{
  taillessMultilineBalloonMaskSize_sBehavior_0_0 = 0x4045800000000000;
  taillessMultilineBalloonMaskSize_sBehavior_1_0 = 0x403C000000000000;
}

- (CGSize)replyBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (replyBalloonMaskSize_once_0 != -1)
    dispatch_once(&replyBalloonMaskSize_once_0, &__block_literal_global_223_2);
  v2 = *(double *)&replyBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&replyBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __39__CKUIBehaviorMac_replyBalloonMaskSize__block_invoke()
{
  replyBalloonMaskSize_sBehavior_0_0 = 0x4041000000000000;
  replyBalloonMaskSize_sBehavior_1_0 = 0x4034000000000000;
}

- (CGSize)replySkinnyBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (replySkinnyBalloonMaskSize_once_0 != -1)
    dispatch_once(&replySkinnyBalloonMaskSize_once_0, &__block_literal_global_224_1);
  v2 = *(double *)&replySkinnyBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&replySkinnyBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __45__CKUIBehaviorMac_replySkinnyBalloonMaskSize__block_invoke()
{
  replySkinnyBalloonMaskSize_sBehavior_0_0 = 0x403C000000000000;
  replySkinnyBalloonMaskSize_sBehavior_1_0 = 0x4034000000000000;
}

- (CGSize)replyMultilineBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (replyMultilineBalloonMaskSize_once_0 != -1)
    dispatch_once(&replyMultilineBalloonMaskSize_once_0, &__block_literal_global_225_1);
  v2 = *(double *)&replyMultilineBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&replyMultilineBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorMac_replyMultilineBalloonMaskSize__block_invoke()
{
  replyMultilineBalloonMaskSize_sBehavior_0_0 = 0x4041000000000000;
  replyMultilineBalloonMaskSize_sBehavior_1_0 = 0x4036000000000000;
}

- (CGSize)replyDeleteBalloonMaskSize
{
  double v2;
  double v3;
  CGSize result;

  if (replyDeleteBalloonMaskSize_once_0 != -1)
    dispatch_once(&replyDeleteBalloonMaskSize_once_0, &__block_literal_global_226_1);
  v2 = *(double *)&replyDeleteBalloonMaskSize_sBehavior_0_0;
  v3 = *(double *)&replyDeleteBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __45__CKUIBehaviorMac_replyDeleteBalloonMaskSize__block_invoke()
{
  replyDeleteBalloonMaskSize_sBehavior_0_0 = 0x403F000000000000;
  replyDeleteBalloonMaskSize_sBehavior_1_0 = 0x4034000000000000;
}

- (id)livePhotoBadgeImage
{
  if (livePhotoBadgeImage_once_0 != -1)
    dispatch_once(&livePhotoBadgeImage_once_0, &__block_literal_global_227_0);
  return (id)livePhotoBadgeImage_sBehavior_0;
}

void __38__CKUIBehaviorMac_livePhotoBadgeImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("livephoto"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configurationWithHierarchicalColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "imageWithSymbolConfiguration:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)livePhotoBadgeImage_sBehavior_0;
  livePhotoBadgeImage_sBehavior_0 = v6;

}

- (UIEdgeInsets)textReplyPreviewBalloonAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD block[5];
  UIEdgeInsets result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CKUIBehaviorMac_textReplyPreviewBalloonAlignmentRectInsets__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (textReplyPreviewBalloonAlignmentRectInsets_once_0 != -1)
    dispatch_once(&textReplyPreviewBalloonAlignmentRectInsets_once_0, block);
  v2 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0;
  v3 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0;
  v4 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0;
  v5 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __61__CKUIBehaviorMac_textReplyPreviewBalloonAlignmentRectInsets__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "replyBalloonMaskTailWidth");
  v2 = v1;
  if (CKMainScreenScale_once_65 != -1)
    dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_741_0);
  v3 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  v4 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v3 = 1.0;
  v5 = ceil(v3 * 5.0) / v3;
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v6 = 1.0;
  v7 = ceil(v6 * 9.0) / v6;
  v8 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v8 = 1.0;
  v9 = ceil(v8 * 5.0) / v8;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 != 0.0)
    v4 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  textReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0 = *(_QWORD *)&v5;
  textReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0 = *(_QWORD *)&v7;
  textReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0 = *(_QWORD *)&v9;
  *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0 = ceil((v2 + 9.0) * v4) / v4;
}

- (UIEdgeInsets)attachmentReplyPreviewBalloonAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD block[5];
  UIEdgeInsets result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CKUIBehaviorMac_attachmentReplyPreviewBalloonAlignmentRectInsets__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (attachmentReplyPreviewBalloonAlignmentRectInsets_once_0 != -1)
    dispatch_once(&attachmentReplyPreviewBalloonAlignmentRectInsets_once_0, block);
  v2 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0;
  v3 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0;
  v4 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0;
  v5 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

double __67__CKUIBehaviorMac_attachmentReplyPreviewBalloonAlignmentRectInsets__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "balloonMaskTailWidth");
  v2 = v1;
  if (CKMainScreenScale_once_65 != -1)
    dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_741_0);
  v3 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  v4 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v3 = 1.0;
  v5 = ceil(v3 * 4.0) / v3;
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v6 = 1.0;
  v7 = ceil(v6 * 7.0) / v6;
  v8 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v8 = 1.0;
  v9 = ceil(v8 * 4.0) / v8;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 != 0.0)
    v4 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  result = ceil((v2 + 6.0) * v4) / v4;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0 = *(_QWORD *)&v5;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0 = *(_QWORD *)&v7;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0 = *(_QWORD *)&v9;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0 = *(_QWORD *)&result;
  return result;
}

- (double)audioReplyPreviewBalloonInset
{
  if (audioReplyPreviewBalloonInset_once_0 != -1)
    dispatch_once(&audioReplyPreviewBalloonInset_once_0, &__block_literal_global_230);
  return *(double *)&audioReplyPreviewBalloonInset_sBehavior_0;
}

void __48__CKUIBehaviorMac_audioReplyPreviewBalloonInset__block_invoke()
{
  audioReplyPreviewBalloonInset_sBehavior_0 = 0x4035000000000000;
}

- (double)previewMaxWidth
{
  if (previewMaxWidth_once_0 != -1)
    dispatch_once(&previewMaxWidth_once_0, &__block_literal_global_231);
  return *(double *)&previewMaxWidth_sBehavior_0;
}

void __34__CKUIBehaviorMac_previewMaxWidth__block_invoke()
{
  previewMaxWidth_sBehavior_0 = 0x4072C00000000000;
}

- (double)replyButtonPadding
{
  if (replyButtonPadding_once_0 != -1)
    dispatch_once(&replyButtonPadding_once_0, &__block_literal_global_232_1);
  return *(double *)&replyButtonPadding_sBehavior;
}

void __37__CKUIBehaviorMac_replyButtonPadding__block_invoke()
{
  replyButtonPadding_sBehavior = 0x4020000000000000;
}

- (UIEdgeInsets)replyButtonEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (replyButtonEdgeInsets_once_0 != -1)
    dispatch_once(&replyButtonEdgeInsets_once_0, &__block_literal_global_233);
  v2 = *(double *)&replyButtonEdgeInsets_sBehavior_0_0;
  v3 = *(double *)&replyButtonEdgeInsets_sBehavior_1_0;
  v4 = *(double *)&replyButtonEdgeInsets_sBehavior_2_0;
  v5 = *(double *)&replyButtonEdgeInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __40__CKUIBehaviorMac_replyButtonEdgeInsets__block_invoke()
{
  replyButtonEdgeInsets_sBehavior_0_0 = 0x4014000000000000;
  replyButtonEdgeInsets_sBehavior_1_0 = 0x4026000000000000;
  replyButtonEdgeInsets_sBehavior_2_0 = 0x4014000000000000;
  replyButtonEdgeInsets_sBehavior_3_0 = 0x4026000000000000;
}

- (double)composeBalloonMaxWidthForEntryContentViewWidth:(double)a3
{
  return 176.0;
}

- (double)fontSizeOffsetUserDefaults
{
  double v2;

  -[CKUIBehaviorMac fontSizeUserDefaults](self, "fontSizeUserDefaults");
  return v2 + -13.0;
}

- (id)textFontUserDefaults:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "pointSize");
  v6 = v5;
  -[CKUIBehaviorMac fontSizeOffsetUserDefaults](self, "fontSizeOffsetUserDefaults");
  objc_msgSend(v4, "fontWithSize:", v6 + v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)balloonTextFontUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (-[CKUIBehaviorMac customFontEnabled](self, "customFontEnabled")
    && (-[CKUIBehaviorMac customFontNameUserDefaults](self, "customFontNameUserDefaults"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = (void *)MEMORY[0x1E0DC1350];
    -[CKUIBehaviorMac customFontNameUserDefaults](self, "customFontNameUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKUIBehaviorMac customFontSizeUserDefaults](self, "customFontSizeUserDefaults");
    objc_msgSend(v4, "fontWithName:size:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isTextKit2Enabled");

    v9 = *MEMORY[0x1E0CEB538];
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0DC1350];
      -[CKUIBehaviorMac fontSizeUserDefaults](self, "fontSizeUserDefaults");
      objc_msgSend(v10, "fontWithDescriptor:size:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortPreferredFontForTextStyle:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKUIBehaviorMac fontSizeUserDefaults](self, "fontSizeUserDefaults");
      objc_msgSend(v5, "fontWithSize:");
    }
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v6;

  return v11;
}

- (CGSize)balloonMaskTailSizeForTailShape:(char)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if (a3 >= 2)
  {
    v3 = 5.0;
    v4 = 5.0;
    if (a3 != 2)
    {
      v3 = *MEMORY[0x1E0C9D820];
      v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKUIBehaviorMac;
    -[CKUIBehavior balloonMaskTailSizeForTailShape:](&v5, sel_balloonMaskTailSizeForTailShape_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)roundBalloonMaskSizeWithTailShape:(char)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if (a3 >= 2)
  {
    v3 = 28.0;
    v4 = 28.0;
    if (a3 != 2)
    {
      v3 = *MEMORY[0x1E0C9D820];
      v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKUIBehaviorMac;
    -[CKUIBehavior roundBalloonMaskSizeWithTailShape:](&v5, sel_roundBalloonMaskSizeWithTailShape_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)thumbnailFillSizeForWidth:(double)a3 imageSize:(CGSize)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)CKUIBehaviorMac;
  -[CKUIBehavior unconstrainedAspectFillSizeForWidth:imageSize:](&v6, sel_unconstrainedAspectFillSizeForWidth_imageSize_, a3, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)balloonMaskAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD block[5];
  UIEdgeInsets result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUIBehaviorMac_balloonMaskAlignmentRectInsets__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (balloonMaskAlignmentRectInsets_once_0 != -1)
    dispatch_once(&balloonMaskAlignmentRectInsets_once_0, block);
  v2 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_0_0;
  v3 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_1_0;
  v4 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_2_0;
  v5 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __49__CKUIBehaviorMac_balloonMaskAlignmentRectInsets__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "balloonMaskTailWidth");
  v2 = v1;
  if (CKMainScreenScale_once_65 != -1)
    dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_741_0);
  v3 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  v4 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v3 = 1.0;
  v5 = ceil(v3 * 8.5) / v3;
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v6 = 1.0;
  v7 = ceil(v6 * 9.0) / v6;
  v8 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v8 = 1.0;
  v9 = ceil(v8 * 9.0) / v8;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 != 0.0)
    v4 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  balloonMaskAlignmentRectInsets_sBehavior_0_0 = *(_QWORD *)&v5;
  balloonMaskAlignmentRectInsets_sBehavior_1_0 = *(_QWORD *)&v7;
  balloonMaskAlignmentRectInsets_sBehavior_2_0 = *(_QWORD *)&v9;
  *(double *)&balloonMaskAlignmentRectInsets_sBehavior_3_0 = ceil((v2 + 9.0) * v4) / v4;
}

- (id)imageBalloonSelectionOverlayColor
{
  if (imageBalloonSelectionOverlayColor_once_0 != -1)
    dispatch_once(&imageBalloonSelectionOverlayColor_once_0, &__block_literal_global_240);
  return (id)imageBalloonSelectionOverlayColor_sBehavior_0;
}

void __52__CKUIBehaviorMac_imageBalloonSelectionOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.807843137, 0.807843137, 0.823529412, 0.4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageBalloonSelectionOverlayColor_sBehavior_0;
  imageBalloonSelectionOverlayColor_sBehavior_0 = v0;

}

- (id)tuConversationBalloonActionButtonFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)tuConversationBalloonActionButtonFont_sContentSizeCategory_tuConversationBalloonActionButtonFont_0, (UIContentSizeCategory)v2)|| tuConversationBalloonActionButtonFont_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFont_0 != v3|| tuConversationBalloonActionButtonFont_sIsBoldTextEnabled_tuConversationBalloonActionButtonFont_0 != IsBoldTextEnabled|| (v10 = tuConversationBalloonActionButtonFont_sTextFontSize_tuConversationBalloonActionButtonFont_0, *(double *)&tuConversationBalloonActionButtonFont_sTextFontSize_tuConversationBalloonActionButtonFont_0 != v5)|| (v10 = tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0, *(double *)&tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0 != v6)|| (objc_msgSend((id)tuConversationBalloonActionButtonFont_sCustomTextFontName_tuConversationBalloonActionButtonFont_0, "isEqualToString:", v9, *(double *)&tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0DC1350];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", *(double *)&v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tuConversationBalloonActionButtonFontStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__ck_fontForStyle:weight:", v13, *MEMORY[0x1E0DC1440]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)tuConversationBalloonActionButtonFont_sBehavior_0;
    tuConversationBalloonActionButtonFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&tuConversationBalloonActionButtonFont_sContentSizeCategory_tuConversationBalloonActionButtonFont_0, v2);
    tuConversationBalloonActionButtonFont_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFont_0 = v3;
    tuConversationBalloonActionButtonFont_sIsBoldTextEnabled_tuConversationBalloonActionButtonFont_0 = IsBoldTextEnabled;
    tuConversationBalloonActionButtonFont_sTextFontSize_tuConversationBalloonActionButtonFont_0 = *(_QWORD *)&v5;
    tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFont_sCustomTextFontName_tuConversationBalloonActionButtonFont_0, v8);
  }
  v16 = (id)tuConversationBalloonActionButtonFont_sBehavior_0;

  return v16;
}

- (id)tuConversationBalloonActionButtonFontStyle
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)tuConversationBalloonActionButtonFontStyle_sContentSizeCategory_tuConversationBalloonActionButtonFontStyle_0, (UIContentSizeCategory)v2)|| tuConversationBalloonActionButtonFontStyle_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFontStyle_0 != v3|| tuConversationBalloonActionButtonFontStyle_sIsBoldTextEnabled_tuConversationBalloonActionButtonFontStyle_0 != IsBoldTextEnabled|| *(double *)&tuConversationBalloonActionButtonFontStyle_sTextFontSize_tuConversationBalloonActionButtonFontStyle_0 != v5|| *(double *)&tuConversationBalloonActionButtonFontStyle_sCustomTextFontSize_tuConversationBalloonActionButtonFontStyle_0 != v6|| (objc_msgSend((id)tuConversationBalloonActionButtonFontStyle_sCustomTextFontName_tuConversationBalloonActionButtonFontStyle_0, "isEqualToString:", v9, *(double *)&tuConversationBalloonActionButtonFontStyle_sCustomTextFontSize_tuConversationBalloonActionButtonFontStyle_0) & 1) == 0)
  {
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFontStyle_sBehavior_0, (id)*MEMORY[0x1E0CEB540]);
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFontStyle_sContentSizeCategory_tuConversationBalloonActionButtonFontStyle_0, v2);
    tuConversationBalloonActionButtonFontStyle_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFontStyle_0 = v3;
    tuConversationBalloonActionButtonFontStyle_sIsBoldTextEnabled_tuConversationBalloonActionButtonFontStyle_0 = IsBoldTextEnabled;
    tuConversationBalloonActionButtonFontStyle_sTextFontSize_tuConversationBalloonActionButtonFontStyle_0 = *(_QWORD *)&v5;
    tuConversationBalloonActionButtonFontStyle_sCustomTextFontSize_tuConversationBalloonActionButtonFontStyle_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFontStyle_sCustomTextFontName_tuConversationBalloonActionButtonFontStyle_0, v8);
  }
  v10 = (id)tuConversationBalloonActionButtonFontStyle_sBehavior_0;

  return v10;
}

- (double)tuConversationBalloonImageDimensions
{
  if (tuConversationBalloonImageDimensions_once_0 != -1)
    dispatch_once(&tuConversationBalloonImageDimensions_once_0, &__block_literal_global_241);
  return *(double *)&tuConversationBalloonImageDimensions_sBehavior_0;
}

void __55__CKUIBehaviorMac_tuConversationBalloonImageDimensions__block_invoke()
{
  tuConversationBalloonImageDimensions_sBehavior_0 = 0x403E000000000000;
}

- (double)tuConversationBalloonFaceTimeIconDimensions
{
  if (tuConversationBalloonFaceTimeIconDimensions_once_0 != -1)
    dispatch_once(&tuConversationBalloonFaceTimeIconDimensions_once_0, &__block_literal_global_242_0);
  return *(double *)&tuConversationBalloonFaceTimeIconDimensions_sBehavior_0;
}

void __62__CKUIBehaviorMac_tuConversationBalloonFaceTimeIconDimensions__block_invoke()
{
  tuConversationBalloonFaceTimeIconDimensions_sBehavior_0 = 0x4038000000000000;
}

- (double)tuConversationBalloonIconDimensions
{
  if (tuConversationBalloonIconDimensions_once_0 != -1)
    dispatch_once(&tuConversationBalloonIconDimensions_once_0, &__block_literal_global_243_0);
  return *(double *)&tuConversationBalloonIconDimensions_sBehavior_0;
}

void __54__CKUIBehaviorMac_tuConversationBalloonIconDimensions__block_invoke()
{
  tuConversationBalloonIconDimensions_sBehavior_0 = 0x4030000000000000;
}

- (double)tuConversationBalloonAvatarDimensions
{
  if (tuConversationBalloonAvatarDimensions_once_0 != -1)
    dispatch_once(&tuConversationBalloonAvatarDimensions_once_0, &__block_literal_global_244_0);
  return *(double *)&tuConversationBalloonAvatarDimensions_sBehavior_0;
}

void __56__CKUIBehaviorMac_tuConversationBalloonAvatarDimensions__block_invoke()
{
  tuConversationBalloonAvatarDimensions_sBehavior_0 = 0x402C000000000000;
}

- (double)tuConversationBalloonJoinButtonHeight
{
  if (tuConversationBalloonJoinButtonHeight_once_0 != -1)
    dispatch_once(&tuConversationBalloonJoinButtonHeight_once_0, &__block_literal_global_245_0);
  return *(double *)&tuConversationBalloonJoinButtonHeight_sBehavior_0;
}

void __56__CKUIBehaviorMac_tuConversationBalloonJoinButtonHeight__block_invoke()
{
  tuConversationBalloonJoinButtonHeight_sBehavior_0 = 0x4034000000000000;
}

- (double)tuConversationBalloonJoinButtonMinWidth
{
  if (tuConversationBalloonJoinButtonMinWidth_once_0 != -1)
    dispatch_once(&tuConversationBalloonJoinButtonMinWidth_once_0, &__block_literal_global_246);
  return *(double *)&tuConversationBalloonJoinButtonMinWidth_sBehavior_0;
}

void __58__CKUIBehaviorMac_tuConversationBalloonJoinButtonMinWidth__block_invoke()
{
  tuConversationBalloonJoinButtonMinWidth_sBehavior_0 = 0x4052000000000000;
}

- (double)tuConversationBalloonJoinButtonMaxWidth
{
  if (tuConversationBalloonJoinButtonMaxWidth_once_0 != -1)
    dispatch_once(&tuConversationBalloonJoinButtonMaxWidth_once_0, &__block_literal_global_247);
  return *(double *)&tuConversationBalloonJoinButtonMaxWidth_sBehavior_0;
}

void __58__CKUIBehaviorMac_tuConversationBalloonJoinButtonMaxWidth__block_invoke()
{
  tuConversationBalloonJoinButtonMaxWidth_sBehavior_0 = 0x4062C00000000000;
}

- (double)tuConversationBalloonContentMinHeight
{
  if (tuConversationBalloonContentMinHeight_once_0 != -1)
    dispatch_once(&tuConversationBalloonContentMinHeight_once_0, &__block_literal_global_248_1);
  return *(double *)&tuConversationBalloonContentMinHeight_sBehavior_0;
}

void __56__CKUIBehaviorMac_tuConversationBalloonContentMinHeight__block_invoke()
{
  tuConversationBalloonContentMinHeight_sBehavior_0 = 0x403E000000000000;
}

- (double)tuConversationBalloonContentStandardMinWidth
{
  if (tuConversationBalloonContentStandardMinWidth_once_0 != -1)
    dispatch_once(&tuConversationBalloonContentStandardMinWidth_once_0, &__block_literal_global_249_0);
  return *(double *)&tuConversationBalloonContentStandardMinWidth_sBehavior_0;
}

void __63__CKUIBehaviorMac_tuConversationBalloonContentStandardMinWidth__block_invoke()
{
  tuConversationBalloonContentStandardMinWidth_sBehavior_0 = 0x4062C00000000000;
}

- (id)nicknameUpdatesTitleFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)nicknameUpdatesTitleFont_sContentSizeCategory_nicknameUpdatesTitleFont_0, (UIContentSizeCategory)v2)|| nicknameUpdatesTitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesTitleFont_0 != v3|| nicknameUpdatesTitleFont_sIsBoldTextEnabled_nicknameUpdatesTitleFont_0 != IsBoldTextEnabled|| (v10 = nicknameUpdatesTitleFont_sTextFontSize_nicknameUpdatesTitleFont_0, *(double *)&nicknameUpdatesTitleFont_sTextFontSize_nicknameUpdatesTitleFont_0 != v5)|| (v10 = nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0, *(double *)&nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0 != v6)|| (objc_msgSend((id)nicknameUpdatesTitleFont_sCustomTextFontName_nicknameUpdatesTitleFont_0, "isEqualToString:", v9, *(double *)&nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)nicknameUpdatesTitleFont_sBehavior_0;
    nicknameUpdatesTitleFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&nicknameUpdatesTitleFont_sContentSizeCategory_nicknameUpdatesTitleFont_0, v2);
    nicknameUpdatesTitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesTitleFont_0 = v3;
    nicknameUpdatesTitleFont_sIsBoldTextEnabled_nicknameUpdatesTitleFont_0 = IsBoldTextEnabled;
    nicknameUpdatesTitleFont_sTextFontSize_nicknameUpdatesTitleFont_0 = *(_QWORD *)&v5;
    nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&nicknameUpdatesTitleFont_sCustomTextFontName_nicknameUpdatesTitleFont_0, v8);
  }
  v13 = (id)nicknameUpdatesTitleFont_sBehavior_0;

  return v13;
}

- (id)nicknameUpdatesSubtitleFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)nicknameUpdatesSubtitleFont_sContentSizeCategory_nicknameUpdatesSubtitleFont_0, (UIContentSizeCategory)v2)|| nicknameUpdatesSubtitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesSubtitleFont_0 != v3|| nicknameUpdatesSubtitleFont_sIsBoldTextEnabled_nicknameUpdatesSubtitleFont_0 != IsBoldTextEnabled|| (v10 = nicknameUpdatesSubtitleFont_sTextFontSize_nicknameUpdatesSubtitleFont_0, *(double *)&nicknameUpdatesSubtitleFont_sTextFontSize_nicknameUpdatesSubtitleFont_0 != v5)|| (v10 = nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0, *(double *)&nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0 != v6)|| (objc_msgSend((id)nicknameUpdatesSubtitleFont_sCustomTextFontName_nicknameUpdatesSubtitleFont_0, "isEqualToString:", v9, *(double *)&nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)nicknameUpdatesSubtitleFont_sBehavior_0;
    nicknameUpdatesSubtitleFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&nicknameUpdatesSubtitleFont_sContentSizeCategory_nicknameUpdatesSubtitleFont_0, v2);
    nicknameUpdatesSubtitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesSubtitleFont_0 = v3;
    nicknameUpdatesSubtitleFont_sIsBoldTextEnabled_nicknameUpdatesSubtitleFont_0 = IsBoldTextEnabled;
    nicknameUpdatesSubtitleFont_sTextFontSize_nicknameUpdatesSubtitleFont_0 = *(_QWORD *)&v5;
    nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&nicknameUpdatesSubtitleFont_sCustomTextFontName_nicknameUpdatesSubtitleFont_0, v8);
  }
  v13 = (id)nicknameUpdatesSubtitleFont_sBehavior_0;

  return v13;
}

- (id)locationBoldButtonFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)locationBoldButtonFont_sContentSizeCategory_locationBoldButtonFont_0, (UIContentSizeCategory)v2)|| locationBoldButtonFont_sIsIncreaseContrastEnabled_locationBoldButtonFont_0 != v3|| locationBoldButtonFont_sIsBoldTextEnabled_locationBoldButtonFont_0 != IsBoldTextEnabled|| *(double *)&locationBoldButtonFont_sTextFontSize_locationBoldButtonFont_0 != v5|| *(double *)&locationBoldButtonFont_sCustomTextFontSize_locationBoldButtonFont_0 != v6|| (objc_msgSend((id)locationBoldButtonFont_sCustomTextFontName_locationBoldButtonFont_0, "isEqualToString:", v9, *(double *)&locationBoldButtonFont_sCustomTextFontSize_locationBoldButtonFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)locationBoldButtonFont_sBehavior_0;
    locationBoldButtonFont_sBehavior_0 = v10;

    objc_storeStrong((id *)&locationBoldButtonFont_sContentSizeCategory_locationBoldButtonFont_0, v2);
    locationBoldButtonFont_sIsIncreaseContrastEnabled_locationBoldButtonFont_0 = v3;
    locationBoldButtonFont_sIsBoldTextEnabled_locationBoldButtonFont_0 = IsBoldTextEnabled;
    locationBoldButtonFont_sTextFontSize_locationBoldButtonFont_0 = *(_QWORD *)&v5;
    locationBoldButtonFont_sCustomTextFontSize_locationBoldButtonFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&locationBoldButtonFont_sCustomTextFontName_locationBoldButtonFont_0, v8);
  }
  v12 = (id)locationBoldButtonFont_sBehavior_0;

  return v12;
}

- (id)locationButtonFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)locationButtonFont_sContentSizeCategory_locationButtonFont_0, (UIContentSizeCategory)v2)|| locationButtonFont_sIsIncreaseContrastEnabled_locationButtonFont_0 != v3|| locationButtonFont_sIsBoldTextEnabled_locationButtonFont_0 != IsBoldTextEnabled|| *(double *)&locationButtonFont_sTextFontSize_locationButtonFont_0 != v5|| *(double *)&locationButtonFont_sCustomTextFontSize_locationButtonFont_0 != v6|| (objc_msgSend((id)locationButtonFont_sCustomTextFontName_locationButtonFont_0, "isEqualToString:", v9, *(double *)&locationButtonFont_sCustomTextFontSize_locationButtonFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)locationButtonFont_sBehavior_0;
    locationButtonFont_sBehavior_0 = v10;

    objc_storeStrong((id *)&locationButtonFont_sContentSizeCategory_locationButtonFont_0, v2);
    locationButtonFont_sIsIncreaseContrastEnabled_locationButtonFont_0 = v3;
    locationButtonFont_sIsBoldTextEnabled_locationButtonFont_0 = IsBoldTextEnabled;
    locationButtonFont_sTextFontSize_locationButtonFont_0 = *(_QWORD *)&v5;
    locationButtonFont_sCustomTextFontSize_locationButtonFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&locationButtonFont_sCustomTextFontName_locationButtonFont_0, v8);
  }
  v12 = (id)locationButtonFont_sBehavior_0;

  return v12;
}

- (BOOL)enableBalloonTextSelection
{
  if (enableBalloonTextSelection_once_0 != -1)
    dispatch_once(&enableBalloonTextSelection_once_0, &__block_literal_global_250_2);
  return enableBalloonTextSelection_sBehavior;
}

void __45__CKUIBehaviorMac_enableBalloonTextSelection__block_invoke()
{
  enableBalloonTextSelection_sBehavior = 1;
}

- (BOOL)showsBalloonChevron
{
  if (showsBalloonChevron_once_0 != -1)
    dispatch_once(&showsBalloonChevron_once_0, &__block_literal_global_251_1);
  return 0;
}

- (CGSize)messageAcknowledgmentTranscriptBalloonSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentTranscriptBalloonSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentTranscriptBalloonSize_once_0, &__block_literal_global_252_2);
  v2 = *(double *)&messageAcknowledgmentTranscriptBalloonSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentTranscriptBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __61__CKUIBehaviorMac_messageAcknowledgmentTranscriptBalloonSize__block_invoke()
{
  messageAcknowledgmentTranscriptBalloonSize_sBehavior_0_0 = 0x403D000000000000;
  messageAcknowledgmentTranscriptBalloonSize_sBehavior_1_0 = 0x403D000000000000;
}

- (UIEdgeInsets)messageAcknowledgmentTranscriptGlyphInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (messageAcknowledgmentTranscriptGlyphInset_once_0 != -1)
    dispatch_once(&messageAcknowledgmentTranscriptGlyphInset_once_0, &__block_literal_global_253_0);
  v2 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_1_0;
  v4 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_2_0;
  v5 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __60__CKUIBehaviorMac_messageAcknowledgmentTranscriptGlyphInset__block_invoke()
{
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_0_0 = 0x4008000000000000;
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_1_0 = 0x4008000000000000;
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_2_0 = 0x4008000000000000;
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_3_0 = 0x4008000000000000;
}

- (CGPoint)messageAcknowledgmentTranscriptBalloonRelativePosition
{
  double v2;
  double v3;
  CGPoint result;

  if (messageAcknowledgmentTranscriptBalloonRelativePosition_once_0 != -1)
    dispatch_once(&messageAcknowledgmentTranscriptBalloonRelativePosition_once_0, &__block_literal_global_254_2);
  v2 = *(double *)&messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_1_0;
  result.y = v3;
  result.x = v2;
  return result;
}

void __73__CKUIBehaviorMac_messageAcknowledgmentTranscriptBalloonRelativePosition__block_invoke()
{
  messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_0_0 = 0x4022000000000000;
  messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_1_0 = 0xC02A000000000000;
}

- (double)messageAcknowledgmentPhotoGridXOffsetScalar
{
  if (messageAcknowledgmentPhotoGridXOffsetScalar_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPhotoGridXOffsetScalar_once_0, &__block_literal_global_255_0);
  return *(double *)&messageAcknowledgmentPhotoGridXOffsetScalar_sBehavior;
}

void __62__CKUIBehaviorMac_messageAcknowledgmentPhotoGridXOffsetScalar__block_invoke()
{
  messageAcknowledgmentPhotoGridXOffsetScalar_sBehavior = 0x3FD6666660000000;
}

- (double)messageAcknowledgmentPhotoGridYOffsetScalar
{
  if (messageAcknowledgmentPhotoGridYOffsetScalar_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPhotoGridYOffsetScalar_once_0, &__block_literal_global_256_2);
  return *(double *)&messageAcknowledgmentPhotoGridYOffsetScalar_sBehavior_0;
}

void __62__CKUIBehaviorMac_messageAcknowledgmentPhotoGridYOffsetScalar__block_invoke()
{
  messageAcknowledgmentPhotoGridYOffsetScalar_sBehavior_0 = 0x3FD6666660000000;
}

- (CGSize)messageAcknowledgmentPickerBarSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentPickerBarSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPickerBarSize_once_0, &__block_literal_global_257_0);
  v2 = *(double *)&messageAcknowledgmentPickerBarSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentPickerBarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __53__CKUIBehaviorMac_messageAcknowledgmentPickerBarSize__block_invoke()
{
  messageAcknowledgmentPickerBarSize_sBehavior_0_0 = 0x406DC00000000000;
  messageAcknowledgmentPickerBarSize_sBehavior_1_0 = 0x404C800000000000;
}

- (CGSize)messageAcknowledgmentPickerBarAcknowledgmentImageSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentPickerBarAcknowledgmentImageSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPickerBarAcknowledgmentImageSize_once_0, &__block_literal_global_258_1);
  v2 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __72__CKUIBehaviorMac_messageAcknowledgmentPickerBarAcknowledgmentImageSize__block_invoke()
{
  messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_0_0 = 0x403C000000000000;
  messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_1_0 = 0x403C000000000000;
}

- (CGSize)messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_once_0, &__block_literal_global_259_1);
  v2 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __78__CKUIBehaviorMac_messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize__block_invoke()
{
  messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_0_0 = 0x403E000000000000;
  messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (CGSize)messageAcknowledgmentPickerBarOffsetFromBalloon
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentPickerBarOffsetFromBalloon_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPickerBarOffsetFromBalloon_once_0, &__block_literal_global_260_0);
  v2 = *(double *)&messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __66__CKUIBehaviorMac_messageAcknowledgmentPickerBarOffsetFromBalloon__block_invoke()
{
  messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_0_0 = 0x4037000000000000;
  messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_1_0 = 0x4022000000000000;
}

- (CGSize)messageAcknowledgmentAnchorBubbleOffset
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentAnchorBubbleOffset_once_0 != -1)
    dispatch_once(&messageAcknowledgmentAnchorBubbleOffset_once_0, &__block_literal_global_261_1);
  v2 = *(double *)&messageAcknowledgmentAnchorBubbleOffset_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentAnchorBubbleOffset_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __58__CKUIBehaviorMac_messageAcknowledgmentAnchorBubbleOffset__block_invoke()
{
  messageAcknowledgmentAnchorBubbleOffset_sBehavior_0_0 = 0x4014000000000000;
  messageAcknowledgmentAnchorBubbleOffset_sBehavior_1_0 = 0x4010000000000000;
}

- (double)messageAcknowledgmentPickerMinHorizontalMargin
{
  if (messageAcknowledgmentPickerMinHorizontalMargin_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPickerMinHorizontalMargin_once_0, &__block_literal_global_262_2);
  return *(double *)&messageAcknowledgmentPickerMinHorizontalMargin_sBehavior_0;
}

void __65__CKUIBehaviorMac_messageAcknowledgmentPickerMinHorizontalMargin__block_invoke()
{
  messageAcknowledgmentPickerMinHorizontalMargin_sBehavior_0 = 0x4010000000000000;
}

- (CGSize)messageAcknowledgmentAnchorBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentAnchorBubbleSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentAnchorBubbleSize_once_0, &__block_literal_global_263_1);
  v2 = *(double *)&messageAcknowledgmentAnchorBubbleSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentAnchorBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __56__CKUIBehaviorMac_messageAcknowledgmentAnchorBubbleSize__block_invoke()
{
  messageAcknowledgmentAnchorBubbleSize_sBehavior_0_0 = 0x4018000000000000;
  messageAcknowledgmentAnchorBubbleSize_sBehavior_1_0 = 0x4014000000000000;
}

- (CGSize)messageAcknowledgmentIntermediateBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentIntermediateBubbleSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentIntermediateBubbleSize_once_0, &__block_literal_global_264_1);
  v2 = *(double *)&messageAcknowledgmentIntermediateBubbleSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentIntermediateBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __62__CKUIBehaviorMac_messageAcknowledgmentIntermediateBubbleSize__block_invoke()
{
  messageAcknowledgmentIntermediateBubbleSize_sBehavior_0_0 = 0x4028000000000000;
  messageAcknowledgmentIntermediateBubbleSize_sBehavior_1_0 = 0x4026000000000000;
}

- (CGSize)messageAcknowledgmentPillBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentPillBubbleSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentPillBubbleSize_once_0, &__block_literal_global_265_1);
  v2 = *(double *)&messageAcknowledgmentPillBubbleSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentPillBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __54__CKUIBehaviorMac_messageAcknowledgmentPillBubbleSize__block_invoke()
{
  messageAcknowledgmentPillBubbleSize_sBehavior_0_0 = 0x406DE00000000000;
  messageAcknowledgmentPillBubbleSize_sBehavior_1_0 = 0x4044000000000000;
}

- (double)messageAcknowledgmentButtonMargin
{
  if (messageAcknowledgmentButtonMargin_once_0 != -1)
    dispatch_once(&messageAcknowledgmentButtonMargin_once_0, &__block_literal_global_266_1);
  return *(double *)&messageAcknowledgmentButtonMargin_sBehavior_0;
}

void __52__CKUIBehaviorMac_messageAcknowledgmentButtonMargin__block_invoke()
{
  messageAcknowledgmentButtonMargin_sBehavior_0 = 0x4020000000000000;
}

- (CGSize)messageAcknowledgmentButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (messageAcknowledgmentButtonSize_once_0 != -1)
    dispatch_once(&messageAcknowledgmentButtonSize_once_0, &__block_literal_global_267_2);
  v2 = *(double *)&messageAcknowledgmentButtonSize_sBehavior_0_0;
  v3 = *(double *)&messageAcknowledgmentButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __50__CKUIBehaviorMac_messageAcknowledgmentButtonSize__block_invoke()
{
  messageAcknowledgmentButtonSize_sBehavior_0_0 = 0x403E000000000000;
  messageAcknowledgmentButtonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (CGSize)aggregateAcknowledgmentTranscriptBalloonSize
{
  double v2;
  double v3;
  CGSize result;

  if (aggregateAcknowledgmentTranscriptBalloonSize_once_0 != -1)
    dispatch_once(&aggregateAcknowledgmentTranscriptBalloonSize_once_0, &__block_literal_global_268_2);
  v2 = *(double *)&aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_0_0;
  v3 = *(double *)&aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __63__CKUIBehaviorMac_aggregateAcknowledgmentTranscriptBalloonSize__block_invoke()
{
  aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_0_0 = 0x4041800000000000;
  aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (id)messageAcknowledgmentVoteCountFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)messageAcknowledgmentVoteCountFont_sContentSizeCategory_messageAcknowledgmentVoteCountFont_0, (UIContentSizeCategory)v2)|| messageAcknowledgmentVoteCountFont_sIsIncreaseContrastEnabled_messageAcknowledgmentVoteCountFont_0 != v3|| messageAcknowledgmentVoteCountFont_sIsBoldTextEnabled_messageAcknowledgmentVoteCountFont_0 != IsBoldTextEnabled|| (v10 = messageAcknowledgmentVoteCountFont_sTextFontSize_messageAcknowledgmentVoteCountFont_0, *(double *)&messageAcknowledgmentVoteCountFont_sTextFontSize_messageAcknowledgmentVoteCountFont_0 != v5)|| (v10 = messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0, *(double *)&messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0 != v6)|| (objc_msgSend((id)messageAcknowledgmentVoteCountFont_sCustomTextFontName_messageAcknowledgmentVoteCountFont_0, "isEqualToString:", v9, *(double *)&messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)messageAcknowledgmentVoteCountFont_sBehavior_0;
    messageAcknowledgmentVoteCountFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&messageAcknowledgmentVoteCountFont_sContentSizeCategory_messageAcknowledgmentVoteCountFont_0, v2);
    messageAcknowledgmentVoteCountFont_sIsIncreaseContrastEnabled_messageAcknowledgmentVoteCountFont_0 = v3;
    messageAcknowledgmentVoteCountFont_sIsBoldTextEnabled_messageAcknowledgmentVoteCountFont_0 = IsBoldTextEnabled;
    messageAcknowledgmentVoteCountFont_sTextFontSize_messageAcknowledgmentVoteCountFont_0 = *(_QWORD *)&v5;
    messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&messageAcknowledgmentVoteCountFont_sCustomTextFontName_messageAcknowledgmentVoteCountFont_0, v8);
  }
  v13 = (id)messageAcknowledgmentVoteCountFont_sBehavior_0;

  return v13;
}

- (double)messageAcknowledgementVotingViewHeight
{
  if (messageAcknowledgementVotingViewHeight_once_0 != -1)
    dispatch_once(&messageAcknowledgementVotingViewHeight_once_0, &__block_literal_global_269_1);
  return *(double *)&messageAcknowledgementVotingViewHeight_sBehavior_0;
}

void __57__CKUIBehaviorMac_messageAcknowledgementVotingViewHeight__block_invoke()
{
  messageAcknowledgementVotingViewHeight_sBehavior_0 = 0x4054000000000000;
}

- (double)messageAcknowledgementVotingViewMaxWidth
{
  if (messageAcknowledgementVotingViewMaxWidth_once_0 != -1)
    dispatch_once(&messageAcknowledgementVotingViewMaxWidth_once_0, &__block_literal_global_270_2);
  return *(double *)&messageAcknowledgementVotingViewMaxWidth_sBehavior_0;
}

void __59__CKUIBehaviorMac_messageAcknowledgementVotingViewMaxWidth__block_invoke()
{
  messageAcknowledgementVotingViewMaxWidth_sBehavior_0 = 0x407F400000000000;
}

- (double)messageAcknowledgementVotingViewMinPadding
{
  if (messageAcknowledgementVotingViewMinPadding_once_0 != -1)
    dispatch_once(&messageAcknowledgementVotingViewMinPadding_once_0, &__block_literal_global_271_1);
  return *(double *)&messageAcknowledgementVotingViewMinPadding_sBehavior_0;
}

void __61__CKUIBehaviorMac_messageAcknowledgementVotingViewMinPadding__block_invoke()
{
  messageAcknowledgementVotingViewMinPadding_sBehavior_0 = 0x4018000000000000;
}

- (CGSize)attributionViewAvatarSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionViewAvatarSize_once_0 != -1)
    dispatch_once(&attributionViewAvatarSize_once_0, &__block_literal_global_272_0);
  v2 = *(double *)&attributionViewAvatarSize_sBehavior_0_0;
  v3 = *(double *)&attributionViewAvatarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __44__CKUIBehaviorMac_attributionViewAvatarSize__block_invoke()
{
  attributionViewAvatarSize_sBehavior_0_0 = 0x403E000000000000;
  attributionViewAvatarSize_sBehavior_1_0 = 0x403E000000000000;
}

- (double)attributionViewMaxWidth
{
  if (attributionViewMaxWidth_once_0 != -1)
    dispatch_once(&attributionViewMaxWidth_once_0, &__block_literal_global_273_1);
  return *(double *)&attributionViewMaxWidth_sBehavior_0;
}

void __42__CKUIBehaviorMac_attributionViewMaxWidth__block_invoke()
{
  attributionViewMaxWidth_sBehavior_0 = 0x407F400000000000;
}

- (CGSize)attributionIconSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionIconSize_once_0 != -1)
    dispatch_once(&attributionIconSize_once_0, &__block_literal_global_274_0);
  v2 = *(double *)&attributionIconSize_sBehavior_0_0;
  v3 = *(double *)&attributionIconSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __38__CKUIBehaviorMac_attributionIconSize__block_invoke()
{
  attributionIconSize_sBehavior_0_0 = 0x402C000000000000;
  attributionIconSize_sBehavior_1_0 = 0x402C000000000000;
}

- (double)attributionViewMinPadding
{
  if (attributionViewMinPadding_once_0 != -1)
    dispatch_once(&attributionViewMinPadding_once_0, &__block_literal_global_275_0);
  return *(double *)&attributionViewMinPadding_sBehavior_0;
}

void __44__CKUIBehaviorMac_attributionViewMinPadding__block_invoke()
{
  attributionViewMinPadding_sBehavior_0 = 0x4018000000000000;
}

- (CGSize)attributionCountViewImageSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionCountViewImageSize_once_0 != -1)
    dispatch_once(&attributionCountViewImageSize_once_0, &__block_literal_global_276_0);
  v2 = *(double *)&attributionCountViewImageSize_sBehavior_0_0;
  v3 = *(double *)&attributionCountViewImageSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorMac_attributionCountViewImageSize__block_invoke()
{
  attributionCountViewImageSize_sBehavior_0_0 = 0x402E000000000000;
  attributionCountViewImageSize_sBehavior_1_0 = 0x402E000000000000;
}

- (double)attributionCountAndImageViewPadding
{
  if (attributionCountAndImageViewPadding_once_0 != -1)
    dispatch_once(&attributionCountAndImageViewPadding_once_0, &__block_literal_global_277_0);
  return *(double *)&attributionCountAndImageViewPadding_sBehavior_0;
}

void __54__CKUIBehaviorMac_attributionCountAndImageViewPadding__block_invoke()
{
  attributionCountAndImageViewPadding_sBehavior_0 = 0x4000000000000000;
}

- (CGSize)attributionStickerDetailsViewButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionStickerDetailsViewButtonSize_once_0 != -1)
    dispatch_once(&attributionStickerDetailsViewButtonSize_once_0, &__block_literal_global_278_0);
  v2 = *(double *)&attributionStickerDetailsViewButtonSize_sBehavior_0_0;
  v3 = *(double *)&attributionStickerDetailsViewButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __58__CKUIBehaviorMac_attributionStickerDetailsViewButtonSize__block_invoke()
{
  attributionStickerDetailsViewButtonSize_sBehavior_0_0 = 0x403E000000000000;
  attributionStickerDetailsViewButtonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (CGSize)attributionStickerDetailsViewAvatarSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionStickerDetailsViewAvatarSize_once_0 != -1)
    dispatch_once(&attributionStickerDetailsViewAvatarSize_once_0, &__block_literal_global_279_2);
  v2 = *(double *)&attributionStickerDetailsViewAvatarSize_sBehavior_0_0;
  v3 = *(double *)&attributionStickerDetailsViewAvatarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __58__CKUIBehaviorMac_attributionStickerDetailsViewAvatarSize__block_invoke()
{
  attributionStickerDetailsViewAvatarSize_sBehavior_0_0 = 0x402E000000000000;
  attributionStickerDetailsViewAvatarSize_sBehavior_1_0 = 0x402E000000000000;
}

- (CGSize)attributionStickerDetailsViewImageSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionStickerDetailsViewImageSize_once_0 != -1)
    dispatch_once(&attributionStickerDetailsViewImageSize_once_0, &__block_literal_global_280_1);
  v2 = *(double *)&attributionStickerDetailsViewImageSize_sBehavior_0_0;
  v3 = *(double *)&attributionStickerDetailsViewImageSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __57__CKUIBehaviorMac_attributionStickerDetailsViewImageSize__block_invoke()
{
  attributionStickerDetailsViewImageSize_sBehavior_0_0 = 0x4046800000000000;
  attributionStickerDetailsViewImageSize_sBehavior_1_0 = 0x4046800000000000;
}

- (CGSize)attributionCollapseButtonSize
{
  double v2;
  double v3;
  CGSize result;

  if (attributionCollapseButtonSize_once_0 != -1)
    dispatch_once(&attributionCollapseButtonSize_once_0, &__block_literal_global_281_2);
  v2 = *(double *)&attributionCollapseButtonSize_sBehavior_0_0;
  v3 = *(double *)&attributionCollapseButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorMac_attributionCollapseButtonSize__block_invoke()
{
  attributionCollapseButtonSize_sBehavior_0_0 = 0x4041000000000000;
  attributionCollapseButtonSize_sBehavior_1_0 = 0x4041000000000000;
}

- (UIEdgeInsets)attributionViewCollapsedModeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (attributionViewCollapsedModeInsets_once_0 != -1)
    dispatch_once(&attributionViewCollapsedModeInsets_once_0, &__block_literal_global_282_1);
  v2 = *(double *)&attributionViewCollapsedModeInsets_sBehavior_1_0;
  v3 = *(double *)&attributionViewCollapsedModeInsets_sBehavior_3_0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

void __53__CKUIBehaviorMac_attributionViewCollapsedModeInsets__block_invoke()
{
  attributionViewCollapsedModeInsets_sBehavior_1_0 = 0x4024000000000000;
  attributionViewCollapsedModeInsets_sBehavior_3_0 = 0x4024000000000000;
}

- (double)attributionCollapseButtonLeadingInset
{
  if (attributionCollapseButtonLeadingInset_once_0 != -1)
    dispatch_once(&attributionCollapseButtonLeadingInset_once_0, &__block_literal_global_283_1);
  return *(double *)&attributionCollapseButtonLeadingInset_sBehavior_0;
}

void __56__CKUIBehaviorMac_attributionCollapseButtonLeadingInset__block_invoke()
{
  attributionCollapseButtonLeadingInset_sBehavior_0 = 0x4000000000000000;
}

- (double)attributionVoteCountTrailingInset
{
  if (attributionVoteCountTrailingInset_once_0 != -1)
    dispatch_once(&attributionVoteCountTrailingInset_once_0, &__block_literal_global_284_1);
  return *(double *)&attributionVoteCountTrailingInset_sBehavior_0;
}

void __52__CKUIBehaviorMac_attributionVoteCountTrailingInset__block_invoke()
{
  attributionVoteCountTrailingInset_sBehavior_0 = 0xC024000000000000;
}

- (id)emojiStickerTranscriptCellFont
{
  if (emojiStickerTranscriptCellFont_once_0 != -1)
    dispatch_once(&emojiStickerTranscriptCellFont_once_0, &__block_literal_global_285_2);
  return (id)emojiStickerTranscriptCellFont_sBehavior_0;
}

void __49__CKUIBehaviorMac_emojiStickerTranscriptCellFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 52.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)emojiStickerTranscriptCellFont_sBehavior_0;
  emojiStickerTranscriptCellFont_sBehavior_0 = v0;

}

- (CGSize)emojiStickerTranscriptBalloonSize
{
  double v2;
  double v3;
  CGSize result;

  if (emojiStickerTranscriptBalloonSize_once_0 != -1)
    dispatch_once(&emojiStickerTranscriptBalloonSize_once_0, &__block_literal_global_286_1);
  v2 = *(double *)&emojiStickerTranscriptBalloonSize_sBehavior_0_0;
  v3 = *(double *)&emojiStickerTranscriptBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __52__CKUIBehaviorMac_emojiStickerTranscriptBalloonSize__block_invoke()
{
  emojiStickerTranscriptBalloonSize_sBehavior_0_0 = 0x4056800000000000;
  emojiStickerTranscriptBalloonSize_sBehavior_1_0 = 0x4056800000000000;
}

- (CGSize)stickerPopoverSize
{
  double v2;
  double v3;
  CGSize result;

  if (stickerPopoverSize_once_0 != -1)
    dispatch_once(&stickerPopoverSize_once_0, &__block_literal_global_287_2);
  v2 = *(double *)&stickerPopoverSize_sBehavior_0_0;
  v3 = *(double *)&stickerPopoverSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __37__CKUIBehaviorMac_stickerPopoverSize__block_invoke()
{
  stickerPopoverSize_sBehavior_0_0 = 0x4074000000000000;
  stickerPopoverSize_sBehavior_1_0 = 0x407E000000000000;
}

- (id)tapbackPickerSizingFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)tapbackPickerSizingFont_sContentSizeCategory_tapbackPickerSizingFont_0, (UIContentSizeCategory)v2)|| tapbackPickerSizingFont_sIsIncreaseContrastEnabled_tapbackPickerSizingFont_0 != v3|| tapbackPickerSizingFont_sIsBoldTextEnabled_tapbackPickerSizingFont_0 != IsBoldTextEnabled|| (v10 = tapbackPickerSizingFont_sTextFontSize_tapbackPickerSizingFont_0, *(double *)&tapbackPickerSizingFont_sTextFontSize_tapbackPickerSizingFont_0 != v5)|| (v10 = tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0, *(double *)&tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0 != v6)|| (objc_msgSend((id)tapbackPickerSizingFont_sCustomTextFontName_tapbackPickerSizingFont_0, "isEqualToString:", v9, *(double *)&tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0) & 1) == 0)
  {
    +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E0CEB580], *MEMORY[0x1E0CEB400], *(double *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_fontScaledByScaleFactor:", 0.85);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)tapbackPickerSizingFont_sBehavior_0;
    tapbackPickerSizingFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&tapbackPickerSizingFont_sContentSizeCategory_tapbackPickerSizingFont_0, v2);
    tapbackPickerSizingFont_sIsIncreaseContrastEnabled_tapbackPickerSizingFont_0 = v3;
    tapbackPickerSizingFont_sIsBoldTextEnabled_tapbackPickerSizingFont_0 = IsBoldTextEnabled;
    tapbackPickerSizingFont_sTextFontSize_tapbackPickerSizingFont_0 = *(_QWORD *)&v5;
    tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&tapbackPickerSizingFont_sCustomTextFontName_tapbackPickerSizingFont_0, v8);
  }
  v14 = (id)tapbackPickerSizingFont_sBehavior_0;

  return v14;
}

- (id)stickerDetailsCellBackgroundColor
{
  if (stickerDetailsCellBackgroundColor_once_0 != -1)
    dispatch_once(&stickerDetailsCellBackgroundColor_once_0, &__block_literal_global_288_1);
  return (id)stickerDetailsCellBackgroundColor_sBehavior;
}

void __52__CKUIBehaviorMac_stickerDetailsCellBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stickerDetailsCellBackgroundColor_sBehavior;
  stickerDetailsCellBackgroundColor_sBehavior = v0;

}

- (id)stickerSaveButtonConfiguration
{
  if (stickerSaveButtonConfiguration_once_0 != -1)
    dispatch_once(&stickerSaveButtonConfiguration_once_0, &__block_literal_global_289_1);
  return (id)stickerSaveButtonConfiguration_sBehavior_0;
}

void __49__CKUIBehaviorMac_stickerSaveButtonConfiguration__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "borderedButtonConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("STICKER_SAVE_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTitle:", v2);

  objc_msgSend(v0, "setButtonSize:", 1);
  objc_msgSend(v0, "setCornerStyle:", 4);
  objc_msgSend(v0, "setMacIdiomStyle:", 1);
  v3 = (void *)stickerSaveButtonConfiguration_sBehavior_0;
  stickerSaveButtonConfiguration_sBehavior_0 = (uint64_t)v0;

}

- (id)stickerViewButtonConfiguration
{
  if (stickerViewButtonConfiguration_once_0 != -1)
    dispatch_once(&stickerViewButtonConfiguration_once_0, &__block_literal_global_293_1);
  return (id)stickerViewButtonConfiguration_sBehavior_0;
}

void __49__CKUIBehaviorMac_stickerViewButtonConfiguration__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "borderedButtonConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("STICKER_VIEW_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTitle:", v2);

  objc_msgSend(v0, "setButtonSize:", 1);
  objc_msgSend(v0, "setCornerStyle:", 4);
  objc_msgSend(v0, "setMacIdiomStyle:", 1);
  v3 = (void *)stickerViewButtonConfiguration_sBehavior_0;
  stickerViewButtonConfiguration_sBehavior_0 = (uint64_t)v0;

}

- (CGSize)avatarSize
{
  double v2;
  double v3;
  CGSize result;

  if (avatarSize_once_0 != -1)
    dispatch_once(&avatarSize_once_0, &__block_literal_global_296_0);
  v2 = *(double *)&avatarSize_sBehavior_0_0;
  v3 = *(double *)&avatarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

double __29__CKUIBehaviorMac_avatarSize__block_invoke()
{
  double v0;
  double v1;
  double result;

  if (IMEnableTranscriptChromelessNavBar())
  {
    if (CKPixelWidth_once_13 != -1)
      dispatch_once(&CKPixelWidth_once_13, &__block_literal_global_743_1);
    v0 = 46.0;
    v1 = *(double *)&CKPixelWidth_sPixel_13 + 46.0;
  }
  else
  {
    if (CKPixelWidth_once_13 != -1)
      dispatch_once(&CKPixelWidth_once_13, &__block_literal_global_743_1);
    v0 = 30.0;
    v1 = *(double *)&CKPixelWidth_sPixel_13 + 30.0;
  }
  result = *(double *)&CKPixelWidth_sPixel_13 + v0;
  avatarSize_sBehavior_0_0 = *(_QWORD *)&v1;
  avatarSize_sBehavior_1_0 = *(_QWORD *)&result;
  return result;
}

- (double)avatarSpacingMargin
{
  if (avatarSpacingMargin_once_0 != -1)
    dispatch_once(&avatarSpacingMargin_once_0, &__block_literal_global_297_1);
  return *(double *)&avatarSpacingMargin_sBehavior_0;
}

void __38__CKUIBehaviorMac_avatarSpacingMargin__block_invoke()
{
  avatarSpacingMargin_sBehavior_0 = 0x4042800000000000;
}

- (double)avatarNameWidth
{
  if (avatarNameWidth_once_0 != -1)
    dispatch_once(&avatarNameWidth_once_0, &__block_literal_global_298_1);
  return *(double *)&avatarNameWidth_sBehavior_0;
}

void __34__CKUIBehaviorMac_avatarNameWidth__block_invoke()
{
  avatarNameWidth_sBehavior_0 = 0x4050400000000000;
}

- (double)avatarContactImageNameMargin
{
  if (avatarContactImageNameMargin_once_0 != -1)
    dispatch_once(&avatarContactImageNameMargin_once_0, &__block_literal_global_299_1);
  return *(double *)&avatarContactImageNameMargin_sBehavior_0;
}

void __47__CKUIBehaviorMac_avatarContactImageNameMargin__block_invoke()
{
  avatarContactImageNameMargin_sBehavior_0 = 0x4020000000000000;
}

- (id)avatarNameFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)avatarNameFont_sContentSizeCategory_avatarNameFont_0, (UIContentSizeCategory)v2)|| avatarNameFont_sIsIncreaseContrastEnabled_avatarNameFont_0 != v3|| avatarNameFont_sIsBoldTextEnabled_avatarNameFont_0 != IsBoldTextEnabled|| (v10 = avatarNameFont_sTextFontSize_avatarNameFont_0, *(double *)&avatarNameFont_sTextFontSize_avatarNameFont_0 != v5)|| (v10 = avatarNameFont_sCustomTextFontSize_avatarNameFont_0, *(double *)&avatarNameFont_sCustomTextFontSize_avatarNameFont_0 != v6)|| (objc_msgSend((id)avatarNameFont_sCustomTextFontName_avatarNameFont_0, "isEqualToString:", v9, *(double *)&avatarNameFont_sCustomTextFontSize_avatarNameFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0CEB540], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)avatarNameFont_sBehavior_0;
    avatarNameFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&avatarNameFont_sContentSizeCategory_avatarNameFont_0, v2);
    avatarNameFont_sIsIncreaseContrastEnabled_avatarNameFont_0 = v3;
    avatarNameFont_sIsBoldTextEnabled_avatarNameFont_0 = IsBoldTextEnabled;
    avatarNameFont_sTextFontSize_avatarNameFont_0 = *(_QWORD *)&v5;
    avatarNameFont_sCustomTextFontSize_avatarNameFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&avatarNameFont_sCustomTextFontName_avatarNameFont_0, v8);
  }
  v13 = (id)avatarNameFont_sBehavior_0;

  return v13;
}

- (UIEdgeInsets)searchSectionMarginInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (searchSectionMarginInsets_once_0 != -1)
    dispatch_once(&searchSectionMarginInsets_once_0, &__block_literal_global_300_1);
  v2 = *(double *)&searchSectionMarginInsets_sBehavior_0;
  v3 = *(double *)&searchSectionMarginInsets_sBehavior_2;
  v4 = *(double *)&searchSectionMarginInsets_sBehavior_3_0;
  v5 = 0.0;
  result.right = v4;
  result.bottom = v3;
  result.left = v5;
  result.top = v2;
  return result;
}

void __44__CKUIBehaviorMac_searchSectionMarginInsets__block_invoke()
{
  searchSectionMarginInsets_sBehavior_0 = 0x4024000000000000;
  searchSectionMarginInsets_sBehavior_2 = 0x4024000000000000;
  searchSectionMarginInsets_sBehavior_3_0 = 0x4030000000000000;
}

- (double)searchLeadingAndTrailingMaxPadding
{
  if (searchLeadingAndTrailingMaxPadding_once_0 != -1)
    dispatch_once(&searchLeadingAndTrailingMaxPadding_once_0, &__block_literal_global_301_1);
  return *(double *)&searchLeadingAndTrailingMaxPadding_sBehavior_0;
}

void __53__CKUIBehaviorMac_searchLeadingAndTrailingMaxPadding__block_invoke()
{
  searchLeadingAndTrailingMaxPadding_sBehavior_0 = 0x4028000000000000;
}

- (double)searchDetailsLeadingAndTrailingMaxPadding
{
  if (searchDetailsLeadingAndTrailingMaxPadding_once_0 != -1)
    dispatch_once(&searchDetailsLeadingAndTrailingMaxPadding_once_0, &__block_literal_global_302_1);
  return *(double *)&searchDetailsLeadingAndTrailingMaxPadding_sBehavior_0;
}

void __60__CKUIBehaviorMac_searchDetailsLeadingAndTrailingMaxPadding__block_invoke()
{
  searchDetailsLeadingAndTrailingMaxPadding_sBehavior_0 = 0x4030000000000000;
}

- (NSDirectionalEdgeInsets)searchResultsInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  if (searchResultsInsets_once_0 != -1)
    dispatch_once(&searchResultsInsets_once_0, &__block_literal_global_303_0);
  v3 = *((double *)&searchResultsInsets_sBehavior_0 + 1);
  v2 = *(double *)&searchResultsInsets_sBehavior_0;
  v4 = *(double *)&qword_1EE113900;
  v5 = unk_1EE113908;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

__n128 __38__CKUIBehaviorMac_searchResultsInsets__block_invoke()
{
  __n128 result;
  __int128 v1;

  result = *(__n128 *)MEMORY[0x1E0CEA080];
  v1 = *(_OWORD *)(MEMORY[0x1E0CEA080] + 16);
  searchResultsInsets_sBehavior_0 = *MEMORY[0x1E0CEA080];
  *(_OWORD *)&qword_1EE113900 = v1;
  return result;
}

- (double)searchResultsTitleHeaderTopPadding
{
  if (searchResultsTitleHeaderTopPadding_once_0 != -1)
    dispatch_once(&searchResultsTitleHeaderTopPadding_once_0, &__block_literal_global_304_0);
  return *(double *)&searchResultsTitleHeaderTopPadding_sBehavior_0;
}

void __53__CKUIBehaviorMac_searchResultsTitleHeaderTopPadding__block_invoke()
{
  searchResultsTitleHeaderTopPadding_sBehavior_0 = 0x4020000000000000;
}

- (double)searchResultsTitleHeaderBottomPadding
{
  if (searchResultsTitleHeaderBottomPadding_once_0 != -1)
    dispatch_once(&searchResultsTitleHeaderBottomPadding_once_0, &__block_literal_global_305_1);
  return *(double *)&searchResultsTitleHeaderBottomPadding_sBehavior_0;
}

void __56__CKUIBehaviorMac_searchResultsTitleHeaderBottomPadding__block_invoke()
{
  searchResultsTitleHeaderBottomPadding_sBehavior_0 = 0x4020000000000000;
}

- (BOOL)conversationListHidesSearchBarWhenScrolling
{
  if (conversationListHidesSearchBarWhenScrolling_once_0 != -1)
    dispatch_once(&conversationListHidesSearchBarWhenScrolling_once_0, &__block_literal_global_306_0);
  return 0;
}

- (double)searchConversationMinAvatarLabelSpacing
{
  if (searchConversationMinAvatarLabelSpacing_once_0 != -1)
    dispatch_once(&searchConversationMinAvatarLabelSpacing_once_0, &__block_literal_global_307_0);
  return *(double *)&searchConversationMinAvatarLabelSpacing_sBehavior_0;
}

void __58__CKUIBehaviorMac_searchConversationMinAvatarLabelSpacing__block_invoke()
{
  searchConversationMinAvatarLabelSpacing_sBehavior_0 = 0x4018000000000000;
}

- (NSDirectionalEdgeInsets)searchConversationSectionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  if (searchConversationSectionInsets_once_0 != -1)
    dispatch_once(&searchConversationSectionInsets_once_0, &__block_literal_global_308_1);
  v2 = *(double *)&searchConversationSectionInsets_sBehavior_0_0;
  v3 = *(double *)&searchConversationSectionInsets_sBehavior_2_0;
  v4 = 0.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v3;
  result.leading = v4;
  result.top = v2;
  return result;
}

void __50__CKUIBehaviorMac_searchConversationSectionInsets__block_invoke()
{
  searchConversationSectionInsets_sBehavior_0_0 = 0x4024000000000000;
  searchConversationSectionInsets_sBehavior_2_0 = 0x4030000000000000;
}

- (double)searchCellCornerRadius
{
  if (searchCellCornerRadius_once != -1)
    dispatch_once(&searchCellCornerRadius_once, &__block_literal_global_309_1);
  return *(double *)&searchCellCornerRadius_sBehavior;
}

void __41__CKUIBehaviorMac_searchCellCornerRadius__block_invoke()
{
  searchCellCornerRadius_sBehavior = 0x4024000000000000;
}

- (id)searchHeaderFont
{
  NSString *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  CKPreferredContentSizeCategory();
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  v11 = (id *)&unk_1EE116000;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchHeaderFont_sContentSizeCategory_searchHeaderFont_0, v2)|| searchHeaderFont_sIsIncreaseContrastEnabled_searchHeaderFont_0 != v3|| searchHeaderFont_sIsBoldTextEnabled_searchHeaderFont_0 != IsBoldTextEnabled|| (v10 = searchHeaderFont_sTextFontSize_searchHeaderFont_0, *(double *)&searchHeaderFont_sTextFontSize_searchHeaderFont_0 != v5)|| (v10 = searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0, *(double *)&searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0 != v6)|| (objc_msgSend((id)searchHeaderFont_sCustomTextFontName_searchHeaderFont_0, "isEqualToString:", v9, *(double *)&searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB568], 0x8000, 0, *(double *)&v10);
    v22 = v2;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0DC13C0];
    v23 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id *)&unk_1EE116000;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, 0.0);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = v14;
    v19 = (void *)searchHeaderFont_sBehavior_0;
    searchHeaderFont_sBehavior_0 = v18;
    v2 = v22;

    objc_storeStrong((id *)&searchHeaderFont_sContentSizeCategory_searchHeaderFont_0, v22);
    searchHeaderFont_sIsIncreaseContrastEnabled_searchHeaderFont_0 = v3;
    searchHeaderFont_sIsBoldTextEnabled_searchHeaderFont_0 = IsBoldTextEnabled;
    searchHeaderFont_sTextFontSize_searchHeaderFont_0 = *(_QWORD *)&v5;
    searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchHeaderFont_sCustomTextFontName_searchHeaderFont_0, v8);
  }
  v20 = v11[49];

  return v20;
}

- (id)searchHeaderButtonFont
{
  NSString *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  CKPreferredContentSizeCategory();
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  v11 = (id *)&unk_1EE116000;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchHeaderButtonFont_sContentSizeCategory_searchHeaderButtonFont_0, v2)|| searchHeaderButtonFont_sIsIncreaseContrastEnabled_searchHeaderButtonFont_0 != v3|| searchHeaderButtonFont_sIsBoldTextEnabled_searchHeaderButtonFont_0 != IsBoldTextEnabled|| (v10 = searchHeaderButtonFont_sTextFontSize_searchHeaderButtonFont_0, *(double *)&searchHeaderButtonFont_sTextFontSize_searchHeaderButtonFont_0 != v5)|| (v10 = searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0, *(double *)&searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0 != v6)|| (objc_msgSend((id)searchHeaderButtonFont_sCustomTextFontName_searchHeaderButtonFont_0, "isEqualToString:", v9, *(double *)&searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 0x8000, 0, *(double *)&v10);
    v22 = v2;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0DC13C0];
    v23 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1440]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id *)&unk_1EE116000;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, 0.0);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = v14;
    v19 = (void *)searchHeaderButtonFont_sBehavior_0;
    searchHeaderButtonFont_sBehavior_0 = v18;
    v2 = v22;

    objc_storeStrong((id *)&searchHeaderButtonFont_sContentSizeCategory_searchHeaderButtonFont_0, v22);
    searchHeaderButtonFont_sIsIncreaseContrastEnabled_searchHeaderButtonFont_0 = v3;
    searchHeaderButtonFont_sIsBoldTextEnabled_searchHeaderButtonFont_0 = IsBoldTextEnabled;
    searchHeaderButtonFont_sTextFontSize_searchHeaderButtonFont_0 = *(_QWORD *)&v5;
    searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchHeaderButtonFont_sCustomTextFontName_searchHeaderButtonFont_0, v8);
  }
  v20 = v11[45];

  return v20;
}

- (id)searchResultLabelFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchResultLabelFont_sContentSizeCategory_searchResultLabelFont_0, (UIContentSizeCategory)v2)|| searchResultLabelFont_sIsIncreaseContrastEnabled_searchResultLabelFont_0 != v3|| searchResultLabelFont_sIsBoldTextEnabled_searchResultLabelFont_0 != IsBoldTextEnabled|| (v10 = searchResultLabelFont_sTextFontSize_searchResultLabelFont_0, *(double *)&searchResultLabelFont_sTextFontSize_searchResultLabelFont_0 != v5)|| (v10 = searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0, *(double *)&searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0 != v6)|| (objc_msgSend((id)searchResultLabelFont_sCustomTextFontName_searchResultLabelFont_0, "isEqualToString:", v9, *(double *)&searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)searchResultLabelFont_sBehavior_0;
    searchResultLabelFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&searchResultLabelFont_sContentSizeCategory_searchResultLabelFont_0, v2);
    searchResultLabelFont_sIsIncreaseContrastEnabled_searchResultLabelFont_0 = v3;
    searchResultLabelFont_sIsBoldTextEnabled_searchResultLabelFont_0 = IsBoldTextEnabled;
    searchResultLabelFont_sTextFontSize_searchResultLabelFont_0 = *(_QWORD *)&v5;
    searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchResultLabelFont_sCustomTextFontName_searchResultLabelFont_0, v8);
  }
  v13 = (id)searchResultLabelFont_sBehavior_0;

  return v13;
}

- (id)searchMessageBodyTextFont
{
  NSString *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  CKPreferredContentSizeCategory();
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  v11 = &macJoinFaceTimeNSToolbarItemSize_once;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchMessageBodyTextFont_sContentSizeCategory_searchMessageBodyTextFont, v2)|| searchMessageBodyTextFont_sIsIncreaseContrastEnabled_searchMessageBodyTextFont != v3|| searchMessageBodyTextFont_sIsBoldTextEnabled_searchMessageBodyTextFont != IsBoldTextEnabled|| (v10 = searchMessageBodyTextFont_sTextFontSize_searchMessageBodyTextFont, *(double *)&searchMessageBodyTextFont_sTextFontSize_searchMessageBodyTextFont != v5)|| (v10 = searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont, *(double *)&searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont != v6)|| (objc_msgSend((id)searchMessageBodyTextFont_sCustomTextFontName_searchMessageBodyTextFont, "isEqualToString:", v9, *(double *)&searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 0x8000, 0, *(double *)&v10);
    v22 = v2;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0DC13C0];
    v23 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1440]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = &macJoinFaceTimeNSToolbarItemSize_once;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, 0.0);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = v14;
    v19 = (void *)searchMessageBodyTextFont_sBehavior;
    searchMessageBodyTextFont_sBehavior = v18;
    v2 = v22;

    objc_storeStrong((id *)&searchMessageBodyTextFont_sContentSizeCategory_searchMessageBodyTextFont, v22);
    searchMessageBodyTextFont_sIsIncreaseContrastEnabled_searchMessageBodyTextFont = v3;
    searchMessageBodyTextFont_sIsBoldTextEnabled_searchMessageBodyTextFont = IsBoldTextEnabled;
    searchMessageBodyTextFont_sTextFontSize_searchMessageBodyTextFont = *(_QWORD *)&v5;
    searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchMessageBodyTextFont_sCustomTextFontName_searchMessageBodyTextFont, v8);
  }
  v20 = (id)v11[228];

  return v20;
}

- (id)searchIndexingTitleFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchIndexingTitleFont_sContentSizeCategory_searchIndexingTitleFont_0, (UIContentSizeCategory)v2)|| searchIndexingTitleFont_sIsIncreaseContrastEnabled_searchIndexingTitleFont_0 != v3|| searchIndexingTitleFont_sIsBoldTextEnabled_searchIndexingTitleFont_0 != IsBoldTextEnabled|| (v10 = searchIndexingTitleFont_sTextFontSize_searchIndexingTitleFont_0, *(double *)&searchIndexingTitleFont_sTextFontSize_searchIndexingTitleFont_0 != v5)|| (v10 = searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0, *(double *)&searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0 != v6)|| (objc_msgSend((id)searchIndexingTitleFont_sCustomTextFontName_searchIndexingTitleFont_0, "isEqualToString:", v9, *(double *)&searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0x8000, 0, *(double *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)searchIndexingTitleFont_sBehavior_0;
    searchIndexingTitleFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&searchIndexingTitleFont_sContentSizeCategory_searchIndexingTitleFont_0, v2);
    searchIndexingTitleFont_sIsIncreaseContrastEnabled_searchIndexingTitleFont_0 = v3;
    searchIndexingTitleFont_sIsBoldTextEnabled_searchIndexingTitleFont_0 = IsBoldTextEnabled;
    searchIndexingTitleFont_sTextFontSize_searchIndexingTitleFont_0 = *(_QWORD *)&v5;
    searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchIndexingTitleFont_sCustomTextFontName_searchIndexingTitleFont_0, v8);
  }
  v14 = (id)searchIndexingTitleFont_sBehavior_0;

  return v14;
}

- (id)searchIndexingSubtitleFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchIndexingSubtitleFont_sContentSizeCategory_searchIndexingSubtitleFont_0, (UIContentSizeCategory)v2)|| searchIndexingSubtitleFont_sIsIncreaseContrastEnabled_searchIndexingSubtitleFont_0 != v3|| searchIndexingSubtitleFont_sIsBoldTextEnabled_searchIndexingSubtitleFont_0 != IsBoldTextEnabled|| (v10 = searchIndexingSubtitleFont_sTextFontSize_searchIndexingSubtitleFont_0, *(double *)&searchIndexingSubtitleFont_sTextFontSize_searchIndexingSubtitleFont_0 != v5)|| (v10 = searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0, *(double *)&searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0 != v6)|| (objc_msgSend((id)searchIndexingSubtitleFont_sCustomTextFontName_searchIndexingSubtitleFont_0, "isEqualToString:", v9, *(double *)&searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)searchIndexingSubtitleFont_sBehavior_0;
    searchIndexingSubtitleFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&searchIndexingSubtitleFont_sContentSizeCategory_searchIndexingSubtitleFont_0, v2);
    searchIndexingSubtitleFont_sIsIncreaseContrastEnabled_searchIndexingSubtitleFont_0 = v3;
    searchIndexingSubtitleFont_sIsBoldTextEnabled_searchIndexingSubtitleFont_0 = IsBoldTextEnabled;
    searchIndexingSubtitleFont_sTextFontSize_searchIndexingSubtitleFont_0 = *(_QWORD *)&v5;
    searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&searchIndexingSubtitleFont_sCustomTextFontName_searchIndexingSubtitleFont_0, v8);
  }
  v13 = (id)searchIndexingSubtitleFont_sBehavior_0;

  return v13;
}

- (id)replyButtonFont
{
  void *v3;
  int v4;
  int IsBoldTextEnabled;
  double v6;
  double v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  CKPreferredContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v6 = CKUserPreferenceFontSize();
  v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v8, "length"))
    v9 = v8;
  else
    v9 = CFSTR("None");
  v10 = v9;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)replyButtonFont_sContentSizeCategory_replyButtonFont_0, (UIContentSizeCategory)v3)|| replyButtonFont_sIsIncreaseContrastEnabled_replyButtonFont_0 != v4|| replyButtonFont_sIsBoldTextEnabled_replyButtonFont_0 != IsBoldTextEnabled|| (v11 = replyButtonFont_sTextFontSize_replyButtonFont_0, *(double *)&replyButtonFont_sTextFontSize_replyButtonFont_0 != v6)|| (v11 = replyButtonFont_sCustomTextFontSize_replyButtonFont_0, *(double *)&replyButtonFont_sCustomTextFontSize_replyButtonFont_0 != v7)|| (objc_msgSend((id)replyButtonFont_sCustomTextFontName_replyButtonFont_0, "isEqualToString:", v10, *(double *)&replyButtonFont_sCustomTextFontSize_replyButtonFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590], *(double *)&v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 14.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKUIBehaviorMac textFontUserDefaults:](self, "textFontUserDefaults:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)replyButtonFont_sBehavior_0;
    replyButtonFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&replyButtonFont_sContentSizeCategory_replyButtonFont_0, v3);
    replyButtonFont_sIsIncreaseContrastEnabled_replyButtonFont_0 = v4;
    replyButtonFont_sIsBoldTextEnabled_replyButtonFont_0 = IsBoldTextEnabled;
    replyButtonFont_sTextFontSize_replyButtonFont_0 = *(_QWORD *)&v6;
    replyButtonFont_sCustomTextFontSize_replyButtonFont_0 = *(_QWORD *)&v7;
    objc_storeStrong((id *)&replyButtonFont_sCustomTextFontName_replyButtonFont_0, v9);
  }
  v16 = (id)replyButtonFont_sBehavior_0;

  return v16;
}

- (NSDirectionalEdgeInsets)searchMessagesSectionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  if (searchMessagesSectionInsets_once_0 != -1)
    dispatch_once(&searchMessagesSectionInsets_once_0, &__block_literal_global_310_1);
  v2 = *(double *)&searchMessagesSectionInsets_sBehavior_0;
  v3 = *(double *)&searchMessagesSectionInsets_sBehavior_2;
  v4 = 0.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v3;
  result.leading = v4;
  result.top = v2;
  return result;
}

void __46__CKUIBehaviorMac_searchMessagesSectionInsets__block_invoke()
{
  searchMessagesSectionInsets_sBehavior_0 = 0x4000000000000000;
  searchMessagesSectionInsets_sBehavior_2 = 0x4000000000000000;
}

- (double)searchMessagesConversationToSenderSpacing
{
  if (searchMessagesConversationToSenderSpacing_once_0 != -1)
    dispatch_once(&searchMessagesConversationToSenderSpacing_once_0, &__block_literal_global_311_1);
  return 0.0;
}

- (double)searchMessagesSenderToBalloonSpacing
{
  if (searchMessagesSenderToBalloonSpacing_once_0 != -1)
    dispatch_once(&searchMessagesSenderToBalloonSpacing_once_0, &__block_literal_global_312_1);
  return *(double *)&searchMessagesSenderToBalloonSpacing_sBehavior_0;
}

void __55__CKUIBehaviorMac_searchMessagesSenderToBalloonSpacing__block_invoke()
{
  searchMessagesSenderToBalloonSpacing_sBehavior_0 = 0x4014000000000000;
}

- (double)searchPhotosCellCornerRadius
{
  if (searchPhotosCellCornerRadius_once != -1)
    dispatch_once(&searchPhotosCellCornerRadius_once, &__block_literal_global_313_1);
  return *(double *)&searchPhotosCellCornerRadius_sBehavior;
}

void __47__CKUIBehaviorMac_searchPhotosCellCornerRadius__block_invoke()
{
  searchPhotosCellCornerRadius_sBehavior = 0x4020000000000000;
}

- (double)searchPhotosCellZKWAndDetailsCornerRadius
{
  if (searchPhotosCellZKWAndDetailsCornerRadius_once_0 != -1)
    dispatch_once(&searchPhotosCellZKWAndDetailsCornerRadius_once_0, &__block_literal_global_314_1);
  return *(double *)&searchPhotosCellZKWAndDetailsCornerRadius_sBehavior_0;
}

void __60__CKUIBehaviorMac_searchPhotosCellZKWAndDetailsCornerRadius__block_invoke()
{
  searchPhotosCellZKWAndDetailsCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)searchPhotosInterItemSpacing
{
  if (searchPhotosInterItemSpacing_once_0 != -1)
    dispatch_once(&searchPhotosInterItemSpacing_once_0, &__block_literal_global_315_1);
  return *(double *)&searchPhotosInterItemSpacing_sBehavior_0;
}

void __47__CKUIBehaviorMac_searchPhotosInterItemSpacing__block_invoke()
{
  searchPhotosInterItemSpacing_sBehavior_0 = 0x4024000000000000;
}

- (double)searchPhotosZKWAndDetailsInterItemSpacing
{
  if (searchPhotosZKWAndDetailsInterItemSpacing_once_0 != -1)
    dispatch_once(&searchPhotosZKWAndDetailsInterItemSpacing_once_0, &__block_literal_global_316_1);
  return *(double *)&searchPhotosZKWAndDetailsInterItemSpacing_sBehavior_0;
}

void __60__CKUIBehaviorMac_searchPhotosZKWAndDetailsInterItemSpacing__block_invoke()
{
  searchPhotosZKWAndDetailsInterItemSpacing_sBehavior_0 = 0x4024000000000000;
}

- (double)searchPhotosInterItemSpacingDetailsView
{
  if (searchPhotosInterItemSpacingDetailsView_once_0 != -1)
    dispatch_once(&searchPhotosInterItemSpacingDetailsView_once_0, &__block_literal_global_317_1);
  return *(double *)&searchPhotosInterItemSpacingDetailsView_sBehavior_0;
}

double __58__CKUIBehaviorMac_searchPhotosInterItemSpacingDetailsView__block_invoke()
{
  double v0;
  double result;

  if (CKMainScreenScale_once_65 != -1)
    dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_741_0);
  v0 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v0 = 1.0;
  result = round(v0 * 10.0) / v0;
  searchPhotosInterItemSpacingDetailsView_sBehavior_0 = *(_QWORD *)&result;
  return result;
}

- (double)searchLinksCellCornerRadius
{
  if (searchLinksCellCornerRadius_once_0 != -1)
    dispatch_once(&searchLinksCellCornerRadius_once_0, &__block_literal_global_318_0);
  return *(double *)&searchLinksCellCornerRadius_sBehavior_0;
}

void __46__CKUIBehaviorMac_searchLinksCellCornerRadius__block_invoke()
{
  searchLinksCellCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)searchAttachmentsCellCornerRadius
{
  if (searchAttachmentsCellCornerRadius_once_0 != -1)
    dispatch_once(&searchAttachmentsCellCornerRadius_once_0, &__block_literal_global_319_1);
  return *(double *)&searchAttachmentsCellCornerRadius_sBehavior_0;
}

void __52__CKUIBehaviorMac_searchAttachmentsCellCornerRadius__block_invoke()
{
  searchAttachmentsCellCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)searchLocationsCellCornerRadius
{
  if (searchLocationsCellCornerRadius_once != -1)
    dispatch_once(&searchLocationsCellCornerRadius_once, &__block_literal_global_320_0);
  return *(double *)&searchLocationsCellCornerRadius_sBehavior;
}

void __50__CKUIBehaviorMac_searchLocationsCellCornerRadius__block_invoke()
{
  searchLocationsCellCornerRadius_sBehavior = 0x4020000000000000;
}

- (double)mapPreviewMaxWidth
{
  if (mapPreviewMaxWidth_once_0 != -1)
    dispatch_once(&mapPreviewMaxWidth_once_0, &__block_literal_global_321_0);
  return *(double *)&mapPreviewMaxWidth_sBehavior_0;
}

void __37__CKUIBehaviorMac_mapPreviewMaxWidth__block_invoke()
{
  mapPreviewMaxWidth_sBehavior_0 = 0x407F400000000000;
}

- (double)searchDropdownAvatarDiameter
{
  if (searchDropdownAvatarDiameter_once != -1)
    dispatch_once(&searchDropdownAvatarDiameter_once, &__block_literal_global_322_1);
  return *(double *)&searchDropdownAvatarDiameter_sBehavior;
}

void __47__CKUIBehaviorMac_searchDropdownAvatarDiameter__block_invoke()
{
  searchDropdownAvatarDiameter_sBehavior = 0x4030000000000000;
}

- (id)recipientNameFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)recipientNameFont_sContentSizeCategory_recipientNameFont_0, (UIContentSizeCategory)v2)|| recipientNameFont_sIsIncreaseContrastEnabled_recipientNameFont_0 != v3|| recipientNameFont_sIsBoldTextEnabled_recipientNameFont_0 != IsBoldTextEnabled|| (v10 = recipientNameFont_sTextFontSize_recipientNameFont_0, *(double *)&recipientNameFont_sTextFontSize_recipientNameFont_0 != v5)|| (v10 = recipientNameFont_sCustomTextFontSize_recipientNameFont_0, *(double *)&recipientNameFont_sCustomTextFontSize_recipientNameFont_0 != v6)|| (objc_msgSend((id)recipientNameFont_sCustomTextFontName_recipientNameFont_0, "isEqualToString:", v9, *(double *)&recipientNameFont_sCustomTextFontSize_recipientNameFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 0x8000, 0, *(double *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)recipientNameFont_sBehavior_0;
    recipientNameFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&recipientNameFont_sContentSizeCategory_recipientNameFont_0, v2);
    recipientNameFont_sIsIncreaseContrastEnabled_recipientNameFont_0 = v3;
    recipientNameFont_sIsBoldTextEnabled_recipientNameFont_0 = IsBoldTextEnabled;
    recipientNameFont_sTextFontSize_recipientNameFont_0 = *(_QWORD *)&v5;
    recipientNameFont_sCustomTextFontSize_recipientNameFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&recipientNameFont_sCustomTextFontName_recipientNameFont_0, v8);
  }
  v14 = (id)recipientNameFont_sBehavior_0;

  return v14;
}

- (double)detailsContactCellButtonWidth
{
  if (detailsContactCellButtonWidth_once_0 != -1)
    dispatch_once(&detailsContactCellButtonWidth_once_0, &__block_literal_global_323_0);
  return *(double *)&detailsContactCellButtonWidth_sBehavior_0;
}

void __48__CKUIBehaviorMac_detailsContactCellButtonWidth__block_invoke()
{
  detailsContactCellButtonWidth_sBehavior_0 = 0x4039000000000000;
}

- (double)detailsContactCellButtonHeight
{
  if (detailsContactCellButtonHeight_once_0 != -1)
    dispatch_once(&detailsContactCellButtonHeight_once_0, &__block_literal_global_324_0);
  return *(double *)&detailsContactCellButtonHeight_sBehavior_0;
}

void __49__CKUIBehaviorMac_detailsContactCellButtonHeight__block_invoke()
{
  detailsContactCellButtonHeight_sBehavior_0 = 0x4039000000000000;
}

- (UIEdgeInsets)detailsContactCellButtonEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (detailsContactCellButtonEdgeInsets_once_0 != -1)
    dispatch_once(&detailsContactCellButtonEdgeInsets_once_0, &__block_literal_global_325_0);
  v2 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_0_0;
  v3 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_1_0;
  v4 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_2_0;
  v5 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __53__CKUIBehaviorMac_detailsContactCellButtonEdgeInsets__block_invoke()
{
  detailsContactCellButtonEdgeInsets_sBehavior_0_0 = 0x4020000000000000;
  detailsContactCellButtonEdgeInsets_sBehavior_1_0 = 0x4018000000000000;
  detailsContactCellButtonEdgeInsets_sBehavior_2_0 = 0x4020000000000000;
  detailsContactCellButtonEdgeInsets_sBehavior_3_0 = 0x4018000000000000;
}

- (double)detailsContactCellMinimumHeight
{
  if (detailsContactCellMinimumHeight_once_0 != -1)
    dispatch_once(&detailsContactCellMinimumHeight_once_0, &__block_literal_global_326_0);
  return *(double *)&detailsContactCellMinimumHeight_sBehavior_0;
}

void __50__CKUIBehaviorMac_detailsContactCellMinimumHeight__block_invoke()
{
  detailsContactCellMinimumHeight_sBehavior_0 = 0x4044000000000000;
}

- (int64_t)detailsGroupChevronImageScale
{
  if (detailsGroupChevronImageScale_once_0 != -1)
    dispatch_once(&detailsGroupChevronImageScale_once_0, &__block_literal_global_327_0);
  return (uint64_t)((unint64_t)detailsGroupChevronImageScale_sBehavior_0 << 63) >> 63;
}

void __48__CKUIBehaviorMac_detailsGroupChevronImageScale__block_invoke()
{
  detailsGroupChevronImageScale_sBehavior_0 = 1;
}

- (double)detailsGroupButtonHeight
{
  if (detailsGroupButtonHeight_once != -1)
    dispatch_once(&detailsGroupButtonHeight_once, &__block_literal_global_328);
  return *(double *)&detailsGroupButtonHeight_sBehavior;
}

void __43__CKUIBehaviorMac_detailsGroupButtonHeight__block_invoke()
{
  detailsGroupButtonHeight_sBehavior = 0x4039000000000000;
}

- (double)detailsGroupButtonWidth
{
  if (detailsGroupButtonWidth_once != -1)
    dispatch_once(&detailsGroupButtonWidth_once, &__block_literal_global_329_0);
  return *(double *)&detailsGroupButtonWidth_sBehavior;
}

void __42__CKUIBehaviorMac_detailsGroupButtonWidth__block_invoke()
{
  detailsGroupButtonWidth_sBehavior = 0x4039000000000000;
}

- (double)detailsInterGroupButtonPadding
{
  if (detailsInterGroupButtonPadding_once != -1)
    dispatch_once(&detailsInterGroupButtonPadding_once, &__block_literal_global_330_0);
  return *(double *)&detailsInterGroupButtonPadding_sBehavior;
}

void __49__CKUIBehaviorMac_detailsInterGroupButtonPadding__block_invoke()
{
  detailsInterGroupButtonPadding_sBehavior = 0x4014000000000000;
}

- (double)detailsMapViewInset
{
  if (detailsMapViewInset_once != -1)
    dispatch_once(&detailsMapViewInset_once, &__block_literal_global_331_0);
  return *(double *)&detailsMapViewInset_sBehavior;
}

void __38__CKUIBehaviorMac_detailsMapViewInset__block_invoke()
{
  detailsMapViewInset_sBehavior = 0x3F847AE147AE147BLL;
}

- (double)detailsToFieldPreferredHeight
{
  if (detailsToFieldPreferredHeight_once != -1)
    dispatch_once(&detailsToFieldPreferredHeight_once, &__block_literal_global_332_0);
  return *(double *)&detailsToFieldPreferredHeight_sBehavior;
}

void __48__CKUIBehaviorMac_detailsToFieldPreferredHeight__block_invoke()
{
  detailsToFieldPreferredHeight_sBehavior = 0x4049000000000000;
}

- (double)detailsContactImageDiameter
{
  if (detailsContactImageDiameter_once != -1)
    dispatch_once(&detailsContactImageDiameter_once, &__block_literal_global_333_0);
  return *(double *)&detailsContactImageDiameter_sBehavior;
}

void __46__CKUIBehaviorMac_detailsContactImageDiameter__block_invoke()
{
  detailsContactImageDiameter_sBehavior = 0x4040000000000000;
}

- (double)detailsPreferredContentSizeWidth
{
  if (detailsPreferredContentSizeWidth_once != -1)
    dispatch_once(&detailsPreferredContentSizeWidth_once, &__block_literal_global_334_1);
  return *(double *)&detailsPreferredContentSizeWidth_sBehavior;
}

void __51__CKUIBehaviorMac_detailsPreferredContentSizeWidth__block_invoke()
{
  detailsPreferredContentSizeWidth_sBehavior = 0x4074000000000000;
}

- (double)collaborationDetailsPreferredContentSizeWidth
{
  if (collaborationDetailsPreferredContentSizeWidth_once != -1)
    dispatch_once(&collaborationDetailsPreferredContentSizeWidth_once, &__block_literal_global_335_0);
  return *(double *)&collaborationDetailsPreferredContentSizeWidth_sBehavior;
}

void __64__CKUIBehaviorMac_collaborationDetailsPreferredContentSizeWidth__block_invoke()
{
  collaborationDetailsPreferredContentSizeWidth_sBehavior = 0x407C200000000000;
}

- (double)detailsPreferredContentSizeHeight
{
  if (detailsPreferredContentSizeHeight_once != -1)
    dispatch_once(&detailsPreferredContentSizeHeight_once, &__block_literal_global_336_1);
  return *(double *)&detailsPreferredContentSizeHeight_sBehavior;
}

void __52__CKUIBehaviorMac_detailsPreferredContentSizeHeight__block_invoke()
{
  detailsPreferredContentSizeHeight_sBehavior = 0x407E000000000000;
}

- (double)detailsExpanseCellHeight
{
  if (detailsExpanseCellHeight_once_0 != -1)
    dispatch_once(&detailsExpanseCellHeight_once_0, &__block_literal_global_337_1);
  return *(double *)&detailsExpanseCellHeight_sBehavior_0;
}

double __43__CKUIBehaviorMac_detailsExpanseCellHeight__block_invoke()
{
  double v0;
  double result;

  if (CKMainScreenScale_once_65 != -1)
    dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_741_0);
  v0 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v0 = 1.0;
  result = round(v0 * 195.0) / v0;
  detailsExpanseCellHeight_sBehavior_0 = *(_QWORD *)&result;
  return result;
}

- (double)detailsExpanseScreenShareCellHeight
{
  if (detailsExpanseScreenShareCellHeight_once_0 != -1)
    dispatch_once(&detailsExpanseScreenShareCellHeight_once_0, &__block_literal_global_338_0);
  return *(double *)&detailsExpanseScreenShareCellHeight_sBehavior_0;
}

double __54__CKUIBehaviorMac_detailsExpanseScreenShareCellHeight__block_invoke()
{
  double v0;
  double result;

  if (CKMainScreenScale_once_65 != -1)
    dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_741_0);
  v0 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0)
    v0 = 1.0;
  result = round(v0 * 85.0) / v0;
  detailsExpanseScreenShareCellHeight_sBehavior_0 = *(_QWORD *)&result;
  return result;
}

- (double)detailsExpanseDescriptionLabelHeight
{
  if (detailsExpanseDescriptionLabelHeight_once_0 != -1)
    dispatch_once(&detailsExpanseDescriptionLabelHeight_once_0, &__block_literal_global_339);
  return *(double *)&detailsExpanseDescriptionLabelHeight_sBehavior;
}

void __55__CKUIBehaviorMac_detailsExpanseDescriptionLabelHeight__block_invoke()
{
  detailsExpanseDescriptionLabelHeight_sBehavior = 0x4036000000000000;
}

- (int64_t)detailsActionViewStyle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CKUIBehaviorMac_detailsActionViewStyle__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (detailsActionViewStyle_once_0 != -1)
    dispatch_once(&detailsActionViewStyle_once_0, block);
  return detailsActionViewStyle_sBehavior_0;
}

uint64_t __41__CKUIBehaviorMac_detailsActionViewStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_detailsActionViewStyle");
  detailsActionViewStyle_sBehavior_0 = result;
  return result;
}

- (int64_t)_detailsActionViewStyle
{
  return 4;
}

- (double)tuConversationInsetPadding
{
  if (tuConversationInsetPadding_once_0 != -1)
    dispatch_once(&tuConversationInsetPadding_once_0, &__block_literal_global_340_0);
  return *(double *)&tuConversationInsetPadding_sBehavior_0;
}

void __45__CKUIBehaviorMac_tuConversationInsetPadding__block_invoke()
{
  tuConversationInsetPadding_sBehavior_0 = 0x4031000000000000;
}

- (double)tuConversationInteritemSpacing
{
  if (tuConversationInteritemSpacing_once_0 != -1)
    dispatch_once(&tuConversationInteritemSpacing_once_0, &__block_literal_global_341_0);
  return *(double *)&tuConversationInteritemSpacing_sBehavior_0;
}

void __49__CKUIBehaviorMac_tuConversationInteritemSpacing__block_invoke()
{
  tuConversationInteritemSpacing_sBehavior_0 = 0x4028000000000000;
}

- (double)tuConversationJoinButtonCornerRadius
{
  if (tuConversationJoinButtonCornerRadius_once_0 != -1)
    dispatch_once(&tuConversationJoinButtonCornerRadius_once_0, &__block_literal_global_342_0);
  return *(double *)&tuConversationJoinButtonCornerRadius_sBehavior_0;
}

void __55__CKUIBehaviorMac_tuConversationJoinButtonCornerRadius__block_invoke()
{
  tuConversationJoinButtonCornerRadius_sBehavior_0 = 0x4019000000000000;
}

- (double)tuConversationJoinButtonHeight
{
  if (tuConversationJoinButtonHeight_once_0 != -1)
    dispatch_once(&tuConversationJoinButtonHeight_once_0, &__block_literal_global_343_1);
  return *(double *)&tuConversationJoinButtonHeight_sBehavior_0;
}

void __49__CKUIBehaviorMac_tuConversationJoinButtonHeight__block_invoke()
{
  tuConversationJoinButtonHeight_sBehavior_0 = 0x4034000000000000;
}

- (double)tuConversationJoinButtonMinWidth
{
  if (tuConversationJoinButtonMinWidth_once_0 != -1)
    dispatch_once(&tuConversationJoinButtonMinWidth_once_0, &__block_literal_global_344_1);
  return *(double *)&tuConversationJoinButtonMinWidth_sBehavior_0;
}

void __51__CKUIBehaviorMac_tuConversationJoinButtonMinWidth__block_invoke()
{
  tuConversationJoinButtonMinWidth_sBehavior_0 = 0x404A800000000000;
}

- (double)detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode
{
  if (detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_once_0 != -1)
    dispatch_once(&detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_once_0, &__block_literal_global_345);
  return *(double *)&detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_sBehavior_0;
}

void __79__CKUIBehaviorMac_detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode__block_invoke()
{
  detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_sBehavior_0 = 0x3FF0000000000000;
}

- (double)detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode
{
  if (detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_once_0 != -1)
    dispatch_once(&detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_once_0, &__block_literal_global_346);
  return *(double *)&detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_sBehavior_0;
}

void __78__CKUIBehaviorMac_detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode__block_invoke()
{
  detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_sBehavior_0 = 0x3FF0000000000000;
}

- (double)detailsSectionHeaderPaddingLeading
{
  if (detailsSectionHeaderPaddingLeading_once_0 != -1)
    dispatch_once(&detailsSectionHeaderPaddingLeading_once_0, &__block_literal_global_347_1);
  return *(double *)&detailsSectionHeaderPaddingLeading_sBehavior;
}

void __53__CKUIBehaviorMac_detailsSectionHeaderPaddingLeading__block_invoke()
{
  detailsSectionHeaderPaddingLeading_sBehavior = 0xC000000000000000;
}

- (double)detailsSectionHeaderPaddingAbove
{
  if (detailsSectionHeaderPaddingAbove_once_0 != -1)
    dispatch_once(&detailsSectionHeaderPaddingAbove_once_0, &__block_literal_global_348_0);
  return *(double *)&detailsSectionHeaderPaddingAbove_sBehavior;
}

void __51__CKUIBehaviorMac_detailsSectionHeaderPaddingAbove__block_invoke()
{
  detailsSectionHeaderPaddingAbove_sBehavior = 0x4030000000000000;
}

- (double)detailsCellLabelPadding
{
  if (detailsCellLabelPadding_once_0 != -1)
    dispatch_once(&detailsCellLabelPadding_once_0, &__block_literal_global_349_0);
  return *(double *)&detailsCellLabelPadding_sBehavior;
}

void __42__CKUIBehaviorMac_detailsCellLabelPadding__block_invoke()
{
  detailsCellLabelPadding_sBehavior = 0x4028000000000000;
}

- (int64_t)groupRecipientSelectionPresentationStyle
{
  if (groupRecipientSelectionPresentationStyle_once_0 != -1)
    dispatch_once(&groupRecipientSelectionPresentationStyle_once_0, &__block_literal_global_350_1);
  if (groupRecipientSelectionPresentationStyle_sBehavior_0)
    return 7;
  else
    return 0;
}

void __59__CKUIBehaviorMac_groupRecipientSelectionPresentationStyle__block_invoke()
{
  groupRecipientSelectionPresentationStyle_sBehavior_0 = 1;
}

- (double)detailsAddButtonDiameter
{
  if (detailsAddButtonDiameter_once_0 != -1)
    dispatch_once(&detailsAddButtonDiameter_once_0, &__block_literal_global_351_0);
  return *(double *)&detailsAddButtonDiameter_sBehavior_0;
}

void __43__CKUIBehaviorMac_detailsAddButtonDiameter__block_invoke()
{
  detailsAddButtonDiameter_sBehavior_0 = 0x4040000000000000;
}

- (double)ktStatusCellImagePadding
{
  if (ktStatusCellImagePadding_once_0 != -1)
    dispatch_once(&ktStatusCellImagePadding_once_0, &__block_literal_global_352_0);
  return *(double *)&ktStatusCellImagePadding_sBehavior_0;
}

void __43__CKUIBehaviorMac_ktStatusCellImagePadding__block_invoke()
{
  ktStatusCellImagePadding_sBehavior_0 = 0x4008000000000000;
}

- (double)balloonSelectionScrollThresholdTop
{
  if (balloonSelectionScrollThresholdTop_once != -1)
    dispatch_once(&balloonSelectionScrollThresholdTop_once, &__block_literal_global_353_0);
  return *(double *)&balloonSelectionScrollThresholdTop_sBehavior;
}

void __53__CKUIBehaviorMac_balloonSelectionScrollThresholdTop__block_invoke()
{
  balloonSelectionScrollThresholdTop_sBehavior = 0x4059000000000000;
}

- (double)balloonSelectionScrollThresholdBottom
{
  if (balloonSelectionScrollThresholdBottom_once != -1)
    dispatch_once(&balloonSelectionScrollThresholdBottom_once, &__block_literal_global_354);
  return *(double *)&balloonSelectionScrollThresholdBottom_sBehavior;
}

void __56__CKUIBehaviorMac_balloonSelectionScrollThresholdBottom__block_invoke()
{
  balloonSelectionScrollThresholdBottom_sBehavior = 0x4059000000000000;
}

- (double)balloonSelectionLoadMoreSpinnerHeight
{
  if (balloonSelectionLoadMoreSpinnerHeight_once != -1)
    dispatch_once(&balloonSelectionLoadMoreSpinnerHeight_once, &__block_literal_global_355_0);
  return *(double *)&balloonSelectionLoadMoreSpinnerHeight_sBehavior;
}

void __56__CKUIBehaviorMac_balloonSelectionLoadMoreSpinnerHeight__block_invoke()
{
  balloonSelectionLoadMoreSpinnerHeight_sBehavior = 0x4042000000000000;
}

- (double)balloonSelectionMaxScrollSpeed
{
  if (balloonSelectionMaxScrollSpeed_once != -1)
    dispatch_once(&balloonSelectionMaxScrollSpeed_once, &__block_literal_global_356_0);
  return *(double *)&balloonSelectionMaxScrollSpeed_sBehavior;
}

void __49__CKUIBehaviorMac_balloonSelectionMaxScrollSpeed__block_invoke()
{
  balloonSelectionMaxScrollSpeed_sBehavior = 0x404E000000000000;
}

- (double)detailsViewMapHeight
{
  if (detailsViewMapHeight_once_0 != -1)
    dispatch_once(&detailsViewMapHeight_once_0, &__block_literal_global_357_0);
  return *(double *)&detailsViewMapHeight_sBehavior_0;
}

void __39__CKUIBehaviorMac_detailsViewMapHeight__block_invoke()
{
  detailsViewMapHeight_sBehavior_0 = 0x4068800000000000;
}

- (id)businessInfoViewGreetingTextFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)businessInfoViewGreetingTextFont_sContentSizeCategory_businessInfoViewGreetingTextFont_0, (UIContentSizeCategory)v2)|| businessInfoViewGreetingTextFont_sIsIncreaseContrastEnabled_businessInfoViewGreetingTextFont_0 != v3|| businessInfoViewGreetingTextFont_sIsBoldTextEnabled_businessInfoViewGreetingTextFont_0 != IsBoldTextEnabled|| *(double *)&businessInfoViewGreetingTextFont_sTextFontSize_businessInfoViewGreetingTextFont_0 != v5|| *(double *)&businessInfoViewGreetingTextFont_sCustomTextFontSize_businessInfoViewGreetingTextFont_0 != v6|| (objc_msgSend((id)businessInfoViewGreetingTextFont_sCustomTextFontName_businessInfoViewGreetingTextFont_0, "isEqualToString:", v9, *(double *)&businessInfoViewGreetingTextFont_sCustomTextFontSize_businessInfoViewGreetingTextFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB588]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scaledFontForFont:", v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)businessInfoViewGreetingTextFont_sBehavior_0;
    businessInfoViewGreetingTextFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&businessInfoViewGreetingTextFont_sContentSizeCategory_businessInfoViewGreetingTextFont_0, v2);
    businessInfoViewGreetingTextFont_sIsIncreaseContrastEnabled_businessInfoViewGreetingTextFont_0 = v3;
    businessInfoViewGreetingTextFont_sIsBoldTextEnabled_businessInfoViewGreetingTextFont_0 = IsBoldTextEnabled;
    businessInfoViewGreetingTextFont_sTextFontSize_businessInfoViewGreetingTextFont_0 = *(_QWORD *)&v5;
    businessInfoViewGreetingTextFont_sCustomTextFontSize_businessInfoViewGreetingTextFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&businessInfoViewGreetingTextFont_sCustomTextFontName_businessInfoViewGreetingTextFont_0, v8);
  }
  v14 = (id)businessInfoViewGreetingTextFont_sBehavior_0;

  return v14;
}

- (id)businessInfoViewDescriptionTextFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)businessInfoViewDescriptionTextFont_sContentSizeCategory_businessInfoViewDescriptionTextFont_0, (UIContentSizeCategory)v2)|| businessInfoViewDescriptionTextFont_sIsIncreaseContrastEnabled_businessInfoViewDescriptionTextFont_0 != v3|| businessInfoViewDescriptionTextFont_sIsBoldTextEnabled_businessInfoViewDescriptionTextFont_0 != IsBoldTextEnabled|| (v10 = businessInfoViewDescriptionTextFont_sTextFontSize_businessInfoViewDescriptionTextFont_0, *(double *)&businessInfoViewDescriptionTextFont_sTextFontSize_businessInfoViewDescriptionTextFont_0 != v5)|| (v10 = businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0, *(double *)&businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0 != v6)|| (objc_msgSend((id)businessInfoViewDescriptionTextFont_sCustomTextFontName_businessInfoViewDescriptionTextFont_0, "isEqualToString:", v9, *(double *)&businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)businessInfoViewDescriptionTextFont_sBehavior_0;
    businessInfoViewDescriptionTextFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&businessInfoViewDescriptionTextFont_sContentSizeCategory_businessInfoViewDescriptionTextFont_0, v2);
    businessInfoViewDescriptionTextFont_sIsIncreaseContrastEnabled_businessInfoViewDescriptionTextFont_0 = v3;
    businessInfoViewDescriptionTextFont_sIsBoldTextEnabled_businessInfoViewDescriptionTextFont_0 = IsBoldTextEnabled;
    businessInfoViewDescriptionTextFont_sTextFontSize_businessInfoViewDescriptionTextFont_0 = *(_QWORD *)&v5;
    businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&businessInfoViewDescriptionTextFont_sCustomTextFontName_businessInfoViewDescriptionTextFont_0, v8);
  }
  v13 = (id)businessInfoViewDescriptionTextFont_sBehavior_0;

  return v13;
}

- (id)businessInfoViewTitleLabelFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)businessInfoViewTitleLabelFont_sContentSizeCategory_businessInfoViewTitleLabelFont_0, (UIContentSizeCategory)v2)|| businessInfoViewTitleLabelFont_sIsIncreaseContrastEnabled_businessInfoViewTitleLabelFont_0 != v3|| businessInfoViewTitleLabelFont_sIsBoldTextEnabled_businessInfoViewTitleLabelFont_0 != IsBoldTextEnabled|| (v10 = businessInfoViewTitleLabelFont_sTextFontSize_businessInfoViewTitleLabelFont_0, *(double *)&businessInfoViewTitleLabelFont_sTextFontSize_businessInfoViewTitleLabelFont_0 != v5)|| (v10 = businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0, *(double *)&businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0 != v6)|| (objc_msgSend((id)businessInfoViewTitleLabelFont_sCustomTextFontName_businessInfoViewTitleLabelFont_0, "isEqualToString:", v9, *(double *)&businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588], *(double *)&v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)businessInfoViewTitleLabelFont_sBehavior_0;
    businessInfoViewTitleLabelFont_sBehavior_0 = v11;

    objc_storeStrong((id *)&businessInfoViewTitleLabelFont_sContentSizeCategory_businessInfoViewTitleLabelFont_0, v2);
    businessInfoViewTitleLabelFont_sIsIncreaseContrastEnabled_businessInfoViewTitleLabelFont_0 = v3;
    businessInfoViewTitleLabelFont_sIsBoldTextEnabled_businessInfoViewTitleLabelFont_0 = IsBoldTextEnabled;
    businessInfoViewTitleLabelFont_sTextFontSize_businessInfoViewTitleLabelFont_0 = *(_QWORD *)&v5;
    businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&businessInfoViewTitleLabelFont_sCustomTextFontName_businessInfoViewTitleLabelFont_0, v8);
  }
  v13 = (id)businessInfoViewTitleLabelFont_sBehavior_0;

  return v13;
}

- (unint64_t)detailsSectionCount
{
  if (detailsSectionCount_once_0 != -1)
    dispatch_once(&detailsSectionCount_once_0, &__block_literal_global_359_0);
  if (detailsSectionCount_sBehavior_0)
    return 16;
  else
    return 0;
}

void __38__CKUIBehaviorMac_detailsSectionCount__block_invoke()
{
  detailsSectionCount_sBehavior_0 = 1;
}

- (id)syncProgressLabelFont
{
  void *v2;
  int v3;
  int IsBoldTextEnabled;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v5 = CKUserPreferenceFontSize();
  v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("None");
  v9 = v8;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)syncProgressLabelFont_sContentSizeCategory_syncProgressLabelFont_0, (UIContentSizeCategory)v2)|| syncProgressLabelFont_sIsIncreaseContrastEnabled_syncProgressLabelFont_0 != v3|| syncProgressLabelFont_sIsBoldTextEnabled_syncProgressLabelFont_0 != IsBoldTextEnabled|| (v10 = syncProgressLabelFont_sTextFontSize_syncProgressLabelFont_0, *(double *)&syncProgressLabelFont_sTextFontSize_syncProgressLabelFont_0 != v5)|| (v10 = syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0, *(double *)&syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0 != v6)|| (objc_msgSend((id)syncProgressLabelFont_sCustomTextFontName_syncProgressLabelFont_0, "isEqualToString:", v9, *(double *)&syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB598], *(double *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 10.0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)syncProgressLabelFont_sBehavior_0;
    syncProgressLabelFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&syncProgressLabelFont_sContentSizeCategory_syncProgressLabelFont_0, v2);
    syncProgressLabelFont_sIsIncreaseContrastEnabled_syncProgressLabelFont_0 = v3;
    syncProgressLabelFont_sIsBoldTextEnabled_syncProgressLabelFont_0 = IsBoldTextEnabled;
    syncProgressLabelFont_sTextFontSize_syncProgressLabelFont_0 = *(_QWORD *)&v5;
    syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0 = *(_QWORD *)&v6;
    objc_storeStrong((id *)&syncProgressLabelFont_sCustomTextFontName_syncProgressLabelFont_0, v8);
  }
  v14 = (id)syncProgressLabelFont_sBehavior_0;

  return v14;
}

- (id)syncBarHairlineColor
{
  if (syncBarHairlineColor_once_0 != -1)
    dispatch_once(&syncBarHairlineColor_once_0, &__block_literal_global_360);
  return (id)syncBarHairlineColor_sBehavior_0;
}

void __39__CKUIBehaviorMac_syncBarHairlineColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncBarHairlineColor_sBehavior_0;
  syncBarHairlineColor_sBehavior_0 = v0;

}

- (int64_t)syncBarBlurEffectStyle
{
  if (syncBarBlurEffectStyle_once_0 != -1)
    dispatch_once(&syncBarBlurEffectStyle_once_0, &__block_literal_global_361_1);
  if (syncBarBlurEffectStyle_sBehavior_0)
    return 6;
  else
    return 0;
}

void __41__CKUIBehaviorMac_syncBarBlurEffectStyle__block_invoke()
{
  syncBarBlurEffectStyle_sBehavior_0 = 1;
}

- (double)messageHighlightButtonGlyphSymbolPointSize
{
  if (messageHighlightButtonGlyphSymbolPointSize_once_0 != -1)
    dispatch_once(&messageHighlightButtonGlyphSymbolPointSize_once_0, &__block_literal_global_362_0);
  return *(double *)&messageHighlightButtonGlyphSymbolPointSize_sBehavior_0;
}

void __61__CKUIBehaviorMac_messageHighlightButtonGlyphSymbolPointSize__block_invoke()
{
  messageHighlightButtonGlyphSymbolPointSize_sBehavior_0 = 0x4030000000000000;
}

- (NSDirectionalEdgeInsets)collaborationOptionsPopoverInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  if (collaborationOptionsPopoverInsets_once != -1)
    dispatch_once(&collaborationOptionsPopoverInsets_once, &__block_literal_global_363_2);
  v2 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_0;
  v3 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_1;
  v4 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_2;
  v5 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_3;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

void __52__CKUIBehaviorMac_collaborationOptionsPopoverInsets__block_invoke()
{
  collaborationOptionsPopoverInsets_sBehavior_0 = 0x4028000000000000;
  collaborationOptionsPopoverInsets_sBehavior_1 = 0x4028000000000000;
  collaborationOptionsPopoverInsets_sBehavior_2 = 0x4028000000000000;
  collaborationOptionsPopoverInsets_sBehavior_3 = 0x4028000000000000;
}

- (UIEdgeInsets)sendLaterEditViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (sendLaterEditViewInsets_once != -1)
    dispatch_once(&sendLaterEditViewInsets_once, &__block_literal_global_364_0);
  v2 = *(double *)&sendLaterEditViewInsets_sBehavior_0;
  v3 = *(double *)&sendLaterEditViewInsets_sBehavior_1;
  v4 = *(double *)&sendLaterEditViewInsets_sBehavior_2;
  v5 = *(double *)&sendLaterEditViewInsets_sBehavior_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __42__CKUIBehaviorMac_sendLaterEditViewInsets__block_invoke()
{
  sendLaterEditViewInsets_sBehavior_0 = 0x402E000000000000;
  sendLaterEditViewInsets_sBehavior_1 = 0x4034000000000000;
  sendLaterEditViewInsets_sBehavior_2 = 0x4034000000000000;
  sendLaterEditViewInsets_sBehavior_3 = 0x4034000000000000;
}

@end
