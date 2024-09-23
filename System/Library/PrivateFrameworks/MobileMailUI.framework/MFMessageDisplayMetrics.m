@implementation MFMessageDisplayMetrics

+ (id)mf_actionCardMetricsFromDisplayMetrics:(id)a3
{
  return a3;
}

+ (MFMessageDisplayMetrics)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5 interfaceOrientation:(int64_t)a6
{
  double right;
  double bottom;
  double left;
  double top;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v11 = a4.right;
  v12 = a4.bottom;
  v13 = a4.left;
  v14 = a4.top;
  v15 = a3;
  v16 = objc_msgSend(v15, "userInterfaceIdiom");
  if (v16 == -1)
  {
    v17 = 0;
  }
  else
  {
    if (v16)
      objc_msgSend(v15, "horizontalSizeClass");
    v17 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v17, "setTraitCollection:", v15);
    objc_msgSend(v17, "setLayoutMargins:", v14, v13, v12, v11);
    objc_msgSend(v17, "setSafeAreaInsets:", top, left, bottom, right);
    +[ConversationFooterViewDisplayMetrics displayMetricsWithSafeAreaInsets:interfaceOrientation:traitCollection:](ConversationFooterViewDisplayMetrics, "displayMetricsWithSafeAreaInsets:interfaceOrientation:traitCollection:", a6, v15, top, left, bottom, right);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFooterViewDisplayMetrics:", v18);

  }
  return (MFMessageDisplayMetrics *)v17;
}

+ (MFMessageDisplayMetrics)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5 interfaceOrientation:(int64_t)a6 trailingButtonView:(id)a7
{
  double right;
  double bottom;
  double left;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  void *v19;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v12 = a4.right;
  v13 = a4.bottom;
  v14 = a4.left;
  v15 = a4.top;
  v18 = a7;
  objc_msgSend(a1, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", a3, a6, v15, v14, v13, v12, top, left, bottom, right);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTrailingButtonView:", v18);

  return (MFMessageDisplayMetrics *)v19;
}

- (id)fontCacheKeyPrefix
{
  -[MFMessageDisplayMetrics doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageDisplayMetrics fontCacheKeyPrefix]", "MFMessageDisplayMetrics.m", 80, "0");
}

- (BOOL)isEqual:(id)a3
{
  MFMessageDisplayMetrics *v4;
  uint64_t v5;
  BOOL v6;
  MFMessageDisplayMetrics *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;

  v4 = (MFMessageDisplayMetrics *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageDisplayMetrics traitCollection](v7, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[MFMessageDisplayMetrics layoutMargins](self, "layoutMargins");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[MFMessageDisplayMetrics layoutMargins](v7, "layoutMargins");
        v6 = 0;
        if (v13 == v21 && v11 == v18 && v17 == v20 && v15 == v19)
        {
          -[MFMessageDisplayMetrics safeAreaInsets](self, "safeAreaInsets");
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;
          -[MFMessageDisplayMetrics safeAreaInsets](v7, "safeAreaInsets");
          v33 = v25 == v32;
          if (v23 != v34)
            v33 = 0;
          if (v29 != v31)
            v33 = 0;
          v6 = v27 == v30 && v33;
        }
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)hasCompactLayout
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {
    -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "horizontalSizeClass") == 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)hasGenerousMargins
{
  double v2;

  -[MFMessageDisplayMetrics layoutMargins](self, "layoutMargins");
  return v2 > 30.0;
}

- (BOOL)prefersFlushSeparator
{
  void *v3;
  void *v4;
  char v5;

  if (-[MFMessageDisplayMetrics hasCompactLayout](self, "hasCompactLayout")
    || !-[MFMessageDisplayMetrics hasGenerousMargins](self, "hasGenerousMargins"))
  {
    return 1;
  }
  v3 = (void *)MEMORY[0x1E0DC3A28];
  -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v4);

  return v5;
}

- (BOOL)prefersFlushSeparatorForLeadingEdge
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0DC3A28];
  -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v3);

  return (char)v2;
}

