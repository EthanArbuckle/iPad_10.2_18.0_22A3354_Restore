@implementation AKAuthorizationButton

- (void)setupButton
{
  id v3;
  void *v4;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AKAuthorizationButton setTitleLabel:](self, "setTitleLabel:", v4);

  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationAppearance continueButtonFont](AKAuthorizationAppearance, "continueButtonFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationAppearance continueButtonTextColor](AKAuthorizationAppearance, "continueButtonTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton addSubview:](self, "addSubview:", v12);

  -[AKAuthorizationButton layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonCornerRadius](AKAuthorizationPaneMetrics, "continueButtonCornerRadius");
  objc_msgSend(v13, "setCornerRadius:");

  v24 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton centerYAnchor](self, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonTextHorizontalPadding](AKAuthorizationPaneMetrics, "continueButtonTextHorizontalPadding");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  -[AKAuthorizationButton trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonTextHorizontalPadding](AKAuthorizationPaneMetrics, "continueButtonTextHorizontalPadding");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v23);

}

- (NSString)buttonText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setButtonText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6;

  v6 = a3;
  -[AKAuthorizationButton removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  -[AKAuthorizationButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
