@implementation _HUIDarkTextView

- (_HUIDarkTextView)initWithFrame:(CGRect)a3
{
  _HUIDarkTextView *v3;
  HACCCapsuleDarkBackground *v4;
  HACCCapsuleDarkBackground *darkBackgroundView;
  UIStackView *v6;
  UIStackView *stackView;
  uint64_t v8;
  UILabel *nameLabel;
  uint64_t v10;
  UILabel *valueLabel;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)_HUIDarkTextView;
  v3 = -[_HUIDarkTextView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HACCCapsuleDarkBackground);
    darkBackgroundView = v3->_darkBackgroundView;
    v3->_darkBackgroundView = v4;

    -[HACCCapsuleDarkBackground setAutoresizingMask:](v3->_darkBackgroundView, "setAutoresizingMask:", 18);
    -[_HUIDarkTextView addSubview:](v3, "addSubview:", v3->_darkBackgroundView);
    -[HACCCapsuleDarkBackground setupBackgroundVisualStyle](v3->_darkBackgroundView, "setupBackgroundVisualStyle");
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v3->_stackView;
    v3->_stackView = v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v3->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[_HUIDarkTextView addSubview:](v3, "addSubview:", v3->_stackView);
    HUICCMenuTextLabel();
    v8 = objc_claimAutoreleasedReturnValue();
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v8;

    -[UILabel setTextAlignment:](v3->_nameLabel, "setTextAlignment:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_nameLabel);
    HUICCMenuTextLabel();
    v10 = objc_claimAutoreleasedReturnValue();
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = (UILabel *)v10;

    -[UILabel setTextAlignment:](v3->_valueLabel, "setTextAlignment:", 2);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_valueLabel);
    v23 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUIDarkTextView leadingAnchor](v3, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    -[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUIDarkTextView trailingAnchor](v3, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v13;
    -[UIStackView topAnchor](v3->_stackView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUIDarkTextView topAnchor](v3, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v16;
    -[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUIDarkTextView bottomAnchor](v3, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v20);

    -[_HUIDarkTextView updateLayout:](v3, "updateLayout:", HUICCLargeTextEnabled());
    HUICCBackgroundVisualStylingProviderForCategory(1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUIDarkTextView setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v21, 1);

  }
  return v3;
}

- (void)updateLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  -[_HUIDarkTextView valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = 0;
  else
    v7 = 2;
  if (v3)
    v8 = 10.0;
  else
    v8 = 0.0;
  objc_msgSend(v5, "setTextAlignment:", v7);

  -[UIStackView setAxis:](self->_stackView, "setAxis:", v3);
  CCUILayoutGutter();
  v10 = v9;
  CCUILayoutGutter();
  -[UIStackView setLayoutMargins:](self->_stackView, "setLayoutMargins:", v8, v10, v8, v11);
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24DD6B320;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  _HUIDarkTextView *v12;

  v6 = a3;
  -[_HUIDarkTextView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57___HUIDarkTextView_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_24DD61050;
    v11 = v6;
    v12 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (HACCCapsuleDarkBackground)darkBackgroundView
{
  return self->_darkBackgroundView;
}

- (void)setDarkBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_darkBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkBackgroundView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
