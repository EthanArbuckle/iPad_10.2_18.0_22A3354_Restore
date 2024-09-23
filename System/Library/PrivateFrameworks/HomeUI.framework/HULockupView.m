@implementation HULockupView

- (HULockupView)initWithFrame:(CGRect)a3
{
  HULockupView *v3;
  HULockupView *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HUDownloadControl *v45;
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
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  HUExpandableTextView *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
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
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v177;
  void *v178;
  objc_super v179;
  _QWORD v180[2];
  uint64_t v181;
  uint64_t v182;
  _QWORD v183[2];
  _QWORD v184[5];

  v184[3] = *MEMORY[0x1E0C80C00];
  v179.receiver = self;
  v179.super_class = (Class)HULockupView;
  v3 = -[HULockupView initWithFrame:](&v179, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HULockupView setIconSize:](v3, "setIconSize:", 4);
    -[HULockupView initializeIconViewWithSize:](v4, "initializeIconViewWithSize:", -[HULockupView iconSize](v4, "iconSize"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView setIconView:](v4, "setIconView:", v5);

    -[HULockupView iconView](v4, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    objc_msgSend(v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", v9);

    objc_msgSend(v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 1.0);

    objc_msgSend(v7, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 10.0);

    -[HULockupView iconView](v4, "iconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v13);

    v14 = objc_alloc(MEMORY[0x1E0CEA700]);
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v19 = (void *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], v16, v17, v18);
    -[HULockupView setTitleLabel:](v4, "setTitleLabel:", v19);

    -[HULockupView titleLabel](v4, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULockupView titleLabel](v4, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);

    -[HULockupView titleLabel](v4, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMinimumScaleFactor:", 0.75);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView titleLabel](v4, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v15, v16, v17, v18);
    -[HULockupView setDetailLabel:](v4, "setDetailLabel:", v25);

    -[HULockupView detailLabel](v4, "detailLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = *MEMORY[0x1E0CEB548];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView detailLabel](v4, "detailLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFont:", v28);

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v15, v16, v17, v18);
    -[HULockupView setSecondaryDetailLabel:](v4, "setSecondaryDetailLabel:", v30);

    -[HULockupView secondaryDetailLabel](v4, "secondaryDetailLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView secondaryDetailLabel](v4, "secondaryDetailLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFont:", v32);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView secondaryDetailLabel](v4, "secondaryDetailLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextColor:", v34);

    v36 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[HULockupView titleLabel](v4, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = v37;
    -[HULockupView detailLabel](v4, "detailLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v184[1] = v38;
    -[HULockupView secondaryDetailLabel](v4, "secondaryDetailLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v184[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v36, "initWithArrangedSubviews:", v40);
    -[HULockupView setLabelStackView:](v4, "setLabelStackView:", v41);

    -[HULockupView labelStackView](v4, "labelStackView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setSpacing:", 2.0);

    -[HULockupView labelStackView](v4, "labelStackView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setAxis:", 1);

    -[HULockupView labelStackView](v4, "labelStackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v45 = objc_alloc_init(HUDownloadControl);
    -[HULockupView setDownloadControl:](v4, "setDownloadControl:", v45);

    -[HULockupView downloadControl](v4, "downloadControl");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULockupView downloadControl](v4, "downloadControl");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAllowsAddImage:", 0);

    -[HULockupView downloadControl](v4, "downloadControl");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDisplayStyle:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](v4, "downloadControl");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFilledTintColor:", v49);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](v4, "downloadControl");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTintColor:", v51);

    -[HULockupView downloadControl](v4, "downloadControl");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addTarget:action:forControlEvents:", v4, sel__buttonTapped_, 64);

    -[HULockupView downloadControl](v4, "downloadControl");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setControlStatus:animated:", 1, 0x3FF0000000000000, 0);

    -[HULockupView downloadControl](v4, "downloadControl");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateControlTitle_Update"), CFSTR("HUSoftwareUpdateControlTitle_Update"), 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTitle:forControlStatusType:", v56, 1);

    -[HULockupView _maxPossibleTitleLengthForDownloadControl](v4, "_maxPossibleTitleLengthForDownloadControl");
    v58 = v57;
    -[HULockupView downloadControl](v4, "downloadControl");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setMinTitleLength:", v58);

    -[HULockupView downloadControl](v4, "downloadControl");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "sizeToFit");

    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v15, v16, v17, v18);
    objc_msgSend(v61, "addSubview:", v7);
    -[HULockupView labelStackView](v4, "labelStackView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v62);

    -[HULockupView downloadControl](v4, "downloadControl");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v63);

    v181 = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540]);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v183[0] = v64;
    v182 = *MEMORY[0x1E0CEA0A0];
    v65 = v182;
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v183[1] = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v183, &v181, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v178 = v67;
    v68 = (void *)objc_msgSend(v67, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v69, v65);

    v70 = -[HUExpandableTextView initWithFrame:]([HUExpandableTextView alloc], "initWithFrame:", v15, v16, v17, v18);
    -[HULockupView setDescriptionExpandableTextView:](v4, "setDescriptionExpandableTextView:", v70);

    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setTextAttributes:", v67);

    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setDelegate:", v4);

    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    +[HUFadeInButton button](HUFadeInButton, "button");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setMoreButton:", v74);

    v76 = objc_alloc(MEMORY[0x1E0CB3498]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUMoreButtonTitle"), CFSTR("HUMoreButtonTitle"), 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = (void *)objc_msgSend(v76, "initWithString:attributes:", v77, v68);

    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "moreButton");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setAttributedTitle:forState:", v177, 0);

    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setAlwaysShowMoreButtonUnlessExpanded:", 1);

    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "moreButton");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "sizeToFit");

    v83 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v180[0] = v61;
    -[HULockupView descriptionExpandableTextView](v4, "descriptionExpandableTextView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v180[1] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend(v83, "initWithArrangedSubviews:", v85);
    -[HULockupView setStackView:](v4, "setStackView:", v86);

    -[HULockupView stackView](v4, "stackView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setSpacing:", 16.0);

    -[HULockupView stackView](v4, "stackView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setAxis:", 1);

    -[HULockupView stackView](v4, "stackView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULockupView stackView](v4, "stackView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView addSubview:](v4, "addSubview:", v90);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView iconSize](v4, "iconSize");
    HUDefaultSizeForIconSize();
    v93 = v92;
    v95 = v94;
    objc_msgSend(v7, "widthAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToConstant:", v93 + 10.0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v97);

    objc_msgSend(v7, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToConstant:", v95 + 10.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v99);

    objc_msgSend(v7, "leadingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView leadingAnchor](v4, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v102);

    objc_msgSend(v7, "centerYAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView labelStackView](v4, "labelStackView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "centerYAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v106);

    -[HULockupView iconView](v4, "iconView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "widthAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToConstant:", v93 + -15.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v109);

    -[HULockupView iconView](v4, "iconView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "heightAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToConstant:", v95 + -15.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v112);

    -[HULockupView iconView](v4, "iconView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "centerXAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v116);

    -[HULockupView iconView](v4, "iconView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "centerYAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerYAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v120);

    -[HULockupView labelStackView](v4, "labelStackView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "topAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layoutMarginsGuide");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "topAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v125);

    -[HULockupView labelStackView](v4, "labelStackView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "leadingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:constant:", v128, 12.0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v129);

    -[HULockupView labelStackView](v4, "labelStackView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "bottomAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bottomAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v133);

    -[HULockupView downloadControl](v4, "downloadControl");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "topAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "constraintEqualToAnchor:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView setDownloadControlTopConstraint:](v4, "setDownloadControlTopConstraint:", v137);

    -[HULockupView downloadControl](v4, "downloadControl");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "centerYAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView labelStackView](v4, "labelStackView");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "centerYAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:", v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView setDownloadControlCenterYConstraint:](v4, "setDownloadControlCenterYConstraint:", v142);

    -[HULockupView downloadControlCenterYConstraint](v4, "downloadControlCenterYConstraint");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v143);

    -[HULockupView downloadControl](v4, "downloadControl");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "leadingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView labelStackView](v4, "labelStackView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "trailingAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintGreaterThanOrEqualToAnchor:constant:", v147, 12.0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v148);

    -[HULockupView downloadControl](v4, "downloadControl");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "trailingAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "safeAreaLayoutGuide");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "trailingAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "constraintEqualToAnchor:", v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v153);

    -[HULockupView downloadControl](v4, "downloadControl");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "widthAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](v4, "downloadControl");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "intrinsicContentSize");
    objc_msgSend(v155, "constraintEqualToConstant:");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView setDownloadControlWidthConstraint:](v4, "setDownloadControlWidthConstraint:", v157);

    -[HULockupView downloadControlWidthConstraint](v4, "downloadControlWidthConstraint");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v158);

    -[HULockupView stackView](v4, "stackView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "topAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView topAnchor](v4, "topAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "constraintEqualToAnchor:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v162);

    -[HULockupView stackView](v4, "stackView");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "leadingAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView leadingAnchor](v4, "leadingAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "constraintEqualToAnchor:", v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v166);

    -[HULockupView stackView](v4, "stackView");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "trailingAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView trailingAnchor](v4, "trailingAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v170);

    -[HULockupView stackView](v4, "stackView");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "bottomAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "bottomAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "constraintEqualToAnchor:", v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v175);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v91);
  }
  return v4;
}

