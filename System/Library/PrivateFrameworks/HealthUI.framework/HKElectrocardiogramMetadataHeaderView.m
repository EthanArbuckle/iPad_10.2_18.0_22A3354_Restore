@implementation HKElectrocardiogramMetadataHeaderView

- (HKElectrocardiogramMetadataHeaderView)initWithText:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  HKElectrocardiogramMetadataHeaderView *v8;
  HKElectrocardiogramMetadataHeaderView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramMetadataHeaderView;
  v8 = -[HKElectrocardiogramMetadataHeaderView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
    -[HKElectrocardiogramMetadataHeaderView _setupUIWithText:date:](v8, "_setupUIWithText:date:", v6, v7);

  return v9;
}

- (void)_setupUIWithText:(id)a3 date:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *detailButton;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  id v38;
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
  void *v55;
  id v56;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "healthAccessibilityIdentifier:suffix:", 1, CFSTR("SessionDetails"));
  v56 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v9, "setTextAlignment:", 4);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredRoundedFontForTextStyle:additionalSymbolicTraits:", *MEMORY[0x1E0DC4B50], 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v11);

  objc_msgSend(v56, "stringByAppendingString:", CFSTR(".Title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v12);

  -[HKElectrocardiogramMetadataHeaderView addSubview:](self, "addSubview:", v9);
  objc_msgSend(v9, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataHeaderView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v9, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataHeaderView leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 2);
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
  detailButton = self->_detailButton;
  self->_detailButton = v19;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_detailButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_detailButton, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(v56, "stringByAppendingString:", CFSTR(".InfoButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setAccessibilityIdentifier:](self->_detailButton, "setAccessibilityIdentifier:", v21);

  -[HKElectrocardiogramMetadataHeaderView addSubview:](self, "addSubview:", self->_detailButton);
  -[UIButton centerYAnchor](self->_detailButton, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lineHeight");
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v25 * 0.5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[UIButton leadingAnchor](self->_detailButton, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v28, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[UIButton heightAnchor](self->_detailButton, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton widthAnchor](self->_detailButton, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKElectrocardiogramMetadataHeaderView trailingAnchor](self, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_detailButton, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  HKDateFormatterFromTemplate(33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimeZone:", v37);

  v38 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v36, "stringFromDate:", v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "setText:", v39);
  objc_msgSend(v38, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v38, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTextColor:", v40);

  objc_msgSend(v38, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v41, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFont:", v42);

  objc_msgSend(v56, "stringByAppendingString:", CFSTR(".Date"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAccessibilityIdentifier:", v43);

  -[HKElectrocardiogramMetadataHeaderView addSubview:](self, "addSubview:", v38);
  objc_msgSend(v38, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  objc_msgSend(v38, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataHeaderView bottomAnchor](self, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  objc_msgSend(v38, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataHeaderView leadingAnchor](self, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  objc_msgSend(v38, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramMetadataHeaderView trailingAnchor](self, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

}

- (UIButton)detailButton
{
  return self->_detailButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButton, 0);
}

@end
