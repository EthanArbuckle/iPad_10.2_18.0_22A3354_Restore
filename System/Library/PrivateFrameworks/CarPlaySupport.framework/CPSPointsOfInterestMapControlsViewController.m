@implementation CPSPointsOfInterestMapControlsViewController

- (CPSPointsOfInterestMapControlsViewController)initWithMapDelegate:(id)a3
{
  CPSPointsOfInterestMapControlsViewController *v3;
  CPSPointsOfInterestMapControlsViewController *v5;
  objc_super v6;
  id location[2];
  CPSPointsOfInterestMapControlsViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CPSPointsOfInterestMapControlsViewController;
  v8 = -[CPSPointsOfInterestMapControlsViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeWeak((id *)&v8->_mapDelegate, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSPointsOfInterestMapControlsViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestMapControlsViewController;
  -[CPSPointsOfInterestMapControlsViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSPointsOfInterestMapControlsViewController setupViews](v4, "setupViews");
}

- (void)setupViews
{
  id v2;
  CPSEntityMapButton *v3;
  CPSEntityMapButton *v4;
  CPSEntityMapButton *v5;
  CPSEntityMapButton *v6;
  id v7;
  id v8;
  CPSEntityMapButton *v9;
  id v10;
  CPSEntityMapButton *v11;
  CPSEntityMapButton *v12;
  CPSEntityMapButton *v13;
  CPSEntityMapButton *v14;
  id v15;
  id v16;
  CPSEntityMapButton *v17;
  id v18;
  CPSEntityMapButton *v19;
  CPSEntityMapButton *v20;
  CPSEntityMapButton *v21;
  CPSEntityMapButton *v22;
  id v23;
  id v24;
  CPSEntityMapButton *v25;
  id v26;
  CPSEntityMapButton *v27;
  CPSEntityMapButton *v28;
  CPSEntityMapButton *v29;
  id v30;
  id v31;
  CPSEntityMapButton *v32;
  CPSEntityMapButton *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  CPSEntityMapButton *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  CPSEntityMapButton *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  CPSEntityMapButton *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  CPSEntityMapButton *v57;
  id v58;
  id v59;
  CPSEntityMapButton *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  CPSEntityMapButton *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  CPSEntityMapButton *v72;
  id v73;
  id v74;
  CPSEntityMapButton *v75;
  id v76;
  CPSEntityMapButton *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  CPSEntityMapButton *v82;
  id v83;
  id v84;
  id v85;
  CPSEntityMapButton *v86;
  id v87;
  id v88;
  id v89;
  CPSEntityMapButton *v90;
  id v91;
  id v92;
  id v93;
  CPSEntityMapButton *v94;
  id v95;
  id v96;
  id v97;
  CPSEntityMapButton *v98;
  id v99;
  CPSEntityMapButton *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  CPSEntityMapButton *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  CPSEntityMapButton *v112;
  id v113;
  id v114;
  CPSEntityMapButton *v115;
  id v116;
  CPSEntityMapButton *v117;
  id v118;
  id v119;
  CPSEntityMapButton *v120;
  id v121;
  CPSEntityMapButton *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  CPSEntityMapButton *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  CPSEntityMapButton *v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  CPSEntityMapButton *v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146[2];
  CPSPointsOfInterestMapControlsViewController *v147;
  _QWORD v148[4];
  _QWORD v149[4];
  _QWORD v150[4];
  _QWORD v151[4];
  _QWORD v152[4];
  id v153;
  id v154;
  id v155;
  _QWORD v156[2];

  v156[1] = *MEMORY[0x24BDAC8D0];
  v147 = self;
  v146[1] = (id)a2;
  v3 = +[CPSEntityMapButton buttonWithEntityMapButtonType:](CPSEntityMapButton, "buttonWithEntityMapButtonType:", 3);
  -[CPSPointsOfInterestMapControlsViewController setPanButton:](v147, "setPanButton:");

  v4 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  -[CPSEntityMapButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  -[CPSButton setDelegate:](v5, "setDelegate:", v147);

  v8 = (id)CPUILocalizedStringForKey();
  v156[0] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156);
  v6 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  -[CPSEntityMapButton setAccessibilityUserInputLabels:](v6, "setAccessibilityUserInputLabels:", v7);

  v10 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v9 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  objc_msgSend(v10, "addSubview:");

  v11 = +[CPSEntityMapButton buttonWithEntityMapButtonType:](CPSEntityMapButton, "buttonWithEntityMapButtonType:", 1);
  -[CPSPointsOfInterestMapControlsViewController setZoomInButton:](v147, "setZoomInButton:");

  v12 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  -[CPSEntityMapButton setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  -[CPSButton setDelegate:](v13, "setDelegate:", v147);

  v16 = (id)CPUILocalizedStringForKey();
  v155 = v16;
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v155, 1);
  v14 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  -[CPSEntityMapButton setAccessibilityUserInputLabels:](v14, "setAccessibilityUserInputLabels:", v15);

  v18 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v17 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  objc_msgSend(v18, "addSubview:");

  v19 = +[CPSEntityMapButton buttonWithEntityMapButtonType:](CPSEntityMapButton, "buttonWithEntityMapButtonType:", 2);
  -[CPSPointsOfInterestMapControlsViewController setZoomOutButton:](v147, "setZoomOutButton:");

  v20 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  -[CPSEntityMapButton setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  -[CPSButton setDelegate:](v21, "setDelegate:", v147);

  v24 = (id)CPUILocalizedStringForKey();
  v154 = v24;
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v154, 1);
  v22 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  -[CPSEntityMapButton setAccessibilityUserInputLabels:](v22, "setAccessibilityUserInputLabels:", v23);

  v26 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v25 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  objc_msgSend(v26, "addSubview:");

  v27 = +[CPSEntityMapButton buttonWithEntityMapButtonType:](CPSEntityMapButton, "buttonWithEntityMapButtonType:");
  -[CPSPointsOfInterestMapControlsViewController setCenterButton:](v147, "setCenterButton:");

  v28 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  -[CPSEntityMapButton setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v31 = (id)CPUILocalizedStringForKey();
  v153 = v31;
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v153, 1);
  v29 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  -[CPSEntityMapButton setAccessibilityUserInputLabels:](v29, "setAccessibilityUserInputLabels:", v30);

  v32 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  -[CPSButton setDelegate:](v32, "setDelegate:", v147);

  v34 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v33 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  objc_msgSend(v34, "addSubview:");

  v2 = objc_alloc(MEMORY[0x24BDF6F90]);
  v146[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v146[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
  objc_msgSend(v146[0], "setBackgroundColor:");

  v36 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  objc_msgSend(v36, "addSubview:", v146[0]);

  v145 = (id)objc_opt_new();
  v57 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v56 = (id)-[CPSEntityMapButton bottomAnchor](v57, "bottomAnchor");
  v55 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v54 = (id)objc_msgSend(v55, "safeAreaLayoutGuide");
  v53 = (id)objc_msgSend(v54, "bottomAnchor");
  v52 = (id)objc_msgSend(v56, "constraintEqualToAnchor:");
  v152[0] = v52;
  v51 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v50 = (id)-[CPSEntityMapButton leadingAnchor](v51, "leadingAnchor");
  v49 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v48 = (id)objc_msgSend(v49, "safeAreaLayoutGuide");
  v47 = (id)objc_msgSend(v48, "leadingAnchor");
  v46 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v152[1] = v46;
  v45 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v44 = (id)-[CPSEntityMapButton trailingAnchor](v45, "trailingAnchor");
  v43 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v42 = (id)objc_msgSend(v43, "safeAreaLayoutGuide");
  v41 = (id)objc_msgSend(v42, "trailingAnchor");
  v40 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
  v152[2] = v40;
  v39 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v38 = (id)-[CPSEntityMapButton heightAnchor](v39, "heightAnchor");
  v37 = (id)objc_msgSend(v38, "constraintEqualToConstant:");
  v152[3] = v37;
  v144 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 4);

  v77 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  v76 = (id)-[CPSEntityMapButton bottomAnchor](v77, "bottomAnchor");
  v75 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v74 = (id)-[CPSEntityMapButton topAnchor](v75, "topAnchor");
  v73 = (id)objc_msgSend(v76, "constraintEqualToAnchor:");
  v151[0] = v73;
  v72 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  v71 = (id)-[CPSEntityMapButton leadingAnchor](v72, "leadingAnchor");
  v70 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v69 = (id)objc_msgSend(v70, "safeAreaLayoutGuide");
  v68 = (id)objc_msgSend(v69, "leadingAnchor");
  v67 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
  v151[1] = v67;
  v66 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  v65 = (id)-[CPSEntityMapButton trailingAnchor](v66, "trailingAnchor");
  v64 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v63 = (id)objc_msgSend(v64, "safeAreaLayoutGuide");
  v62 = (id)objc_msgSend(v63, "trailingAnchor");
  v61 = (id)objc_msgSend(v65, "constraintEqualToAnchor:");
  v151[2] = v61;
  v60 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  v59 = (id)-[CPSEntityMapButton heightAnchor](v60, "heightAnchor");
  v58 = (id)objc_msgSend(v59, "constraintEqualToConstant:", 34.5);
  v151[3] = v58;
  v143 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v151, 4);

  v78 = v145;
  v95 = (id)objc_msgSend(v146[0], "leftAnchor");
  v94 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v93 = (id)-[CPSEntityMapButton leftAnchor](v94, "leftAnchor");
  v92 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
  v150[0] = v92;
  v91 = (id)objc_msgSend(v146[0], "rightAnchor");
  v90 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v89 = (id)-[CPSEntityMapButton rightAnchor](v90, "rightAnchor");
  v88 = (id)objc_msgSend(v91, "constraintEqualToAnchor:");
  v150[1] = v88;
  v87 = (id)objc_msgSend(v146[0], "topAnchor");
  v86 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  v85 = (id)-[CPSEntityMapButton bottomAnchor](v86, "bottomAnchor");
  v84 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", -0.5);
  v150[2] = v84;
  v83 = (id)objc_msgSend(v146[0], "bottomAnchor");
  v82 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v147, "zoomOutButton");
  v81 = (id)-[CPSEntityMapButton topAnchor](v82, "topAnchor");
  v80 = (id)objc_msgSend(v83, "constraintEqualToAnchor:constant:", 0.5);
  v150[3] = v80;
  v79 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 4);
  objc_msgSend(v78, "addObjectsFromArray:");

  v117 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  v116 = (id)-[CPSEntityMapButton bottomAnchor](v117, "bottomAnchor");
  v115 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v147, "zoomInButton");
  v114 = (id)-[CPSEntityMapButton topAnchor](v115, "topAnchor");
  v113 = (id)objc_msgSend(v116, "constraintEqualToAnchor:constant:", -1.0);
  v149[0] = v113;
  v112 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  v111 = (id)-[CPSEntityMapButton leadingAnchor](v112, "leadingAnchor");
  v110 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v109 = (id)objc_msgSend(v110, "safeAreaLayoutGuide");
  v108 = (id)objc_msgSend(v109, "leadingAnchor");
  v107 = (id)objc_msgSend(v111, "constraintEqualToAnchor:");
  v149[1] = v107;
  v106 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  v105 = (id)-[CPSEntityMapButton trailingAnchor](v106, "trailingAnchor");
  v104 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v103 = (id)objc_msgSend(v104, "safeAreaLayoutGuide");
  v102 = (id)objc_msgSend(v103, "trailingAnchor");
  v101 = (id)objc_msgSend(v105, "constraintEqualToAnchor:");
  v149[2] = v101;
  v100 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  v99 = (id)-[CPSEntityMapButton heightAnchor](v100, "heightAnchor");
  v98 = -[CPSPointsOfInterestMapControlsViewController panButton](v147, "panButton");
  v97 = (id)-[CPSEntityMapButton widthAnchor](v98, "widthAnchor");
  v96 = (id)objc_msgSend(v99, "constraintEqualToAnchor:");
  v149[3] = v96;
  v142 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v149, 4);

  v140 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  v139 = (id)-[CPSEntityMapButton topAnchor](v140, "topAnchor");
  v138 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v137 = (id)objc_msgSend(v138, "safeAreaLayoutGuide");
  v136 = (id)objc_msgSend(v137, "topAnchor");
  v135 = (id)objc_msgSend(v139, "constraintEqualToAnchor:");
  v148[0] = v135;
  v134 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  v133 = (id)-[CPSEntityMapButton trailingAnchor](v134, "trailingAnchor");
  v132 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v131 = (id)objc_msgSend(v132, "safeAreaLayoutGuide");
  v130 = (id)objc_msgSend(v131, "trailingAnchor");
  v129 = (id)objc_msgSend(v133, "constraintEqualToAnchor:");
  v148[1] = v129;
  v128 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  v127 = (id)-[CPSEntityMapButton leadingAnchor](v128, "leadingAnchor");
  v126 = (id)-[CPSPointsOfInterestMapControlsViewController view](v147, "view");
  v125 = (id)objc_msgSend(v126, "safeAreaLayoutGuide");
  v124 = (id)objc_msgSend(v125, "leadingAnchor");
  v123 = (id)objc_msgSend(v127, "constraintEqualToAnchor:");
  v148[2] = v123;
  v122 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  v121 = (id)-[CPSEntityMapButton heightAnchor](v122, "heightAnchor");
  v120 = -[CPSPointsOfInterestMapControlsViewController centerButton](v147, "centerButton");
  v119 = (id)-[CPSEntityMapButton widthAnchor](v120, "widthAnchor");
  v118 = (id)objc_msgSend(v121, "constraintEqualToAnchor:multiplier:", 1.0);
  v148[3] = v118;
  v141 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v148, 4);

  objc_msgSend(v145, "addObjectsFromArray:", v144);
  objc_msgSend(v145, "addObjectsFromArray:", v143);
  objc_msgSend(v145, "addObjectsFromArray:", v142);
  objc_msgSend(v145, "addObjectsFromArray:", v141);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v145);
  objc_storeStrong(&v141, 0);
  objc_storeStrong(&v142, 0);
  objc_storeStrong(&v143, 0);
  objc_storeStrong(&v144, 0);
  objc_storeStrong(&v145, 0);
  objc_storeStrong(v146, 0);
}

