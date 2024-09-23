@implementation InfoDiagramView

- (InfoDiagramView)initWithFrame:(CGRect)a3 wanConnectedBaseProductID:(unsigned int)a4
{
  InfoDiagramView *v5;
  const char *v6;
  uint64_t v7;
  InfoDiagramView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)InfoDiagramView;
  v5 = -[InfoDiagramView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v5;
  if (v5)
  {
    v5->wanBaseProductID = a4;
    v5->replacementProductID = 0;
    objc_msgSend_commonInit(v5, v6, v7);
  }
  return v8;
}

- (InfoDiagramView)initWithFrame:(CGRect)a3 wanConnectedBaseProductID:(unsigned int)a4 replacementProductID:(unsigned int)a5
{
  InfoDiagramView *v7;
  const char *v8;
  uint64_t v9;
  InfoDiagramView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)InfoDiagramView;
  v7 = -[InfoDiagramView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v7;
  if (v7)
  {
    v7->wanBaseProductID = a4;
    v7->replacementProductID = a5;
    objc_msgSend_commonInit(v7, v8, v9);
  }
  return v10;
}

- (void)commonInit
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  void *v6;
  AUImageView *v7;
  const char *v8;
  AUImageView *v9;
  const char *v10;
  const char *v11;
  void *v12;
  AUImageView *broadbandImageView;
  const char *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  AUImageView *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  const char *v35;
  void *v36;
  NSDictionary *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  NSDictionary *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  AUImageView *v57;
  const char *v58;
  AUImageView *v59;
  void **p_wanConnectedBaseImageView;
  const char *v61;
  const char *v62;
  void *v63;
  AUImageView *wanConnectedBaseImageView;
  const char *v65;
  uint64_t v66;
  const char *v67;
  double v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  AUImageView *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  unsigned int wanBaseProductID;
  const __CFString *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  double v85;
  const char *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  int64_t sizeClass;
  double v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  NSDictionary *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  void *v102;
  void *v103;
  NSDictionary *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  NSDictionary *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  void *v113;
  NSDictionary *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  void *v118;
  NSDictionary *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  const char *v123;
  double v124;
  double v125;
  const char *v126;
  uint64_t v127;
  double v128;
  double v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  AUImageView *v135;
  const char *v136;
  AUImageView *v137;
  const char *v138;
  const char *v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  double v146;
  double v147;
  double v148;
  const char *v149;
  uint64_t v150;
  NSDictionary *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  void *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  double v161;
  double v162;
  double v163;
  const char *v164;
  uint64_t v165;
  NSDictionary *v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  const char *v170;
  void *v171;
  AUImageView *v172;
  const char *v173;
  AUImageView *v174;
  const char *v175;
  const char *v176;
  void *v177;
  AUImageView *replacementBaseImageView;
  const char *v179;
  uint64_t v180;
  const char *v181;
  double v182;
  uint64_t v183;
  const char *v184;
  void *v185;
  AUImageView *v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  void *v192;
  NSDictionary *v193;
  const char *v194;
  uint64_t v195;
  const char *v196;
  const char *v197;
  double v198;
  double v199;
  const char *v200;
  uint64_t v201;
  double v202;
  double v203;
  const char *v204;
  uint64_t v205;
  const char *v206;
  AULabel **p_replacementBaseLabel;
  const __CFString *v208;
  const char *v209;
  const char *v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  double v214;
  const char *v215;
  const char *v216;
  const char *v217;
  uint64_t v218;
  const __CFString *v219;
  __CFString *v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  const __CFString *v224;
  uint64_t v225;
  AULabel *v226;
  const char *v227;
  const char *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  double v232;
  const char *v233;
  const char *v234;
  const char *v235;
  const char *v236;
  const char *v237;
  void *v238;
  NSDictionary *v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  UIView *v243;
  const char *v244;
  const char *v245;
  InfoDiagramCablingLayer *v246;
  const char *v247;
  uint64_t v248;
  id v249;
  const char *v250;
  const char *v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  const char *v256;
  uint64_t v257;
  UIView *v258;
  const char *v259;
  const char *v260;
  InfoDiagramCablingLayer *v261;
  const char *v262;
  uint64_t v263;
  id v264;
  const char *v265;
  const char *v266;
  const char *v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  const char *v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  double v276;
  const char *v277;
  double v278;
  const char *v279;
  unsigned int replacementProductID;
  const __CFString *v281;
  uint64_t v282;
  const __CFString *v283;
  uint64_t v284;
  const __CFString *v285;
  _QWORD v286[2];

  v286[1] = *MEMORY[0x24BDAC8D0];
  replacementProductID = self->replacementProductID;
  self->sizeClass = sub_21A731B64(self, a2, v2);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self, v4, 0);
  v6 = (void *)objc_msgSend_imageForInformationalDiagramNamed_small_(ImageStore, v5, (uint64_t)CFSTR("Cable-Modem"), self->sizeClass == 1);
  v7 = [AUImageView alloc];
  v9 = (AUImageView *)(id)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6);
  self->broadbandImageView = v9;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v9, v10, 0);
  objc_msgSend_addSubview_(self, v11, (uint64_t)self->broadbandImageView);
  v12 = (void *)MEMORY[0x24BDD1628];
  broadbandImageView = self->broadbandImageView;
  objc_msgSend_size(v6, v14, v15);
  v18 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v12, v16, (uint64_t)broadbandImageView, 7, 0, 0, 0, 1.0, v17);
  objc_msgSend_addConstraint_(self, v19, v18);
  v20 = (void *)MEMORY[0x24BDD1628];
  v21 = self->broadbandImageView;
  objc_msgSend_size(v6, v22, v23);
  v25 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v20, v24, (uint64_t)v21, 8, 0, 0, 0, 1.0);
  objc_msgSend_addConstraint_(self, v26, v25);
  self->broadbandLabel = objc_alloc_init(AULabel);
  v27 = sub_21A690C10((uint64_t)CFSTR("BroadbandDeviceOrLAN"), (uint64_t)CFSTR("AirPortSettings"));
  objc_msgSend_setText_(self->broadbandLabel, v28, v27);
  objc_msgSend_frame(self->broadbandImageView, v29, v30);
  objc_msgSend_setPreferredMaxLayoutWidth_(self->broadbandLabel, v31, v32, v33);
  sub_21A69E224(self->broadbandLabel, v34, 13.0);
  objc_msgSend_addSubview_(self, v35, (uint64_t)self->broadbandLabel);
  v36 = (void *)MEMORY[0x24BDD1628];
  v37 = _NSDictionaryOfVariableBindings(CFSTR("broadbandLabel, broadbandImageView"), self->broadbandLabel, self->broadbandImageView, 0);
  v39 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v36, v38, (uint64_t)CFSTR("V:|-10-[broadbandLabel]-4-[broadbandImageView]"), 512, 0, v37);
  objc_msgSend_addConstraints_(self, v40, v39);
  self->internetLabel = objc_alloc_init(AULabel);
  v41 = sub_21A690C10((uint64_t)CFSTR("ToInternet"), (uint64_t)CFSTR("AirPortSettings"));
  objc_msgSend_setText_(self->internetLabel, v42, v41);
  sub_21A69E224(self->internetLabel, v43, 13.0);
  objc_msgSend_addSubview_(self, v44, (uint64_t)self->internetLabel);
  v46 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v45, (uint64_t)self->internetLabel, 1, 0, self->broadbandLabel, 1, 1.0, 0.0);
  objc_msgSend_addConstraint_(self, v47, v46);
  v48 = (void *)MEMORY[0x24BDD1628];
  v49 = _NSDictionaryOfVariableBindings(CFSTR("broadbandImageView, internetLabel"), self->broadbandImageView, self->internetLabel, 0);
  v51 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v48, v50, (uint64_t)CFSTR("V:[broadbandImageView]-30-[internetLabel]-(>=10)-|"), 0, 0, v49);
  objc_msgSend_addConstraints_(self, v52, v51);
  objc_msgSend_sizeToFit(self->internetLabel, v53, v54);
  v56 = (void *)objc_msgSend_imageForInformationalDiagram_subProductID_deviceKind_audioImage_small_(ImageStore, v55, self->wanBaseProductID, 0, self->wanBaseProductID != 0, 0, self->sizeClass == 1);
  v57 = [AUImageView alloc];
  v59 = (AUImageView *)(id)objc_msgSend_initWithImage_(v57, v58, (uint64_t)v56);
  p_wanConnectedBaseImageView = (void **)&self->wanConnectedBaseImageView;
  self->wanConnectedBaseImageView = v59;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v59, v61, 0);
  objc_msgSend_addSubview_(self, v62, (uint64_t)self->wanConnectedBaseImageView);
  v63 = (void *)MEMORY[0x24BDD1628];
  wanConnectedBaseImageView = self->wanConnectedBaseImageView;
  objc_msgSend_size(v56, v65, v66);
  v69 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v63, v67, (uint64_t)wanConnectedBaseImageView, 7, 0, 0, 0, 1.0, v68);
  objc_msgSend_addConstraint_(self, v70, v69);
  v71 = (void *)MEMORY[0x24BDD1628];
  v72 = self->wanConnectedBaseImageView;
  objc_msgSend_size(v56, v73, v74);
  v76 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v71, v75, (uint64_t)v72, 8, 0, 0, 0, 1.0);
  objc_msgSend_addConstraint_(self, v77, v76);
  self->wanConnectedBaseLabel = objc_alloc_init(AULabel);
  wanBaseProductID = self->wanBaseProductID;
  if (wanBaseProductID)
  {
    v81 = sub_21A690D80(wanBaseProductID, 1, 0);
    objc_msgSend_setText_(self->wanConnectedBaseLabel, v82, (uint64_t)v81);
  }
  objc_msgSend_frame(*p_wanConnectedBaseImageView, v78, v79);
  objc_msgSend_setPreferredMaxLayoutWidth_(self->wanConnectedBaseLabel, v83, v84, v85);
  sub_21A69E224(self->wanConnectedBaseLabel, v86, 13.0);
  objc_msgSend_addSubview_(self, v87, (uint64_t)self->wanConnectedBaseLabel);
  objc_msgSend_sizeToFit(self->wanConnectedBaseLabel, v88, v89);
  sizeClass = self->sizeClass;
  LODWORD(v93) = 1109393408;
  if (sizeClass == 3)
    *(float *)&v93 = 35.0;
  if (sizeClass == 2)
    *(float *)&v93 = 60.0;
  v94 = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v90, v91, v93);
  v95 = (void *)MEMORY[0x24BDD1628];
  v285 = CFSTR("horizSep");
  v286[0] = v94;
  v97 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v96, (uint64_t)v286, &v285, 1);
  v98 = _NSDictionaryOfVariableBindings(CFSTR("broadbandImageView, wanConnectedBaseImageView"), self->broadbandImageView, *p_wanConnectedBaseImageView, 0);
  v100 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v95, v99, (uint64_t)CFSTR("H:[broadbandImageView]-(>=horizSep)-[wanConnectedBaseImageView]"), 65552, v97, v98);
  objc_msgSend_addConstraints_(self, v101, v100);
  if (replacementProductID)
    v102 = &unk_24DD1DA98;
  else
    v102 = &unk_24DD1DAC0;
  v103 = (void *)MEMORY[0x24BDD1628];
  v104 = _NSDictionaryOfVariableBindings(CFSTR("broadbandImageView"), self->broadbandImageView, 0);
  v106 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v103, v105, (uint64_t)CFSTR("H:|-(10)-[broadbandImageView]"), 0x10000, 0, v104);
  objc_msgSend_addConstraints_(self, v107, v106);
  v108 = (void *)MEMORY[0x24BDD1628];
  v109 = _NSDictionaryOfVariableBindings(CFSTR("wanConnectedBaseImageView"), *p_wanConnectedBaseImageView, 0);
  v111 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v108, v110, (uint64_t)CFSTR("H:[wanConnectedBaseImageView]-(>=rightMargin)-|"), 0x10000, v102, v109);
  objc_msgSend_addConstraints_(self, v112, v111);
  v113 = (void *)MEMORY[0x24BDD1628];
  v114 = _NSDictionaryOfVariableBindings(CFSTR("wanConnectedBaseLabel, wanConnectedBaseImageView"), self->wanConnectedBaseLabel, *p_wanConnectedBaseImageView, 0);
  v116 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v113, v115, (uint64_t)CFSTR("V:|-(10)-[wanConnectedBaseLabel]-4-[wanConnectedBaseImageView]-(>=10)-|"), 0, 0, v114);
  objc_msgSend_addConstraints_(self, v117, v116);
  v118 = (void *)MEMORY[0x24BDD1628];
  v119 = _NSDictionaryOfVariableBindings(CFSTR("wanConnectedBaseLabel"), self->wanConnectedBaseLabel, 0);
  v121 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v118, v120, (uint64_t)CFSTR("H:[wanConnectedBaseLabel]-(>=rightMargin)-|"), 0, v102, v119);
  objc_msgSend_addConstraints_(self, v122, v121);
  objc_msgSend_informationDiagramBaseImageCenterOffset_small_(ImageStore, v123, self->wanBaseProductID, self->sizeClass == 1);
  v125 = v124 + -0.5;
  objc_msgSend_frame(*p_wanConnectedBaseImageView, v126, v127);
  v129 = v125 * v128;
  v131 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v130, (uint64_t)self->wanConnectedBaseLabel, 9, 0, *p_wanConnectedBaseImageView, 9, 1.0, v129);
  objc_msgSend_addConstraint_(self, v132, v131);
  v134 = objc_msgSend_insetImageForInformationalDiagram_deviceKind_audioImage_small_(ImageStore, v133, self->wanBaseProductID, 1, 0, self->sizeClass == 1);
  v135 = [AUImageView alloc];
  v137 = (AUImageView *)(id)objc_msgSend_initWithImage_(v135, v136, v134);
  self->insetImageView = v137;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v137, v138, 0);
  objc_msgSend_addSubview_(self, v139, (uint64_t)self->insetImageView);
  v140 = (void *)MEMORY[0x24BDD1628];
  v283 = CFSTR("xOffset");
  v141 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_frame(self->insetImageView, v142, v143);
  v147 = 85.0;
  if (self->sizeClass == 1)
    v147 = 64.0;
  v148 = v146 + v147;
  *(float *)&v148 = v148;
  *(float *)&v148 = -*(float *)&v148;
  v284 = objc_msgSend_numberWithFloat_(v141, v144, v145, v148);
  v150 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v149, (uint64_t)&v284, &v283, 1);
  v151 = _NSDictionaryOfVariableBindings(CFSTR("insetImageView, wanConnectedBaseImageView"), self->insetImageView, *p_wanConnectedBaseImageView, 0);
  v153 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v140, v152, (uint64_t)CFSTR("H:[wanConnectedBaseImageView]-(xOffset)-[insetImageView]"), 0x10000, v150, v151);
  objc_msgSend_addConstraints_(self, v154, v153);
  v155 = (void *)MEMORY[0x24BDD1628];
  v281 = CFSTR("yOffset");
  v156 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_frame(self->insetImageView, v157, v158);
  v162 = 8.0;
  if (self->sizeClass == 1)
    v162 = 0.0;
  v163 = v161 + v162;
  *(float *)&v163 = v163;
  *(float *)&v163 = -*(float *)&v163;
  v282 = objc_msgSend_numberWithFloat_(v156, v159, v160, v163);
  v165 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v164, (uint64_t)&v282, &v281, 1);
  v166 = _NSDictionaryOfVariableBindings(CFSTR("insetImageView, wanConnectedBaseImageView"), self->insetImageView, *p_wanConnectedBaseImageView, 0);
  v168 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v155, v167, (uint64_t)CFSTR("V:[wanConnectedBaseImageView]-(yOffset)-[insetImageView]"), 0x10000, v165, v166);
  objc_msgSend_addConstraints_(self, v169, v168);
  if (replacementProductID)
  {
    v171 = (void *)objc_msgSend_imageForInformationalDiagram_subProductID_deviceKind_audioImage_small_(ImageStore, v170, self->replacementProductID, 0, 1, 0, self->sizeClass == 1);
    v172 = [AUImageView alloc];
    v174 = (AUImageView *)(id)objc_msgSend_initWithImage_(v172, v173, (uint64_t)v171);
    self->replacementBaseImageView = v174;
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v174, v175, 0);
    objc_msgSend_addSubview_(self, v176, (uint64_t)self->replacementBaseImageView);
    v177 = (void *)MEMORY[0x24BDD1628];
    replacementBaseImageView = self->replacementBaseImageView;
    objc_msgSend_size(v171, v179, v180);
    v183 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v177, v181, (uint64_t)replacementBaseImageView, 7, 0, 0, 0, 1.0, v182);
    objc_msgSend_addConstraint_(self, v184, v183);
    v185 = (void *)MEMORY[0x24BDD1628];
    v186 = self->replacementBaseImageView;
    objc_msgSend_size(v171, v187, v188);
    v190 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v185, v189, (uint64_t)v186, 8, 0, 0, 0, 1.0);
    objc_msgSend_addConstraint_(self, v191, v190);
    v192 = (void *)MEMORY[0x24BDD1628];
    v193 = _NSDictionaryOfVariableBindings(CFSTR("wanConnectedBaseImageView, replacementBaseImageView"), *p_wanConnectedBaseImageView, self->replacementBaseImageView, 0);
    v195 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v192, v194, (uint64_t)CFSTR("V:[wanConnectedBaseImageView]-60-[replacementBaseImageView]"), 0, 0, v193);
    objc_msgSend_addConstraints_(self, v196, v195);
    objc_msgSend_informationDiagramBaseImageCenterOffset_small_(ImageStore, v197, self->replacementProductID, self->sizeClass == 1);
    v199 = v198 + -0.5;
    objc_msgSend_frame(self->replacementBaseImageView, v200, v201);
    v203 = v199 * v202;
    v205 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v204, (uint64_t)self->replacementBaseImageView, 9, 0, *p_wanConnectedBaseImageView, 9, 1.0, v129 - v203);
    objc_msgSend_addConstraint_(self, v206, v205);
    p_replacementBaseLabel = &self->replacementBaseLabel;
    self->replacementBaseLabel = objc_alloc_init(AULabel);
    v208 = sub_21A690D80(self->replacementProductID, 1, 0);
    objc_msgSend_setText_(self->replacementBaseLabel, v209, (uint64_t)v208);
    objc_msgSend_frame(self->replacementBaseImageView, v210, v211);
    objc_msgSend_setPreferredMaxLayoutWidth_(self->replacementBaseLabel, v212, v213, v214);
    sub_21A69E224(self->replacementBaseLabel, v215, 13.0);
    objc_msgSend_addSubview_(self, v216, (uint64_t)self->replacementBaseLabel);
    objc_msgSend_sizeToFit(self->replacementBaseLabel, v217, v218);
    v219 = CFSTR("V:[replacementBaseImageView][replacementBaseLabel]-(>=10)-|");
    p_wanConnectedBaseImageView = (void **)&self->replacementBaseImageView;
    v220 = CFSTR("replacementBaseImageView, replacementBaseLabel");
    v222 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v221, (uint64_t)self->replacementBaseLabel, 9, 0, self->replacementBaseImageView, 9, 1.0, v203);
  }
  else
  {
    if (sub_21A671268(self->wanBaseProductID) >= 2)
      v224 = CFSTR("EthernetWANPort");
    else
      v224 = CFSTR("EthernetPort");
    v225 = sub_21A690C10((uint64_t)v224, (uint64_t)CFSTR("AirPortSettings"));
    v226 = objc_alloc_init(AULabel);
    p_replacementBaseLabel = &self->portLabel;
    self->portLabel = v226;
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v226, v227, 0);
    objc_msgSend_bounds(self->broadbandImageView, v228, v229);
    objc_msgSend_setPreferredMaxLayoutWidth_(self->portLabel, v230, v231, v232);
    objc_msgSend_setNumberOfLines_(self->portLabel, v233, 0);
    objc_msgSend_setText_(self->portLabel, v234, v225);
    sub_21A69E224(self->portLabel, v235, 13.0);
    objc_msgSend_addSubview_(self, v236, (uint64_t)self->portLabel);
    v219 = CFSTR("V:[wanConnectedBaseImageView]-30-[portLabel]-(>=10)-|");
    v220 = CFSTR("wanConnectedBaseImageView, portLabel");
    v222 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v237, (uint64_t)self->portLabel, 9, 0, *p_wanConnectedBaseImageView, 9, 1.0, v129);
  }
  objc_msgSend_addConstraint_(self, v223, v222);
  v238 = (void *)MEMORY[0x24BDD1628];
  v239 = _NSDictionaryOfVariableBindings(&v220->isa, *p_wanConnectedBaseImageView, *p_replacementBaseLabel, 0);
  v241 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v238, v240, (uint64_t)v219, 0, 0, v239);
  objc_msgSend_addConstraints_(self, v242, v241);
  v243 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  self->fixedCablingFrameView = v243;
  objc_msgSend_setAutoresizingMask_(v243, v244, 2);
  objc_msgSend_addSubview_(self, v245, (uint64_t)self->fixedCablingFrameView);
  v246 = [InfoDiagramCablingLayer alloc];
  v249 = (id)objc_msgSend_initNoWANLinkFirstFrame(v246, v247, v248);
  objc_msgSend_setDiagramAnchorPointDelegate_(v249, v250, (uint64_t)self);
  objc_msgSend_setIsCompactWidth_(v249, v251, self->sizeClass == 1);
  v254 = (void *)objc_msgSend_layer(self->fixedCablingFrameView, v252, v253);
  objc_msgSend_addSublayer_(v254, v255, (uint64_t)v249);
  objc_msgSend_sizeToFit(self->fixedCablingFrameView, v256, v257);
  v258 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  self->animatingCablingFrameView = v258;
  objc_msgSend_setAutoresizingMask_(v258, v259, 2);
  objc_msgSend_addSubview_(self, v260, (uint64_t)self->animatingCablingFrameView);
  v261 = [InfoDiagramCablingLayer alloc];
  v264 = (id)objc_msgSend_initNoWANLinkLastFrame(v261, v262, v263);
  objc_msgSend_setDiagramAnchorPointDelegate_(v264, v265, (uint64_t)self);
  objc_msgSend_setIsCompactWidth_(v264, v266, self->sizeClass == 1);
  objc_msgSend_setSwapCabling_(v264, v267, self->replacementProductID != 0);
  v270 = (void *)objc_msgSend_layer(self->animatingCablingFrameView, v268, v269);
  objc_msgSend_addSublayer_(v270, v271, (uint64_t)v264);
  objc_msgSend_sizeToFit(self->animatingCablingFrameView, v272, v273);
  objc_msgSend_startAnimatingCablingLayer(self, v274, v275);
  LODWORD(v276) = 1148846080;
  objc_msgSend_setContentCompressionResistancePriority_forAxis_(self, v277, 1, v276);
  LODWORD(v278) = 1148846080;
  objc_msgSend_setContentCompressionResistancePriority_forAxis_(self, v279, 0, v278);
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v4 = (void *)objc_msgSend_layer(self->animatingCablingFrameView, a2, v2);
  objc_msgSend_removeAllAnimations(v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)InfoDiagramView;
  -[InfoDiagramView dealloc](&v7, sel_dealloc);
}