- (double)minHorizontalSpacing
{
  return 10.0;
}

- (double)horizontalSpacing
{
  return 12.0;
}

- (double)topToSenderBaselineInConversation
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4A88], 32.0);
  return result;
}

- (double)baselineToBaselineSpacingInConversation
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B10], 20.0);
  return result;
}

- (double)topToSenderBaselineInConversationForMailActionHeader
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48D8], 32.0);
  return result;
}

- (double)baselineToBaselineSpacingInConversationForMailActionHeader
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48D0], 20.0);
  return result;
}

- (double)recipientBaselineToFirstSeparatorInConversation
{
  double v3;
  double v4;
  double v5;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4AB8], 18.0);
  v4 = v3;
  -[MFMessageDisplayMetrics messageTopPaddingInConversation](self, "messageTopPaddingInConversation");
  return v4 + v5;
}

+ (double)avatarDiameter
{
  return 37.0;
}

- (double)avatarDiameterForCurrentContentSize
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _QWORD v18[12];
  _QWORD v19[13];

  v19[12] = *MEMORY[0x1E0C80C00];
  -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "avatarDiameter");
  v4 = v3;
  v5 = (void *)_avatarScaleForContentSize_avatarScales;
  if (!_avatarScaleForContentSize_avatarScales)
  {
    v6 = *MEMORY[0x1E0DC4930];
    v18[0] = *MEMORY[0x1E0DC4908];
    v18[1] = v6;
    v19[0] = &unk_1E9A145D0;
    v19[1] = &unk_1E9A145D0;
    v7 = *MEMORY[0x1E0DC4918];
    v18[2] = *MEMORY[0x1E0DC4920];
    v18[3] = v7;
    v19[2] = &unk_1E9A145D0;
    v19[3] = &unk_1E9A145D0;
    v8 = *MEMORY[0x1E0DC48F8];
    v18[4] = *MEMORY[0x1E0DC4900];
    v18[5] = v8;
    v19[4] = &unk_1E9A145F0;
    v19[5] = &unk_1E9A14600;
    v9 = *MEMORY[0x1E0DC48D8];
    v18[6] = *MEMORY[0x1E0DC48F0];
    v18[7] = v9;
    v19[6] = &unk_1E9A145E0;
    v19[7] = &unk_1E9A145D0;
    v10 = *MEMORY[0x1E0DC48C8];
    v18[8] = *MEMORY[0x1E0DC48D0];
    v18[9] = v10;
    v19[8] = &unk_1E9A145D0;
    v19[9] = &unk_1E9A145D0;
    v11 = *MEMORY[0x1E0DC48B8];
    v18[10] = *MEMORY[0x1E0DC48C0];
    v18[11] = v11;
    v19[10] = &unk_1E9A145D0;
    v19[11] = &unk_1E9A145D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 12);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)_avatarScaleForContentSize_avatarScales;
    _avatarScaleForContentSize_avatarScales = v12;

    v5 = (void *)_avatarScaleForContentSize_avatarScales;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");

  UIRoundToViewScale();
  v16 = v15;

  return v16;
}

- (double)statusIndicatorHorizontalSpacing
{
  return 8.0;
}

- (double)messageTopPaddingInConversation
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4A88], 2.0);
  return result;
}

- (double)messageBottomPaddingInConversation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[MFMessageDisplayMetrics messageTopPaddingInConversation](self, "messageTopPaddingInConversation");
  v4 = v3;
  -[MFMessageDisplayMetrics topToSenderBaselineInConversation](self, "topToSenderBaselineInConversation");
  v6 = v4 + v5;
  -[MFMessageDisplayMetrics baselineToBaselineSpacingInConversation](self, "baselineToBaselineSpacingInConversation");
  v8 = v6 + v7;
  -[MFMessageDisplayMetrics avatarDiameterForCurrentContentSize](self, "avatarDiameterForCurrentContentSize");
  return v8 - v9 + 1.0;
}

- (double)messageTopPaddingInConversationForMailActionHeader
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48D8], 2.0);
  return result;
}

