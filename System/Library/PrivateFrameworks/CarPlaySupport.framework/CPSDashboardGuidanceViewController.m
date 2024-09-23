@implementation CPSDashboardGuidanceViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
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
  CPSDashboardGuidanceViewController *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;
  SEL v28;
  CPSDashboardGuidanceViewController *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29 = self;
  v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)CPSDashboardGuidanceViewController;
  -[CPSDashboardGuidanceViewController viewDidLoad](&v27, sel_viewDidLoad);
  v26 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v2 = (id)-[CPSDashboardGuidanceViewController view](v29, "view");
  objc_msgSend(v2, "addSubview:", v26);

  objc_storeStrong((id *)&v29->_shortcutButtonsContainerView, v26);
  v5 = (id)objc_msgSend(v26, "leadingAnchor");
  v4 = (id)-[CPSDashboardGuidanceViewController view](v29, "view");
  v3 = (id)objc_msgSend(v4, "leadingAnchor");
  v25 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");

  objc_storeStrong((id *)&v29->_shortcutButtonsContainerViewLeadingConstraint, v25);
  v8 = (id)objc_msgSend(v26, "trailingAnchor");
  v7 = (id)-[CPSDashboardGuidanceViewController view](v29, "view");
  v6 = (id)objc_msgSend(v7, "trailingAnchor");
  v24 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");

  objc_storeStrong((id *)&v29->_shortcutButtonsContainerViewTrailingConstraint, v24);
  v9 = (void *)MEMORY[0x24BDD1628];
  v18 = (id)-[CPSDashboardGuidanceViewController view](v29, "view");
  v17 = (id)objc_msgSend(v18, "topAnchor");
  v16 = (id)objc_msgSend(v26, "topAnchor");
  v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v30[0] = v15;
  v14 = (id)-[CPSDashboardGuidanceViewController view](v29, "view");
  v13 = (id)objc_msgSend(v14, "bottomAnchor");
  v12 = (id)objc_msgSend(v26, "bottomAnchor");
  v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v30[1] = v11;
  v30[2] = v29->_shortcutButtonsContainerViewLeadingConstraint;
  v30[3] = v29->_shortcutButtonsContainerViewTrailingConstraint;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  objc_msgSend(v9, "activateConstraints:");

  v23 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = v29;
  v20 = *MEMORY[0x24BE153F8];
  v22 = (id)-[CPSDashboardGuidanceViewController view](v29, "view");
  v21 = (id)objc_msgSend(v22, "window");
  objc_msgSend(v23, "addObserver:selector:name:object:", v19, sel__focusHighlightColorChanged_, v20);

  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
}

