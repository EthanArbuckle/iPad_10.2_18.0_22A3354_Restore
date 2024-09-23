@implementation HKObjectPickerShowDetailsTableViewCell

- (HKObjectPickerShowDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKObjectPickerShowDetailsTableViewCell *v4;
  HKObjectPickerShowDetailsTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKObjectPickerShowDetailsTableViewCell;
  v4 = -[HKObjectPickerShowDetailsTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKObjectPickerShowDetailsTableViewCell _setupSubviews](v4, "_setupSubviews");
  return v5;
}

- (void)_setupSubviews
{
  void *v3;
  uint64_t v4;
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
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  -[HKObjectPickerShowDetailsTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObjectPickerShowDetailsTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SHOW_DETAILS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  v28 = (void *)MEMORY[0x1E0CB3718];
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v32;
  -[HKObjectPickerShowDetailsTableViewCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v27, 16.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v26;
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 47.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v18;
  -[HKObjectPickerShowDetailsTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerShowDetailsTableViewCell textLabel](self, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 47.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v24);

}

@end
