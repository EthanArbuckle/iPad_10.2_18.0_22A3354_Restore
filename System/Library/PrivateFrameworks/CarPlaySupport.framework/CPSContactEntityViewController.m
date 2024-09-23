@implementation CPSContactEntityViewController

- (CPSContactEntityViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  CPSContactEntityViewController *v4;
  CPSAvatarViewController *v5;
  uint64_t v6;
  CPSAvatarViewController *avatarViewController;
  CPSNameViewController *v8;
  uint64_t v9;
  CPSNameViewController *nameViewController;
  CPSActionsViewController *v11;
  uint64_t v12;
  CPSActionsViewController *actionsController;
  CPSContactEntityViewController *v15;
  CPSContactEntityViewController *v17;
  objc_super v18;
  id v19;
  id location[2];
  CPSContactEntityViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v4 = v21;
  v21 = 0;
  v18.receiver = v4;
  v18.super_class = (Class)CPSContactEntityViewController;
  v17 = -[CPSBaseEntityContentViewController initWithEntity:resourceProvider:](&v18, sel_initWithEntity_resourceProvider_, location[0], v19);
  v21 = v17;
  objc_storeStrong((id *)&v21, v17);
  if (v17)
  {
    v5 = [CPSAvatarViewController alloc];
    v6 = -[CPSAvatarViewController initWithEntity:](v5, "initWithEntity:", location[0]);
    avatarViewController = v21->_avatarViewController;
    v21->_avatarViewController = (CPSAvatarViewController *)v6;

    v8 = [CPSNameViewController alloc];
    v9 = -[CPSNameViewController initWithEntity:](v8, "initWithEntity:", location[0]);
    nameViewController = v21->_nameViewController;
    v21->_nameViewController = (CPSNameViewController *)v9;

    v11 = [CPSActionsViewController alloc];
    v12 = -[CPSActionsViewController initWithEntity:layoutDelete:](v11, "initWithEntity:layoutDelete:", location[0], v21);
    actionsController = v21->_actionsController;
    v21->_actionsController = (CPSActionsViewController *)v12;

    -[CPSActionsViewController setEventDelegate:](v21->_actionsController, "setEventDelegate:", v21);
  }
  v15 = v21;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v15;
}

- (id)personEntity
{
  return -[CPSBaseEntityContentViewController entity](self, "entity", a2, self);
}

- (void)didUpdateEntity:(id)a3
{
  CPSAvatarViewController *avatarViewController;
  CPEntity *v4;
  CPSNameViewController *nameViewController;
  CPEntity *v6;
  CPSActionsViewController *actionsController;
  CPEntity *v8;
  objc_super v9;
  id location[2];
  CPSContactEntityViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)CPSContactEntityViewController;
  -[CPSBaseEntityContentViewController didUpdateEntity:](&v9, sel_didUpdateEntity_, location[0]);
  avatarViewController = v11->_avatarViewController;
  v4 = -[CPSBaseEntityContentViewController entity](v11, "entity");
  -[CPSAvatarViewController updateWithEntity:](avatarViewController, "updateWithEntity:");

  nameViewController = v11->_nameViewController;
  v6 = -[CPSBaseEntityContentViewController entity](v11, "entity");
  -[CPSNameViewController updateWithEntity:](nameViewController, "updateWithEntity:");

  actionsController = v11->_actionsController;
  v8 = -[CPSBaseEntityContentViewController entity](v11, "entity");
  -[CPSActionsViewController updateWithEntity:](actionsController, "updateWithEntity:");

  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSContactEntityViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSContactEntityViewController;
  -[CPSContactEntityViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSContactEntityViewController setupViewControllers](v4, "setupViewControllers");
}

