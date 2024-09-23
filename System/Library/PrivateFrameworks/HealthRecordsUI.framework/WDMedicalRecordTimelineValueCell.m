@implementation WDMedicalRecordTimelineValueCell

- (void)setupSubviews
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  double v75;
  void *v76;
  double v77;
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
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  objc_super v120;

  v120.receiver = self;
  v120.super_class = (Class)WDMedicalRecordTimelineValueCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v120, sel_setupSubviews);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelineValueCell setTitleLabel:](self, "setTitleLabel:", v3);

  objc_msgSend((id)objc_opt_class(), "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 8);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 5);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordTimelineValueCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelineValueCell setSubtitleLabel:](self, "setSubtitleLabel:", v13);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordTimelineValueCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelineValueCell setValueLabel:](self, "setValueLabel:", v21);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 3);

  objc_msgSend((id)objc_opt_class(), "_valueLabelFontSingleLine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v23);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalRecordValueColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordTimelineValueCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 16.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 7.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstBaselineAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstBaselineAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 16.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setValueLeftAlignConstraint:](self, "setValueLeftAlignConstraint:", v49);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, -16.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setValueRightAlignConstraint:](self, "setValueRightAlignConstraint:", v54);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:constant:", v58, -16.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setTitleValueGapConstraint:](self, "setTitleValueGapConstraint:", v59);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToConstant:", 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setTitleWidthConstraint:](self, "setTitleWidthConstraint:", v62);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "widthAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToConstant:", 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setValueWidthConstraint:](self, "setValueWidthConstraint:", v65);

  -[WDMedicalRecordTimelineValueCell titleWidthConstraint](self, "titleWidthConstraint");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell valueWidthConstraint](self, "valueWidthConstraint");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToConstant:", 0.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setTitleHeightConstraint:](self, "setTitleHeightConstraint:", v70);

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToConstant:", 0.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setValueHeightConstraint:](self, "setValueHeightConstraint:", v73);

  -[WDMedicalRecordTimelineValueCell titleHeightConstraint](self, "titleHeightConstraint");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v75) = 1148829696;
  objc_msgSend(v74, "setPriority:", v75);

  -[WDMedicalRecordTimelineValueCell valueHeightConstraint](self, "valueHeightConstraint");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = 1148829696;
  objc_msgSend(v76, "setPriority:", v77);

  -[WDMedicalRecordTimelineValueCell titleHeightConstraint](self, "titleHeightConstraint");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell valueHeightConstraint](self, "valueHeightConstraint");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, 16.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v88, -16.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "bottomAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v93, -12.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "bottomAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:constant:", v98, 2.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setActive:", 1);

  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintGreaterThanOrEqualToAnchor:constant:", v103, 2.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setActive:", 1);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintGreaterThanOrEqualToAnchor:constant:", v108, 10.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setActive:", 1);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "bottomAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "bottomAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintGreaterThanOrEqualToAnchor:constant:", v113, 10.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setActive:", 1);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "lastBaselineAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintGreaterThanOrEqualToAnchor:constant:", v118, 12.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell setSubtitleBottomConstraint:](self, "setSubtitleBottomConstraint:", v119);

}

