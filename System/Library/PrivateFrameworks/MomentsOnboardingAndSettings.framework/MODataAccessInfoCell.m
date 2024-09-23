@implementation MODataAccessInfoCell

- (MODataAccessInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  MODataAccessInfoCell *v9;
  MODataAccessInfoCell *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
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
  id v27;
  void *v28;
  void *v29;
  void *v30;
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
  objc_super v51;
  _QWORD v52[9];

  v52[7] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v51.receiver = self;
  v51.super_class = (Class)MODataAccessInfoCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v51, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[MODataAccessInfoCell contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    objc_msgSend(v12, "setNumberOfLines:", 0);
    v14 = v11;
    objc_msgSend(v11, "addSubview:", v12);
    v15 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v16);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v17);

    objc_msgSend(v15, "setNumberOfLines:", 0);
    v18 = v14;
    objc_msgSend(v14, "addSubview:", v15);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MOTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v19);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MOBody"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v20);

    -[MODataAccessInfoCell contentView](v10, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v12, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v14;
    objc_msgSend(v14, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v49, 2.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v48;
    objc_msgSend(v12, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v44;
    v46 = v12;
    objc_msgSend(v12, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v41;
    objc_msgSend(v15, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v36, 1.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v35;
    objc_msgSend(v15, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v22;
    objc_msgSend(v22, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v32;
    objc_msgSend(v15, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v25;
    objc_msgSend(v18, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v27 = v8;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v28, 2.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v30);

    v8 = v27;
  }

  return v10;
}

@end