- (void)setShortCutButtons:(id)a3
{
  id v3;
  id v4;
  NSArray *v5;
  id v6;
  int v7;
  UIView *v8;
  NSArray *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSArray *v14;
  void *v15;
  NSArray *v16;
  id v17;
  id v18;
  NSLayoutXAxisAnchor *v19;
  UIView *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSLayoutXAxisAnchor *v28;
  UIView *v29;
  id v30;
  id v31;
  id v32;
  UIView *v33;
  UIView *v34;
  unint64_t v35;
  NSArray *v36;
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
  void *v50;
  id v51;
  CPSDashboardItemView *v52;
  NSArray *v53;
  BOOL v54;
  NSArray *v55;
  UIView *v56;
  BOOL v57;
  id v58;
  os_log_t oslog;
  char v60;
  id v61;
  uint64_t v62;
  int v63;
  int v64;
  void (*v65)(id *, void *);
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  int v70;
  int v71;
  void (*v72)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  int v78;
  int v79;
  char v80;
  uint64_t v81;
  uint64_t *v82;
  int v83;
  int v84;
  char v85;
  id v86;
  uint64_t v87;
  int v88;
  int v89;
  void (*v90)(uint64_t, void *, uint64_t, void *);
  void *v91;
  CPSDashboardGuidanceViewController *v92;
  id v93;
  id v94;
  id v95;
  id v96[3];
  uint64_t v97;
  uint64_t *v98;
  int v99;
  int v100;
  void (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  uint64_t *v105;
  int v106;
  int v107;
  void (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  NSLayoutXAxisAnchor *v110;
  id v111;
  id v112;
  id v113;
  unint64_t i;
  id v115;
  uint64_t v116;
  int v117;
  int v118;
  void (*v119)(id *, void *);
  void *v120;
  CPSDashboardGuidanceViewController *v121;
  id v122;
  id v123[3];
  id v124;
  BOOL v125;
  char v126;
  id location[2];
  CPSDashboardGuidanceViewController *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint8_t v133[24];
  _QWORD v134[4];
  _QWORD v135[5];

  v135[4] = *MEMORY[0x24BDAC8D0];
  v128 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = (id)-[CPSDashboardGuidanceViewController view](v128, "view");
  objc_msgSend(v58, "layoutIfNeeded");

  v126 = 0;
  v56 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
  v57 = -[UIView isHidden](v56, "isHidden");

  v125 = v57;
  v55 = -[CPSDashboardGuidanceViewController dashboardButtons](v128, "dashboardButtons");
  v54 = 0;
  if (-[NSArray count](v55, "count"))
    v54 = !v125;

  if (v54)
  {
    v126 = 1;
    -[CPSDashboardGuidanceViewController _animateShortcutContainerViewOut](v128, "_animateShortcutContainerViewOut");
  }
  v124 = (id)objc_opt_new();
  v53 = -[CPSDashboardGuidanceViewController dashboardButtons](v128, "dashboardButtons");
  -[NSArray enumerateObjectsUsingBlock:](v53, "enumerateObjectsUsingBlock:", &__block_literal_global);

  if ((unint64_t)objc_msgSend(location[0], "count") > 2)
  {
    v130 = 0;
    v129 = 2;
    v131 = 0;
    v132 = 2;
    v123[1] = 0;
    v123[2] = (id)2;
    v3 = (id)objc_msgSend(location[0], "subarrayWithRange:", 0, 2);
    v4 = location[0];
    location[0] = v3;

  }
  if (objc_msgSend(location[0], "count") == 1)
  {
    v52 = [CPSDashboardItemView alloc];
    v51 = (id)objc_msgSend(location[0], "firstObject");
    v123[0] = -[CPSDashboardItemView initWithDashboardButton:layoutAxis:](v52, "initWithDashboardButton:layoutAxis:");

    objc_msgSend(v123[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v123[0], "setDelegate:", v128);
    objc_msgSend(v124, "addObject:", v123[0]);
    v122 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
    objc_msgSend(v122, "addSubview:", v123[0]);
    v50 = (void *)MEMORY[0x24BDD1628];
    v49 = (id)objc_msgSend(v123[0], "centerYAnchor");
    v48 = (id)objc_msgSend(v122, "centerYAnchor");
    v47 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v135[0] = v47;
    v46 = (id)objc_msgSend(v123[0], "leadingAnchor");
    v45 = (id)objc_msgSend(v122, "leadingAnchor");
    v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:constant:", 8.0);
    v135[1] = v44;
    v43 = (id)objc_msgSend(v123[0], "trailingAnchor");
    v42 = (id)objc_msgSend(v122, "trailingAnchor");
    v41 = (id)objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:constant:", 8.0);
    v135[2] = v41;
    v40 = (id)objc_msgSend(v123[0], "heightAnchor");
    v39 = (id)objc_msgSend(v122, "heightAnchor");
    v38 = (id)objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", -16.0);
    v135[3] = v38;
    v37 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 4);
    objc_msgSend(v50, "activateConstraints:");

    objc_storeStrong(&v122, 0);
    objc_storeStrong(v123, 0);
  }
  else
  {
    v36 = -[CPSDashboardGuidanceViewController spacingGuides](v128, "spacingGuides");
    v116 = MEMORY[0x24BDAC760];
    v117 = -1073741824;
    v118 = 0;
    v119 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2;
    v120 = &unk_24E26F080;
    v121 = v128;
    -[NSArray enumerateObjectsUsingBlock:](v36, "enumerateObjectsUsingBlock:", &v116);

    v115 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (i = 0; ; ++i)
    {
      v35 = i;
      if (v35 > objc_msgSend(location[0], "count"))
        break;
      v113 = objc_alloc_init(MEMORY[0x24BDF6B78]);
      v34 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
      -[UIView addLayoutGuide:](v34, "addLayoutGuide:", v113);

      objc_msgSend(v115, "addObject:", v113);
      objc_storeStrong(&v113, 0);
    }
    -[CPSDashboardGuidanceViewController setSpacingGuides:](v128, "setSpacingGuides:", v115);
    v112 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v111 = (id)objc_msgSend(v115, "firstObject");
    v104 = 0;
    v105 = &v104;
    v106 = 838860800;
    v107 = 48;
    v108 = __Block_byref_object_copy_;
    v109 = __Block_byref_object_dispose_;
    v33 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
    v110 = -[UIView leadingAnchor](v33, "leadingAnchor");

    v97 = 0;
    v98 = &v97;
    v99 = 838860800;
    v100 = 48;
    v101 = __Block_byref_object_copy_;
    v102 = __Block_byref_object_dispose_;
    v103 = 0;
    v32 = location[0];
    v87 = MEMORY[0x24BDAC760];
    v88 = -1073741824;
    v89 = 0;
    v90 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_23;
    v91 = &unk_24E26F0A8;
    v92 = v128;
    v93 = v124;
    v94 = v115;
    v96[1] = &v97;
    v95 = v112;
    v96[2] = &v104;
    v96[0] = v111;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", &v87);
    v86 = (id)objc_msgSend(v115, "lastObject");
    v31 = v112;
    v30 = (id)objc_msgSend((id)v98[5], "trailingAnchor");
    v29 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
    v28 = -[UIView trailingAnchor](v29, "trailingAnchor");
    v27 = (id)objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:");
    v134[0] = v27;
    v26 = (id)objc_msgSend(v86, "widthAnchor");
    v25 = (id)objc_msgSend(v111, "widthAnchor");
    v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
    v134[1] = v24;
    v23 = (id)objc_msgSend(v86, "leadingAnchor");
    v22 = (id)objc_msgSend(v23, "constraintEqualToAnchor:", v105[5]);
    v134[2] = v22;
    v21 = (id)objc_msgSend(v86, "trailingAnchor");
    v20 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
    v19 = -[UIView trailingAnchor](v20, "trailingAnchor");
    v18 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v134[3] = v18;
    v17 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134, 4);
    objc_msgSend(v31, "addObjectsFromArray:");

    v16 = -[CPSDashboardGuidanceViewController activeConstraints](v128, "activeConstraints");
    if (v16)
    {
      v15 = (void *)MEMORY[0x24BDD1628];
      v14 = -[CPSDashboardGuidanceViewController activeConstraints](v128, "activeConstraints");
      objc_msgSend(v15, "deactivateConstraints:");

    }
    objc_storeStrong((id *)&v128->_activeConstraints, v112);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v112);
    objc_storeStrong(&v86, 0);
    objc_storeStrong(v96, 0);
    objc_storeStrong(&v95, 0);
    objc_storeStrong(&v94, 0);
    objc_storeStrong(&v93, 0);
    objc_storeStrong((id *)&v92, 0);
    _Block_object_dispose(&v97, 8);
    objc_storeStrong(&v103, 0);
    _Block_object_dispose(&v104, 8);
    objc_storeStrong((id *)&v110, 0);
    objc_storeStrong(&v111, 0);
    objc_storeStrong(&v112, 0);
    objc_storeStrong(&v115, 0);
    objc_storeStrong((id *)&v121, 0);
  }
  -[CPSDashboardGuidanceViewController setDashboardButtons:](v128, "setDashboardButtons:", v124);
  v13 = (id)-[CPSDashboardGuidanceViewController view](v128, "view");
  objc_msgSend(v13, "layoutIfNeeded");

  v81 = 0;
  v82 = &v81;
  v83 = 0x20000000;
  v84 = 32;
  v85 = 1;
  v76 = 0;
  v77 = &v76;
  v78 = 0x20000000;
  v79 = 32;
  v80 = 1;
  v69 = MEMORY[0x24BDAC760];
  v70 = -1073741824;
  v71 = 0;
  v72 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2_25;
  v73 = &unk_24E26F0D0;
  v74 = &v81;
  v75 = &v76;
  objc_msgSend(v124, "enumerateObjectsUsingBlock:", &v69);
  if ((v82[3] & 1) != 0 && (v77[3] & 1) == 0)
    objc_msgSend(v124, "enumerateObjectsUsingBlock:", &__block_literal_global_26);
  v12 = (void *)objc_opt_class();
  v11 = (id)-[CPSDashboardGuidanceViewController view](v128, "view");
  v10 = (id)objc_msgSend(v11, "window");
  v68 = CPSSafeCast_0(v12, v10);

  v9 = -[CPSDashboardGuidanceViewController dashboardButtons](v128, "dashboardButtons");
  v62 = MEMORY[0x24BDAC760];
  v63 = -1073741824;
  v64 = 0;
  v65 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_4;
  v66 = &unk_24E26F118;
  v67 = v68;
  -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", &v62);

  v8 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
  -[UIView setHidden:](v8, "setHidden:", v125);

  if ((v126 & 1) != 0)
    -[CPSDashboardGuidanceViewController _animateShortcutContainerViewIn](v128, "_animateShortcutContainerViewIn");
  v60 = 0;
  LOBYTE(v7) = 0;
  if (v68)
  {
    v61 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v128, "shortcutButtonsContainerView");
    v60 = 1;
    v7 = objc_msgSend(v61, "isHidden") ^ 1;
  }
  if ((v60 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    v6 = v68;
    v5 = -[CPSDashboardGuidanceViewController dashboardButtons](v128, "dashboardButtons");
    objc_msgSend(v6, "setFocusableViews:");

  }
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v133, (uint64_t)location[0], (uint64_t)v128);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Set Shortcut Buttons: %@ on view controller: %@", v133, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[CPSDashboardGuidanceViewController _setContentReady](v128, "_setContentReady");
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v81, 8);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(a1[4], "shortcutButtonsContainerView");
  objc_msgSend(v3, "removeLayoutGuide:", location[0]);

  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_23(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  CPSDashboardItemView *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
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
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v47;
  id v49;
  id v50[3];
  uint64_t v51;
  id location[2];
  _QWORD v53[6];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v51 = a3;
  v50[2] = a4;
  v50[1] = (id)a1;
  v4 = [CPSDashboardItemView alloc];
  v50[0] = -[CPSDashboardItemView initWithDashboardButton:layoutAxis:](v4, "initWithDashboardButton:layoutAxis:", location[0], 2);
  objc_msgSend(v50[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v50[0], "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v50[0]);
  v47 = (id)objc_msgSend(*(id *)(a1 + 32), "shortcutButtonsContainerView");
  objc_msgSend(v47, "addSubview:", v50[0]);

  v49 = (id)objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v37 = *(void **)(a1 + 56);
    v44 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "trailingAnchor");
    v43 = (id)objc_msgSend(v49, "centerXAnchor");
    v42 = (id)objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:");
    v54[0] = v42;
    v41 = (id)objc_msgSend(v50[0], "leadingAnchor");
    v40 = (id)objc_msgSend(v49, "centerXAnchor");
    v39 = (id)objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:");
    v54[1] = v39;
    v38 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    objc_msgSend(v37, "addObjectsFromArray:");

  }
  else if (!v51)
  {
    v32 = *(void **)(a1 + 56);
    v36 = (id)objc_msgSend(v50[0], "leadingAnchor");
    v35 = (id)objc_msgSend(*(id *)(a1 + 32), "shortcutButtonsContainerView");
    v34 = (id)objc_msgSend(v35, "leadingAnchor");
    v33 = (id)objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:");
    objc_msgSend(v32, "addObject:");

  }
  v8 = *(void **)(a1 + 56);
  v30 = (id)objc_msgSend(v49, "leadingAnchor");
  v29 = (id)objc_msgSend(v30, "constraintEqualToAnchor:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v53[0] = v29;
  v28 = (id)objc_msgSend(v49, "trailingAnchor");
  v27 = (id)objc_msgSend(v50[0], "imageView");
  v26 = (id)objc_msgSend(v27, "leadingAnchor");
  v25 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
  v53[1] = v25;
  v24 = (id)objc_msgSend(v50[0], "topAnchor");
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "shortcutButtonsContainerView");
  v22 = (id)objc_msgSend(v23, "topAnchor");
  v21 = (id)objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:");
  v53[2] = v21;
  v20 = (id)objc_msgSend(v50[0], "bottomAnchor");
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "shortcutButtonsContainerView");
  v18 = (id)objc_msgSend(v19, "bottomAnchor");
  v17 = (id)objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:");
  v53[3] = v17;
  v16 = (id)objc_msgSend(v50[0], "centerYAnchor");
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "shortcutButtonsContainerView");
  v14 = (id)objc_msgSend(v15, "centerYAnchor");
  v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v53[4] = v13;
  v12 = (id)objc_msgSend(v49, "widthAnchor");
  v11 = (id)objc_msgSend(*(id *)(a1 + 64), "widthAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v53[5] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 6);
  objc_msgSend(v8, "addObjectsFromArray:");

  v31 = (id)objc_msgSend(v50[0], "imageView");
  v5 = (id)objc_msgSend(v31, "trailingAnchor");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v50[0]);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(v50, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2_25(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  char v5;
  id v8;
  id v9;
  BOOL v10;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = (id)objc_msgSend(location[0], "dashboardButton");
  v8 = (id)objc_msgSend(v9, "subtitleVariants");
  v10 = objc_msgSend(v8, "count") != 0;

  if (!v10)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
  v4 = (id)objc_msgSend(location[0], "subtitleLabel");
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_3(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "hideSubtitle");
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_4(id *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(a1[4], "focusHighlightColor");
  objc_msgSend(location[0], "setFocusHighlightColor:");

  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  CPDashboardClientInterface *v3;
  CPDashboardClientInterface *v4;
  char v5;
  CPDashboardButton *v6;
  id v7;
  CPDashboardButton *v8;
  char v9;
  id v10;
  int v11;
  id v12;
  id location[2];
  CPSDashboardGuidanceViewController *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = (id)objc_msgSend(location[0], "identifier");
  if (-[CPSDashboardGuidanceViewController fakesDashboardSupport](v14, "fakesDashboardSupport")
    && (v8 = -[CPSDashboardGuidanceViewController fakeDashboardButton](v14, "fakeDashboardButton"),
        v7 = (id)-[CPDashboardButton identifier](v8, "identifier"),
        v9 = objc_msgSend(v12, "isEqual:"),
        v7,
        v8,
        (v9 & 1) != 0))
  {
    v6 = -[CPSDashboardGuidanceViewController fakeDashboardButton](v14, "fakeDashboardButton");
    -[CPDashboardButton handlePrimaryAction](v6, "handlePrimaryAction");

    v11 = 1;
  }
  else
  {
    v10 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v14, (uint64_t)v12);
      _os_log_debug_impl(&dword_21E389000, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v15, 0x16u);
    }
    objc_storeStrong(&v10, 0);
    v4 = -[CPSDashboardGuidanceViewController dashboardClient](v14, "dashboardClient");
    v5 = -[CPDashboardClientInterface conformsToProtocol:](v4, "conformsToProtocol:", &unk_255452008);

    if ((v5 & 1) != 0)
    {
      v3 = -[CPSDashboardGuidanceViewController dashboardClient](v14, "dashboardClient");
      -[CPDashboardClientInterface handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v12);

    }
    v11 = 0;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  CPSDashboardManeuversCardView *v4;
  CPSDashboardManeuversCardView *v5;
  id *v6;
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
  CPSDashboardManeuversCardView *v19;
  UIView *v20;
  int v21;
  BOOL v22;
  CPSPausedCardView *v23;
  CPSPausedCardView *v24;
  CPSDashboardManeuversCardView *v25;
  CPSDashboardManeuversCardView *v27;
  char v28;
  UIView *v29;
  CPSDashboardManeuversCardView *v30;
  char v31;
  NSArray *v32;
  BOOL v33;
  id v34;
  id v35;
  id location[2];
  CPSDashboardGuidanceViewController *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  -[CPSDashboardGuidanceViewController _setContentReady](v37, "_setContentReady");
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = -[CPSDashboardGuidanceViewController maneuversCardView](v37, "maneuversCardView");

  if (v27)
  {
    v25 = -[CPSDashboardGuidanceViewController maneuversCardView](v37, "maneuversCardView");
    objc_msgSend(v34, "addObject:");

  }
  v24 = -[CPSDashboardGuidanceViewController pausedCardView](v37, "pausedCardView");

  if (v24)
  {
    v23 = -[CPSDashboardGuidanceViewController pausedCardView](v37, "pausedCardView");
    objc_msgSend(v34, "addObject:");

  }
  v33 = 0;
  v31 = 0;
  v22 = 1;
  if (!objc_msgSend(v34, "count"))
  {
    v32 = -[CPSDashboardGuidanceViewController dashboardButtons](v37, "dashboardButtons");
    v31 = 1;
    v22 = -[NSArray count](v32, "count") != 0;
  }
  if ((v31 & 1) != 0)

  v33 = v22;
  -[CPSDashboardGuidanceViewController setManeuversCardView:](v37, "setManeuversCardView:");
  -[CPSDashboardGuidanceViewController setPausedCardView:](v37, "setPausedCardView:", 0);
  v30 = 0;
  if (objc_msgSend(location[0], "count"))
  {
    v20 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v37, "shortcutButtonsContainerView");
    v28 = 0;
    LOBYTE(v21) = 0;
    if (v20)
    {
      v29 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v37, "shortcutButtonsContainerView");
      v28 = 1;
      v21 = !-[UIView isHidden](v29, "isHidden");
    }
    if ((v28 & 1) != 0)

    if ((v21 & 1) != 0)
      -[CPSDashboardGuidanceViewController _animateShortcutContainerViewOut](v37, "_animateShortcutContainerViewOut");
    v4 = objc_alloc_init(CPSDashboardManeuversCardView);
    v5 = v30;
    v30 = v4;

    v7 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[CPSDashboardManeuversCardView setBackgroundColor:](v30, "setBackgroundColor:");

    -[CPSDashboardManeuversCardView setAllowsCustomBackgroundColorForManeuver:](v30, "setAllowsCustomBackgroundColorForManeuver:", 0);
    -[CPSDashboardManeuversCardView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (id)-[CPSDashboardGuidanceViewController view](v37, "view");
    objc_msgSend(v8, "addSubview:", v30);

    objc_storeStrong((id *)&v37->_maneuversCardView, v30);
    -[CPSDashboardManeuversCardView showManeuvers:usingDisplayStyles:](v30, "showManeuvers:usingDisplayStyles:", location[0], v35);
    v9 = (void *)MEMORY[0x24BDD1628];
    v18 = (id)-[CPSDashboardGuidanceViewController view](v37, "view");
    v17 = (id)objc_msgSend(v18, "topAnchor");
    v16 = (id)-[CPSDashboardManeuversCardView topAnchor](v30, "topAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v38[0] = v15;
    v14 = (id)-[CPSDashboardGuidanceViewController view](v37, "view");
    v13 = (id)objc_msgSend(v14, "bottomAnchor");
    v12 = (id)-[CPSDashboardManeuversCardView bottomAnchor](v30, "bottomAnchor");
    v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v38[1] = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    objc_msgSend(v9, "activateConstraints:");

    v19 = -[CPSDashboardGuidanceViewController maneuversCardView](v37, "maneuversCardView");
    -[CPSDashboardManeuversCardView setHidden:](v19, "setHidden:", 0);

  }
  -[CPSDashboardGuidanceViewController _transitionFromViews:inView:animated:](v37, "_transitionFromViews:inView:animated:", v34, v30, v33, &v30);
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSDashboardManeuversCardView *v5;
  id v6;
  id location[2];
  CPSDashboardGuidanceViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[CPSDashboardGuidanceViewController maneuversCardView](v8, "maneuversCardView");
  -[CPSDashboardManeuversCardView updateEstimates:forManeuver:](v5, "updateEstimates:forManeuver:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  CPSPausedCardView *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CPSPausedCardView *v18;
  CPSPausedCardView *v19;
  CPSDashboardManeuversCardView *v20;
  CPSDashboardManeuversCardView *v24;
  CPSPausedCardView *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  id location[2];
  CPSDashboardGuidanceViewController *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = -[CPSDashboardGuidanceViewController maneuversCardView](v31, "maneuversCardView");

  if (v24)
  {
    v20 = -[CPSDashboardGuidanceViewController maneuversCardView](v31, "maneuversCardView");
    objc_msgSend(v26, "addObject:");

  }
  v19 = -[CPSDashboardGuidanceViewController pausedCardView](v31, "pausedCardView");

  if (v19)
  {
    v18 = -[CPSDashboardGuidanceViewController pausedCardView](v31, "pausedCardView");
    objc_msgSend(v26, "addObject:");

  }
  -[CPSDashboardGuidanceViewController setManeuversCardView:](v31, "setManeuversCardView:");
  -[CPSDashboardGuidanceViewController setPausedCardView:](v31, "setPausedCardView:", 0);
  v6 = [CPSPausedCardView alloc];
  v25 = -[CPSPausedCardView initWithReason:title:backgroundColor:](v6, "initWithReason:title:backgroundColor:", v29, v28, 0);
  v7 = (id)-[CPSDashboardGuidanceViewController view](v31, "view");
  objc_msgSend(v7, "addSubview:", v25);

  objc_storeStrong((id *)&v31->_pausedCardView, v25);
  v8 = (void *)MEMORY[0x24BDD1628];
  v17 = (id)-[CPSDashboardGuidanceViewController view](v31, "view");
  v16 = (id)objc_msgSend(v17, "topAnchor");
  v15 = (id)-[CPSPausedCardView topAnchor](v25, "topAnchor");
  v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v32[0] = v14;
  v13 = (id)-[CPSDashboardGuidanceViewController view](v31, "view");
  v12 = (id)objc_msgSend(v13, "bottomAnchor");
  v11 = (id)-[CPSPausedCardView bottomAnchor](v25, "bottomAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v32[1] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  objc_msgSend(v8, "activateConstraints:");

  -[CPSDashboardGuidanceViewController _animateShortcutContainerViewOut](v31, "_animateShortcutContainerViewOut");
  -[CPSDashboardGuidanceViewController _transitionFromViews:inView:animated:](v31, "_transitionFromViews:inView:animated:", v26, v25, 1);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  CPSPausedCardView *v4;
  CPSPausedCardView *v5;
  CPSDashboardManeuversCardView *v6;
  CPSDashboardManeuversCardView *v8;
  id v9;
  BOOL v10;
  id location[2];
  CPSDashboardGuidanceViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = -[CPSDashboardGuidanceViewController maneuversCardView](v12, "maneuversCardView");

  if (v8)
  {
    v6 = -[CPSDashboardGuidanceViewController maneuversCardView](v12, "maneuversCardView");
    objc_msgSend(v9, "addObject:");

  }
  v5 = -[CPSDashboardGuidanceViewController pausedCardView](v12, "pausedCardView");

  if (v5)
  {
    v4 = -[CPSDashboardGuidanceViewController pausedCardView](v12, "pausedCardView");
    objc_msgSend(v9, "addObject:");

  }
  -[CPSDashboardGuidanceViewController setManeuversCardView:](v12, "setManeuversCardView:");
  -[CPSDashboardGuidanceViewController setPausedCardView:](v12, "setPausedCardView:", 0);
  -[CPSDashboardGuidanceViewController _transitionFromViews:inView:animated:](v12, "_transitionFromViews:inView:animated:", v9, 0, 1);
  -[CPSDashboardGuidanceViewController _animateShortcutContainerViewIn](v12, "_animateShortcutContainerViewIn");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4 animated:(BOOL)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  char v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  char v53;
  id v54;
  uint64_t v57;
  int v58;
  int v59;
  void (*v60)(uint64_t);
  void *v61;
  id v62[5];
  char v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  id v67;
  id v68;
  id v69[5];
  id v70[5];
  id v71;
  uint64_t v72;
  int v73;
  int v74;
  void (*v75)(id *, void *, void *, void *);
  void *v76;
  CPSDashboardGuidanceViewController *v77;
  BOOL v78;
  id v79;
  id location[2];
  CPSDashboardGuidanceViewController *v81;
  _QWORD v82[2];
  _QWORD v83[3];

  v83[2] = *MEMORY[0x24BDAC8D0];
  v81 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v79 = 0;
  objc_storeStrong(&v79, a4);
  v78 = a5;
  if (a5)
  {
    v54 = location[0];
    v72 = MEMORY[0x24BDAC760];
    v73 = -1073741824;
    v74 = 0;
    v75 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke;
    v76 = &unk_24E26F190;
    v77 = v81;
    objc_msgSend(v54, "enumerateObjectsUsingBlock:", &v72);
    if (v79)
    {
      v40 = (id)objc_msgSend(v79, "leadingAnchor");
      v39 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      v38 = (id)objc_msgSend(v39, "leadingAnchor");
      v37 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      objc_msgSend(v37, "frame");
      v70[1] = v5;
      v70[2] = v6;
      v70[3] = v7;
      v70[4] = v8;
      v71 = (id)objc_msgSend(v40, "constraintEqualToAnchor:constant:", v38, *(double *)&v7);

      v44 = (id)objc_msgSend(v79, "trailingAnchor");
      v43 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      v42 = (id)objc_msgSend(v43, "trailingAnchor");
      v41 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      objc_msgSend(v41, "frame");
      v69[1] = v9;
      v69[2] = v10;
      v69[3] = v11;
      v69[4] = v12;
      v70[0] = (id)objc_msgSend(v44, "constraintEqualToAnchor:constant:", v42, *(double *)&v11);

      v45 = (void *)MEMORY[0x24BDD1628];
      v83[0] = v71;
      v83[1] = v70[0];
      v46 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
      objc_msgSend(v45, "activateConstraints:");

      v47 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      objc_msgSend(v47, "layoutIfNeeded");

      objc_msgSend(v79, "layoutIfNeeded");
      v48 = (void *)MEMORY[0x24BE0BD98];
      v49 = (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
      v69[0] = (id)objc_msgSend(v48, "settingsWithDuration:timingFunction:", 0.35);

      v13 = (void *)objc_opt_class();
      v68 = CPSSafeCast_0(v13, v79);
      v50 = (void *)objc_opt_class();
      v52 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      v51 = (id)objc_msgSend(v52, "window");
      v67 = CPSSafeCast_0(v50, v51);

      v66 = 0;
      v53 = 0;
      if (v68)
        v53 = objc_msgSend(v68, "wantsLargeSize");
      v66 = v53 & 1;
      v34 = (id)objc_msgSend(v67, "widgetSizes");
      v33 = (id)objc_msgSend(v34, "lastObject");
      objc_msgSend(v33, "CGSizeValue");
      v64 = v14;
      v65 = v15;

      v35 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
      objc_msgSend(v35, "frame");
      v62[1] = v16;
      v62[2] = v17;
      v62[3] = v18;
      v62[4] = v19;
      v36 = BSFloatGreaterThanOrEqualToFloat();

      v63 = v36 & 1;
      if ((v36 & 1) != (v53 & 1))
        objc_msgSend(v67, "setNeedsLargeSize:animationSettings:", v66 & 1, v69[0]);
      objc_msgSend(v71, "setConstant:");
      objc_msgSend(v70[0], "setConstant:", 0.0);
      v32 = (void *)MEMORY[0x24BDF6F90];
      objc_msgSend(v69[0], "duration");
      v31 = v20;
      v57 = MEMORY[0x24BDAC760];
      v58 = -1073741824;
      v59 = 0;
      v60 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_4;
      v61 = &unk_24E26F1B8;
      v62[0] = v81;
      objc_msgSend(v32, "animateWithDuration:delay:options:animations:completion:", 0, &v57, &__block_literal_global_80, v31, 0.0);
      objc_storeStrong(v62, 0);
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v68, 0);
      objc_storeStrong(v69, 0);
      objc_storeStrong(v70, 0);
      objc_storeStrong(&v71, 0);
    }
    objc_storeStrong((id *)&v77, 0);
  }
  else if (v79)
  {
    v21 = (void *)MEMORY[0x24BDD1628];
    v30 = (id)objc_msgSend(v79, "leadingAnchor");
    v29 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
    v28 = (id)objc_msgSend(v29, "leadingAnchor");
    v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:");
    v82[0] = v27;
    v26 = (id)objc_msgSend(v79, "trailingAnchor");
    v25 = (id)-[CPSDashboardGuidanceViewController view](v81, "view");
    v24 = (id)objc_msgSend(v25, "trailingAnchor");
    v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", 0.0);
    v82[1] = v23;
    v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2);
    objc_msgSend(v21, "activateConstraints:");

  }
  objc_storeStrong(&v79, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v39[3] = a3;
  v39[2] = a4;
  v39[1] = a1;
  v39[0] = (id)objc_msgSend(location[0], "snapshotViewAfterScreenUpdates:", 0);
  v15 = (id)objc_msgSend(a1[4], "view");
  objc_msgSend(v15, "addSubview:", v39[0]);

  v16 = v39[0];
  objc_msgSend(location[0], "frame");
  v35 = v4;
  v36 = v5;
  v37 = v6;
  v38 = v7;
  objc_msgSend(v16, "setFrame:", v4, v5, v6, v7);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_msgSend(v39[0], "frame");
  *((_QWORD *)&v33 + 1) = v8;
  *(double *)&v34 = v9;
  *((_QWORD *)&v34 + 1) = v10;
  *(double *)&v33 = v11 - v9;
  v18 = (void *)MEMORY[0x24BDF6F90];
  v17 = MEMORY[0x24BDAC760];
  v25 = MEMORY[0x24BDAC760];
  v26 = -1073741824;
  v27 = 0;
  v28 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_2;
  v29 = &unk_24E26F140;
  v30 = v39[0];
  v31 = v33;
  v32 = v34;
  v19 = v17;
  v20 = -1073741824;
  v21 = 0;
  v22 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_3;
  v23 = &unk_24E26F168;
  v24 = v39[0];
  objc_msgSend(v18, "animateWithDuration:animations:completion:", &v25, 0.35);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v39, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_animateShortcutContainerViewOut
{
  id v2;
  void *v3;
  id v4;
  id v5;
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
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  UIView *v32;
  UIView *v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(uint64_t);
  void *v44;
  CPSDashboardGuidanceViewController *v45;
  id location;
  id v47[2];
  CPSDashboardGuidanceViewController *v48;
  id v49;
  _QWORD v50[5];

  v50[4] = *MEMORY[0x24BDAC8D0];
  v48 = self;
  v47[1] = (id)a2;
  v29 = (void *)objc_opt_class();
  v31 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
  v30 = (id)objc_msgSend(v31, "window");
  v47[0] = CPSSafeCast_0(v29, v30);

  objc_msgSend(v47[0], "setFocusableViews:", MEMORY[0x24BDBD1A8]);
  v32 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v48, "shortcutButtonsContainerView");
  location = -[UIView snapshotViewAfterScreenUpdates:](v32, "snapshotViewAfterScreenUpdates:", 0);

  v33 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](v48, "shortcutButtonsContainerView");
  -[UIView setHidden:](v33, "setHidden:", 1);

  if (location)
  {
    objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v2 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
    objc_msgSend(v2, "addSubview:", location);

    v3 = (void *)MEMORY[0x24BDD1628];
    v20 = (id)objc_msgSend(location, "trailingAnchor");
    v19 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
    v18 = (id)objc_msgSend(v19, "trailingAnchor");
    v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v50[0] = v17;
    v16 = (id)objc_msgSend(location, "topAnchor");
    v15 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
    v14 = (id)objc_msgSend(v15, "topAnchor");
    v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v50[1] = v13;
    v12 = (id)objc_msgSend(location, "bottomAnchor");
    v11 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
    v10 = (id)objc_msgSend(v11, "bottomAnchor");
    v9 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v50[2] = v9;
    v8 = (id)objc_msgSend(location, "widthAnchor");
    v7 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
    v6 = (id)objc_msgSend(v7, "widthAnchor");
    v5 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
    v50[3] = v5;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 4);
    objc_msgSend(v3, "activateConstraints:");

    objc_msgSend(location, "layoutIfNeeded");
    v21 = (void *)MEMORY[0x24BDD1628];
    v26 = (id)objc_msgSend(location, "trailingAnchor");
    v25 = (id)-[CPSDashboardGuidanceViewController view](v48, "view");
    v24 = (id)objc_msgSend(v25, "leadingAnchor");
    v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
    v49 = v23;
    v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
    objc_msgSend(v21, "activateConstraints:");

    v28 = (void *)MEMORY[0x24BDF6F90];
    v27 = MEMORY[0x24BDAC760];
    v40 = MEMORY[0x24BDAC760];
    v41 = -1073741824;
    v42 = 0;
    v43 = __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke;
    v44 = &unk_24E26F1B8;
    v45 = v48;
    v34 = v27;
    v35 = -1073741824;
    v36 = 0;
    v37 = __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke_2;
    v38 = &unk_24E26F168;
    v39 = location;
    objc_msgSend(v28, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v40, &v34, 0.3, 0.0, 0.8);
    objc_storeStrong(&v39, 0);
    objc_storeStrong((id *)&v45, 0);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v47, 0);
}

void __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_animateShortcutContainerViewIn
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  id v11;
  NSLayoutConstraint *v12;
  id v13;
  NSLayoutConstraint *v14;
  id v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(id *, char);
  void *v24;
  CPSDashboardGuidanceViewController *v25;
  uint64_t v26;
  int v27;
  int v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31[10];
  CPSDashboardGuidanceViewController *v32;

  v32 = self;
  v31[9] = (id)a2;
  v10 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerView](self, "shortcutButtonsContainerView");
  -[UIView setHidden:](v10, "setHidden:", 0);

  v12 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerViewLeadingConstraint](v32, "shortcutButtonsContainerViewLeadingConstraint");
  v11 = (id)-[CPSDashboardGuidanceViewController view](v32, "view");
  objc_msgSend(v11, "frame");
  v31[5] = v2;
  v31[6] = v3;
  v31[7] = v4;
  v31[8] = v5;
  -[NSLayoutConstraint setConstant:](v12, "setConstant:", *(double *)&v4 + 8.0);

  v14 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerViewTrailingConstraint](v32, "shortcutButtonsContainerViewTrailingConstraint");
  v13 = (id)-[CPSDashboardGuidanceViewController view](v32, "view");
  objc_msgSend(v13, "frame");
  v31[1] = v6;
  v31[2] = v7;
  v31[3] = v8;
  v31[4] = v9;
  -[NSLayoutConstraint setConstant:](v14, "setConstant:", *(double *)&v8 + 8.0);

  v15 = (id)-[CPSDashboardGuidanceViewController view](v32, "view");
  objc_msgSend(v15, "layoutIfNeeded");

  v16 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerViewLeadingConstraint](v32, "shortcutButtonsContainerViewLeadingConstraint");
  -[NSLayoutConstraint setConstant:](v16, "setConstant:");

  v17 = -[CPSDashboardGuidanceViewController shortcutButtonsContainerViewTrailingConstraint](v32, "shortcutButtonsContainerViewTrailingConstraint");
  -[NSLayoutConstraint setConstant:](v17, "setConstant:", 0.0);

  v19 = (void *)MEMORY[0x24BDF6F90];
  v18 = MEMORY[0x24BDAC760];
  v26 = MEMORY[0x24BDAC760];
  v27 = -1073741824;
  v28 = 0;
  v29 = __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke;
  v30 = &unk_24E26F1B8;
  v31[0] = v32;
  v20 = v18;
  v21 = -1073741824;
  v22 = 0;
  v23 = __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke_2;
  v24 = &unk_24E26F168;
  v25 = v32;
  objc_msgSend(v19, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v26, 0.3, 0.0, 0.8);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(v31, 0);
}

