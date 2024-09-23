@implementation HKElectrocardiogramCardView

- (HKElectrocardiogramCardView)initWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6 isSampleInteractive:(BOOL)a7
{
  id v13;
  id v14;
  HKElectrocardiogramCardView *v15;
  HKElectrocardiogramCardView *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKElectrocardiogramCardView;
  v15 = -[HKElectrocardiogramCardView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sample, a3);
    objc_storeWeak((id *)&v16->_dateCache, v14);
    v16->_onboarding = a5;
    v16->_activeAlgorithmVersion = a6;
    v16->_isSampleInteractive = a7;
    -[HKElectrocardiogramCardView _setupUI](v16, "_setupUI");
    -[HKElectrocardiogramCardView _setupConstraints](v16, "_setupConstraints");
    -[HKElectrocardiogramCardView updateUI](v16, "updateUI");
    -[HKElectrocardiogramCardView _setUpGraph](v16, "_setUpGraph");
  }

  return v16;
}

- (void)setActiveAlgorithmVersion:(int64_t)a3
{
  self->_activeAlgorithmVersion = a3;
  -[HKElectrocardiogramCardView updateUI](self, "updateUI");
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
  -[HKElectrocardiogramCardView updateUI](self, "updateUI");
  -[HKElectrocardiogramCardView _setUpGraph](self, "_setUpGraph");
}

+ (double)estimatedHeight
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  +[HKRoundedHeaderView estimatedHeight](HKRoundedHeaderView, "estimatedHeight");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "_headerBottomToAverageHeartRateBaseline");
  v5 = v3 + v4;
  objc_msgSend((id)objc_opt_class(), "_averageHeartRateBaselineToGraphTop");
  v7 = v5 + v6;
  objc_msgSend((id)objc_opt_class(), "_graphHeight");
  v9 = v7 + v8;
  objc_msgSend((id)objc_opt_class(), "_graphBottomToCardBottom");
  return v9 + v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramCardView;
  -[HKElectrocardiogramCardView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[HKElectrocardiogramCardView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8
    || (-[HKElectrocardiogramCardView traitCollection](self, "traitCollection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hasDifferentColorAppearanceComparedToTraitCollection:", v4),
        v9,
        v10))
  {
    -[HKElectrocardiogramCardView updateUI](self, "updateUI");
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramCardView;
  -[HKElectrocardiogramCardView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HKElectrocardiogramCardView updateUI](self, "updateUI");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKElectrocardiogramCardView dateCache](self, "dateCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramCardView;
  -[HKElectrocardiogramCardView dealloc](&v4, sel_dealloc);
}

- (void)_setupUI
{
  void *v3;
  void *v4;
  HKRoundedHeaderView *v5;
  void *v6;
  HKRoundedHeaderView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HKElectrocardiogramGridOptions *v54;
  void *v55;
  HKElectrocardiogramGridOptions *v56;
  HKElectrocardiogramChartView *v57;
  void *v58;
  HKElectrocardiogramChartView *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HKElectrocardiogramCardView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[HKElectrocardiogramCardView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  v5 = [HKRoundedHeaderView alloc];
  -[HKElectrocardiogramCardView _cardHeaderColor](self, "_cardHeaderColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKRoundedHeaderView initWithColor:isInteractive:](v5, "initWithColor:isInteractive:", v6, self->_isSampleInteractive);
  -[HKElectrocardiogramCardView setHeaderView:](self, "setHeaderView:", v7);

  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 1);

  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpaque:", 1);

  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Card.Header"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v11);

  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView addSubview:](self, "addSubview:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[HKElectrocardiogramCardView setCellBackgroundView:](self, "setCellBackgroundView:", v14);

  -[HKElectrocardiogramCardView _cardBackgroundColor](self, "_cardBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClipsToBounds:", 1);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", 10.0);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaskedCorners:", 12);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView addSubview:](self, "addSubview:", v23);

  v24 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[HKElectrocardiogramCardView setHeartImageView:](self, "setHeartImageView:", v24);

  v25 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "configurationWithFont:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPreferredSymbolConfiguration:", v27);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("heart.fill"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setImage:", v29);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "color");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTintColor:", v34);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView addSubview:](self, "addSubview:", v36);

  v37 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKElectrocardiogramCardView setAverageHeartRateLabel:](self, "setAverageHeartRateLabel:", v37);

  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setNumberOfLines:", 0);

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFont:", v39);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTextColor:", v42);

  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView addSubview:](self, "addSubview:", v46);

  v47 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKElectrocardiogramCardView setSymptomsLabel:](self, "setSymptomsLabel:", v47);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setNumberOfLines:", 1);

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFont:", v49);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView addSubview:](self, "addSubview:", v53);

  v54 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v54, "initWithUnitMultiple:axis:lineColor:lineWidth:", (uint64_t)(1.0 / 0.04), 2, v55, HKUIFloorToScreenScale(0.5));

  v57 = [HKElectrocardiogramChartView alloc];
  v73[0] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[HKElectrocardiogramChartView initWithGridSize:gridOptions:](v57, "initWithGridSize:gridOptions:", v58, 4.0, 4.0);
  -[HKElectrocardiogramCardView setGraphView:](self, "setGraphView:", v59);

  objc_msgSend(v33, "color");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setTintColor:", v60);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setEdgeMaskEnabled:", 1);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "layer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setCornerRadius:", 5.0);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setMasksToBounds:", 1);

  v68 = HKUICeilToScreenScale(0.5);
  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "layer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setBorderWidth:", v68);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView addSubview:](self, "addSubview:", v71);

  -[HKElectrocardiogramCardView dateCache](self, "dateCache");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "registerObserver:", self);

}

