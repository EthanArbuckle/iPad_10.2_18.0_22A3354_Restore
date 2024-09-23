@implementation MessageListCellLayoutValues

- (UIFont)dateFont
{
  UIFont *dateFont;
  UIFont *v4;
  UIFont *v5;

  dateFont = self->_dateFont;
  if (!dateFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dateFont;
    self->_dateFont = v4;

    dateFont = self->_dateFont;
  }
  return dateFont;
}

- (double)heightWithNumberOfSummaryLines:(int64_t)a3
{
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[MessageListCellLayoutValues topPadding](self, "topPadding");
  -[MessageListCellLayoutValues addressAndSubjectHeight](self, "addressAndSubjectHeight");
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    -[MessageListCellLayoutValues dateFont](self, "dateFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyLeading");
    objc_msgSend(v7, "descender");

  }
  if (a3)
  {
    -[MessageListCellLayoutValues summaryFont](self, "summaryFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListCellLayoutValues bodyLeading](self, "bodyLeading");
    if (a3 >= 2)
      objc_msgSend(v8, "_bodyLeading");

  }
  -[MessageListCellLayoutValues bottomPadding](self, "bottomPadding");
  UIRoundToViewScale();
  if (v9 < 44.0)
  {
    v10 = vabdd_f64(44.0, v9) * 0.5;
    self->_topMargin = floor(v10);
    self->_bottomMargin = ceil(v10);
    v9 = 44.0;
  }
  return ceil(v9);
}

- (NSDirectionalEdgeInsets)padding
{
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
  double v13;
  NSDirectionalEdgeInsets result;

  -[MessageListCellLayoutValues topPadding](self, "topPadding");
  v4 = v3;
  -[MessageListCellLayoutValues leadingPadding](self, "leadingPadding");
  v6 = v5;
  -[MessageListCellLayoutValues bottomPadding](self, "bottomPadding");
  v8 = v7;
  -[MessageListCellLayoutValues trailingPadding](self, "trailingPadding");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.trailing = v10;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (double)leadingPadding
{
  double result;
  double v4;
  double v5;
  double v6;

  result = self->_leadingPadding;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues leadingToIndicatorMargin](self, "leadingToIndicatorMargin");
    v5 = v4;
    -[MessageListCellLayoutValues indicatorMaxWidth](self, "indicatorMaxWidth");
    result = v6 + v5 * 2.0;
    self->_leadingPadding = result;
  }
  return result;
}

- (double)bottomPadding
{
  NSString *v3;
  void *v4;
  double v5;

  if (self->_bottomPadding == 2.22507386e-308)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    UIContentSizeCategoryIsAccessibilityCategory(v3);

    -[MessageListCellLayoutValues summaryFont](self, "summaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_bodyLeading");
    -[MessageListCellLayoutValues bottomMargin](self, "bottomMargin");
    UIRoundToViewScale();
    self->_bottomPadding = v5;

  }
  return self->_bottomPadding;
}

- (double)trailingPadding
{
  double result;

  result = self->_trailingPadding;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues indicatorToTrailingMargin](self, "indicatorToTrailingMargin");
    self->_trailingPadding = result;
  }
  return result;
}

- (double)addressAndSubjectHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[MessageListCellLayoutValues addressCapHeight](self, "addressCapHeight");
  v4 = v3;
  if (-[MessageListCellLayoutValues isSubjectVisible](self, "isSubjectVisible"))
  {
    v5 = (double)-[MessageListCellLayoutValues subjectNumberOfLines](self, "subjectNumberOfLines");
    -[MessageListCellLayoutValues bodyLeading](self, "bodyLeading");
    v4 = v4 + v5 * v6;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v4 + 1.0 / v8;

  return v9;
}

- (double)addressCapHeight
{
  double result;
  void *v4;
  double v5;

  result = self->_addressCapHeight;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues addressFont](self, "addressFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "capHeight");
    UICeilToViewScale();
    self->_addressCapHeight = v5;

    return self->_addressCapHeight;
  }
  return result;
}

- (int64_t)subjectNumberOfLines
{
  return 1;
}

- (double)bodyLeading
{
  double result;
  void *v4;
  double v5;

  result = self->_bodyLeading;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues summaryFont](self, "summaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_bodyLeading");
    UIRoundToViewScale();
    self->_bodyLeading = v5;

    return self->_bodyLeading;
  }
  return result;
}