- (void)setWANConnectedBaseLabelString:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_setText_(self->wanConnectedBaseLabel, a2, (uint64_t)a3);
  objc_msgSend_sizeToFit(self->wanConnectedBaseLabel, v4, v5);
  objc_msgSend_setNeedsLayout(self->wanConnectedBaseLabel, v6, v7);
}

- (void)startAnimatingCablingLayer
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = (void *)objc_msgSend_layer(self->animatingCablingFrameView, a2, v2);
  if (!objc_msgSend_animationForKey_(v4, v5, (uint64_t)CFSTR("fadeAnimation")))
  {
    v8 = (void *)objc_msgSend_layer(self->animatingCablingFrameView, v6, v7);
    LODWORD(v9) = 0;
    objc_msgSend_setOpacity_(v8, v10, v11, v9);
    v13 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], v12, (uint64_t)CFSTR("opacity"));
    LODWORD(v14) = 2139095040;
    objc_msgSend_setRepeatCount_(v13, v15, v16, v14);
    objc_msgSend_setAutoreverses_(v13, v17, 1);
    objc_msgSend_setDuration_(v13, v18, v19, 0.5);
    LODWORD(v20) = 1.0;
    v23 = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v21, v22, v20);
    objc_msgSend_setToValue_(v13, v24, v23);
    v27 = objc_msgSend_layer(self->animatingCablingFrameView, v25, v26);
    MEMORY[0x24BEDD108](v27, sel_addAnimation_forKey_, v13);
  }
}