- (void)zoomInPressed:(id)a3
{
  CPSPointsOfInterestMapDelegate *v3;
  CPSPointsOfInterestMapDelegate *v4;
  char v5;
  id location[2];
  CPSPointsOfInterestMapControlsViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v7, "mapDelegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v7, "mapDelegate");
    -[CPSPointsOfInterestMapDelegate zoomIn](v3, "zoomIn");

  }
  objc_storeStrong(location, 0);
}

- (void)zoomOutPressed:(id)a3
{
  CPSPointsOfInterestMapDelegate *v3;
  CPSPointsOfInterestMapDelegate *v4;
  char v5;
  id location[2];
  CPSPointsOfInterestMapControlsViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v7, "mapDelegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v7, "mapDelegate");
    -[CPSPointsOfInterestMapDelegate zoomOut](v3, "zoomOut");

  }
  objc_storeStrong(location, 0);
}

- (void)panPressed:(id)a3
{
  CPSPointsOfInterestMapDelegate *v3;
  CPSEntityMapButton *v4;
  CPSPointsOfInterestMapDelegate *v5;
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CPSPointsOfInterestMapControlsViewController *v12;
  id location[2];
  CPSPointsOfInterestMapControlsViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v14, "mapDelegate");
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v3 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v14, "mapDelegate");
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __59__CPSPointsOfInterestMapControlsViewController_panPressed___block_invoke;
    v11 = &unk_24E26F1B8;
    v12 = v14;
    -[CPSPointsOfInterestMapDelegate beginPanningWithCompletion:](v3, "beginPanningWithCompletion:", &v7);

    v4 = -[CPSPointsOfInterestMapControlsViewController panButton](v14, "panButton");
    -[CPSEntityMapButton setAlpha:](v4, "setAlpha:", 0.0);

    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(location, 0);
}