void __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

void __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke_2(id *a1, char a2)
{
  void *v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8[2];
  char v9;
  id *v10;

  v10 = a1;
  v9 = a2 & 1;
  v8[1] = a1;
  v2 = (void *)objc_opt_class();
  v4 = (id)objc_msgSend(a1[4], "view");
  v3 = (id)objc_msgSend(v4, "window");
  v8[0] = CPSSafeCast_0(v2, v3);

  v6 = v8[0];
  v7 = (id)objc_msgSend(a1[4], "dashboardButtons");
  objc_msgSend(v6, "setFocusableViews:");

  objc_storeStrong(v8, 0);
}

- (void)_focusHighlightColorChanged:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *);
  void *v11;
  id v12;
  id v13;
  id location[2];
  CPSDashboardGuidanceViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class();
  v5 = (id)-[CPSDashboardGuidanceViewController view](v15, "view");
  v4 = (id)objc_msgSend(v5, "window");
  v13 = CPSSafeCast_0(v3, v4);

  v6 = -[CPSDashboardGuidanceViewController dashboardButtons](v15, "dashboardButtons");
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __66__CPSDashboardGuidanceViewController__focusHighlightColorChanged___block_invoke;
  v11 = &unk_24E26F118;
  v12 = v13;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __66__CPSDashboardGuidanceViewController__focusHighlightColorChanged___block_invoke(id *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(a1[4], "focusHighlightColor");
  objc_msgSend(location[0], "setFocusHighlightColor:");

  objc_storeStrong(location, 0);
}

