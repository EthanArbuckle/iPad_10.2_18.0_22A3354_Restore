@implementation WDMedicalRecordStandaloneImageCell

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
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
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  objc_super v89;

  v89.receiver = self;
  v89.super_class = (Class)WDMedicalRecordStandaloneImageCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v89, sel_setupSubviews);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[WDMedicalRecordStandaloneImageCell setDisclosureChevronView:](self, "setDisclosureChevronView:", v3);

  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3870], "hk_disclosureChevronImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1144750080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v8);

  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  -[WDMedicalRecordStandaloneImageCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordStandaloneImageCell setDetailLabel:](self, "setDetailLabel:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1148846080;
  objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);

  -[WDMedicalRecordStandaloneImageCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordStandaloneImageCell setTitleLabel:](self, "setTitleLabel:", v22);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v23);

  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNumberOfLines:", 0);

  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = 1144750080;
  objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 0, v28);

  -[WDMedicalRecordStandaloneImageCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  -[WDMedicalRecordStandaloneImageCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  v31 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[WDMedicalRecordStandaloneImageCell setTitleImageView:](self, "setTitleImageView:", v31);

  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 1144750080;
  objc_msgSend(v33, "setContentHuggingPriority:forAxis:", 0, v34);

  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = 1148846080;
  objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 0, v36);

  -[WDMedicalRecordStandaloneImageCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSubview:", v38);

  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -16.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:constant:", v52, 16.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell disclosureChevronView](self, "disclosureChevronView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, -16.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "firstBaselineAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "firstBaselineAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v67, 16.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v72, 16.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v77, 16.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "centerYAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setActive:", 1);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v87, 16.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setActive:", 1);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDetail:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)detail
{
  void *v2;
  void *v3;

  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitleImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImage)titleImage
{
  void *v2;
  void *v3;

  -[WDMedicalRecordStandaloneImageCell titleImageView](self, "titleImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDMedicalRecordStandaloneImageCell;
  -[WDMedicalRecordGroupableCell _updateForCurrentSizeCategory](&v8, sel__updateForCurrentSizeCategory);
  v3 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell detailLabel](self, "detailLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordStandaloneImageCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (UIImageView)disclosureChevronView
{
  return self->_disclosureChevronView;
}

- (void)setDisclosureChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureChevronView, a3);
}

- (UIImageView)titleImageView
{
  return self->_titleImageView;
}

- (void)setTitleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_titleImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_disclosureChevronView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
