@implementation NTKUpNextMatchupScoreView

- (NTKUpNextMatchupScoreView)initWithFrame:(CGRect)a3
{
  NTKUpNextMatchupScoreView *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CLKFont *v25;
  CLKFont *regularMatchupFont;
  void *v27;
  void *v28;
  uint64_t v29;
  NTKUpNextMatchupScoreView *v30;
  uint64_t v31;
  CLKUIColoringLabel *statusLabel;
  uint64_t v33;
  CLKUIColoringLabel *timeLabel;
  id *v35;
  void (**v36)(void);
  uint64_t v37;
  id v38;
  double v39;
  double v40;
  uint64_t v41;
  id v42;
  double v43;
  double v44;
  uint64_t v45;
  id v46;
  double v47;
  double v48;
  uint64_t v49;
  id v50;
  double v51;
  double v52;
  id *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
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
  double v164;
  void *v165;
  void (**v166)(void);
  void (**v167)(void);
  id v168;
  void (**v169)(void);
  id v170;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  NTKUpNextMatchupScoreView *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  CLKFont *v180;
  void *v181;
  NTKUpNextMatchupScoreView *v182;
  _QWORD v183[4];
  id *v184;
  _QWORD v185[4];
  id v186;
  id *v187;
  _QWORD aBlock[4];
  id v189;
  id v190;
  NTKUpNextMatchupScoreView *v191;
  objc_super v192;
  _QWORD v193[29];
  void *v194;
  _QWORD v195[4];

  v195[2] = *MEMORY[0x1E0C80C00];
  v192.receiver = self;
  v192.super_class = (Class)NTKUpNextMatchupScoreView;
  v3 = -[NTKUpNextMatchupScoreView initWithFrame:](&v192, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3)
    return v3;
  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (!WeakRetained)
    goto LABEL_6;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (v9 != v6)
  {

LABEL_6:
    v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_1, v6);
    _LayoutConstants___previousCLKDeviceVersion_1 = objc_msgSend(v6, "version");

    ___LayoutConstants_block_invoke_1(v13, (uint64_t)v6);
    goto LABEL_7;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _LayoutConstants___previousCLKDeviceVersion_1;

  if (v10 != v11)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  v14 = *(double *)&_LayoutConstants_constants_0;
  v15 = *(double *)&_LayoutConstants_constants_1;
  v16 = *(double *)&_LayoutConstants_constants_2;
  v17 = *(double *)&_LayoutConstants_constants_3;
  v18 = *(double *)&_LayoutConstants_constants_4;
  v164 = *(double *)&_LayoutConstants_constants_5;
  v19 = *(double *)&_LayoutConstants_constants_6;
  v20 = *(double *)&_LayoutConstants_constants_7;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v15, *MEMORY[0x1E0DC1438]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fontDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v174 = v6;
  v173 = v22;
  if (CLKIsCurrentLocaleNonLatin())
  {
    v23 = v22;
  }
  else
  {
    objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v172 = v23;
  objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v23, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v3->_statusFont, v24);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v14, *MEMORY[0x1E0DC1440]);
  v25 = (CLKFont *)objc_claimAutoreleasedReturnValue();
  regularMatchupFont = v3->_regularMatchupFont;
  v3->_regularMatchupFont = v25;
  v180 = v25;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v14, *MEMORY[0x1E0DC1420]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v3->_boldMatchupFont, v27);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke;
  aBlock[3] = &unk_1E6BCE1F8;
  v189 = v28;
  v190 = v24;
  v30 = v3;
  v191 = v30;
  v171 = v24;
  v170 = v28;
  v169 = (void (**)(void))_Block_copy(aBlock);
  v169[2]();
  v31 = objc_claimAutoreleasedReturnValue();
  statusLabel = v30->_statusLabel;
  v30->_statusLabel = (CLKUIColoringLabel *)v31;

  ((void (*)(void (**)(void)))v169[2])(v169);
  v33 = objc_claimAutoreleasedReturnValue();
  timeLabel = v30->_timeLabel;
  v30->_timeLabel = (CLKUIColoringLabel *)v33;
  v182 = v30;

  v185[0] = v29;
  v185[1] = 3221225472;
  v185[2] = __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_2;
  v185[3] = &unk_1E6BCE220;
  v186 = v27;
  v35 = v30;
  v187 = v35;
  v168 = v27;
  v36 = (void (**)(void))_Block_copy(v185);
  v36[2]();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v35[53];
  v35[53] = (id)v37;

  LODWORD(v39) = 1132068864;
  objc_msgSend(v35[53], "setContentCompressionResistancePriority:forAxis:", 0, v39);
  LODWORD(v40) = 1132068864;
  objc_msgSend(v35[53], "setContentHuggingPriority:forAxis:", 0, v40);
  ((void (*)(void (**)(void)))v36[2])(v36);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v35[54];
  v35[54] = (id)v41;

  LODWORD(v43) = 1148846080;
  objc_msgSend(v35[54], "setContentCompressionResistancePriority:forAxis:", 0, v43);
  LODWORD(v44) = 1148846080;
  objc_msgSend(v35[54], "setContentHuggingPriority:forAxis:", 0, v44);
  ((void (*)(void (**)(void)))v36[2])(v36);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = v35[56];
  v35[56] = (id)v45;

  LODWORD(v47) = 1132068864;
  objc_msgSend(v35[56], "setContentCompressionResistancePriority:forAxis:", 0, v47);
  LODWORD(v48) = 1132068864;
  objc_msgSend(v35[56], "setContentHuggingPriority:forAxis:", 0, v48);
  v167 = v36;
  ((void (*)(void (**)(void)))v36[2])(v36);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v35[57];
  v35[57] = (id)v49;

  LODWORD(v51) = 1148846080;
  objc_msgSend(v35[57], "setContentCompressionResistancePriority:forAxis:", 0, v51);
  LODWORD(v52) = 1148846080;
  objc_msgSend(v35[57], "setContentHuggingPriority:forAxis:", 0, v52);
  v183[0] = v29;
  v183[1] = 3221225472;
  v183[2] = __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_3;
  v183[3] = &unk_1E6BCE248;
  v53 = v35;
  v184 = v53;
  v166 = (void (**)(void))_Block_copy(v183);
  v166[2]();
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = v53[52];
  v53[52] = (id)v54;

  ((void (*)(void (**)(void)))v166[2])(v166);
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = v53[55];
  v53[55] = (id)v56;

  v58 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  v59 = v53[64];
  v53[64] = v58;

  objc_msgSend(v53, "addLayoutGuide:", v53[64]);
  objc_msgSend(v53[64], "setIdentifier:", CFSTR("UpNextMatchupLogoLayoutGuide"));
  v60 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  v61 = v53[65];
  v53[65] = v60;

  objc_msgSend(v53, "addLayoutGuide:", v53[65]);
  objc_msgSend(v53[65], "setIdentifier:", CFSTR("UpNextMatchupDescriptionLayoutGuide"));
  objc_msgSend(v35[53], "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[64], "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, v18);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v195[0] = v64;
  objc_msgSend(v35[56], "leadingAnchor");
  v175 = v3;
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[64], "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, v18);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v195[1] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = v53[66];
  v53[66] = (id)v68;

  objc_msgSend(v35[54], "firstBaselineAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, v16 + v17);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = v53[67];
  v53[67] = (id)v73;

  objc_msgSend(v53[65], "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[54], "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintLessThanOrEqualToAnchor:", v76);
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v77) = 1148846080;
  objc_msgSend(v181, "setPriority:", v77);
  objc_msgSend(v53[65], "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[57], "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:", v79);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v80) = 1148846080;
  objc_msgSend(v179, "setPriority:", v80);
  objc_msgSend(v53[65], "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[54], "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = v83;
  LODWORD(v84) = 1144750080;
  objc_msgSend(v83, "setPriority:", v84);
  objc_msgSend(v53[65], "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[57], "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v161 = v87;
  LODWORD(v88) = 1144750080;
  objc_msgSend(v87, "setPriority:", v88);
  LODWORD(v89) = 1148846080;
  -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v182->_timeLabel, "setContentCompressionResistancePriority:forAxis:", 0, v89);
  LODWORD(v90) = 1144750080;
  -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v182->_statusLabel, "setContentCompressionResistancePriority:forAxis:", 0, v90);
  objc_msgSend(v35[54], "trailingAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[65], "trailingAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v160);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v193[0] = v159;
  objc_msgSend(v35[57], "trailingAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[65], "trailingAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "constraintEqualToAnchor:", v157);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v193[1] = v156;
  v193[2] = v181;
  v193[3] = v179;
  v193[4] = v83;
  v193[5] = v87;
  objc_msgSend(v35[53], "trailingAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[65], "leadingAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -v164;
  objc_msgSend(v155, "constraintEqualToAnchor:constant:", v154, -v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v193[6] = v165;
  objc_msgSend(v35[56], "trailingAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[65], "leadingAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "constraintEqualToAnchor:constant:", v152, v91);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v193[7] = v151;
  -[CLKUIColoringLabel trailingAnchor](v182->_statusLabel, "trailingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel leadingAnchor](v182->_timeLabel, "leadingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "constraintEqualToAnchor:constant:", v149, v91);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v193[8] = v148;
  objc_msgSend(v53[52], "centerXAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[64], "centerXAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToAnchor:", v146);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v193[9] = v145;
  objc_msgSend(v53[52], "centerYAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[54], "firstBaselineAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKFont capHeight](v180, "capHeight");
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v143, v92 * -0.5);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v193[10] = v142;
  objc_msgSend(v53[52], "widthAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "constraintLessThanOrEqualToConstant:", v19);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v193[11] = v139;
  objc_msgSend(v53[52], "heightAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "constraintLessThanOrEqualToConstant:", v20);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v193[12] = v137;
  objc_msgSend(v53[55], "centerXAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53[64], "centerXAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v193[13] = v134;
  objc_msgSend(v53[55], "centerYAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[57], "firstBaselineAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKFont capHeight](v180, "capHeight");
  objc_msgSend(v133, "constraintEqualToAnchor:constant:", v132, v93 * -0.5);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v193[14] = v131;
  objc_msgSend(v53[55], "widthAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintLessThanOrEqualToConstant:", v19);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v193[15] = v129;
  objc_msgSend(v53[55], "heightAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintLessThanOrEqualToConstant:", v20);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v193[16] = v128;
  objc_msgSend(v53[64], "topAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:", v125);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v193[17] = v124;
  objc_msgSend(v53[64], "leadingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:", v122);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v193[18] = v121;
  objc_msgSend(v53[64], "bottomAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v193[19] = v118;
  objc_msgSend(v53[64], "widthAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToConstant:", v19);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v193[20] = v117;
  objc_msgSend(v53[65], "trailingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v193[21] = v114;
  -[CLKUIColoringLabel trailingAnchor](v182->_timeLabel, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v193[22] = v111;
  objc_msgSend(v35[54], "firstBaselineAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[53], "firstBaselineAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v177);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v193[23] = v109;
  objc_msgSend(v35[57], "firstBaselineAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[56], "firstBaselineAnchor");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v176);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v193[24] = v107;
  -[CLKUIColoringLabel firstBaselineAnchor](v182->_timeLabel, "firstBaselineAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel firstBaselineAnchor](v182->_statusLabel, "firstBaselineAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToAnchor:", v106);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v193[25] = v105;
  -[CLKUIColoringLabel leadingAnchor](v182->_statusLabel, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v193[26] = v95;
  objc_msgSend(v35[57], "firstBaselineAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[54], "firstBaselineAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, v16);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v193[27] = v98;
  -[CLKUIColoringLabel firstBaselineAnchor](v182->_statusLabel, "firstBaselineAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[57], "firstBaselineAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, v16);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v193[28] = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 29);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v175;
  objc_msgSend(v53, "addConstraints:", v102);
  objc_msgSend(v53, "addConstraints:", v53[66]);
  objc_msgSend(v53, "addConstraints:", v53[67]);

  return v3;
}

id __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc((Class)off_1E6BCA6E0);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setTextColor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setFont:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", v3);
  return v3;
}

id __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)off_1E6BCA6E0);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  objc_msgSend(v3, "setFont:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v3);
  return v3;
}

id __43__NTKUpNextMatchupScoreView_initWithFrame___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setContentMode:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return v3;
}

- (void)configureWithMatchup:(id)a3
{
  UIImageView *homeLogoImageView;
  void *v5;
  void *v6;
  UIImageView *awayLogoIamgeView;
  void *v8;
  void *v9;
  CLKUIColoringLabel *homeNameLabel;
  void *v11;
  CLKUIColoringLabel *homeDescriptionLabel;
  void *v13;
  CLKUIColoringLabel *awayNameLabel;
  void *v15;
  CLKUIColoringLabel *awayDescriptionLabel;
  void *v17;
  NSDate *timeForLabel;
  CLKUIColoringLabel *v19;
  void *v20;
  CLKUIColoringLabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CLKUIColoringLabel *v28;
  void *v29;
  CLKUIColoringLabel *v30;
  void *v31;
  NSDate *v32;
  NSDate *v33;
  CLKUIColoringLabel *statusLabel;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  CLKUIColoringLabel *v40;
  CLKUIColoringLabel *v41;
  void *v42;
  CLKUIColoringLabel *v43;
  void *v44;
  void *v45;
  void *v46;
  CLKUIColoringLabel *v47;
  CLKFont *boldMatchupFont;
  uint64_t v49;
  CLKUIColoringLabel *v50;
  uint64_t v51;
  CLKUIColoringLabel *v52;
  void *v53;
  CLKUIColoringLabel *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  v60 = a3;
  homeLogoImageView = self->_homeLogoImageView;
  objc_msgSend(v60, "homeTeamImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](homeLogoImageView, "setImage:", v6);

  awayLogoIamgeView = self->_awayLogoIamgeView;
  objc_msgSend(v60, "awayTeamImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](awayLogoIamgeView, "setImage:", v9);

  homeNameLabel = self->_homeNameLabel;
  objc_msgSend(v60, "homeTeamName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](homeNameLabel, "setText:", v11);

  homeDescriptionLabel = self->_homeDescriptionLabel;
  objc_msgSend(v60, "homeTeamDetail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](homeDescriptionLabel, "setText:", v13);

  awayNameLabel = self->_awayNameLabel;
  objc_msgSend(v60, "awayTeamName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](awayNameLabel, "setText:", v15);

  awayDescriptionLabel = self->_awayDescriptionLabel;
  objc_msgSend(v60, "awayTeamDetail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](awayDescriptionLabel, "setText:", v17);

  timeForLabel = self->_timeForLabel;
  self->_timeForLabel = 0;

  switch(objc_msgSend(v60, "status"))
  {
    case 0:
    case 1:
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_regularMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayNameLabel, "setFont:", self->_regularMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_homeDescriptionLabel, "setFont:", self->_regularMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayDescriptionLabel, "setFont:", self->_regularMatchupFont);
      v19 = self->_homeDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_statusLabel, "textColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v19, "setTextColor:", v20);

      v21 = self->_awayDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_statusLabel, "textColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v21, "setTextColor:", v22);

      v23 = (void *)MEMORY[0x1E0C94560];
      objc_msgSend(v60, "matchupStartDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "textProviderWithDate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      NTKClockFaceLocalizedString(CFSTR("UP_NEXT_MATCHUP_FORMAT"), CFSTR("7:15PM Game"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", v26, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "finalize");
      -[CLKUIColoringLabel setTextProvider:](self->_statusLabel, "setTextProvider:", v27);
      +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_timeLabel);

      goto LABEL_16;
    case 2:
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_boldMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayNameLabel, "setFont:", self->_boldMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_homeDescriptionLabel, "setFont:", self->_regularMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayDescriptionLabel, "setFont:", self->_regularMatchupFont);
      v28 = self->_homeDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_homeNameLabel, "textColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v28, "setTextColor:", v29);

      v30 = self->_awayDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_awayNameLabel, "textColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v30, "setTextColor:", v31);

      objc_msgSend(v60, "matchupDateFetched");
      v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v33 = self->_timeForLabel;
      self->_timeForLabel = v32;

      -[NTKUpNextMatchupScoreView updateTimeLabel](self, "updateTimeLabel");
      statusLabel = self->_statusLabel;
      v35 = (void *)MEMORY[0x1E0C94530];
      objc_msgSend(v60, "matchupProgress");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (const __CFString *)v36;
      else
        v38 = &stru_1E6BDC918;
      objc_msgSend(v35, "textProviderWithText:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextProvider:](statusLabel, "setTextProvider:", v39);

      break;
    case 3:
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_boldMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayNameLabel, "setFont:", self->_boldMatchupFont);
      v40 = self->_homeDescriptionLabel;
      goto LABEL_9;
    case 4:
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_regularMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayNameLabel, "setFont:", self->_regularMatchupFont);
      v40 = self->_homeDescriptionLabel;
LABEL_9:
      -[CLKUIColoringLabel setFont:](v40, "setFont:", self->_regularMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayDescriptionLabel, "setFont:", self->_regularMatchupFont);
      v41 = self->_homeDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_statusLabel, "textColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v41, "setTextColor:", v42);

      v43 = self->_awayDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_statusLabel, "textColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v43, "setTextColor:", v44);

      v45 = (void *)MEMORY[0x1E0C94530];
      objc_msgSend(v60, "matchupProgress");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "textProviderWithText:", v46);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 5:
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_boldMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_awayNameLabel, "setFont:", self->_boldMatchupFont);
      -[CLKUIColoringLabel setFont:](self->_homeDescriptionLabel, "setFont:", self->_boldMatchupFont);
      v47 = self->_awayDescriptionLabel;
      boldMatchupFont = self->_boldMatchupFont;
      goto LABEL_14;
    case 6:
      v49 = 488;
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_boldMatchupFont);
      v50 = self->_awayNameLabel;
      v51 = 496;
      goto LABEL_13;
    case 7:
      v49 = 496;
      -[CLKUIColoringLabel setFont:](self->_homeNameLabel, "setFont:", self->_regularMatchupFont);
      v50 = self->_awayNameLabel;
      v51 = 488;
LABEL_13:
      -[CLKUIColoringLabel setFont:](v50, "setFont:", *(Class *)((char *)&self->super.super.super.isa + v51));
      -[CLKUIColoringLabel setFont:](self->_homeDescriptionLabel, "setFont:", *(Class *)((char *)&self->super.super.super.isa + v49));
      v47 = self->_awayDescriptionLabel;
      boldMatchupFont = *(CLKFont **)((char *)&self->super.super.super.isa + v51);
LABEL_14:
      -[CLKUIColoringLabel setFont:](v47, "setFont:", boldMatchupFont);
      v52 = self->_homeDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_homeNameLabel, "textColor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v52, "setTextColor:", v53);

      v54 = self->_awayDescriptionLabel;
      -[CLKUIColoringLabel textColor](self->_awayNameLabel, "textColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setTextColor:](v54, "setTextColor:", v55);

      v56 = (void *)MEMORY[0x1E0C94530];
      objc_msgSend(v60, "matchupProgress");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "textProviderWithText:", v57);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      -[CLKUIColoringLabel setTextProvider:](self->_statusLabel, "setTextProvider:", v25);
      +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_timeLabel);
LABEL_16:

      break;
    default:
      break;
  }
  -[CLKUIColoringLabel textProvider](self->_statusLabel, "textProvider");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setPaused:", -[NTKUpNextMatchupScoreView isPaused](self, "isPaused"));

  -[CLKUIColoringLabel textProvider](self->_timeLabel, "textProvider");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setPaused:", -[NTKUpNextMatchupScoreView isPaused](self, "isPaused"));

}

- (void)updateTimeLabel
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  CLKUIColoringLabel *timeLabel;
  id v8;

  if (self->_timeForLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_timeStringForFetchDate:", self->_timeForLabel);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = &stru_1E6BDC918;
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

    timeLabel = self->_timeLabel;
    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel setTextProvider:](timeLabel, "setTextProvider:", v8);
  }
}

+ (id)_timeStringForFetchDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 126, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 126, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDateComponents:toDateComponents:options:", 96, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hour");
  v11 = objc_msgSend(v9, "minute");
  v12 = v11;
  if (v10 < 0 || v11 < 0)
  {
    if (v10)
    {
      if (v10 >= 0)
        v14 = v10;
      else
        v14 = -v10;
      NTKClockFaceLocalizedString(CFSTR("COUNTDOWN_HOUR_SHORT"), CFSTR("H"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedLowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%d%@"), v14, v16);
      v10 = objc_claimAutoreleasedReturnValue();

    }
    if (v12)
    {
      NTKClockFaceLocalizedString(CFSTR("COUNTDOWN_MINUTE_SHORT"), CFSTR("M"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedLowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 >= 0)
        v19 = v12;
      else
        v19 = -v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld%@"), v19, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v10, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v10, v20);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = v20;
      }
      v22 = (uint64_t)v21;

      v10 = v22;
    }
    v23 = (void *)MEMORY[0x1E0CB3940];
    NTKClockFaceLocalizedString(CFSTR("UP_NEXT_SPORTS_TIME_SINCE"), CFSTR("%@ ago"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v24, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NTKClockFaceLocalizedString(CFSTR("COUNTDOWN_NOW"), CFSTR("now"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CLKUIColoringLabel textProvider](self->_statusLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_timeLabel, "textProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v5;
  CLKUIColoringLabel *homeNameLabel;
  void *v7;
  CLKUIColoringLabel *awayNameLabel;
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
  id v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v5 = objc_claimAutoreleasedReturnValue();
  v19 = (id)v5;
  if (fabs(a3) >= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v19, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel setTextColor:](self->_statusLabel, "setTextColor:", v9);
    -[CLKUIColoringLabel setTextColor:](self->_timeLabel, "setTextColor:", v9);
    -[NTKUpNextMatchupScoreView filterProvider](self, "filterProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filtersForView:style:fraction:", self, 2, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CLKUIColoringLabel layer](self->_homeNameLabel, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFilters:", v12);

      -[CLKUIColoringLabel layer](self->_awayNameLabel, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v12);

    }
    -[NTKUpNextMatchupScoreView filterProvider](self, "filterProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filtersForView:style:fraction:", self, 1, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[UIImageView layer](self->_homeLogoImageView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFilters:", v16);

      -[UIImageView layer](self->_awayLogoIamgeView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFilters:", v16);

    }
  }
  else
  {
    -[CLKUIColoringLabel setTextColor:](self->_timeLabel, "setTextColor:", v5);
    -[CLKUIColoringLabel setTextColor:](self->_statusLabel, "setTextColor:", v19);
    homeNameLabel = self->_homeNameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](homeNameLabel, "setTextColor:", v7);

    awayNameLabel = self->_awayNameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](awayNameLabel, "setTextColor:", v9);
  }

}

- (void)updateMonochromeColor
{
  CLKUIColoringLabel *statusLabel;
  void *v4;
  CLKUIColoringLabel *timeLabel;
  void *v6;
  CLKUIColoringLabel *homeNameLabel;
  void *v8;
  CLKUIColoringLabel *awayNameLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  statusLabel = self->_statusLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](statusLabel, "setTextColor:", v4);

  timeLabel = self->_timeLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](timeLabel, "setTextColor:", v6);

  homeNameLabel = self->_homeNameLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](homeNameLabel, "setTextColor:", v8);

  awayNameLabel = self->_awayNameLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](awayNameLabel, "setTextColor:", v10);

  -[NTKUpNextMatchupScoreView filterProvider](self, "filterProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filtersForView:style:", self, 2);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CLKUIColoringLabel layer](self->_homeNameLabel, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v18);

    -[CLKUIColoringLabel layer](self->_awayNameLabel, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v18);

  }
  -[NTKUpNextMatchupScoreView filterProvider](self, "filterProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filtersForView:style:", self, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UIImageView layer](self->_homeLogoImageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilters:", v15);

    -[UIImageView layer](self->_awayLogoIamgeView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFilters:", v15);

  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_withoutDateLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_withLogoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_logoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_statusFont, 0);
  objc_storeStrong((id *)&self->_regularMatchupFont, 0);
  objc_storeStrong((id *)&self->_boldMatchupFont, 0);
  objc_storeStrong((id *)&self->_timeForLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_awayDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_awayNameLabel, 0);
  objc_storeStrong((id *)&self->_awayLogoIamgeView, 0);
  objc_storeStrong((id *)&self->_homeDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_homeNameLabel, 0);
  objc_storeStrong((id *)&self->_homeLogoImageView, 0);
}

@end
