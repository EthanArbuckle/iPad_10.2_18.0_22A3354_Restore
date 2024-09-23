@implementation SFAccountManagerPlatterWithDeclineButtonCell

- (SFAccountManagerPlatterWithDeclineButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 iconSize:(CGSize)a5 iconLeadingSpace:(unint64_t)a6 iconTrailingSpace:(unint64_t)a7
{
  double height;
  double width;
  SFAccountManagerPlatterWithDeclineButtonCell *v11;
  SFAccountManagerPlatterWithDeclineButtonCell *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *iconImageView;
  UILabel *v16;
  UILabel *titleLabel;
  void *v18;
  UILabel *v19;
  UILabel *subtitleLabel;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  UIStackView *labelStackView;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *imageViewHeightConstraint;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *imageViewWidthConstraint;
  uint64_t v32;
  UIActivityIndicatorView *activityIndicator;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SFAccountManagerPlatterWithDeclineButtonCell *v45;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  objc_super v78;
  _QWORD v79[14];
  _QWORD v80[4];

  height = a5.height;
  width = a5.width;
  v80[2] = *MEMORY[0x1E0C80C00];
  v78.receiver = self;
  v78.super_class = (Class)SFAccountManagerPlatterWithDeclineButtonCell;
  v11 = -[SFAccountManagerPlatterWithDeclineButtonCell initWithStyle:reuseIdentifier:](&v78, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v12 = v11;
  if (v11)
  {
    v11->_iconSize.width = width;
    v11->_iconSize.height = height;
    v11->_iconLeadingSpace = a6;
    v11->_iconTrailingSpace = a7;
    -[SFAccountManagerPlatterWithDeclineButtonCell contentView](v11, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v12->_iconImageView;
    v12->_iconImageView = v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v12->_iconImageView, "setContentMode:", 1);
    objc_msgSend(v13, "addSubview:", v12->_iconImageView);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v74 = a6;
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v16;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v71 = a7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_titleLabel, "setFont:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](v12->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v12->_titleLabel, "setNumberOfLines:", 0);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v12->_subtitleLabel;
    v12->_subtitleLabel = v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_subtitleLabel, "setTextColor:", v21);

    -[UILabel setAdjustsFontForContentSizeCategory:](v12->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v12->_subtitleLabel, "setNumberOfLines:", 0);
    v22 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v80[0] = v12->_titleLabel;
    v80[1] = v12->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithArrangedSubviews:", v23);
    labelStackView = v12->_labelStackView;
    v12->_labelStackView = (UIStackView *)v24;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v12->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v12->_labelStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v12->_labelStackView, "setAlignment:", 1);
    -[UIStackView setSpacing:](v12->_labelStackView, "setSpacing:", 2.0);
    objc_msgSend(v13, "addSubview:", v12->_labelStackView);
    -[SFAccountManagerPlatterWithDeclineButtonCell _configureDeclineButton](v12, "_configureDeclineButton");
    objc_msgSend(v13, "addSubview:", v12->_declineButton);
    -[UIImageView heightAnchor](v12->_iconImageView, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToConstant:", height);
    v27 = objc_claimAutoreleasedReturnValue();
    imageViewHeightConstraint = v12->_imageViewHeightConstraint;
    v12->_imageViewHeightConstraint = (NSLayoutConstraint *)v27;

    -[UIImageView widthAnchor](v12->_iconImageView, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", width);
    v30 = objc_claimAutoreleasedReturnValue();
    imageViewWidthConstraint = v12->_imageViewWidthConstraint;
    v12->_imageViewWidthConstraint = (NSLayoutConstraint *)v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v12->_activityIndicator;
    v12->_activityIndicator = (UIActivityIndicatorView *)v32;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v12->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", v12->_activityIndicator);
    -[SFAccountManagerPlatterWithDeclineButtonCell contentView](v12, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutMarginsGuide");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v12->_iconImageView, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, (double)v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v75;
    -[UIImageView topAnchor](v12->_iconImageView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v13;
    objc_msgSend(v13, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 11.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v68;
    v79[2] = v12->_imageViewHeightConstraint;
    v79[3] = v12->_imageViewWidthConstraint;
    -[UIStackView topAnchor](v12->_labelStackView, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v12->_iconImageView, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[4] = v64;
    objc_msgSend(v13, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v12->_labelStackView, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 11.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v79[5] = v61;
    -[UIStackView leadingAnchor](v12->_labelStackView, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v12->_iconImageView, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, (double)v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79[6] = v72;
    -[UIButton trailingAnchor](v12->_declineButton, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v79[7] = v55;
    -[UIButton topAnchor](v12->_declineButton, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](v12->_labelStackView, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v79[8] = v52;
    -[UIButton leadingAnchor](v12->_declineButton, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v12->_labelStackView, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v50, 1.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v79[9] = v49;
    -[UIButton widthAnchor](v12->_declineButton, "widthAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountManagerPlatterWithDeclineButtonCell _declineButtonSize](v12, "_declineButtonSize");
    objc_msgSend(v48, "constraintEqualToConstant:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v79[10] = v47;
    -[UIButton heightAnchor](v12->_declineButton, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountManagerPlatterWithDeclineButtonCell _declineButtonSize](v12, "_declineButtonSize");
    objc_msgSend(v35, "constraintEqualToConstant:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v79[11] = v37;
    -[UIActivityIndicatorView centerXAnchor](v12->_activityIndicator, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerXAnchor](v12->_declineButton, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v79[12] = v40;
    -[UIActivityIndicatorView centerYAnchor](v12->_activityIndicator, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v12->_declineButton, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v79[13] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v44);

    -[SFAccountManagerPlatterWithDeclineButtonCell setSeparatorInset:](v12, "setSeparatorInset:", 0.0, (double)(unint64_t)objc_msgSend((id)objc_opt_class(), "contentInset"), 0.0, 0.0);
    v45 = v12;

  }
  return v12;
}

+ (unint64_t)contentInset
{
  return 0;
}

- (void)setTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 shouldShowDeclineButton:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_titleLabel, "setText:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[UILabel setText:](self->_subtitleLabel, "setText:", v13);

  +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v14);
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v10);

  -[UIButton setHidden:](self->_declineButton, "setHidden:", !v6);
}

- (void)_configureDeclineButton
{
  UIButton *v3;
  UIButton *declineButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;

  v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  declineButton = self->_declineButton;
  self->_declineButton = v3;

  v5 = self->_declineButton;
  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v5, "setImage:forState:", v10, 0);

  if (UIAccessibilityButtonShapesEnabled())
  {
    v11 = self->_declineButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UIButton _setContinuousCornerRadius:](self->_declineButton, "_setContinuousCornerRadius:", 5.0);
  }
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_declineButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_declineButton, "addTarget:action:forControlEvents:", self, sel__declineButtonPressed_, 0x2000);
}

- (void)_declineButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "userDidPressDeclineButtonForPlatterTableViewCell:", self);

}

- (CGSize)_declineButtonSize
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = UIAccessibilityButtonShapesEnabled();
  v3 = 20.0;
  if (v2)
    v3 = 30.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setShowingActivityIndicator:(BOOL)a3
{
  _BOOL8 v3;
  UIActivityIndicatorView *activityIndicator;

  if (self->_showingActivityIndicator != a3)
  {
    v3 = a3;
    self->_showingActivityIndicator = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
      -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
    -[UIButton setHidden:](self->_declineButton, "setHidden:", v3);
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAccountManagerPlatterWithDeclineButtonCell;
  -[SFAccountManagerPlatterWithDeclineButtonCell prepareForReuse](&v3, sel_prepareForReuse);
  -[SFAccountManagerPlatterWithDeclineButtonCell setShowingActivityIndicator:](self, "setShowingActivityIndicator:", 0);
}

- (SFAccountManagerPlatterWithDeclineButtonCellDelegate)delegate
{
  return (SFAccountManagerPlatterWithDeclineButtonCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShowingActivityIndicator
{
  return self->_showingActivityIndicator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
