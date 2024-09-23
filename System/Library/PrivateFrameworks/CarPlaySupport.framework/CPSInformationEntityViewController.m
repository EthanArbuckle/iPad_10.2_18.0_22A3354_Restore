@implementation CPSInformationEntityViewController

- (id)informationTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_19(v3, v4);

  return v5;
}

- (void)updateWithInformationTemplate:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSInformationEntityViewController *v9;
  id v10;
  id location[2];
  CPSInformationEntityViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __68__CPSInformationEntityViewController_updateWithInformationTemplate___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __68__CPSInformationEntityViewController_updateWithInformationTemplate___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "informationTemplate");
  objc_msgSend(v2, "updateTemplatePropertiesFromTemplate:", *(_QWORD *)(a1 + 40));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "buttonsViewController");
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "informationTemplate");
  v3 = (id)objc_msgSend(v4, "actions");
  objc_msgSend(v5, "setButtons:");

  return objc_msgSend(*(id *)(a1 + 32), "_updateItemStackView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;
  SEL v3;
  CPSInformationEntityViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSInformationEntityViewController;
  -[CPSInformationEntityViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
  -[CPSInformationEntityViewController _updateScrollViewInsets](v4, "_updateScrollViewInsets");
  -[CPSInformationEntityViewController _updateHairline](v4, "_updateHairline");
}

- (void)_viewDidLoad
{
  CPSInformationScrollView *v2;
  uint64_t v3;
  double v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSLayoutXAxisAnchor *v17;
  UILayoutGuide *v18;
  id v19;
  id v20;
  NSLayoutXAxisAnchor *v21;
  UILayoutGuide *v22;
  id v23;
  id v24;
  NSLayoutXAxisAnchor *v25;
  UILayoutGuide *v26;
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
  CPSInformationTemplateButtonsViewController *v53;
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
  id v83;
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
  double *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  CPSInformationTemplateButtonsViewController *v119;
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
  CPSInformationScrollView *v131;
  id v132;
  id v133;
  objc_super v134;
  SEL v135;
  CPSInformationEntityViewController *v136;
  _QWORD v137[10];
  _QWORD v138[2];
  _QWORD v139[11];
  _QWORD v140[4];

  v140[3] = *MEMORY[0x24BDAC8D0];
  v136 = self;
  v135 = a2;
  v134.receiver = self;
  v134.super_class = (Class)CPSInformationEntityViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v134, sel__viewDidLoad);
  v133 = (id)-[CPSInformationEntityViewController view](v136, "view");
  v113 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_msgSend(v133, "setBackgroundColor:");

  v132 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v2 = [CPSInformationScrollView alloc];
  v114 = (double *)MEMORY[0x24BDBF090];
  v131 = -[CPSInformationScrollView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CPSInformationScrollView setTranslatesAutoresizingMaskIntoConstraints:](v131, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSInformationScrollView setDelegate:](v131, "setDelegate:", v136);
  -[CPSInformationScrollView setScrollviewDelegate:](v131, "setScrollviewDelegate:", v136);
  objc_msgSend(v133, "addSubview:", v131);
  -[CPSInformationEntityViewController setScrollView:](v136, "setScrollView:", v131);
  v130 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", *v114, v114[1], v114[2], v114[3]);
  objc_msgSend(v130, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v130, "setAlignment:");
  objc_msgSend(v130, "setDistribution:", 0);
  objc_msgSend(v130, "setAxis:", 1);
  objc_msgSend(v130, "setBaselineRelativeArrangement:", 1);
  v115 = -[CPSInformationEntityViewController informationTemplate](v136, "informationTemplate");
  v3 = objc_msgSend(v115, "layout");
  v4 = 18.0;
  if (v3)
    v4 = 6.0;
  objc_msgSend(v130, "setSpacing:", v4);

  -[CPSInformationScrollView addSubview:](v131, "addSubview:", v130);
  -[CPSInformationEntityViewController setItemStackView:](v136, "setItemStackView:", v130);
  -[CPSInformationEntityViewController _updateItemStackView](v136, "_updateItemStackView");
  v116 = (id)objc_msgSend(v133, "safeAreaLayoutGuide");
  v129 = (id)objc_msgSend(v116, "topAnchor");

  v117 = -[CPSInformationEntityViewController informationTemplate](v136, "informationTemplate");
  v128 = (id)objc_msgSend(v117, "title");

  v118 = (id)-[CPSInformationEntityViewController tabBarController](v136, "tabBarController");
  if (v118)
  {
    v127 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v127, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v97 = v127;
    v98 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77B0], 1024);
    objc_msgSend(v97, "setFont:");

    v99 = v127;
    v100 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    objc_msgSend(v99, "setTextColor:");

    objc_msgSend(v127, "setText:", v128);
    objc_msgSend(v133, "addSubview:", v127);
    -[CPSInformationEntityViewController setTitleLabel:](v136, "setTitleLabel:", v127);
    v5 = (id)objc_msgSend(v127, "bottomAnchor");
    v6 = v129;
    v129 = v5;

    v101 = v132;
    v112 = (id)objc_msgSend(v127, "leadingAnchor");
    v111 = (id)objc_msgSend(v130, "leadingAnchor");
    v110 = (id)objc_msgSend(v112, "constraintEqualToAnchor:");
    v140[0] = v110;
    v109 = (id)objc_msgSend(v127, "trailingAnchor");
    v108 = (id)objc_msgSend(v130, "trailingAnchor");
    v107 = (id)objc_msgSend(v109, "constraintLessThanOrEqualToAnchor:");
    v140[1] = v107;
    v106 = (id)objc_msgSend(v127, "topAnchor");
    v105 = (id)objc_msgSend(v133, "safeAreaLayoutGuide");
    v104 = (id)objc_msgSend(v105, "topAnchor");
    v103 = (id)objc_msgSend(v106, "constraintEqualToAnchor:");
    v140[2] = v103;
    v102 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 3);
    objc_msgSend(v101, "addObjectsFromArray:");

    objc_storeStrong(&v127, 0);
  }
  else
  {
    v96 = (id)-[CPSInformationEntityViewController navigationItem](v136, "navigationItem");
    objc_msgSend(v96, "setTitle:", v128);

  }
  v126 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  v9 = (id)-[CPSInformationEntityViewController view](v136, "view");
  objc_msgSend(v9, "addLayoutGuide:", v126);

  -[CPSInformationEntityViewController setCenteringGuide:](v136, "setCenteringGuide:", v126);
  -[CPSInformationEntityViewController _updateCenteringGuideConstraints](v136, "_updateCenteringGuideConstraints");
  v10 = (id)objc_msgSend(v130, "widthAnchor");
  v125 = (id)objc_msgSend(v10, "constraintLessThanOrEqualToConstant:", 376.0);

  LODWORD(v7) = 1148846080;
  objc_msgSend(v125, "setPriority:", v7);
  v13 = (id)objc_msgSend(v130, "widthAnchor");
  v12 = (id)objc_msgSend(v133, "safeAreaLayoutGuide");
  v11 = (id)objc_msgSend(v12, "widthAnchor");
  v124 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");

  LODWORD(v8) = 1144750080;
  objc_msgSend(v124, "setPriority:", v8);
  v14 = v132;
  v48 = (id)-[CPSInformationScrollView topAnchor](v131, "topAnchor");
  v47 = (id)objc_msgSend(v48, "constraintEqualToAnchor:constant:", v129, 5.0);
  v139[0] = v47;
  v46 = (id)-[CPSInformationScrollView leadingAnchor](v131, "leadingAnchor");
  v45 = (id)objc_msgSend(v133, "safeAreaLayoutGuide");
  v44 = (id)objc_msgSend(v45, "leadingAnchor");
  v43 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
  v139[1] = v43;
  v42 = (id)-[CPSInformationScrollView trailingAnchor](v131, "trailingAnchor");
  v41 = (id)objc_msgSend(v133, "safeAreaLayoutGuide");
  v40 = (id)objc_msgSend(v41, "trailingAnchor");
  v39 = (id)objc_msgSend(v42, "constraintEqualToAnchor:");
  v139[2] = v39;
  v38 = (id)-[CPSInformationScrollView bottomAnchor](v131, "bottomAnchor");
  v37 = (id)objc_msgSend(v133, "bottomAnchor");
  v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
  v139[3] = v36;
  v35 = (id)objc_msgSend(v130, "topAnchor");
  v34 = (id)-[CPSInformationScrollView contentLayoutGuide](v131, "contentLayoutGuide");
  v33 = (id)objc_msgSend(v34, "topAnchor");
  v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
  v139[4] = v32;
  v31 = (id)objc_msgSend(v130, "bottomAnchor");
  v30 = (id)-[CPSInformationScrollView contentLayoutGuide](v131, "contentLayoutGuide");
  v29 = (id)objc_msgSend(v30, "bottomAnchor");
  v28 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
  v139[5] = v28;
  v27 = (id)objc_msgSend(v130, "centerXAnchor");
  v26 = -[CPSInformationEntityViewController centeringGuide](v136, "centeringGuide");
  v25 = -[UILayoutGuide centerXAnchor](v26, "centerXAnchor");
  v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v139[6] = v24;
  v23 = (id)objc_msgSend(v130, "leadingAnchor");
  v22 = -[CPSInformationEntityViewController centeringGuide](v136, "centeringGuide");
  v21 = -[UILayoutGuide leadingAnchor](v22, "leadingAnchor");
  v20 = (id)objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", 12.0);
  v139[7] = v20;
  v19 = (id)objc_msgSend(v130, "trailingAnchor");
  v18 = -[CPSInformationEntityViewController centeringGuide](v136, "centeringGuide");
  v17 = -[UILayoutGuide trailingAnchor](v18, "trailingAnchor");
  v16 = (id)objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:");
  v139[8] = v16;
  v139[9] = v124;
  v139[10] = v125;
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 11);
  objc_msgSend(v14, "addObjectsFromArray:");

  v123 = objc_alloc_init(MEMORY[0x24BDF6FC8]);
  objc_msgSend(v123, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v50 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v49 = (id)objc_msgSend(v50, "colorWithAlphaComponent:", 0.8);
  objc_msgSend(v123, "setBackgroundColor:");

  v122 = (id)objc_msgSend(MEMORY[0x24BDF6958], "colorEffectSaturate:", 1.5);
  v121 = (id)objc_msgSend(MEMORY[0x24BDF6878], "effectWithBlurRadius:", 10.0);
  v51 = v123;
  v138[0] = v122;
  v138[1] = v121;
  v52 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 2);
  objc_msgSend(v51, "setBackgroundEffects:");

  objc_msgSend(v133, "addSubview:", v123);
  -[CPSInformationEntityViewController setVisualEffectView:](v136, "setVisualEffectView:", v123);
  v120 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
  objc_msgSend(v120, "setHidden:", 1);
  objc_msgSend(v133, "addSubview:", v120);
  -[CPSInformationEntityViewController setHairlineView:](v136, "setHairlineView:", v120);
  v53 = [CPSInformationTemplateButtonsViewController alloc];
  v55 = -[CPSInformationEntityViewController informationTemplate](v136, "informationTemplate");
  v54 = (id)objc_msgSend(v55, "actions");
  v119 = -[CPSInformationTemplateButtonsViewController initWithButtons:buttonDelegate:](v53, "initWithButtons:buttonDelegate:");

  v56 = (id)-[CPSInformationTemplateButtonsViewController view](v119, "view");
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CPSInformationTemplateButtonsViewController willMoveToParentViewController:](v119, "willMoveToParentViewController:", v136);
  -[CPSInformationEntityViewController addChildViewController:](v136, "addChildViewController:", v119);
  v57 = v133;
  v58 = (id)-[CPSInformationTemplateButtonsViewController view](v119, "view");
  objc_msgSend(v57, "addSubview:");

  -[CPSInformationTemplateButtonsViewController didMoveToParentViewController:](v119, "didMoveToParentViewController:", v136);
  -[CPSInformationEntityViewController setButtonsViewController:](v136, "setButtonsViewController:", v119);
  v59 = v132;
  v95 = (id)-[CPSInformationTemplateButtonsViewController view](v119, "view");
  v94 = (id)objc_msgSend(v95, "leadingAnchor");
  v93 = (id)objc_msgSend(v130, "leadingAnchor");
  v92 = (id)objc_msgSend(v94, "constraintEqualToAnchor:");
  v137[0] = v92;
  v91 = (id)-[CPSInformationTemplateButtonsViewController view](v119, "view");
  v90 = (id)objc_msgSend(v91, "trailingAnchor");
  v89 = (id)objc_msgSend(v130, "trailingAnchor");
  v88 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
  v137[1] = v88;
  v87 = (id)-[CPSInformationTemplateButtonsViewController view](v119, "view");
  v86 = (id)objc_msgSend(v87, "bottomAnchor");
  v85 = (id)objc_msgSend(v133, "safeAreaLayoutGuide");
  v84 = (id)objc_msgSend(v85, "bottomAnchor");
  v83 = (id)objc_msgSend(v86, "constraintEqualToAnchor:constant:", -12.0);
  v137[2] = v83;
  v82 = (id)objc_msgSend(v123, "topAnchor");
  v81 = (id)-[CPSInformationTemplateButtonsViewController view](v119, "view");
  v80 = (id)objc_msgSend(v81, "topAnchor");
  v79 = (id)objc_msgSend(v82, "constraintEqualToAnchor:constant:", -12.0);
  v137[3] = v79;
  v78 = (id)objc_msgSend(v123, "bottomAnchor");
  v77 = (id)objc_msgSend(v133, "bottomAnchor");
  v76 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
  v137[4] = v76;
  v75 = (id)objc_msgSend(v123, "leftAnchor");
  v74 = (id)objc_msgSend(v133, "leftAnchor");
  v73 = (id)objc_msgSend(v75, "constraintEqualToAnchor:");
  v137[5] = v73;
  v72 = (id)objc_msgSend(v123, "rightAnchor");
  v71 = (id)objc_msgSend(v133, "rightAnchor");
  v70 = (id)objc_msgSend(v72, "constraintEqualToAnchor:");
  v137[6] = v70;
  v69 = (id)objc_msgSend(v120, "bottomAnchor");
  v68 = (id)objc_msgSend(v123, "topAnchor");
  v67 = (id)objc_msgSend(v69, "constraintEqualToAnchor:");
  v137[7] = v67;
  v66 = (id)objc_msgSend(v120, "leftAnchor");
  v65 = (id)objc_msgSend(v123, "leftAnchor");
  v64 = (id)objc_msgSend(v66, "constraintEqualToAnchor:");
  v137[8] = v64;
  v63 = (id)objc_msgSend(v120, "rightAnchor");
  v62 = (id)objc_msgSend(v123, "rightAnchor");
  v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
  v137[9] = v61;
  v60 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 10);
  objc_msgSend(v59, "addObjectsFromArray:");

  -[CPSInformationEntityViewController _updateHairline](v136, "_updateHairline");
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v132);
  objc_storeStrong((id *)&v119, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v123, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(&v126, 0);
  objc_storeStrong(&v128, 0);
  objc_storeStrong(&v129, 0);
  objc_storeStrong(&v130, 0);
  objc_storeStrong((id *)&v131, 0);
  objc_storeStrong(&v132, 0);
  objc_storeStrong(&v133, 0);
}

