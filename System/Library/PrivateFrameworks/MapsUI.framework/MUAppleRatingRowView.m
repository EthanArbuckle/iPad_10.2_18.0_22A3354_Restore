@implementation MUAppleRatingRowView

- (MUAppleRatingRowView)initWithFrame:(CGRect)a3 ratingsCountAnimationEnabled:(BOOL)a4
{
  _BOOL4 v4;
  MUAppleRatingRowView *v5;
  MUAppleRatingRowView *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUAppleRatingRowView;
  v5 = -[MKViewWithHairline initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = -[MUAppleRatingRowView effectiveUserInterfaceLayoutDirection](v5, "effectiveUserInterfaceLayoutDirection");
    if (v4)
    {
      v8 = v7;
      if (GEOConfigGetBOOL())
        v9 = v8 == 0;
      else
        v9 = 0;
      if (v9)
        v6->_ratingsCountAnimationEnabled = 1;
    }
    -[MUAppleRatingRowView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("AppleRatingRow"));
    -[MUAppleRatingRowView _setupSubviews](v6, "_setupSubviews");
    -[MUAppleRatingRowView _setupConstraints](v6, "_setupConstraints");
  }
  return v6;
}

- (void)_setupSubviews
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
  MUAppleRatingRowSubtitleView *v12;
  id *p_subtitleView;
  MUAppleRatingRowSubtitleView *subtitleView;
  const __CFString *v15;
  UILabel *v16;
  UILabel *subtitleLabel;
  id v18;

  -[MUAppleRatingRowView setLayoutMargins:](self, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v4, v7, v6);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

  +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v11);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("AppleRatingTitle"));
  -[MUAppleRatingRowView addSubview:](self, "addSubview:", self->_titleLabel);
  if (self->_ratingsCountAnimationEnabled)
  {
    v12 = -[MUAppleRatingRowSubtitleView initWithFrame:]([MUAppleRatingRowSubtitleView alloc], "initWithFrame:", v5, v4, v7, v6);
    p_subtitleView = (id *)&self->_subtitleView;
    subtitleView = self->_subtitleView;
    self->_subtitleView = v12;

    v15 = CFSTR("AppleRatingSubtitleView");
  }
  else
  {
    v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v4, v7, v6);
    p_subtitleView = (id *)&self->_subtitleLabel;
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v16;

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    v15 = CFSTR("AppleRatingSubtitle");
  }
  objc_msgSend(*p_subtitleView, "setAccessibilityIdentifier:", v15);
  -[MUAppleRatingRowView addSubview:](self, "addSubview:", *p_subtitleView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

}

- (void)_setupConstraints
{
  MUStackLayout *v3;
  void *v4;
  MUStackLayout *v5;
  MUStackLayout *stackLayout;
  MUAppleRatingRowSubtitleView *subtitleView;
  void *v8;
  UILabel *subtitleLabel;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = [MUStackLayout alloc];
  -[MUAppleRatingRowView layoutMarginsGuide](self, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUStackLayout initWithContainer:axis:](v3, "initWithContainer:axis:", v4, 1);
  stackLayout = self->_stackLayout;
  self->_stackLayout = v5;

  if (self->_ratingsCountAnimationEnabled)
  {
    subtitleView = self->_subtitleView;
    v12[0] = self->_titleLabel;
    v12[1] = subtitleView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUStackLayout setArrangedLayoutItems:](self->_stackLayout, "setArrangedLayoutItems:", v8);

    -[MUStackLayout setAlignment:](self->_stackLayout, "setAlignment:", 1);
    -[MUStackLayout setAlignmentBoundsContent:](self->_stackLayout, "setAlignmentBoundsContent:", 1);
  }
  else
  {
    subtitleLabel = self->_subtitleLabel;
    v11[0] = self->_titleLabel;
    v11[1] = subtitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUStackLayout setArrangedLayoutItems:](self->_stackLayout, "setArrangedLayoutItems:", v10);

  }
  -[MUStackLayout setSpacing:](self->_stackLayout, "setSpacing:", 2.0);
  -[MUConstraintLayout activate](self->_stackLayout, "activate");
}

