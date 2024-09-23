@implementation MUHoursSummaryView

- (MUHoursSummaryView)initWithViewModel:(id)a3
{
  id v5;
  MUHoursSummaryView *v6;
  MUHoursSummaryView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUHoursSummaryView;
  v6 = -[MUHoursSummaryView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_expanded = 0;
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[MUHoursSummaryView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("HoursSummary"));
    -[MUHoursSummaryView _setupSubviews](v7, "_setupSubviews");
    -[MUHoursSummaryView _setupConstraints](v7, "_setupConstraints");
    -[MUHoursSummaryView _updateAppearance](v7, "_updateAppearance");
  }

  return v7;
}

- (void)_setupSubviews
{
  UILayoutGuide *v3;
  UILayoutGuide *summaryStackLayoutGuide;
  MULabelViewProtocol *v5;
  MULabelViewProtocol *titleLabel;
  void *v7;
  void *v8;
  MULabelViewProtocol *v9;
  MULabelViewProtocol *hoursLabel;
  MULabelViewProtocol *v11;
  MULabelViewProtocol *openStateLabel;
  void *v13;
  id v14;
  UIImageView *v15;
  UIImageView *expansionIndicator;
  void *v17;
  void *v18;
  void *v19;
  UIImageView *v20;
  void *v21;
  double v22;
  double v23;
  UITapGestureRecognizer *v24;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  summaryStackLayoutGuide = self->_summaryStackLayoutGuide;
  self->_summaryStackLayoutGuide = v3;

  -[MUHoursSummaryView addLayoutGuide:](self, "addLayoutGuide:", self->_summaryStackLayoutGuide);
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_titleLabel, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setTextColor:](self->_titleLabel, "setTextColor:", v8);

  -[MULabelViewProtocol setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("HoursSummaryTitle"));
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v9 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  hoursLabel = self->_hoursLabel;
  self->_hoursLabel = v9;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_hoursLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setNumberOfLines:](self->_hoursLabel, "setNumberOfLines:", 0);
  -[MULabelViewProtocol setAdjustsFontForContentSizeCategory:](self->_hoursLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_hoursLabel, "setAccessibilityIdentifier:", CFSTR("HoursSummaryHours"));
  if (-[MUHoursSummaryViewModel isServiceHours](self->_viewModel, "isServiceHours"))
  {
    objc_storeStrong((id *)&self->_openStateLabel, self->_hoursLabel);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
    v11 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
    openStateLabel = self->_openStateLabel;
    self->_openStateLabel = v11;

    -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_openStateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MULabelViewProtocol setAdjustsFontForContentSizeCategory:](self->_openStateLabel, "setAdjustsFontForContentSizeCategory:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_openStateLabel, "setFont:", v13);

  v14 = objc_alloc(MEMORY[0x1E0DC3890]);
  v15 = (UIImageView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  expansionIndicator = self->_expansionIndicator;
  self->_expansionIndicator = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_expansionIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationWithFont:scale:", v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_expansionIndicator, "setPreferredSymbolConfiguration:", v19);

  v20 = self->_expansionIndicator;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v20, "setTintColor:", v21);

  LODWORD(v22) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_expansionIndicator, "setContentHuggingPriority:forAxis:", 0, v22);
  LODWORD(v23) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_expansionIndicator, "setContentHuggingPriority:forAxis:", 1, v23);
  v24 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v24;

  -[MUHoursSummaryView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel_expandButtonTapped);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel_expandButtonTapped);
  -[MUHoursSummaryView _updateExpandButton](self, "_updateExpandButton");
  -[MUHoursSummaryView addSubview:](self, "addSubview:", self->_titleLabel);
  -[MUHoursSummaryView addSubview:](self, "addSubview:", self->_hoursLabel);
  if (!-[MUHoursSummaryViewModel isServiceHours](self->_viewModel, "isServiceHours"))
  {
    -[MULabelViewProtocol setAccessibilityIdentifier:](self->_openStateLabel, "setAccessibilityIdentifier:", CFSTR("HoursSummaryOpenState"));
    -[MUHoursSummaryView addSubview:](self, "addSubview:", self->_openStateLabel);
  }
  -[MUHoursSummaryView addSubview:](self, "addSubview:", self->_expansionIndicator);
  objc_opt_self();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)-[MUHoursSummaryView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v27, sel__updateForPlatterAvailability);

  objc_opt_self();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)-[MUHoursSummaryView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v30, sel__contentSizeDidChange);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *titleToOpenStateConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *titleToHoursConstraint;
  MULabelViewProtocol *hoursLabel;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *hoursToOpenStateConstraint;
  NSLayoutConstraint *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[18];

  v64[16] = *MEMORY[0x1E0C80C00];
  -[MULabelViewProtocol bottomAnchor](self->_titleLabel, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol topAnchor](self->_openStateLabel, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleToOpenStateConstraint = self->_titleToOpenStateConstraint;
  self->_titleToOpenStateConstraint = v5;

  -[MULabelViewProtocol bottomAnchor](self->_titleLabel, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol topAnchor](self->_hoursLabel, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleToHoursConstraint = self->_titleToHoursConstraint;
  self->_titleToHoursConstraint = v9;

  hoursLabel = self->_hoursLabel;
  if (hoursLabel != self->_openStateLabel)
  {
    -[MULabelViewProtocol bottomAnchor](hoursLabel, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol topAnchor](self->_openStateLabel, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    hoursToOpenStateConstraint = self->_hoursToOpenStateConstraint;
    self->_hoursToOpenStateConstraint = v14;

  }
  v45 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide topAnchor](self->_summaryStackLayoutGuide, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryView topAnchor](self, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v61;
  -[UILayoutGuide bottomAnchor](self->_summaryStackLayoutGuide, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryView bottomAnchor](self, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v58;
  -[UILayoutGuide leadingAnchor](self->_summaryStackLayoutGuide, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryView leadingAnchor](self, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v55;
  -[UILayoutGuide trailingAnchor](self->_summaryStackLayoutGuide, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_expansionIndicator, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, -8.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v52;
  -[MULabelViewProtocol topAnchor](self->_titleLabel, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_summaryStackLayoutGuide, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v49;
  -[MULabelViewProtocol leadingAnchor](self->_titleLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_summaryStackLayoutGuide, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v46;
  -[MULabelViewProtocol trailingAnchor](self->_titleLabel, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_summaryStackLayoutGuide, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_titleToHoursConstraint;
  v64[6] = v42;
  v64[7] = v16;
  -[MULabelViewProtocol leadingAnchor](self->_hoursLabel, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_summaryStackLayoutGuide, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v39;
  -[MULabelViewProtocol trailingAnchor](self->_hoursLabel, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_summaryStackLayoutGuide, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v36;
  -[MULabelViewProtocol leadingAnchor](self->_openStateLabel, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_summaryStackLayoutGuide, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v33;
  -[MULabelViewProtocol trailingAnchor](self->_openStateLabel, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_summaryStackLayoutGuide, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v30;
  -[MULabelViewProtocol bottomAnchor](self->_openStateLabel, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_summaryStackLayoutGuide, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v27;
  -[UIImageView topAnchor](self->_expansionIndicator, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryView topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v17, 10.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v18;
  -[UIImageView bottomAnchor](self->_expansionIndicator, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryView bottomAnchor](self, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v21;
  -[UIImageView trailingAnchor](self->_expansionIndicator, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activateConstraints:", v25);

  if (self->_hoursLabel != self->_openStateLabel)
    -[NSLayoutConstraint setActive:](self->_hoursToOpenStateConstraint, "setActive:", 1);
}

- (void)expandButtonTapped
{
  void *v3;
  void (**v4)(void);

  self->_expanded ^= 1u;
  -[MUHoursSummaryView _updateExpandButton](self, "_updateExpandButton");
  -[MUHoursSummaryView actionHandler](self, "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUHoursSummaryView actionHandler](self, "actionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_updateExpandButton
{
  __CFString *v2;
  UIImageView *expansionIndicator;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_expanded)
    v2 = CFSTR("chevron.up");
  else
    v2 = CFSTR("chevron.down");
  expansionIndicator = self->_expansionIndicator;
  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = (void *)MEMORY[0x1E0DC3888];
  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4AD0];
  v8 = v2;
  objc_msgSend(v6, "preferredFontForTextStyle:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithFont:scale:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:withConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](expansionIndicator, "setImage:", v10);
}

- (void)handleAnimationStart
{
  if (!-[MUHoursSummaryViewModel isServiceHours](self->_viewModel, "isServiceHours"))
    -[MUHoursSummaryView _handleAnimationStartForNormalHours](self, "_handleAnimationStartForNormalHours");
}

- (void)_handleAnimationStartForNormalHours
{
  -[NSLayoutConstraint setActive:](self->_hoursToOpenStateConstraint, "setActive:", !self->_expanded);
}

- (void)handleAnimation
{
  if (-[MUHoursSummaryViewModel isServiceHours](self->_viewModel, "isServiceHours"))
    -[MUHoursSummaryView _handleServiceHoursAnimation](self, "_handleServiceHoursAnimation");
  else
    -[MUHoursSummaryView _handleNormalHoursAnimation](self, "_handleNormalHoursAnimation");
}

- (void)_handleNormalHoursAnimation
{
  if (self->_expanded)
  {
    -[MULabelViewProtocol setAlpha:](self->_hoursLabel, "setAlpha:", 0.0);
    -[NSLayoutConstraint setActive:](self->_titleToOpenStateConstraint, "setActive:", 1);
  }
  else
  {
    -[NSLayoutConstraint setActive:](self->_titleToOpenStateConstraint, "setActive:", 0);
    -[MULabelViewProtocol setAlpha:](self->_hoursLabel, "setAlpha:", 1.0);
  }
}

- (void)_handleServiceHoursAnimation
{
  _BOOL4 expanded;
  MUHoursSummaryViewModel *viewModel;
  void *v5;
  id v6;

  expanded = self->_expanded;
  viewModel = self->_viewModel;
  if (expanded)
  {
    -[MUHoursSummaryViewModel openStateText](viewModel, "openStateText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setText:](self->_hoursLabel, "setText:", v5);

    -[MUHoursSummaryViewModel openStateColor](self->_viewModel, "openStateColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setTextColor:](self->_hoursLabel, "setTextColor:");
  }
  else
  {
    -[MUHoursSummaryViewModel buildDefaultPlacecardHoursString](viewModel, "buildDefaultPlacecardHoursString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setAttributedText:](self->_hoursLabel, "setAttributedText:");
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MULabelViewProtocol *hoursLabel;
  MUHoursSummaryViewModel *viewModel;
  id v9;

  -[MUHoursSummaryViewModel titleText](self->_viewModel, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_titleLabel, "setText:", v3);

  -[UIImageView setHidden:](self->_expansionIndicator, "setHidden:", -[MUHoursSummaryViewModel hideChevron](self->_viewModel, "hideChevron"));
  if (self->_openStateLabel == self->_hoursLabel)
  {
    viewModel = self->_viewModel;
    if (!self->_expanded)
    {
      -[MUHoursSummaryViewModel buildDefaultPlacecardHoursString](viewModel, "buildDefaultPlacecardHoursString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[MULabelViewProtocol setAttributedText:](self->_hoursLabel, "setAttributedText:");
      goto LABEL_6;
    }
    -[MUHoursSummaryViewModel openStateText](viewModel, "openStateText");
    v6 = objc_claimAutoreleasedReturnValue();
    hoursLabel = self->_hoursLabel;
  }
  else
  {
    -[MUHoursSummaryViewModel buildDefaultPlacecardHoursString](self->_viewModel, "buildDefaultPlacecardHoursString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setAttributedText:](self->_hoursLabel, "setAttributedText:", v4);

    -[MUHoursSummaryViewModel openStateColor](self->_viewModel, "openStateColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setTextColor:](self->_openStateLabel, "setTextColor:", v5);

    -[MUHoursSummaryViewModel openStateText](self->_viewModel, "openStateText");
    v6 = objc_claimAutoreleasedReturnValue();
    hoursLabel = self->_openStateLabel;
  }
  v9 = (id)v6;
  -[MULabelViewProtocol setText:](hoursLabel, "setText:");
LABEL_6:

}

- (MUHoursSummaryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hoursToOpenStateConstraint, 0);
  objc_storeStrong((id *)&self->_titleToHoursConstraint, 0);
  objc_storeStrong((id *)&self->_titleToOpenStateConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_openStateLabel, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_expansionIndicator, 0);
  objc_storeStrong((id *)&self->_summaryStackLayoutGuide, 0);
}

@end
