@implementation HKObjectPickerDetailView

- (HKObjectPickerDetailView)initWithFrame:(CGRect)a3
{
  HKObjectPickerDetailView *v3;
  HKObjectPickerDetailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKObjectPickerDetailView;
  v3 = -[HKObjectPickerDetailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HKObjectPickerDetailView _setUpSubviews](v3, "_setUpSubviews");
  return v4;
}

- (void)_setUpSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *primaryLabel;
  uint64_t v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *secondaryLabel;
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
  _QWORD v40[9];

  v40[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v8;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_primaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v10 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v11);

  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v12);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKObjectPickerDetailView addSubview:](self, "addSubview:", self->_primaryLabel);
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v13;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_secondaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v15);

  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v16);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKObjectPickerDetailView addSubview:](self, "addSubview:", self->_secondaryLabel);
  v30 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_primaryLabel, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerDetailView topAnchor](self, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v37;
  -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerDetailView leadingAnchor](self, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v34;
  -[HKObjectPickerDetailView trailingAnchor](self, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v31;
  -[UILabel topAnchor](self->_secondaryLabel, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_primaryLabel, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v27;
  -[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v19;
  -[HKObjectPickerDetailView trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v22;
  -[HKObjectPickerDetailView bottomAnchor](self, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_secondaryLabel, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v26);

}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
