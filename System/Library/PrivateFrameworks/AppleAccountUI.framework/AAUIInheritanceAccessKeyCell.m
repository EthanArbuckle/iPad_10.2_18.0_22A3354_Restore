@implementation AAUIInheritanceAccessKeyCell

- (AAUIInheritanceAccessKeyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AAUIInheritanceAccessKeyCell *v4;
  AAUIInheritanceAccessKeyCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIInheritanceAccessKeyCell;
  v4 = -[AAUIInheritanceAccessKeyCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAUIInheritanceAccessKeyCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[AAUIInheritanceAccessKeyCell _setupViews](v5, "_setupViews");
  }
  return v5;
}

+ (id)specifierForAcessKey:(id)a3 qrCodeImage:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D804E8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, a1, 0, 0, 0, -1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v9, "setProperty:forKey:", v8, CFSTR("AccessKey"));

  objc_msgSend(v9, "setProperty:forKey:", v7, CFSTR("QRCodeImage"));
  return v9;
}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[6];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[AAUIInheritanceAccessKeyCell setQrCodeImageView:](self, "setQrCodeImageView:", v3);

  -[AAUIInheritanceAccessKeyCell qrCodeImageView](self, "qrCodeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 1);

  -[AAUIInheritanceAccessKeyCell qrCodeImageView](self, "qrCodeImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);

  v7 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  -[AAUIInheritanceAccessKeyCell setAccessKeyTextView:](self, "setAccessKeyTextView:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEditable:", 0);

  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectable:", 0);

  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollEnabled:", 0);

  v14 = *MEMORY[0x1E0DC49E8];
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v17 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextContainerInset:", v14, v15, v16, v17);

  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1148846080;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 1, v20);

  v21 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[AAUIInheritanceAccessKeyCell qrCodeImageView](self, "qrCodeImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v22;
  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithArrangedSubviews:", v24);

  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "setAxis:", 1);
  objc_msgSend(v25, "setSpacing:", 30.0);
  -[AAUIInheritanceAccessKeyCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v25);

  v43 = (void *)MEMORY[0x1E0CB3718];
  -[AAUIInheritanceAccessKeyCell qrCodeImageView](self, "qrCodeImageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", 155.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v52;
  -[AAUIInheritanceAccessKeyCell qrCodeImageView](self, "qrCodeImageView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", 155.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v49;
  objc_msgSend(v25, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutMarginsGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v44;
  objc_msgSend(v25, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layoutMarginsGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -16.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v38;
  objc_msgSend(v25, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layoutMarginsGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v28, 38.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v29;
  objc_msgSend(v25, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v33, -28.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "activateConstraints:", v35);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("QRCodeImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyCell qrCodeImageView](self, "qrCodeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  objc_msgSend(v4, "propertyForKey:", CFSTR("AccessKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIInheritanceAccessKeyCell accessKeyTextView](self, "accessKeyTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[AAUIInheritanceAccessKeyCell setNeedsLayout](self, "setNeedsLayout");
}

- (UIImageView)qrCodeImageView
{
  return self->_qrCodeImageView;
}

- (void)setQrCodeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_qrCodeImageView, a3);
}

- (UITextView)accessKeyTextView
{
  return self->_accessKeyTextView;
}

- (void)setAccessKeyTextView:(id)a3
{
  objc_storeStrong((id *)&self->_accessKeyTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKeyTextView, 0);
  objc_storeStrong((id *)&self->_qrCodeImageView, 0);
}

@end
