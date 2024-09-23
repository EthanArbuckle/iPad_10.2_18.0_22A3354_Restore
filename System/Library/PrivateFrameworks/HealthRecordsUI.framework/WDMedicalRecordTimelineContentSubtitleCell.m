@implementation WDMedicalRecordTimelineContentSubtitleCell

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  id v18;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  objc_super v78;

  v78.receiver = self;
  v78.super_class = (Class)WDMedicalRecordTimelineContentSubtitleCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v78, sel_setupSubviews);
  objc_msgSend(MEMORY[0x1E0DC3F10], "makeChevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell setDisclosureChevronView:](self, "setDisclosureChevronView:", v3);

  -[WDMedicalRecordTimelineContentSubtitleCell disclosureChevronView](self, "disclosureChevronView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell disclosureChevronView](self, "disclosureChevronView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelineContentSubtitleCell setTitleLabel:](self, "setTitleLabel:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4AD0], 256);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 8);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[WDMedicalRecordTimelineContentSubtitleCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelineContentSubtitleCell setSubtitleLabel:](self, "setSubtitleLabel:", v18);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v19);

  self->_useRegularFontForSubtitle = 0;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNumberOfLines:", 0);

  -[WDMedicalRecordTimelineContentSubtitleCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[WDMedicalRecordTimelineContentSubtitleCell disclosureChevronView](self, "disclosureChevronView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -16.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell disclosureChevronView](self, "disclosureChevronView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstBaselineAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "firstBaselineAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -16.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell setTitlePillConstraint:](self, "setTitlePillConstraint:", v41);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell disclosureChevronView](self, "disclosureChevronView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, -8.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell setTitleChevronConstraint:](self, "setTitleChevronConstraint:", v46);

  -[WDMedicalRecordTimelineContentSubtitleCell titlePillConstraint](self, "titlePillConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, 16.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, 10.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 16.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, 2.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setActive:", 1);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "lastBaselineAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v76, 12.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

}

- (void)setTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleString, a3);
  v5 = a3;
  -[WDMedicalRecordTimelineContentSubtitleCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (NSString)title
{
  return self->_titleString;
}

- (void)setSubtitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_subtitleString, a3);
  v5 = a3;
  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (NSString)subtitle
{
  return self->_subtitleString;
}

- (void)setShowDisclosureIndicator:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 showDisclosureIndicator;
  id v9;

  if (self->_showDisclosureIndicator != a3)
  {
    self->_showDisclosureIndicator = a3;
    v4 = !a3;
    -[WDMedicalRecordTimelineContentSubtitleCell disclosureChevronView](self, "disclosureChevronView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    v6 = !self->_showDisclosureIndicator;
    -[WDMedicalRecordTimelineContentSubtitleCell titlePillConstraint](self, "titlePillConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", v6);

    showDisclosureIndicator = self->_showDisclosureIndicator;
    -[WDMedicalRecordTimelineContentSubtitleCell titleChevronConstraint](self, "titleChevronConstraint");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", showDisclosureIndicator);

  }
}

- (void)setUseRegularFontForSubtitle:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (self->_useRegularFontForSubtitle != a3)
  {
    self->_useRegularFontForSubtitle = a3;
    if (a3)
    {
      v4 = *MEMORY[0x1E0DC4B10];
      v5 = 256;
    }
    else
    {
      v4 = *MEMORY[0x1E0DC4B10];
      v5 = 1280;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", v4, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

  }
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordTimelineContentSubtitleCell subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (BOOL)showDisclosureIndicator
{
  return self->_showDisclosureIndicator;
}

- (BOOL)useRegularFontForSubtitle
{
  return self->_useRegularFontForSubtitle;
}

- (NSUUID)currentSignedClinicalDataRecordIdentifier
{
  return self->_currentSignedClinicalDataRecordIdentifier;
}

- (void)setCurrentSignedClinicalDataRecordIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIView)disclosureChevronView
{
  return self->_disclosureChevronView;
}

- (void)setDisclosureChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureChevronView, a3);
}

- (NSLayoutConstraint)titlePillConstraint
{
  return self->_titlePillConstraint;
}

- (void)setTitlePillConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titlePillConstraint, a3);
}

- (NSLayoutConstraint)titleChevronConstraint
{
  return self->_titleChevronConstraint;
}

- (void)setTitleChevronConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleChevronConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleChevronConstraint, 0);
  objc_storeStrong((id *)&self->_titlePillConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureChevronView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_currentSignedClinicalDataRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