- (id)initializeIconViewWithSize:(unint64_t)a3
{
  return objc_alloc_init(MEMORY[0x1E0CEA658]);
}

- (void)updateIconView:(id)a3 animate:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[HULockupView item](self, "item");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

}

- (void)updateDescriptionExpandableTextView:(id)a3 animate:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HULockupView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v8, "setStringGenerator:", v7);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;

  v3 = a3;
  -[HULockupView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v57 = (id)objc_claimAutoreleasedReturnValue();

  -[HULockupView iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockupView updateIconView:animate:](self, "updateIconView:animate:", v6, v3);

  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockupView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockupView detailLabel](self, "detailLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockupView secondaryDetailLabel](self, "secondaryDetailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EC8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFilledTintColor:", v23);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v21);
    goto LABEL_5;
  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFilledTintColor:", v21);
LABEL_5:
    v25 = 1.0;
    v26 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EC0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v27;
  if (v27)
  {
    objc_msgSend(v27, "floatValue");
    v25 = v28;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFilledTintColor:", v29);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTintColor:", v22);
    v26 = 4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFilledTintColor:", v32);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView downloadControl](self, "downloadControl");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTintColor:", v22);
    v25 = 1.0;
    v26 = 3;
  }

LABEL_10:
  -[HULockupView downloadControl](self, "downloadControl");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "controlStatus");

  -[HULockupView downloadControl](self, "downloadControl");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setControlStatus:animated:", v26, *(_QWORD *)&v25, v3);

  -[HULockupView downloadControl](self, "downloadControl");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTitle:forControlStatusType:", v38, 1);

  -[HULockupView downloadControl](self, "downloadControl");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", v16);

  if (v26 == 1)
    v40 = v18 ^ 1u;
  else
    v40 = 0;
  -[HULockupView downloadControl](self, "downloadControl");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEnabled:", v40);

  if (v35 != v26)
  {
    -[HULockupView downloadControl](self, "downloadControl");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "intrinsicContentSize");
    v44 = v43;
    -[HULockupView downloadControlWidthConstraint](self, "downloadControlWidthConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setConstant:", v44);

  }
  -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockupView updateDescriptionExpandableTextView:animate:](self, "updateDescriptionExpandableTextView:animate:", v46, v3);

  -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "text");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length") == 0;
  -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setHidden:", v49);

  -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "text");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "length");

  if (!v53)
  {
    -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDelegate:", 0);

    -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setExpanded:", 1);

    -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setDelegate:", self);

  }
  -[HULockupView resetDownloadControlVerticalConstraint](self, "resetDownloadControlVerticalConstraint");

}