- (double)messageBottomPaddingInConversationForMailActionHeader
{
  NSString *v3;
  BOOL IsAccessibilityCategory;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    v5 = 64.0;
  }
  else
  {
    -[MFMessageDisplayMetrics avatarDiameterForCurrentContentSize](self, "avatarDiameterForCurrentContentSize");
    v5 = v6;
  }
  -[MFMessageDisplayMetrics messageTopPaddingInConversationForMailActionHeader](self, "messageTopPaddingInConversationForMailActionHeader");
  v8 = v7;
  -[MFMessageDisplayMetrics topToSenderBaselineInConversationForMailActionHeader](self, "topToSenderBaselineInConversationForMailActionHeader");
  v10 = v8 + v9;
  -[MFMessageDisplayMetrics baselineToBaselineSpacingInConversationForMailActionHeader](self, "baselineToBaselineSpacingInConversationForMailActionHeader");
  return v10 + v11 - v5 + 1.0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MFMessageDisplayMetrics traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> traitCollection = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cachedFontForStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedPreferredFontForStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_scaledFloatWithValue:(double)a3 fontStyle:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedScaledFloatWithValue:fontStyle:", v5, a3);
  v8 = v7;

  return v8;
}

- (double)_scaledFloatWithValue:(double)a3 fontStyle:(id)a4 maximumContentSizeCategory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedScaledFloatWithValue:fontStyle:maximumContentSizeCategory:", v7, v8, a3);
  v11 = v10;

  return v11;
}

- (double)cellHeightToStartScroll
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (-[MFMessageDisplayMetrics usePhoneLandscapeSymbolConfiguration](self, "usePhoneLandscapeSymbolConfiguration"))
    v3 = 175.0;
  else
    v3 = 300.0;
  -[MFMessageDisplayMetrics estimatedFooterViewHeight](self, "estimatedFooterViewHeight");
  v5 = v4;
  -[MFMessageDisplayMetrics footerViewTopToBaseline](self, "footerViewTopToBaseline");
  return v3 + v5 - v6;
}

- (double)estimatedFooterViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[MFMessageDisplayMetrics footerViewDisplayMetrics](self, "footerViewDisplayMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbarHeight");
  v4 = v3;

  return v4;
}

- (double)footerViewTopToBaseline
{
  void *v2;
  double v3;
  double v4;

  -[MFMessageDisplayMetrics footerViewDisplayMetrics](self, "footerViewDisplayMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topToBaseline");
  v4 = v3;

  return v4;
}

- (BOOL)usePhoneLandscapeSymbolConfiguration
{
  void *v2;
  char v3;

  -[MFMessageDisplayMetrics footerViewDisplayMetrics](self, "footerViewDisplayMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usePhoneLandscapeSymbolConfiguration");

  return v3;
}

- (double)_calculateFooterViewButtonsAnimationOffset
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (-[MFMessageDisplayMetrics usePhoneLandscapeSymbolConfiguration](self, "usePhoneLandscapeSymbolConfiguration"))
    v3 = 17;
  else
    v3 = 16;
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", *MEMORY[0x1E0CC6830], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  -[MFMessageDisplayMetrics footerViewTopToBaseline](self, "footerViewTopToBaseline");
  v8 = v7;
  -[MFMessageDisplayMetrics estimatedFooterViewHeight](self, "estimatedFooterViewHeight");
  v10 = v9 - (v6 + (v8 - v6) * 2.0);
  v11 = 0.0;
  if (v10 > 0.0)
  {
    -[MFMessageDisplayMetrics safeAreaInsets](self, "safeAreaInsets");
    if (v12 != 0.0)
      v11 = fmin(v10, 15.0);
  }

  return v11;
}

