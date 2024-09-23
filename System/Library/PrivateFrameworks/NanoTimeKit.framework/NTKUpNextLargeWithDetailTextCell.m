@implementation NTKUpNextLargeWithDetailTextCell

- (NTKUpNextLargeWithDetailTextCell)initWithFrame:(CGRect)a3
{
  NTKUpNextLargeWithDetailTextCell *v3;
  NTKUpNextLargeWithDetailTextCell *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  UILayoutGuide *v24;
  UILayoutGuide *contentLayoutGuide;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v33;
  void *v34;
  uint64_t v35;
  CLKUIColoringLabel *bodyLabel;
  CLKUIColoringLabel *v37;
  void *v38;
  double v39;
  double v40;
  NTKUpNextImageView *v41;
  NTKUpNextImageView *bodyImage;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  CLKUIColoringLabel *detail1Label;
  CLKUIColoringLabel *v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  CLKUIColoringLabel *detail2Label;
  CLKUIColoringLabel *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
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
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  double v127;
  void *v128;
  double v129;
  void *v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  objc_super v141;
  _QWORD v142[20];

  v142[18] = *MEMORY[0x1E0C80C00];
  v141.receiver = self;
  v141.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v141, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3)
    return v4;
  -[NTKUpNextBaseCell device](v3, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_25);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_25);
  if (!WeakRetained)
    goto LABEL_6;
  v7 = WeakRetained;
  v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_25);
  if (v8 != v5)
  {

LABEL_6:
    v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_25, v5);
    _LayoutConstants___previousCLKDeviceVersion_25 = objc_msgSend(v5, "version");

    ___LayoutConstants_block_invoke_22(v12, v5);
    goto LABEL_7;
  }
  v9 = objc_msgSend(v5, "version");
  v10 = _LayoutConstants___previousCLKDeviceVersion_25;

  if (v9 != v10)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_25);
  v125 = *(double *)&_LayoutConstants_constants_0_4;
  v127 = *(double *)&_LayoutConstants_constants_1_4;
  v133 = *(double *)&_LayoutConstants_constants_2_4;
  v134 = *(double *)&_LayoutConstants_constants_3_3;
  v13 = *(double *)&_LayoutConstants_constants_4_2;
  v14 = *(double *)&_LayoutConstants_constants_5_0;
  v15 = *(double *)&_LayoutConstants_constants_6_1;
  v129 = *(double *)&_LayoutConstants_constants_7_1;
  v131 = *(double *)&_LayoutConstants_constants_8;
  v16 = *(double *)&_LayoutConstants_constants_10;
  v17 = *(double *)&_LayoutConstants_constants_12;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fontDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", 2);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *MEMORY[0x1E0DC1440];
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v15, *MEMORY[0x1E0DC1440]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "CLKFontWithAlternativePunctuation");
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v138, v14);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v13, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "CLKFontWithAlternativePunctuation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "CLKFontWithMonospacedNumbers");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  contentLayoutGuide = v4->_contentLayoutGuide;
  v4->_contentLayoutGuide = v24;

  v26 = objc_alloc((Class)off_1E6BCA6E0);
  v27 = *MEMORY[0x1E0C9D648];
  v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v31 = objc_msgSend(v26, "initWithFrame:options:", 4, *MEMORY[0x1E0C9D648], v28, v30, v29);
  headerLabel = v4->_headerLabel;
  v4->_headerLabel = (CLKUIColoringLabel *)v31;

  -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CLKUIColoringLabel setLineBreakMode:](v4->_headerLabel, "setLineBreakMode:", 4);
  -[CLKUIColoringLabel setNowProvider:](v4->_headerLabel, "setNowProvider:", &__block_literal_global_62);
  -[CLKUIColoringLabel setFont:](v4->_headerLabel, "setFont:", v137);
  v33 = v4->_headerLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v33, "setTextColor:", v34);

  v35 = objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:options:", 2, v27, v28, v30, v29);
  bodyLabel = v4->_bodyLabel;
  v4->_bodyLabel = (CLKUIColoringLabel *)v35;

  -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CLKUIColoringLabel setLineBreakMode:](v4->_bodyLabel, "setLineBreakMode:", 4);
  -[CLKUIColoringLabel setNowProvider:](v4->_bodyLabel, "setNowProvider:", &__block_literal_global_62);
  -[CLKUIColoringLabel setFont:](v4->_bodyLabel, "setFont:", v136);
  v37 = v4->_bodyLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v37, "setTextColor:", v38);

  -[CLKUIColoringLabel setMinimumScaleFactor:](v4->_bodyLabel, "setMinimumScaleFactor:", 0.3);
  -[CLKUIColoringLabel setAdjustsFontSizeToFitWidth:](v4->_bodyLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[CLKUIColoringLabel setBaselineAdjustment:](v4->_bodyLabel, "setBaselineAdjustment:", 0);
  -[CLKUIColoringLabel setNumberOfLines:](v4->_bodyLabel, "setNumberOfLines:", 1);
  LODWORD(v39) = 1132068864;
  -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v4->_bodyLabel, "setContentCompressionResistancePriority:forAxis:", 0, v39);
  LODWORD(v40) = 1148846080;
  -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v4->_bodyLabel, "setContentHuggingPriority:forAxis:", 0, v40);
  v41 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v27, v28, v30, v29);
  bodyImage = v4->_bodyImage;
  v4->_bodyImage = v41;

  LODWORD(v43) = 1148846080;
  -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_bodyImage, "setContentHuggingPriority:forAxis:", 0, v43);
  LODWORD(v44) = 1148846080;
  -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_bodyImage, "setContentHuggingPriority:forAxis:", 1, v44);
  LODWORD(v45) = 1148846080;
  -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 0, v45);
  LODWORD(v46) = 1148846080;
  -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 1, v46);
  -[NTKUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bodyImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NTKUpNextImageView setFilterProvider:](v4->_bodyImage, "setFilterProvider:", v4);
  v47 = objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:options:", 4, v27, v28, v30, v29);
  detail1Label = v4->_detail1Label;
  v4->_detail1Label = (CLKUIColoringLabel *)v47;

  -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detail1Label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CLKUIColoringLabel setLineBreakMode:](v4->_detail1Label, "setLineBreakMode:", 4);
  -[CLKUIColoringLabel setTextAlignment:](v4->_detail1Label, "setTextAlignment:", 2);
  -[CLKUIColoringLabel setNowProvider:](v4->_detail1Label, "setNowProvider:", &__block_literal_global_62);
  -[CLKUIColoringLabel setFont:](v4->_detail1Label, "setFont:", v140);
  v49 = v4->_detail1Label;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v49, "setTextColor:", v50);

  LODWORD(v51) = 1148846080;
  -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v4->_detail1Label, "setContentCompressionResistancePriority:forAxis:", 0, v51);
  LODWORD(v52) = 1132068864;
  -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v4->_detail1Label, "setContentHuggingPriority:forAxis:", 0, v52);
  v53 = objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:options:", 4, v27, v28, v30, v29);
  detail2Label = v4->_detail2Label;
  v4->_detail2Label = (CLKUIColoringLabel *)v53;

  -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detail2Label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CLKUIColoringLabel setLineBreakMode:](v4->_detail2Label, "setLineBreakMode:", 4);
  -[CLKUIColoringLabel setTextAlignment:](v4->_detail2Label, "setTextAlignment:", 2);
  -[CLKUIColoringLabel setNowProvider:](v4->_detail2Label, "setNowProvider:", &__block_literal_global_62);
  -[CLKUIColoringLabel setFont:](v4->_detail2Label, "setFont:", v140);
  v55 = v4->_detail2Label;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v55, "setTextColor:", v56);

  LODWORD(v57) = 1148846080;
  -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v4->_detail2Label, "setContentCompressionResistancePriority:forAxis:", 0, v57);
  LODWORD(v58) = 1132068864;
  -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v4->_detail2Label, "setContentHuggingPriority:forAxis:", 0, v58);
  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addLayoutGuide:", v4->_contentLayoutGuide);

  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", v4->_headerLabel);

  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSubview:", v4->_bodyLabel);

  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", v4->_bodyImage);

  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v4->_detail1Label);

  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addSubview:", v4->_detail2Label);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "languageCode");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "lowercaseString");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("th"));

  if (v68)
    v69 = 3.0;
  else
    v69 = 0.0;
  -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "topAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, 0.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v121;
  -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "bottomAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:constant:", v118, -0.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v117;
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:constant:", v114, v16);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v113;
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextLargeWithDetailTextCell contentView](v4, "contentView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "trailingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v110, -v17);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v142[3] = v109;
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v107, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v142[4] = v126;
  -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v105);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v142[5] = v104;
  -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v142[6] = v101;
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_bodyLabel, "firstBaselineAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v139, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v142[7] = v128;
  -[CLKUIColoringLabel lastBaselineAnchor](v4->_bodyLabel, "lastBaselineAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -v129;
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v98, -v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v142[8] = v130;
  -[NTKUpNextImageView bottomAnchor](v4->_bodyImage, "bottomAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_bodyLabel, "firstBaselineAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v96);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v142[9] = v95;
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_detail2Label, "firstBaselineAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, v70);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v142[10] = v92;
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_detail1Label, "firstBaselineAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_detail2Label, "firstBaselineAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v90, -(v131 + v69));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v142[11] = v132;
  -[CLKUIColoringLabel leadingAnchor](v4->_detail2Label, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel leadingAnchor](v4->_detail1Label, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v142[12] = v87;
  -[CLKUIColoringLabel trailingAnchor](v4->_detail2Label, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v142[13] = v84;
  -[CLKUIColoringLabel leadingAnchor](v4->_bodyLabel, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v142[14] = v81;
  -[NTKUpNextImageView leadingAnchor](v4->_bodyImage, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel trailingAnchor](v4->_bodyLabel, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, v133);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v142[15] = v73;
  -[CLKUIColoringLabel leadingAnchor](v4->_detail1Label, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView trailingAnchor](v4->_bodyImage, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, v134);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v142[16] = v76;
  -[CLKUIColoringLabel trailingAnchor](v4->_detail1Label, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v142[17] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 18);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v135);
  return v4;
}

uint64_t __50__NTKUpNextLargeWithDetailTextCell_initWithFrame___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)configureWithContent:(id)a3
{
  id v4;
  NTKUpNextImageView *bodyImage;
  void *v6;
  NTKUpNextImageView *v7;
  void *v8;
  void *v9;
  NTKUpNextImageView *v10;
  void *v11;
  int v12;
  CLKUIColoringLabel *headerLabel;
  void *v14;
  CLKUIColoringLabel *v15;
  void *v16;
  CLKUIColoringLabel *bodyLabel;
  void *v18;
  CLKUIColoringLabel *detail1Label;
  void *v20;
  CLKUIColoringLabel *detail2Label;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  -[NTKUpNextBaseCell configureWithContent:](&v27, sel_configureWithContent_, v4);
  bodyImage = self->_bodyImage;
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFallbackTintColor:](bodyImage, "setFallbackTintColor:", v6);

  v7 = self->_bodyImage;
  objc_msgSend(v4, "overrideBodyImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyImageProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFullColorImage:tintableImageProvider:](v7, "setFullColorImage:tintableImageProvider:", v8, v9);

  v10 = self->_bodyImage;
  objc_msgSend(v4, "bodyImageCompositingFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setCompositingFilter:](v10, "setCompositingFilter:", v11);

  v12 = objc_msgSend(v4, "tintColorAffectsHeader");
  headerLabel = self->_headerLabel;
  if (v12)
    objc_msgSend(v4, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](headerLabel, "setTextColor:", v14);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_headerLabel);
  v15 = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](v15, "setTextProvider:", v16);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_bodyLabel);
  bodyLabel = self->_bodyLabel;
  objc_msgSend(v4, "description1TextProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](bodyLabel, "setTextProvider:", v18);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_detail1Label);
  detail1Label = self->_detail1Label;
  objc_msgSend(v4, "description2TextProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](detail1Label, "setTextProvider:", v20);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_detail2Label);
  detail2Label = self->_detail2Label;
  objc_msgSend(v4, "description3TextProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](detail2Label, "setTextProvider:", v22);

  objc_msgSend(v4, "headerTextProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description1TextProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description2TextProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description3TextProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  -[NTKUpNextBaseCell setPaused:](&v9, sel_setPaused_);
  -[CLKUIColoringLabel textProvider](self->_headerLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_bodyLabel, "textProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_detail1Label, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_detail2Label, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaused:", v3);

}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  int64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (self->_bodyImage == a3)
    v5 = 0;
  else
    v5 = a4;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  int64_t v7;
  id v8;
  void *v9;
  void *v10;

  if (self->_bodyImage == a3)
    v7 = 0;
  else
    v7 = a4;
  v8 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filtersForView:style:fraction:", v8, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  int64_t v7;
  id v8;
  void *v9;
  void *v10;

  if (self->_bodyImage == a3)
    v7 = 0;
  else
    v7 = a4;
  v8 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterForView:style:fraction:", v8, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  int64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (self->_bodyImage == a3)
    v5 = 0;
  else
    v5 = a4;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterForView:style:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;

  v5 = self->_bodyImage != a3 && a4;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  -[NTKUpNextBaseCell prepareForReuse](&v4, sel_prepareForReuse);
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_bodyImage, "transitionToMonochromeWithFraction:", 0.0);
  -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_bodyImage, "transitionToMonochromeWithFraction:");
  if (fabs(a3) < 0.00000011920929)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", 0);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, 2, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v8);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  id v5;

  -[NTKUpNextImageView updateMonochromeColor](self->_bodyImage, "updateMonochromeColor");
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail2Label, 0);
  objc_storeStrong((id *)&self->_detail1Label, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