- (void)_setupConstraints
{
  void *v3;
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
  double v40;
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
  double v57;
  void *v58;
  double v59;
  id v60;
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
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
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
  double v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;

  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_alignHorizontalConstraintsWithView:margin:", v9, 0.0);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_graphBottomToCardBottom");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textHorizontalInset");
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lineHeight");
  objc_msgSend(v32, "constraintEqualToConstant:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setHeartImageViewHeightConstraint:](self, "setHeartImageViewHeightConstraint:", v34);

  -[HKElectrocardiogramCardView heartImageViewHeightConstraint](self, "heartImageViewHeightConstraint");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v125 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v40) = 1148846080;
  objc_msgSend(v125, "setPriority:", v40);
  objc_msgSend(v125, "setActive:", 1);
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView heartImageView](self, "heartImageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 6.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "firstBaselineAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setAverageHeartRateLabelFirstBaselineConstraint:](self, "setAverageHeartRateLabelFirstBaselineConstraint:", v50);

  -[HKElectrocardiogramCardView averageHeartRateLabelFirstBaselineConstraint](self, "averageHeartRateLabelFirstBaselineConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView widthAnchor](self, "widthAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:multiplier:", v54, 0.34);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setAverageHeartRateLabelWidthConstraint:](self, "setAverageHeartRateLabelWidthConstraint:", v55);

  -[HKElectrocardiogramCardView averageHeartRateLabelWidthConstraint](self, "averageHeartRateLabelWidthConstraint");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = 1144750080;
  objc_msgSend(v56, "setPriority:", v57);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v59) = 1148846080;
  objc_msgSend(v58, "setContentCompressionResistancePriority:forAxis:", 0, v59);

  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v64, 16.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v65);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "textHorizontalInset");
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, -v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v72);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "firstBaselineAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "lastBaselineAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v77);

  v78 = (void *)objc_msgSend(v60, "copy");
  -[HKElectrocardiogramCardView setRegularConstraints:](self, "setRegularConstraints:", v78);

  v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "textHorizontalInset");
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, -v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v86);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v91);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v96);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "firstBaselineAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "lastBaselineAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setSymptomsLabelFirstBaselineConstraint:](self, "setSymptomsLabelFirstBaselineConstraint:", v101);

  -[HKElectrocardiogramCardView symptomsLabelFirstBaselineConstraint](self, "symptomsLabelFirstBaselineConstraint");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v102);

  v103 = (void *)objc_msgSend(v79, "copy");
  -[HKElectrocardiogramCardView setLargeTextConstraints:](self, "setLargeTextConstraints:", v103);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "leftAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "leftAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "textHorizontalInset");
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v107);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setActive:", 1);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "rightAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "rightAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "textHorizontalInset");
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v113, -v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setActive:", 1);

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "heightAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_graphHeight");
  objc_msgSend(v118, "constraintEqualToConstant:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v120) = 1144750080;
  objc_msgSend(v119, "setPriority:", v120);
  objc_msgSend(v119, "setActive:", 1);
  -[HKElectrocardiogramCardView bottomAnchor](self, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setActive:", 1);

  -[HKElectrocardiogramCardView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_setUpGraph
{
  void *v3;
  id v4;

  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayElectrocardiogram:allowsScrolling:", v3, 0);

}

- (void)updateUI
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
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
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  __CFString *v92;

  -[HKElectrocardiogramCardView sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKElectrocardiogramCardView sample](self, "sample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_localizedClassificationWithActiveAlgorithmVersion:", -[HKElectrocardiogramCardView activeAlgorithmVersion](self, "activeAlgorithmVersion"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = v5;
    else
      v6 = CFSTR(" ");
    v7 = v5;
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v6);

    -[HKElectrocardiogramCardView _cardHeaderColor](self, "_cardHeaderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v9);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView dateCache](self, "dateCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKLastUpdatedText(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDetailText:", v14);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_classificationTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v17);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_timeStampTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDetailTextColor:", v21);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_timeStampCompositingFilter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDetailTextCompositingFilter:", v24);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hk_localizedAverageBPM");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v27);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hk_BPMTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v31);

    v33 = (void *)objc_opt_class();
    -[HKElectrocardiogramCardView sample](self, "sample");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_averageHeartRateSymptomsFontForElectrocardiogram:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFont:", v35);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hk_localizedUppercaseNumSymptoms");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v38);

    -[HKElectrocardiogramCardView sample](self, "sample");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hk_numSymptomsTextColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTextColor:", v42);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("ECG_CARD_LOADING_TEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v46;
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setText:", v7);

    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDetailText:", CFSTR(" "));

    objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultCardHeaderColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setColor:", v49);

    objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultClassificationTextColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTextColor:", v52);

    objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultTimeStampTextColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setDetailTextColor:", v55);

    objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultTimeStampCompositingFilter");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView headerView](self, "headerView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setDetailTextCompositingFilter:", v57);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("NO_AVERAGE_BEATS_PER_MINUTE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setText:", v61);

    objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultBPMTextColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTextColor:", v64);

    objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setFont:", v66);

    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setText:", CFSTR(" "));

    objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultNumSymptomsTextColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextColor:", v41);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Card.AverageBPM"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAccessibilityIdentifier:", v69);

  -[HKElectrocardiogramCardView _chevronColor](self, "_chevronColor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setChevronColor:", v71);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v74 = objc_msgSend(v73, "CGColor");
  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "layer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setBorderColor:", v74);

  -[HKElectrocardiogramCardView _graphBackgroundColor](self, "_graphBackgroundColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setBackgroundColor:", v77);

  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Card"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v80 = v7;
  else
    v80 = CFSTR("UndeterminedType");
  v92 = (__CFString *)v80;
  objc_msgSend(v79, "stringByAppendingFormat:", CFSTR(".%@.SessionResult"), v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v81);

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[HKElectrocardiogramCardView layer](self, "layer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setMaskedCorners:", 15);

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramChartBorderColor");
    v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v84 = objc_msgSend(v83, "CGColor");
    -[HKElectrocardiogramCardView layer](self, "layer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setBorderColor:", v84);

    v86 = HKUICeilToScreenScale(0.5);
    -[HKElectrocardiogramCardView layer](self, "layer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setBorderWidth:", v86);

    -[HKElectrocardiogramCardView layer](self, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setCornerRadius:", 12.0);
  }
  else
  {
    -[HKElectrocardiogramCardView cellBackgroundView](self, "cellBackgroundView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "layer");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setMaskedCorners:", 12);

    -[HKElectrocardiogramCardView layer](self, "layer");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setBorderColor:", 0);

    -[HKElectrocardiogramCardView layer](self, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setBorderWidth:", 0.0);
  }

  -[HKElectrocardiogramCardView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_updateTextConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v3 = -[HKElectrocardiogramCardView _isLayingOutForAccessibility](self, "_isLayingOutForAccessibility");
  -[HKElectrocardiogramCardView averageHeartRateLabelWidthConstraint](self, "averageHeartRateLabelWidthConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setActive:", 0);

    objc_msgSend((id)objc_opt_class(), "_averageHeartRateBaselineToSymptomBaseline");
    v7 = v6;
    -[HKElectrocardiogramCardView symptomsLabelFirstBaselineConstraint](self, "symptomsLabelFirstBaselineConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v7);

    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "setActive:", 1);

    -[HKElectrocardiogramCardView symptomsLabelFirstBaselineConstraint](self, "symptomsLabelFirstBaselineConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", 0.0);

    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
  }
  objc_msgSend(v9, "setNumberOfLines:", v11);

  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_copyNonEmptyString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[HKElectrocardiogramCardView averageHeartRateLabelWidthConstraint](self, "averageHeartRateLabelWidthConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 0);

  }
  objc_msgSend((id)objc_opt_class(), "_headerBottomToAverageHeartRateBaseline");
  v18 = v17;
  -[HKElectrocardiogramCardView averageHeartRateLabelFirstBaselineConstraint](self, "averageHeartRateLabelFirstBaselineConstraint");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", v18);

}

