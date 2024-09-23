@implementation DKFindMySignOutController

- (DKFindMySignOutController)initWithAccount:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DKFindMySignOutController *v16;
  uint64_t v17;
  id completion;
  void *v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_FIND_MY_DISCLOSURE"), &stru_24F20EA28, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(v7, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("APPLE_ACCOUNT_SIGN_IN"), &stru_24F20EA28, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)DKFindMySignOutController;
  v16 = -[DKFindMySignOutController initWithTitle:detailText:icon:contentLayout:](&v21, sel_initWithTitle_detailText_icon_contentLayout_, v15, v13, 0, 3);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a3);
    v17 = MEMORY[0x22E2C9654](v8);
    completion = v16->_completion;
    v16->_completion = (id)v17;

  }
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
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
  objc_super v117;
  _QWORD v118[15];

  v118[13] = *MEMORY[0x24BDAC8D0];
  v117.receiver = self;
  v117.super_class = (Class)DKFindMySignOutController;
  -[OBBaseWelcomeController viewDidLoad](&v117, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__cancelTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  v10 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_FINDMY"), &stru_24F20EA28, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, sel__turnOffTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 0);

  v17 = objc_alloc(MEMORY[0x24BDF6EA8]);
  v18 = *MEMORY[0x24BDBF090];
  v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v20 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v21 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v22 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x24BDBF090], v19, v20, v21);
  -[DKFindMySignOutController setPasswordField:](self, "setPasswordField:", v22);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  -[DKFindMySignOutController passwordField](self, "passwordField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDF6A70], "defaultFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v26);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CAPITALIZED_PASSWORD"), &stru_24F20EA28, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPlaceholder:", v29);

  -[DKFindMySignOutController passwordField](self, "passwordField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSecureTextEntry:", 1);

  -[DKFindMySignOutController passwordField](self, "passwordField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setReturnKeyType:", 0);

  v33 = *MEMORY[0x24BDF7EE0];
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTextContentType:", v33);

  -[DKFindMySignOutController passwordField](self, "passwordField");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v18, v19, v20, v21);
  -[DKFindMySignOutController setContainerOutlineView:](self, "setContainerOutlineView:", v36);

  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "quaternaryLabelColor");
  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v39 = objc_msgSend(v38, "CGColor");
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBorderColor:", v39);

  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController setForgotButton:](self, "setForgotButton:", v44);

  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD"), &stru_24F20EA28, CFSTR("Localizable"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTitle:forState:", v47, 0);

  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addTarget:action:forControlEvents:", self, sel__passwordRecoveryButtonWasTapped_, 64);

  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addSubview:", v51);

  -[DKFindMySignOutController contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", v53);

  -[DKFindMySignOutController contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addSubview:", v55);

  v92 = (void *)MEMORY[0x24BDD1628];
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "centerYAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "centerYAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v112;
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:constant:", v108, 11.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v107;
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "trailingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:constant:", v103, -11.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v102;
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "heightAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToConstant:", 21.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v99;
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController contentView](self, "contentView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "topAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v94;
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController contentView](self, "contentView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, -1.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v118[5] = v88;
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController contentView](self, "contentView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 1.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v118[6] = v83;
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "heightAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToConstant:", 41.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v118[7] = v80;
  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController containerOutlineView](self, "containerOutlineView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 20.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v118[8] = v75;
  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController contentView](self, "contentView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v118[9] = v70;
  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v118[10] = v65;
  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", 41.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v118[11] = v58;
  -[DKFindMySignOutController forgotButton](self, "forgotButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKFindMySignOutController contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v118[12] = v63;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 13);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "activateConstraints:", v64);

  -[DKFindMySignOutController setShouldAdjustScrollViewInsetForKeyboard:](self, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DKFindMySignOutController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[DKFindMySignOutController passwordField](self, "passwordField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)setIsAuthInProgress:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = !a3;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v5);

  -[DKFindMySignOutController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", v5);

  self->_isAuthInProgress = a3;
}

- (void)_cancelTapped:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);

  -[DKFindMySignOutController completion](self, "completion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKFindMySignOutController completion](self, "completion");
    v5 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1, 0);

  }
}

- (void)_turnOffTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  -[DKFindMySignOutController passwordField](self, "passwordField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[DKFindMySignOutController passwordField](self, "passwordField");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKFindMySignOutController _authenticateWithPassword:](self, "_authenticateWithPassword:", v7);

  }
  else
  {
    _DKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DKFindMySignOutController _turnOffTapped:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)_authenticateWithPassword:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v4 = a3;
  if (!v4)
    -[DKFindMySignOutController _authenticateWithPassword:].cold.1();
  v5 = v4;
  -[DKFindMySignOutController setIsAuthInProgress:](self, "setIsAuthInProgress:", 1);
  v6 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  -[DKFindMySignOutController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUsername:", v8);

  objc_msgSend(v6, "_setPassword:", v5);
  objc_msgSend(v6, "setNeedsCredentialRecovery:", 0);
  objc_msgSend(v6, "setNeedsNewAppleID:", 0);
  objc_msgSend(v6, "setAuthenticationType:", 2);
  objc_msgSend(v6, "setEnablePasscodeAuth:", 0);
  v9 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__DKFindMySignOutController__authenticateWithPassword___block_invoke;
  v10[3] = &unk_24F20DDC8;
  v10[4] = self;
  objc_msgSend(v9, "authenticateWithContext:completion:", v6, v10);

}

void __55__DKFindMySignOutController__authenticateWithPassword___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  BOOL v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  BOOL v20;
  _QWORD block[5];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE0AB28]);

    if (v13)
      v14 = objc_msgSend(v7, "code") == -7003;
    else
      v14 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3;
    v17[3] = &unk_24F20DDA0;
    v20 = v14;
    v15 = v7;
    v16 = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);
    v11 = v18;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_2;
    block[3] = &unk_24F20DD78;
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = v8;
    v23 = v9;
    v10 = v9;
    v11 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableFindMy:withPassword:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!*(_BYTE *)(a1 + 48))
  {
    _DKLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3_cold_1(a1, v2);

    v3 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(*(id *)(a1 + 40), "_titleForError:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_messageForError:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24F20EA28, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v10);

    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v6, 1, 0);

  }
  return objc_msgSend(*(id *)(a1 + 40), "setIsAuthInProgress:", 0);
}

