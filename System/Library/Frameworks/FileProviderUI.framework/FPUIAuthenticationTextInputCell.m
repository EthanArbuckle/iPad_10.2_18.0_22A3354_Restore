@implementation FPUIAuthenticationTextInputCell

- (FPUIAuthenticationTextInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FPUIAuthenticationTextInputCell *v4;
  void *v5;
  void *v6;
  UIStackView *v7;
  UIStackView *stackView;
  UIStackView *v9;
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
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIStackView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[2];
  _QWORD v46[7];

  v46[5] = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)FPUIAuthenticationTextInputCell;
  v4 = -[FPUIAuthenticationTextInputCell initWithStyle:reuseIdentifier:](&v44, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setFont:", v43);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setFont:", v43);
    objc_msgSend(v6, "setHoverStyle:", 0);
    objc_storeWeak((id *)&v4->_label, v5);
    objc_storeWeak((id *)&v4->_textField, v6);
    v41 = v5;
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (UIStackView *)objc_opt_new();
    -[UIStackView setAxis:](v7, "setAxis:", 0);
    -[UIStackView setSpacing:](v7, "setSpacing:", 20.0);
    -[UIStackView setAlignment:](v7, "setAlignment:", 0);
    -[UIStackView setDistribution:](v7, "setDistribution:", 0);
    -[UIStackView addArrangedSubview:](v7, "addArrangedSubview:", v5);
    v42 = v6;
    -[UIStackView addArrangedSubview:](v7, "addArrangedSubview:", v6);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    stackView = v4->_stackView;
    v4->_stackView = v7;
    v9 = v7;

    -[FPUIAuthenticationTextInputCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

    objc_msgSend(v6, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintGreaterThanOrEqualToConstant:", 100.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v39;
    v35 = v9;
    -[UIStackView leadingAnchor](v9, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIAuthenticationTextInputCell contentView](v4, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v33;
    -[FPUIAuthenticationTextInputCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v9, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 0.5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v28;
    -[FPUIAuthenticationTextInputCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v9, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 8.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v14;
    -[UIStackView topAnchor](v9, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIAuthenticationTextInputCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18, 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = 1132134400;
    objc_msgSend(v41, "setContentHuggingPriority:forAxis:", 0, v20);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v27);
    -[FPUIAuthenticationTextInputCell updateForChangedContentSizeCategory](v4, "updateForChangedContentSizeCategory");
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v21;
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (id)-[FPUIAuthenticationTextInputCell registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v23, &__block_literal_global);
  }
  return v4;
}

uint64_t __65__FPUIAuthenticationTextInputCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForChangedContentSizeCategory");
}

- (void)prepareForReuse
{
  FPUIAuthenticationTextInputCell *v2;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v2 = self;
  v7.receiver = self;
  v7.super_class = (Class)FPUIAuthenticationTextInputCell;
  -[FPUIAuthenticationTextInputCell prepareForReuse](&v7, sel_prepareForReuse);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_label);
  objc_msgSend(WeakRetained, "setText:", 0);

  v2 = (FPUIAuthenticationTextInputCell *)((char *)v2 + 1040);
  v4 = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
  objc_msgSend(v4, "setText:", 0);

  v5 = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
  objc_msgSend(v5, "setSecureTextEntry:", 0);

  v6 = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
  objc_msgSend(v6, "setKeyboardType:", 0);

}

- (void)updateForChangedContentSizeCategory
{
  void *v3;
  _BOOL4 v4;

  -[FPUIAuthenticationTextInputCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FPUIAuthenticationTextInputCell _isLargeTextTraitCollection:](self, "_isLargeTextTraitCollection:", v3);

  -[UIStackView setAxis:](self->_stackView, "setAxis:", v4);
}

- (BOOL)_isLargeTextTraitCollection:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF7650];
  v10 = *MEMORY[0x24BDF7658];
  v11 = v3;
  v4 = *MEMORY[0x24BDF7640];
  v12 = *MEMORY[0x24BDF7648];
  v13 = v4;
  v14 = *MEMORY[0x24BDF7678];
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v10, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory", v10, v11, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "containsObject:", v8);
  return (char)v5;
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