- (void)setViewModel:(id)a3
{
  MURatingPercentageViewModel *v5;
  MURatingPercentageViewModel *viewModel;
  char v7;
  MURatingPercentageViewModel *v8;
  MURatingPercentageViewModel *v9;

  v5 = (MURatingPercentageViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v9 = v5;
    v7 = -[MURatingPercentageViewModel isEqual:](viewModel, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      v8 = self->_viewModel;
      objc_storeStrong((id *)&self->_viewModel, a3);
      if (self->_ratingsCountAnimationEnabled)
        -[MUAppleRatingRowView _updateAppearanceAnimatingFromPreviousViewModel:](self, "_updateAppearanceAnimatingFromPreviousViewModel:", v8);
      else
        -[MUAppleRatingRowView _updateAppearance](self, "_updateAppearance");

      v5 = v9;
    }
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;

  -[MURatingPercentageViewModel categoryTitle](self->_viewModel, "categoryTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  if (-[MURatingPercentageViewModel hasSubtitle](self->_viewModel, "hasSubtitle"))
  {
    -[MUAppleRatingRowView _ratingSubtitleAttributedString](self, "_ratingSubtitleAttributedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v4);

    -[MUAppleRatingRowView addSubview:](self, "addSubview:", self->_subtitleLabel);
    -[MUStackLayout addArrangedLayoutItem:](self->_stackLayout, "addArrangedLayoutItem:", self->_subtitleLabel);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
    -[MUStackLayout removeArrangedLayoutItem:](self->_stackLayout, "removeArrangedLayoutItem:", self->_subtitleLabel);
  }
}

- (void)_updateAppearanceAnimatingFromPreviousViewModel:(id)a3
{
  void *v4;
  void *v5;
  MURatingPercentageViewModel *viewModel;
  uint64_t v7;
  MUAppleRatingRowSubtitleView *subtitleView;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
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
  void *v23;
  MUAppleRatingRowSubtitleView *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  -[MURatingPercentageViewModel categoryTitle](self->_viewModel, "categoryTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  viewModel = self->_viewModel;
  if (viewModel && (-[MURatingPercentageViewModel hasSubtitle](viewModel, "hasSubtitle") & 1) != 0)
  {
    v7 = -[MURatingPercentageViewModel numberOfRatingsUsedForScore](self->_viewModel, "numberOfRatingsUsedForScore");
    subtitleView = self->_subtitleView;
    if (v7)
    {
      v9 = v7;
      -[MUAppleRatingRowSubtitleView superview](self->_subtitleView, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUAppleRatingRowView addSubview:](self, "addSubview:", self->_subtitleView);
      -[MUStackLayout addArrangedLayoutItem:](self->_stackLayout, "addArrangedLayoutItem:", self->_subtitleView);
      if (v10)
        v11 = objc_msgSend((id)objc_opt_class(), "_ratingsValueAnimationFromViewModel:toViewModel:", v42, self->_viewModel);
      else
        v11 = 0;
      -[MUAppleRatingRowView _percentageStringComponentsFromCurrentViewModel](self, "_percentageStringComponentsFromCurrentViewModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v18;
      if (v18)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        +[MapsUILayout buildAttributedDisplayStringForComponents:forContainingView:](MapsUILayout, "buildAttributedDisplayStringForComponents:forContainingView:", v19, self->_subtitleView);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CC17B0], "stringFromCount:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _MULocalizedStringFromThisBundle(CFSTR("<num> ratings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%d %@"), 0, v9, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "rangeOfString:", v21))
      {
        v24 = self->_subtitleView;
        v25 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v25, "initWithString:attributes:", v23, v28);
        -[MUAppleRatingRowSubtitleView setPercentageString:ratingsValueString:ratingsValueAnimation:ratingsString:](v24, "setPercentageString:ratingsValueString:ratingsValueAnimation:ratingsString:", v20, 0, 0, v29);

      }
      else
      {
        objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", v21, &stru_1E2E05448);
        v39 = objc_claimAutoreleasedReturnValue();

        v40 = v20;
        v30 = objc_alloc(MEMORY[0x1E0CB3778]);
        +[MUAppleRatingRowView _numberOfPeopleMonospacedFont](MUAppleRatingRowView, "_numberOfPeopleMonospacedFont");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v31, v32);
        v38 = v11;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v30, "initWithString:attributes:", v21, v33);

        v34 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v34, "initWithString:attributes:", v39, v37);

        v20 = v40;
        -[MUAppleRatingRowSubtitleView setPercentageString:ratingsValueString:ratingsValueAnimation:ratingsString:](self->_subtitleView, "setPercentageString:ratingsValueString:ratingsValueAnimation:ratingsString:", v40, v26, v38, v27);
        v23 = (void *)v39;
      }

    }
    else
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3498]);
      _MULocalizedStringFromThisBundle(CFSTR("No Ratings [Placecard]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v16);
      -[MUAppleRatingRowSubtitleView setPercentageString:ratingsValueString:ratingsValueAnimation:ratingsString:](subtitleView, "setPercentageString:ratingsValueString:ratingsValueAnimation:ratingsString:", 0, 0, 0, v17);

    }
  }
  else
  {
    -[MUAppleRatingRowSubtitleView removeFromSuperview](self->_subtitleView, "removeFromSuperview");
    -[MUStackLayout removeArrangedLayoutItem:](self->_stackLayout, "removeArrangedLayoutItem:", self->_subtitleView);
  }

}

