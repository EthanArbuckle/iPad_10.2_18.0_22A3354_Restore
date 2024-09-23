@implementation BKUIPearlCoachingController

- (void)viewDidLoad
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  id v31;
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
  BKUIPearlCoachingDeviceView *v42;
  _BOOL8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  BKUIButtonTray *v61;
  void *v62;
  double v63;
  BKUIButtonTray *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  BKUIPearlInstructionView *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
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
  id v92;
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
  objc_super v175;
  _QWORD v176[4];
  _QWORD v177[2];
  _QWORD v178[7];
  _QWORD v179[2];
  _QWORD v180[7];

  v180[5] = *MEMORY[0x1E0C80C00];
  v175.receiver = self;
  v175.super_class = (Class)BKUIPearlCoachingController;
  -[BKUIPearlCoachingController viewDidLoad](&v175, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEA970]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[BKUIPearlCoachingController setScrollview:](self, "setScrollview:", v8);

  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentSize:", v10, v11);

  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIndicatorStyle:", 2);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  -[BKUIPearlCoachingController setScrollContentView:](self, "setScrollContentView:", v14);

  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  v137 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "topAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "topAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "constraintEqualToAnchor:", v161);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v180[0] = v158;
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "bottomAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "bottomAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v146);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v180[1] = v143;
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "widthAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "widthAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v129);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v180[2] = v127;
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "centerXAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v180[3] = v20;
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v180[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "activateConstraints:", v26);

  -[BKUIPearlCoachingController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v28);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v29);

  v31 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKUIPearlCoachingController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v31);

  v170 = (void *)MEMORY[0x1E0CB3718];
  v174 = v31;
  objc_msgSend(v31, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v36;
  objc_msgSend(v31, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:multiplier:", v39, 0.41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "activateConstraints:", v41);

  v42 = -[BKUIPearlCoachingDeviceView initWithSheetLayout:]([BKUIPearlCoachingDeviceView alloc], "initWithSheetLayout:", -[BKUIPearlCoachingController inSheet](self, "inSheet"));
  -[BKUIPearlCoachingController setDeviceView:](self, "setDeviceView:", v42);

  v43 = -[BKUIPearlCoachingController isDisplayZoomEnabled](self, "isDisplayZoomEnabled");
  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setIsDisplayZoomEnabled:", v43);

  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAlpha:", 0.0);

  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlCoachingController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", v48);

  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v49, "bkui_debugBorder:withWidth:", v50, 1);

  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  v61 = [BKUIButtonTray alloc];
  -[BKUIPearlCoachingController parentViewController](self, "parentViewController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "preferredContentSize");
  v64 = -[BKUIButtonTray initWithFrame:](v61, "initWithFrame:", 0.0, 0.0, v63, 0.0);
  -[BKUIPearlCoachingController setButtonTray:](self, "setButtonTray:", v64);

  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bottomLinkButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController setEscapeHatchButton:](self, "setEscapeHatchButton:", v67);

  -[BKUIPearlCoachingController escapeHatchButton](self, "escapeHatchButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_1EA281248, CFSTR("Pearl-j3xx"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setTitle:forState:", v70, 0);

  -[BKUIPearlCoachingController escapeHatchButton](self, "escapeHatchButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addTarget:action:forControlEvents:", self, sel_escapeHatchButtonPressed_, 0x2000);

  v72 = -[BKUIPearlCoachingController inBuddy](self, "inBuddy") ^ 1;
  -[BKUIPearlCoachingController escapeHatchButton](self, "escapeHatchButton");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setHidden:", v72);

  v74 = objc_alloc_init(BKUIPearlInstructionView);
  -[BKUIPearlCoachingController setInstructionView:](self, "setInstructionView:", v74);

  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setDarkMode:", 1);

  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v78) = 1148846080;
  objc_msgSend(v77, "setContentCompressionResistancePriority:forAxis:", 1, v78);

  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addSubview:", v80);

  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addSubview:", v82);

  v126 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "topAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v159);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v156;
  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "leadingAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "leadingAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToAnchor:", v144);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v141;
  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "trailingAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToAnchor:", v130);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v178[2] = v128;
  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "bottomAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:constant:", v120, 45.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v178[3] = v119;
  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "leadingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v178[4] = v114;
  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v178[5] = v85;
  -[BKUIPearlCoachingController buttonTray](self, "buttonTray");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController scrollContentView](self, "scrollContentView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v178[6] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 7);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "activateConstraints:", v91);

  v92 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v92, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKUIPearlCoachingController view](self, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addSubview:", v92);

  v163 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v92, "topAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "topAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "constraintEqualToAnchor:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = v96;
  v97 = v92;
  v172 = v92;
  objc_msgSend(v92, "heightAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "heightAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:multiplier:", v100, 0.75);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "activateConstraints:", v102);

  v139 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "topAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "bottomAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "constraintEqualToAnchor:", v160);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v157;
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "leadingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "leadingAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:", v145);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v142;
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "trailingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "trailingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v105;
  -[BKUIPearlCoachingController scrollview](self, "scrollview");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCoachingController view](self, "view");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "bottomAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 4);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "activateConstraints:", v111);

  -[BKUIPearlCoachingController updateInstructionText](self, "updateInstructionText");
}

