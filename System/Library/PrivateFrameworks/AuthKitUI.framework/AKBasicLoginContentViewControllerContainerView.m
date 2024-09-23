@implementation AKBasicLoginContentViewControllerContainerView

- (AKBasicLoginContentViewControllerContainerView)initWithFrame:(CGRect)a3
{
  AKBasicLoginContentViewControllerContainerView *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AKBasicLoginContentViewControllerContainerView;
  v3 = -[AKBasicLoginContentViewControllerContainerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB568], 0, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v8);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[AKBasicLoginContentViewControllerContainerView titleText](v3, "titleText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v9);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v10) = 1055286886;
    -[UILabel _setHyphenationFactor:](v3->_titleLabel, "_setHyphenationFactor:", v10);
    -[UILabel setPreferredMaxLayoutWidth:](v3->_titleLabel, "setPreferredMaxLayoutWidth:", 238.0);
    -[AKBasicLoginContentViewControllerContainerView _configureMessageLabel](v3, "_configureMessageLabel");
    -[AKBasicLoginContentViewControllerContainerView addSubview:](v3, "addSubview:", v3->_titleLabel);

  }
  return v3;
}

- (id)viewForFirstBaselineLayout
{
  return self->_titleLabel;
}

- (id)viewForLastBaselineLayout
{
  UILabel *messageLabel;

  messageLabel = self->_messageLabel;
  if (!messageLabel)
    messageLabel = self->_titleLabel;
  return messageLabel;
}