- (void)didSelectButton:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  CPTemplateDelegate *v8;
  CPTemplateDelegate *v9;
  char v10;
  os_log_t oslog;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSInformationEntityViewController *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  v13 = CPSSafeProtocolCast_3(&unk_255452660, location[0]);
  if (v13)
  {
    v3 = (id)objc_msgSend(v13, "identifier");
    v4 = v14;
    v14 = v3;

  }
  else
  {
    v5 = (void *)objc_opt_class();
    v12 = CPSSafeCast_19(v5, location[0]);
    v6 = (id)objc_msgSend(v12, "identifier");
    v7 = v14;
    v14 = v6;

    objc_storeStrong(&v12, 0);
  }
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v16, (uint64_t)v14);
    _os_log_debug_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v17, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v9 = -[CPSBaseTemplateViewController templateDelegate](v16, "templateDelegate");
  v10 = -[CPTemplateDelegate conformsToProtocol:](v9, "conformsToProtocol:", &unk_25544C5F8);

  if ((v10 & 1) != 0)
  {
    v8 = -[CPSBaseTemplateViewController templateDelegate](v16, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v8, "handleActionForControlIdentifier:", v14);

  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSInformationEntityViewController *v11;
  id v12;
  BOOL v13;
  objc_super v14;
  BOOL v15;
  id location[2];
  CPSInformationEntityViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14.receiver = v17;
  v14.super_class = (Class)CPSInformationEntityViewController;
  -[CPSBaseTemplateViewController setControl:enabled:](&v14, sel_setControl_enabled_, location[0], a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__CPSInformationEntityViewController_setControl_enabled___block_invoke;
  v10 = &unk_24E270068;
  v11 = v17;
  v12 = location[0];
  v13 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSInformationEntityViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "buttonsViewController");
  objc_msgSend(v2, "setButtonIdentifier:enabled:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);

}

- (void)_updateCenteringGuideConstraints
{
  id v2;
  id v3;
  id v4;
  id v5;
  NSLayoutConstraint *v6;
  NSLayoutDimension *v7;
  UILayoutGuide *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSLayoutYAxisAnchor *v13;
  UILayoutGuide *v14;
  id v15;
  NSLayoutXAxisAnchor *v16;
  UILayoutGuide *v17;
  id v18;
  NSLayoutXAxisAnchor *v19;
  UILayoutGuide *v20;
  CPSInformationScrollView *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CPSInformationScrollView *v26;
  void *v27;
  NSArray *v28;
  NSArray *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[2];
  CPSInformationEntityViewController *v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v35 = self;
  v34[1] = (id)a2;
  v29 = -[CPSInformationEntityViewController centeringGuideConstraints](self, "centeringGuideConstraints");

  if (v29)
  {
    v27 = (void *)MEMORY[0x24BDD1628];
    v28 = -[CPSInformationEntityViewController centeringGuideConstraints](v35, "centeringGuideConstraints");
    objc_msgSend(v27, "deactivateConstraints:");

  }
  v23 = (id)-[CPSInformationEntityViewController view](v35, "view");
  v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
  v34[0] = (id)objc_msgSend(v22, "leadingAnchor");

  v25 = (id)-[CPSInformationEntityViewController view](v35, "view");
  v24 = (id)objc_msgSend(v25, "safeAreaLayoutGuide");
  v33 = (id)objc_msgSend(v24, "trailingAnchor");

  v26 = -[CPSInformationEntityViewController scrollView](v35, "scrollView");
  v32 = (id)-[CPSInformationScrollView accessoryViewAtEdge:](v26, "accessoryViewAtEdge:", 0);

  if (v32)
  {
    v2 = (id)objc_msgSend(v32, "trailingAnchor");
    v3 = v34[0];
    v34[0] = v2;

  }
  v21 = -[CPSInformationEntityViewController scrollView](v35, "scrollView");
  v31 = (id)-[CPSInformationScrollView accessoryViewAtEdge:](v21, "accessoryViewAtEdge:", 1);

  if (v31)
  {
    v4 = (id)objc_msgSend(v31, "leadingAnchor");
    v5 = v33;
    v33 = v4;

  }
  v20 = -[CPSInformationEntityViewController centeringGuide](v35, "centeringGuide");
  v19 = -[UILayoutGuide leadingAnchor](v20, "leadingAnchor");
  v18 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v19, "constraintEqualToAnchor:constant:", v34[0]);
  v36[0] = v18;
  v17 = -[CPSInformationEntityViewController centeringGuide](v35, "centeringGuide");
  v16 = -[UILayoutGuide trailingAnchor](v17, "trailingAnchor");
  v15 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v16, "constraintEqualToAnchor:constant:", v33, 0.0);
  v36[1] = v15;
  v14 = -[CPSInformationEntityViewController centeringGuide](v35, "centeringGuide");
  v13 = -[UILayoutGuide topAnchor](v14, "topAnchor");
  v12 = (id)-[CPSInformationEntityViewController view](v35, "view");
  v11 = (id)objc_msgSend(v12, "safeAreaLayoutGuide");
  v10 = (id)objc_msgSend(v11, "topAnchor");
  v9 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v13, "constraintEqualToAnchor:");
  v36[2] = v9;
  v8 = -[CPSInformationEntityViewController centeringGuide](v35, "centeringGuide");
  v7 = -[UILayoutGuide heightAnchor](v8, "heightAnchor");
  v6 = -[NSLayoutDimension constraintEqualToConstant:](v7, "constraintEqualToConstant:", 1.0);
  v36[3] = v6;
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);

  -[CPSInformationEntityViewController setCenteringGuideConstraints:](v35, "setCenteringGuideConstraints:", v30);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v30);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(v34, 0);
}

