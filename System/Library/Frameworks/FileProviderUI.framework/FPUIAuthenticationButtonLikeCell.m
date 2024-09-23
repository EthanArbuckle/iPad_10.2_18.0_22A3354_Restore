@implementation FPUIAuthenticationButtonLikeCell

- (FPUIAuthenticationButtonLikeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FPUIAuthenticationButtonLikeCell *v4;
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
  void *v28;
  objc_super v29;
  _QWORD v30[6];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)FPUIAuthenticationButtonLikeCell;
  v4 = -[FPUIAuthenticationButtonLikeCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setFont:", v28);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FPUIAuthenticationButtonLikeCell bounds](v4, "bounds");
    objc_msgSend(v5, "setFrame:");
    -[FPUIAuthenticationButtonLikeCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    v19 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIAuthenticationButtonLikeCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v24;
    objc_msgSend(v5, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIAuthenticationButtonLikeCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v20;
    -[FPUIAuthenticationButtonLikeCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v7, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v8;
    objc_msgSend(v5, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIAuthenticationButtonLikeCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v12, 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v14);

    objc_storeWeak((id *)&v4->_label, v5);
  }
  return v4;
}

- (void)prepareForReuse
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPUIAuthenticationButtonLikeCell;
  -[FPUIAuthenticationButtonLikeCell prepareForReuse](&v4, sel_prepareForReuse);
  WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  objc_msgSend(WeakRetained, "setText:", 0);

}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
}

@end