- (void)setupViewControllers
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  CPSActionsViewController *v11;
  CPSNameViewController *v12;
  CPSAvatarViewController *v13;
  id obj;
  uint64_t v15;
  _QWORD __b[8];
  id v17;
  id location[2];
  CPSContactEntityViewController *v19;
  _BYTE v20[128];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v19 = self;
  location[1] = (id)a2;
  v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v9 = (id)-[CPSContactEntityViewController view](v19, "view");
  objc_msgSend(v9, "setBackgroundColor:", v10);

  v13 = -[CPSContactEntityViewController avatarViewController](v19, "avatarViewController");
  v21[0] = v13;
  v12 = -[CPSContactEntityViewController nameViewController](v19, "nameViewController");
  v21[1] = v12;
  v11 = -[CPSContactEntityViewController actionsController](v19, "actionsController");
  v21[2] = v11;
  location[0] = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);

  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
  if (v15)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v15;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v17 = *(id *)(__b[1] + 8 * v7);
      v2 = (id)objc_msgSend(v17, "view");
      objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(v17, "willMoveToParentViewController:", v19);
      -[CPSContactEntityViewController addChildViewController:](v19, "addChildViewController:", v17);
      v4 = (id)-[CPSContactEntityViewController view](v19, "view");
      v3 = (id)objc_msgSend(v17, "view");
      objc_msgSend(v4, "addSubview:");

      objc_msgSend(v17, "didMoveToParentViewController:", v19);
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
        if (!v8)
          break;
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSContactEntityViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSContactEntityViewController;
  -[CPSContactEntityViewController traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSContactEntityViewController resetLayoutConstraints](v5, "resetLayoutConstraints");
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  void *v2;
  NSArray *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;

  v5 = -[CPSContactEntityViewController layoutConstraints](self, "layoutConstraints");
  v6 = -[NSArray count](v5, "count");

  if (v6)
  {
    v2 = (void *)MEMORY[0x24BDD1628];
    v3 = -[CPSContactEntityViewController layoutConstraints](self, "layoutConstraints");
    objc_msgSend(v2, "deactivateConstraints:");

    -[CPSContactEntityViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
    v4 = (id)-[CPSContactEntityViewController view](self, "view");
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  NSArray *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  CPSContactEntityViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSContactEntityViewController;
  -[CPSContactEntityViewController updateViewConstraints](&v4, sel_updateViewConstraints);
  v2 = -[CPSContactEntityViewController layoutConstraints](v6, "layoutConstraints");
  v3 = -[NSArray count](v2, "count") != 0;

  if (!v3)
  {
    -[CPSContactEntityViewController setupLayoutGuides](v6, "setupLayoutGuides");
    -[CPSContactEntityViewController setupLayoutConstraints](v6, "setupLayoutConstraints");
  }
}

- (void)setupLayoutConstraints
{
  id v2;
  id v3;
  id v4;
  id v5;
  NSLayoutXAxisAnchor *v6;
  UILayoutGuide *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSLayoutXAxisAnchor *v12;
  UILayoutGuide *v13;
  id v14;
  id v15;
  id v16;
  CPSActionsViewController *v17;
  NSLayoutYAxisAnchor *v18;
  UILayoutGuide *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSLayoutYAxisAnchor *v24;
  UILayoutGuide *v25;
  id v26;
  NSLayoutYAxisAnchor *v27;
  UILayoutGuide *v28;
  NSLayoutYAxisAnchor *v29;
  UILayoutGuide *v30;
  id v31;
  NSLayoutYAxisAnchor *v32;
  UILayoutGuide *v33;
  NSLayoutYAxisAnchor *v34;
  UILayoutGuide *v35;
  id v36;
  NSLayoutXAxisAnchor *v37;
  UILayoutGuide *v38;
  NSLayoutXAxisAnchor *v39;
  UILayoutGuide *v40;
  id v41;
  NSLayoutXAxisAnchor *v42;
  UILayoutGuide *v43;
  NSLayoutXAxisAnchor *v44;
  UILayoutGuide *v45;
  id v46;
  NSLayoutXAxisAnchor *v47;
  UILayoutGuide *v48;
  NSLayoutXAxisAnchor *v49;
  UILayoutGuide *v50;
  id v51;
  NSLayoutYAxisAnchor *v52;
  UILayoutGuide *v53;
  NSLayoutYAxisAnchor *v54;
  UILayoutGuide *v55;
  id v56;
  id v57;
  id v58;
  CPSActionsViewController *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  CPSActionsViewController *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  CPSActionsViewController *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  CPSActionsViewController *v80;
  id v81;
  NSLayoutXAxisAnchor *v82;
  UILayoutGuide *v83;
  id v84;
  id v85;
  CPSNameViewController *v86;
  id v87;
  id v88;
  id v89;
  CPSAvatarViewController *v90;
  id v91;
  id v92;
  CPSNameViewController *v93;
  id v94;
  NSLayoutYAxisAnchor *v95;
  UILayoutGuide *v96;
  id v97;
  id v98;
  CPSNameViewController *v99;
  id v100;
  id v101;
  id v102;
  CPSAvatarViewController *v103;
  id v104;
  id v105;
  id v106;
  CPSAvatarViewController *v107;
  id v108;
  NSLayoutXAxisAnchor *v109;
  UILayoutGuide *v110;
  id v111;
  id v112;
  CPSAvatarViewController *v113;
  id v114;
  NSLayoutYAxisAnchor *v115;
  UILayoutGuide *v116;
  id v117;
  id v118;
  CPSAvatarViewController *v119;
  id v120;
  void *v121;
  NSArray *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128[2];
  CPSContactEntityViewController *v129;
  _QWORD v130[4];
  _QWORD v131[3];
  _QWORD v132[4];
  _QWORD v133[6];
  _QWORD v134[5];

  v134[4] = *MEMORY[0x24BDAC8D0];
  v129 = self;
  v128[1] = (id)a2;
  v128[0] = (id)objc_opt_new();
  v25 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v24 = -[UILayoutGuide topAnchor](v25, "topAnchor");
  v23 = (id)-[CPSContactEntityViewController view](v129, "view");
  v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
  v21 = (id)objc_msgSend(v22, "topAnchor");
  v20 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v24, "constraintEqualToAnchor:");
  v134[0] = v20;
  v19 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v18 = -[UILayoutGuide bottomAnchor](v19, "bottomAnchor");
  v17 = -[CPSContactEntityViewController actionsController](v129, "actionsController");
  v16 = (id)-[CPSActionsViewController view](v17, "view");
  v15 = (id)objc_msgSend(v16, "topAnchor");
  v14 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v18, "constraintEqualToAnchor:");
  v134[1] = v14;
  v13 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v12 = -[UILayoutGuide leftAnchor](v13, "leftAnchor");
  v11 = (id)-[CPSContactEntityViewController view](v129, "view");
  v10 = (id)objc_msgSend(v11, "safeAreaLayoutGuide");
  v9 = (id)objc_msgSend(v10, "leftAnchor");
  v8 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v12, "constraintEqualToAnchor:");
  v134[2] = v8;
  v7 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v6 = -[UILayoutGuide rightAnchor](v7, "rightAnchor");
  v5 = (id)-[CPSContactEntityViewController view](v129, "view");
  v4 = (id)objc_msgSend(v5, "safeAreaLayoutGuide");
  v3 = (id)objc_msgSend(v4, "rightAnchor");
  v2 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v6, "constraintEqualToAnchor:");
  v134[3] = v2;
  v127 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134);

  v55 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v54 = -[UILayoutGuide centerYAnchor](v55, "centerYAnchor");
  v53 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v52 = -[UILayoutGuide centerYAnchor](v53, "centerYAnchor");
  v51 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v54, "constraintEqualToAnchor:");
  v133[0] = v51;
  v50 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v49 = -[UILayoutGuide centerXAnchor](v50, "centerXAnchor");
  v48 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v47 = -[UILayoutGuide centerXAnchor](v48, "centerXAnchor");
  v46 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v49, "constraintEqualToAnchor:");
  v133[1] = v46;
  v45 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v44 = -[UILayoutGuide leftAnchor](v45, "leftAnchor");
  v43 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v42 = -[UILayoutGuide leftAnchor](v43, "leftAnchor");
  v41 = (id)-[NSLayoutXAxisAnchor constraintGreaterThanOrEqualToAnchor:](v44, "constraintGreaterThanOrEqualToAnchor:");
  v133[2] = v41;
  v40 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v39 = -[UILayoutGuide rightAnchor](v40, "rightAnchor");
  v38 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v37 = -[UILayoutGuide rightAnchor](v38, "rightAnchor");
  v36 = (id)-[NSLayoutXAxisAnchor constraintLessThanOrEqualToAnchor:](v39, "constraintLessThanOrEqualToAnchor:");
  v133[3] = v36;
  v35 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v34 = -[UILayoutGuide topAnchor](v35, "topAnchor");
  v33 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v32 = -[UILayoutGuide topAnchor](v33, "topAnchor");
  v31 = (id)-[NSLayoutYAxisAnchor constraintGreaterThanOrEqualToAnchor:](v34, "constraintGreaterThanOrEqualToAnchor:");
  v133[4] = v31;
  v30 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v29 = -[UILayoutGuide bottomAnchor](v30, "bottomAnchor");
  v28 = -[CPSContactEntityViewController centeringLayoutGuide](v129, "centeringLayoutGuide");
  v27 = -[UILayoutGuide bottomAnchor](v28, "bottomAnchor");
  v26 = (id)-[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:](v29, "constraintLessThanOrEqualToAnchor:");
  v133[5] = v26;
  v126 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v133, 6);

  v80 = -[CPSContactEntityViewController actionsController](v129, "actionsController");
  v79 = (id)-[CPSActionsViewController view](v80, "view");
  v78 = (id)objc_msgSend(v79, "leadingAnchor");
  v77 = (id)-[CPSContactEntityViewController view](v129, "view");
  v76 = (id)objc_msgSend(v77, "safeAreaLayoutGuide");
  v75 = (id)objc_msgSend(v76, "leadingAnchor");
  v74 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
  v132[0] = v74;
  v73 = -[CPSContactEntityViewController actionsController](v129, "actionsController");
  v72 = (id)-[CPSActionsViewController view](v73, "view");
  v71 = (id)objc_msgSend(v72, "trailingAnchor");
  v70 = (id)-[CPSContactEntityViewController view](v129, "view");
  v69 = (id)objc_msgSend(v70, "safeAreaLayoutGuide");
  v68 = (id)objc_msgSend(v69, "trailingAnchor");
  v67 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
  v132[1] = v67;
  v66 = -[CPSContactEntityViewController actionsController](v129, "actionsController");
  v65 = (id)-[CPSActionsViewController view](v66, "view");
  v64 = (id)objc_msgSend(v65, "bottomAnchor");
  v63 = (id)-[CPSContactEntityViewController view](v129, "view");
  v62 = (id)objc_msgSend(v63, "safeAreaLayoutGuide");
  v61 = (id)objc_msgSend(v62, "bottomAnchor");
  v60 = (id)objc_msgSend(v64, "constraintEqualToAnchor:constant:", -12.0);
  v132[2] = v60;
  v59 = -[CPSContactEntityViewController actionsController](v129, "actionsController");
  v58 = (id)-[CPSActionsViewController view](v59, "view");
  v57 = (id)objc_msgSend(v58, "heightAnchor");
  v56 = (id)objc_msgSend(v57, "constraintEqualToConstant:", 69.0);
  v132[3] = v56;
  v125 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v132, 4);

  v99 = -[CPSContactEntityViewController nameViewController](v129, "nameViewController");
  v98 = (id)-[CPSNameViewController view](v99, "view");
  v97 = (id)objc_msgSend(v98, "centerYAnchor");
  v96 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v95 = -[UILayoutGuide centerYAnchor](v96, "centerYAnchor");
  v94 = (id)objc_msgSend(v97, "constraintEqualToAnchor:");
  v131[0] = v94;
  v93 = -[CPSContactEntityViewController nameViewController](v129, "nameViewController");
  v92 = (id)-[CPSNameViewController view](v93, "view");
  v91 = (id)objc_msgSend(v92, "leadingAnchor");
  v90 = -[CPSContactEntityViewController avatarViewController](v129, "avatarViewController");
  v89 = (id)-[CPSAvatarViewController view](v90, "view");
  v88 = (id)objc_msgSend(v89, "trailingAnchor");
  v87 = (id)objc_msgSend(v91, "constraintEqualToAnchor:constant:", 12.0);
  v131[1] = v87;
  v86 = -[CPSContactEntityViewController nameViewController](v129, "nameViewController");
  v85 = (id)-[CPSNameViewController view](v86, "view");
  v84 = (id)objc_msgSend(v85, "trailingAnchor");
  v83 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v82 = -[UILayoutGuide trailingAnchor](v83, "trailingAnchor");
  v81 = (id)objc_msgSend(v84, "constraintEqualToAnchor:");
  v131[2] = v81;
  v124 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v131, 3);

  v119 = -[CPSContactEntityViewController avatarViewController](v129, "avatarViewController");
  v118 = (id)-[CPSAvatarViewController view](v119, "view");
  v117 = (id)objc_msgSend(v118, "centerYAnchor");
  v116 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v115 = -[UILayoutGuide centerYAnchor](v116, "centerYAnchor");
  v114 = (id)objc_msgSend(v117, "constraintEqualToAnchor:");
  v130[0] = v114;
  v113 = -[CPSContactEntityViewController avatarViewController](v129, "avatarViewController");
  v112 = (id)-[CPSAvatarViewController view](v113, "view");
  v111 = (id)objc_msgSend(v112, "leadingAnchor");
  v110 = -[CPSContactEntityViewController avatarAndDetailsLayoutGuide](v129, "avatarAndDetailsLayoutGuide");
  v109 = -[UILayoutGuide leadingAnchor](v110, "leadingAnchor");
  v108 = (id)objc_msgSend(v111, "constraintEqualToAnchor:");
  v130[1] = v108;
  v107 = -[CPSContactEntityViewController avatarViewController](v129, "avatarViewController");
  v106 = (id)-[CPSAvatarViewController view](v107, "view");
  v105 = (id)objc_msgSend(v106, "widthAnchor");
  v104 = (id)objc_msgSend(v105, "constraintEqualToConstant:", *(double *)&CPSAvatarSize);
  v130[2] = v104;
  v103 = -[CPSContactEntityViewController avatarViewController](v129, "avatarViewController");
  v102 = (id)-[CPSAvatarViewController view](v103, "view");
  v101 = (id)objc_msgSend(v102, "heightAnchor");
  v100 = (id)objc_msgSend(v101, "constraintEqualToConstant:", *(double *)&CPSAvatarSize);
  v130[3] = v100;
  v123 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v130, 4);

  objc_msgSend(v128[0], "addObjectsFromArray:", v127);
  objc_msgSend(v128[0], "addObjectsFromArray:", v126);
  objc_msgSend(v128[0], "addObjectsFromArray:", v123);
  objc_msgSend(v128[0], "addObjectsFromArray:", v124);
  objc_msgSend(v128[0], "addObjectsFromArray:", v125);
  v120 = (id)objc_msgSend(v128[0], "copy");
  -[CPSContactEntityViewController setLayoutConstraints:](v129, "setLayoutConstraints:");

  v121 = (void *)MEMORY[0x24BDD1628];
  v122 = -[CPSContactEntityViewController layoutConstraints](v129, "layoutConstraints");
  objc_msgSend(v121, "activateConstraints:");

  objc_storeStrong(&v123, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(&v126, 0);
  objc_storeStrong(&v127, 0);
  objc_storeStrong(v128, 0);
}