- (void)_updateItemStackView
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  UIStackView *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSArray *obj;
  UIStackView *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *, unint64_t, void *);
  void *v19;
  CPSInformationEntityViewController *v20;
  id v21[5];
  _QWORD v22[2];
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id v28;
  void *v29;
  _QWORD __b[8];
  id v31;
  SEL v32;
  CPSInformationEntityViewController *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32 = a2;
  memset(__b, 0, sizeof(__b));
  v14 = -[CPSInformationEntityViewController itemStackView](v33, "itemStackView");
  obj = -[UIStackView arrangedSubviews](v14, "arrangedSubviews");

  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
  if (v12)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v12;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v31 = *(id *)(__b[1] + 8 * v10);
      v7 = -[CPSInformationEntityViewController itemStackView](v33, "itemStackView");
      -[UIStackView removeArrangedSubview:](v7, "removeArrangedSubview:", v31);

      objc_msgSend(v31, "removeFromSuperview");
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
        if (!v11)
          break;
      }
    }
  }

  v6 = -[CPSInformationEntityViewController informationTemplate](v33, "informationTemplate");
  v4 = (id)objc_msgSend(v6, "items");
  v5 = objc_msgSend(v4, "count");

  v29 = (void *)v5;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22[0] = 0;
  v22[1] = v22;
  v23 = 838860800;
  v24 = 48;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v3 = -[CPSInformationEntityViewController informationTemplate](v33, "informationTemplate");
  v2 = (id)objc_msgSend(v3, "items");
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __58__CPSInformationEntityViewController__updateItemStackView__block_invoke;
  v19 = &unk_24E271028;
  v20 = v33;
  v21[1] = v22;
  v21[2] = v29;
  v21[0] = v28;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v15);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v28);
  objc_storeStrong(v21, 0);
  objc_storeStrong((id *)&v20, 0);
  _Block_object_dispose(v22, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
}