- (void)setInBuddy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_inBuddy = a3;
  v3 = !a3;
  -[BKUIPearlCoachingController escapeHatchButton](self, "escapeHatchButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlCoachingController;
  -[BKUIPearlCoachingController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[BKUIPearlCoachingController resetDeviceView](self, "resetDeviceView");
  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)stopCoachingAnimation
{
  id v2;

  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimation");

}

- (void)deviceOrientationChanged
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = -[BKUIPearlCoachingController needsToShow](self, "needsToShow");
  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;

  if (v3)
  {
    if (v6 == 1.0)
      v7 = 0.5;
    else
      v7 = 0.899999976;
    -[BKUIPearlCoachingController resetDeviceView](self, "resetDeviceView");
    v9[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke;
    v10[3] = &unk_1EA27FB98;
    v10[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke_2;
    v9[3] = &unk_1EA27FC00;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v10, v9, v7, 0.300000012);
  }
  else
  {
    -[BKUIPearlCoachingController deviceView](self, "deviceView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);

  }
}

void __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "deviceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));

  objc_msgSend(*(id *)(a1 + 32), "deviceView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimation");

}

- (BOOL)resetDeviceView
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[BKUIPearlCoachingController didOrientationChange](self, "didOrientationChange");
  if (v3)
  {
    -[BKUIPearlCoachingController deviceView](self, "deviceView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[BKUIPearlCoachingController deviceView](self, "deviceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOrientation:", -[BKUIPearlCoachingController orientation](self, "orientation"));

    -[BKUIPearlCoachingController updateInstructionText](self, "updateInstructionText");
  }
  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  BOOL v8;
  BOOL v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;
  BOOL v15;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)BKUIPearlCoachingController;
  v7 = a4;
  -[BKUIPearlCoachingController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = -[BKUIPearlCoachingController resetDeviceView](self, "resetDeviceView");
  v9 = -[BKUIPearlCoachingController needsToShow](self, "needsToShow");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1EA27FC28;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1EA27FC28;
  v11 = v8;
  v12 = v9;
  v10[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v10);

}

void __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceView");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setAlpha:", 1.0);

    }
  }
}

void __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceView");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "startAnimation");

    }
  }
}

- (void)handleRotation
{
  _BOOL4 v3;
  _BOOL4 v4;
  id v5;

  v3 = -[BKUIPearlCoachingController resetDeviceView](self, "resetDeviceView");
  v4 = -[BKUIPearlCoachingController needsToShow](self, "needsToShow");
  if (v3 && v4)
  {
    -[BKUIPearlCoachingController deviceView](self, "deviceView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAnimation");

  }
}

- (void)escapeHatchButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _BKUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Skipped coaching", v6, 2u);
  }

  -[BKUIPearlCoachingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coachingSkipped");

}

- (BOOL)needsToShow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = 4;
  v4 = MGGetProductType();
  v5 = v4;
  if (v4 > 2619317133)
  {
    if (v4 != 2619317134)
    {
      v6 = 3241053352;
      goto LABEL_6;
    }
LABEL_7:
    LODWORD(v3) = -[BKUIPearlCoachingController orientation](self, "orientation") != v3;
    goto LABEL_8;
  }
  if (v4 == 555503454)
    goto LABEL_7;
  v6 = 2487868872;
