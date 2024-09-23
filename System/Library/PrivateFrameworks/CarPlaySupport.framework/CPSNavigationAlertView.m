@implementation CPSNavigationAlertView

- (id)_linearFocusItems
{
  id v3;
  CPSNavigationAlertFocusButton *v4;
  CPSNavigationAlertFocusButton *v5;
  CPSNavigationAlertFocusButton *v6;
  CPSNavigationAlertFocusButton *v7;
  CPSButton *v8;
  CPSButton *v9;
  id v10[2];
  CPSNavigationAlertView *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[CPSNavigationAlertView closeButton](v11, "closeButton");

  if (v9)
  {
    v8 = -[CPSNavigationAlertView closeButton](v11, "closeButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v7 = -[CPSNavigationAlertView primaryButton](v11, "primaryButton");

  if (v7)
  {
    v6 = -[CPSNavigationAlertView primaryButton](v11, "primaryButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v5 = -[CPSNavigationAlertView secondaryButton](v11, "secondaryButton");

  if (v5)
  {
    v4 = -[CPSNavigationAlertView secondaryButton](v11, "secondaryButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v3 = (id)objc_msgSend(v10[0], "copy");
  objc_storeStrong(v10, 0);
  return v3;
}

- (id)preferredFocusEnvironments
{
  id v3;
  CPSNavigationAlertFocusButton *v4;
  CPSNavigationAlertFocusButton *v5;
  CPSNavigationAlertFocusButton *v6;
  CPSNavigationAlertFocusButton *v7;
  CPSButton *v8;
  CPSButton *v9;
  id v10[2];
  CPSNavigationAlertView *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[CPSNavigationAlertView closeButton](v11, "closeButton");

  if (v9)
  {
    v8 = -[CPSNavigationAlertView closeButton](v11, "closeButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v7 = -[CPSNavigationAlertView primaryButton](v11, "primaryButton");

  if (v7)
  {
    v6 = -[CPSNavigationAlertView primaryButton](v11, "primaryButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v5 = -[CPSNavigationAlertView secondaryButton](v11, "secondaryButton");

  if (v5)
  {
    v4 = -[CPSNavigationAlertView secondaryButton](v11, "secondaryButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v3 = v10[0];
  objc_storeStrong(v10, 0);
  return v3;
}

- (CPSNavigationAlertView)initWithFrame:(CGRect)a3 navigationAlert:(id)a4 templateDelegate:(id)a5 buttonDelegate:(id)a6
{
  CPSNavigationAlertView *v6;
  uint64_t v7;
  double v8;
  id v9;
  uint64_t v10;
  CPUIFocusRingView *focusRingView;
  uint64_t v12;
  UIStackView *stackView;
  double v14;
  CPSNavigationAlertProgressView *v15;
  uint64_t v16;
  CPSNavigationAlertProgressView *progressView;
  CPSAbridgableNewlineLabel *v18;
  uint64_t v19;
  CPSAbridgableNewlineLabel *titleLabel;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  CPSAbridgableNewlineLabel *v26;
  uint64_t v27;
  CPSAbridgableNewlineLabel *subtitleLabel;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  UIImageView *imageView;
  double v37;
  double v38;
  double v39;
  CPSButton *v40;
  CPSButton *closeButton;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  float v46;
  double v47;
  double v48;
  double v49;
  UIStackView *v50;
  float v51;
  double v52;
  CPSNavigationAlertFocusButton *v53;
  CPSNavigationAlertFocusButton *primaryButton;
  double v55;
  double v56;
  double v57;
  float v58;
  CPSNavigationAlertFocusButton *v59;
  CPSNavigationAlertFocusButton *secondaryButton;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CPSNavigationAlertView *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  UIStackView *v84;
  id v85;
  UIStackView *v86;
  id v87;
  id v88;
  UIStackView *v89;
  id v90;
  UIStackView *v91;
  id v92;
  _BOOL4 v93;
  UIStackView *v94;
  UIStackView *v95;
  UIStackView *v96;
  UIStackView *v97;
  id v98;
  UIStackView *v99;
  UIStackView *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  UIImageView *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  CPSAbridgableNewlineLabel *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  CPSAbridgableNewlineLabel *v132;
  id v133;
  id v134;
  CPSNavigationAlertView *v135;
  id v136;
  id v137;
  BOOL v138;
  id v139;
  id v140;
  id v141;
  BOOL v142;
  id v143;
  id v144;
  id v145;
  BOOL v146;
  id v147;
  id v148;
  uint64_t v149;
  id v150;
  id v151;
  uint64_t v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  double *v161;
  id v162;
  UIStackView *v163;
  id v164;
  void *v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  CPSNavigationAlertView *v181;
  double v182;
  double v183;
  id v184;
  char v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  __int128 v194;
  __int128 v195;
  BOOL v196;
  BOOL v197;
  BOOL v198;
  uint64_t v199;
  BOOL v200;
  id v201;
  id v202;
  objc_super v203;
  id v204;
  id v205;
  id location[2];
  CPSNavigationAlertView *v207;
  CGRect v208;
  _QWORD v209[4];
  _QWORD v210[2];
  _QWORD v211[2];
  _QWORD v212[2];
  _QWORD v213[2];
  uint64_t v214;
  id v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id v219;
  uint64_t v220;
  id v221;
  _QWORD v222[5];

  v222[4] = *MEMORY[0x24BDAC8D0];
  v208 = a3;
  v207 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v205 = 0;
  objc_storeStrong(&v205, a5);
  v204 = 0;
  objc_storeStrong(&v204, a6);
  v6 = v207;
  v207 = 0;
  v203.receiver = v6;
  v203.super_class = (Class)CPSNavigationAlertView;
  v181 = -[CPSNavigationAlertView initWithFrame:](&v203, sel_initWithFrame_, v208.origin.x, v208.origin.y, v208.size.width, v208.size.height);
  v207 = v181;
  objc_storeStrong((id *)&v207, v181);
  if (v181)
  {
    v135 = v207;
    v136 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[CPSNavigationAlertView setBackgroundColor:](v135, "setBackgroundColor:");

    v202 = (id)objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
    v201 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v202);
    objc_msgSend(v201, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSNavigationAlertView addSubview:](v207, "addSubview:", v201);
    v137 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v138 = objc_msgSend(v137, "userInterfaceLayoutDirection") == 1;

    v200 = v138;
    v199 = 0;
    v7 = 2;
    if (!v138)
      v7 = 0;
    v199 = v7;
    v141 = (id)objc_msgSend(location[0], "subtitleVariants");
    v140 = (id)objc_msgSend(v141, "firstObject");
    v139 = +[CPSAbridgableNewlineLabel sanitizedTextForText:](CPSAbridgableNewlineLabel, "sanitizedTextForText:");
    v142 = objc_msgSend(v139, "length") != 0;

    v198 = v142;
    v145 = (id)objc_msgSend(location[0], "titleVariants");
    v144 = (id)objc_msgSend(v145, "firstObject");
    v143 = +[CPSAbridgableNewlineLabel sanitizedTextForText:](CPSAbridgableNewlineLabel, "sanitizedTextForText:");
    v146 = objc_msgSend(v143, "length") != 0;

    v197 = v146;
    v196 = CPSAlertUsesMinimalStyle(location[0]);
    v147 = (id)objc_msgSend(v201, "layer");
    objc_msgSend(v147, "setCornerRadius:", 10.0);

    v148 = (id)objc_msgSend(v201, "layer");
    objc_msgSend(v148, "setMaskedCorners:", 15);

    v149 = *MEMORY[0x24BDE58E8];
    v150 = (id)objc_msgSend(v201, "layer");
    objc_msgSend(v150, "setCornerCurve:", v149);

    v151 = (id)objc_msgSend(v201, "layer");
    objc_msgSend(v151, "setMasksToBounds:", 1);

    v154 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v152 = objc_msgSend(objc_retainAutorelease(v154), "CGColor");
    v153 = (id)-[CPSNavigationAlertView layer](v207, "layer");
    objc_msgSend(v153, "setShadowColor:", v152);

    v195 = *MEMORY[0x24BDBF148];
    v155 = (id)-[CPSNavigationAlertView layer](v207, "layer");
    v194 = v195;
    objc_msgSend(v155, "setShadowOffset:", v195);

    v156 = (id)-[CPSNavigationAlertView layer](v207, "layer");
    LODWORD(v8) = 1045220557;
    objc_msgSend(v156, "setShadowOpacity:", v8);

    v157 = (id)-[CPSNavigationAlertView layer](v207, "layer");
    objc_msgSend(v157, "setShadowRadius:", 80.0);

    v158 = (id)-[CPSNavigationAlertView layer](v207, "layer");
    objc_msgSend(v158, "setMasksToBounds:", 0);

    objc_storeStrong((id *)&v207->_navigationAlert, location[0]);
    v9 = objc_alloc(MEMORY[0x24BE15370]);
    v161 = (double *)MEMORY[0x24BDBF090];
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    focusRingView = v207->_focusRingView;
    v207->_focusRingView = (CPUIFocusRingView *)v10;

    -[CPUIFocusRingView setTranslatesAutoresizingMaskIntoConstraints:](v207->_focusRingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v159 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    -[CPUIFocusRingView setRingColor:](v207->_focusRingView, "setRingColor:");

    -[CPUIFocusRingView setCornerRadius:](v207->_focusRingView, "setCornerRadius:", 8.0);
    -[CPUIFocusRingView setHidden:](v207->_focusRingView, "setHidden:", 1);
    v160 = (id)objc_msgSend(v201, "contentView");
    objc_msgSend(v160, "addSubview:", v207->_focusRingView);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", *v161, v161[1], v161[2], v161[3]);
    stackView = v207->_stackView;
    v207->_stackView = (UIStackView *)v12;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v207->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v207->_stackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v207->_stackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v207->_stackView, "setAlignment:", 0);
    -[UIStackView setSpacing:](v207->_stackView, "setSpacing:", 0.0);
    v162 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[UIStackView setBackgroundColor:](v207->_stackView, "setBackgroundColor:");

    v164 = (id)objc_msgSend(v201, "contentView");
    v163 = -[CPSNavigationAlertView stackView](v207, "stackView");
    objc_msgSend(v164, "addSubview:");

    v165 = (void *)MEMORY[0x24BDD1628];
    v178 = (id)-[UIStackView topAnchor](v207->_stackView, "topAnchor");
    v177 = (id)-[CPSNavigationAlertView topAnchor](v207, "topAnchor");
    v176 = (id)objc_msgSend(v178, "constraintEqualToAnchor:constant:", 10.0);
    v222[0] = v176;
    v175 = (id)-[UIStackView bottomAnchor](v207->_stackView, "bottomAnchor");
    v174 = (id)-[CPSNavigationAlertView bottomAnchor](v207, "bottomAnchor");
    v173 = (id)objc_msgSend(v175, "constraintEqualToAnchor:constant:", -10.0);
    v222[1] = v173;
    v172 = (id)-[UIStackView leadingAnchor](v207->_stackView, "leadingAnchor");
    v171 = (id)-[CPSNavigationAlertView leadingAnchor](v207, "leadingAnchor");
    v170 = (id)objc_msgSend(v172, "constraintEqualToAnchor:constant:", 10.0);
    v222[2] = v170;
    v169 = (id)-[UIStackView trailingAnchor](v207->_stackView, "trailingAnchor");
    v168 = (id)-[CPSNavigationAlertView trailingAnchor](v207, "trailingAnchor");
    v167 = (id)objc_msgSend(v169, "constraintEqualToAnchor:constant:", -10.0);
    v222[3] = v167;
    v166 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v222, 4);
    objc_msgSend(v165, "activateConstraints:");

    objc_msgSend(location[0], "duration");
    if (v14 > 0.0)
    {
      v15 = [CPSNavigationAlertProgressView alloc];
      v16 = -[CPSNavigationAlertProgressView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      progressView = v207->_progressView;
      v207->_progressView = (CPSNavigationAlertProgressView *)v16;

      -[CPSNavigationAlertProgressView setTranslatesAutoresizingMaskIntoConstraints:](v207->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (CPSAlertUsesMinimalStyle(location[0]))
      {
        v134 = (id)objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
        -[CPSNavigationAlertProgressView setBackgroundColor:](v207->_progressView, "setBackgroundColor:");

      }
    }
    if (v197)
    {
      v18 = [CPSAbridgableNewlineLabel alloc];
      v19 = -[CPSAbridgableNewlineLabel initWithFrame:](v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      titleLabel = v207->_titleLabel;
      v207->_titleLabel = (CPSAbridgableNewlineLabel *)v19;

      v127 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      -[CPSAbridgableNewlineLabel setTextColor:](v207->_titleLabel, "setTextColor:");

      v193 = (id)objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77B8], 2);
      v220 = *MEMORY[0x24BDF78A0];
      v128 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
      v221 = v128;
      v192 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);

      v129 = v193;
      v218 = *MEMORY[0x24BDF7770];
      v219 = v192;
      v130 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
      v21 = (id)objc_msgSend(v129, "fontDescriptorByAddingAttributes:");
      v22 = v193;
      v193 = v21;

      v131 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v193, 0.0);
      -[CPSAbridgableNewlineLabel setFont:](v207->_titleLabel, "setFont:");

      -[CPSAbridgableNewlineLabel setTextAlignment:](v207->_titleLabel, "setTextAlignment:", v199);
      -[CPSAbridgableNewlineLabel setTranslatesAutoresizingMaskIntoConstraints:](v207->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSAbridgableNewlineLabel setNumberOfLines:](v207->_titleLabel, "setNumberOfLines:", 2);
      LODWORD(v23) = 1144750080;
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v207->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v207->_titleLabel, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v24) = 1148846080;
      -[CPSAbridgableNewlineLabel setContentHuggingPriority:forAxis:](v207->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v24);
      LODWORD(v25) = 1148846080;
      -[CPSAbridgableNewlineLabel setContentHuggingPriority:forAxis:](v207->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v25);
      v132 = v207->_titleLabel;
      v133 = (id)objc_msgSend(location[0], "titleVariants");
      -[CPSAbridgableLabel setTextVariants:](v132, "setTextVariants:");

      objc_storeStrong(&v192, 0);
      objc_storeStrong(&v193, 0);
    }
    if (v198)
    {
      v26 = [CPSAbridgableNewlineLabel alloc];
      v27 = -[CPSAbridgableNewlineLabel initWithFrame:](v26, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      subtitleLabel = v207->_subtitleLabel;
      v207->_subtitleLabel = (CPSAbridgableNewlineLabel *)v27;

      v120 = (id)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      -[CPSAbridgableNewlineLabel setTextColor:](v207->_subtitleLabel, "setTextColor:");

      v191 = (id)objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0]);
      v216 = *MEMORY[0x24BDF78A0];
      v121 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7888]);
      v217 = v121;
      v190 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);

      v122 = v191;
      v214 = *MEMORY[0x24BDF7770];
      v215 = v190;
      v123 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
      v29 = (id)objc_msgSend(v122, "fontDescriptorByAddingAttributes:");
      v30 = v191;
      v191 = v29;

      v124 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v191, 0.0);
      -[CPSAbridgableNewlineLabel setFont:](v207->_subtitleLabel, "setFont:");

      -[CPSAbridgableNewlineLabel setTranslatesAutoresizingMaskIntoConstraints:](v207->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSAbridgableNewlineLabel setNumberOfLines:](v207->_subtitleLabel, "setNumberOfLines:");
      -[CPSAbridgableNewlineLabel setTextAlignment:](v207->_subtitleLabel, "setTextAlignment:", v199);
      -[CPSAbridgableNewlineLabel setLineBreakMode:](v207->_subtitleLabel, "setLineBreakMode:", 0);
      LODWORD(v31) = 1132068864;
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v207->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v31);
      -[CPSAbridgableNewlineLabel setContentCompressionResistancePriority:forAxis:](v207->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0);
      LODWORD(v32) = 1148846080;
      -[CPSAbridgableNewlineLabel setContentHuggingPriority:forAxis:](v207->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v32);
      LODWORD(v33) = 1148846080;
      -[CPSAbridgableNewlineLabel setContentHuggingPriority:forAxis:](v207->_subtitleLabel, "setContentHuggingPriority:forAxis:", 0, v33);
      v125 = v207->_subtitleLabel;
      v126 = (id)objc_msgSend(location[0], "subtitleVariants");
      -[CPSAbridgableLabel setTextVariants:](v125, "setTextVariants:");

      objc_storeStrong(&v190, 0);
      objc_storeStrong(&v191, 0);
    }
    v119 = (id)objc_msgSend(location[0], "image");

    if (v119)
    {
      v34 = objc_alloc(MEMORY[0x24BDF6AE8]);
      v35 = objc_msgSend(v34, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      imageView = v207->_imageView;
      v207->_imageView = (UIImageView *)v35;

      -[UIImageView setContentMode:](v207->_imageView, "setContentMode:");
      v116 = v207->_imageView;
      v118 = (id)objc_msgSend(location[0], "image");
      v117 = (id)CPImageByScalingImageToSize();
      -[UIImageView setImage:](v116, "setImage:");

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v207->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setContentCompressionResistancePriority:forAxis:](v207->_imageView, "setContentCompressionResistancePriority:forAxis:", 1);
      LODWORD(v37) = 1148846080;
      -[UIImageView setContentCompressionResistancePriority:forAxis:](v207->_imageView, "setContentCompressionResistancePriority:forAxis:", v37);
      LODWORD(v38) = 1148846080;
      -[UIImageView setContentHuggingPriority:forAxis:](v207->_imageView, "setContentHuggingPriority:forAxis:", 1, v38);
      LODWORD(v39) = 1148846080;
      -[UIImageView setContentHuggingPriority:forAxis:](v207->_imageView, "setContentHuggingPriority:forAxis:", 0, v39);
    }
    if (v196)
    {
      v40 = +[CPUIButton buttonWithType:](CPSButton, "buttonWithType:");
      closeButton = v207->_closeButton;
      v207->_closeButton = v40;

      -[CPSButton setTranslatesAutoresizingMaskIntoConstraints:](v207->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v105 = (id)objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("xmark.circle.fill"));
      v189 = (id)objc_msgSend(v105, "imageWithRenderingMode:");

      -[CPSButton setImage:forState:](v207->_closeButton, "setImage:forState:", v189, 0);
      v106 = (void *)MEMORY[0x24BDF6AE0];
      v109 = (id)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v213[0] = v109;
      v108 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
      v213[1] = v108;
      v107 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v213, 2);
      v188 = (id)objc_msgSend(v106, "configurationWithPaletteColors:");

      -[CPSButton setPreferredSymbolConfiguration:forImageInState:](v207->_closeButton, "setPreferredSymbolConfiguration:forImageInState:", v188, 0);
      -[CPSButton setImage:forState:](v207->_closeButton, "setImage:forState:", v189);
      v110 = (void *)MEMORY[0x24BDF6AE0];
      v113 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v212[0] = v113;
      v112 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v212[1] = v112;
      v111 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v212, 2);
      v187 = (id)objc_msgSend(v110, "configurationWithPaletteColors:");

      -[CPSButton setPreferredSymbolConfiguration:forImageInState:](v207->_closeButton, "setPreferredSymbolConfiguration:forImageInState:", v187, 8);
      -[CPSButton setAdjustsImageWhenHighlighted:](v207->_closeButton, "setAdjustsImageWhenHighlighted:", 1);
      -[CPSButton setContentCompressionResistancePriority:forAxis:](v207->_closeButton, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v42) = 1148846080;
      -[CPSButton setContentCompressionResistancePriority:forAxis:](v207->_closeButton, "setContentCompressionResistancePriority:forAxis:", 0, v42);
      LODWORD(v43) = 1148846080;
      -[CPSButton setContentHuggingPriority:forAxis:](v207->_closeButton, "setContentHuggingPriority:forAxis:", 1, v43);
      LODWORD(v44) = 1148846080;
      -[CPSButton setContentHuggingPriority:forAxis:](v207->_closeButton, "setContentHuggingPriority:forAxis:", 0, v44);
      -[CPSButton setDelegate:](v207->_closeButton, "setDelegate:", v204);
      v115 = (id)objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59C8]);
      v114 = (id)-[CPSButton layer](v207->_closeButton, "layer");
      objc_msgSend(v114, "setCompositingFilter:", v115);

      objc_storeStrong(&v187, 0);
      objc_storeStrong(&v188, 0);
      objc_storeStrong(&v189, 0);
    }
    v186 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v185 = 0;
    v104 = (id)objc_msgSend(location[0], "image");

    if (v104)
    {
      if (v196)
      {
        v211[0] = v207->_imageView;
        v211[1] = v207->_closeButton;
        v103 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v211, 2);
        objc_msgSend(v186, "addObjectsFromArray:");

      }
      else if (v197)
      {
        v210[0] = v207->_titleLabel;
        v210[1] = v207->_imageView;
        v102 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v210, 2);
        objc_msgSend(v186, "addObjectsFromArray:");

        v185 = 1;
      }
      else
      {
        objc_msgSend(v186, "addObject:", v207->_imageView);
      }
    }
    else if (v197)
    {
      objc_msgSend(v186, "addObject:", v207->_titleLabel);
      v185 = 1;
      if (v196)
        objc_msgSend(v186, "addObject:", v207->_closeButton);
    }
    else if (v196)
    {
      objc_msgSend(v186, "addObject:", v207->_closeButton);
    }
    if (objc_msgSend(v186, "count") == 1)
    {
      v101 = (id)objc_opt_new();
      objc_msgSend(v186, "addObject:");

    }
    v184 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v186);
    objc_msgSend(v184, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v184, "setAxis:");
    objc_msgSend(v184, "setAlignment:", 2);
    if ((v185 & 1) != 0)
      v45 = 4;
    else
      v45 = 3;
    objc_msgSend(v184, "setDistribution:", v45);
    v46 = 10.0;
    if ((v185 & 1) == 0)
      v46 = 2.0;
    objc_msgSend(v184, "setSpacing:", v46);
    v98 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    objc_msgSend(v184, "setBackgroundColor:");

    objc_msgSend(v184, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v47) = 1148846080;
    objc_msgSend(v184, "setContentCompressionResistancePriority:forAxis:", 0, v47);
    LODWORD(v48) = 1148846080;
    objc_msgSend(v184, "setContentHuggingPriority:forAxis:", 1, v48);
    LODWORD(v49) = 1148846080;
    objc_msgSend(v184, "setContentHuggingPriority:forAxis:", 0, v49);
    v99 = -[CPSNavigationAlertView stackView](v207, "stackView");
    -[UIStackView addArrangedSubview:](v99, "addArrangedSubview:", v184);

    v50 = -[CPSNavigationAlertView stackView](v207, "stackView");
    v100 = v50;
    v51 = 4.0;
    if ((v185 & 1) == 0)
      v51 = 8.0;
    -[UIStackView setCustomSpacing:afterView:](v50, "setCustomSpacing:afterView:", v184, v51);

    if (v197 && (v185 & 1) == 0)
    {
      v97 = -[CPSNavigationAlertView stackView](v207, "stackView");
      -[UIStackView addArrangedSubview:](v97, "addArrangedSubview:", v207->_titleLabel);

      if (v198)
        v183 = 0.0;
      else
        v183 = 10.0;
      v96 = -[CPSNavigationAlertView stackView](v207, "stackView");
      -[UIStackView setCustomSpacing:afterView:](v96, "setCustomSpacing:afterView:", v207->_titleLabel, v183);

    }
    if (v198)
    {
      v95 = -[CPSNavigationAlertView stackView](v207, "stackView");
      -[UIStackView addArrangedSubview:](v95, "addArrangedSubview:", v207->_subtitleLabel);

      if (CPSAlertUsesMinimalStyle(location[0]))
      {
        objc_msgSend(location[0], "duration");
        if (v52 <= 0.0)
          v182 = 0.0;
        else
          v182 = 10.0;
      }
      else
      {
        v182 = 10.0;
      }
      v94 = -[CPSNavigationAlertView stackView](v207, "stackView");
      -[UIStackView setCustomSpacing:afterView:](v94, "setCustomSpacing:afterView:", v207->_subtitleLabel, v182);

    }
    v92 = (id)objc_msgSend(location[0], "primaryAction");
    LOBYTE(v93) = 0;
    if (v92)
      v93 = !CPSAlertUsesMinimalStyle(location[0]);

    if (v93)
    {
      v88 = (id)objc_msgSend(location[0], "primaryAction");
      v53 = +[CPSNavigationAlertFocusButton buttonWithAction:progressView:isPrimary:](CPSNavigationAlertFocusButton, "buttonWithAction:progressView:isPrimary:");
      primaryButton = v207->_primaryButton;
      v207->_primaryButton = v53;

      -[CPSButton setDelegate:](v207->_primaryButton, "setDelegate:", v204);
      -[CPSNavigationAlertFocusButton setTranslatesAutoresizingMaskIntoConstraints:](v207->_primaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v207->_primaryButton, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v55) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v207->_primaryButton, "setContentCompressionResistancePriority:forAxis:", v55);
      LODWORD(v56) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentHuggingPriority:forAxis:](v207->_primaryButton, "setContentHuggingPriority:forAxis:", 1, v56);
      LODWORD(v57) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentHuggingPriority:forAxis:](v207->_primaryButton, "setContentHuggingPriority:forAxis:", 0, v57);
      v89 = -[CPSNavigationAlertView stackView](v207, "stackView");
      -[UIStackView addArrangedSubview:](v89, "addArrangedSubview:", v207->_primaryButton);

      v91 = -[CPSNavigationAlertView stackView](v207, "stackView");
      v90 = (id)objc_msgSend(location[0], "secondaryAction");
      v58 = 4.0;
      if (!v90)
        v58 = 0.0;
      -[UIStackView setCustomSpacing:afterView:](v91, "setCustomSpacing:afterView:", v207->_primaryButton, v58);

    }
    v87 = (id)objc_msgSend(location[0], "secondaryAction");

    if (v87)
    {
      v85 = (id)objc_msgSend(location[0], "secondaryAction");
      v59 = +[CPSNavigationAlertFocusButton buttonWithAction:progressView:isPrimary:](CPSNavigationAlertFocusButton, "buttonWithAction:progressView:isPrimary:");
      secondaryButton = v207->_secondaryButton;
      v207->_secondaryButton = v59;

      -[CPSButton setDelegate:](v207->_secondaryButton, "setDelegate:", v204);
      -[CPSNavigationAlertFocusButton setTranslatesAutoresizingMaskIntoConstraints:](v207->_secondaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v207->_secondaryButton, "setContentCompressionResistancePriority:forAxis:");
      LODWORD(v61) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentCompressionResistancePriority:forAxis:](v207->_secondaryButton, "setContentCompressionResistancePriority:forAxis:", v61);
      LODWORD(v62) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentHuggingPriority:forAxis:](v207->_secondaryButton, "setContentHuggingPriority:forAxis:", 1, v62);
      LODWORD(v63) = 1148846080;
      -[CPSNavigationAlertFocusButton setContentHuggingPriority:forAxis:](v207->_secondaryButton, "setContentHuggingPriority:forAxis:", 0, v63);
      v86 = -[CPSNavigationAlertView stackView](v207, "stackView");
      -[UIStackView addArrangedSubview:](v86, "addArrangedSubview:", v207->_secondaryButton);

    }
    if (CPSAlertUsesMinimalStyle(location[0]))
    {
      objc_msgSend(location[0], "duration");
      if (v64 > 0.0)
      {
        -[CPSNavigationAlertProgressView setContentCompressionResistancePriority:forAxis:](v207->_progressView, "setContentCompressionResistancePriority:forAxis:");
        LODWORD(v65) = 1148846080;
        -[CPSNavigationAlertProgressView setContentCompressionResistancePriority:forAxis:](v207->_progressView, "setContentCompressionResistancePriority:forAxis:", v65);
        LODWORD(v66) = 1148846080;
        -[CPSNavigationAlertProgressView setContentHuggingPriority:forAxis:](v207->_progressView, "setContentHuggingPriority:forAxis:", 1, v66);
        LODWORD(v67) = 1148846080;
        -[CPSNavigationAlertProgressView setContentHuggingPriority:forAxis:](v207->_progressView, "setContentHuggingPriority:forAxis:", 0, v67);
        v84 = -[CPSNavigationAlertView stackView](v207, "stackView");
        -[UIStackView addArrangedSubview:](v84, "addArrangedSubview:", v207->_progressView);

      }
    }
    v70 = (void *)MEMORY[0x24BDD1628];
    v83 = (id)objc_msgSend(v201, "topAnchor");
    v82 = (id)-[CPSNavigationAlertView topAnchor](v207, "topAnchor");
    v81 = (id)objc_msgSend(v83, "constraintEqualToAnchor:");
    v209[0] = v81;
    v80 = (id)objc_msgSend(v201, "bottomAnchor");
    v79 = (id)-[CPSNavigationAlertView bottomAnchor](v207, "bottomAnchor");
    v78 = (id)objc_msgSend(v80, "constraintEqualToAnchor:");
    v209[1] = v78;
    v77 = (id)objc_msgSend(v201, "leadingAnchor");
    v76 = (id)-[CPSNavigationAlertView leadingAnchor](v207, "leadingAnchor");
    v75 = (id)objc_msgSend(v77, "constraintEqualToAnchor:");
    v209[2] = v75;
    v74 = (id)objc_msgSend(v201, "trailingAnchor");
    v73 = (id)-[CPSNavigationAlertView trailingAnchor](v207, "trailingAnchor");
    v72 = (id)objc_msgSend(v74, "constraintEqualToAnchor:");
    v209[3] = v72;
    v71 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v209, 4);
    objc_msgSend(v70, "activateConstraints:");

    objc_storeStrong(&v184, 0);
    objc_storeStrong(&v186, 0);
    objc_storeStrong(&v201, 0);
    objc_storeStrong(&v202, 0);
  }
  v69 = v207;
  objc_storeStrong(&v204, 0);
  objc_storeStrong(&v205, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v207, 0);
  return v69;
}