void __58__CPSInformationEntityViewController__updateItemStackView__block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  CPSRatingView *v4;
  CPSRatingView *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
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
  void *v30;
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
  void *v42;
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
  void *v60;
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
  BOOL v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  BOOL v92;
  id v93;
  BOOL v94;
  id v95;
  BOOL v96;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  char v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  char v115;
  id v116;
  BOOL v117;
  id v118[3];
  unint64_t v119;
  id location[2];
  _QWORD v121[2];
  _QWORD v122[3];
  _QWORD v123[2];
  _QWORD v124[4];
  _QWORD v125[5];

  v125[4] = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v119 = a3;
  v118[2] = a4;
  v118[1] = (id)a1;
  v118[0] = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v117 = 0;
    v95 = (id)objc_msgSend(*(id *)(a1 + 32), "informationTemplate");
    v96 = objc_msgSend(v95, "layout") == 1;

    v117 = v96;
    v4 = [CPSRatingView alloc];
    v5 = -[CPSRatingView initWithInformationItem:layout:](v4, "initWithInformationItem:layout:", location[0], v96);
    v6 = v118[0];
    v118[0] = v5;

    objc_msgSend(v118[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v93 = (id)objc_msgSend(*(id *)(a1 + 32), "informationTemplate");
  v94 = objc_msgSend(v93, "layout") != 0;

  if (v94)
  {
    v75 = (id)objc_msgSend(location[0], "title");
    v108 = 0;
    v76 = 1;
    if (!objc_msgSend(v75, "length"))
    {
      v109 = (id)objc_msgSend(location[0], "detail");
      v108 = 1;
      v76 = 1;
      if (!objc_msgSend(v109, "length"))
        v76 = v118[0] != 0;
    }
    if ((v108 & 1) != 0)

    if (v76)
    {
      v107 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v106 = 0;
      v105 = 0;
      v74 = (id)objc_msgSend(location[0], "title");

      if (v74)
      {
        v104 = objc_alloc_init(MEMORY[0x24BDF6B68]);
        objc_msgSend(v104, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v104, "setNumberOfLines:", 2);
        objc_msgSend(v104, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v104, "setIsAccessibilityElement:", 0);
        v57 = (id)objc_msgSend(location[0], "title");
        objc_msgSend(v104, "setText:");

        v103 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        objc_msgSend(v104, "setFont:", v103);
        v58 = v104;
        v59 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
        objc_msgSend(v58, "setTextColor:");

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v104);
        objc_storeStrong(&v106, v104);
        objc_msgSend(v107, "addSubview:", v104);
        v60 = *(void **)(a1 + 40);
        v73 = (id)objc_msgSend(v104, "leadingAnchor");
        v72 = (id)objc_msgSend(v107, "leadingAnchor");
        v71 = (id)objc_msgSend(v73, "constraintEqualToAnchor:");
        v125[0] = v71;
        v70 = (id)objc_msgSend(v104, "topAnchor");
        v69 = (id)objc_msgSend(v107, "topAnchor");
        v68 = (id)objc_msgSend(v70, "constraintEqualToAnchor:");
        v125[1] = v68;
        v67 = (id)objc_msgSend(v104, "lastBaselineAnchor");
        v66 = (id)objc_msgSend(v107, "bottomAnchor");
        v65 = (id)objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:");
        v125[2] = v65;
        v64 = (id)objc_msgSend(v104, "trailingAnchor");
        v63 = (id)objc_msgSend(v107, "centerXAnchor");
        v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
        v125[3] = v62;
        v61 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 4);
        objc_msgSend(v60, "addObjectsFromArray:");

        objc_storeStrong(&v103, 0);
        objc_storeStrong(&v104, 0);
      }
      v56 = (id)objc_msgSend(location[0], "detail");

      if (v56)
      {
        v102 = objc_alloc_init(MEMORY[0x24BDF6B68]);
        objc_msgSend(v102, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v102, "setNumberOfLines:");
        objc_msgSend(v102, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v102, "setIsAccessibilityElement:", 0);
        v38 = (id)objc_msgSend(*(id *)(a1 + 32), "traitCollection");
        if (objc_msgSend(v38, "layoutDirection"))
          v7 = 0;
        else
          v7 = 2;
        objc_msgSend(v102, "setTextAlignment:", v7);

        v39 = (id)objc_msgSend(location[0], "detail");
        objc_msgSend(v102, "setText:");

        v101 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        objc_msgSend(v102, "setFont:", v101);
        v40 = v102;
        v41 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        objc_msgSend(v40, "setTextColor:");

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v102);
        objc_storeStrong(&v105, v102);
        objc_msgSend(v107, "addSubview:", v102);
        v42 = *(void **)(a1 + 40);
        v55 = (id)objc_msgSend(v102, "leadingAnchor");
        v54 = (id)objc_msgSend(v107, "centerXAnchor");
        v53 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
        v124[0] = v53;
        v52 = (id)objc_msgSend(v102, "topAnchor");
        v51 = (id)objc_msgSend(v107, "topAnchor");
        v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
        v124[1] = v50;
        v49 = (id)objc_msgSend(v102, "lastBaselineAnchor");
        v48 = (id)objc_msgSend(v107, "bottomAnchor");
        v47 = (id)objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:");
        v124[2] = v47;
        v46 = (id)objc_msgSend(v102, "trailingAnchor");
        v45 = (id)objc_msgSend(v107, "trailingAnchor");
        v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
        v124[3] = v44;
        v43 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 4);
        objc_msgSend(v42, "addObjectsFromArray:");

        objc_storeStrong(&v101, 0);
        objc_storeStrong(&v102, 0);
      }
      if (v118[0])
      {
        if (!v106 || v105)
        {
          if (v106 && v105)
          {
            v19 = *(void **)(a1 + 40);
            v29 = (id)objc_msgSend(v118[0], "topAnchor");
            v28 = (id)objc_msgSend(v106, "bottomAnchor");
            v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
            v122[0] = v27;
            v26 = (id)objc_msgSend(v118[0], "leadingAnchor");
            v25 = (id)objc_msgSend(v107, "leadingAnchor");
            v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
            v122[1] = v24;
            v23 = (id)objc_msgSend(v118[0], "bottomAnchor");
            v22 = (id)objc_msgSend(v107, "bottomAnchor");
            v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
            v122[2] = v21;
            v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 3);
            objc_msgSend(v19, "addObjectsFromArray:");

          }
          else
          {
            v11 = *(void **)(a1 + 40);
            v18 = (id)objc_msgSend(v118[0], "centerYAnchor");
            v17 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "centerYAnchor");
            v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
            v121[0] = v16;
            v15 = (id)objc_msgSend(v118[0], "leadingAnchor");
            v14 = (id)objc_msgSend(v107, "leadingAnchor");
            v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
            v121[1] = v13;
            v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 2);
            objc_msgSend(v11, "addObjectsFromArray:");

          }
        }
        else
        {
          v30 = *(void **)(a1 + 40);
          v37 = (id)objc_msgSend(v118[0], "centerYAnchor");
          v36 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "centerYAnchor");
          v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
          v123[0] = v35;
          v34 = (id)objc_msgSend(v118[0], "trailingAnchor");
          v33 = (id)objc_msgSend(v107, "trailingAnchor");
          v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
          v123[1] = v32;
          v31 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v123, 2);
          objc_msgSend(v30, "addObjectsFromArray:");

        }
        objc_msgSend(v107, "addSubview:", v118[0]);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v107);
      v10 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
      objc_msgSend(v10, "addArrangedSubview:", v107);

      if (v119 < *(_QWORD *)(a1 + 56) - 1)
      {
        v8 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v8, "setCustomSpacing:afterView:", v107, 10.0);

        v100 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
        v9 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v9, "addArrangedSubview:", v100);

        objc_storeStrong(&v100, 0);
      }
      objc_storeStrong(&v105, 0);
      objc_storeStrong(&v106, 0);
      objc_storeStrong(&v107, 0);
    }
  }
  else
  {
    v91 = (id)objc_msgSend(location[0], "title");
    v115 = 0;
    v92 = 1;
    if (!objc_msgSend(v91, "length"))
    {
      v116 = (id)objc_msgSend(location[0], "detail");
      v115 = 1;
      v92 = 1;
      if (!objc_msgSend(v116, "length"))
        v92 = v118[0] != 0;
    }
    if ((v115 & 1) != 0)

    if (v92)
    {
      v90 = (id)objc_msgSend(location[0], "title");

      if (v90)
      {
        v114 = objc_alloc_init(MEMORY[0x24BDF6B68]);
        objc_msgSend(v114, "setNumberOfLines:", 2);
        objc_msgSend(v114, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v114, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v114, "setIsAccessibilityElement:", 0);
        v86 = (id)objc_msgSend(location[0], "title");
        objc_msgSend(v114, "setText:");

        v113 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        objc_msgSend(v114, "setFont:", v113);
        v87 = v114;
        v88 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
        objc_msgSend(v87, "setTextColor:");

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v114);
        v89 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v89, "addArrangedSubview:", v114);

        objc_storeStrong(&v113, 0);
        objc_storeStrong(&v114, 0);
      }
      v85 = (id)objc_msgSend(location[0], "detail");

      if (v85)
      {
        v112 = objc_alloc_init(MEMORY[0x24BDF6B68]);
        objc_msgSend(v112, "setNumberOfLines:", 2);
        objc_msgSend(v112, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v112, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v112, "setIsAccessibilityElement:", 0);
        v81 = (id)objc_msgSend(location[0], "detail");
        objc_msgSend(v112, "setText:");

        v111 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        objc_msgSend(v112, "setFont:", v111);
        v82 = v112;
        v83 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        objc_msgSend(v82, "setTextColor:");

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v112);
        v84 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v84, "addArrangedSubview:", v112);

        objc_storeStrong(&v111, 0);
        objc_storeStrong(&v112, 0);
      }
      if (v118[0])
      {
        v79 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v79, "setCustomSpacing:afterView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 8.0);

        v80 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v80, "addArrangedSubview:", v118[0]);

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v118[0]);
      }
      if (v119 < *(_QWORD *)(a1 + 56) - 1)
      {
        v77 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v77, "setCustomSpacing:afterView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 10.0);

        v110 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
        v78 = (id)objc_msgSend(*(id *)(a1 + 32), "itemStackView");
        objc_msgSend(v78, "addArrangedSubview:", v110);

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v110);
        objc_storeStrong(&v110, 0);
      }
    }
  }
  objc_storeStrong(v118, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateHairline
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  UIStackView *v18;
  UIStackView *v19;
  id v20;
  UIVisualEffectView *v21;
  UIVisualEffectView *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect rect2;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;

  v20 = (id)-[CPSInformationEntityViewController view](self, "view");
  v19 = -[CPSInformationEntityViewController itemStackView](self, "itemStackView");
  -[UIStackView bounds](v19, "bounds");
  v29 = v2;
  v30 = v3;
  v31 = v4;
  v32 = v5;
  v18 = -[CPSInformationEntityViewController itemStackView](self, "itemStackView");
  objc_msgSend(v20, "convertRect:fromView:", v29, v30, v31, v32);
  v33.origin.x = v6;
  v33.origin.y = v7;
  v33.size.width = v8;
  v33.size.height = v9;

  v23 = (id)-[CPSInformationEntityViewController view](self, "view");
  v22 = -[CPSInformationEntityViewController visualEffectView](self, "visualEffectView");
  -[UIVisualEffectView bounds](v22, "bounds");
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v21 = -[CPSInformationEntityViewController visualEffectView](self, "visualEffectView");
  objc_msgSend(v23, "convertRect:fromView:", v24, v25, v26, v27);
  rect2.origin.x = v14;
  rect2.origin.y = v15;
  rect2.size.width = v16;
  rect2.size.height = v17;

  -[CPSInformationEntityViewController _setHairlineHidden:](self, "_setHairlineHidden:", !CGRectIntersectsRect(v33, rect2));
}

