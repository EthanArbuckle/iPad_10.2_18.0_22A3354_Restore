@implementation CPSDashboardItemView

- (CPSDashboardItemView)initWithDashboardButton:(id)a3 layoutAxis:(unint64_t)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  CPSDashboardItemView *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
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
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  _QWORD *v159;
  id v160;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id obj;
  objc_super v168;
  unint64_t v169;
  id location[2];
  id v171;
  _QWORD v172[4];
  _QWORD v173[20];
  _QWORD v174[25];

  v174[24] = *MEMORY[0x24BDAC8D0];
  v171 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v169 = a4;
  v4 = v171;
  v171 = 0;
  v168.receiver = v4;
  v168.super_class = (Class)CPSDashboardItemView;
  v171 = -[CPSDashboardItemView init](&v168, sel_init);
  objc_storeStrong(&v171, v171);
  if (v171)
  {
    *((_QWORD *)v171 + 60) = v169;
    objc_storeStrong((id *)v171 + 52, location[0]);
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    obj = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v155 = (id)objc_msgSend(obj, "layer");
    objc_msgSend(v155, "setCornerRadius:", 4.0);

    v156 = (id)objc_msgSend(obj, "layer");
    objc_msgSend(v156, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    objc_msgSend(v171, "addSubview:", obj);
    objc_msgSend(obj, "setHidden:", 1);
    objc_storeStrong((id *)v171 + 59, obj);
    v166 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v166, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v171, "addSubview:", v166);
    objc_storeStrong((id *)v171 + 53, v166);
    v165 = objc_alloc_init(CPSAbridgableLabel);
    objc_msgSend(v165, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v159 = (_QWORD *)MEMORY[0x24BDF77C0];
    v157 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77C0]);
    objc_msgSend(v165, "setFont:");

    objc_msgSend(v171, "addSubview:", v165);
    objc_storeStrong((id *)v171 + 57, v165);
    v164 = objc_alloc_init(CPSAbridgableLabel);
    objc_msgSend(v164, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v158 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
    objc_msgSend(v164, "setTextColor:");

    v160 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *v159, 256);
    objc_msgSend(v164, "setFont:");

    objc_msgSend(v171, "addSubview:", v164);
    objc_storeStrong((id *)v171 + 56, v164);
    v163 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    objc_msgSend(v171, "addLayoutGuide:", v163);
    if (v169 == 1)
    {
      v83 = (void *)MEMORY[0x24BDD1628];
      v154 = (id)objc_msgSend(v171, "topAnchor");
      v153 = (id)objc_msgSend(v166, "topAnchor");
      v152 = (id)objc_msgSend(v154, "constraintLessThanOrEqualToAnchor:constant:");
      v174[0] = v152;
      v151 = (id)objc_msgSend(v171, "topAnchor");
      v150 = (id)objc_msgSend(v163, "topAnchor");
      v149 = (id)objc_msgSend(v151, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v174[1] = v149;
      v148 = (id)objc_msgSend(v171, "bottomAnchor");
      v147 = (id)objc_msgSend(v166, "bottomAnchor");
      v146 = (id)objc_msgSend(v148, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[2] = v146;
      v145 = (id)objc_msgSend(v171, "bottomAnchor");
      v144 = (id)objc_msgSend(v163, "bottomAnchor");
      v143 = (id)objc_msgSend(v145, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[3] = v143;
      v142 = (id)objc_msgSend(v166, "heightAnchor");
      v141 = (id)objc_msgSend(v142, "constraintEqualToConstant:");
      v174[4] = v141;
      v140 = (id)objc_msgSend(v166, "widthAnchor");
      v139 = (id)objc_msgSend(v140, "constraintEqualToConstant:", 40.0);
      v174[5] = v139;
      v138 = (id)objc_msgSend(v166, "leadingAnchor");
      v137 = (id)objc_msgSend(v171, "leadingAnchor");
      v136 = (id)objc_msgSend(v138, "constraintEqualToAnchor:constant:");
      v174[6] = v136;
      v135 = (id)objc_msgSend(v166, "centerYAnchor");
      v134 = (id)objc_msgSend(v171, "centerYAnchor");
      v133 = (id)objc_msgSend(v135, "constraintEqualToAnchor:");
      v174[7] = v133;
      v132 = (id)objc_msgSend(v163, "leadingAnchor");
      v131 = (id)objc_msgSend(v166, "trailingAnchor");
      v130 = (id)objc_msgSend(v132, "constraintEqualToAnchor:constant:", 8.0);
      v174[8] = v130;
      v129 = (id)objc_msgSend(v163, "centerYAnchor");
      v128 = (id)objc_msgSend(v166, "centerYAnchor");
      v127 = (id)objc_msgSend(v129, "constraintEqualToAnchor:");
      v174[9] = v127;
      v126 = (id)objc_msgSend(v163, "trailingAnchor");
      v125 = (id)objc_msgSend(v171, "trailingAnchor");
      v124 = (id)objc_msgSend(v126, "constraintEqualToAnchor:constant:", -8.0);
      v174[10] = v124;
      v123 = (id)objc_msgSend(v165, "topAnchor");
      v122 = (id)objc_msgSend(v163, "topAnchor");
      v121 = (id)objc_msgSend(v123, "constraintEqualToAnchor:constant:", 0.0);
      v174[11] = v121;
      v120 = (id)objc_msgSend(v165, "lastBaselineAnchor");
      v119 = (id)objc_msgSend(v164, "firstBaselineAnchor");
      v118 = (id)objc_msgSend(v120, "constraintEqualToAnchor:constant:", -17.0);
      v174[12] = v118;
      v117 = (id)objc_msgSend(v164, "bottomAnchor");
      v116 = (id)objc_msgSend(v163, "bottomAnchor");
      v115 = (id)objc_msgSend(v117, "constraintEqualToAnchor:constant:", 0.0);
      v174[13] = v115;
      v114 = (id)objc_msgSend(v165, "leadingAnchor");
      v113 = (id)objc_msgSend(v163, "leadingAnchor");
      v112 = (id)objc_msgSend(v114, "constraintEqualToAnchor:constant:", 0.0);
      v174[14] = v112;
      v111 = (id)objc_msgSend(v165, "trailingAnchor");
      v110 = (id)objc_msgSend(v163, "trailingAnchor");
      v109 = (id)objc_msgSend(v111, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v174[15] = v109;
      v108 = (id)objc_msgSend(v164, "leadingAnchor");
      v107 = (id)objc_msgSend(v163, "leadingAnchor");
      v106 = (id)objc_msgSend(v108, "constraintEqualToAnchor:constant:", 0.0);
      v174[16] = v106;
      v105 = (id)objc_msgSend(v164, "trailingAnchor");
      v104 = (id)objc_msgSend(v163, "trailingAnchor");
      v103 = (id)objc_msgSend(v105, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v174[17] = v103;
      v102 = (id)objc_msgSend(v163, "trailingAnchor");
      v101 = (id)objc_msgSend(v164, "trailingAnchor");
      v100 = (id)objc_msgSend(v102, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[18] = v100;
      v99 = (id)objc_msgSend(v163, "trailingAnchor");
      v98 = (id)objc_msgSend(v165, "trailingAnchor");
      v97 = (id)objc_msgSend(v99, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[19] = v97;
      v96 = (id)objc_msgSend(obj, "leadingAnchor");
      v95 = (id)objc_msgSend(v165, "leadingAnchor");
      v94 = (id)objc_msgSend(v96, "constraintEqualToAnchor:constant:");
      v174[20] = v94;
      v93 = (id)objc_msgSend(obj, "trailingAnchor");
      v92 = (id)objc_msgSend(v165, "trailingAnchor");
      v91 = (id)objc_msgSend(v93, "constraintEqualToAnchor:constant:");
      v174[21] = v91;
      v90 = (id)objc_msgSend(obj, "topAnchor");
      v89 = (id)objc_msgSend(v165, "topAnchor");
      v88 = (id)objc_msgSend(v90, "constraintEqualToAnchor:constant:", -2.0);
      v174[22] = v88;
      v87 = (id)objc_msgSend(obj, "bottomAnchor");
      v86 = (id)objc_msgSend(v165, "bottomAnchor");
      v85 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", 2.0);
      v174[23] = v85;
      v84 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v174, 24);
      objc_msgSend(v83, "activateConstraints:");

    }
    else
    {
      v25 = (id)objc_msgSend(v165, "trailingAnchor");
      v24 = (id)objc_msgSend(v164, "leadingAnchor");
      v6 = (id)objc_msgSend(v25, "constraintEqualToAnchor:constant:", -4.0);
      v7 = (void *)*((_QWORD *)v171 + 62);
      *((_QWORD *)v171 + 62) = v6;

      v26 = (void *)MEMORY[0x24BDD1628];
      v82 = (id)objc_msgSend(v166, "heightAnchor");
      v81 = (id)objc_msgSend(v82, "constraintEqualToConstant:");
      v173[0] = v81;
      v80 = (id)objc_msgSend(v166, "widthAnchor");
      v79 = (id)objc_msgSend(v80, "constraintEqualToConstant:", 30.0);
      v173[1] = v79;
      v78 = (id)objc_msgSend(v166, "centerXAnchor");
      v77 = (id)objc_msgSend(v171, "centerXAnchor");
      v76 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
      v173[2] = v76;
      v75 = (id)objc_msgSend(v166, "topAnchor");
      v74 = (id)objc_msgSend(v171, "topAnchor");
      v73 = (id)objc_msgSend(v75, "constraintEqualToAnchor:constant:");
      v173[3] = v73;
      v72 = (id)objc_msgSend(v163, "topAnchor");
      v71 = (id)objc_msgSend(v166, "bottomAnchor");
      v70 = (id)objc_msgSend(v72, "constraintEqualToAnchor:constant:", 4.0);
      v173[4] = v70;
      v69 = (id)objc_msgSend(v163, "bottomAnchor");
      v68 = (id)objc_msgSend(v171, "bottomAnchor");
      v67 = (id)objc_msgSend(v69, "constraintEqualToAnchor:constant:", 0.0);
      v173[5] = v67;
      v66 = (id)objc_msgSend(v163, "leadingAnchor");
      v65 = (id)objc_msgSend(v171, "leadingAnchor");
      v64 = (id)objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:");
      v173[6] = v64;
      v63 = (id)objc_msgSend(v163, "centerXAnchor");
      v62 = (id)objc_msgSend(v166, "centerXAnchor");
      v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
      v173[7] = v61;
      v60 = (id)objc_msgSend(v163, "trailingAnchor");
      v59 = (id)objc_msgSend(v171, "trailingAnchor");
      v58 = (id)objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:");
      v173[8] = v58;
      v57 = (id)objc_msgSend(v165, "topAnchor");
      v56 = (id)objc_msgSend(v163, "topAnchor");
      v55 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:", 0.0);
      v173[9] = v55;
      v54 = (id)objc_msgSend(v165, "bottomAnchor");
      v53 = (id)objc_msgSend(v163, "bottomAnchor");
      v52 = (id)objc_msgSend(v54, "constraintEqualToAnchor:constant:", 0.0);
      v173[10] = v52;
      v51 = (id)objc_msgSend(v165, "leadingAnchor");
      v50 = (id)objc_msgSend(v163, "leadingAnchor");
      v49 = (id)objc_msgSend(v51, "constraintEqualToAnchor:constant:", 0.0);
      v173[11] = v49;
      v173[12] = *((_QWORD *)v171 + 62);
      v48 = (id)objc_msgSend(v164, "topAnchor");
      v47 = (id)objc_msgSend(v163, "topAnchor");
      v46 = (id)objc_msgSend(v48, "constraintEqualToAnchor:constant:", 0.0);
      v173[13] = v46;
      v45 = (id)objc_msgSend(v164, "bottomAnchor");
      v44 = (id)objc_msgSend(v163, "bottomAnchor");
      v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:constant:", 0.0);
      v173[14] = v43;
      v42 = (id)objc_msgSend(v164, "trailingAnchor");
      v41 = (id)objc_msgSend(v163, "trailingAnchor");
      v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:constant:", 0.0);
      v173[15] = v40;
      v39 = (id)objc_msgSend(obj, "leadingAnchor");
      v38 = (id)objc_msgSend(v163, "leadingAnchor");
      v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:");
      v173[16] = v37;
      v36 = (id)objc_msgSend(obj, "trailingAnchor");
      v35 = (id)objc_msgSend(v163, "trailingAnchor");
      v34 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:");
      v173[17] = v34;
      v33 = (id)objc_msgSend(obj, "topAnchor");
      v32 = (id)objc_msgSend(v163, "topAnchor");
      v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:constant:", -2.0);
      v173[18] = v31;
      v30 = (id)objc_msgSend(obj, "bottomAnchor");
      v29 = (id)objc_msgSend(v163, "bottomAnchor");
      v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", 2.0);
      v173[19] = v28;
      v27 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v173, 20);
      objc_msgSend(v26, "activateConstraints:");

    }
    v162 = (id)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    objc_msgSend(v162, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v162, "addTarget:action:forControlEvents:", v171, sel__buttonTriggered_, 0x2000);
    objc_msgSend(v162, "addTarget:action:forControlEvents:", v171, sel__touchDown_, 1);
    objc_msgSend(v162, "addTarget:action:forControlEvents:", v171, sel__touchEnded_, 456);
    objc_msgSend(v171, "addSubview:", v162);
    objc_storeStrong((id *)v171 + 58, v162);
    v10 = (void *)MEMORY[0x24BDD1628];
    v23 = (id)objc_msgSend(v171, "topAnchor");
    v22 = (id)objc_msgSend(v162, "topAnchor");
    v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v172[0] = v21;
    v20 = (id)objc_msgSend(v171, "bottomAnchor");
    v19 = (id)objc_msgSend(v162, "bottomAnchor");
    v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v172[1] = v18;
    v17 = (id)objc_msgSend(v171, "leftAnchor");
    v16 = (id)objc_msgSend(v162, "leftAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v172[2] = v15;
    v14 = (id)objc_msgSend(v171, "rightAnchor");
    v13 = (id)objc_msgSend(v162, "rightAnchor");
    v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v172[3] = v12;
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v172, 4);
    objc_msgSend(v10, "activateConstraints:");

    objc_msgSend(v171, "_setup");
    objc_storeStrong(&v162, 0);
    objc_storeStrong(&v163, 0);
    objc_storeStrong(&v164, 0);
    objc_storeStrong(&v165, 0);
    objc_storeStrong(&v166, 0);
    objc_storeStrong(&obj, 0);
  }
  v9 = (CPSDashboardItemView *)v171;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v171, 0);
  return v9;
}

- (void)setFocusHighlightColor:(id)a3
{
  id v3;
  UIView *v4;
  id location[2];
  CPSDashboardItemView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_focusHighlightColor, location[0]);
  v3 = location[0];
  v4 = -[CPSDashboardItemView focusBackgroundView](v6, "focusBackgroundView");
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v3);

  objc_storeStrong(location, 0);
}