- (void)updateConstraints
{
  NSString *messageText;
  _BOOL4 v4;
  void *v5;
  UILabel *titleLabel;
  unint64_t v7;
  void *v8;
  void *v9;
  UIImageView *bannerView;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  UILabel *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  double v23;
  void *v24;
  UILabel *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  NSArray *v45;
  NSArray *activeConstraints;
  void *v47;
  void *v48;
  _BOOL4 v49;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_activeConstraints);
  messageText = self->_messageText;
  if (messageText)
    v4 = -[NSString length](messageText, "length") != 0;
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  v7 = 0x1EF4FE000uLL;
  v49 = v4;
  if (v4)
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel,_messageLabel"), titleLabel, self->_messageLabel, 0);
  else
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), titleLabel, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB538]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  bannerView = self->_bannerView;
  v11 = (void *)MEMORY[0x1E0CB3718];
  v47 = v8;
  if (bannerView)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", bannerView, 3, 0, self, 3, 1.0, 24.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3718];
    v14 = self->_bannerView;
    v15 = self->_titleLabel;
    objc_msgSend(v9, "scaledValueForValue:", -36.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 11, 0, v15, 12, 1.0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_bannerView, 9, 0, self, 9, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v19;
    v52[1] = v12;
    v52[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v20);

    v7 = 0x1EF4FE000;
  }
  else
  {
    v21 = self->_titleLabel;
    objc_msgSend(v8, "scaledValueForValue:", 36.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 12, 0, self, 3, 1.0, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v12);
  }

  v24 = (void *)MEMORY[0x1E0CB3718];
  v25 = self->_titleLabel;
  v26 = v49;
  if (v49)
  {
    v27 = *(int *)(v7 + 1212);
    v28 = *(uint64_t *)((char *)&self->super.super.super.isa + v27);
    objc_msgSend(v47, "scaledValueForValue:", -20.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 11, 0, v28, 12, 1.0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0CB3718];
    v33 = *(uint64_t *)((char *)&self->super.super.super.isa + v27);
    objc_msgSend(v47, "scaledValueForValue:", -24.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 11, 0, self, 4, 1.0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v47;
    v26 = v49;
    v51[0] = v31;
    v51[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v38);

  }
  else
  {
    v37 = v47;
    objc_msgSend(v47, "scaledValueForValue:", -24.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 11, 0, self, 4, 1.0, v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v31);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(H_MARGIN)-[_titleLabel]-(H_MARGIN)-|"), 0, &unk_1E769ABF0, v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v41);
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(H_MARGIN)-[_messageLabel]-(H_MARGIN)-|"), 0, &unk_1E769ABF0, v48);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v42);

  }
  objc_msgSend(v5, "addObjectsFromArray:", v41);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
  LODWORD(v43) = 1144750080;
  -[AKBasicLoginContentViewControllerContainerView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v43);
  LODWORD(v44) = 1144750080;
  -[AKBasicLoginContentViewControllerContainerView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v44);
  v45 = (NSArray *)objc_msgSend(v5, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v45;

  v50.receiver = self;
  v50.super_class = (Class)AKBasicLoginContentViewControllerContainerView;
  -[AKBasicLoginContentViewControllerContainerView updateConstraints](&v50, sel_updateConstraints);

}

- (void)_configureBannerImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *bannerView;
  double v11;
  double v12;
  UIImageView *v13;
  UIImageView *v14;

  if (self->_bannerImage)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    v4 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_defaultTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AppleID"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v8);
    bannerView = self->_bannerView;
    self->_bannerView = v9;

    -[UIImageView setContentMode:](self->_bannerView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1144750080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_bannerView, "setContentHuggingPriority:forAxis:", 1, v11);
    LODWORD(v12) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_bannerView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[AKBasicLoginContentViewControllerContainerView addSubview:](self, "addSubview:", self->_bannerView);
  }
  else
  {
    v13 = self->_bannerView;
    if (v13)
    {
      -[UIImageView removeFromSuperview](v13, "removeFromSuperview");
      v14 = self->_bannerView;
    }
    else
    {
      v14 = 0;
    }
    self->_bannerView = 0;

  }
  -[AKBasicLoginContentViewControllerContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_configureMessageLabel
{
  NSString *messageText;
  id v4;
  UILabel *v5;
  UILabel *messageLabel;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  UILabel *v11;

  messageText = self->_messageText;
  if (messageText && -[NSString length](messageText, "length"))
  {
    if (!self->_messageLabel)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEA700]);
      v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      messageLabel = self->_messageLabel;
      self->_messageLabel = v5;

      objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0x8000, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_messageLabel, "setFont:", v8);

      -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
      -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v9) = 1055286886;
      -[UILabel _setHyphenationFactor:](self->_messageLabel, "_setHyphenationFactor:", v9);
      -[UILabel setPreferredMaxLayoutWidth:](self->_messageLabel, "setPreferredMaxLayoutWidth:", 238.0);
      -[AKBasicLoginContentViewControllerContainerView addSubview:](self, "addSubview:", self->_messageLabel);

    }
    -[AKBasicLoginContentViewControllerContainerView messageText](self, "messageText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_messageLabel, "setText:", v10);
  }
  else
  {
    v11 = self->_messageLabel;
    if (v11)
    {
      -[UILabel removeFromSuperview](v11, "removeFromSuperview");
      v10 = self->_messageLabel;
    }
    else
    {
      v10 = 0;
    }
    self->_messageLabel = 0;
  }

  -[AKBasicLoginContentViewControllerContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  titleText = self->_titleText;
  self->_titleText = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  -[AKBasicLoginContentViewControllerContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSString)titleText
{
  return (NSString *)(id)-[NSString copy](self->_titleText, "copy");
}

- (void)setMessageText:(id)a3
{
  NSString *v4;
  NSString *messageText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  messageText = self->_messageText;
  self->_messageText = v4;

  -[AKBasicLoginContentViewControllerContainerView _configureMessageLabel](self, "_configureMessageLabel");
}

- (NSString)messageText
{
  return (NSString *)(id)-[NSString copy](self->_messageText, "copy");
}

- (void)setBannerImage:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImage, a3);
  -[AKBasicLoginContentViewControllerContainerView _configureBannerImage](self, "_configureBannerImage");
}

- (UIImage)bannerImage
{
  return self->_bannerImage;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UIImageView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_bannerImage, 0);
}

@end
