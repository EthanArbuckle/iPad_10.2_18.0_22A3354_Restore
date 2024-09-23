@implementation _NCContentUnavailableViewWithButton

- (_NCContentUnavailableViewWithButton)initWithTitle:(id)a3 buttonAction:(id)a4
{
  id v6;
  id v7;
  _NCContentUnavailableViewWithButton *v8;
  _NCContentUnavailableViewWithButton *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_NCContentUnavailableViewWithButton;
  v8 = -[_NCContentUnavailableViewWithButton init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_NCContentUnavailableViewWithButton setLayoutMargins:](v8, "setLayoutMargins:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[_NCContentUnavailableViewWithButton setPreservesSuperviewLayoutMargins:](v9, "setPreservesSuperviewLayoutMargins:", 1);
    -[_NCContentUnavailableViewWithButton _configureBackgroundView](v9, "_configureBackgroundView");
    -[_NCContentUnavailableViewWithButton _configureTitleLabelWithTitle:](v9, "_configureTitleLabelWithTitle:", v6);
    -[_NCContentUnavailableViewWithButton setButtonHandler:](v9, "setButtonHandler:", v7);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v9, sel__buttonPressed_);
    objc_msgSend(v10, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v10, "setNumberOfTouchesRequired:", 1);
    -[UIView addGestureRecognizer:](v9->_backgroundView, "addGestureRecognizer:", v10);

  }
  return v9;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NCContentUnavailableViewWithButton;
  -[_NCContentUnavailableViewWithButton didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_NCContentUnavailableViewWithButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_NCContentUnavailableViewWithButton _updateVisualStyling](self, "_updateVisualStyling");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NCContentUnavailableViewWithButton;
  -[_NCContentUnavailableViewWithButton _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[_NCContentUnavailableViewWithButton _updateVisualStyling](self, "_updateVisualStyling");
}

- (void)_configureTitleLabelWithTitle:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
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
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_titleLabel)
  {
    v4 = (objc_class *)MEMORY[0x24BDF6B68];
    v5 = a3;
    v6 = (UILabel *)objc_alloc_init(v4);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setText:](self->_titleLabel, "setText:", v5);

    -[_NCContentUnavailableViewWithButton addSubview:](self, "addSubview:", self->_titleLabel);
    v10 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), self->_titleLabel, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(padding)-[_titleLabel]-(padding)-|"), 0, &unk_24DB76398, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NCContentUnavailableViewWithButton addConstraints:](self, "addConstraints:", v12);
    -[_NCContentUnavailableViewWithButton layoutMarginsGuide](self, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    -[UILabel heightAnchor](self->_titleLabel, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 30.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NCContentUnavailableViewWithButton addConstraints:](self, "addConstraints:", v19);
  }
}

- (void)_configureBackgroundView
{
  UIView *v3;
  UIView *backgroundView;
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
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_backgroundView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_backgroundView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 4.0);

    -[_NCContentUnavailableViewWithButton addSubview:](self, "addSubview:", self->_backgroundView);
    v6 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_backgroundView"), self->_backgroundView, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(padding)-[_backgroundView]-(padding)-|"), 0, &unk_24DB763C0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NCContentUnavailableViewWithButton addConstraints:](self, "addConstraints:", v8);
    -[_NCContentUnavailableViewWithButton layoutMarginsGuide](self, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_backgroundView, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    -[UIView heightAnchor](self->_backgroundView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 30.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NCContentUnavailableViewWithButton addConstraints:](self, "addConstraints:", v15);
  }
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE64070];
  -[_NCContentUnavailableViewWithButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, a3, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateVisualStyling
{
  UILabel *titleLabel;
  void *v4;
  void *v5;
  UIView *backgroundView;
  void *v7;
  id v8;

  titleLabel = self->_titleLabel;
  -[_NCContentUnavailableViewWithButton _visualStylingProviderForCategory:](self, "_visualStylingProviderForCategory:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visualStylingForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel mt_replaceVisualStyling:](titleLabel, "mt_replaceVisualStyling:", v5);

  backgroundView = self->_backgroundView;
  -[_NCContentUnavailableViewWithButton _visualStylingProviderForCategory:](self, "_visualStylingProviderForCategory:", 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_visualStylingForStyle:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView mt_replaceVisualStyling:](backgroundView, "mt_replaceVisualStyling:", v7);

}

- (void)_buttonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[_NCContentUnavailableViewWithButton buttonHandler](self, "buttonHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_NCContentUnavailableViewWithButton buttonHandler](self, "buttonHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (id)buttonHandler
{
  return self->_buttonHandler;
}

- (void)setButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonHandler, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