- (void)_setup
{
  UIImage *v2;
  CPDashboardButton *v3;
  UIImageView *v4;
  NSArray *v5;
  CPDashboardButton *v6;
  CPSAbridgableLabel *v7;
  NSArray *v8;
  CPDashboardButton *v9;
  CPSAbridgableLabel *v10;

  v4 = -[CPSDashboardItemView imageView](self, "imageView");
  v3 = -[CPSDashboardItemView dashboardButton](self, "dashboardButton");
  v2 = -[CPDashboardButton image](v3, "image");
  -[UIImageView setImage:](v4, "setImage:");

  v7 = -[CPSDashboardItemView titleLabel](self, "titleLabel");
  v6 = -[CPSDashboardItemView dashboardButton](self, "dashboardButton");
  v5 = -[CPDashboardButton titleVariants](v6, "titleVariants");
  -[CPSAbridgableLabel setTextVariants:](v7, "setTextVariants:");

  v10 = -[CPSDashboardItemView subtitleLabel](self, "subtitleLabel");
  v9 = -[CPSDashboardItemView dashboardButton](self, "dashboardButton");
  v8 = -[CPDashboardButton subtitleVariants](v9, "subtitleVariants");
  -[CPSAbridgableLabel setTextVariants:](v10, "setTextVariants:");

}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  NSArray *v5;
  CPSAbridgableLabel *v6;
  BOOL v7;
  CPSAbridgableLabel *v8;
  double v9;
  CPSAbridgableLabel *v10;
  double v11;
  CPSAbridgableLabel *v12;
  CPSAbridgableLabel *v13;
  CPSAbridgableLabel *v14;
  CPSAbridgableLabel *v15;
  CPSAbridgableLabel *v16;
  void *v17;
  id v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  double v22;
  BOOL v23;
  objc_super v24;
  SEL v25;
  CPSDashboardItemView *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)CPSDashboardItemView;
  -[CPSDashboardItemView layoutSubviews](&v24, sel_layoutSubviews);
  v20 = -[CPSDashboardItemView titleLabelConnectingConstraint](v26, "titleLabelConnectingConstraint");
  -[NSLayoutConstraint setConstant:](v20, "setConstant:", -4.0);

  v21 = -[CPSDashboardItemView subtitleWidthConstraint](v26, "subtitleWidthConstraint");
  if (v21)
  {
    v17 = (void *)MEMORY[0x24BDD1628];
    v19 = -[CPSDashboardItemView subtitleWidthConstraint](v26, "subtitleWidthConstraint");
    v27[0] = v19;
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    objc_msgSend(v17, "deactivateConstraints:");

  }
  v12 = -[CPSDashboardItemView subtitleLabel](v26, "subtitleLabel");
  -[CPSAbridgableLabel setHidden:](v12, "setHidden:", 0);

  v13 = -[CPSDashboardItemView titleLabel](v26, "titleLabel");
  -[CPSAbridgableLabel sizeToFit](v13, "sizeToFit");

  v14 = -[CPSDashboardItemView subtitleLabel](v26, "subtitleLabel");
  -[CPSAbridgableLabel sizeToFit](v14, "sizeToFit");

  v15 = -[CPSDashboardItemView subtitleLabel](v26, "subtitleLabel");
  -[CPSAbridgableLabel layoutIfNeeded](v15, "layoutIfNeeded");

  v16 = -[CPSDashboardItemView titleLabel](v26, "titleLabel");
  -[CPSAbridgableLabel layoutIfNeeded](v16, "layoutIfNeeded");

  v23 = 0;
  if (-[CPSDashboardItemView layoutAxis](v26, "layoutAxis") == 2)
  {
    -[CPSDashboardItemView bounds](v26, "bounds");
    v22 = v2;
    v10 = -[CPSDashboardItemView titleLabel](v26, "titleLabel");
    -[CPSAbridgableLabel intrinsicContentSize](v10, "intrinsicContentSize");
    v9 = v3 + 4.0;
    v8 = -[CPSDashboardItemView subtitleLabel](v26, "subtitleLabel");
    -[CPSAbridgableLabel intrinsicContentSize](v8, "intrinsicContentSize");
    v11 = v9 + v4;

    v23 = v11 > v22;
  }
  v6 = -[CPSDashboardItemView subtitleLabel](v26, "subtitleLabel");
  v5 = -[CPSAbridgableLabel textVariants](v6, "textVariants");
  v7 = -[NSArray count](v5, "count") != 0;

  if (!v7)
    v23 = 1;
  if (v23)
    -[CPSDashboardItemView hideSubtitle](v26, "hideSubtitle");
}

