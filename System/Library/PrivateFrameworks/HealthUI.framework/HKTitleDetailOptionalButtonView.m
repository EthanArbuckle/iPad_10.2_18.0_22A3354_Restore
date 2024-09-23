@implementation HKTitleDetailOptionalButtonView

- (HKTitleDetailOptionalButtonView)init
{
  HKTitleDetailOptionalButtonView *v2;
  HKTitleDetailOptionalButtonView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKTitleDetailOptionalButtonView;
  v2 = -[HKTitleDetailOptionalButtonView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
    -[HKTitleDetailOptionalButtonView setUp](v2, "setUp");
  return v3;
}

- (void)setUp
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  UILabel *v6;
  UILabel *detailLabel;
  void *v8;
  UIButton *v9;
  UIButton *button;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *buttonPresentConstraints;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *buttonOmittedConstraints;
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
  _QWORD v53[6];
  void *v54;
  _QWORD v55[7];

  v55[5] = *MEMORY[0x1E0C80C00];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B58], 1024);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[HKTitleDetailOptionalButtonView addSubview:](self, "addSubview:", self->_titleLabel);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_detailLabel, "setFont:", v8);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_detailLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[HKTitleDetailOptionalButtonView addSubview:](self, "addSubview:", self->_detailLabel);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v9;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setRole:](self->_button, "setRole:", 1);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_buttonTapped, 64);
  -[HKTitleDetailOptionalButtonView addSubview:](self, "addSubview:", self->_button);
  -[UIButton topAnchor](self->_button, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_detailLabel, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v49, 17.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v47;
  -[UIButton leadingAnchor](self->_button, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView leadingAnchor](self, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v43, 16.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v41;
  -[UIButton trailingAnchor](self->_button, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView trailingAnchor](self, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v11, -16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v12;
  -[UIButton bottomAnchor](self->_button, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -16.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v15;
  -[UIButton heightAnchor](self->_button, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToConstant:", 50.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  buttonPresentConstraints = self->_buttonPresentConstraints;
  self->_buttonPresentConstraints = v18;

  -[UILabel bottomAnchor](self->_detailLabel, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView bottomAnchor](self, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -16.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  buttonOmittedConstraints = self->_buttonOmittedConstraints;
  self->_buttonOmittedConstraints = v23;

  v38 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView topAnchor](self, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50, 20.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v48;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView leadingAnchor](self, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, 16.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v42;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView trailingAnchor](self, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37, -16.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v36;
  -[UILabel topAnchor](self->_detailLabel, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v25, 4.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v26;
  -[UILabel leadingAnchor](self->_detailLabel, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView leadingAnchor](self, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 16.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v29;
  -[UILabel trailingAnchor](self->_detailLabel, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitleDetailOptionalButtonView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "arrayByAddingObjectsFromArray:", self->_buttonOmittedConstraints);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v34);

}

- (void)populateWithTitle:(id)a3 detail:(id)a4 buttonText:(id)a5 buttonAction:(id)a6
{
  UILabel *titleLabel;
  id v11;
  id v12;
  id v13;
  id buttonAction;
  void *v15;
  id v16;
  UIButton *button;
  void *v18;
  int *v19;
  int *v20;

  titleLabel = self->_titleLabel;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[UILabel setText:](titleLabel, "setText:", a3);
  -[UILabel setText:](self->_detailLabel, "setText:", v13);

  buttonAction = self->_buttonAction;
  v15 = _Block_copy(v11);

  v16 = self->_buttonAction;
  self->_buttonAction = v15;

  button = self->_button;
  -[HKTitleDetailOptionalButtonView _buttonConfigurationWithButtonTitle:](self, "_buttonConfigurationWithButtonTitle:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setConfiguration:](button, "setConfiguration:", v18);
  -[UIButton setHidden:](self->_button, "setHidden:", v11 == 0);
  if (v11 && !buttonAction)
  {
    v19 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonPresentConstraints;
    v20 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonOmittedConstraints;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v20));
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v19));
    return;
  }
  if (!v11 && buttonAction)
  {
    v19 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonOmittedConstraints;
    v20 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonPresentConstraints;
    goto LABEL_7;
  }
}

- (id)_buttonConfigurationWithButtonTitle:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DC3520];
  v4 = a3;
  objc_msgSend(v3, "grayButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  objc_msgSend(v5, "setCornerStyle:", 3);
  return v5;
}

- (void)buttonTapped
{
  (*((void (**)(void))self->_buttonAction + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonOmittedConstraints, 0);
  objc_storeStrong((id *)&self->_buttonPresentConstraints, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
