@implementation NTKUpNextGaugeCell

- (NTKUpNextGaugeCell)initWithFrame:(CGRect)a3
{
  NTKUpNextGaugeCell *v3;
  NTKUpNextGaugeCell *v4;
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
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CLKFont *standardFont;
  uint64_t v26;
  CLKFont *boldFont;
  uint64_t v28;
  CLKFont *semiboldFont;
  void *v30;
  uint64_t v31;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v33;
  void *v34;
  uint64_t v35;
  CLKUIColoringLabel *descriptionLine1Label;
  CLKUIColoringLabel *v37;
  void *v38;
  uint64_t v39;
  CLKUIColoringLabel *descriptionLine2Label;
  CLKUIColoringLabel *v41;
  void *v42;
  uint64_t v43;
  CLKUIColoringLabel *descriptionLine3Label;
  CLKUIColoringLabel *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NTKRichComplicationLineProgressView *v49;
  void *v50;
  uint64_t v51;
  NTKRichComplicationLineProgressView *progressView;
  void *v53;
  void *v54;
  id v55;
  UILayoutGuide *v56;
  UILayoutGuide *contentLayoutGuide;
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
  void *v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  objc_super v132;
  _QWORD v133[22];

  v133[20] = *MEMORY[0x1E0C80C00];
  v132.receiver = self;
  v132.super_class = (Class)NTKUpNextGaugeCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v132, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3)
    return v4;
  -[NTKUpNextBaseCell device](v3, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (!WeakRetained)
    goto LABEL_6;
  v7 = WeakRetained;
  v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (v8 != v5)
  {

LABEL_6:
    v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, v5);
    _LayoutConstants___previousCLKDeviceVersion_2 = objc_msgSend(v5, "version");

    ___LayoutConstants_block_invoke_2(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  v9 = objc_msgSend(v5, "version");
  v10 = _LayoutConstants___previousCLKDeviceVersion_2;

  if (v9 != v10)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  v13 = *(double *)&_LayoutConstants_constants_0_0;
  v14 = *(double *)&_LayoutConstants_constants_1_0;
  v15 = *(double *)&_LayoutConstants_constants_2_0;
  v16 = *(double *)&_LayoutConstants_constants_3_0;
  v128 = *(double *)&_LayoutConstants_constants_4_0;
  v17 = *(double *)&_LayoutConstants_constants_6_0;
  v18 = *(double *)&_LayoutConstants_constants_7_0;
  v19 = *(double *)&_LayoutConstants_constants_9;
  v20 = *(double *)&_LayoutConstants_constants_11;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fontDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 2);
  v23 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v15, *MEMORY[0x1E0DC1438]);
  v24 = objc_claimAutoreleasedReturnValue();
  standardFont = v4->_standardFont;
  v4->_standardFont = (CLKFont *)v24;

  v131 = (void *)v23;
  objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v23, v15);
  v26 = objc_claimAutoreleasedReturnValue();
  boldFont = v4->_boldFont;
  v4->_boldFont = (CLKFont *)v26;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v17, *MEMORY[0x1E0DC1448]);
  v28 = objc_claimAutoreleasedReturnValue();
  semiboldFont = v4->_semiboldFont;
  v4->_semiboldFont = (CLKFont *)v28;

  objc_msgSend(MEMORY[0x1E0DC1288], "NTKHyphenationParagraphStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLineBreakMode:", 4);
  __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  v31 = objc_claimAutoreleasedReturnValue();
  headerLabel = v4->_headerLabel;
  v4->_headerLabel = (CLKUIColoringLabel *)v31;

  -[CLKUIColoringLabel setFont:](v4->_headerLabel, "setFont:", v4->_boldFont);
  v33 = v4->_headerLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v33, "setTextColor:", v34);

  -[CLKUIColoringLabel setNumberOfLines:](v4->_headerLabel, "setNumberOfLines:", 1);
  -[CLKUIColoringLabel setParagraphStyle:](v4->_headerLabel, "setParagraphStyle:", v30);
  __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  v35 = objc_claimAutoreleasedReturnValue();
  descriptionLine1Label = v4->_descriptionLine1Label;
  v4->_descriptionLine1Label = (CLKUIColoringLabel *)v35;

  v37 = v4->_descriptionLine1Label;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v37, "setTextColor:", v38);

  -[CLKUIColoringLabel setFont:](v4->_descriptionLine1Label, "setFont:", v4->_standardFont);
  -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine1Label, "setNumberOfLines:", 1);
  -[CLKUIColoringLabel setParagraphStyle:](v4->_descriptionLine1Label, "setParagraphStyle:", v30);
  if (CLKLayoutIsRTL())
    objc_msgSend(v30, "setAlignment:", 0);
  __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  v39 = objc_claimAutoreleasedReturnValue();
  descriptionLine2Label = v4->_descriptionLine2Label;
  v4->_descriptionLine2Label = (CLKUIColoringLabel *)v39;

  v41 = v4->_descriptionLine2Label;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v41, "setTextColor:", v42);

  -[CLKUIColoringLabel setFont:](v4->_descriptionLine2Label, "setFont:", v4->_semiboldFont);
  -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine2Label, "setNumberOfLines:", 1);
  -[CLKUIColoringLabel setParagraphStyle:](v4->_descriptionLine2Label, "setParagraphStyle:", v30);
  if ((CLKLayoutIsRTL() & 1) == 0)
    objc_msgSend(v30, "setAlignment:", 2);
  __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  v43 = objc_claimAutoreleasedReturnValue();
  descriptionLine3Label = v4->_descriptionLine3Label;
  v4->_descriptionLine3Label = (CLKUIColoringLabel *)v43;

  v45 = v4->_descriptionLine3Label;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v45, "setTextColor:", v46);

  -[CLKUIColoringLabel setFont:](v4->_descriptionLine3Label, "setFont:", v4->_semiboldFont);
  -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine3Label, "setNumberOfLines:", 1);
  v130 = v30;
  -[CLKUIColoringLabel setParagraphStyle:](v4->_descriptionLine3Label, "setParagraphStyle:", v30);
  -[NTKUpNextBaseCell device](v4, "device");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "sizeClass");

  if (v48 == 3)
  {
    -[CLKUIColoringLabel setLineSpacing:](v4->_headerLabel, "setLineSpacing:", (uint64_t)v14);
    -[CLKUIColoringLabel setLineSpacing:](v4->_descriptionLine1Label, "setLineSpacing:", (uint64_t)v14);
  }
  v49 = [NTKRichComplicationLineProgressView alloc];
  -[NTKUpNextBaseCell device](v4, "device");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[NTKRichComplicationLineProgressView initForFamily:device:progressFillStyle:](v49, "initForFamily:device:progressFillStyle:", 10, v50, 0);
  progressView = v4->_progressView;
  v4->_progressView = (NTKRichComplicationLineProgressView *)v51;

  -[NTKRichComplicationLineProgressView setTranslatesAutoresizingMaskIntoConstraints:](v4->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CDRichComplicationProgressView setFilterProvider:](v4->_progressView, "setFilterProvider:", v4);
  -[CDRichComplicationProgressView ringView](v4->_progressView, "ringView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v54, "setBorderColor:", objc_msgSend(v55, "CGColor"));

  v56 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  contentLayoutGuide = v4->_contentLayoutGuide;
  v4->_contentLayoutGuide = v56;

  -[UILayoutGuide setIdentifier:](v4->_contentLayoutGuide, "setIdentifier:", CFSTR("content"));
  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addLayoutGuide:", v4->_contentLayoutGuide);

  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", v4->_headerLabel);

  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", v4->_descriptionLine1Label);

  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSubview:", v4->_progressView);

  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "insertSubview:aboveSubview:", v4->_descriptionLine2Label, v4->_progressView);

  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "insertSubview:aboveSubview:", v4->_descriptionLine3Label, v4->_progressView);

  -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "topAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:constant:", v125, 0.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v124;
  -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:constant:", v121, -0.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v120;
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v117, v19);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v133[2] = v116;
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextGaugeCell contentView](v4, "contentView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:constant:", v113, -v20);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v133[3] = v112;
  -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v110);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v133[4] = v109;
  -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v133[5] = v106;
  -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine1Label, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v133[6] = v103;
  -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine1Label, "trailingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v101);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v133[7] = v100;
  -[NTKRichComplicationLineProgressView leadingAnchor](v4->_progressView, "leadingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v133[8] = v97;
  -[NTKRichComplicationLineProgressView trailingAnchor](v4->_progressView, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v133[9] = v94;
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, v13);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v133[10] = v91;
  -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine1Label, "firstBaselineAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel lastBaselineAnchor](v4->_headerLabel, "lastBaselineAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, v14);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v133[11] = v88;
  -[NTKRichComplicationLineProgressView bottomAnchor](v4->_progressView, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, -v16);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v133[12] = v85;
  -[NTKRichComplicationLineProgressView heightAnchor](v4->_progressView, "heightAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToConstant:", v128);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v133[13] = v83;
  -[CLKUIColoringLabel centerYAnchor](v4->_descriptionLine2Label, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationLineProgressView centerYAnchor](v4->_progressView, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v133[14] = v80;
  -[CLKUIColoringLabel widthAnchor](v4->_descriptionLine2Label, "widthAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationLineProgressView widthAnchor](v4->_progressView, "widthAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:multiplier:constant:", v78, 0.5, -v18);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v133[15] = v77;
  -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine2Label, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationLineProgressView leadingAnchor](v4->_progressView, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, v18);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v133[16] = v74;
  -[CLKUIColoringLabel centerYAnchor](v4->_descriptionLine3Label, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationLineProgressView centerYAnchor](v4->_progressView, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v133[17] = v66;
  -[CLKUIColoringLabel widthAnchor](v4->_descriptionLine3Label, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationLineProgressView widthAnchor](v4->_progressView, "widthAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:multiplier:constant:", v68, 0.5, -v18);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v133[18] = v69;
  -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine3Label, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationLineProgressView trailingAnchor](v4->_progressView, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, -v18);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v133[19] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 20);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v129);
  return v4;
}

