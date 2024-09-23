@implementation ASCredentialRequestButtonContinue

- (ASCredentialRequestButtonContinue)initWithFrame:(CGRect)a3
{
  ASCredentialRequestButtonContinue *v3;
  ASCredentialRequestButtonContinue *v4;
  ASCredentialRequestButtonContinue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCredentialRequestButtonContinue;
  v3 = -[ASCredentialRequestButtonContinue initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCredentialRequestButtonContinue _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (ASCredentialRequestButtonContinue)initWithCoder:(id)a3
{
  ASCredentialRequestButtonContinue *v3;
  ASCredentialRequestButtonContinue *v4;
  ASCredentialRequestButtonContinue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCredentialRequestButtonContinue;
  v3 = -[ASCredentialRequestButtonContinue initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[ASCredentialRequestButtonContinue _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  void *v3;
  id v4;
  void *v5;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  +[ASViewServiceInterfaceUtilities continueButtonBackgroundColor](ASViewServiceInterfaceUtilities, "continueButtonBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue setBackgroundColor:](self, "setBackgroundColor:", v3);

  +[ASViewServiceInterfaceUtilities continueButtonCornerRadius](ASViewServiceInterfaceUtilities, "continueButtonCornerRadius");
  -[ASCredentialRequestButtonContinue _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  v4 = objc_alloc(MEMORY[0x24BEBD708]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
  +[ASViewServiceInterfaceUtilities continueButtonTitleFont](ASViewServiceInterfaceUtilities, "continueButtonTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  +[ASViewServiceInterfaceUtilities continueButtonTitleColor](ASViewServiceInterfaceUtilities, "continueButtonTitleColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE070]);
  -[ASCredentialRequestButton setTitleLabel:](self, "setTitleLabel:", v5);
  -[ASCredentialRequestButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue addSubview:](self, "addSubview:", v8);

  v18 = (void *)MEMORY[0x24BDD1628];
  -[ASCredentialRequestButton titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue centerYAnchor](self, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  -[ASCredentialRequestButton titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue leadingAnchor](self, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities continueButtonTitleMargin](ASViewServiceInterfaceUtilities, "continueButtonTitleMargin");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  -[ASCredentialRequestButtonContinue trailingAnchor](self, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButton titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities continueButtonTitleMargin](ASViewServiceInterfaceUtilities, "continueButtonTitleMargin");
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

  objc_msgSend(MEMORY[0x24BEBD638], "automaticStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue setHoverStyle:](self, "setHoverStyle:", v17);

}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestButtonContinue;
  -[ASCredentialRequestButtonContinue setHighlighted:](&v5, sel_setHighlighted_, a3);
  -[ASCredentialRequestButtonContinue _backgroundColorForCurrentControlState](self, "_backgroundColorForCurrentControlState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestButtonContinue;
  -[ASCredentialRequestButtonContinue setEnabled:](&v5, sel_setEnabled_, a3);
  -[ASCredentialRequestButtonContinue _backgroundColorForCurrentControlState](self, "_backgroundColorForCurrentControlState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButtonContinue setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (id)_backgroundColorForCurrentControlState
{
  void *v3;

  if ((-[ASCredentialRequestButtonContinue isEnabled](self, "isEnabled") & 1) != 0)
  {
    if (-[ASCredentialRequestButtonContinue isHighlighted](self, "isHighlighted"))
      +[ASViewServiceInterfaceUtilities continueButtonHighlightedBackgroundColor](ASViewServiceInterfaceUtilities, "continueButtonHighlightedBackgroundColor");
    else
      +[ASViewServiceInterfaceUtilities continueButtonBackgroundColor](ASViewServiceInterfaceUtilities, "continueButtonBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ASViewServiceInterfaceUtilities continueButtonDisabledBackgroundColor](ASViewServiceInterfaceUtilities, "continueButtonDisabledBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