- (void)stopAnimatingCablingLayer
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_layer(self->animatingCablingFrameView, a2, v2);
  MEMORY[0x24BEDD108](v3, sel_removeAnimationForKey_, CFSTR("fadeAnimation"));
}

- (CGPoint)internetPoint
{
  uint64_t v2;
  CGFloat x;
  double v4;
  double v5;
  CGPoint result;
  CGRect v7;

  objc_msgSend_frame(self->broadbandImageView, a2, v2);
  x = v7.origin.x;
  v4 = CGRectGetMaxY(v7) + 20.0;
  v5 = x;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)broadbandInPoint
{
  uint64_t v2;
  double v4;
  double v8;
  double v9;
  double MaxY;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  objc_msgSend_frame(self->broadbandImageView, a2, v2);
  v8 = 65.5;
  if (self->sizeClass == 1)
    v8 = 36.0;
  v9 = v4 + v8;
  MaxY = CGRectGetMaxY(*(CGRect *)&v4);
  v11 = 14.0;
  if (self->sizeClass == 1)
    v11 = 10.0;
  v12 = MaxY - v11;
  v13 = v9;
  result.y = v12;
  result.x = v13;
  return result;
}

- (CGPoint)broadbandOutPoint
{
  uint64_t v2;
  double v4;
  double MaxY;
  double v6;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  objc_msgSend_frame(self->broadbandImageView, a2, v2);
  v4 = v10.origin.x + dbl_21A73EE00[self->sizeClass == 1];
  MaxY = CGRectGetMaxY(v10);
  v6 = 14.0;
  if (self->sizeClass == 1)
    v6 = 10.0;
  v7 = MaxY - v6;
  v8 = v4;
  result.y = v7;
  result.x = v8;
  return result;
}

