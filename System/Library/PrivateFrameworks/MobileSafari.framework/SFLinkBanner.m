@implementation SFLinkBanner

+ (double)iconHeight
{
  double result;

  +[SFClipLink iconHeight](SFClipLink, "iconHeight");
  return result;
}

- (SFLinkBanner)init
{
  SFLinkBanner *v2;
  SFThemeColorEffectView *v3;
  void *v4;
  uint64_t v5;
  SFThemeColorEffectView *backdrop;
  void *v7;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *backdropTopConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIImageView *v20;
  UIImageView *icon;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *iconLeadingConstraintToSuperview;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  UILabel *titleLabel;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSLayoutConstraint *titleLeadingConstraint;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *titleTopConstraint;
  void *v48;
  void *v49;
  double v50;
  UILabel *v51;
  UILabel *messageLabel;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSLayoutConstraint *messageTopConstraint;
  void *v58;
  void *v59;
  uint64_t v60;
  NSLayoutConstraint *messageBottomConstraint;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  uint64_t v68;
  _SFDimmingButton *openButton;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  SFLinkBanner *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  objc_super v86;
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[4];
  _QWORD v90[6];

  v90[4] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)SFLinkBanner;
  v2 = -[SFLinkBanner init](&v86, sel_init);
  if (v2)
  {
    v3 = [SFThemeColorEffectView alloc];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SFThemeColorEffectView initWithEffect:](v3, "initWithEffect:", v4);
    backdrop = v2->_backdrop;
    v2->_backdrop = (SFThemeColorEffectView *)v5;

    -[SFThemeColorEffectView setTranslatesAutoresizingMaskIntoConstraints:](v2->_backdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFLinkBanner addSubview:](v2, "addSubview:", v2->_backdrop);
    -[SFLinkBanner sendSubviewToBack:](v2, "sendSubviewToBack:", v2->_backdrop);
    -[SFLinkBanner topAnchor](v2, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFThemeColorEffectView topAnchor](v2->_backdrop, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    backdropTopConstraint = v2->_backdropTopConstraint;
    v2->_backdropTopConstraint = (NSLayoutConstraint *)v9;

    v90[0] = v2->_backdropTopConstraint;
    -[SFLinkBanner bottomAnchor](v2, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFThemeColorEffectView bottomAnchor](v2->_backdrop, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v12;
    -[SFLinkBanner leadingAnchor](v2, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFThemeColorEffectView leadingAnchor](v2->_backdrop, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v15;
    -[SFLinkBanner trailingAnchor](v2, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFThemeColorEffectView trailingAnchor](v2->_backdrop, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v90[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner addConstraints:](v2, "addConstraints:", v19);

    v20 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    icon = v2->_icon;
    v2->_icon = v20;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_icon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v2->_icon, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setContentMode:](v2->_icon, "setContentMode:", 1);
    -[SFLinkBanner addSubview:](v2, "addSubview:", v2->_icon);
    -[SFLinkBanner layoutMarginsGuide](v2, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView leadingAnchor](v2->_icon, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v85);
    v24 = objc_claimAutoreleasedReturnValue();
    iconLeadingConstraintToSuperview = v2->_iconLeadingConstraintToSuperview;
    v2->_iconLeadingConstraintToSuperview = (NSLayoutConstraint *)v24;

    v82 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView heightAnchor](v2->_icon, "heightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "iconHeight");
    objc_msgSend(v83, "constraintEqualToConstant:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v26;
    -[UIImageView widthAnchor](v2->_icon, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v2->_icon, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v29;
    v89[2] = v2->_iconLeadingConstraintToSuperview;
    -[UIImageView centerYAnchor](v2->_icon, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner centerYAnchor](v2, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "activateConstraints:", v33);

    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v34;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v2->_titleLabel, "setNumberOfLines:", 3);
    -[SFLinkBanner _titleLabelFont](v2, "_titleLabelFont");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_titleLabel, "setFont:", v36);

    -[SFLinkBanner addSubview:](v2, "addSubview:", v2->_titleLabel);
    -[UILabel leadingAnchor](v2->_titleLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v2->_icon, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 8.0);
    v39 = objc_claimAutoreleasedReturnValue();
    titleLeadingConstraint = v2->_titleLeadingConstraint;
    v2->_titleLeadingConstraint = (NSLayoutConstraint *)v39;

    -[UILabel leadingAnchor](v2->_titleLabel, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v85);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v43) = 1144733696;
    objc_msgSend(v42, "setPriority:", v43);
    -[UILabel topAnchor](v2->_titleLabel, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner topAnchor](v2, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 9.0);
    v46 = objc_claimAutoreleasedReturnValue();
    titleTopConstraint = v2->_titleTopConstraint;
    v2->_titleTopConstraint = (NSLayoutConstraint *)v46;

    v48 = (void *)MEMORY[0x1E0CB3718];
    v88[0] = v2->_titleTopConstraint;
    v88[1] = v2->_titleLeadingConstraint;
    v88[2] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v49);

    LODWORD(v50) = 1144733696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v50);
    v51 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    messageLabel = v2->_messageLabel;
    v2->_messageLabel = v51;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v2->_messageLabel, "setNumberOfLines:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_messageLabel, "setTextColor:", v53);

    -[SFLinkBanner addSubview:](v2, "addSubview:", v2->_messageLabel);
    -[UILabel topAnchor](v2->_messageLabel, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v2->_titleLabel, "lastBaselineAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, 2.0);
    v56 = objc_claimAutoreleasedReturnValue();
    messageTopConstraint = v2->_messageTopConstraint;
    v2->_messageTopConstraint = (NSLayoutConstraint *)v56;

    -[SFLinkBanner bottomAnchor](v2, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v2->_messageLabel, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 9.0);
    v60 = objc_claimAutoreleasedReturnValue();
    messageBottomConstraint = v2->_messageBottomConstraint;
    v2->_messageBottomConstraint = (NSLayoutConstraint *)v60;

    v62 = (void *)MEMORY[0x1E0CB3718];
    v87[0] = v2->_messageTopConstraint;
    -[UILabel leadingAnchor](v2->_messageLabel, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v2->_titleLabel, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v65;
    v87[2] = v2->_messageBottomConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v66);

    LODWORD(v67) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_messageLabel, "setContentCompressionResistancePriority:forAxis:", 0, v67);
    +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
    v68 = objc_claimAutoreleasedReturnValue();
    openButton = v2->_openButton;
    v2->_openButton = (_SFDimmingButton *)v68;

    -[_SFDimmingButton setTapTargetSideMargin:](v2->_openButton, "setTapTargetSideMargin:", &unk_1E22455D8);
    -[SFLinkBanner preferredButtonTintColor](v2, "preferredButtonTintColor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTintColor:](v2->_openButton, "setTintColor:", v70);

    -[SFLinkBanner preferredButtonBackgroundColor](v2, "preferredButtonBackgroundColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setDimmableBackgroundColor:](v2->_openButton, "setDimmableBackgroundColor:", v71);

    -[_SFDimmingButton setContentEdgeInsets:](v2->_openButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], 1024, *MEMORY[0x1E0DC48D0]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton titleLabel](v2->_openButton, "titleLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFont:", v72);

    -[_SFDimmingButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_openButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFDimmingButton _setCornerRadius:](v2->_openButton, "_setCornerRadius:", 13.5);
    LODWORD(v74) = 1144733696;
    -[_SFDimmingButton setContentHuggingPriority:forAxis:](v2->_openButton, "setContentHuggingPriority:forAxis:", 0, v74);
    LODWORD(v75) = 1144733696;
    -[_SFDimmingButton setContentCompressionResistancePriority:forAxis:](v2->_openButton, "setContentCompressionResistancePriority:forAxis:", 0, v75);
    -[_SFDimmingButton addTarget:action:forControlEvents:](v2->_openButton, "addTarget:action:forControlEvents:", v2, sel__open, 64);
    -[SFLinkBanner addSubview:](v2, "addSubview:", v2->_openButton);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_openButton, 6, 0, v2, 18, 1.0, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner addConstraint:](v2, "addConstraint:", v76);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_openButton, 5, 1, v2->_titleLabel, 6, 1.0, 12.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner addConstraint:](v2, "addConstraint:", v77);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_openButton, 10, 0, v2, 10, 1.0, 0.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner addConstraint:](v2, "addConstraint:", v78);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_messageLabel, 6, 0, v2->_openButton, 5, 1.0, -12.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner addConstraint:](v2, "addConstraint:", v79);

    v80 = v2;
  }

  return v2;
}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_messageLabelFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], 0, *MEMORY[0x1E0DC48D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)messageLabelText
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setMessageLabelText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1288];
  v5 = a3;
  objc_msgSend(v4, "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setLineSpacing:", 1.5);
  objc_msgSend(v7, "setLineBreakMode:", 4);
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12[0] = *MEMORY[0x1E0DC1138];
  -[SFLinkBanner _messageLabelFont](self, "_messageLabelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = *MEMORY[0x1E0DC1178];
  v13[0] = v9;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v5, v10);

  -[UILabel setAttributedText:](self->_messageLabel, "setAttributedText:", v11);
}