- (UIFont)summaryFont
{
  UIFont *summaryFont;
  UIFont *v4;
  UIFont *v5;

  summaryFont = self->_summaryFont;
  if (!summaryFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_summaryFont;
    self->_summaryFont = v4;

    summaryFont = self->_summaryFont;
  }
  return summaryFont;
}

- (double)leadingToIndicatorMargin
{
  double result;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  double v6;
  double v7;
  double leading;
  double v9;

  result = self->_leadingToIndicatorMargin;
  if (result == 2.22507386e-308)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    result = 4.0;
    if (!IsAccessibilityCategory)
    {
      result = 8.0;
      if (!self->_useSidebarAppearance)
      {
        -[MessageListCellLayoutValues indicatorMaxWidth](self, "indicatorMaxWidth", 8.0);
        v7 = v6;
        leading = self->_systemLayoutMargins.leading;
        -[UITraitCollection mf_leadingEdgeToBackButtonText](self->_traitCollection, "mf_leadingEdgeToBackButtonText");
        result = (leading + v9 - v7) * 0.5;
      }
    }
    self->_leadingToIndicatorMargin = result;
  }
  return result;
}

- (double)indicatorMaxWidth
{
  double result;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  result = self->_indicatorMaxWidth;
  if (result == 2.22507386e-308)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    result = 16.0;
    if (IsAccessibilityCategory)
      result = 30.0;
    self->_indicatorMaxWidth = result;
  }
  return result;
}

- (id)threadDisclosureColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  if (-[MessageListCellLayoutValues useSelectedColorForConfigurationState:backgroundConfiguration:](self, "useSelectedColorForConfigurationState:backgroundConfiguration:", a3, a5))
  {
    objc_msgSend(v8, "textProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailInteractiveColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)addressColorForContentConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subjectColorForContentConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)annotationColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  if (-[MessageListCellLayoutValues useSelectedColorForConfigurationState:backgroundConfiguration:](self, "useSelectedColorForConfigurationState:backgroundConfiguration:", a3, a5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSelectedAnnotationColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "secondaryTextProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)dateColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  v10 = (void *)*MEMORY[0x1E0DC4730];
  v11 = a4;
  objc_msgSend(v10, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v11, "textProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "resolvedColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
  }
  else
  {
    -[MessageListCellLayoutValues summaryColorForConfigurationState:contentConfiguration:backgroundConfiguration:](self, "summaryColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v8, v11, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)summaryColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  if (-[MessageListCellLayoutValues useSelectedColorForConfigurationState:backgroundConfiguration:](self, "useSelectedColorForConfigurationState:backgroundConfiguration:", a3, a5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSelectedSummaryColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "secondaryTextProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)useSelectedColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  char v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (self->_useSidebarAppearance)
  {
    v8 = objc_msgSend(v6, "isSelected");
    v9 = objc_msgSend(v6, "isFocusSystemActive");
    if (v8 && !v9
      || (objc_msgSend(v6, "isFocused") & 1) != 0
      || (v10 = objc_msgSend(v6, "isEditing"), (v8 & objc_msgSend(v6, "isFocusingOnMessageListCell")) == 1)
      && ((v10 & 1) != 0 || -[MessageListCellLayoutValues inMultiSelectionMode](self, "inMultiSelectionMode")))
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v7, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListCellLayoutValues tintColor](self, "tintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "isEqual:", v13);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)indicatorToTrailingMargin
{
  double result;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  result = self->_indicatorToTrailingMargin;
  if (result == 2.22507386e-308)
  {
    if (self->_useSidebarAppearance)
    {
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

      result = 8.0;
      if (IsAccessibilityCategory)
        result = 4.0;
    }
    else
    {
      result = self->_systemLayoutMargins.trailing;
    }
    self->_indicatorToTrailingMargin = result;
  }
  return result;
}

- (double)bottomMargin
{
  double result;
  int v4;

  result = self->_bottomMargin;
  if (result == 2.22507386e-308)
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC3BF8], "mui_isLargeFormatPad");
    result = 0.0;
    if (v4)
      result = 4.0;
    self->_bottomMargin = result;
  }
  return result;
}