- (void)_disableFindMy:(id)a3 withPassword:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a4;
  -[DKFindMySignOutController account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_setPassword:", v5);

  v7 = (void *)objc_opt_new();
  -[DKFindMySignOutController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccount:", v8);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DISABLE_FIND_MY_PROMPT"), &stru_24F20EA28, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v10);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_24F20EA28, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setButtonTitle:", v12);

  v13 = objc_alloc(MEMORY[0x24BE04978]);
  objc_msgSend(v7, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithAccount:", v14);

  objc_msgSend(v7, "customRequestHeaders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCustomHeaders:", v16);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke;
  v18[3] = &unk_24F20DE40;
  v18[4] = self;
  v19 = v7;
  v17 = v7;
  objc_msgSend(v15, "performRequestWithHandler:", v18);

}

void __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD block[5];
  _QWORD v15[4];
  id v16;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  if (v8)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v8, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_2;
    v15[3] = &unk_24F20DDF0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v11, "_handleFMIPAuthenticationResponse:withError:forContext:completion:", v8, v12, v13, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleFMIPAuthenticationResponse:withError:forContext:completion:", 0, v9, *(_QWORD *)(a1 + 40), 0);
  }
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_3;
  block[3] = &unk_24F20DE18;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "completion");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fmipWipeToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, uint64_t, void *))v6)[2](v6, a2, v7);
}

uint64_t __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAuthInProgress:", 0);
}