- (void)updateConstraints
{
  void *v3;
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)WDMedicalRecordTimelineValueCell;
  -[WDMedicalRecordTimelineValueCell updateConstraints](&v19, sel_updateConstraints);
  -[WDMedicalRecordTimelineValueCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v4 = CGRectGetWidth(v20) + -32.0;

  -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", v4 * 0.67 + -16.0, 1.79769313e308);
  v7 = v6;
  v9 = v8;

  -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v4 - v7 + -48.0, 1.79769313e308);
  v12 = v11;
  v14 = v13;

  -[WDMedicalRecordTimelineValueCell titleWidthConstraint](self, "titleWidthConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v12);

  -[WDMedicalRecordTimelineValueCell valueWidthConstraint](self, "valueWidthConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v7);

  -[WDMedicalRecordTimelineValueCell titleHeightConstraint](self, "titleHeightConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v14);

  -[WDMedicalRecordTimelineValueCell valueHeightConstraint](self, "valueHeightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v9);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *titleString;
  NSString *v7;
  void *v8;
  NSUInteger v9;
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
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    titleString = self->_titleString;
    self->_titleString = v5;

    v7 = self->_titleString;
    -[WDMedicalRecordTimelineValueCell titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    v9 = -[NSString length](self->_titleString, "length");
    v10 = (void *)MEMORY[0x1E0CB3718];
    if (v9)
    {
      -[WDMedicalRecordTimelineValueCell valueLeftAlignConstraint](self, "valueLeftAlignConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deactivateConstraints:", v12);

      v13 = (void *)MEMORY[0x1E0CB3718];
      -[WDMedicalRecordTimelineValueCell valueRightAlignConstraint](self, "valueRightAlignConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v14;
      -[WDMedicalRecordTimelineValueCell titleValueGapConstraint](self, "titleValueGapConstraint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "activateConstraints:", v16);

    }
    else
    {
      -[WDMedicalRecordTimelineValueCell valueRightAlignConstraint](self, "valueRightAlignConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      -[WDMedicalRecordTimelineValueCell titleValueGapConstraint](self, "titleValueGapConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deactivateConstraints:", v19);

      v20 = (void *)MEMORY[0x1E0CB3718];
      -[WDMedicalRecordTimelineValueCell valueLeftAlignConstraint](self, "valueLeftAlignConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v15);
    }

    -[WDMedicalRecordTimelineValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[WDMedicalRecordTimelineValueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return self->_titleString;
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitleString;
  NSString *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v10, "copy");
    subtitleString = self->_subtitleString;
    self->_subtitleString = v4;

    v6 = self->_subtitleString;
    -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    v8 = -[NSString length](self->_subtitleString, "length") != 0;
    -[WDMedicalRecordTimelineValueCell subtitleBottomConstraint](self, "subtitleBottomConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", v8);

    -[WDMedicalRecordTimelineValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[WDMedicalRecordTimelineValueCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitle
{
  return self->_subtitleString;
}

- (id)value
{
  return self->_valueString;
}

- (id)unit
{
  return self->_unitString;
}

- (void)setValue:(id)a3 unit:(id)a4
{
  id v6;
  NSString *v7;
  NSString *valueString;
  NSString *v9;
  NSString *unitString;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!-[NSString isEqualToString:](self->_valueString, "isEqualToString:", v13)
    || !-[NSString isEqualToString:](self->_unitString, "isEqualToString:", v6))
  {
    v7 = (NSString *)objc_msgSend(v13, "copy");
    valueString = self->_valueString;
    self->_valueString = v7;

    v9 = (NSString *)objc_msgSend(v6, "copy");
    unitString = self->_unitString;
    self->_unitString = v9;

    -[WDMedicalRecordTimelineValueCell _generateValueDisplayAttributedString](self, "_generateValueDisplayAttributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordTimelineValueCell valueLabel](self, "valueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v11);

    -[WDMedicalRecordTimelineValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordTimelineValueCell subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (id)_generateValueDisplayAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGRect v22;
  CGRect v23;

  objc_msgSend((id)objc_opt_class(), "_valueLabelFontSingleLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_unitLabelFontSingleLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell _generateValueDisplayAttributedStringWithValueFont:unitFont:](self, "_generateValueDisplayAttributedStringWithValueFont:unitFont:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineValueCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (CGRectGetWidth(v22) + -32.0) * 0.67 + -16.0;

  objc_msgSend(v5, "boundingRectWithSize:options:context:", 1, 0, v7, 1.79769313e308);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v3, "lineHeight");
  v17 = v16;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  if (CGRectGetHeight(v23) + v17 * -2.0 >= 2.22044605e-16)
  {
    objc_msgSend((id)objc_opt_class(), "_valueLabelFontMultipleLines");
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_unitLabelFontMultipleLines");
    v19 = objc_claimAutoreleasedReturnValue();

    -[WDMedicalRecordTimelineValueCell _generateValueDisplayAttributedStringWithValueFont:unitFont:](self, "_generateValueDisplayAttributedStringWithValueFont:unitFont:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v20;
    v4 = (void *)v19;
    v3 = (void *)v18;
  }

  return v5;
}

- (id)_generateValueDisplayAttributedStringWithValueFont:(id)a3 unitFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDMedicalRecordTimelineValueCell value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = (_QWORD *)MEMORY[0x1E0DC1138];
  v11 = (uint64_t *)MEMORY[0x1E0DC1140];
  v12 = &stru_1E74EA150;
  if (v9)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[WDMedicalRecordTimelineValueCell value](self, "value");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v12 = (const __CFString *)v14;
    v16 = *v11;
    v42[0] = *v10;
    v42[1] = v16;
    v43[0] = v36;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalRecordValueColor", v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v13, "initWithString:attributes:", v12, v18);

    v11 = (uint64_t *)MEMORY[0x1E0DC1140];
    objc_msgSend(v7, "addObject:", v19);

  }
  -[WDMedicalRecordTimelineValueCell unit](self, "unit", v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    if (objc_msgSend(v7, "count"))
    {
      v22 = objc_alloc(MEMORY[0x1E0CB3498]);
      v23 = *v10;
      v40 = *v10;
      v41 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "initWithString:attributes:", CFSTR(" "), v24);

      objc_msgSend(v7, "addObject:", v25);
    }
    else
    {
      v23 = *v10;
    }
    v26 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[WDMedicalRecordTimelineValueCell unit](self, "unit");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = &stru_1E74EA150;
    v30 = *v11;
    v38[0] = v23;
    v38[1] = v30;
    v39[0] = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalRecordUnitColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v26, "initWithString:attributes:", v29, v32);

    objc_msgSend(v7, "addObject:", v33);
  }
  if (objc_msgSend(v7, "count"))
  {
    HKUIJoinAttributedStringsForLocale();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)_titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:design:variant:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC13A8], 1024);
}

+ (double)_titleLabelTopToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 27.0);
  v4 = v3;

  return v4;
}

+ (id)_valueLabelFontSingleLine
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:design:weight:", *MEMORY[0x1E0DC4B50], 0x8000, *MEMORY[0x1E0DC13A8], *MEMORY[0x1E0DC1448]);
}

+ (id)_unitLabelFontSingleLine
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:weight:", *MEMORY[0x1E0DC4B10], 0x8000, *MEMORY[0x1E0DC1448]);
}

+ (id)_valueLabelFontMultipleLines
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B60], 66560);
}

+ (id)_unitLabelFontMultipleLines
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
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

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (NSLayoutConstraint)titleWidthConstraint
{
  return self->_titleWidthConstraint;
}

- (void)setTitleWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleWidthConstraint, a3);
}

