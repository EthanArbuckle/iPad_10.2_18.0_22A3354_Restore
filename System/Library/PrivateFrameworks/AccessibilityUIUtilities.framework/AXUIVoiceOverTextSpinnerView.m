@implementation AXUIVoiceOverTextSpinnerView

- (AXUIVoiceOverTextSpinnerView)initWithSpecifier:(id)a3
{
  id v4;
  AXUIVoiceOverTextSpinnerView *v5;
  void *v6;
  uint64_t v7;
  UILabel *text;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  uint64_t v19;
  UIActivityIndicatorView *spinner;
  void *v21;
  UIActivityIndicatorView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  objc_super v42;
  objc_super v43;
  objc_super v44;
  _QWORD v45[7];

  v45[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)AXUIVoiceOverTextSpinnerView;
  v5 = -[AXUIVoiceOverTextSpinnerView init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "setProperty:forKey:", v5, CFSTR("VoiceOverTextSpinnerView"));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverTextSpinnerView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[AXUIVoiceOverTextSpinnerView setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), "init");
    text = v5->_text;
    v5->_text = (UILabel *)v7;

    v9 = v5->_text;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = v5->_text;
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v5->_text;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setShadowOffset:](v5->_text, "setShadowOffset:", 0.0, 1.0);
    -[UILabel setLineBreakMode:](v5->_text, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v5->_text, "setNumberOfLines:", 0);
    v15 = v5->_text;
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedUppercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v15, "setText:", v17);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_text, "setAdjustsFontForContentSizeCategory:", 1);
    v18 = v5->_text;
    v43.receiver = v5;
    v43.super_class = (Class)AXUIVoiceOverTextSpinnerView;
    -[AXUIVoiceOverTextSpinnerView addSubview:](&v43, sel_addSubview_, v18);
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v19;

    -[UIActivityIndicatorView setHidesWhenStopped:](v5->_spinner, "setHidesWhenStopped:", 1);
    v41 = v4;
    objc_msgSend(v4, "propertyForKey:", CFSTR("VoiceOverTextSpinnerViewEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v21, "BOOLValue");

    if ((_DWORD)v17)
      -[UIActivityIndicatorView startAnimating](v5->_spinner, "startAnimating");
    v22 = v5->_spinner;
    v42.receiver = v5;
    v42.super_class = (Class)AXUIVoiceOverTextSpinnerView;
    -[AXUIVoiceOverTextSpinnerView addSubview:](&v42, sel_addSubview_, v22);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_text, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v5->_text, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverTextSpinnerView leadingAnchor](v5, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 15.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v38;
    -[UIActivityIndicatorView leadingAnchor](v5->_spinner, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_text, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 10.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v35;
    -[UIActivityIndicatorView trailingAnchor](v5->_spinner, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverTextSpinnerView trailingAnchor](v5, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", v23, -10.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v24;
    -[UILabel centerYAnchor](v5->_text, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverTextSpinnerView centerYAnchor](v5, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v27;
    -[UIActivityIndicatorView centerYAnchor](v5->_spinner, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverTextSpinnerView centerYAnchor](v5, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v31);

    v4 = v41;
  }

  return v5;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;

  -[UILabel sizeThatFits:](self->_text, "sizeThatFits:", a3 + -15.0, 3.40282347e38);
  return v3 + 18.0;
}

- (void)showSpinner
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)hideSpinner
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