- (void)hideSubtitle
{
  double v2;
  NSLayoutConstraint *v3;
  id v4;
  id v5;
  CPSAbridgableLabel *v6;
  NSLayoutConstraint *v7;
  void *v8;
  id v9;
  NSLayoutConstraint *v10;
  CPSAbridgableLabel *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[CPSDashboardItemView titleLabelConnectingConstraint](self, "titleLabelConnectingConstraint");
  -[NSLayoutConstraint setConstant:](v3, "setConstant:");

  v6 = -[CPSDashboardItemView subtitleLabel](self, "subtitleLabel");
  v5 = (id)-[CPSAbridgableLabel widthAnchor](v6, "widthAnchor");
  v4 = (id)objc_msgSend(v5, "constraintEqualToConstant:", 0.0);
  -[CPSDashboardItemView setSubtitleWidthConstraint:](self, "setSubtitleWidthConstraint:");

  v7 = -[CPSDashboardItemView subtitleWidthConstraint](self, "subtitleWidthConstraint");
  LODWORD(v2) = 1148846080;
  -[NSLayoutConstraint setPriority:](v7, "setPriority:", v2);

  v8 = (void *)MEMORY[0x24BDD1628];
  v10 = -[CPSDashboardItemView subtitleWidthConstraint](self, "subtitleWidthConstraint");
  v13[0] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  objc_msgSend(v8, "activateConstraints:");

  v11 = -[CPSDashboardItemView subtitleLabel](self, "subtitleLabel");
  -[CPSAbridgableLabel setHidden:](v11, "setHidden:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSDashboardItemView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSDashboardItemView;
  -[CPSDashboardItemView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSDashboardItemView _setup](v5, "_setup");
  objc_storeStrong(location, 0);
}

- (void)focusableItemPressed:(BOOL)a3
{
  if (a3)
    -[CPSDashboardItemView setAlpha:](self, "setAlpha:", 0.2);
  else
    -[CPSDashboardItemView setAlpha:](self, "setAlpha:", 1.0);
}

- (void)focusableItemSelected
{
  CPDashboardButton *v2;
  CPSButtonDelegate *v3;

  v3 = -[CPSDashboardItemView delegate](self, "delegate");
  v2 = -[CPSDashboardItemView dashboardButton](self, "dashboardButton");
  -[CPSButtonDelegate didSelectButton:](v3, "didSelectButton:");

}

- (void)focusableItemFocused:(BOOL)a3
{
  id v3;
  CPSAbridgableLabel *v4;
  UIView *v5;
  id v6;
  CPSAbridgableLabel *v7;
  id v8;
  CPSAbridgableLabel *v9;
  UIView *v10;
  id v11;
  CPSAbridgableLabel *v12;

  if (a3)
  {
    v10 = -[CPSDashboardItemView focusBackgroundView](self, "focusBackgroundView");
    -[UIView setHidden:](v10, "setHidden:", 0);

    v12 = -[CPSDashboardItemView titleLabel](self, "titleLabel");
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    -[CPSAbridgableLabel setTextColor:](v12, "setTextColor:");

    if (-[CPSDashboardItemView layoutAxis](self, "layoutAxis") == 2)
    {
      v9 = -[CPSDashboardItemView subtitleLabel](self, "subtitleLabel");
      v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusPrimaryColor");
      -[CPSAbridgableLabel setTextColor:](v9, "setTextColor:");

    }
  }
  else
  {
    v5 = -[CPSDashboardItemView focusBackgroundView](self, "focusBackgroundView");
    -[UIView setHidden:](v5, "setHidden:", 1);

    v7 = -[CPSDashboardItemView titleLabel](self, "titleLabel");
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v7, "setTextColor:");

    if (-[CPSDashboardItemView layoutAxis](self, "layoutAxis") == 2)
    {
      v4 = -[CPSDashboardItemView subtitleLabel](self, "subtitleLabel");
      v3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
      -[CPSAbridgableLabel setTextColor:](v4, "setTextColor:");

    }
  }
}