- (void)_setContentReady
{
  NSObject *v2;
  os_log_type_t v3;
  NSObject *log;
  os_log_type_t type;
  void *v6;
  id v7;
  id v8;
  uint8_t v9[7];
  char v10;
  id v11;
  uint8_t v12[15];
  char v13;
  id location;
  id v15[2];
  CPSDashboardGuidanceViewController *v16;

  v16 = self;
  v15[1] = (id)a2;
  v6 = (void *)objc_opt_class();
  v8 = (id)-[CPSDashboardGuidanceViewController view](v16, "view");
  v7 = (id)objc_msgSend(v8, "window");
  v15[0] = CPSSafeCast_0(v6, v7);

  if (v15[0])
  {
    location = CarPlaySupportGeneralLogging();
    v13 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_21E389000, log, type, "Window exists, setting content ready", v12, 2u);
    }
    objc_storeStrong(&location, 0);
    objc_msgSend(v15[0], "setContentReady");
  }
  else
  {
    v11 = CarPlaySupportGeneralLogging();
    v10 = 2;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
    {
      v2 = v11;
      v3 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_debug_impl(&dword_21E389000, v2, v3, "Window does not exist, not setting content ready", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(v15, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSDashboardGuidanceViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSDashboardGuidanceViewController;
  -[CPSDashboardGuidanceViewController traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSDashboardGuidanceViewController _setupFakeButtonIfNecessary](v5, "_setupFakeButtonIfNecessary");
  objc_storeStrong(location, 0);
}

- (void)_setupFakeButtonIfNecessary
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  CPSDashboardGuidanceViewController *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  CPSDashboardGuidanceViewController *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  CPSDashboardGuidanceViewController *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  CPDashboardButton *v40;
  SEL v41;
  CPSDashboardGuidanceViewController *v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v42 = self;
  v41 = a2;
  v39 = 0;
  v18 = 0;
  if (-[CPSDashboardGuidanceViewController fakesDashboardSupport](self, "fakesDashboardSupport"))
  {
    v40 = -[CPSDashboardGuidanceViewController fakeDashboardButton](v42, "fakeDashboardButton");
    v39 = 1;
    v18 = v40 == 0;
  }
  if ((v39 & 1) != 0)

  if (v18)
  {
    v14 = (id)-[CPSDashboardGuidanceViewController view](v42, "view");
    v13 = (id)objc_msgSend(v14, "window");
    v38 = (id)objc_msgSend(v13, "windowScene");

    v15 = (void *)objc_opt_class();
    v17 = (id)objc_msgSend(v38, "_FBSScene");
    v16 = (id)objc_msgSend(v17, "settings");
    v37 = CPSSafeCast_0(v15, v16);

    if (v37)
    {
      v36 = (id)objc_msgSend(v37, "proxiedApplicationBundleIdentifier");
      v2 = (void *)MEMORY[0x24BDF6AC8];
      v3 = v36;
      v4 = (id)-[CPSDashboardGuidanceViewController traitCollection](v42, "traitCollection");
      objc_msgSend(v4, "displayScale");
      v35 = (id)objc_msgSend(v2, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 8);

      v6 = objc_alloc(MEMORY[0x24BDB79A8]);
      v44[0] = CFSTR("This is test UI");
      v44[1] = v36;
      v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44);
      v5 = v35;
      v8 = MEMORY[0x24BDAC760];
      v27 = MEMORY[0x24BDAC760];
      v28 = -1073741824;
      v29 = 0;
      v30 = __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke;
      v31 = &unk_24E26F220;
      v32 = v42;
      v33 = v36;
      v34 = (id)objc_msgSend(v6, "initWithTitleVariants:subtitleVariants:image:handler:", &unk_24E29A7E8, v7, v5, &v27);

      v10 = objc_alloc(MEMORY[0x24BDB79A8]);
      v9 = v35;
      v19 = v8;
      v20 = -1073741824;
      v21 = 0;
      v22 = __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke_2;
      v23 = &unk_24E26F220;
      v24 = v42;
      v25 = v36;
      v26 = objc_msgSend(v10, "initWithTitleVariants:subtitleVariants:image:handler:", &unk_24E29A800, &unk_24E29A818, v9, &v19);
      -[CPSDashboardGuidanceViewController setFakeDashboardButton:](v42, "setFakeDashboardButton:", v34);
      v11 = v42;
      v43[0] = v34;
      v43[1] = v26;
      v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
      -[CPSDashboardGuidanceViewController setShortCutButtons:](v11, "setShortCutButtons:");

      objc_storeStrong((id *)&v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong((id *)&v24, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v32, 0);
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
}

void __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "_launchApp:", *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

void __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "_launchApp:", *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

- (void)_launchApp:(id)a3
{
  id v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BE380B0], "dashboardService");
  objc_msgSend(v3, "openApplication:withOptions:completion:", location[0], 0, &__block_literal_global_101);

  objc_storeStrong(location, 0);
}

void __49__CPSDashboardGuidanceViewController__launchApp___block_invoke(void *a1, void *a2, void *a3)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = 0;
  objc_storeStrong(&v4, a3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setFakesDashboardSupport:(BOOL)a3
{
  if (self->_fakesDashboardSupport != a3)
  {
    self->_fakesDashboardSupport = a3;
    -[CPSDashboardGuidanceViewController _setupFakeButtonIfNecessary](self, "_setupFakeButtonIfNecessary");
  }
}

- (CPDashboardClientInterface)dashboardClient
{
  return self->_dashboardClient;
}

- (void)setDashboardClient:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardClient, a3);
}

- (BOOL)fakesDashboardSupport
{
  return self->_fakesDashboardSupport;
}

- (NSArray)dashboardButtons
{
  return self->_dashboardButtons;
}

- (void)setDashboardButtons:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardButtons, a3);
}

