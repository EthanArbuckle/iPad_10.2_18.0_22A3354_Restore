@implementation CNStarkCardViewController

- (CNStarkCardViewController)init
{
  CNStarkCardViewController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNStarkCardViewController)initWithCoder:(id)a3
{
  id v4;
  CNStarkCardViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNInitializerUnavailableException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNStarkCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CNStarkCardViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNInitializerUnavailableException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (CNStarkCardViewController)initWithContact:(id)a3 displayedContactProperties:(id)a4
{
  id v7;
  id v8;
  CNStarkCardViewController *v9;
  CNAvatarViewController *v10;
  void *v11;
  uint64_t v12;
  CNAvatarViewController *avatarViewController;
  CNStarkContactInfoViewController *v14;
  CNStarkContactInfoViewController *contactInfoViewController;
  CNStarkActionsController *v16;
  CNStarkActionsController *actionsController;
  CNStarkCardViewController *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CNStarkCardViewController;
  v9 = -[CNStarkCardViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    v10 = [CNAvatarViewController alloc];
    +[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNAvatarViewController initWithSettings:](v10, "initWithSettings:", v11);
    avatarViewController = v9->_avatarViewController;
    v9->_avatarViewController = (CNAvatarViewController *)v12;

    v14 = -[CNStarkContactInfoViewController initWithContact:]([CNStarkContactInfoViewController alloc], "initWithContact:", v7);
    contactInfoViewController = v9->_contactInfoViewController;
    v9->_contactInfoViewController = v14;

    v16 = -[CNStarkActionsController initWithContact:]([CNStarkActionsController alloc], "initWithContact:", v7);
    actionsController = v9->_actionsController;
    v9->_actionsController = v16;

    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v9->_displayedContactProperties, a4);
    v18 = v9;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkCardViewController;
  -[CNStarkCardViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[CNStarkCardViewController setupViewControllers](self, "setupViewControllers");
  -[CNStarkCardViewController setupLayoutGuides](self, "setupLayoutGuides");
  -[CNStarkCardViewController updateViewControllers](self, "updateViewControllers");
  -[CNStarkCardViewController updateNavigationItems](self, "updateNavigationItems");
  +[CNUIColorRepository carPlayTableViewBackgroundColor](CNUIColorRepository, "carPlayTableViewBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)setupViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  id v20;

  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController addChildViewController:](self, "addChildViewController:", v3);

  -[CNStarkCardViewController contactInfoViewController](self, "contactInfoViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController addChildViewController:](self, "addChildViewController:", v4);

  -[CNStarkCardViewController actionsController](self, "actionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController addChildViewController:](self, "addChildViewController:", v5);

  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkCardViewController contactInfoViewController](self, "contactInfoViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkCardViewController actionsController](self, "actionsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkCardViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v14);

  -[CNStarkCardViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController contactInfoViewController](self, "contactInfoViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v17);

  -[CNStarkCardViewController view](self, "view");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController actionsController](self, "actionsController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v19);

}

- (void)setupLayoutGuides
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[CNStarkCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addLayoutGuide:", v6);

  -[CNStarkCardViewController setCenteringLayoutGuide:](self, "setCenteringLayoutGuide:", v6);
  v4 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[CNStarkCardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addLayoutGuide:", v4);

  -[CNStarkCardViewController setAvatarAndDetailsLayoutGuide:](self, "setAvatarAndDetailsLayoutGuide:", v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNStarkCardViewController;
  -[CNStarkCardViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CNStarkCardViewController resetLayoutConstraints](self, "resetLayoutConstraints");
}

- (void)resetLayoutConstraints
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController layoutConstraints](self, "layoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", v4);

  -[CNStarkCardViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  -[CNStarkCardViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkCardViewController;
  -[CNStarkCardViewController updateViewConstraints](&v5, sel_updateViewConstraints);
  v3 = *MEMORY[0x1E0D137F8];
  -[CNStarkCardViewController layoutConstraints](self, "layoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((_DWORD)v3)
    -[CNStarkCardViewController setupLayoutConstraints](self, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v31;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
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
  void *v92;
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
  _QWORD v126[5];
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[4];
  _QWORD v130[6];
  _QWORD v131[6];

  v131[4] = *MEMORY[0x1E0C80C00];
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "topAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "safeAreaLayoutGuide");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v106);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v101;
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController actionsController](self, "actionsController");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v76);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v131[1] = v71;
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leftAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v131[2] = v5;
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v131[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 4);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "centerYAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "centerYAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v107);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v102;
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "centerXAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "centerXAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v82);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = v77;
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leftAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leftAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:", v61);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v130[2] = v58;
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v130[3] = v53;
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v130[4] = v15;
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController centeringLayoutGuide](self, "centeringLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v130[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 6);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "view");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "centerYAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "centerYAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v98);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v93;
  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v68);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v21;
  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 64.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v25;
  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 64.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v129[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 4);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkCardViewController contactInfoViewController](self, "contactInfoViewController");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "view");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "centerYAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "centerYAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v94);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v89;
  -[CNStarkCardViewController contactInfoViewController](self, "contactInfoViewController");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v31, 12.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v128[1] = v32;
  -[CNStarkCardViewController contactInfoViewController](self, "contactInfoViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarAndDetailsLayoutGuide](self, "avatarAndDetailsLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v128[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 3);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkCardViewController actionsController](self, "actionsController");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "view");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "safeAreaLayoutGuide");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v90);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v85;
  -[CNStarkCardViewController actionsController](self, "actionsController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "safeAreaLayoutGuide");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v40;
  -[CNStarkCardViewController actionsController](self, "actionsController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v46, -12.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v126[0] = v125;
  v126[1] = v124;
  v126[2] = v122;
  v126[3] = v119;
  v126[4] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_cn_flatten");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController setLayoutConstraints:](self, "setLayoutConstraints:", v49);

  -[CNStarkCardViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController layoutConstraints](self, "layoutConstraints");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addConstraints:", v51);

}

- (void)updateViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[CNStarkCardViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkCardViewController avatarViewController](self, "avatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContacts:", v4);

}

