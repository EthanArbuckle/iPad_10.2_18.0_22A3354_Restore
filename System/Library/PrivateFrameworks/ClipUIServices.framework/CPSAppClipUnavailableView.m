@implementation CPSAppClipUnavailableView

- (CPSAppClipUnavailableView)initWithFrame:(CGRect)a3
{
  CPSAppClipUnavailableView *v3;
  CPSAppClipUnavailableView *v4;
  CPSAppClipUnavailableView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAppClipUnavailableView;
  v3 = -[CPSAppClipUnavailableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPSAppClipUnavailableView _setUpViews](v3, "_setUpViews");
    v5 = v4;
  }

  return v4;
}

- (void)_setUpViews
{
  CPSVibrantLabel *v3;
  CPSVibrantLabel *v4;
  CPSVibrantLabel *reasonLabel;
  void *v6;
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = [CPSVibrantLabel alloc];
  v4 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v3, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB538], 0, 1);
  reasonLabel = self->_reasonLabel;
  self->_reasonLabel = v4;

  -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_reasonLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSVibrantLabel setNumberOfLines:](self->_reasonLabel, "setNumberOfLines:", 3);
  -[CPSVibrantLabel setAdjustsFontForContentSizeCategory:](self->_reasonLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[CPSVibrantLabel setTextAlignment:](self->_reasonLabel, "setTextAlignment:", 1);
  -[CPSVibrantLabel setLineBreakMode:](self->_reasonLabel, "setLineBreakMode:", 5);
  -[CPSVibrantLabel setAdjustsFontSizeToFitWidth:](self->_reasonLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[CPSAppClipUnavailableView addSubview:](self, "addSubview:", self->_reasonLabel);
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[CPSVibrantLabel centerXAnchor](self->_reasonLabel, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppClipUnavailableView centerXAnchor](self, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  -[CPSVibrantLabel centerYAnchor](self->_reasonLabel, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppClipUnavailableView centerYAnchor](self, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  -[CPSAppClipUnavailableView widthAnchor](self, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel widthAnchor](self->_reasonLabel, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:multiplier:constant:", v10, 1.0, 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  -[CPSAppClipUnavailableView heightAnchor](self, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel heightAnchor](self->_reasonLabel, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

}

- (NSString)reasonString
{
  return -[CPSVibrantLabel text](self->_reasonLabel, "text");
}

- (void)setReasonString:(id)a3
{
  -[CPSVibrantLabel setText:](self->_reasonLabel, "setText:", a3);
}

- (void)enableURLFallbackWithAction:(id)a3
{
  CPSButton *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CPSButton *v8;
  CPSButton *fallbackOpenButton;
  void *v10;
  void *v11;
  double v12;
  double v13;
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
  id fallbackURLAction;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v4 = [CPSButton alloc];
  _CPSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CEB568];
  v8 = -[CPSButton initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:](v4, "initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:", v5, v6, 0, 0, *MEMORY[0x1E0CEB568], 1, 0.0);
  fallbackOpenButton = self->_fallbackOpenButton;
  self->_fallbackOpenButton = v8;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", v7, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSButton titleLabel](self->_fallbackOpenButton, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[CPSButton setContentEdgeInsets:](self->_fallbackOpenButton, "setContentEdgeInsets:", 8.0, 27.0, 8.0, 27.0);
  -[CPSButton addTarget:action:forControlEvents:](self->_fallbackOpenButton, "addTarget:action:forControlEvents:", self, sel__openButtonTapped_, 64);
  -[CPSAppClipUnavailableView addSubview:](self, "addSubview:", self->_fallbackOpenButton);
  -[CPSButton setTranslatesAutoresizingMaskIntoConstraints:](self->_fallbackOpenButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1144766464;
  -[CPSButton setContentCompressionResistancePriority:forAxis:](self->_fallbackOpenButton, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  LODWORD(v13) = 1132134400;
  -[CPSButton setContentHuggingPriority:forAxis:](self->_fallbackOpenButton, "setContentHuggingPriority:forAxis:", 0, v13);
  v25 = (void *)MEMORY[0x1E0CB3718];
  -[CPSButton centerXAnchor](self->_fallbackOpenButton, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppClipUnavailableView centerXAnchor](self, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  -[CPSButton topAnchor](self->_fallbackOpenButton, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel bottomAnchor](self->_reasonLabel, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  -[CPSAppClipUnavailableView bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSButton bottomAnchor](self->_fallbackOpenButton, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20, 16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v22);

  v23 = (void *)MEMORY[0x1D17E1B78](v27);
  fallbackURLAction = self->_fallbackURLAction;
  self->_fallbackURLAction = v23;

}

- (void)_openButtonTapped:(id)a3
{
  void (**fallbackURLAction)(id, SEL, id);

  fallbackURLAction = (void (**)(id, SEL, id))self->_fallbackURLAction;
  if (fallbackURLAction)
  {
    fallbackURLAction[2](fallbackURLAction, a2, a3);
    fallbackURLAction = (void (**)(id, SEL, id))self->_fallbackURLAction;
  }
  self->_fallbackURLAction = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackURLAction, 0);
  objc_storeStrong((id *)&self->_fallbackOpenButton, 0);
  objc_storeStrong((id *)&self->_reasonLabel, 0);
}

@end