+ (int64_t)_ratingsValueAnimationFromViewModel:(id)a3 toViewModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v5, "numberOfRatingsUsedForScore")
      && objc_msgSend(v7, "numberOfRatingsUsedForScore")
      && (v9 = objc_msgSend(v5, "numberOfRatingsUsedForScore"), v9 != objc_msgSend(v7, "numberOfRatingsUsedForScore")))
    {
      objc_msgSend(MEMORY[0x1E0CC17B0], "stringFromCount:", objc_msgSend(v5, "numberOfRatingsUsedForScore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC17B0], "stringFromCount:", objc_msgSend(v7, "numberOfRatingsUsedForScore"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        v13 = objc_msgSend(v7, "numberOfRatingsUsedForScore");
        if (v13 <= objc_msgSend(v5, "numberOfRatingsUsedForScore"))
        {
          v14 = objc_msgSend(v7, "numberOfRatingsUsedForScore");
          v8 = 2 * (v14 < objc_msgSend(v5, "numberOfRatingsUsedForScore"));
        }
        else
        {
          v8 = 1;
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_ratingSubtitleAttributedString
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = -[MURatingPercentageViewModel numberOfRatingsUsedForScore](self->_viewModel, "numberOfRatingsUsedForScore");
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MUAppleRatingRowView _percentageStringComponentsFromCurrentViewModel](self, "_percentageStringComponentsFromCurrentViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObjectsFromArray:", v6);
    objc_msgSend(MEMORY[0x1E0CC17B0], "stringFromCount:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _MULocalizedStringFromThisBundle(CFSTR("<num> ratings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d %@"), 0, v4, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v13);

    objc_msgSend(v5, "addObject:", v14);
    v15 = (void *)objc_msgSend(v5, "copy");
    +[MapsUILayout buildAttributedDisplayStringForComponents:forContainingView:](MapsUILayout, "buildAttributedDisplayStringForComponents:forContainingView:", v15, self->_subtitleLabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    _MULocalizedStringFromThisBundle(CFSTR("No Ratings [Placecard]"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v17, "initWithString:attributes:", v5, v8);
  }

  return v16;
}

+ (id)ratingSymbolStringWithFont:(id)a3 symbolScale:(int64_t)a4 attributes:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v7 = (void *)MEMORY[0x1E0DC3870];
  v8 = (void *)MEMORY[0x1E0CC17B8];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "ratingSymbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemImageNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageWithConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithRenderingMode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v16, "setImage:", v15);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:attributes:", v16, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_percentageStringComponentsFromCurrentViewModel
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (-[MURatingPercentageViewModel hasPercentage](self->_viewModel, "hasPercentage"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)objc_opt_class();
    v5 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1440]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0DC1140];
    +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ratingSymbolStringWithFont:symbolScale:attributes:", v6, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu%%"), -[MURatingPercentageViewModel displayPercentage](self->_viewModel, "displayPercentage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    v12 = *MEMORY[0x1E0DC1420];
    objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v5, *MEMORY[0x1E0DC1420]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v15);

    objc_msgSend(v3, "addObject:", v28);
    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    v29 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v5, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", CFSTR(" "), v19);
    objc_msgSend(v3, "addObject:", v20);

    objc_msgSend(v3, "addObject:", v16);
    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    _MULocalizedStringFromThisBundle(CFSTR("Delimiter"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v5, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAppleRatingRowView _attributesWithFont:color:](self, "_attributesWithFont:color:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v21, "initWithString:attributes:", v22, v25);
    objc_msgSend(v3, "addObject:", v26);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_attributesWithFont:(id)a3 color:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1140];
  v11[0] = *MEMORY[0x1E0DC1138];
  v11[1] = v5;
  v12[0] = a3;
  v12[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_contentSizeDidChange
{
  if (self->_ratingsCountAnimationEnabled)
    -[MUAppleRatingRowView _updateAppearanceAnimatingFromPreviousViewModel:](self, "_updateAppearanceAnimatingFromPreviousViewModel:", 0);
  else
    -[MUAppleRatingRowView _updateAppearance](self, "_updateAppearance");
}

+ (id)_numberOfPeopleMonospacedFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  v23 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0DC13D0];
  v21[0] = *MEMORY[0x1E0DC13D8];
  v4 = v21[0];
  v21[1] = v5;
  v22[0] = &unk_1E2E554E8;
  v22[1] = &unk_1E2E55500;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = v5;
  v20[0] = &unk_1E2E55518;
  v20[1] = &unk_1E2E55530;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = v5;
  v18[0] = &unk_1E2E554E8;
  v18[1] = &unk_1E2E55500;
  v17[2] = v4;
  v17[3] = v5;
  v18[2] = &unk_1E2E55518;
  v18[3] = &unk_1E2E55530;
  v17[4] = *MEMORY[0x1E0DC1380];
  v16[0] = v6;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = *MEMORY[0x1E0DC13C0];
  v18[4] = v8;
  v18[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v12, "pointSize");
  objc_msgSend(v13, "fontWithDescriptor:size:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MURatingPercentageViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