- (void)startAnimating
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CPNavigationAlert *v25;
  BOOL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  id v33;
  id v34;
  BOOL v35;
  id v36;
  CPAlertAction *v37;
  CPNavigationAlert *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  CPNavigationAlert *v45;
  BOOL v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  CPSNavigationAlertView *v52;
  id v53;
  id v54;
  _BYTE v55[9];
  id location;
  double v57;
  double v58;
  id v59[2];
  CPSNavigationAlertView *v60;
  _QWORD v61[4];

  v61[3] = *MEMORY[0x24BDAC8D0];
  v60 = self;
  v59[1] = (id)a2;
  if (!self->_hasStartedAnimating)
  {
    v60->_hasStartedAnimating = 1;
    v2 = objc_alloc(MEMORY[0x24BDF6F90]);
    v59[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v59[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v44 = (id)objc_msgSend(v59[0], "layer");
    objc_msgSend(v44, "setMasksToBounds:", 1);

    v58 = 0.0;
    v45 = -[CPSNavigationAlertView navigationAlert](v60, "navigationAlert");
    v46 = CPSAlertUsesMinimalStyle(v45);

    if (v46)
    {
      v39 = (id)objc_msgSend(v59[0], "layer");
      objc_msgSend(v39, "setCornerRadius:", 2.0);

      v40 = (id)objc_msgSend(v59[0], "layer");
      objc_msgSend(v40, "setMaskedCorners:", 15);

      v41 = *MEMORY[0x24BDE58E8];
      v42 = (id)objc_msgSend(v59[0], "layer");
      objc_msgSend(v42, "setCornerCurve:", v41);

      v43 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      objc_msgSend(v59[0], "setBackgroundColor:");

      v58 = 4.0;
    }
    else
    {
      v57 = 0.0;
      location = 0;
      v38 = -[CPSNavigationAlertView navigationAlert](v60, "navigationAlert");
      v37 = -[CPNavigationAlert primaryAction](v38, "primaryAction");
      v36 = CPSBackgroundColorForAlertAction(v37, 1);
      *(_QWORD *)&v55[1] = (id)CPContrastingColorForColor();

      if (!*(_QWORD *)&v55[1])
      {
        v34 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "_carScreen");
        v33 = (id)objc_msgSend(v34, "traitCollection");
        v35 = objc_msgSend(v33, "userInterfaceStyle") == 2;

        *(_QWORD *)v55 = v35;
        if (v35)
          v3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        else
          v3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v4 = *(void **)&v55[1];
        *(_QWORD *)&v55[1] = v3;

      }
      v31 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v32 = objc_msgSend(*(id *)&v55[1], "isEqual:");

      if ((v32 & 1) != 0)
      {
        v57 = 0.100000001;
        objc_storeStrong(&location, (id)*MEMORY[0x24BDE5BD8]);
      }
      else
      {
        v57 = 0.0599999987;
        objc_storeStrong(&location, (id)*MEMORY[0x24BDE5BD0]);
      }
      v27 = (id)objc_msgSend(*(id *)&v55[1], "colorWithAlphaComponent:", v57);
      objc_msgSend(v59[0], "setBackgroundColor:");

      v54 = (id)objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", location);
      v28 = v54;
      v5 = objc_msgSend(objc_retainAutorelease(*(id *)&v55[1]), "CGColor");
      objc_msgSend(v28, "setValue:forKey:", v5, *MEMORY[0x24BDE5AD0]);
      v29 = v54;
      v30 = (id)objc_msgSend(v59[0], "layer");
      objc_msgSend(v30, "setCompositingFilter:", v29);

      v58 = 36.0;
      objc_storeStrong(&v54, 0);
      objc_storeStrong((id *)&v55[1], 0);
      objc_storeStrong(&location, 0);
    }
    v24 = (id)-[CPSNavigationAlertProgressView superview](v60->_progressView, "superview");
    objc_msgSend(v24, "addSubview:", v59[0]);

    v25 = -[CPSNavigationAlertView navigationAlert](v60, "navigationAlert");
    v26 = CPSAlertUsesMinimalStyle(v25);

    if (!v26)
    {
      v23 = (id)-[CPSNavigationAlertProgressView superview](v60->_progressView, "superview");
      v22 = (id)-[CPSNavigationAlertProgressView superview](v60->_progressView, "superview");
      v21 = (id)objc_msgSend(v22, "titleLabel");
      objc_msgSend(v23, "bringSubviewToFront:");

    }
    v8 = (id)objc_msgSend(v59[0], "widthAnchor");
    v7 = (id)-[CPSNavigationAlertProgressView widthAnchor](v60->_progressView, "widthAnchor");
    v53 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");

    v9 = (void *)MEMORY[0x24BDD1628];
    v18 = (id)objc_msgSend(v59[0], "leadingAnchor");
    v17 = (id)-[CPSNavigationAlertProgressView leadingAnchor](v60->_progressView, "leadingAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v61[0] = v16;
    v15 = (id)objc_msgSend(v59[0], "topAnchor");
    v14 = (id)-[CPSNavigationAlertProgressView topAnchor](v60->_progressView, "topAnchor");
    v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v61[1] = v13;
    v12 = (id)objc_msgSend(v59[0], "heightAnchor");
    v11 = (id)objc_msgSend(v12, "constraintEqualToConstant:", v58);
    v61[2] = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 3);
    objc_msgSend(v9, "activateConstraints:");

    -[CPSNavigationAlertView layoutIfNeeded](v60, "layoutIfNeeded");
    objc_msgSend(v53, "setActive:", 1);
    v20 = (void *)MEMORY[0x24BDF6F90];
    -[CPNavigationAlert duration](v60->_navigationAlert, "duration");
    v19 = v6;
    v47 = MEMORY[0x24BDAC760];
    v48 = -1073741824;
    v49 = 0;
    v50 = __40__CPSNavigationAlertView_startAnimating__block_invoke;
    v51 = &unk_24E26F1B8;
    v52 = v60;
    objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 196614, &v47, v19, 0.0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(v59, 0);
  }
}

