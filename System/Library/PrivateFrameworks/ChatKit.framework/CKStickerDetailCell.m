@implementation CKStickerDetailCell

+ (id)identifier
{
  return CFSTR("CKStickerDetailCellIdentifier");
}

- (CKStickerDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  CKAnimatedImageView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *subtitleLabelTopSpacingConstraint;
  void *v49;
  void *v50;
  uint64_t v51;
  NSLayoutConstraint *timestampLabelTopSpacingConstraint;
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
  uint64_t v73;
  NSArray *saveButtonVisibleConstraints;
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
  uint64_t v85;
  NSArray *viewButtonVisibleConstraints;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  NSArray *buttonsHiddenConstraints;
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
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  CKAnimatedImageView *v149;
  void *v150;
  void *v151;
  CKStickerDetailCell *val;
  id v153;
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  id v157;
  id location;
  objc_super v159;
  void *v160;
  _QWORD v161[3];
  _QWORD v162[3];
  _QWORD v163[22];

  v163[20] = *MEMORY[0x1E0C80C00];
  v159.receiver = self;
  v159.super_class = (Class)CKStickerDetailCell;
  v143 = a4;
  val = -[CKStickerDetailCell initWithStyle:reuseIdentifier:](&v159, sel_initWithStyle_reuseIdentifier_, a3);
  if (val)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStickerDetailCell contentView](val, "contentView");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "stickerDetailsCellBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStickerDetailCell setBackgroundColor:](val, "setBackgroundColor:", v5);

    v6 = [CKAnimatedImageView alloc];
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v149 = -[CKAnimatedImageView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    -[CKAnimatedImageView setContentMode:](v149, "setContentMode:", 1);
    -[CKAnimatedImageView setClipsToBounds:](v149, "setClipsToBounds:", 1);
    -[CKAnimatedImageView setTranslatesAutoresizingMaskIntoConstraints:](v149, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKStickerDetailCell setStickerView:](val, "setStickerView:", v149);
    objc_msgSend(v151, "addSubview:", v149);
    v153 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v153, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v153, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v153, "setContentHuggingPriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v153, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v153, "setContentHuggingPriority:forAxis:", 1, v14);
    -[CKStickerDetailCell setLabelContainerView:](val, "setLabelContainerView:", v153);
    objc_msgSend(v151, "addSubview:", v153);
    v150 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
    objc_msgSend(v145, "stickerDetailsCellTitleFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setFont:", v15);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stickerDetailsCellTitleTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setTextColor:", v18);

    objc_msgSend(v150, "setNumberOfLines:", 1);
    objc_msgSend(v150, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    objc_msgSend(v150, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    LODWORD(v20) = 1148846080;
    objc_msgSend(v150, "setContentHuggingPriority:forAxis:", 1, v20);
    -[CKStickerDetailCell setTitleLabel:](val, "setTitleLabel:", v150);
    objc_msgSend(v153, "addSubview:", v150);
    v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
    objc_msgSend(v145, "stickerDetailsCellSubtitleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setFont:", v21);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "theme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stickerDetailsCellSubtitleTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setTextColor:", v24);

    objc_msgSend(v148, "setNumberOfLines:", 2);
    objc_msgSend(v148, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v25) = 1148846080;
    objc_msgSend(v148, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    LODWORD(v26) = 1148846080;
    objc_msgSend(v148, "setContentHuggingPriority:forAxis:", 1, v26);
    -[CKStickerDetailCell setSubtitleLabel:](val, "setSubtitleLabel:", v148);
    objc_msgSend(v153, "addSubview:", v148);
    v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4E0]), "initWithFrame:", v7, v8, v9, v10);
    objc_msgSend(v145, "stickerDetailsCellTimestampFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setFont:", v27);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "theme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stickerDetailsCellTimestampTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setTextColor:", v30);

    objc_msgSend(v147, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v31) = 1148846080;
    objc_msgSend(v147, "setContentCompressionResistancePriority:forAxis:", 1, v31);
    LODWORD(v32) = 1148846080;
    objc_msgSend(v147, "setContentHuggingPriority:forAxis:", 1, v32);
    -[CKStickerDetailCell setTimestampLabel:](val, "setTimestampLabel:", v147);
    objc_msgSend(v153, "addSubview:", v147);
    location = 0;
    objc_initWeak(&location, val);
    objc_msgSend(v145, "stickerSaveButtonConfiguration");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0CEA2A8];
    v34 = MEMORY[0x1E0C809B0];
    v156[0] = MEMORY[0x1E0C809B0];
    v156[1] = 3221225472;
    v156[2] = __53__CKStickerDetailCell_initWithStyle_reuseIdentifier___block_invoke;
    v156[3] = &unk_1E274A4C0;
    objc_copyWeak(&v157, &location);
    objc_msgSend(v33, "actionWithHandler:", v156);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v142);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v36) = 1148846080;
    objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 0, v36);
    LODWORD(v37) = 1148846080;
    objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 0, v37);
    LODWORD(v38) = 1148846080;
    objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 1, v38);
    LODWORD(v39) = 1148846080;
    objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 1, v39);
    -[CKStickerDetailCell setSaveButton:](val, "setSaveButton:", v35);
    objc_msgSend(v151, "addSubview:", v35);
    v144 = v35;
    objc_msgSend(v145, "stickerViewButtonConfiguration");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CEA2A8];
    v154[0] = v34;
    v154[1] = 3221225472;
    v154[2] = __53__CKStickerDetailCell_initWithStyle_reuseIdentifier___block_invoke_2;
    v154[3] = &unk_1E274A4C0;
    objc_copyWeak(&v155, &location);
    objc_msgSend(v40, "actionWithHandler:", v154);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v125);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v41) = 1148846080;
    objc_msgSend(v146, "setContentCompressionResistancePriority:forAxis:", 0, v41);
    LODWORD(v42) = 1148846080;
    objc_msgSend(v146, "setContentHuggingPriority:forAxis:", 0, v42);
    LODWORD(v43) = 1148846080;
    objc_msgSend(v146, "setContentCompressionResistancePriority:forAxis:", 1, v43);
    LODWORD(v44) = 1148846080;
    objc_msgSend(v146, "setContentHuggingPriority:forAxis:", 1, v44);
    -[CKStickerDetailCell setViewButton:](val, "setViewButton:", v146);
    objc_msgSend(v151, "addSubview:", v146);
    objc_msgSend(v148, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 0.0);
    v47 = objc_claimAutoreleasedReturnValue();
    subtitleLabelTopSpacingConstraint = val->_subtitleLabelTopSpacingConstraint;
    val->_subtitleLabelTopSpacingConstraint = (NSLayoutConstraint *)v47;

    objc_msgSend(v147, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 0.0);
    v51 = objc_claimAutoreleasedReturnValue();
    timestampLabelTopSpacingConstraint = val->_timestampLabelTopSpacingConstraint;
    val->_timestampLabelTopSpacingConstraint = (NSLayoutConstraint *)v51;

    v96 = (void *)MEMORY[0x1E0CB3718];
    -[CKAnimatedImageView widthAnchor](v149, "widthAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToConstant:", 60.0);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v163[0] = v140;
    -[CKAnimatedImageView heightAnchor](v149, "heightAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToConstant:", 60.0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v163[1] = v138;
    -[CKAnimatedImageView topAnchor](v149, "topAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "topAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintGreaterThanOrEqualToAnchor:constant:", v136, 12.0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v163[2] = v135;
    objc_msgSend(v151, "bottomAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAnimatedImageView bottomAnchor](v149, "bottomAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintGreaterThanOrEqualToAnchor:constant:", v133, 12.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v163[3] = v132;
    -[CKAnimatedImageView centerYAnchor](v149, "centerYAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "centerYAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:", v130);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v163[4] = v129;
    -[CKAnimatedImageView leadingAnchor](v149, "leadingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "layoutMarginsGuide");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "leadingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:", v126);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v163[5] = v124;
    objc_msgSend(v153, "leadingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAnimatedImageView trailingAnchor](v149, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, 8.0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v163[6] = v121;
    objc_msgSend(v150, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v119);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v163[7] = v118;
    objc_msgSend(v148, "leadingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "leadingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:", v116);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v163[8] = v115;
    objc_msgSend(v147, "leadingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v113);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v163[9] = v112;
    objc_msgSend(v150, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "trailingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v110);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v163[10] = v109;
    objc_msgSend(v148, "trailingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:", v107);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v163[11] = v106;
    objc_msgSend(v147, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "trailingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v104);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v163[12] = v103;
    objc_msgSend(v153, "topAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "topAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintGreaterThanOrEqualToAnchor:constant:", v101, 12.0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v163[13] = v100;
    objc_msgSend(v151, "bottomAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "bottomAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintGreaterThanOrEqualToAnchor:constant:", v98, 12.0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v163[14] = v97;
    objc_msgSend(v153, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "centerYAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v163[15] = v55;
    objc_msgSend(v150, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v163[16] = v58;
    v163[17] = val->_subtitleLabelTopSpacingConstraint;
    v163[18] = val->_timestampLabelTopSpacingConstraint;
    objc_msgSend(v147, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v163[19] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 20);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "activateConstraints:", v62);

    objc_msgSend(v144, "centerYAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "centerYAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v162[0] = v65;
    objc_msgSend(v153, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintLessThanOrEqualToAnchor:constant:", v67, -16.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v162[1] = v68;
    objc_msgSend(v144, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "layoutMarginsGuide");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v162[2] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 3);
    v73 = objc_claimAutoreleasedReturnValue();
    saveButtonVisibleConstraints = val->_saveButtonVisibleConstraints;
    val->_saveButtonVisibleConstraints = (NSArray *)v73;

    objc_msgSend(v146, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "centerYAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v161[0] = v77;
    objc_msgSend(v153, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:constant:", v79, -16.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v161[1] = v80;
    objc_msgSend(v146, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "layoutMarginsGuide");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v161[2] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 3);
    v85 = objc_claimAutoreleasedReturnValue();
    viewButtonVisibleConstraints = val->_viewButtonVisibleConstraints;
    val->_viewButtonVisibleConstraints = (NSArray *)v85;

    objc_msgSend(v153, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "layoutMarginsGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v160, 1);
    v91 = objc_claimAutoreleasedReturnValue();
    buttonsHiddenConstraints = val->_buttonsHiddenConstraints;
    val->_buttonsHiddenConstraints = (NSArray *)v91;

    -[CKStickerDetailCell _configureConstraintsForCurrentAction](val, "_configureConstraintsForCurrentAction");
    objc_destroyWeak(&v155);

    objc_destroyWeak(&v157);
    objc_destroyWeak(&location);

  }
  return val;
}

void __53__CKStickerDetailCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_saveButtonSelected");

}

void __53__CKStickerDetailCell_initWithStyle_reuseIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_viewButtonSelected");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKStickerDetailCell;
  -[CKStickerDetailCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKStickerDetailCell setStickerPreview:](self, "setStickerPreview:", 0);
  -[CKStickerDetailCell setTitleText:](self, "setTitleText:", 0);
  -[CKStickerDetailCell setSubtitleText:](self, "setSubtitleText:", 0);
  -[CKStickerDetailCell setTimestampDate:](self, "setTimestampDate:", 0);
  -[CKStickerDetailCell setAdditionalActionType:](self, "setAdditionalActionType:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKStickerDetailCell;
  -[CKStickerDetailCell layoutSubviews](&v6, sel_layoutSubviews);
  -[CKStickerDetailCell labelContainerView](self, "labelContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[CKStickerDetailCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKStickerDetailCell;
  -[CKStickerDetailCell didMoveToWindow](&v4, sel_didMoveToWindow);
  -[CKStickerDetailCell stickerView](self, "stickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAnimationTimerObserving");

}

- (void)setStickerPreview:(id)a3
{
  id v4;
  CKAnimatedImage *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_stickerPreview != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = [CKAnimatedImage alloc];
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CKAnimatedImage initWithImages:durations:](v5, "initWithImages:durations:", v6, &unk_1E286F310);

      v4 = (id)v7;
    }
    objc_storeStrong(&self->_stickerPreview, v4);
    -[CKAnimatedImageView setAnimatedImage:](self->_stickerView, "setAnimatedImage:", self->_stickerPreview);
  }

}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
    -[CKStickerDetailCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitleText:(id)a3
{
  NSString *v4;
  NSString *subtitleText;
  NSUInteger v6;
  double v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    subtitleText = self->_subtitleText;
    self->_subtitleText = v4;

    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleText);
    v6 = -[NSString length](self->_subtitleText, "length");
    v7 = 2.0;
    if (!v6)
      v7 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_subtitleLabelTopSpacingConstraint, "setConstant:", v7);
    -[CKStickerDetailCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTimestampDate:(id)a3
{
  NSDate *v5;
  NSDate **p_timestampDate;
  double v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  p_timestampDate = &self->_timestampDate;
  if (self->_timestampDate != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_timestampDate, a3);
    -[UIDateLabel setDate:](self->_timestampLabel, "setDate:", *p_timestampDate);
    v7 = 3.0;
    if (!*p_timestampDate)
      v7 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_timestampLabelTopSpacingConstraint, "setConstant:", v7);
    -[CKStickerDetailCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setAdditionalActionType:(unint64_t)a3
{
  if (self->_additionalActionType != a3)
  {
    self->_additionalActionType = a3;
    -[CKStickerDetailCell _configureConstraintsForCurrentAction](self, "_configureConstraintsForCurrentAction");
  }
}

- (void)_configureConstraintsForCurrentAction
{
  unint64_t additionalActionType;
  int *v4;
  void *v5;
  void *v6;

  additionalActionType = self->_additionalActionType;
  if (additionalActionType == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_buttonsHiddenConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_viewButtonVisibleConstraints);
    -[UIButton removeFromSuperview](self->_viewButton, "removeFromSuperview");
    -[CKStickerDetailCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_saveButton);

    v4 = &OBJC_IVAR___CKStickerDetailCell__saveButtonVisibleConstraints;
  }
  else if (additionalActionType == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_buttonsHiddenConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_saveButtonVisibleConstraints);
    -[UIButton removeFromSuperview](self->_saveButton, "removeFromSuperview");
    -[CKStickerDetailCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_viewButton);

    v4 = &OBJC_IVAR___CKStickerDetailCell__viewButtonVisibleConstraints;
  }
  else
  {
    if (additionalActionType)
      return;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_saveButtonVisibleConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_viewButtonVisibleConstraints);
    -[UIButton removeFromSuperview](self->_viewButton, "removeFromSuperview");
    -[UIButton removeFromSuperview](self->_saveButton, "removeFromSuperview");
    v4 = &OBJC_IVAR___CKStickerDetailCell__buttonsHiddenConstraints;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v4));
}

- (void)_saveButtonSelected
{
  void *v3;
  void *v4;
  id v5;

  -[CKStickerDetailCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForCell:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKStickerDetailCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveStickerButtonSelectedAtIndexPath:", v5);

}

- (void)_viewButtonSelected
{
  void *v3;
  void *v4;
  id v5;

  -[CKStickerDetailCell _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForCell:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKStickerDetailCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewStickerAppButtonSelectedAtIndexPath:", v5);

}

- (id)stickerPreview
{
  return self->_stickerPreview;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSDate)timestampDate
{
  return self->_timestampDate;
}

- (unint64_t)additionalActionType
{
  return self->_additionalActionType;
}

- (CKStickerDetailCellDelegate)delegate
{
  return (CKStickerDetailCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKAnimatedImageView)stickerView
{
  return self->_stickerView;
}

- (void)setStickerView:(id)a3
{
  objc_storeStrong((id *)&self->_stickerView, a3);
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (void)setLabelContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainerView, a3);
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

- (UIDateLabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabel, a3);
}

- (UIButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
  objc_storeStrong((id *)&self->_viewButton, a3);
}

- (UIButton)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (NSArray)buttonsHiddenConstraints
{
  return self->_buttonsHiddenConstraints;
}

- (void)setButtonsHiddenConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsHiddenConstraints, a3);
}

- (NSArray)saveButtonVisibleConstraints
{
  return self->_saveButtonVisibleConstraints;
}

- (void)setSaveButtonVisibleConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_saveButtonVisibleConstraints, a3);
}

- (NSArray)viewButtonVisibleConstraints
{
  return self->_viewButtonVisibleConstraints;
}

- (void)setViewButtonVisibleConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_viewButtonVisibleConstraints, a3);
}

- (NSLayoutConstraint)subtitleLabelTopSpacingConstraint
{
  return self->_subtitleLabelTopSpacingConstraint;
}

- (void)setSubtitleLabelTopSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabelTopSpacingConstraint, a3);
}

- (NSLayoutConstraint)timestampLabelTopSpacingConstraint
{
  return self->_timestampLabelTopSpacingConstraint;
}

- (void)setTimestampLabelTopSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabelTopSpacingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampLabelTopSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelTopSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_viewButtonVisibleConstraints, 0);
  objc_storeStrong((id *)&self->_saveButtonVisibleConstraints, 0);
  objc_storeStrong((id *)&self->_buttonsHiddenConstraints, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timestampDate, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong(&self->_stickerPreview, 0);
}

@end
