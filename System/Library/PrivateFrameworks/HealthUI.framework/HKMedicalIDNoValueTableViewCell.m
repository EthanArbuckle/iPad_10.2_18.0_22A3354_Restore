@implementation HKMedicalIDNoValueTableViewCell

- (HKMedicalIDNoValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDNoValueTableViewCell *v4;
  HKMedicalIDNoValueTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDNoValueTableViewCell;
  v4 = -[HKMedicalIDNoValueTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[HKMedicalIDNoValueTableViewCell createAddValueLabel](v4, "createAddValueLabel");
    -[HKMedicalIDNoValueTableViewCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v9) = 1132068864;
    objc_msgSend(v8, "setPriority:", v9);
    objc_msgSend(v8, "setActive:", 1);

  }
  return v5;
}

- (void)createAddValueLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
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
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
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
  id v40;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKMedicalIDNoValueTableViewCell setAddValueLabel:](self, "setAddValueLabel:", v4);

  -[HKMedicalIDNoValueTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  HKHealthKeyColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 1, v12);

  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v22, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = 1144750080;
  objc_msgSend(v23, "setPriority:", v24);
  objc_msgSend(v23, "setActive:", 1);
  -[HKMedicalIDNoValueTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v28, 1.0);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v29) = 1144750080;
  objc_msgSend(v40, "setPriority:", v29);
  objc_msgSend(v40, "setActive:", 1);
  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v33, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[HKMedicalIDNoValueTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDNoValueTableViewCell addValueLabel](self, "addValueLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v38, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

}

- (UILabel)addValueLabel
{
  return self->_addValueLabel;
}

- (void)setAddValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_addValueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addValueLabel, 0);
}

@end