- (void)setSystemLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  double v8;
  double v9;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v8 = self->_systemLayoutMargins.leading - a3.leading;
  if (v8 < 0.0)
    v8 = -v8;
  if (v8 >= 2.22044605e-16)
    goto LABEL_7;
  v9 = self->_systemLayoutMargins.trailing - a3.trailing;
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= 2.22044605e-16)
  {
LABEL_7:
    -[MessageListCellLayoutValues _invalidateAndNotify:](self, "_invalidateAndNotify:", 1);
    self->_systemLayoutMargins.top = top;
    self->_systemLayoutMargins.leading = leading;
    self->_systemLayoutMargins.bottom = bottom;
    self->_systemLayoutMargins.trailing = trailing;
  }
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *traitCollection;
  id v6;

  v6 = a3;
  traitCollection = self->_traitCollection;
  if (!traitCollection
    || -[UITraitCollection mf_traitDifferenceAffectsTextLayout:](traitCollection, "mf_traitDifferenceAffectsTextLayout:", v6))
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    self->_useSidebarAppearance = objc_msgSend(v6, "mf_useSplitViewStyling");
    -[MessageListCellLayoutValues _invalidateAndNotify:](self, "_invalidateAndNotify:", 0);
  }

}

- (id)_init
{
  MessageListCellLayoutValues *v2;
  MessageListCellLayoutValues *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListCellLayoutValues;
  v2 = -[MessageListCellLayoutValues init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MessageListCellLayoutValues _invalidateAndNotify:](v2, "_invalidateAndNotify:", 0);
  return v3;
}

- (void)_invalidateAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  UIFont *addressFont;
  UIFont *dateFont;
  UIFont *subjectFont;
  UIFont *summaryFont;
  int64x2_t v10;
  void *v11;
  id v12;

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCellLayoutValues.m"), 270, CFSTR("Current thread must be main"));

  }
  addressFont = self->_addressFont;
  self->_addressFont = 0;

  dateFont = self->_dateFont;
  self->_dateFont = 0;

  subjectFont = self->_subjectFont;
  self->_subjectFont = 0;

  summaryFont = self->_summaryFont;
  self->_summaryFont = 0;

  v10 = vdupq_n_s64(0x10000000000000uLL);
  *(int64x2_t *)&self->_defaultRowHeight = v10;
  *(int64x2_t *)&self->_topMargin = v10;
  *(int64x2_t *)&self->_leadingPadding = v10;
  *(int64x2_t *)&self->_bottomMargin = v10;
  self->_addressCapHeight = 2.22507386e-308;
  *(int64x2_t *)&self->_bottomPadding = v10;
  *(int64x2_t *)&self->_indicatorToTrailingMargin = v10;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("kMessageListCellLayoutValuesDidChangeNotification"), self);

  }
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setDefaultBackgroundConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)useSidebarAppearance
{
  return self->_useSidebarAppearance;
}

- (UIBackgroundConfiguration)defaultBackgroundConfiguration
{
  return (UIBackgroundConfiguration *)(id)-[UIBackgroundConfiguration copy](self->_defaultBackgroundConfiguration, "copy");
}

- (double)backgroundCornerRadius
{
  double result;

  result = 10.0;
  if (!self->_useSidebarAppearance)
    return 0.0;
  return result;
}

- (id)backgroundColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isSelected");
  v9 = v8;
  if (!self->_useSidebarAppearance)
  {
    -[MessageListCellLayoutValues backgroundColorForSelectedState:disclosureEnabled:](self, "backgroundColorForSelectedState:disclosureEnabled:", v8, objc_msgSend(v6, "isParent"));
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v16 = (void *)v17;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v6, "isFocusSystemActive");
  v11 = objc_msgSend(v6, "isFocused");
  v12 = objc_msgSend(v6, "isEditing");
  if (((v9 ^ 1) & 1) != 0 || (v11 & 1) != 0 || !v12)
  {
    if (((v10 | v9 ^ 1) & 1) == 0)
    {
      -[MessageListCellLayoutValues tintColor](self, "tintColor");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (((v9 | v11) & 1) == 0)
    {
      if (objc_msgSend(v6, "isParent"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSecondarySelectionColor");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (objc_msgSend(v6, "isChild"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListTertiarySelectionColor");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v16 = 0;
    goto LABEL_13;
  }
  v13 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v13, "setEditing:", 0);
  objc_msgSend(v7, "updatedConfigurationForState:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListCellLayoutValues tintColor](self, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolvedBackgroundColorForTintColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
LABEL_13:

  return v16;
}

- (BOOL)supportsPopover
{
  return self->_supportsPopover;
}

- (double)horizontalSpacing
{
  return 8.0;
}

- (double)topMargin
{
  double result;
  int v4;

  result = self->_topMargin;
  if (result == 2.22507386e-308)
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC3BF8], "mui_isLargeFormatPad");
    result = 0.0;
    if (v4)
      result = 4.0;
    self->_topMargin = result;
  }
  return result;
}