- (void)_buttonTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HULockupView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HULockupView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lockupView:downloadControlTapped:", self, v7);

  }
  -[HULockupView resetDownloadControlVerticalConstraint](self, "resetDownloadControlVerticalConstraint");

}

- (void)resetDownloadControlVerticalConstraint
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[HULockupView downloadControl](self, "downloadControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlStatus");

  -[HULockupView downloadControlTopConstraint](self, "downloadControlTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", (unint64_t)(v4 - 3) < 2);

  -[HULockupView downloadControlCenterYConstraint](self, "downloadControlCenterYConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", (unint64_t)(v4 - 3) > 1);

}

- (double)_maxPossibleTitleLengthForDownloadControl
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateControlTitle_Update"), CFSTR("HUSoftwareUpdateControlTitle_Update"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateControlTitle_Requested"), CFSTR("HUSoftwareUpdateControlTitle_Requested"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUDownloadButtonTitle_Open"), CFSTR("HUDownloadButtonTitle_Open"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  _HULocalizedStringWithDefaultValue(CFSTR("HUDownloadButtonTitle_View"), CFSTR("HUDownloadButtonTitle_View"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HULockupView__maxPossibleTitleLengthForDownloadControl__block_invoke;
  v9[3] = &unk_1E6F60440;
  v9[4] = &v10;
  objc_msgSend(v6, "na_each:", v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__HULockupView__maxPossibleTitleLengthForDownloadControl__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CEA098];
  v3 = a2;
  +[HUDownloadControl controlTitleFontForControlStatusType:](HUDownloadControl, "controlTitleFontForControlStatusType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithAttributes:", v5);
  v7 = v6;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 > *(double *)(v8 + 24))
    *(double *)(v8 + 24) = v7;
}

