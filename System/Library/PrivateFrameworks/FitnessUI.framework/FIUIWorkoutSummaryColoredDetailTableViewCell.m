@implementation FIUIWorkoutSummaryColoredDetailTableViewCell

+ (double)rowHeightWithNoDataString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a3)
    return 49.0;
  v3 = a3;
  _NoDataLabel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  objc_msgSend(v4, "sizeThatFits:", v7 + 5.5 * -2.0, 1.79769313e308);
  v9 = v8;

  return v9 + 17.0 + 9.0;
}

- (FIUIWorkoutSummaryColoredDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FIUIWorkoutSummaryColoredDetailTableViewCell *v4;
  FIUIWorkoutSummaryColoredDetailTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FIUIWorkoutSummaryColoredDetailTableViewCell;
  v4 = -[FIUIWorkoutSummaryColoredDetailTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[FIUIWorkoutSummaryColoredDetailTableViewCell _setupUI](v4, "_setupUI");
  return v5;
}

- (void)_setupUI
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *detailLabel;
  FIUIDividerView *v14;
  UIView *dividerView;
  UIView *v16;
  UIView *optionalButtonView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[FIUIWorkoutSummaryColoredDetailTableViewCell _setDefaultValueFontSizes](self, "_setDefaultValueFontSizes");
  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v10);

  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v12;

  v14 = -[FIUIDividerView initWithFrame:]([FIUIDividerView alloc], "initWithFrame:", v4, v5, v6, v7);
  dividerView = self->_dividerView;
  self->_dividerView = &v14->super;

  v16 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  optionalButtonView = self->_optionalButtonView;
  self->_optionalButtonView = v16;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.15, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_optionalButtonView, "setBackgroundColor:", v18);

  -[UIView layer](self->_optionalButtonView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", 6.0);

  -[UIView setHidden:](self->_optionalButtonView, "setHidden:", 1);
  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_optionalButtonView);

  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_titleLabel);

  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", self->_detailLabel);

  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_dividerView);

}

- (void)_setDefaultValueFontSizes
{
  UIFont *v3;
  UIFont *detailFont;
  UIFont *v5;
  UIFont *suffixFont;

  objc_msgSend(MEMORY[0x24BEBB520], "fu_sausageFontOfSize:", 25.5);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  detailFont = self->_detailFont;
  self->_detailFont = v3;

  objc_msgSend(MEMORY[0x24BEBB520], "fu_mediumSausageFontOfSize:", 18.0);
  v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  suffixFont = self->_suffixFont;
  self->_suffixFont = v5;

}

- (void)setShowBackgroundButton:(BOOL)a3
{
  self->_showBackgroundButton = a3;
  -[UIView setHidden:](self->_optionalButtonView, "setHidden:", !a3);
}

- (void)setTitleString:(id)a3
{
  id v4;

  objc_msgSend(a3, "localizedUppercaseString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

}

- (void)setNoDataString:(id)a3 textColor:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  UILabel *noDataLabel;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14 && (v7 = objc_msgSend(v14, "length"), v8 = v14, v7))
  {
    noDataLabel = self->_noDataLabel;
    if (!noDataLabel)
    {
      _NoDataLabel();
      v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v11 = self->_noDataLabel;
      self->_noDataLabel = v10;

      -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_noDataLabel);

      v8 = v14;
      noDataLabel = self->_noDataLabel;
    }
    -[UILabel setText:](noDataLabel, "setText:", v8);
    -[UILabel setTextColor:](self->_noDataLabel, "setTextColor:", v6);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_noDataLabel, "removeFromSuperview");
    v13 = self->_noDataLabel;
    self->_noDataLabel = 0;

  }
}

