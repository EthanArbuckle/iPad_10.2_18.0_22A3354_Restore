@implementation NTKUpNextLargeTextCell

- (NTKUpNextLargeTextCell)initWithFrame:(CGRect)a3
{
  NTKUpNextLargeTextCell *v3;
  NTKUpNextLargeTextCell *v4;
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
  void *v20;
  uint64_t v21;
  CLKFont *standardBodyFont;
  uint64_t v23;
  CLKFont *monospaceBodyFont;
  void *v25;
  UILayoutGuide *v26;
  UILayoutGuide *contentLayoutGuide;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v35;
  void *v36;
  uint64_t v37;
  CLKUIColoringLabel *bodyLabel;
  CLKUIColoringLabel *v39;
  void *v40;
  NTKUpNextImageView *v41;
  NTKUpNextImageView *headerImage;
  double v43;
  double v44;
  double v45;
  double v46;
  NTKUpNextImageView *v47;
  NTKUpNextImageView *bodyImage;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
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
  uint64_t v76;
  NSArray *headerWithNoImageConstraints;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSArray *headerWithLeftImageConstraints;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  NSArray *headerWithRightImageConstraints;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSArray *bodyWithNoImageConstraints;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  NSArray *bodyWithLeftImageConstraints;
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
  double v142;
  double v143;
  void *v144;
  void *v145;
  double v146;
  void *v147;
  objc_super v148;
  _QWORD v149[3];
  _QWORD v150[2];
  _QWORD v151[3];
  _QWORD v152[3];
  _QWORD v153[2];
  _QWORD v154[11];

  v154[9] = *MEMORY[0x1E0C80C00];
  v148.receiver = self;
  v148.super_class = (Class)NTKUpNextLargeTextCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v148, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKUpNextBaseCell device](v3, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_28);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_28);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_28);
      if (v8 == v5)
      {
        v9 = objc_msgSend(v5, "version");
        v10 = _LayoutConstants___previousCLKDeviceVersion_28;

        if (v9 == v10)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_28);
          v13 = *(double *)&_LayoutConstants_constants_0_5;
          v146 = *(double *)&_LayoutConstants_constants_2_5;
          v14 = *(double *)&_LayoutConstants_constants_3_4;
          v15 = *(double *)&_LayoutConstants_constants_4_3;
          v142 = *(double *)&_LayoutConstants_constants_1_5;
          v143 = *(double *)&_LayoutConstants_constants_5_1;
          v16 = *(double *)&_LayoutConstants_constants_8_0;
          v17 = *(double *)&_LayoutConstants_constants_10_0;

          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fontDescriptor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", 2);
          v147 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v15, *MEMORY[0x1E0DC1440]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "CLKFontWithAlternativePunctuation");
          v21 = objc_claimAutoreleasedReturnValue();
          standardBodyFont = v4->_standardBodyFont;
          v4->_standardBodyFont = (CLKFont *)v21;

          -[CLKFont CLKFontWithMonospacedNumbers](v4->_standardBodyFont, "CLKFontWithMonospacedNumbers");
          v23 = objc_claimAutoreleasedReturnValue();
          monospaceBodyFont = v4->_monospaceBodyFont;
          v4->_monospaceBodyFont = (CLKFont *)v23;

          objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v147, v14);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
          contentLayoutGuide = v4->_contentLayoutGuide;
          v4->_contentLayoutGuide = v26;

          v28 = objc_alloc((Class)off_1E6BCA6E0);
          v29 = *MEMORY[0x1E0C9D648];
          v30 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v31 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v32 = *(double *)(MEMORY[0x1E0C9D648] + 24);
          v33 = objc_msgSend(v28, "initWithFrame:options:", 4, *MEMORY[0x1E0C9D648], v30, v31, v32);
          headerLabel = v4->_headerLabel;
          v4->_headerLabel = (CLKUIColoringLabel *)v33;

          -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[CLKUIColoringLabel setLineBreakMode:](v4->_headerLabel, "setLineBreakMode:", 4);
          -[CLKUIColoringLabel setNowProvider:](v4->_headerLabel, "setNowProvider:", &__block_literal_global_79);
          v145 = v25;
          -[CLKUIColoringLabel setFont:](v4->_headerLabel, "setFont:", v25);
          v35 = v4->_headerLabel;
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setTextColor:](v35, "setTextColor:", v36);

          v37 = objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:options:", 6, v29, v30, v31, v32);
          bodyLabel = v4->_bodyLabel;
          v4->_bodyLabel = (CLKUIColoringLabel *)v37;

          -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[CLKUIColoringLabel setLineBreakMode:](v4->_bodyLabel, "setLineBreakMode:", 4);
          -[CLKUIColoringLabel setNowProvider:](v4->_bodyLabel, "setNowProvider:", &__block_literal_global_79);
          -[CLKUIColoringLabel setFont:](v4->_bodyLabel, "setFont:", v4->_standardBodyFont);
          v39 = v4->_bodyLabel;
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setTextColor:](v39, "setTextColor:", v40);

          -[CLKUIColoringLabel setMinimumScaleFactor:](v4->_bodyLabel, "setMinimumScaleFactor:", 0.75);
          -[CLKUIColoringLabel setAdjustsFontSizeToFitWidth:](v4->_bodyLabel, "setAdjustsFontSizeToFitWidth:", 1);
          -[CLKUIColoringLabel setBaselineAdjustment:](v4->_bodyLabel, "setBaselineAdjustment:", 0);
          -[CLKUIColoringLabel setNumberOfLines:](v4->_bodyLabel, "setNumberOfLines:", 1);
          v41 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v29, v30, v31, v32);
          headerImage = v4->_headerImage;
          v4->_headerImage = v41;

          LODWORD(v43) = 1148846080;
          -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_headerImage, "setContentHuggingPriority:forAxis:", 0, v43);
          LODWORD(v44) = 1148846080;
          -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_headerImage, "setContentHuggingPriority:forAxis:", 1, v44);
          LODWORD(v45) = 1148846080;
          -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_headerImage, "setContentCompressionResistancePriority:forAxis:", 0, v45);
          LODWORD(v46) = 1148846080;
          -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_headerImage, "setContentCompressionResistancePriority:forAxis:", 1, v46);
          -[NTKUpNextImageView setFilterProvider:](v4->_headerImage, "setFilterProvider:", v4);
          -[NTKUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v47 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v29, v30, v31, v32);
          bodyImage = v4->_bodyImage;
          v4->_bodyImage = v47;

          LODWORD(v49) = 1148846080;
          -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_bodyImage, "setContentHuggingPriority:forAxis:", 0, v49);
          LODWORD(v50) = 1148846080;
          -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_bodyImage, "setContentHuggingPriority:forAxis:", 1, v50);
          LODWORD(v51) = 1148846080;
          -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 0, v51);
          LODWORD(v52) = 1148846080;
          -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 1, v52);
          -[NTKUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bodyImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[NTKUpNextImageView setFilterProvider:](v4->_bodyImage, "setFilterProvider:", v4);
          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addLayoutGuide:", v4->_contentLayoutGuide);

          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addSubview:", v4->_headerImage);

          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addSubview:", v4->_headerLabel);

          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addSubview:", v4->_bodyLabel);

          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addSubview:", v4->_bodyImage);

          objc_msgSend(v25, "capHeight");
          -[NTKUpNextBaseCell device](v4, "device");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          CLKRoundForDevice();
          v60 = v59;

          -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "topAnchor");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "constraintEqualToAnchor:constant:", v139, 0.0);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v154[0] = v138;
          -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "bottomAnchor");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "constraintEqualToAnchor:constant:", v135, -0.0);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v154[1] = v134;
          -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "leadingAnchor");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "constraintEqualToAnchor:constant:", v131, v16);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v154[2] = v130;
          -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextLargeTextCell contentView](v4, "contentView");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "trailingAnchor");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "constraintEqualToAnchor:constant:", v127, -v17);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v154[3] = v126;
          -[NTKUpNextImageView centerYAnchor](v4->_headerImage, "centerYAnchor");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "constraintEqualToAnchor:constant:", v124, -v60);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v154[4] = v123;
          -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "constraintEqualToAnchor:constant:", v121, v13);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v154[5] = v120;
          -[NTKUpNextImageView bottomAnchor](v4->_bodyImage, "bottomAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel firstBaselineAnchor](v4->_bodyLabel, "firstBaselineAnchor");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "constraintEqualToAnchor:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v154[6] = v63;
          -[CLKUIColoringLabel firstBaselineAnchor](v4->_bodyLabel, "firstBaselineAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, v142);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v154[7] = v66;
          -[CLKUIColoringLabel lastBaselineAnchor](v4->_bodyLabel, "lastBaselineAnchor");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, -v143);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v154[8] = v69;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 9);
          v144 = (void *)objc_claimAutoreleasedReturnValue();

          -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "constraintEqualToAnchor:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v153[0] = v72;
          -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "constraintEqualToAnchor:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v153[1] = v75;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 2);
          v76 = objc_claimAutoreleasedReturnValue();
          headerWithNoImageConstraints = v4->_headerWithNoImageConstraints;
          v4->_headerWithNoImageConstraints = (NSArray *)v76;

          -[NTKUpNextImageView leadingAnchor](v4->_headerImage, "leadingAnchor");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "constraintEqualToAnchor:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v152[0] = v80;
          -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextImageView trailingAnchor](v4->_headerImage, "trailingAnchor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, v146);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v152[1] = v83;
          -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "constraintEqualToAnchor:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v152[2] = v86;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 3);
          v87 = objc_claimAutoreleasedReturnValue();
          headerWithLeftImageConstraints = v4->_headerWithLeftImageConstraints;
          v4->_headerWithLeftImageConstraints = (NSArray *)v87;

          -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "constraintEqualToAnchor:", v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v151[0] = v91;
          -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextImageView leadingAnchor](v4->_headerImage, "leadingAnchor");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, -v146);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v151[1] = v94;
          -[NTKUpNextImageView trailingAnchor](v4->_headerImage, "trailingAnchor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "constraintEqualToAnchor:", v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v151[2] = v97;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 3);
          v98 = objc_claimAutoreleasedReturnValue();
          headerWithRightImageConstraints = v4->_headerWithRightImageConstraints;
          v4->_headerWithRightImageConstraints = (NSArray *)v98;

          -[CLKUIColoringLabel leadingAnchor](v4->_bodyLabel, "leadingAnchor");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "constraintEqualToAnchor:", v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v150[0] = v102;
          -[CLKUIColoringLabel trailingAnchor](v4->_bodyLabel, "trailingAnchor");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "constraintEqualToAnchor:", v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v150[1] = v105;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 2);
          v106 = objc_claimAutoreleasedReturnValue();
          bodyWithNoImageConstraints = v4->_bodyWithNoImageConstraints;
          v4->_bodyWithNoImageConstraints = (NSArray *)v106;

          -[NTKUpNextImageView leadingAnchor](v4->_bodyImage, "leadingAnchor");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "constraintEqualToAnchor:", v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v149[0] = v110;
          -[CLKUIColoringLabel leadingAnchor](v4->_bodyLabel, "leadingAnchor");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextImageView trailingAnchor](v4->_bodyImage, "trailingAnchor");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "constraintEqualToAnchor:constant:", v112, 0.0);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v149[1] = v113;
          -[CLKUIColoringLabel trailingAnchor](v4->_bodyLabel, "trailingAnchor");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "constraintEqualToAnchor:", v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v149[2] = v116;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 3);
          v117 = objc_claimAutoreleasedReturnValue();
          bodyWithLeftImageConstraints = v4->_bodyWithLeftImageConstraints;
          v4->_bodyWithLeftImageConstraints = (NSArray *)v117;

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_bodyWithNoImageConstraints);
          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_headerWithNoImageConstraints);
          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v144);

          return v4;
        }
      }
      else
      {

      }
    }
    v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_28, v5);
    _LayoutConstants___previousCLKDeviceVersion_28 = objc_msgSend(v5, "version");

    ___LayoutConstants_block_invoke_25(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  return v4;
}