- (CGPoint)wanConnectedBaseWANPoint
{
  uint64_t v2;
  double v4;
  double MaxY;
  double v6;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  objc_msgSend_frame(self->wanConnectedBaseImageView, a2, v2);
  v4 = v10.origin.x + dbl_21A73EE10[self->sizeClass == 1];
  MaxY = CGRectGetMaxY(v10);
  v6 = 14.0;
  if (self->sizeClass == 1)
    v6 = 11.0;
  v7 = MaxY - v6;
  v8 = v4;
  result.y = v7;
  result.x = v8;
  return result;
}

- (CGPoint)swapArcLineStartPoint
{
  uint64_t v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  const char *v9;
  double v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  objc_msgSend_frame(self->replacementBaseImageView, a2, v2);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MaxX = CGRectGetMaxX(v18);
  objc_msgSend_informationDiagramBaseImageRightEdgeInset_small_(ImageStore, v9, self->replacementProductID, self->sizeClass == 1);
  v11 = MaxX - v10 + 10.0;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  CGRectGetMidY(v19);
  v15 = sub_21A69E6C0(v11, v12, v13, v14);
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)swapArcLineEndPoint
{
  uint64_t v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  const char *v9;
  double v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  objc_msgSend_frame(self->wanConnectedBaseImageView, a2, v2);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MaxX = CGRectGetMaxX(v18);
  objc_msgSend_informationDiagramBaseImageRightEdgeInset_small_(ImageStore, v9, self->wanBaseProductID, self->sizeClass == 1);
  v11 = MaxX - v10 + 13.0;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  CGRectGetMidY(v19);
  v15 = sub_21A69E6C0(v11, v12, v13, v14);
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)swapArcControlPoint
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  objc_msgSend_swapArcLineStartPoint(self, a2, v2);
  v5 = v4;
  v8 = objc_msgSend_swapArcLineEndPoint(self, v6, v7);
  if (v5 >= v11)
    v11 = v5;
  v12 = 50.0;
  if (self->sizeClass == 2)
    v12 = 60.0;
  v13 = sub_21A69E6C0(v11 + v12, v8, v9, v10);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)swapArcControlPoint1
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  objc_msgSend_swapArcLineStartPoint(self, a2, v2);
  v5 = v4;
  v8 = objc_msgSend_swapArcLineEndPoint(self, v6, v7);
  if (v5 >= v11)
    v11 = v5;
  v12 = 40.0;
  if (self->sizeClass == 2)
    v12 = 50.0;
  v13 = sub_21A69E6C0(v11 + v12, v8, v9, v10);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)swapArcControlPoint2
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  objc_msgSend_swapArcLineStartPoint(self, a2, v2);
  v5 = v4;
  v8 = objc_msgSend_swapArcLineEndPoint(self, v6, v7);
  if (v5 >= v11)
    v11 = v5;
  v12 = 40.0;
  if (self->sizeClass == 2)
    v12 = 50.0;
  v13 = sub_21A69E6C0(v11 + v12, v8, v9, v10);
  result.y = v14;
  result.x = v13;
  return result;
}

@end
