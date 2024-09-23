@implementation HKInfographicButtonCell

- (void)setConfiguration:(id)a3 buttonTapHandler:(id)a4
{
  id v6;
  id v7;
  UIButtonConfiguration *v8;
  UIButtonConfiguration *configuration;
  void *v10;
  id buttonTapHandler;
  UIButton *button;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (UIButtonConfiguration *)objc_msgSend(v6, "copy");
  configuration = self->_configuration;
  self->_configuration = v8;

  -[UIButtonConfiguration setContentInsets:](self->_configuration, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  v10 = (void *)objc_msgSend(v7, "copy");
  buttonTapHandler = self->_buttonTapHandler;
  self->_buttonTapHandler = v10;

  button = self->_button;
  if (button)
  {
    -[UIButton setConfiguration:](button, "setConfiguration:", v6);
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC3428];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __61__HKInfographicButtonCell_setConfiguration_buttonTapHandler___block_invoke;
    v20 = &unk_1E9C40D30;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v13, "actionWithHandler:", &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", self->_configuration, v14, v17, v18, v19, v20);
    v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v16 = self->_button;
    self->_button = v15;

    -[HKInfographicButtonCell _constrainButton](self, "_constrainButton");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __61__HKInfographicButtonCell_setConfiguration_buttonTapHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapButton");

}

- (void)_constrainButton
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  -[HKInfographicButtonCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_button);

  -[UIButton setContentHorizontalAlignment:](self->_button, "setContentHorizontalAlignment:", 4);
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton topAnchor](self->_button, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicButtonCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 5.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  -[UIButton leadingAnchor](self->_button, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicButtonCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  -[UIButton trailingAnchor](self->_button, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicButtonCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v5;
  -[UIButton bottomAnchor](self->_button, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicButtonCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v11);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKInfographicButtonCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDirectionalLayoutMargins:", 7.0, 7.0, 18.0, 7.0);

}

- (void)_didTapButton
{
  void (**buttonTapHandler)(void);

  buttonTapHandler = (void (**)(void))self->_buttonTapHandler;
  if (buttonTapHandler)
    buttonTapHandler[2]();
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    v13[1] = CFSTR("InfographicButtonItem");
    v13[2] = CFSTR("Cell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicButtonCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    v12[0] = v5;
    v12[1] = CFSTR("InfographicButtonItem");
    v12[2] = CFSTR("Button");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicButtonCell button](self, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  }
  else
  {
    -[HKInfographicButtonCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
    -[HKInfographicButtonCell button](self, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", 0);

  }
}

- (UIButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (id)buttonTapHandler
{
  return self->_buttonTapHandler;
}

- (void)setButtonTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_buttonTapHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