- (void)updateNavigationItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[CNStarkCardViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    goto LABEL_4;
  -[CNStarkCardViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

LABEL_4:
LABEL_5:
    v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
    CNContactsUIBundle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 0, self, sel_showMore_);
    -[CNStarkCardViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

    return;
  }
  -[CNStarkCardViewController contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postalAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
    goto LABEL_5;
}

- (void)showMore:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  CNContactContentViewControllerConfiguration *v7;
  void *v8;
  CNStarkContactDisplayViewController *v9;
  void *v10;
  CNStarkContactViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  CNStarkContactDisplayViewController *v15;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 4);

  if (v6)
  {
    v7 = objc_alloc_init(CNContactContentViewControllerConfiguration);
    -[CNStarkCardViewController displayedContactProperties](self, "displayedContactProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentViewControllerConfiguration setDisplayedProperties:](v7, "setDisplayedProperties:", v8);

    v9 = [CNStarkContactDisplayViewController alloc];
    -[CNStarkCardViewController contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNStarkContactDisplayViewController initWithContact:contactViewConfiguration:](v9, "initWithContact:contactViewConfiguration:", v10, v7);

    -[CNContactContentDisplayViewController setDelegate:](v15, "setDelegate:", self);
  }
  else
  {
    v11 = [CNStarkContactViewController alloc];
    -[CNStarkCardViewController contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNStarkContactViewController initWithContact:](v11, "initWithContact:", v12);

    -[CNStarkCardViewController displayedContactProperties](self, "displayedContactProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactDisplayViewController setDisplayedProperties:](v15, "setDisplayedProperties:", v13);

    -[CNStarkContactDisplayViewController setContactDelegate:](v15, "setContactDelegate:", self);
  }
  -[CNStarkCardViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v15, 1);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  return 1;
}

- (BOOL)isSaveAuthorizedForPropertiesOfContactDisplayViewController:(id)a3
{
  return 0;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (CNStarkContactInfoViewController)contactInfoViewController
{
  return self->_contactInfoViewController;
}

- (CNStarkActionsController)actionsController
{
  return self->_actionsController;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSArray)displayedContactProperties
{
  return self->_displayedContactProperties;
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
  objc_storeStrong((id *)&self->_displayedContactProperties, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_contactInfoViewController, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  +[CNStarkContactInfoViewController descriptorForRequiredKeys](CNStarkContactInfoViewController, "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  +[CNStarkActionsController descriptorForRequiredKeys](CNStarkActionsController, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  +[CNContactContentUnitaryViewController descriptorForRequiredKeys](CNStarkContactViewController, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v7, CFSTR("CNStarkCardViewController descriptorForRequiredKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNKeyDescriptor *)v8;
}

+ (id)starkCardControllerForCalendarEventWithContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CNStarkContactsListViewController makeContactsDisplayedProperties](CNStarkContactsListViewController, "makeContactsDisplayedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContact:displayedContactProperties:", v3, v4);

  return v5;
}

@end