id __36__NTKUpNextGaugeCell_initWithFrame___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc((Class)off_1E6BCA6E0);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  objc_msgSend(v1, "_setUseShortcutIntrinsicContentSize:", 1);
  objc_msgSend(v1, "setNowProvider:", &__block_literal_global_3);
  return v1;
}

uint64_t __36__NTKUpNextGaugeCell_initWithFrame___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)configureWithContent:(id)a3
{
  id v4;
  CLKUIColoringLabel *headerLabel;
  void *v6;
  CLKUIColoringLabel *descriptionLine1Label;
  void *v8;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v10;
  CLKUIColoringLabel *descriptionLine3Label;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKUpNextGaugeCell;
  v4 = a3;
  -[NTKUpNextBaseCell configureWithContent:](&v18, sel_configureWithContent_, v4);
  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_headerLabel, v18.receiver, v18.super_class);
  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v6);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_descriptionLine1Label);
  descriptionLine1Label = self->_descriptionLine1Label;
  objc_msgSend(v4, "description1TextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine1Label, "setTextProvider:", v8);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_descriptionLine2Label);
  descriptionLine2Label = self->_descriptionLine2Label;
  objc_msgSend(v4, "description2TextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine2Label, "setTextProvider:", v10);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_descriptionLine3Label);
  descriptionLine3Label = self->_descriptionLine3Label;
  objc_msgSend(v4, "description3TextProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine3Label, "setTextProvider:", v12);

  objc_msgSend(v4, "gaugeProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationProgressView setGaugeProvider:](self->_progressView, "setGaugeProvider:", v13);
  -[NTKRichComplicationLineProgressView setHidden:](self->_progressView, "setHidden:", v13 == 0);
  -[CLKUIColoringLabel setHidden:](self->_descriptionLine2Label, "setHidden:", v13 == 0);
  -[CLKUIColoringLabel setHidden:](self->_descriptionLine3Label, "setHidden:", v13 == 0);
  objc_msgSend(v4, "headerTextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description1TextProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description2TextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description3TextProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));
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
  v9.super_class = (Class)NTKUpNextGaugeCell;
  -[NTKUpNextBaseCell setPaused:](&v9, sel_setPaused_);
  -[CLKUIColoringLabel textProvider](self->_headerLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine1Label, "textProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine2Label, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine3Label, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaused:", v3);

}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filtersForView:style:fraction:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8;
  void *v9;
  void *v10;

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

  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterForView:style:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
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
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextGaugeCell;
  -[NTKUpNextBaseCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", 0.0);
  -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", 0);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:");
  if (fabs(a3) < 0.00000011920929)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", 0);

    -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", 0);
LABEL_5:
    v7 = v10;
    goto LABEL_6;
  }
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:fraction:", self, 2, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", v10);

    -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v10);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CDRichComplicationProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v6);

    -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semiboldFont, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionLine3Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