- (void)expandableTextViewDidExpand:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[HULockupView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HULockupView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lockupView:expandableTextViewDidExpand:", self, v6);

  }
}

- (void)expandableTextViewDidCollapse:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[HULockupView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HULockupView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lockupView:expandableTextViewDidCollapse:", self, v6);

  }
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HULockupViewDelegate)delegate
{
  return (HULockupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUExpandableTextView)descriptionExpandableTextView
{
  return self->_descriptionExpandableTextView;
}

- (void)setDescriptionExpandableTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionExpandableTextView, a3);
}

- (HULockupInternalResizingDelegate)internalViewResizingDelegate
{
  return (HULockupInternalResizingDelegate *)objc_loadWeakRetained((id *)&self->_internalViewResizingDelegate);
}

- (void)setInternalViewResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalViewResizingDelegate, a3);
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

- (UILabel)secondaryDetailLabel
{
  return self->_secondaryDetailLabel;
}

- (void)setSecondaryDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryDetailLabel, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (HUDownloadControl)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
  objc_storeStrong((id *)&self->_downloadControl, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)downloadControlTopConstraint
{
  return self->_downloadControlTopConstraint;
}

- (void)setDownloadControlTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_downloadControlTopConstraint, a3);
}

- (NSLayoutConstraint)downloadControlCenterYConstraint
{
  return self->_downloadControlCenterYConstraint;
}

- (void)setDownloadControlCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_downloadControlCenterYConstraint, a3);
}

- (NSLayoutConstraint)downloadControlWidthConstraint
{
  return self->_downloadControlWidthConstraint;
}

- (void)setDownloadControlWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_downloadControlWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadControlWidthConstraint, 0);
  objc_storeStrong((id *)&self->_downloadControlCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_downloadControlTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_downloadControl, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_internalViewResizingDelegate);
  objc_storeStrong((id *)&self->_descriptionExpandableTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
