@implementation PKPaletteOptionInfoCell

- (PKPaletteOptionInfoCell)init
{
  PKPaletteOptionInfoCell *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *textLabel;
  void *v18;
  UILabel *v19;
  UILabel *subTextLabel;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)PKPaletteOptionInfoCell;
  v2 = -[PKPaletteOptionCell initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v3, "setSpacing:", 0.0);
    objc_msgSend(v3, "setAxis:", 1);
    objc_msgSend(v3, "setAlignment:", 1);
    objc_msgSend(v3, "setDistribution:", 0);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteOptionInfoCell addSubview:](v2, "addSubview:", v3);
    objc_msgSend(v3, "trailingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionInfoCell trailingAnchor](v2, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -16.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = 1144750080;
    v28 = v6;
    objc_msgSend(v6, "setPriority:", v7);
    v23 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionInfoCell topAnchor](v2, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 16.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    objc_msgSend(v3, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionInfoCell leadingAnchor](v2, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v8, 16.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v9;
    v30[2] = v6;
    objc_msgSend(v3, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionInfoCell bottomAnchor](v2, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -8.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v12;
    objc_msgSend(v3, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintLessThanOrEqualToConstant:", 280.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v15);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v2->_textLabel;
    v2->_textLabel = v16;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_textLabel, "setFont:", v18);

    -[UILabel setNumberOfLines:](v2->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v2->_textLabel, "setLineBreakMode:", 0);
    objc_msgSend(v3, "addArrangedSubview:", v2->_textLabel);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subTextLabel = v2->_subTextLabel;
    v2->_subTextLabel = v19;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_subTextLabel, "setFont:", v21);

    -[UILabel setNumberOfLines:](v2->_subTextLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v2->_subTextLabel, "setLineBreakMode:", 0);
    objc_msgSend(v3, "addArrangedSubview:", v2->_subTextLabel);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
