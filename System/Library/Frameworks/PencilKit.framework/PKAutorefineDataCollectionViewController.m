@implementation PKAutorefineDataCollectionViewController

- (id)initWithDrawings:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKAutorefineDataCollectionViewController;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 121, a2);
  }

  return a1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  UIScrollView *v12;
  UIScrollView *scrollView;
  UIScrollView *v14;
  void *v15;
  void *v16;
  UIScrollView *v17;
  UIScrollView *v18;
  UIScrollView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIScrollView *v26;
  UIScrollView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIScrollView *v34;
  UIScrollView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIScrollView *v42;
  UIScrollView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  UIScrollView *v50;
  UIScrollView *v51;
  void *v52;
  void *v53;
  UIScrollView *v54;
  UIScrollView *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  UILabel *descriptionLabel;
  UILabel *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  UILabel *v70;
  UILabel *v71;
  void *v72;
  UILabel *v73;
  UILabel *v74;
  UILabel *v75;
  UIScrollView *v76;
  UILabel *v77;
  UILabel *v78;
  UILabel *v79;
  void *v80;
  UILabel *v81;
  void *v82;
  UIScrollView *v83;
  UIScrollView *v84;
  uint64_t v85;
  UILabel *v86;
  UILabel *v87;
  void *v88;
  UIScrollView *v89;
  UIScrollView *v90;
  void *v91;
  void *v92;
  UILabel *v93;
  UILabel *v94;
  void *v95;
  UIScrollView *v96;
  UIScrollView *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  UITableView *v103;
  UITableView *tableView;
  UITableView *v105;
  UITableView *v106;
  UITableView *v107;
  UITableView *v108;
  UITableView *v109;
  UITableView *v110;
  UITableView *v111;
  UIScrollView *v112;
  UITableView *v113;
  UITableView *v114;
  UITableView *v115;
  void *v116;
  UITableView *v117;
  void *v118;
  UILabel *v119;
  UILabel *v120;
  uint64_t v121;
  UITableView *v122;
  UITableView *v123;
  void *v124;
  UIScrollView *v125;
  UIScrollView *v126;
  UITableView *v127;
  UIScrollView *v128;
  UIScrollView *v129;
  void *v130;
  void *v131;
  UITableView *v132;
  UITableView *v133;
  void *v134;
  UIScrollView *v135;
  UIScrollView *v136;
  void *v137;
  void *v138;
  void *v139;
  UITableView *v140;
  void *v141;
  void *v142;
  NSLayoutConstraint *tableViewHeightConstraint;
  NSLayoutConstraint *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  const char *v149;
  void *v150;
  id v151;
  SEL v152;
  id Property;
  id v154;
  const char *v155;
  id v156;
  id v157;
  id v158;
  uint64_t v159;
  double v160;
  double v161;
  uint64_t v162;
  uint64_t v163;
  CGFloat v164;
  CGFloat v165;
  uint64_t i;
  void *v167;
  BOOL v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  const char *v177;
  id v178;
  SEL v179;
  id v180;
  id v181;
  void *v182;
  const char *v183;
  void *v184;
  id v185;
  SEL v186;
  id v187;
  id v188;
  void *v189;
  void *v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  void *v201;
  uint64_t v202;
  id *v203;
  NSMutableArray *tableDataEntries;
  NSMutableArray *v205;
  uint64_t v206;
  void *v207;
  UITableView *v208;
  void *v209;
  void *v210;
  UIScrollView *v211;
  void *v212;
  void *v213;
  void *v214;
  UILabel *v215;
  UITableView *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  UILabel *v222;
  UIScrollView *v223;
  void *v224;
  id obj;
  UITableView *obja;
  id objb;
  void *v228;
  uint64_t v229;
  UILabel *v230;
  void *v231;
  uint64_t v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  objc_super v241;
  _BYTE v242[128];
  _BYTE v243[128];
  uint64_t v244;
  uint64_t v245;
  void *v246;
  void *v247;
  _QWORD v248[5];
  CGSize v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;

  v248[3] = *MEMORY[0x1E0C80C00];
  v241.receiver = self;
  v241.super_class = (Class)PKAutorefineDataCollectionViewController;
  -[PKAutorefineDataCollectionViewController viewDidLoad](&v241, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutorefineDataCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (self)
  {
    objc_storeStrong((id *)&self->_scrollView, v10);

    v12 = self->_scrollView;
    -[UIScrollView setAlwaysBounceVertical:](v12, "setAlwaysBounceVertical:", 1);

    scrollView = self->_scrollView;
  }
  else
  {

    objc_msgSend(0, "setAlwaysBounceVertical:", 1);
    scrollView = 0;
  }
  v14 = scrollView;
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKAutorefineDataCollectionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (self)
  {
    v17 = self->_scrollView;
    objc_msgSend(v16, "addSubview:", v17);

    v18 = self->_scrollView;
  }
  else
  {
    objc_msgSend(v15, "addSubview:", 0);

    v18 = 0;
  }
  v19 = v18;
  -[UIScrollView frameLayoutGuide](v19, "frameLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutorefineDataCollectionViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  if (self)
    v26 = self->_scrollView;
  else
    v26 = 0;
  v27 = v26;
  -[UIScrollView frameLayoutGuide](v27, "frameLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leftAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutorefineDataCollectionViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeAreaLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  if (self)
    v34 = self->_scrollView;
  else
    v34 = 0;
  v35 = v34;
  -[UIScrollView frameLayoutGuide](v35, "frameLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutorefineDataCollectionViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "safeAreaLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  if (self)
    v42 = self->_scrollView;
  else
    v42 = 0;
  v43 = v42;
  -[UIScrollView frameLayoutGuide](v43, "frameLayoutGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutorefineDataCollectionViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "safeAreaLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  if (self)
    v50 = self->_scrollView;
  else
    v50 = 0;
  v51 = v50;
  -[UIScrollView frameLayoutGuide](v51, "frameLayoutGuide");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v54 = self->_scrollView;
  else
    v54 = 0;
  v55 = v54;
  -[UIScrollView contentLayoutGuide](v55, "contentLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "widthAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
  v60 = v59;
  if (self)
  {
    objc_storeStrong((id *)&self->_descriptionLabel, v59);

    descriptionLabel = self->_descriptionLabel;
  }
  else
  {

    descriptionLabel = 0;
  }
  v62 = descriptionLabel;
  -[UILabel setNumberOfLines:](v62, "setNumberOfLines:", 0);

  +[PKAutoRefineLogger sharedAutoRefineLogger]();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutoRefineLogger entries](v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = objc_msgSend(v64, "count");
  _PencilKitBundle();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  v228 = v64;
  if (v65)
    v68 = CFSTR("Please select all auto-refine entries you want to submit. If you make no selection and click submit, all entries will be sent to Apple.");
  else
    v68 = CFSTR("No auto-refine entries available.");
  objc_msgSend(v66, "localizedStringForKey:value:table:", v68, v68, CFSTR("Localizable"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v70 = self->_descriptionLabel;
  else
    v70 = 0;
  v71 = v70;
  -[UILabel setText:](v71, "setText:", v69);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v73 = self->_descriptionLabel;
    -[UILabel setFont:](v73, "setFont:", v72);

    v74 = self->_descriptionLabel;
  }
  else
  {
    objc_msgSend(0, "setFont:", v72);

    v74 = 0;
  }
  v75 = v74;
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (self)
  {
    v76 = self->_scrollView;
    v77 = self->_descriptionLabel;
  }
  else
  {
    v76 = 0;
    v77 = 0;
  }
  v78 = v77;
  -[UIScrollView addSubview:](v76, "addSubview:", v78);

  if (self)
    v79 = self->_descriptionLabel;
  else
    v79 = 0;
  v80 = (void *)MEMORY[0x1E0CB3718];
  v81 = v79;
  -[UILabel topAnchor](v81, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v80;
  if (self)
    v83 = self->_scrollView;
  else
    v83 = 0;
  v84 = v83;
  -[UIScrollView topAnchor](v84, "topAnchor");
  v85 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v85, 20.0);
  v248[0] = objc_claimAutoreleasedReturnValue();
  v219 = (void *)v248[0];
  if (self)
    v86 = self->_descriptionLabel;
  else
    v86 = 0;
  v87 = v86;
  -[UILabel leadingAnchor](v87, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v82;
  v215 = v87;
  if (self)
    v89 = self->_scrollView;
  else
    v89 = 0;
  v90 = v89;
  -[UIScrollView leadingAnchor](v90, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v91, 20.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v248[1] = v92;
  v230 = v81;
  v223 = v84;
  if (self)
    v93 = self->_descriptionLabel;
  else
    v93 = 0;
  v94 = v93;
  -[UILabel trailingAnchor](v94, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = (void *)v85;
  v213 = v88;
  if (self)
    v96 = self->_scrollView;
  else
    v96 = 0;
  v97 = v96;
  -[UIScrollView trailingAnchor](v97, "trailingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v98, -20.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v248[2] = v99;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v248, 3);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "activateConstraints:", v100);

  v101 = objc_alloc_init(MEMORY[0x1E0DC3D48]);
  v102 = v101;
  if (self)
  {
    objc_storeStrong((id *)&self->_tableView, v101);

    v103 = self->_tableView;
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v103, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    tableView = self->_tableView;
  }
  else
  {

    objc_msgSend(0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    tableView = 0;
  }
  v105 = tableView;
  -[UITableView setDelegate:](v105, "setDelegate:", self);

  if (self)
  {
    v106 = self->_tableView;
    -[UITableView setDataSource:](v106, "setDataSource:", self);

    v107 = self->_tableView;
  }
  else
  {
    objc_msgSend(0, "setDataSource:", 0);
    v107 = 0;
  }
  v108 = v107;
  -[UITableView setSeparatorStyle:](v108, "setSeparatorStyle:", 0);

  if (self)
  {
    v109 = self->_tableView;
    -[UITableView setAllowsMultipleSelection:](v109, "setAllowsMultipleSelection:", 1);

    v110 = self->_tableView;
  }
  else
  {
    objc_msgSend(0, "setAllowsMultipleSelection:", 1);
    v110 = 0;
  }
  v111 = v110;
  -[UITableView registerClass:forCellReuseIdentifier:](v111, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ImageCell"));

  if (self)
  {
    v112 = self->_scrollView;
    v113 = self->_tableView;
  }
  else
  {
    v112 = 0;
    v113 = 0;
  }
  v114 = v113;
  -[UIScrollView addSubview:](v112, "addSubview:", v114);

  if (self)
    v115 = self->_tableView;
  else
    v115 = 0;
  v116 = (void *)MEMORY[0x1E0CB3718];
  v117 = v115;
  -[UITableView topAnchor](v117, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = v116;
  if (self)
    v119 = self->_descriptionLabel;
  else
    v119 = 0;
  v120 = v119;
  -[UILabel bottomAnchor](v120, "bottomAnchor");
  v121 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v121, 20.0);
  v244 = objc_claimAutoreleasedReturnValue();
  v218 = (void *)v244;
  if (self)
    v122 = self->_tableView;
  else
    v122 = 0;
  v123 = v122;
  -[UITableView leadingAnchor](v123, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v125 = self->_scrollView;
  else
    v125 = 0;
  v126 = v125;
  -[UIScrollView leadingAnchor](v126, "leadingAnchor");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:constant:", 20.0);
  v245 = objc_claimAutoreleasedReturnValue();
  v209 = (void *)v245;
  if (self)
    v127 = self->_tableView;
  else
    v127 = 0;
  v208 = v127;
  -[UITableView trailingAnchor](v208, "trailingAnchor");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = (void *)v121;
  v222 = v120;
  v216 = v123;
  if (self)
    v128 = self->_scrollView;
  else
    v128 = 0;
  v129 = v128;
  -[UIScrollView trailingAnchor](v129, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "constraintEqualToAnchor:constant:", v130, -20.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = v131;
  obja = v117;
  v211 = v126;
  if (self)
    v132 = self->_tableView;
  else
    v132 = 0;
  v133 = v132;
  -[UITableView bottomAnchor](v133, "bottomAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = v118;
  v212 = v124;
  if (self)
    v135 = self->_scrollView;
  else
    v135 = 0;
  v136 = v135;
  -[UIScrollView bottomAnchor](v136, "bottomAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v137, -20.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = v138;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 4);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "activateConstraints:", v139);

  if (self)
  {
    v140 = self->_tableView;
    -[UITableView heightAnchor](v140, "heightAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToConstant:", 0.0);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_tableViewHeightConstraint, v142);

    tableViewHeightConstraint = self->_tableViewHeightConstraint;
  }
  else
  {
    objc_msgSend(0, "heightAnchor");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "constraintEqualToConstant:", 0.0);

    tableViewHeightConstraint = 0;
  }
  v144 = tableViewHeightConstraint;
  -[NSLayoutConstraint setActive:](v144, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v228, "count"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_tableDataEntries, v145);

  v239 = 0u;
  v240 = 0u;
  v237 = 0u;
  v238 = 0u;
  objb = v228;
  v232 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v237, v243, 16);
  if (v232)
  {
    v229 = *(_QWORD *)v238;
    do
    {
      v146 = 0;
      do
      {
        if (*(_QWORD *)v238 != v229)
          objc_enumerationMutation(objb);
        v147 = *(void **)(*((_QWORD *)&v237 + 1) + 8 * v146);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = v148;
        if (v147)
        {
          v151 = objc_getProperty(v147, v149, 16, 1);
          objc_msgSend(v150, "addObjectsFromArray:", v151);

          Property = objc_getProperty(v147, v152, 8, 1);
        }
        else
        {
          objc_msgSend(v148, "addObjectsFromArray:", 0);
          Property = 0;
        }
        v154 = Property;
        objc_msgSend(v150, "addObjectsFromArray:", v154);

        if (v147)
          v156 = objc_getProperty(v147, v155, 24, 1);
        else
          v156 = 0;
        v157 = v156;
        objc_msgSend(v150, "addObjectsFromArray:", v157);

        v235 = 0u;
        v236 = 0u;
        v233 = 0u;
        v234 = 0u;
        v158 = v150;
        v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v233, v242, 16);
        v160 = v6;
        v161 = v7;
        if (v159)
        {
          v162 = v159;
          v163 = *(_QWORD *)v234;
          v164 = v9;
          v165 = v8;
          v161 = v7;
          v160 = v6;
          do
          {
            for (i = 0; i != v162; ++i)
            {
              if (*(_QWORD *)v234 != v163)
                objc_enumerationMutation(v158);
              v167 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * i);
              v250.origin.x = v160;
              v250.origin.y = v161;
              v250.size.width = v165;
              v250.size.height = v164;
              v252.origin.x = v6;
              v252.origin.y = v7;
              v252.size.width = v8;
              v252.size.height = v9;
              v168 = CGRectEqualToRect(v250, v252);
              objc_msgSend(v167, "renderBounds");
              v173 = v169;
              v174 = v170;
              v175 = v171;
              v176 = v172;
              if (!v168)
              {
                v251.origin.x = v160;
                v251.origin.y = v161;
                v251.size.width = v165;
                v251.size.height = v164;
                *(CGRect *)&v169 = CGRectUnion(v251, *(CGRect *)&v173);
              }
              v160 = v169;
              v161 = v170;
              v165 = v171;
              v164 = v172;
            }
            v162 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v233, v242, 16);
          }
          while (v162);
        }

        if (v147)
        {
          v178 = objc_getProperty(v147, v177, 16, 1);
          v180 = objc_getProperty(v147, v179, 24, 1);
        }
        else
        {
          v178 = 0;
          v180 = 0;
        }
        v181 = v180;
        -[PKAutorefineDataCollectionViewController makeDrawingForOriginalStrokes:refinedStrokes:contextStrokes:bounds:]((id *)&self->super.super.super.isa, v178, 0, v181, v160, v161);
        v182 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKAutorefineDataCollectionViewController makeImageForDrawing:]((uint64_t)self, v182);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        if (v147)
        {
          v185 = objc_getProperty(v147, v183, 8, 1);
          v187 = objc_getProperty(v147, v186, 24, 1);
        }
        else
        {
          v185 = 0;
          v187 = 0;
        }
        v188 = v187;
        -[PKAutorefineDataCollectionViewController makeDrawingForOriginalStrokes:refinedStrokes:contextStrokes:bounds:]((id *)&self->super.super.super.isa, 0, v185, v188, v160, v161);
        v189 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKAutorefineDataCollectionViewController makeImageForDrawing:]((uint64_t)self, v189);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "size");
        v192 = v191;
        objc_msgSend(v190, "size");
        if (v192 < v193)
          v192 = v193;
        objc_msgSend(v184, "size");
        v195 = v194;
        objc_msgSend(v190, "size");
        v249.height = v195 + v196;
        v249.width = v192;
        UIGraphicsBeginImageContextWithOptions(v249, 0, 0.0);
        objc_msgSend(v184, "size");
        objc_msgSend(v184, "drawInRect:", 0.0, 0.0, v192, v197);
        objc_msgSend(v184, "size");
        v199 = v198;
        objc_msgSend(v190, "size");
        objc_msgSend(v190, "drawInRect:", 0.0, v199, v192, v200);
        UIGraphicsGetImageFromCurrentImageContext();
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v202 = objc_opt_new();
        v203 = (id *)v202;
        if (v202)
        {
          objc_storeStrong((id *)(v202 + 32), v147);
          objc_storeStrong(v203 + 3, v201);
          objc_storeStrong(v203 + 1, v182);
          objc_storeStrong(v203 + 2, v189);
        }
        if (self)
          tableDataEntries = self->_tableDataEntries;
        else
          tableDataEntries = 0;
        v205 = tableDataEntries;
        -[NSMutableArray addObject:](v205, "addObject:", v203);

        ++v146;
      }
      while (v146 != v232);
      v206 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v237, v243, 16);
      v232 = v206;
    }
    while (v206);
  }

  -[PKAutorefineDataCollectionViewController updateTableViewHeight]((uint64_t)self);
}

- (id)makeDrawingForOriginalStrokes:(void *)a3 refinedStrokes:(void *)a4 contextStrokes:(double)a5 bounds:(double)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGAffineTransform v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGAffineTransform v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (a1)
  {
    if (objc_msgSend(a1[121], "count"))
    {
      v44 = v13;
      objc_msgSend(a1[121], "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id *)objc_alloc_init((Class)objc_opt_class());
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      v16 = -a5;
      v17 = -a6;
      if (v15)
      {
        v18 = v15;
        v19 = *(_QWORD *)v67;
        v48 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v51 = *MEMORY[0x1E0C9BAA8];
        v45 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v67 != v19)
              objc_enumerationMutation(v14);
            v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v20), "copyForMutation", v41);
            *(_OWORD *)&v64.a = v51;
            *(_OWORD *)&v64.c = v48;
            *(_OWORD *)&v64.tx = v45;
            CGAffineTransformTranslate(&v65, &v64, v16, v17);
            objc_msgSend(v21, "_applyTransform:", &v65);
            objc_msgSend(a1, "addNewStroke:", v21);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
        }
        while (v18);
      }
      v43 = v11;

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v42 = v12;
      v22 = v12;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v61;
        v49 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v52 = *MEMORY[0x1E0C9BAA8];
        v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v61 != v25)
              objc_enumerationMutation(v22);
            v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v26), "copyForMutation", v41);
            *(_OWORD *)&v64.a = v52;
            *(_OWORD *)&v64.c = v49;
            *(_OWORD *)&v64.tx = v46;
            CGAffineTransformTranslate(&v59, &v64, v16, v17);
            objc_msgSend(v27, "_applyTransform:", &v59);
            objc_msgSend(v27, "ink");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setInk:", v30);

            objc_msgSend(a1, "addNewStroke:", v27);
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        }
        while (v24);
      }

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v31 = v44;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v56;
        v50 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v53 = *MEMORY[0x1E0C9BAA8];
        v47 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        do
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v56 != v34)
              objc_enumerationMutation(v31);
            v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v35), "copyForMutation", v41);
            *(_OWORD *)&v64.a = v53;
            *(_OWORD *)&v64.c = v50;
            *(_OWORD *)&v64.tx = v47;
            CGAffineTransformTranslate(&v54, &v64, v16, v17);
            objc_msgSend(v36, "_applyTransform:", &v54);
            objc_msgSend(v36, "ink");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setInk:", v39);

            objc_msgSend(a1, "addNewStroke:", v36);
            ++v35;
          }
          while (v33 != v35);
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
        }
        while (v33);
      }

      v12 = v42;
      v11 = v43;
      v13 = v44;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)makeImageForDrawing:(uint64_t)a1
{
  id v3;
  dispatch_semaphore_t v4;
  double v5;
  double v6;
  double v7;
  double MaxY;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  PKImageRenderer *v16;
  void *v17;
  double v18;
  PKImageRenderer *v19;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  CGRect v32;

  v3 = a2;
  if (a1)
  {
    v4 = dispatch_semaphore_create(0);
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__33;
    v30 = __Block_byref_object_dispose__33;
    v31 = 0;
    objc_msgSend(v3, "_canvasBounds");
    v7 = v6;
    MaxY = v5;
    if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(v3, "bounds");
      MaxY = CGRectGetMaxY(v32);
      v7 = 768.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;

    if (v12 < v7)
      v7 = v12;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;

    if (v15 < MaxY)
      MaxY = v15;
    v16 = [PKImageRenderer alloc];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = -[PKImageRenderer initWithSize:scale:](v16, "initWithSize:scale:", v7, MaxY, v18);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __64__PKAutorefineDataCollectionViewController_makeImageForDrawing___block_invoke;
    v23[3] = &unk_1E7779240;
    v25 = &v26;
    v20 = v4;
    v24 = v20;
    -[PKImageRenderer renderDrawing:completion:](v19, "renderDrawing:completion:", v3, v23);
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    v21 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (uint64_t)updateTableViewHeight
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = *(id *)(result + 976);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      v6 = 0.0;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
          if (v8)
            v9 = *(void **)(v8 + 24);
          else
            v9 = 0;
          objc_msgSend(v9, "size", (_QWORD)v12);
          v6 = v6 + v10 + 40.0 + 20.0;
          ++v7;
        }
        while (v4 != v7);
        v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v4 = v11;
      }
      while (v11);
    }
    else
    {
      v6 = 0.0;
    }

    return objc_msgSend(*(id *)(v1 + 1008), "setConstant:", v6);
  }
  return result;
}