- (NSLayoutConstraint)valueWidthConstraint
{
  return self->_valueWidthConstraint;
}

- (void)setValueWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_valueWidthConstraint, a3);
}

- (NSLayoutConstraint)titleHeightConstraint
{
  return self->_titleHeightConstraint;
}

- (void)setTitleHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeightConstraint, a3);
}

- (NSLayoutConstraint)valueHeightConstraint
{
  return self->_valueHeightConstraint;
}

- (void)setValueHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_valueHeightConstraint, a3);
}

- (NSLayoutConstraint)titleValueGapConstraint
{
  return self->_titleValueGapConstraint;
}

- (void)setTitleValueGapConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleValueGapConstraint, a3);
}

- (NSLayoutConstraint)valueLeftAlignConstraint
{
  return self->_valueLeftAlignConstraint;
}

- (void)setValueLeftAlignConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_valueLeftAlignConstraint, a3);
}

- (NSLayoutConstraint)valueRightAlignConstraint
{
  return self->_valueRightAlignConstraint;
}

- (void)setValueRightAlignConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_valueRightAlignConstraint, a3);
}

- (NSLayoutConstraint)subtitleBottomConstraint
{
  return self->_subtitleBottomConstraint;
}

- (void)setSubtitleBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_valueRightAlignConstraint, 0);
  objc_storeStrong((id *)&self->_valueLeftAlignConstraint, 0);
  objc_storeStrong((id *)&self->_titleValueGapConstraint, 0);
  objc_storeStrong((id *)&self->_valueHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleHeightConstraint, 0);
  objc_storeStrong((id *)&self->_valueWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