- (double)avatarSize
{
  return 0.0;
}

- (double)additionalLeadingInsetForGroupedSenderAvatars
{
  return 0.0;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  -[MessageListCellLayoutValues doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListCellLayoutValues linesOfSummaryForCompactHeight:]", "MessageListCellLayoutValues.m", 537, "0");
}

- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4
{
  -[MessageListCellLayoutValues doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  __assert_rtn("-[MessageListCellLayoutValues backgroundColorForSelectedState:disclosureEnabled:]", "MessageListCellLayoutValues.m", 542, "0");
}

- (id)absentDataColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  if (-[MessageListCellLayoutValues useSelectedColorForConfigurationState:backgroundConfiguration:](self, "useSelectedColorForConfigurationState:backgroundConfiguration:", a3, a5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSelectedSummaryColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "secondaryTextProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)summarySymbolColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  if (-[MessageListCellLayoutValues useSelectedColorForConfigurationState:backgroundConfiguration:](self, "useSelectedColorForConfigurationState:backgroundConfiguration:", a3, a5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSelectedSummarySymbolColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSummarySymbolColor");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recipientColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  if (-[MessageListCellLayoutValues useSelectedColorForConfigurationState:backgroundConfiguration:](self, "useSelectedColorForConfigurationState:backgroundConfiguration:", a3, a5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailMessageListSelectedRecipientColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "secondaryTextProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (int64_t)actualLineCountForSummary:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  int64_t v12;
  MessageListCellLabel *v13;
  void *v14;
  NSString *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  int64_t v29;
  uint64_t v31;
  _QWORD v32[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[MessageListCellLayoutValues bodyLeading](self, "bodyLeading");
  v11 = v10;
  v12 = -[MessageListCellLayoutValues linesOfSummaryForCompactHeight:](self, "linesOfSummaryForCompactHeight:", 0);
  v13 = objc_alloc_init(MessageListCellLabel);
  -[MessageListCellLayoutValues summaryFont](self, "summaryFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCellLabel setFont:](v13, "setFont:", v14);

  -[MessageListCellLabel setText:](v13, "setText:", v9);
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if ((_DWORD)v9)
  {
    LODWORD(v16) = 1.0;
    -[MessageListCellLabel _setHyphenationFactor:](v13, "_setHyphenationFactor:", v16);
  }
  -[MessageListCellLabel setFrame:](v13, "setFrame:", x + v11, y + 0.0, width - (v11 + 0.0), height);
  -[MessageListCellLabel frame](v13, "frame");
  v18 = v17;
  -[MessageListCellLabel text](v13, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0DC1138];
  -[MessageListCellLabel font](v13, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, v18, 3.40282347e38);
  v23 = v22;

  -[MessageListCellLabel font](v13, "font");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_bodyLeading");
  v26 = v25;
  -[MessageListCellLabel font](v13, "font");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "descender");
  v29 = vcvtpd_s64_f64(v23 / (v26 - v28));

  if (v12 >= v29)
    v12 = v29;

  return v12;
}

- (UIFont)addressFont
{
  return self->_addressFont;
}

- (UIFont)subjectFont
{
  return self->_subjectFont;
}

- (double)compactRowHeight
{
  return self->_compactRowHeight;
}

- (double)defaultRowHeight
{
  return self->_defaultRowHeight;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (BOOL)isSubjectVisible
{
  return self->_subjectVisible;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setSupportsPopover:(BOOL)a3
{
  self->_supportsPopover = a3;
}

- (BOOL)inMultiSelectionMode
{
  return self->_inMultiSelectionMode;
}

- (void)setInMultiSelectionMode:(BOOL)a3
{
  self->_inMultiSelectionMode = a3;
}

- (NSDirectionalEdgeInsets)systemLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_systemLayoutMargins.top;
  leading = self->_systemLayoutMargins.leading;
  bottom = self->_systemLayoutMargins.bottom;
  trailing = self->_systemLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_summaryFont, 0);
  objc_storeStrong((id *)&self->_subjectFont, 0);
  objc_storeStrong((id *)&self->_addressFont, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundConfiguration, 0);
}

@end