- (void)setDetailString:(id)a3 suffixString:(id)a4 textColor:(id)a5 shouldForceLTRForDetailString:(BOOL)a6
{
  UIColor *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  NSString *v17;
  NSString *v18;
  NSString *detailString;
  NSString *v20;
  NSString *suffixString;
  NSString *v22;
  UIColor *textColor;
  UIColor *v24;
  _BOOL4 IsRightToLeft;
  id v26;

  v10 = (UIColor *)a5;
  self->_shouldForceLTRForDetailString = a6;
  if (a3)
    v11 = (__CFString *)a3;
  else
    v11 = &stru_24CF339D8;
  v12 = v11;
  v13 = (__CFString *)a4;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = &stru_24CF339D8;
  v16 = v15;

  -[__CFString localizedUppercaseString](v12, "localizedUppercaseString");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[__CFString localizedUppercaseString](v16, "localizedUppercaseString");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();

  detailString = self->_detailString;
  self->_detailString = v17;
  v20 = v17;

  suffixString = self->_suffixString;
  self->_suffixString = v18;
  v22 = v18;

  textColor = self->_textColor;
  self->_textColor = v10;
  v24 = v10;

  IsRightToLeft = FIUILocaleIsRightToLeft();
  NLSessionFormatDetailLabel(self->_detailString, self->_suffixString, self->_detailFont, self->_suffixFont, self->_textColor, IsRightToLeft, self->_shouldForceLTRForDetailString);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_detailLabel, "setAttributedText:", v26);

}