- (id)makeDrawingForStrokes:(id *)a1
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    v11 = v7;
    v12 = v6;
    v13 = v5;
    v14 = v4;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v3);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v34.origin.x = v14;
        v34.origin.y = v13;
        v34.size.width = v12;
        v34.size.height = v11;
        v36.origin.x = v4;
        v36.origin.y = v5;
        v36.size.width = v6;
        v36.size.height = v7;
        v17 = CGRectEqualToRect(v34, v36);
        objc_msgSend(v16, "renderBounds");
        v22 = v18;
        v23 = v19;
        v24 = v20;
        v25 = v21;
        if (!v17)
        {
          v35.origin.x = v14;
          v35.origin.y = v13;
          v35.size.width = v12;
          v35.size.height = v11;
          *(CGRect *)&v18 = CGRectUnion(v35, *(CGRect *)&v22);
        }
        v14 = v18;
        v13 = v19;
        v12 = v20;
        v11 = v21;
      }
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }
  else
  {
    v13 = v5;
    v14 = v4;
  }
  -[PKAutorefineDataCollectionViewController makeDrawingForOriginalStrokes:refinedStrokes:contextStrokes:bounds:](a1, v3, 0, 0, v14, v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __64__PKAutorefineDataCollectionViewController_makeImageForDrawing___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)saveDrawing:(void *)a1 toBaseURL:(void *)a2 withName:(void *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(a1, "serializeWithVersion:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "writeToURL:atomically:", v8, 1);
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self)
    self = (PKAutorefineDataCollectionViewController *)self->_tableDataEntries;
  return -[PKAutorefineDataCollectionViewController count](self, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *tableDataEntries;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ImageCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v7, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (void *)objc_msgSend(v10, "initWithFrame:");

  objc_msgSend(v12, "setAutoresizingMask:", 18);
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 15.0);

  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMasksToBounds:", 1);

  objc_msgSend(v12, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBorderWidth:", 0.8);

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "CGColor");
  objc_msgSend(v12, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderColor:", v17);

  if (self)
    tableDataEntries = self->_tableDataEntries;
  else
    tableDataEntries = 0;
  v20 = tableDataEntries;
  v21 = objc_msgSend(v6, "row");

  -[NSMutableArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;

  v25 = v24;
  objc_msgSend(v25, "size");
  v27 = v26;
  objc_msgSend(v7, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29 + -40.0;

  objc_msgSend(v7, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = (v32 - v30) * 0.5;

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v25);
  objc_msgSend(v34, "setContentMode:", 1);
  objc_msgSend(v34, "setFrame:", v33, 20.0, v30, v27);
  objc_msgSend(v12, "addSubview:", v34);
  objc_msgSend(v7, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v36);

  v37 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v7, "bounds");
  v38 = (void *)objc_msgSend(v37, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "colorWithAlphaComponent:", 0.4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundColor:", v40);

  objc_msgSend(v38, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setCornerRadius:", 15.0);

  objc_msgSend(v38, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setMasksToBounds:", 1);

  objc_msgSend(v7, "setSelectedBackgroundView:", v38);
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSMutableArray *tableDataEntries;
  NSMutableArray *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;

  if (self)
    tableDataEntries = self->_tableDataEntries;
  else
    tableDataEntries = 0;
  v6 = tableDataEntries;
  -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", objc_msgSend(a4, "row"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 24);
  else
    v9 = 0;

  v10 = v9;
  objc_msgSend(v10, "size");
  v12 = v11;

  return v12 + 40.0 + 20.0;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAutorefineDataCollectionViewController;
  -[PKAutorefineDataCollectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PKAutorefineDataCollectionViewController updateTableViewHeight]((uint64_t)self);
}

- (void)submitFeedback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id Property;
  id v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  void *v31;
  const char *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIImage *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  const char *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSMutableArray *v63;
  PKAutorefineDataCollectionViewController *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "URLByAppendingPathComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v70 = 0;
  LOBYTE(v7) = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v70);
  v10 = v70;
  v11 = v10;
  if ((v7 & 1) != 0)
  {
    v69 = v8;
    v60 = v8;
    v61 = v4;
    v58 = v11;
    v59 = v9;
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v13 = (NSMutableArray *)objc_opt_new();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v73;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v73 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v18);
              v20 = self->_tableDataEntries;
              -[NSMutableArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSMutableArray addObject:](v13, "addObject:", v21);
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
          }
          while (v16);
        }

      }
      else
      {
        v13 = self->_tableDataEntries;
      }

      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v65)
      {
        v66 = 0;
        v62 = *(_QWORD *)v73;
        v63 = v13;
        v64 = self;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v73 != v62)
              objc_enumerationMutation(v13);
            v24 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v23);
            if (v24)
            {
              Property = *(id *)(v24 + 32);
              if (Property)
                Property = objc_getProperty(Property, v22, 16, 1);
            }
            else
            {
              Property = 0;
            }
            v26 = Property;
            -[PKAutorefineDataCollectionViewController makeDrawingForStrokes:]((id *)&self->super.super.super.isa, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v29 = *(id *)(v24 + 32);
              if (v29)
                v29 = objc_getProperty(v29, v28, 8, 1);
            }
            else
            {
              v29 = 0;
            }
            v30 = v29;
            -[PKAutorefineDataCollectionViewController makeDrawingForStrokes:]((id *)&self->super.super.super.isa, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v33 = *(id *)(v24 + 32);
              if (v33)
                v33 = objc_getProperty(v33, v32, 24, 1);
            }
            else
            {
              v33 = 0;
            }
            v34 = v66 + v23;
            v35 = v33;
            -[PKAutorefineDataCollectionViewController makeDrawingForStrokes:]((id *)&self->super.super.super.isa, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/drawing_%ld_original.drawing"), v66 + v23);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v27;
            -[PKAutorefineDataCollectionViewController saveDrawing:toBaseURL:withName:](v27, v69, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v38);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/drawing_%ld_refined.drawing"), v66 + v23);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAutorefineDataCollectionViewController saveDrawing:toBaseURL:withName:](v31, v69, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v40);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/drawing_%ld_context.drawing"), v66 + v23);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAutorefineDataCollectionViewController saveDrawing:toBaseURL:withName:](v36, v69, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v42);

            if (v24)
              v43 = *(UIImage **)(v24 + 24);
            else
              v43 = 0;
            UIImagePNGRepresentation(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/image_%ld.png"), v34);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "URLByAppendingPathComponent:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "writeToURL:atomically:", v46, 1);
            objc_msgSend(v68, "addObject:", v46);
            v47 = (void *)MEMORY[0x1E0CB36D8];
            if (v24)
            {
              v48 = *(id *)(v24 + 32);
              v50 = v48;
              if (v48)
                v48 = objc_getProperty(v48, v49, 32, 1);
            }
            else
            {
              v50 = 0;
              v48 = 0;
            }
            v51 = v48;
            v71 = 0;
            objc_msgSend(v47, "dataWithJSONObject:options:error:", v51, 0, &v71);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v71;

            if (!v52)
              NSLog(CFSTR("Error saving debug_info %@"), v53);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("debug_info_%ld.json"), v34);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "URLByAppendingPathComponent:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v52, "writeToURL:atomically:", v55, 1);
            objc_msgSend(v68, "addObject:", v55);

            ++v23;
            self = v64;
            v13 = v63;
          }
          while (v65 != v23);
          v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
          v65 = v56;
          v66 += v23;
        }
        while (v56);
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v68);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v57 = 0;
    }

    +[PKHandwritingDebugUtility submitFeedbackWithAttachments:title:](PKHandwritingDebugUtility, "submitFeedbackWithAttachments:title:", v57, CFSTR("Autorefine Feedback: "));
    v8 = v60;
    v4 = v61;
    v11 = v58;
    v9 = v59;
  }
  else
  {
    NSLog(CFSTR("ERROR: %@"), v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tableDataEntries, 0);
  objc_storeStrong((id *)&self->_allDrawings, 0);
}

@end
