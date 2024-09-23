@implementation PKPaletteOptionSwitchCell

- (PKPaletteOptionSwitchCell)init
{
  PKPaletteOptionSwitchCell *v2;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UISwitch *v27;
  UISwitch *switchButton;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[2];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PKPaletteOptionSwitchCell;
  v2 = -[PKPaletteOptionCell initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v3, "setSpacing:", 16.0);
    objc_msgSend(v3, "setAxis:", 0);
    objc_msgSend(v3, "setAlignment:", 3);
    objc_msgSend(v3, "setDistribution:", 0);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteOptionSwitchCell addSubview:](v2, "addSubview:", v3);
    objc_msgSend(v3, "trailingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionSwitchCell trailingAnchor](v2, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -16.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = 1144750080;
    v33 = v6;
    objc_msgSend(v6, "setPriority:", v7);
    v30 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionSwitchCell topAnchor](v2, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    objc_msgSend(v3, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionSwitchCell leadingAnchor](v2, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v11;
    v36[2] = v6;
    objc_msgSend(v3, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionSwitchCell bottomAnchor](v2, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v15);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v2->_textLabel;
    v2->_textLabel = v16;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_textLabel, "setFont:", v18);

    -[UILabel setNumberOfLines:](v2->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v2->_textLabel, "setLineBreakMode:", 0);
    objc_msgSend(v3, "addArrangedSubview:", v2->_textLabel);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v2->_textLabel, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionSwitchCell topAnchor](v2, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v21, 16.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    -[UILabel bottomAnchor](v2->_textLabel, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionSwitchCell bottomAnchor](v2, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:constant:", v24, -16.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v26);

    v27 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    switchButton = v2->_switchButton;
    v2->_switchButton = v27;

    objc_msgSend(v3, "addArrangedSubview:", v2->_switchButton);
  }
  return v2;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UISwitch)switchButton
{
  return self->_switchButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
