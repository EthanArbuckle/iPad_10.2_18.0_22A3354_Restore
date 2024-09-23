@implementation WDAccountDetailsSharingStatusCell

- (WDAccountDetailsSharingStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDAccountDetailsSharingStatusCell *v4;
  WDAccountDetailsSharingStatusCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDAccountDetailsSharingStatusCell;
  v4 = -[WDAccountDetailsSharingStatusCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDAccountDetailsSharingStatusCell _setupUI](v4, "_setupUI");
    -[WDAccountDetailsSharingStatusCell _setupConstraints](v5, "_setupConstraints");
    -[WDAccountDetailsSharingStatusCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  }
  return v5;
}

- (void)_setupUI
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *subtitleLabel;
  void *v10;
  void *v11;
  UIActivityIndicatorView *v12;
  UIActivityIndicatorView *statusIndicator;
  id v14;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_titleLabel);

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v10);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_subtitleLabel);

  v12 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  statusIndicator = self->_statusIndicator;
  self->_statusIndicator = v12;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_statusIndicator, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView startAnimating](self->_statusIndicator, "startAnimating");
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_statusIndicator);

}

- (void)_setupConstraints
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
  NSArray *v12;
  NSArray *withSpinnerConstraint;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *noSpinnerConstraint;
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
  _QWORD v51[6];
  void *v52;
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  -[UIActivityIndicatorView leadingAnchor](self->_statusIndicator, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v5;
  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView trailingAnchor](self->_statusIndicator, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 6.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v8;
  -[UIActivityIndicatorView centerYAnchor](self->_statusIndicator, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_subtitleLabel, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  withSpinnerConstraint = self->_withSpinnerConstraint;
  self->_withSpinnerConstraint = v12;

  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  noSpinnerConstraint = self->_noSpinnerConstraint;
  self->_noSpinnerConstraint = v19;

  v38 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v46, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v45;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v40;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v34;
  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v31;
  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v24;
  -[WDAccountDetailsSharingStatusCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v27, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v29);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_withSpinnerConstraint);
}

- (void)startSpinner
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self->_statusIndicator);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WDAccountDetailsSharingStatusCell_startSpinner__block_invoke;
  block[3] = &unk_1E74D2578;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __49__WDAccountDetailsSharingStatusCell_startSpinner__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "startAnimating");

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
  return objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));
}

- (void)stopSpinner
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self->_statusIndicator);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WDAccountDetailsSharingStatusCell_stopSpinner__block_invoke;
  block[3] = &unk_1E74D2578;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __48__WDAccountDetailsSharingStatusCell_stopSpinner__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stopAnimating");

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));
  return objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
}

+ (id)reuseIdentifier
{
  return CFSTR("WDAccountDetailsSharingStatusCellIdentifier");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIActivityIndicatorView)statusIndicator
{
  return self->_statusIndicator;
}

- (void)setStatusIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_noSpinnerConstraint, 0);
  objc_storeStrong((id *)&self->_withSpinnerConstraint, 0);
}

@end