- (void)_handleFMIPAuthenticationResponse:(id)a3 withError:(id)a4 forContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  DKFindMySignOutController *v19;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  if (!v10
    || v11
    || (objc_msgSend(v10, "error"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke;
    block[3] = &unk_24F20DD78;
    v17 = v10;
    v18 = v11;
    v19 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    _DKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229405000, v15, OS_LOG_TYPE_DEFAULT, "FMIPAuthenticationRequest succeeded!", buf, 2u);
    }

    v13[2](v13, 0, v10);
  }

}

void __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v21 = v3;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Failed to obtain an FMiP wipe token. Response: %@ and Error: %@", buf, 0x16u);
  }

  v5 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(*(id *)(a1 + 48), "_titleForError:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_messageForError:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_52;
  v19[3] = &unk_24F20DE68;
  v19[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_24F20EA28, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2;
  v18[3] = &unk_24F20DE68;
  v18[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v8, 1, 0);
}

void __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_52(uint64_t a1)
{
  void (**v1)(id, uint64_t, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v1 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 1, 0);

}

void __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_password");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_authenticateWithPassword:", v2);

}

- (id)_titleForError:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "code");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 401)
    v6 = CFSTR("MOBILEME_AUTHENTICATION_FAILED_MESSAGE");
  else
    v6 = CFSTR("VERIFICATION_FAILED_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24F20EA28, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_messageForError:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "code") == 401)
  {
    v4 = &stru_24F20EA28;
  }
  else
  {
    objc_msgSend(v3, "localizedDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_passwordRecoveryButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v4, "setNeedsCredentialRecovery:", 1);
  objc_msgSend(v4, "setPresentingViewController:", self);
  -[DKFindMySignOutController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsername:", v6);

  -[DKFindMySignOutController setIsAuthInProgress:](self, "setIsAuthInProgress:", 1);
  v7 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke;
  v8[3] = &unk_24F20DDC8;
  v8[4] = self;
  objc_msgSend(v7, "authenticateWithContext:completion:", v4, v8);

}

void __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke_2;
  block[3] = &unk_24F20DE18;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAuthInProgress:", 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = -[DKFindMySignOutController isAuthInProgress](self, "isAuthInProgress");
  if (v5)
  {
    _DKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DKFindMySignOutController textFieldShouldReturn:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    -[DKFindMySignOutController passwordField](self, "passwordField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      -[DKFindMySignOutController passwordField](self, "passwordField");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKFindMySignOutController _authenticateWithPassword:](self, "_authenticateWithPassword:", v18);

    }
    objc_msgSend(v4, "endEditing:", 1);
  }

  return !v5;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length") != 0;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightBarButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", v12);

  return 1;
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
  objc_storeStrong((id *)&self->_passwordField, a3);
}

- (UIButton)forgotButton
{
  return self->_forgotButton;
}

- (void)setForgotButton:(id)a3
{
  objc_storeStrong((id *)&self->_forgotButton, a3);
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (UIView)containerOutlineView
{
  return self->_containerOutlineView;
}

- (void)setContainerOutlineView:(id)a3
{
  objc_storeStrong((id *)&self->_containerOutlineView, a3);
}

- (BOOL)isAuthInProgress
{
  return self->_isAuthInProgress;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_containerOutlineView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_forgotButton, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
}

- (void)_turnOffTapped:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229405000, a1, a3, "DKFindMySignOutController - turnOffFindMyPressed textfield length zero", a5, a6, a7, a8, 0);
}

- (void)_authenticateWithPassword:.cold.1()
{
  __assert_rtn("-[DKFindMySignOutController _authenticateWithPassword:]", "DKFindMySignOutController.m", 136, "password");
}

void __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_229405000, a2, OS_LOG_TYPE_ERROR, "DKFindMySignOut-authenticateWithPassword error: %@", (uint8_t *)&v3, 0xCu);
}

- (void)textFieldShouldReturn:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229405000, a1, a3, "DKFindMySignOut-AKAuthentication keyboard return pressed when auth is still in progress", a5, a6, a7, a8, 0);
}

@end