- (void)_touchDown:(id)a3
{
  id location[2];
  CPSDashboardItemView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSDashboardItemView setAlpha:](v4, "setAlpha:", 0.2);
  objc_storeStrong(location, 0);
}

- (void)_touchEnded:(id)a3
{
  id location[2];
  CPSDashboardItemView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSDashboardItemView setAlpha:](v4, "setAlpha:", 1.0);
  objc_storeStrong(location, 0);
}

- (void)_buttonTriggered:(id)a3
{
  CPDashboardButton *v3;
  CPSButtonDelegate *v4;
  id location[2];
  CPSDashboardItemView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSDashboardItemView delegate](v6, "delegate");
  v3 = -[CPSDashboardItemView dashboardButton](v6, "dashboardButton");
  -[CPSButtonDelegate didSelectButton:](v4, "didSelectButton:");

  objc_storeStrong(location, 0);
}

- (CPDashboardButton)dashboardButton
{
  return self->_dashboardButton;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CPSButtonDelegate)delegate
{
  return (CPSButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (CPSAbridgableLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIView)focusBackgroundView
{
  return self->_focusBackgroundView;
}

- (void)setFocusBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_focusBackgroundView, a3);
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_layoutAxis = a3;
}

- (NSLayoutConstraint)subtitleWidthConstraint
{
  return self->_subtitleWidthConstraint;
}

- (void)setSubtitleWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleWidthConstraint, a3);
}

- (NSLayoutConstraint)titleLabelConnectingConstraint
{
  return self->_titleLabelConnectingConstraint;
}

- (void)setTitleLabelConnectingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelConnectingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelConnectingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_focusBackgroundView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_focusHighlightColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_dashboardButton, 0);
}

@end
