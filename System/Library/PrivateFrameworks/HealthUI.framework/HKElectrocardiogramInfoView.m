@implementation HKElectrocardiogramInfoView

- (HKElectrocardiogramInfoView)initWithFrame:(CGRect)a3
{
  HKElectrocardiogramInfoView *v3;
  uint64_t v4;
  UILabel *heartRateLabel;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UILabel *bodyLabel;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramInfoView;
  v3 = -[HKElectrocardiogramInfoView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_hkecg_heartRateLabel");
    v4 = objc_claimAutoreleasedReturnValue();
    heartRateLabel = v3->_heartRateLabel;
    v3->_heartRateLabel = (UILabel *)v4;

    v6 = (void *)MEMORY[0x1E0CB3940];
    -[HKElectrocardiogramInfoView suffixForElementWithString:](v3, "suffixForElementWithString:", CFSTR("AvgHR"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "healthAccessibilityIdentifier:suffix:", 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v3->_heartRateLabel, "setAccessibilityIdentifier:", v8);

    objc_msgSend(MEMORY[0x1E0DC3990], "_hkecg_bodyLabel");
    v9 = objc_claimAutoreleasedReturnValue();
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = (UILabel *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    -[HKElectrocardiogramInfoView suffixForElementWithString:](v3, "suffixForElementWithString:", CFSTR("Classification.Description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "healthAccessibilityIdentifier:suffix:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v3->_bodyLabel, "setAccessibilityIdentifier:", v13);

    -[HKElectrocardiogramInfoView _addSubviews](v3, "_addSubviews");
  }
  return v3;
}

- (id)suffixForElementWithString:(id)a3
{
  return (id)objc_msgSend(CFSTR("SessionDetails"), "stringByAppendingFormat:", CFSTR(".%@"), a3);
}

- (NSString)heartRateText
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setHeartRateText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HKElectrocardiogramInfoView arrangedSubviews](self, "arrangedSubviews");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

}

- (NSString)bodyText
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setBodyText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HKElectrocardiogramInfoView arrangedSubviews](self, "arrangedSubviews");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramInfoView;
  -[HKElectrocardiogramInfoView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HKElectrocardiogramInfoView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v3 = objc_alloc(MEMORY[0x1E0DC37F8]);
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = (void *)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x1E0DC4A88]);
  objc_msgSend(v5, "scaledValueForValue:", 10.0);
  v7 = v6;
  -[HKElectrocardiogramInfoView heartRateLabelLeadingConstraint](self, "heartRateLabelLeadingConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  -[HKElectrocardiogramInfoView heartRateFirstBaselineConstraint](self, "heartRateFirstBaselineConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "scaledValueForValue:", 40.0);
    v11 = v10;
    -[HKElectrocardiogramInfoView heartRateFirstBaselineConstraint](self, "heartRateFirstBaselineConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v11);

  }
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineHeight");
  v15 = v14;
  -[HKElectrocardiogramInfoView heartImageViewHeightConstraint](self, "heartImageViewHeightConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v15);

  v17.receiver = self;
  v17.super_class = (Class)HKElectrocardiogramInfoView;
  -[HKElectrocardiogramInfoView updateConstraints](&v17, sel_updateConstraints);

}

- (void)_addSubviews
{
  void *v3;
  id v4;

  -[HKElectrocardiogramInfoView setAxis:](self, "setAxis:", 1);
  -[HKElectrocardiogramInfoView setDistribution:](self, "setDistribution:", 0);
  -[HKElectrocardiogramInfoView setAlignment:](self, "setAlignment:", 0);
  -[HKElectrocardiogramInfoView _heartRateView](self, "_heartRateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView addArrangedSubview:](self, "addArrangedSubview:", v3);

  -[HKElectrocardiogramInfoView _bodyView](self, "_bodyView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView addArrangedSubview:](self, "addArrangedSubview:", v4);

}

- (id)_heartRateView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  _QWORD v48[10];

  v48[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  v46 = v4;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("heart.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

  objc_msgSend(v5, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", 11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v8);

  objc_msgSend(v3, "addSubview:", v5);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v10);

  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView setHeartRateLabelLeadingConstraint:](self, "setHeartRateLabelLeadingConstraint:", v14);

  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstBaselineAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView setHeartRateFirstBaselineConstraint:](self, "setHeartRateFirstBaselineConstraint:", v18);

  objc_msgSend(v5, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  objc_msgSend(v19, "constraintEqualToConstant:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView setHeartImageViewHeightConstraint:](self, "setHeartImageViewHeightConstraint:", v20);

  v36 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramInfoView heartRateFirstBaselineConstraint](self, "heartRateFirstBaselineConstraint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v45;
  -[HKElectrocardiogramInfoView heartImageViewHeightConstraint](self, "heartImageViewHeightConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v44;
  objc_msgSend(v5, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v40;
  v21 = v3;
  objc_msgSend(v3, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v35;
  objc_msgSend(v5, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v32;
  objc_msgSend(v5, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v23;
  -[HKElectrocardiogramInfoView heartRateLabelLeadingConstraint](self, "heartRateLabelLeadingConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v24;
  objc_msgSend(v21, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView heartRateLabel](self, "heartRateLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v29);

  objc_msgSend(v21, "setHidden:", 1);
  return v21;
}

- (id)_bodyView
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[9];

  v35[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[HKSeparatorLineView _hkecg_separatorView](HKSeparatorLineView, "_hkecg_separatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:");
  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v5);

  v22 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4;
  objc_msgSend(v4, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v28;
  objc_msgSend(v3, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v23;
  objc_msgSend(v3, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v19;
  objc_msgSend(v4, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v16;
  objc_msgSend(v3, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v9;
  objc_msgSend(v3, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramInfoView bodyLabel](self, "bodyLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v14);

  objc_msgSend(v3, "setHidden:", 1);
  return v3;
}

- (UILabel)heartRateLabel
{
  return self->_heartRateLabel;
}

- (void)setHeartRateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (NSLayoutConstraint)heartRateLabelLeadingConstraint
{
  return self->_heartRateLabelLeadingConstraint;
}

- (void)setHeartRateLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)heartRateFirstBaselineConstraint
{
  return self->_heartRateFirstBaselineConstraint;
}

- (void)setHeartRateFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)heartImageViewHeightConstraint
{
  return self->_heartImageViewHeightConstraint;
}

- (void)setHeartImageViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heartImageViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_heartRateFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_heartRateLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_heartRateLabel, 0);
}

@end