- (void)setupLayoutGuides
{
  id v2;
  id v3;
  id v4;
  id v5[2];
  CPSContactEntityViewController *v6;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = objc_alloc_init(MEMORY[0x24BDF6B78]);
  v2 = (id)-[CPSContactEntityViewController view](v6, "view");
  objc_msgSend(v2, "addLayoutGuide:", v5[0]);

  -[CPSContactEntityViewController setCenteringLayoutGuide:](v6, "setCenteringLayoutGuide:", v5[0]);
  v4 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  v3 = (id)-[CPSContactEntityViewController view](v6, "view");
  objc_msgSend(v3, "addLayoutGuide:", v4);

  -[CPSContactEntityViewController setAvatarAndDetailsLayoutGuide:](v6, "setAvatarAndDetailsLayoutGuide:", v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
}

- (BOOL)buttonsShouldFill
{
  return 1;
}

- (void)configureButton:(id)a3
{
  id v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  objc_msgSend(v3, "setTitleColor:forState:");

  objc_storeStrong(location, 0);
}

- (CPSAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (CPSNameViewController)nameViewController
{
  return self->_nameViewController;
}

- (CPSActionsViewController)actionsController
{
  return self->_actionsController;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (UILayoutGuide)centeringLayoutGuide
{
  return self->_centeringLayoutGuide;
}

- (void)setCenteringLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_centeringLayoutGuide, a3);
}

- (UILayoutGuide)avatarAndDetailsLayoutGuide
{
  return self->_avatarAndDetailsLayoutGuide;
}

- (void)setAvatarAndDetailsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_avatarAndDetailsLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarAndDetailsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_centeringLayoutGuide, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_nameViewController, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end