- (void)setFooterViewDisplayMetrics:(id)a3
{
  ConversationFooterViewDisplayMetrics *v5;
  double v6;
  ConversationFooterViewDisplayMetrics *v7;

  v5 = (ConversationFooterViewDisplayMetrics *)a3;
  if (self->_footerViewDisplayMetrics != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_footerViewDisplayMetrics, a3);
    -[MFMessageDisplayMetrics _calculateFooterViewButtonsAnimationOffset](self, "_calculateFooterViewButtonsAnimationOffset");
    self->_footerViewButtonsAnimationOffset = v6;
    v5 = v7;
  }

}

- (double)footerViewTrailingButtonOrigin
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[MFMessageDisplayMetrics trailingButtonView](self, "trailingButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

    objc_msgSend(v3, "frame");
    v9 = v7 + v8;
  }
  else
  {
    v9 = 2.22507386e-308;
  }

  return v9;
}

- (double)topToGlyphBaselineInMailActionCardHorizontalGroup
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 36.0);
  return result;
}

- (double)baselineToBaselineSpacingInMailActionCardHorizontalGroup
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48D0], 24.0);
  return result;
}

- (double)bottomSpacingInMailActionCardHorizontalGroup
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48D0], 20.0);
  return result;
}

- (double)topToFirstBaselineSpacingInMailActionCardVerticalGroup
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48C0], 32.0);
  return result;
}

- (double)bottomToLastBaselineInMailActionCardVerticalGroup
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:maximumContentSizeCategory:](self, "_scaledFloatWithValue:fontStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48D8], 20.0);
  return result;
}

- (double)mailActionCardPreferredHeightForPad
{
  return 466.0;
}

- (double)mailActionCardMaximumContainerViewHeightForLargerMediumDetent
{
  return 568.0;
}

- (double)mailActionCardSmallerMediumDetentCoverage
{
  return 0.54;
}

- (double)mailActionCardLargerMediumDetentCoverage
{
  return 0.59;
}

- (double)conversationHeaderViewCollapsedSuperTitleTopToFirstBaseline
{
  return 10.0;
}

- (BOOL)conversationHeaderViewShouldHideCollapsedSuperTitle
{
  void *v2;
  double v3;
  BOOL v4;

  -[MFMessageDisplayMetrics footerViewDisplayMetrics](self, "footerViewDisplayMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbarHeight");
  v4 = v3 < 44.0;

  return v4;
}

- (double)conversationHeaderViewCollapsedTitleTopToFirstBaseline
{
  _BOOL4 v2;
  double result;

  v2 = -[MFMessageDisplayMetrics conversationHeaderViewShouldHideCollapsedSuperTitle](self, "conversationHeaderViewShouldHideCollapsedSuperTitle");
  result = 28.0;
  if (v2)
    return 21.0;
  return result;
}

- (double)conversationHeaderViewCollapsedTitleBottomToLastBaseline
{
  return 9.0;
}

- (double)conversationHeaderViewExpandedTitleTopToFirstBaseline
{
  return 40.0;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (double)topToSenderBaseline
{
  return self->_topToSenderBaseline;
}

- (double)baselineToBaselineSpacing
{
  return self->_baselineToBaselineSpacing;
}

- (double)recipientBaselineToFirstSeparator
{
  return self->_recipientBaselineToFirstSeparator;
}

- (double)firstSeparatorToSubjectBaseline
{
  return self->_firstSeparatorToSubjectBaseline;
}

- (double)headerBottomPadding
{
  return self->_headerBottomPadding;
}

- (double)statusIndicatorVerticalSpacing
{
  return self->_statusIndicatorVerticalSpacing;
}

- (double)footerViewButtonsAnimationOffset
{
  return self->_footerViewButtonsAnimationOffset;
}

- (void)setFooterViewButtonsAnimationOffset:(double)a3
{
  self->_footerViewButtonsAnimationOffset = a3;
}

- (ConversationFooterViewDisplayMetrics)footerViewDisplayMetrics
{
  return self->_footerViewDisplayMetrics;
}

- (UIView)trailingButtonView
{
  return self->_trailingButtonView;
}

- (void)setTrailingButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButtonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonView, 0);
  objc_storeStrong((id *)&self->_footerViewDisplayMetrics, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