- (CPSDashboardManeuversCardView)maneuversCardView
{
  return self->_maneuversCardView;
}

- (void)setManeuversCardView:(id)a3
{
  objc_storeStrong((id *)&self->_maneuversCardView, a3);
}

- (CPSPausedCardView)pausedCardView
{
  return self->_pausedCardView;
}

- (void)setPausedCardView:(id)a3
{
  objc_storeStrong((id *)&self->_pausedCardView, a3);
}

- (CPDashboardButton)fakeDashboardButton
{
  return self->_fakeDashboardButton;
}

- (void)setFakeDashboardButton:(id)a3
{
  objc_storeStrong((id *)&self->_fakeDashboardButton, a3);
}

- (UIView)shortcutButtonsContainerView
{
  return self->_shortcutButtonsContainerView;
}

- (void)setShortcutButtonsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutButtonsContainerView, a3);
}

- (NSLayoutConstraint)shortcutButtonsContainerViewLeadingConstraint
{
  return self->_shortcutButtonsContainerViewLeadingConstraint;
}

- (void)setShortcutButtonsContainerViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutButtonsContainerViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)shortcutButtonsContainerViewTrailingConstraint
{
  return self->_shortcutButtonsContainerViewTrailingConstraint;
}

- (void)setShortcutButtonsContainerViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutButtonsContainerViewTrailingConstraint, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (NSArray)spacingGuides
{
  return self->_spacingGuides;
}

- (void)setSpacingGuides:(id)a3
{
  objc_storeStrong((id *)&self->_spacingGuides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spacingGuides, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_shortcutButtonsContainerViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_shortcutButtonsContainerViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_shortcutButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_fakeDashboardButton, 0);
  objc_storeStrong((id *)&self->_pausedCardView, 0);
  objc_storeStrong((id *)&self->_maneuversCardView, 0);
  objc_storeStrong((id *)&self->_dashboardButtons, 0);
  objc_storeStrong((id *)&self->_dashboardClient, 0);
}

@end