uint64_t __40__CPSNavigationAlertView_startAnimating__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

- (void)updateNavigationAlert:(id)a3
{
  id v3;
  CPSAbridgableNewlineLabel *v4;
  id v5;
  CPSAbridgableNewlineLabel *v6;
  id v7;
  id location[2];
  CPSNavigationAlertView *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Received update for navigation alert %@", v10, 0xCu);
  }
  objc_storeStrong(&v7, 0);
  v4 = -[CPSNavigationAlertView titleLabel](v9, "titleLabel");
  v3 = (id)objc_msgSend(location[0], "titleVariants");
  -[CPSAbridgableLabel setTextVariants:](v4, "setTextVariants:");

  v6 = -[CPSNavigationAlertView subtitleLabel](v9, "subtitleLabel");
  v5 = (id)objc_msgSend(location[0], "subtitleVariants");
  -[CPSAbridgableLabel setTextVariants:](v6, "setTextVariants:");

  -[CPSNavigationAlertView invalidateIntrinsicContentSize](v9, "invalidateIntrinsicContentSize");
  -[CPSNavigationAlertView setNeedsLayout](v9, "setNeedsLayout");
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  CPSAbridgableNewlineLabel *v9;
  id v10;
  id v11;
  CPSAbridgableNewlineLabel *v12;
  id v13;
  uint64_t v14;
  id v15;
  objc_super v16;
  id location[2];
  CPSNavigationAlertView *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16.receiver = v18;
  v16.super_class = (Class)CPSNavigationAlertView;
  -[CPSNavigationAlertView traitCollectionDidChange:](&v16, sel_traitCollectionDidChange_, location[0]);
  v15 = 0;
  v13 = (id)-[CPSNavigationAlertView traitCollection](v18, "traitCollection");
  v14 = objc_msgSend(v13, "userInterfaceStyle");

  switch(v14)
  {
    case 0:
      goto LABEL_4;
    case 1:
      v5 = (id)objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
      v6 = v15;
      v15 = v5;

      break;
    case 2:
LABEL_4:
      v3 = (id)objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
      v4 = v15;
      v15 = v3;

      break;
  }
  v7 = v15;
  v9 = -[CPSNavigationAlertView titleLabel](v18, "titleLabel");
  v8 = (id)-[CPSAbridgableNewlineLabel layer](v9, "layer");
  objc_msgSend(v8, "setCompositingFilter:", v7);

  v10 = v15;
  v12 = -[CPSNavigationAlertView subtitleLabel](v18, "subtitleLabel");
  v11 = (id)-[CPSAbridgableNewlineLabel layer](v12, "layer");
  objc_msgSend(v11, "setCompositingFilter:", v10);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  NSArray *v4;
  NSArray *ringConstraints;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  CPSNavigationAlertFocusButton *v21;
  BOOL v22;
  char v24;
  CPSNavigationAlertFocusButton *v25;
  id v26;
  objc_super v27;
  id v28;
  id location[2];
  CPSNavigationAlertView *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27.receiver = v30;
  v27.super_class = (Class)CPSNavigationAlertView;
  -[CPSNavigationAlertView didUpdateFocusInContext:withAnimationCoordinator:](&v27, sel_didUpdateFocusInContext_withAnimationCoordinator_, location[0], v28);
  v26 = (id)objc_msgSend(location[0], "nextFocusedView");
  if (!v26)
    goto LABEL_10;
  v21 = -[CPSNavigationAlertView primaryButton](v30, "primaryButton");
  v24 = 0;
  v22 = 1;
  if (v26 != v21)
  {
    v25 = -[CPSNavigationAlertView secondaryButton](v30, "secondaryButton");
    v24 = 1;
    v22 = v26 == v25;
  }
  if ((v24 & 1) != 0)

  if (v22)
  {
    v20 = -[CPSNavigationAlertView ringConstraints](v30, "ringConstraints");

    if (v20)
    {
      v18 = (void *)MEMORY[0x24BDD1628];
      v19 = -[CPSNavigationAlertView ringConstraints](v30, "ringConstraints");
      objc_msgSend(v18, "deactivateConstraints:");

      objc_storeStrong((id *)&v30->_ringConstraints, 0);
    }
    -[CPUIFocusRingView setHidden:](v30->_focusRingView, "setHidden:", 0);
    v17 = (id)-[CPUIFocusRingView topAnchor](v30->_focusRingView, "topAnchor");
    v16 = (id)objc_msgSend(v26, "topAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:");
    v31[0] = v15;
    v14 = (id)-[CPUIFocusRingView bottomAnchor](v30->_focusRingView, "bottomAnchor");
    v13 = (id)objc_msgSend(v26, "bottomAnchor");
    v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:");
    v31[1] = v12;
    v11 = (id)-[CPUIFocusRingView leadingAnchor](v30->_focusRingView, "leadingAnchor");
    v10 = (id)objc_msgSend(v26, "leadingAnchor");
    v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", -3.0);
    v31[2] = v9;
    v8 = (id)-[CPUIFocusRingView trailingAnchor](v30->_focusRingView, "trailingAnchor");
    v7 = (id)objc_msgSend(v26, "trailingAnchor");
    v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", 3.0);
    v31[3] = v6;
    v4 = (NSArray *)(id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
    ringConstraints = v30->_ringConstraints;
    v30->_ringConstraints = v4;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v30->_ringConstraints);
    -[CPSNavigationAlertView bringSubviewToFront:](v30, "bringSubviewToFront:", v30->_focusRingView);
  }
  else
  {
LABEL_10:
    -[CPUIFocusRingView setHidden:](v30->_focusRingView, "setHidden:", 1);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return 1;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 1;
}

- (CPNavigationAlert)navigationAlert
{
  return self->_navigationAlert;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (CPSButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (CPSAbridgableNewlineLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (CPSAbridgableNewlineLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CPSNavigationAlertFocusButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (CPSNavigationAlertFocusButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (CPSNavigationAlertProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (CPUIFocusRingView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
  objc_storeStrong((id *)&self->_focusRingView, a3);
}

- (NSArray)ringConstraints
{
  return self->_ringConstraints;
}

- (void)setRingConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_ringConstraints, a3);
}

- (BOOL)hasStartedAnimating
{
  return self->_hasStartedAnimating;
}

- (void)setHasStartedAnimating:(BOOL)a3
{
  self->_hasStartedAnimating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringConstraints, 0);
  objc_storeStrong((id *)&self->_focusRingView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_navigationAlert, 0);
}

@end