void __59__CPSPointsOfInterestMapControlsViewController_panPressed___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "panButton");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)centerPressed:(id)a3
{
  CPSPointsOfInterestMapDelegate *v3;
  CPSPointsOfInterestMapDelegate *v4;
  char v5;
  id location[2];
  CPSPointsOfInterestMapControlsViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v7, "mapDelegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSPointsOfInterestMapControlsViewController mapDelegate](v7, "mapDelegate");
    -[CPSPointsOfInterestMapDelegate centerMap](v3, "centerMap");

  }
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  CPSEntityMapButton *v3;
  CPSEntityMapButton *v4;
  CPSEntityMapButton *v5;
  CPSEntityMapButton *v6;
  CPSEntityMapButton *v7;
  BOOL v8;
  CPSEntityMapButton *v9;
  BOOL v10;
  CPSEntityMapButton *v11;
  BOOL v12;
  CPSEntityMapButton *v13;
  BOOL v14;
  id location[2];
  CPSPointsOfInterestMapControlsViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (CPSEntityMapButton *)location[0];
  v3 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v16, "zoomInButton");
  v14 = v13 != v3;

  if (v14)
  {
    v11 = (CPSEntityMapButton *)location[0];
    v4 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v16, "zoomOutButton");
    v12 = v11 != v4;

    if (v12)
    {
      v9 = (CPSEntityMapButton *)location[0];
      v5 = -[CPSPointsOfInterestMapControlsViewController panButton](v16, "panButton");
      v10 = v9 != v5;

      if (v10)
      {
        v7 = (CPSEntityMapButton *)location[0];
        v6 = -[CPSPointsOfInterestMapControlsViewController centerButton](v16, "centerButton");
        v8 = v7 != v6;

        if (!v8)
          -[CPSPointsOfInterestMapControlsViewController centerPressed:](v16, "centerPressed:", location[0]);
      }
      else
      {
        -[CPSPointsOfInterestMapControlsViewController panPressed:](v16, "panPressed:", location[0]);
      }
    }
    else
    {
      -[CPSPointsOfInterestMapControlsViewController zoomOutPressed:](v16, "zoomOutPressed:", location[0]);
    }
  }
  else
  {
    -[CPSPointsOfInterestMapControlsViewController zoomInPressed:](v16, "zoomInPressed:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (id)_linearFocusItems
{
  double v2;
  id v4;
  CPSEntityMapButton *v5;
  CPSEntityMapButton *v6;
  CPSEntityMapButton *v7;
  CPSEntityMapButton *v8;
  CPSEntityMapButton *v9;
  CPSEntityMapButton *v10;
  BOOL v11;
  id v12[2];
  CPSPointsOfInterestMapControlsViewController *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = -[CPSPointsOfInterestMapControlsViewController panButton](v13, "panButton");
  -[CPSEntityMapButton alpha](v10, "alpha");
  v11 = v2 != 1.0;

  if (!v11)
  {
    v9 = -[CPSPointsOfInterestMapControlsViewController panButton](v13, "panButton");
    objc_msgSend(v12[0], "addObject:");

  }
  v8 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v13, "zoomInButton");

  if (v8)
  {
    v7 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v13, "zoomInButton");
    objc_msgSend(v12[0], "addObject:");

  }
  v6 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v13, "zoomOutButton");

  if (v6)
  {
    v5 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v13, "zoomOutButton");
    objc_msgSend(v12[0], "addObject:");

  }
  v4 = v12[0];
  objc_storeStrong(v12, 0);
  return v4;
}