LABEL_6:
  if (v4 == v6)
    goto LABEL_7;
  v3 = 1;
  if (-[BKUIPearlCoachingController orientation](self, "orientation") == 1)
    goto LABEL_7;
LABEL_8:
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218752;
    v10 = v5;
    v11 = 1024;
    v12 = v3;
    v13 = 2048;
    v14 = -[BKUIPearlCoachingController orientation](self, "orientation");
    v15 = 1024;
    v16 = -[BKUIPearlCoachingController isDeviceFlat](self, "isDeviceFlat");
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "Coaching controller needs to show: model: %ld, %i, orientation: %li, flat: %i", (uint8_t *)&v9, 0x22u);
  }

  return v3;
}

- (void)updateInstructionText
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134)
      goto LABEL_7;
    v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454)
      goto LABEL_7;
    v4 = 2487868872;
  }
  if (v3 != v4)
  {
    v13 = -[BKUIPearlCoachingController orientation](self, "orientation");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v12 = CFSTR("Pearl-j3xx");
    if (v13 == 2)
    {
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ROTATE_GENERAL"), &stru_1EA281248, CFSTR("Pearl-j3xx"));
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("ROTATE_TO_PORTRAIT_UPSIDE_DOWN_DETAIL");
    }
    else
    {
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ROTATE_TO_PORTRAIT"), &stru_1EA281248, CFSTR("Pearl-j3xx"));
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("ROTATE_TO_PORTRAIT_DETAIL");
    }
    goto LABEL_13;
  }
LABEL_7:
  v5 = -[BKUIPearlCoachingController orientation](self, "orientation");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 != 3)
  {
    v12 = CFSTR("Pearl-Landscape");
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ROTATE_TO_LANDSCAPE"), &stru_1EA281248, CFSTR("Pearl-Landscape"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("ROTATE_TO_LANDSCAPE_DETAIL");
LABEL_13:
    v11 = v12;
    goto LABEL_14;
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ROTATE_GENERAL"), &stru_1EA281248, CFSTR("Pearl-j3xx"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = CFSTR("ROTATE_TO_LANDSCAPE_UPSIDE_DOWN_DETAIL");
  v11 = CFSTR("Pearl-Landscape");
LABEL_14:
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1EA281248, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInstruction:", v19);

  -[BKUIPearlCoachingController instructionView](self, "instructionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDetail:", v16);

}

- (BOOL)didOrientationChange
{
  int64_t v3;
  void *v4;

  v3 = -[BKUIPearlCoachingController orientation](self, "orientation");
  -[BKUIPearlCoachingController deviceView](self, "deviceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 != objc_msgSend(v4, "orientation");

  return v3;
}

- (BOOL)isDeviceFlat
{
  return (unint64_t)(objc_msgSend(MEMORY[0x1E0CEA508], "currentDeviceOrientationAllowingAmbiguous:", 0) - 5) < 2;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (BOOL)isDisplayZoomEnabled
{
  return self->_isDisplayZoomEnabled;
}

- (void)setIsDisplayZoomEnabled:(BOOL)a3
{
  self->_isDisplayZoomEnabled = a3;
}

- (BKUIPearlCoachingControllerDelegate)delegate
{
  return (BKUIPearlCoachingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKUIPearlCoachingDeviceView)deviceView
{
  return self->_deviceView;
}

- (void)setDeviceView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceView, a3);
}

- (BKUIPearlInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionView, a3);
}

- (UIButton)escapeHatchButton
{
  return self->_escapeHatchButton;
}

- (void)setEscapeHatchButton:(id)a3
{
  objc_storeStrong((id *)&self->_escapeHatchButton, a3);
}

- (BKUIButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (UIScrollView)scrollview
{
  return self->_scrollview;
}

- (void)setScrollview:(id)a3
{
  objc_storeStrong((id *)&self->_scrollview, a3);
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_scrollview, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_escapeHatchButton, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_deviceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