- (void)setSecondMetricTitle:(id)a3 detailString:(id)a4 detailColor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  UILabel *secondTitleLabel;
  UILabel *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *secondDetailLabel;
  UILabel *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  secondTitleLabel = self->_secondTitleLabel;
  if (!secondTitleLabel)
  {
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v13 = self->_secondTitleLabel;
    self->_secondTitleLabel = v12;

    -[UILabel setAllowsDefaultTighteningForTruncation:](self->_secondTitleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_secondTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setFont:](self->_secondTitleLabel, "setFont:", v10);
    v14 = self->_secondTitleLabel;
    objc_msgSend(MEMORY[0x24BE01CA8], "systemGrayTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_secondTitleLabel);

    secondTitleLabel = self->_secondTitleLabel;
  }
  objc_msgSend(v23, "localizedUppercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](secondTitleLabel, "setText:", v17);

  secondDetailLabel = self->_secondDetailLabel;
  if (!secondDetailLabel)
  {
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v20 = self->_secondDetailLabel;
    self->_secondDetailLabel = v19;

    -[UILabel setFont:](self->_secondDetailLabel, "setFont:", v10);
    -[UILabel setTextColor:](self->_secondDetailLabel, "setTextColor:", v9);
    -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", self->_secondDetailLabel);

    secondDetailLabel = self->_secondDetailLabel;
  }
  objc_msgSend(v8, "localizedUppercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](secondDetailLabel, "setText:", v22);

}

- (void)setCustomAccessoryButton:(id)a3
{
  UIButton **p_customAccessoryButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_customAccessoryButton = &self->_customAccessoryButton;
  -[UIButton superview](self->_customAccessoryButton, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[UIButton removeFromSuperview](*p_customAccessoryButton, "removeFromSuperview");
  objc_storeStrong((id *)&self->_customAccessoryButton, a3);
  if (v10)
  {
    -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_customAccessoryButton);

    -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bringSubviewToFront:", *p_customAccessoryButton);

  }
  -[FIUIWorkoutSummaryColoredDetailTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  UIButton *customAccessoryButton;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  UILabel *noDataLabel;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54[4];
  double v55;
  double v56;
  double v57;
  double v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v59.origin.x = v9;
  memset(&v59.origin.y, 0, 24);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9 + 5.5 * -2.0);
  v13 = v12;
  v14 = 17.0 - v12;
  -[UILabel _baselineOffsetFromBottom](self->_titleLabel, "_baselineOffsetFromBottom");
  v16 = v14 + v15;
  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v16;
  v53 = v13;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", FIUIRoundFrameToViewScale(v17));

  customAccessoryButton = self->_customAccessoryButton;
  v51 = v11;
  if (customAccessoryButton)
  {
    -[UIButton sizeToFit](customAccessoryButton, "sizeToFit");
    -[UIButton imageView](self->_customAccessoryButton, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v50 = v20;

    -[UIButton frame](self->_customAccessoryButton, "frame");
    v22 = v21;
    -[UIButton imageView](self->_customAccessoryButton, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    -[UIButton imageView](self->_customAccessoryButton, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v22 - (v25 + v27);

    -[UIButton bounds](self->_customAccessoryButton, "bounds");
    v30 = v29;
    v59.size.width = v31;
    v59.size.height = v29;
    v59.origin.x = v28 + v9 - v31 + -6.0;
    v60.origin.x = v5;
    v60.origin.y = v7;
    v60.size.width = v9;
    v60.size.height = v11;
    v32 = CGRectGetMidY(v60) + v30 * -0.5;
    -[UILabel frame](self->_titleLabel, "frame");
    if (v59.origin.x <= CGRectGetMaxX(v61))
    {
      -[UILabel frame](self->_titleLabel, "frame");
      if (v32 <= CGRectGetMaxY(v62))
        v32 = 21.0 - v50;
    }
    v59.origin.y = v32;
    FIUIFlipFrameRightToLeftIfNeeded(&v59.origin.x, v5, v7, v9, v11);
    -[UIButton setFrame:](self->_customAccessoryButton, "setFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    v33 = v7;
    v34 = v5;
  }
  else
  {
    v33 = v7;
    v34 = v5;
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  CGRectGetWidth(v59);
  -[UILabel _baselineOffsetFromBottom](self->_detailLabel, "_baselineOffsetFromBottom");
  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = FIUIRoundFrameToViewScale(v35);
  v56 = v36;
  v57 = v37;
  v58 = v38;

  FIUIFlipFrameRightToLeftIfNeeded(&v55, v34, v33, v9, v51);
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", v55, v56, v57, v58);
  -[FIUIWorkoutSummaryColoredDetailTableViewCell _resizeFontsIfNeededToFitWidth:](self, "_resizeFontsIfNeededToFitWidth:", v57);
  noDataLabel = self->_noDataLabel;
  if (noDataLabel)
  {
    -[UILabel sizeThatFits:](noDataLabel, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
    v41 = v40;
    v43 = v42;
    -[UILabel _baselineOffsetFromBottom](self->_detailLabel, "_baselineOffsetFromBottom");
    v54[0] = 5.5;
    v54[1] = v44 + 17.0;
    v54[2] = v41;
    v54[3] = v43;
    FIUIFlipFrameRightToLeftIfNeeded(v54, v34, v33, v9, v51);
    -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFrame:](self->_noDataLabel, "setFrame:", FIUIRoundFrameToViewScale(v45));

  }
  -[UILabel setFrame:](self->_secondTitleLabel, "setFrame:", 5.5, v52 + 38.25, v9 + 5.5 * -2.0, v53);
  -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFrame:](self->_secondDetailLabel, "setFrame:", FIUIRoundFrameToViewScale(v46));

  -[UIView sizeThatFits:](self->_dividerView, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  v63.origin.x = v34;
  v48 = v47;
  v63.origin.y = v33;
  v63.size.width = v9;
  v63.size.height = v51;
  -[UIView setFrame:](self->_dividerView, "setFrame:", 5.5, CGRectGetMaxY(v63) - v48, v9 + 5.5 * -2.0, v48);
  if (!-[UIView isHidden](self->_optionalButtonView, "isHidden"))
  {
    if (FIUIOnePixel_onceToken != -1)
      dispatch_once(&FIUIOnePixel_onceToken, &__block_literal_global_4);
    v64.origin.x = v34;
    v64.origin.y = v33;
    v64.size.width = v9;
    v64.size.height = v51;
    CGRectInset(v64, 1.0, *(double *)&FIUIOnePixel_onePixel * 2.0 + 1.0);
    if (FIUIOnePixel_onceToken != -1)
      dispatch_once(&FIUIOnePixel_onceToken, &__block_literal_global_4);
    -[FIUIWorkoutSummaryColoredDetailTableViewCell contentView](self, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setFrame:](self->_optionalButtonView, "setFrame:", FIUIRoundFrameToViewScale(v49));

  }
}

- (void)_resizeFontsIfNeededToFitWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  UIFont *v12;
  UIFont *detailFont;
  void *v14;
  double v15;
  UIFont *v16;
  UIFont *suffixFont;
  _BOOL4 IsRightToLeft;
  void *v19;
  double v20;
  id v21;

  -[UIFont fontDescriptor](self->_detailFont, "fontDescriptor");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[UIFont fontDescriptor](self->_suffixFont, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 0.0)
  {
    -[UILabel attributedText](self->_detailLabel, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    if (v7 <= a3)
    {
LABEL_5:

    }
    else
    {
      while (1)
      {
        -[UIFont pointSize](self->_detailFont, "pointSize");
        v9 = v8;

        if (v9 < 15.0)
          break;
        v10 = (void *)MEMORY[0x24BEBB520];
        -[UIFont pointSize](self->_detailFont, "pointSize");
        objc_msgSend(v10, "fontWithDescriptor:size:", v21, v11 * 0.9);
        v12 = (UIFont *)objc_claimAutoreleasedReturnValue();
        detailFont = self->_detailFont;
        self->_detailFont = v12;

        v14 = (void *)MEMORY[0x24BEBB520];
        -[UIFont pointSize](self->_suffixFont, "pointSize");
        objc_msgSend(v14, "fontWithDescriptor:size:", v5, v15 * 0.9);
        v16 = (UIFont *)objc_claimAutoreleasedReturnValue();
        suffixFont = self->_suffixFont;
        self->_suffixFont = v16;

        IsRightToLeft = FIUILocaleIsRightToLeft();
        NLSessionFormatDetailLabel(self->_detailString, self->_suffixString, self->_detailFont, self->_suffixFont, self->_textColor, IsRightToLeft, self->_shouldForceLTRForDetailString);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setAttributedText:](self->_detailLabel, "setAttributedText:", v19);

        -[UILabel attributedText](self->_detailLabel, "attributedText");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "size");
        if (v20 <= a3)
          goto LABEL_5;
      }
    }
  }

}

- (void)prepareForReuse
{
  UILabel *secondTitleLabel;
  UILabel *secondDetailLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FIUIWorkoutSummaryColoredDetailTableViewCell;
  -[FIUIWorkoutSummaryColoredDetailTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[FIUIWorkoutSummaryColoredDetailTableViewCell _setDefaultValueFontSizes](self, "_setDefaultValueFontSizes");
  self->_shouldForceLTRForDetailString = 0;
  -[UILabel removeFromSuperview](self->_secondTitleLabel, "removeFromSuperview");
  secondTitleLabel = self->_secondTitleLabel;
  self->_secondTitleLabel = 0;

  -[UILabel removeFromSuperview](self->_secondDetailLabel, "removeFromSuperview");
  secondDetailLabel = self->_secondDetailLabel;
  self->_secondDetailLabel = 0;

}

+ (double)rowHeightWithSecondMetric
{
  double v2;

  objc_msgSend(a1, "rowHeightWithNoDataString:", 0);
  return v2 + 15.25 + 13.75;
}

- (void)setLineHidden:(BOOL)a3
{
  -[UIView setHidden:](self->_dividerView, "setHidden:", a3);
}

- (BOOL)showBackgroundButton
{
  return self->_showBackgroundButton;
}

- (UIButton)customAccessoryButton
{
  return self->_customAccessoryButton;
}

- (UIView)optionalButtonView
{
  return self->_optionalButtonView;
}

- (void)setOptionalButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_optionalButtonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalButtonView, 0);
  objc_storeStrong((id *)&self->_customAccessoryButton, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_suffixString, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_suffixFont, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_noDataLabel, 0);
  objc_storeStrong((id *)&self->_secondDetailLabel, 0);
  objc_storeStrong((id *)&self->_secondTitleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
