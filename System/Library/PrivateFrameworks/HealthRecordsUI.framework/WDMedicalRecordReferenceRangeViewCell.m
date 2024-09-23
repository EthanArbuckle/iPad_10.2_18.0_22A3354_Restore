@implementation WDMedicalRecordReferenceRangeViewCell

- (void)setupSubviews
{
  HRExpandedRangeValueView *v3;
  HRExpandedRangeValueView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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

  v51.receiver = self;
  v51.super_class = (Class)WDMedicalRecordReferenceRangeViewCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v51, sel_setupSubviews);
  v3 = [HRExpandedRangeValueView alloc];
  v4 = -[HRExpandedRangeValueView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[WDMedicalRecordReferenceRangeViewCell setExpandedRangeValueView:](self, "setExpandedRangeValueView:", v4);

  -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordReferenceRangeViewCell setSubtitleLabel:](self, "setSubtitleLabel:", v8);

  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 16.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 8.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, -3.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, -16.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -12.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

}

- (void)setValueInRange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D2F828], "referenceRangeViewDataFromInspectableValueInRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WDMedicalRecordReferenceRangeViewCell expandedRangeValueView](self, "expandedRangeValueView");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateWithData:](v6, "updateWithData:", v5);
LABEL_5:

    goto LABEL_6;
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
  {
    v6 = v7;
    HKSensitiveLogItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1BC30A000, v6, OS_LOG_TYPE_INFO, "Unable to use %{public}@ as data source for our reference range view", (uint8_t *)&v9, 0xCu);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)setSubtitle:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  NSString *subtitle;
  void *v9;
  id v10;

  v10 = a3;
  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    subtitle = self->_subtitle;
    -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", subtitle);

  }
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordReferenceRangeViewCell subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (HKInspectableValueInRange)valueInRange
{
  return self->_valueInRange;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (HRExpandedRangeValueView)expandedRangeValueView
{
  return self->_expandedRangeValueView;
}

- (void)setExpandedRangeValueView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedRangeValueView, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_expandedRangeValueView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_valueInRange, 0);
}

@end