- (void)setOpenButtonTitle:(id)a3
{
  NSString *v4;
  NSString *openButtonTitle;
  id v6;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  openButtonTitle = self->_openButtonTitle;
  self->_openButtonTitle = v4;

  -[SFLinkBanner openButton](self, "openButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", self->_openButtonTitle, 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFLinkBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_open
{
  void (**openActionHandler)(id, SFLinkBanner *);

  openActionHandler = (void (**)(id, SFLinkBanner *))self->_openActionHandler;
  if (openActionHandler)
    openActionHandler[2](openActionHandler, self);
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v3;

  if (a3.left == 0.0)
    a3.left = 20.0;
  if (a3.right == 0.0)
    a3.right = 20.0;
  v3.receiver = self;
  v3.super_class = (Class)SFLinkBanner;
  -[SFLinkBanner setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  objc_super v3;

  if (a3.leading == 0.0)
    a3.leading = 20.0;
  if (a3.trailing == 0.0)
    a3.trailing = 20.0;
  v3.receiver = self;
  v3.super_class = (Class)SFLinkBanner;
  -[SFLinkBanner setDirectionalLayoutMargins:](&v3, sel_setDirectionalLayoutMargins_, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (void)layoutSubviews
{
  float Height;
  int64_t v4;
  void *v5;
  double v6;
  float v7;
  int64_t v8;
  void *v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.receiver = self;
  v14.super_class = (Class)SFLinkBanner;
  -[SFLinkBanner layoutSubviews](&v14, sel_layoutSubviews);
  -[_SFDimmingButton bounds](self->_openButton, "bounds");
  -[_SFDimmingButton _setCornerRadius:](self->_openButton, "_setCornerRadius:", CGRectGetHeight(v15) * 0.482142857);
  -[UILabel bounds](self->_titleLabel, "bounds");
  Height = CGRectGetHeight(v16);
  v4 = llroundf(Height);
  -[UILabel font](self->_titleLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  *(float *)&v6 = v6;
  if (v4 <= (uint64_t)llroundf(*(float *)&v6))
  {
    -[UILabel bounds](self->_messageLabel, "bounds");
    v7 = CGRectGetHeight(v17);
    v8 = llroundf(v7);
    -[UILabel font](self->_messageLabel, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineHeight");
    *(float *)&v10 = v10;
    v11 = llroundf(*(float *)&v10);

    if (v8 <= v11)
    {
      v12 = 9.0;
      v13 = 2.0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v12 = 8.0;
  v13 = 4.0;
LABEL_6:
  -[NSLayoutConstraint setConstant:](self->_titleTopConstraint, "setConstant:", v12);
  -[NSLayoutConstraint setConstant:](self->_messageBottomConstraint, "setConstant:", v12);
  -[NSLayoutConstraint setConstant:](self->_messageTopConstraint, "setConstant:", v13);
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SFLinkBanner _titleLabelFont](self, "_titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], 1024, *MEMORY[0x1E0DC48D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton titleLabel](self->_openButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[UILabel attributedText](self->_messageLabel, "attributedText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFLinkBanner setMessageLabelText:](self, "setMessageLabelText:", v6);

}

- (void)invalidateBannerLayout
{
  -[UILabel invalidateIntrinsicContentSize](self->_titleLabel, "invalidateIntrinsicContentSize");
  -[UILabel invalidateIntrinsicContentSize](self->_messageLabel, "invalidateIntrinsicContentSize");
}

- (void)themeDidChange
{
  void *v3;
  _SFDimmingButton **p_openButton;
  void *v5;
  void *v6;
  id v7;

  -[SFPinnableBanner theme](self, "theme");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFThemeColorEffectView setTheme:](self->_backdrop, "setTheme:", v7);
  objc_msgSend(v7, "overrideTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    p_openButton = &self->_openButton;
    -[_SFDimmingButton setDimmableBackgroundColor:](self->_openButton, "setDimmableBackgroundColor:", v3);
    objc_msgSend(v7, "themeColor");
  }
  else
  {
    -[SFLinkBanner preferredButtonBackgroundColor](self, "preferredButtonBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    p_openButton = &self->_openButton;
    -[_SFDimmingButton setDimmableBackgroundColor:](self->_openButton, "setDimmableBackgroundColor:", v5);

    -[SFLinkBanner preferredButtonTintColor](self, "preferredButtonTintColor");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTintColor:](*p_openButton, "setTintColor:", v6);

  -[_SFDimmingButton setTintAdjustmentMode:](*p_openButton, "setTintAdjustmentMode:", v3 != 0);
}

- (void)setShouldHideIcon:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_shouldHideIcon != a3)
  {
    v3 = a3;
    self->_shouldHideIcon = a3;
    -[UIImageView setHidden:](self->_icon, "setHidden:");
    -[NSLayoutConstraint setActive:](self->_titleLeadingConstraint, "setActive:", !v3);
  }
}

- (UIColor)preferredButtonBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

- (UIColor)preferredButtonTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)setDismissButtonHandler:(id)a3
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id dismissButtonHandler;

  v4 = a3 != 0;
  v5 = a3;
  -[SFLinkBanner _setShowsDismissButton:](self, "_setShowsDismissButton:", v4);
  v6 = _Block_copy(v5);

  dismissButtonHandler = self->_dismissButtonHandler;
  self->_dismissButtonHandler = v6;

}

- (void)_setShowsDismissButton:(BOOL)a3
{
  UIButton *dismissButton;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *iconLeadingConstraintToSuperview;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  dismissButton = self->_dismissButton;
  if ((((dismissButton == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "systemButtonWithImage:target:action:", v29, self, sel__dismiss);
      v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v6 = self->_dismissButton;
      self->_dismissButton = v5;

      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_dismissButton, "setTintColor:", v7);

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFLinkBanner addSubview:](self, "addSubview:", self->_dismissButton);
      v22 = (void *)MEMORY[0x1E0CB3718];
      -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToConstant:", 28.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v27;
      -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToConstant:", 28.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v25;
      -[UIButton leadingAnchor](self->_dismissButton, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFLinkBanner layoutMarginsGuide](self, "layoutMarginsGuide");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v9;
      -[UIImageView leadingAnchor](self->_icon, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton trailingAnchor](self->_dismissButton, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v11, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v12;
      -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFLinkBanner centerYAnchor](self, "centerYAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[4] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activateConstraints:", v16);

      v17 = (void *)MEMORY[0x1E0CB3718];
      iconLeadingConstraintToSuperview = self->_iconLeadingConstraintToSuperview;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &iconLeadingConstraintToSuperview, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deactivateConstraints:", v18);

      v19 = (void *)v30;
    }
    else
    {
      -[UIButton removeFromSuperview](dismissButton, "removeFromSuperview");
      v20 = self->_dismissButton;
      self->_dismissButton = 0;

      v21 = (void *)MEMORY[0x1E0CB3718];
      v31 = self->_iconLeadingConstraintToSuperview;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v19);
    }

  }
}

- (void)_dismiss
{
  void (**dismissButtonHandler)(id, SFLinkBanner *);

  dismissButtonHandler = (void (**)(id, SFLinkBanner *))self->_dismissButtonHandler;
  if (dismissButtonHandler)
    dismissButtonHandler[2](dismissButtonHandler, self);
}

- (void)setBackdropTopExtension:(double)a3
{
  self->_backdropTopExtension = a3;
  -[NSLayoutConstraint setConstant:](self->_backdropTopConstraint, "setConstant:");
}

- (UIImageView)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (_SFDimmingButton)openButton
{
  return self->_openButton;
}

- (void)setOpenButton:(id)a3
{
  objc_storeStrong((id *)&self->_openButton, a3);
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (id)openActionHandler
{
  return self->_openActionHandler;
}

- (void)setOpenActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)shouldHideIcon
{
  return self->_shouldHideIcon;
}

- (id)dismissButtonHandler
{
  return self->_dismissButtonHandler;
}

- (double)backdropTopExtension
{
  return self->_backdropTopExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissButtonHandler, 0);
  objc_storeStrong(&self->_openActionHandler, 0);
  objc_storeStrong((id *)&self->_openButtonTitle, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_backdropTopConstraint, 0);
  objc_storeStrong((id *)&self->_iconLeadingConstraintToSuperview, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageBottomConstraint, 0);
  objc_storeStrong((id *)&self->_messageTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end