uint64_t __40__NTKUpNextLargeTextCell_initWithFrame___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  NTKUpNextImageView *headerImage;
  int v11;
  int *v12;
  int *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL8 v17;
  int *v18;
  int *v19;
  objc_super v20;

  -[NTKUpNextBaseCell content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerImageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "overrideHeaderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  v7 = objc_msgSend(v3, "headerImageEdge");
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  if (self->_showingHeaderImage != v5 || v7 != self->_currentImageEdge)
  {
    self->_currentImageEdge = v7;
    self->_showingHeaderImage = v5;
    headerImage = self->_headerImage;
    if (v5)
    {
      -[NTKUpNextImageView setHidden:](headerImage, "setHidden:", 0);
      objc_msgSend(v9, "addObjectsFromArray:", self->_headerWithNoImageConstraints);
      v11 = objc_msgSend(v3, "headerImageEdge");
      if (v11 == 2)
        v12 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithLeftImageConstraints;
      else
        v12 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithRightImageConstraints;
      if (v11 == 2)
        v13 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithRightImageConstraints;
      else
        v13 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithLeftImageConstraints;
    }
    else
    {
      -[NTKUpNextImageView setHidden:](headerImage, "setHidden:", 1);
      objc_msgSend(v9, "addObjectsFromArray:", self->_headerWithLeftImageConstraints);
      v13 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithNoImageConstraints;
      v12 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithRightImageConstraints;
    }
    objc_msgSend(v9, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v12));
    objc_msgSend(v8, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13));
  }
  objc_msgSend(v3, "bodyImageProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v3, "overrideBodyImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16 != 0;

  }
  if (self->_showingBodyImage != v15)
  {
    self->_showingBodyImage = v15;
    v17 = !v15;
    if (v15)
      v18 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithNoImageConstraints;
    else
      v18 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithLeftImageConstraints;
    if (v15)
      v19 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithLeftImageConstraints;
    else
      v19 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithNoImageConstraints;
    -[NTKUpNextImageView setHidden:](self->_bodyImage, "setHidden:", v17);
    objc_msgSend(v9, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v18));
    objc_msgSend(v8, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v19));
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
  v20.receiver = self;
  v20.super_class = (Class)NTKUpNextLargeTextCell;
  -[NTKUpNextLargeTextCell updateConstraints](&v20, sel_updateConstraints);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  int v5;
  int *v6;
  NTKUpNextImageView *headerImage;
  void *v8;
  NTKUpNextImageView *v9;
  void *v10;
  void *v11;
  NTKUpNextImageView *bodyImage;
  void *v13;
  NTKUpNextImageView *v14;
  void *v15;
  void *v16;
  NTKUpNextImageView *v17;
  void *v18;
  int v19;
  CLKUIColoringLabel *headerLabel;
  void *v21;
  CLKUIColoringLabel *v22;
  void *v23;
  void *v24;
  CLKUIColoringLabel *bodyLabel;
  CLKUIColoringLabel *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NTKUpNextLargeTextCell;
  -[NTKUpNextBaseCell configureWithContent:](&v30, sel_configureWithContent_, v4);
  v5 = objc_msgSend(v4, "useMonospaceFont");
  v6 = &OBJC_IVAR___NTKUpNextLargeTextCell__standardBodyFont;
  if (v5)
    v6 = &OBJC_IVAR___NTKUpNextLargeTextCell__monospaceBodyFont;
  -[CLKUIColoringLabel setFont:](self->_bodyLabel, "setFont:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6));
  headerImage = self->_headerImage;
  objc_msgSend(v4, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFallbackTintColor:](headerImage, "setFallbackTintColor:", v8);

  v9 = self->_headerImage;
  objc_msgSend(v4, "overrideHeaderImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerImageProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFullColorImage:tintableImageProvider:](v9, "setFullColorImage:tintableImageProvider:", v10, v11);

  bodyImage = self->_bodyImage;
  objc_msgSend(v4, "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFallbackTintColor:](bodyImage, "setFallbackTintColor:", v13);

  v14 = self->_bodyImage;
  objc_msgSend(v4, "overrideBodyImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyImageProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFullColorImage:tintableImageProvider:](v14, "setFullColorImage:tintableImageProvider:", v15, v16);

  v17 = self->_bodyImage;
  objc_msgSend(v4, "bodyImageCompositingFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setCompositingFilter:](v17, "setCompositingFilter:", v18);

  v19 = objc_msgSend(v4, "tintColorAffectsHeader");
  headerLabel = self->_headerLabel;
  if (v19)
    objc_msgSend(v4, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](headerLabel, "setTextColor:", v21);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_headerLabel);
  v22 = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](v22, "setTextProvider:", v23);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_bodyLabel);
  objc_msgSend(v4, "overrideBodyString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  bodyLabel = self->_bodyLabel;
  if (v24)
  {
    -[CLKUIColoringLabel setTextProvider:](self->_bodyLabel, "setTextProvider:", 0);
    v26 = self->_bodyLabel;
    objc_msgSend(v4, "overrideBodyString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setText:](v26, "setText:", v27);
  }
  else
  {
    objc_msgSend(v4, "description1TextProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextProvider:](bodyLabel, "setTextProvider:", v27);
  }

  objc_msgSend(v4, "headerTextProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description1TextProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  -[NTKUpNextLargeTextCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextLargeTextCell;
  -[NTKUpNextBaseCell setPaused:](&v7, sel_setPaused_);
  -[CLKUIColoringLabel textProvider](self->_bodyLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_headerLabel, "textProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2)
    a4 = 0;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8;
  void *v9;
  void *v10;

  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2)
    a4 = 0;
  v8 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filtersForView:style:fraction:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8;
  void *v9;
  void *v10;

  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2)
    a4 = 0;
  v8 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterForView:style:fraction:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2)
    a4 = 0;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterForView:style:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;

  if (self->_bodyImage == a3 || (v5 = a4, self->_headerImage == a3) && self->_currentImageEdge == 2)
    v5 = 0;
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
  v4.super_class = (Class)NTKUpNextLargeTextCell;
  -[NTKUpNextBaseCell prepareForReuse](&v4, sel_prepareForReuse);
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_headerImage, "transitionToMonochromeWithFraction:", 0.0);
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

  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_headerImage, "transitionToMonochromeWithFraction:");
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_bodyImage, "transitionToMonochromeWithFraction:", a3);
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

  -[NTKUpNextImageView updateMonochromeColor](self->_headerImage, "updateMonochromeColor");
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
  objc_storeStrong((id *)&self->_bodyWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_bodyWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithRightImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_monospaceBodyFont, 0);
  objc_storeStrong((id *)&self->_standardBodyFont, 0);
}

@end