- (CPSPointsOfInterestMapDelegate)mapDelegate
{
  return (CPSPointsOfInterestMapDelegate *)objc_loadWeakRetained((id *)&self->_mapDelegate);
}

- (void)setMapDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapDelegate, a3);
}

- (CPSEntityMapButton)zoomInButton
{
  return self->_zoomInButton;
}

- (void)setZoomInButton:(id)a3
{
  objc_storeStrong((id *)&self->_zoomInButton, a3);
}

- (CPSEntityMapButton)zoomOutButton
{
  return self->_zoomOutButton;
}

- (void)setZoomOutButton:(id)a3
{
  objc_storeStrong((id *)&self->_zoomOutButton, a3);
}

- (CPSEntityMapButton)panButton
{
  return self->_panButton;
}

- (void)setPanButton:(id)a3
{
  objc_storeStrong((id *)&self->_panButton, a3);
}

- (CPSEntityMapButton)centerButton
{
  return self->_centerButton;
}

- (void)setCenterButton:(id)a3
{
  objc_storeStrong((id *)&self->_centerButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_panButton, 0);
  objc_storeStrong((id *)&self->_zoomOutButton, 0);
  objc_storeStrong((id *)&self->_zoomInButton, 0);
  objc_destroyWeak((id *)&self->_mapDelegate);
}

@end