- (void)_updateGraphTopConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[HKElectrocardiogramCardView sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_localizedUppercaseNumSymptoms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_copyNonEmptyString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKElectrocardiogramCardView graphTopConstraint](self, "graphTopConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKElectrocardiogramCardView graphTopConstraint](self, "graphTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    -[HKElectrocardiogramCardView setGraphTopConstraint:](self, "setGraphTopConstraint:", 0);
  }
  if (v5)
    -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  else
    -[HKElectrocardiogramCardView averageHeartRateLabel](self, "averageHeartRateLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastBaselineAnchor");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateBaselineToGraphTop");
  v10 = v9;
  objc_msgSend((id)objc_opt_class(), "_graphBottomToCardBottom");
  v12 = v11;
  v13 = (void *)objc_opt_class();
  if (v10 >= v12)
    objc_msgSend(v13, "_averageHeartRateBaselineToGraphTop");
  else
    objc_msgSend(v13, "_graphBottomToCardBottom");
  v15 = v14;
  -[HKElectrocardiogramCardView graphView](self, "graphView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView setGraphTopConstraint:](self, "setGraphTopConstraint:", v18);

  -[HKElectrocardiogramCardView graphTopConstraint](self, "graphTopConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  int64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[HKElectrocardiogramCardView _updateTextConstraints](self, "_updateTextConstraints");
  -[HKElectrocardiogramCardView _updateGraphTopConstraint](self, "_updateGraphTopConstraint");
  objc_msgSend((id)objc_opt_class(), "_accessibilityContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIView hk_trailingTextAlignmentAtOrBelowSizeCategory:](self, "hk_trailingTextAlignmentAtOrBelowSizeCategory:", v3);
  -[HKElectrocardiogramCardView symptomsLabel](self, "symptomsLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", v4);

  v6 = -[HKElectrocardiogramCardView _isLayingOutForAccessibility](self, "_isLayingOutForAccessibility");
  v7 = (void *)MEMORY[0x1E0CB3718];
  if (v6)
  {
    -[HKElectrocardiogramCardView regularConstraints](self, "regularConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[HKElectrocardiogramCardView largeTextConstraints](self, "largeTextConstraints");
  }
  else
  {
    -[HKElectrocardiogramCardView largeTextConstraints](self, "largeTextConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v10);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[HKElectrocardiogramCardView regularConstraints](self, "regularConstraints");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v11);

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v13 = v12;
  -[HKElectrocardiogramCardView heartImageViewHeightConstraint](self, "heartImageViewHeightConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

}

+ (id)_accessibilityContentSizeCategory
{
  return (id)*MEMORY[0x1E0DC4900];
}

- (BOOL)_isLayingOutForAccessibility
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend((id)objc_opt_class(), "_accessibilityContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory(v3))
  {
    -[HKElectrocardiogramCardView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "horizontalSizeClass") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_averageHeartRateSymptomsTextStyle
{
  return (id)*MEMORY[0x1E0DC4AB8];
}

+ (id)_averageHeartRateSymptomsFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_averageHeartRateSymptomsBoldFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_averageHeartRateSymptomsFontForElectrocardiogram:(id)a3
{
  int v3;
  void *v4;

  v3 = objc_msgSend(a3, "hk_isBPMTextBold");
  v4 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v4, "_averageHeartRateSymptomsBoldFont");
  else
    objc_msgSend(v4, "_averageHeartRateSymptomsFont");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (double)_headerBottomToAverageHeartRateBaseline
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

+ (double)_averageHeartRateBaselineToSymptomBaseline
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

+ (double)_averageHeartRateBaselineToGraphTop
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_averageHeartRateSymptomsFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 12.0);
  v4 = v3;

  return v4;
}

+ (double)_graphHeight
{
  return 120.0;
}

+ (double)_graphBottomToCardBottom
{
  return 16.0;
}

- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HKElectrocardiogramCardView sample](self, "sample", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView dateCache](self, "dateCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedText(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramCardView headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDetailText:", v7);

}

- (id)_cardHeaderColor
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[HKElectrocardiogramCardView sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_cardHeaderColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6650], "hk_abnormalCardHeaderColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB6650], "hk_abnormalCardHeaderColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[HKElectrocardiogramCardView isOnboarding](self, "isOnboarding"))
    {
      -[HKElectrocardiogramCardView sample](self, "sample");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_cardHeaderColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  return v8;
}

- (id)_chevronColor
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[HKElectrocardiogramCardView sample](self, "sample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_cardHeaderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6650], "hk_abnormalCardHeaderColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.3);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_cardBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[HKElectrocardiogramCardView isOnboarding](self, "isOnboarding"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKElectrocardiogramCardView sample](self, "sample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_cardBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6650], "hk_defaultCardBackgroundColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v7;

  }
  return v3;
}

- (id)_graphBackgroundColor
{
  if (-[HKElectrocardiogramCardView isOnboarding](self, "isOnboarding"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    -[HKElectrocardiogramCardView _cardBackgroundColor](self, "_cardBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (HKDateCache)dateCache
{
  return (HKDateCache *)objc_loadWeakRetained((id *)&self->_dateCache);
}

- (void)setDateCache:(id)a3
{
  objc_storeWeak((id *)&self->_dateCache, a3);
}

- (BOOL)isOnboarding
{
  return self->_onboarding;
}

- (void)setOnboarding:(BOOL)a3
{
  self->_onboarding = a3;
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (BOOL)isSampleInteractive
{
  return self->_isSampleInteractive;
}

- (HKRoundedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)cellBackgroundView
{
  return self->_cellBackgroundView;
}

- (void)setCellBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundView, a3);
}

- (UIImageView)heartImageView
{
  return self->_heartImageView;
}

- (void)setHeartImageView:(id)a3
{
  objc_storeStrong((id *)&self->_heartImageView, a3);
}

- (UILabel)averageHeartRateLabel
{
  return self->_averageHeartRateLabel;
}

- (void)setAverageHeartRateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRateLabel, a3);
}

- (UILabel)symptomsLabel
{
  return self->_symptomsLabel;
}

- (void)setSymptomsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsLabel, a3);
}

- (HKElectrocardiogramChartView)graphView
{
  return self->_graphView;
}

- (void)setGraphView:(id)a3
{
  objc_storeStrong((id *)&self->_graphView, a3);
}

- (NSLayoutConstraint)averageHeartRateLabelFirstBaselineConstraint
{
  return self->_averageHeartRateLabelFirstBaselineConstraint;
}

- (void)setAverageHeartRateLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRateLabelFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)averageHeartRateLabelWidthConstraint
{
  return self->_averageHeartRateLabelWidthConstraint;
}

- (void)setAverageHeartRateLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRateLabelWidthConstraint, a3);
}

- (NSLayoutConstraint)symptomsLabelFirstBaselineConstraint
{
  return self->_symptomsLabelFirstBaselineConstraint;
}

- (void)setSymptomsLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsLabelFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)graphTopConstraint
{
  return self->_graphTopConstraint;
}

- (void)setGraphTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_graphTopConstraint, a3);
}

- (NSLayoutConstraint)heartImageViewHeightConstraint
{
  return self->_heartImageViewHeightConstraint;
}

- (void)setHeartImageViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heartImageViewHeightConstraint, a3);
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularConstraints, a3);
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_heartImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphTopConstraint, 0);
  objc_storeStrong((id *)&self->_symptomsLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_averageHeartRateLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_averageHeartRateLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_symptomsLabel, 0);
  objc_storeStrong((id *)&self->_averageHeartRateLabel, 0);
  objc_storeStrong((id *)&self->_heartImageView, 0);
  objc_storeStrong((id *)&self->_cellBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_dateCache);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
