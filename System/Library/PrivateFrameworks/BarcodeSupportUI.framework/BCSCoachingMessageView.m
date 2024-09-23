@implementation BCSCoachingMessageView

- (BCSCoachingMessageView)init
{
  BCSCoachingMessageView *v2;
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  UIFontDescriptor *v7;
  void *v8;
  UIFontDescriptor *fontDescriptor;
  UILabel *coachingMessageLabel;
  UILabel *v11;
  id v12;
  void *v13;
  UIVisualEffectView *v14;
  void *v15;
  UIVisualEffectView *coachingMessageContainerView;
  UIVisualEffectView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *coachingLabelTopAnchorConstraint;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *coachingLabelBottomAnchorConstraint;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BCSCoachingMessageView *v34;
  void *v36;
  void *v37;
  UILabel *v38;
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
  UIFontDescriptor *v49;
  objc_super v50;
  _QWORD v51[10];

  v51[8] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)BCSCoachingMessageView;
  v2 = -[BCSCoachingMessageView init](&v50, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    _BCSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3, "setText:", v4);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3, "setTextColor:", v5);

    -[UILabel setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v3, "setMinimumScaleFactor:", 0.1);
    -[UILabel setLineBreakMode:](v3, "setLineBreakMode:", 2);
    -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3, "setNumberOfLines:", 1);
    -[UILabel setBaselineAdjustment:](v3, "setBaselineAdjustment:", 1);
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE220]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
    v7 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3, "setFont:", v8);

    fontDescriptor = v2->_fontDescriptor;
    v2->_fontDescriptor = v7;
    v49 = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    coachingMessageLabel = v2->_coachingMessageLabel;
    v2->_coachingMessageLabel = v3;
    v11 = v3;

    v12 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIVisualEffectView *)objc_msgSend(v12, "initWithEffect:", v13);

    -[UIVisualEffectView _setContinuousCornerRadius:](v14, "_setContinuousCornerRadius:", 14.0);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v14, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v11);

    coachingMessageContainerView = v2->_coachingMessageContainerView;
    v2->_coachingMessageContainerView = v14;
    v17 = v14;

    -[BCSCoachingMessageView addSubview:](v2, "addSubview:", v17);
    -[UILabel topAnchor](v11, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v17, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
    v20 = objc_claimAutoreleasedReturnValue();
    coachingLabelTopAnchorConstraint = v2->_coachingLabelTopAnchorConstraint;
    v2->_coachingLabelTopAnchorConstraint = (NSLayoutConstraint *)v20;

    -[UILabel bottomAnchor](v11, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](v17, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
    v24 = objc_claimAutoreleasedReturnValue();
    coachingLabelBottomAnchorConstraint = v2->_coachingLabelBottomAnchorConstraint;
    v2->_coachingLabelBottomAnchorConstraint = (NSLayoutConstraint *)v24;

    v40 = (void *)MEMORY[0x24BDD1628];
    v38 = v11;
    -[UILabel leadingAnchor](v11, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v17, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 15.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v46;
    -[UILabel trailingAnchor](v11, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v17, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -15.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v43;
    v51[2] = v2->_coachingLabelTopAnchorConstraint;
    v51[3] = v2->_coachingLabelBottomAnchorConstraint;
    -[UIVisualEffectView leadingAnchor](v17, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSCoachingMessageView leadingAnchor](v2, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v39;
    -[UIVisualEffectView trailingAnchor](v17, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSCoachingMessageView trailingAnchor](v2, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v26;
    -[UIVisualEffectView topAnchor](v17, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSCoachingMessageView topAnchor](v2, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[6] = v29;
    -[UIVisualEffectView bottomAnchor](v17, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSCoachingMessageView bottomAnchor](v2, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[7] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v33);

    v34 = v2;
  }

  return v2;
}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_coachingMessageLabel, "setText:", a3);
}

- (NSString)message
{
  return -[UILabel text](self->_coachingMessageLabel, "text");
}

- (void)setHidden:(BOOL)a3
{
  if (((!self->_contentHidden ^ a3) & 1) == 0)
  {
    self->_contentHidden = a3;
    -[BCSCoachingMessageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setObscuredByOverlay:(BOOL)a3
{
  if (((!self->_obscuredByOverlay ^ a3) & 1) == 0)
  {
    self->_obscuredByOverlay = a3;
    -[BCSCoachingMessageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIFontDescriptor *v9;
  UIFontDescriptor *fontDescriptor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCSCoachingMessageView;
  v4 = a3;
  -[BCSCoachingMessageView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[BCSCoachingMessageView traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE220]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
    v9 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();
    fontDescriptor = self->_fontDescriptor;
    self->_fontDescriptor = v9;

    -[BCSCoachingMessageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  objc_super v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BCSCoachingMessageView;
  -[BCSCoachingMessageView layoutSubviews](&v24, sel_layoutSubviews);
  -[BCSCoachingMessageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v4, "interfaceOrientation") - 3) > 1)
  {
    v6 = 0;
  }
  else
  {
    -[BCSCoachingMessageView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom") == 0;

  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_referenceBounds");
  v9 = v8;

  v10 = 4.0;
  if (v9 > 320.0)
    v10 = 8.0;
  v11 = 20.0;
  if (v9 <= 320.0)
    v11 = 18.0;
  if (v6)
    v12 = 8.0;
  else
    v12 = 14.0;
  v13 = 15.0;
  if (v6)
  {
    v13 = v10;
    v14 = v11;
  }
  else
  {
    v14 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](self->_coachingLabelTopAnchorConstraint, "setConstant:", v13);
  -[NSLayoutConstraint constant](self->_coachingLabelTopAnchorConstraint, "constant");
  -[NSLayoutConstraint setConstant:](self->_coachingLabelBottomAnchorConstraint, "setConstant:", -v15);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_coachingMessageContainerView, "_setContinuousCornerRadius:", v12);
  -[UIFontDescriptor fontAttributes](self->_fontDescriptor, "fontAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BEBB560]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  if (v19 >= v14)
    v20 = v14;
  else
    v20 = v19;
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", self->_fontDescriptor, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_coachingMessageLabel, "setFont:", v21);

  if (self->_contentHidden)
    v22 = 1;
  else
    v22 = self->_obscuredByOverlay && v6;
  v23.receiver = self;
  v23.super_class = (Class)BCSCoachingMessageView;
  -[BCSCoachingMessageView setHidden:](&v23, sel_setHidden_, v22);
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setContentHidden:(BOOL)a3
{
  self->_contentHidden = a3;
}

- (BOOL)isObscuredByOverlay
{
  return self->_obscuredByOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingLabelBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_coachingLabelTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_coachingMessageLabel, 0);
  objc_storeStrong((id *)&self->_coachingMessageContainerView, 0);
}

@end