- (void)_setHairlineHidden:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29[5];
  id v30;
  id v31;
  BOOL v32;
  SEL v33;
  CPSInformationEntityViewController *v34;

  v34 = self;
  v33 = a2;
  v32 = a3;
  v31 = -[CPSInformationEntityViewController hairlineView](self, "hairlineView");
  if (!v32 || (objc_msgSend(v31, "isHidden") & 1) != 0)
  {
    if (!v32 && (objc_msgSend(v31, "isHidden") & 1) != 0)
    {
      objc_msgSend(v31, "setHidden:", v32);
      objc_msgSend(v31, "setAlpha:", 0.0);
      v7 = (void *)MEMORY[0x24BDF6F90];
      v12 = MEMORY[0x24BDAC760];
      v13 = -1073741824;
      v14 = 0;
      v15 = __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_3;
      v16 = &unk_24E26F1B8;
      v17 = v31;
      objc_msgSend(v7, "animateWithDuration:animations:completion:", &v12, &__block_literal_global_15, 0.25);
      objc_storeStrong(&v17, 0);
    }
  }
  else
  {
    objc_msgSend(v31, "setHidden:", v32);
    v30 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
    v8 = (id)-[CPSInformationEntityViewController view](v34, "view");
    objc_msgSend(v8, "addSubview:", v30);

    v9 = v30;
    objc_msgSend(v31, "frame");
    v29[1] = v3;
    v29[2] = v4;
    v29[3] = v5;
    v29[4] = v6;
    objc_msgSend(v9, "setFrame:", *(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
    objc_msgSend(v30, "setAlpha:", 1.0);
    v11 = (void *)MEMORY[0x24BDF6F90];
    v10 = MEMORY[0x24BDAC760];
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke;
    v28 = &unk_24E26F1B8;
    v29[0] = v30;
    v18 = v10;
    v19 = -1073741824;
    v20 = 0;
    v21 = __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_2;
    v22 = &unk_24E26F168;
    v23 = v30;
    objc_msgSend(v11, "animateWithDuration:animations:completion:", &v24, &v18, 0.25);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(v29, 0);
    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(&v31, 0);
}

uint64_t __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

uint64_t __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

- (void)scrollViewContentSizeChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CPSInformationTemplateFocusableView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *v18;
  CPSInformationScrollView *v19;
  CPSInformationScrollView *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double Height;
  CPSInformationScrollView *v27;
  double v28;
  double v29;
  CPSInformationScrollView *v30;
  double v31;
  CPSInformationScrollView *v32;
  NSMutableArray *obj;
  uint64_t v34;
  int v35;
  BOOL v36;
  id v37;
  double v38;
  id v39;
  double v40;
  _QWORD __b[8];
  id v42;
  BOOL v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  CGRect v55;
  double v56;
  id location[2];
  CPSInformationEntityViewController *v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;

  v60 = *MEMORY[0x24BDAC8D0];
  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = -[CPSInformationEntityViewController scrollView](v58, "scrollView");
  -[CPSInformationScrollView bounds](v27, "bounds");
  v55 = v61;
  Height = CGRectGetHeight(v61);
  objc_msgSend(location[0], "contentInset");
  v51 = v3;
  v52 = v4;
  v53 = v5;
  v54 = v6;
  v28 = Height - v5;
  objc_msgSend(location[0], "contentInset");
  v47 = v7;
  v48 = v8;
  v49 = v9;
  v50 = v10;
  v29 = v28 - v7;

  v56 = v29;
  v30 = -[CPSInformationEntityViewController scrollView](v58, "scrollView");
  -[CPSInformationScrollView contentSize](v30, "contentSize");
  v44 = v11;
  v45 = v12;
  v31 = v12;

  v46 = v31;
  v43 = v31 > v29;
  memset(__b, 0, sizeof(__b));
  v32 = -[CPSInformationEntityViewController scrollView](v58, "scrollView");
  obj = -[CPSInformationScrollView focusWaypoints](v32, "focusWaypoints");

  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
  if (v34)
  {
    v23 = *(_QWORD *)__b[2];
    v24 = 0;
    v25 = v34;
    while (1)
    {
      v22 = v24;
      if (*(_QWORD *)__b[2] != v23)
        objc_enumerationMutation(obj);
      v42 = *(id *)(__b[1] + 8 * v24);
      objc_msgSend(v42, "removeFromSuperview");
      ++v24;
      if (v22 + 1 >= v25)
      {
        v24 = 0;
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
        if (!v25)
          break;
      }
    }
  }

  v21 = (id)objc_opt_new();
  v20 = -[CPSInformationEntityViewController scrollView](v58, "scrollView");
  -[CPSInformationScrollView setFocusWaypoints:](v20, "setFocusWaypoints:", v21);

  if (v43)
  {
    v40 = v56;
    v39 = -[CPSInformationEntityViewController itemStackView](v58, "itemStackView");
    v38 = 0.0;
    do
    {
      if (v38 > v46)
        break;
      v13 = [CPSInformationTemplateFocusableView alloc];
      v37 = -[CPSInformationTemplateFocusableView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      CGRectMake_5();
      objc_msgSend(v37, "setFrame:", v14, v15, v16, v17);
      objc_msgSend(v39, "addSubview:", v37);
      v19 = -[CPSInformationEntityViewController scrollView](v58, "scrollView");
      v18 = -[CPSInformationScrollView focusWaypoints](v19, "focusWaypoints");
      -[NSMutableArray addObject:](v18, "addObject:", v37);

      v36 = vabdd_f64(v38, v46) < 0.00000011920929;
      v38 = CGFloatMin(v38 + v40, v46);
      v35 = v36 ? 5 : 0;
      objc_storeStrong(&v37, 0);
    }
    while (!v35);
    objc_storeStrong(&v39, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id location[2];
  CPSInformationEntityViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSInformationEntityViewController _updateHairline](v4, "_updateHairline");
  objc_storeStrong(location, 0);
}

- (void)_scrollViewAccessoryInsetsDidChange:(id)a3
{
  id location[2];
  CPSInformationEntityViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSInformationEntityViewController _updateCenteringGuideConstraints](v4, "_updateCenteringGuideConstraints");
  -[CPSInformationEntityViewController _updateScrollViewInsets](v4, "_updateScrollViewInsets");
  objc_storeStrong(location, 0);
}

- (void)_updateScrollViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  UIVisualEffectView *v10;
  id v11;
  CPSInformationScrollView *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v7 = (id)-[CPSInformationEntityViewController view](self, "view");
  v6 = (id)objc_msgSend(v7, "safeAreaLayoutGuide");
  objc_msgSend(v6, "layoutFrame");

  v10 = -[CPSInformationEntityViewController visualEffectView](self, "visualEffectView");
  -[UIVisualEffectView frame](v10, "frame");
  v9 = (id)-[CPSInformationEntityViewController view](self, "view");
  v8 = (id)objc_msgSend(v9, "safeAreaLayoutGuide");
  objc_msgSend(v8, "layoutFrame");

  v11 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  objc_msgSend(v11, "descender");
  UIEdgeInsetsMake_2();
  v13 = v2;
  v14 = v3;
  v15 = v4;
  v16 = v5;

  v12 = -[CPSInformationEntityViewController scrollView](self, "scrollView");
  -[CPSInformationScrollView setContentInset:](v12, "setContentInset:", v13, v14, v15, v16);

}

- (CPSInformationTemplateButtonsViewController)buttonsViewController
{
  return self->_buttonsViewController;
}

- (void)setButtonsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsViewController, a3);
}

- (CPSInformationScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIStackView)itemStackView
{
  return self->_itemStackView;
}

- (void)setItemStackView:(id)a3
{
  objc_storeStrong((id *)&self->_itemStackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSArray)centeringGuideConstraints
{
  return self->_centeringGuideConstraints;
}

- (void)setCenteringGuideConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_centeringGuideConstraints, a3);
}

- (UILayoutGuide)centeringGuide
{
  return self->_centeringGuide;
}

- (void)setCenteringGuide:(id)a3
{
  objc_storeStrong((id *)&self->_centeringGuide, a3);
}

- (NSLayoutConstraint)itemStackViewLeadingConstraint
{
  return self->_itemStackViewLeadingConstraint;
}

- (void)setItemStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_itemStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)itemStackViewWidthConstraint
{
  return self->_itemStackViewWidthConstraint;
}

- (void)setItemStackViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_itemStackViewWidthConstraint, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (CPSHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_itemStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_itemStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_centeringGuide, 0);
  objc_storeStrong((id *)&self->_centeringGuideConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_itemStackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonsViewController, 0);
}

@end
