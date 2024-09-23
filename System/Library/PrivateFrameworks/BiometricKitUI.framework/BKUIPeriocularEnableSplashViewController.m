@implementation BKUIPeriocularEnableSplashViewController

- (id)initInBuddy:(BOOL)a3 bkDevice:(id)a4 upsell:(BOOL)a5 withEndEnrollmentActionPrimary:(id)a6 enrollmentActionSecondary:(id)a7
{
  id v9;
  id v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  BKUIPeriocularEnableSplashViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BKUIPeriocularEnableSplashViewController *v52;
  void *v53;
  id endEnrollActionPrimary;
  void *v55;
  id endEnrollActionSecondary;
  void *v57;
  void *v58;
  char v60;
  id v62;
  id v63;
  objc_super v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  id v69;
  uint64_t v70;

  LODWORD(v9) = a5;
  v10 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v63 = a6;
  v62 = a7;
  if ((_DWORD)v9)
  {
    v67 = 0;
    objc_msgSend(v12, "identitiesForUser:error:", getuid(), &v67);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v67;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "count"))
    {
      _BKUILoggingFacility();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v14;
        _os_log_impl(&dword_1DB281000, v44, OS_LOG_TYPE_DEFAULT, "BKUIPearl:BKUIPeriocularEnableSplashViewController no identities found returning nil to init ... error?:%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
    v66 = v14;
    objc_msgSend(v12, "systemProtectedConfigurationWithError:", &v66);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v66;

    if (v18)
    {
      _BKUILoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[BKUIPeriocularEnableSplashViewController initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:].cold.2((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

    }
    v65 = v18;
    objc_msgSend(v12, "protectedConfigurationForUser:error:", getuid(), &v65);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v65;

    if (v27)
    {
      _BKUILoggingFacility();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[BKUIPeriocularEnableSplashViewController initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:].cold.1((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);

    }
    objc_msgSend(v17, "periocularFaceIDMatchEnabled");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v26, "periocularFaceIDMatchEnabled");
      v60 = (char)v9;
      v9 = v10;
      v36 = v12;
      v37 = v27;
      v38 = v26;
      v39 = v16;
      v40 = v17;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "BOOLValue");

      v17 = v40;
      v16 = v39;
      v26 = v38;
      v27 = v37;
      v12 = v36;
      v10 = v9;
      LOBYTE(v9) = v60;

      if (v42)
      {
        _BKUILoggingFacility();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB281000, v43, OS_LOG_TYPE_DEFAULT, "BKUIPearl:User already has periocularFaceIDMatchEnabled for both system and user thus bailing out early returning nil to init ...", buf, 2u);
        }

LABEL_19:
        v45 = 0;
        v47 = v62;
        v46 = v63;
        goto LABEL_25;
      }
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("FACE_MASK_ID"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("FACE_MASK_ID_SUBTEXT"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64.receiver = self;
  v64.super_class = (Class)BKUIPeriocularEnableSplashViewController;
  v52 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v64, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v49, v51, 0, 1);

  v47 = v62;
  v46 = v63;
  if (v52)
  {
    v52->_upsell = (char)v9;
    v52->_inBuddy = a3;
    v53 = _Block_copy(v63);
    endEnrollActionPrimary = v52->_endEnrollActionPrimary;
    v52->_endEnrollActionPrimary = v53;

    v55 = _Block_copy(v62);
    endEnrollActionSecondary = v52->_endEnrollActionSecondary;
    v52->_endEnrollActionSecondary = v55;

    objc_storeStrong((id *)&v52->_device, v10);
    v52->_maxCellHeight = -1.0;
    -[BKUIPeriocularEnableSplashViewController headerView](v52, "headerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setTintColor:", v58);

  }
  self = v52;
  v45 = self;
LABEL_25:

  return v45;
}

uint64_t __129__BKUIPeriocularEnableSplashViewController_initInBuddy_bkDevice_upsell_withEndEnrollmentActionPrimary_enrollmentActionSecondary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPeriocularEnrollment");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
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
  uint64_t v42;
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
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id location;
  objc_super v70;
  _QWORD v71[2];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  v70.receiver = self;
  v70.super_class = (Class)BKUIPeriocularEnableSplashViewController;
  -[OBTableWelcomeController viewDidLoad](&v70, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v72[0] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.5, 0.8);
  v72[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D65120]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("FaceMaskID"), CFSTR("ca"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v8, v10, v5, v11);
  -[BKUIPeriocularEnableSplashViewController setAnimationController:](self, "setAnimationController:", v12);

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v13, "isN69");

  if ((_DWORD)v8)
    v14 = 0.0333333333;
  else
    v14 = 0.0666666667;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController _createCellForIndexPath:](self, "_createCellForIndexPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController setCellTop:](self, "setCellTop:", v16);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController _createCellForIndexPath:](self, "_createCellForIndexPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController setCellBottom:](self, "setCellBottom:", v18);

  -[BKUIPeriocularEnableSplashViewController headerView](self, "headerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "animationView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "defaultScale");
  v22 = v21;
  -[BKUIPeriocularEnableSplashViewController headerView](self, "headerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "animationView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setScale:", v14 + v22);

  v25 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v26 = (void *)objc_msgSend(v25, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v26);

  -[OBTableWelcomeController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRowHeight:", *MEMORY[0x1E0CEBC10]);

  -[OBTableWelcomeController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEstimatedRowHeight:", 0.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  -[OBTableWelcomeController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "reloadData");

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidesBackButton:", 1);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController setSkipButton:](self, "setSkipButton:", v36);

  -[BKUIPeriocularEnableSplashViewController skipButton](self, "skipButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPeriocularEnableSplashViewController skipButton](self, "skipButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel__enrollSkipped_, 64);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BKUIPeriocularEnableSplashViewController inBuddy](self, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v42 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v42;
  }
  -[BKUIPeriocularEnableSplashViewController skipButton](self, "skipButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTitle:forState:", v40, 0);

  -[BKUIPeriocularEnableSplashViewController buttonTray](self, "buttonTray");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController skipButton](self, "skipButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addButton:", v45);

  objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0D65188];
  objc_msgSend(MEMORY[0x1E0D65148], "bundleWithIdentifier:", CFSTR("com.apple.onboarding.faceid"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "flowWithBundle:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "localizedButtonTitle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTitle:forState:", v50, 0);

  objc_msgSend(v46, "addTarget:action:forControlEvents:", self, sel__showPrivacyLink, 64);
  -[BKUIPeriocularEnableSplashViewController headerView](self, "headerView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addAccessoryButton:", v46);

  -[BKUIPeriocularEnableSplashViewController buttonTray](self, "buttonTray");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setNeedsLayout");

  -[BKUIPeriocularEnableSplashViewController buttonTray](self, "buttonTray");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layoutIfNeeded");

  -[BKUIPeriocularEnableSplashViewController cellTop](self, "cellTop");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController cellTop](self, "cellTop");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bounds");
  objc_msgSend(v54, "systemLayoutSizeFittingSize:", v56, 0.0);
  v58 = v57;

  -[BKUIPeriocularEnableSplashViewController cellBottom](self, "cellBottom");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController cellTop](self, "cellTop");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bounds");
  objc_msgSend(v59, "systemLayoutSizeFittingSize:", v61, 0.0);
  v63 = v62;

  if (v63 >= v58)
    v64 = v63;
  else
    v64 = v58;
  -[BKUIPeriocularEnableSplashViewController setMaxCellHeight:](self, "setMaxCellHeight:", v64);
  objc_initWeak(&location, self);
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __55__BKUIPeriocularEnableSplashViewController_viewDidLoad__block_invoke;
  v67[3] = &unk_1EA27FB48;
  objc_copyWeak(&v68, &location);
  -[BKUIPeriocularEnableSplashViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v65, v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularEnableSplashViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v66);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);

}

void __55__BKUIPeriocularEnableSplashViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMaxCellHeight:", -1.0);
  objc_msgSend(WeakRetained, "cellTop");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cellTop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "systemLayoutSizeFittingSize:", v3, 0.0);
  v5 = v4;

  objc_msgSend(WeakRetained, "cellBottom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cellTop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", v8, 0.0);
  v10 = v9;

  if (v10 >= v5)
    v11 = v10;
  else
    v11 = v5;
  objc_msgSend(WeakRetained, "setMaxCellHeight:", v11);
  objc_msgSend(WeakRetained, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

  objc_msgSend(WeakRetained, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

  objc_msgSend(WeakRetained, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIPeriocularEnableSplashViewController;
  -[OBTableWelcomeController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[BKUIPeriocularEnableSplashViewController animationController](self, "animationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimation");

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)_showPrivacyLink
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.faceid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)_continuePressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[BKUIPeriocularEnableSplashViewController endEnrollActionPrimary](self, "endEnrollActionPrimary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BKUIPeriocularEnableSplashViewController endEnrollActionPrimary](self, "endEnrollActionPrimary");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_enrollSkipped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[BKUIPeriocularEnableSplashViewController skipButton](self, "skipButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  if (-[BKUIPeriocularEnableSplashViewController inBuddy](self, "inBuddy")
    && (-[BKUIPeriocularEnableSplashViewController userSkippedAction](self, "userSkippedAction"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[BKUIPeriocularEnableSplashViewController userSkippedAction](self, "userSkippedAction");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BKUIPeriocularEnableSplashViewController endEnrollActionSecondary](self, "endEnrollActionSecondary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return;
    -[BKUIPeriocularEnableSplashViewController endEnrollActionSecondary](self, "endEnrollActionSecondary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v6;
  (*(void (**)(void))(v6 + 16))();

}

+ (void)setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:(id)a3 credentialSet:(id)a4 enabled:(BOOL)a5
{
  objc_msgSend(a1, "setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:authContext:enabled:completion:", a3, a4, 0, a5, 0);
}

+ (void)setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:(id)a3 credentialSet:(id)a4 authContext:(id)a5 enabled:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  id location;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = objc_alloc_init(MEMORY[0x1E0D02830]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPeriocularFaceIDMatchEnabled:", v16);

  objc_initWeak(&location, v11);
  v17 = getuid();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke;
  v20[3] = &unk_1EA280840;
  v24 = v13 != 0;
  v18 = v13;
  v21 = v18;
  v25 = v8;
  objc_copyWeak(&v23, &location);
  v19 = v14;
  v22 = v19;
  objc_msgSend(v11, "setProtectedConfiguration:forUser:credentialSet:reply:", v15, v17, v12, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(a1 + 32))
    __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_cold_1();
  if (v5 || (a2 & 1) == 0)
  {
    _BKUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 57);
      *(_DWORD *)buf = 67109378;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "Failed to set userProtectedConfigurationWithError with value:%i error: %@", buf, 0x12u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _BKUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "protectedConfigurationForUser:error:", getuid(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "periocularFaceIDMatchEnabled");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");
    *(_DWORD *)buf = 67109120;
    v17 = v13;
    _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "Final protectedConfigurationForUser faceIDMatchEnabled value %i", buf, 8u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_55;
    block[3] = &unk_1EA280080;
    v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_55(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Final protectedConfigurationForUser: invoking completion block", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)headerViewBottomToTableViewTopPadding
{
  return 13.0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  result = 0.0;
  if (!a4)
    return 10.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return (id)objc_opt_new();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return (id)objc_opt_new();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "setAllowsSelection:", 0);
  v8 = objc_msgSend(v7, "section");

  if (v8 == 1)
  {
    -[BKUIPeriocularEnableSplashViewController endEnrollActionPrimary](self, "endEnrollActionPrimary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BKUIPeriocularEnableSplashViewController endEnrollActionSecondary](self, "endEnrollActionSecondary");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v12 = (void *)v10;
      (*(void (**)(void))(v10 + 16))();

    }
  }
  else
  {
    -[BKUIPeriocularEnableSplashViewController endEnrollActionSecondary](self, "endEnrollActionSecondary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[BKUIPeriocularEnableSplashViewController endEnrollActionPrimary](self, "endEnrollActionPrimary");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v13 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__BKUIPeriocularEnableSplashViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  block[3] = &unk_1EA27FB98;
  v16 = v6;
  v14 = v6;
  dispatch_after(v13, MEMORY[0x1E0C80D38], block);

}

uint64_t __78__BKUIPeriocularEnableSplashViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsSelection:", 1);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v5;
  double result;

  -[BKUIPeriocularEnableSplashViewController maxCellHeight](self, "maxCellHeight", a3, a4);
  if (v5 < 0.0)
    return *MEMORY[0x1E0CEBC10];
  -[BKUIPeriocularEnableSplashViewController maxCellHeight](self, "maxCellHeight");
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3) == 1)
    -[BKUIPeriocularEnableSplashViewController cellBottom](self, "cellBottom");
  else
    -[BKUIPeriocularEnableSplashViewController cellTop](self, "cellTop");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createCellForIndexPath:(id)a3
{
  id v3;
  BKUIPeriocularSelectionCell *v4;
  uint64_t v5;
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

  v3 = a3;
  v4 = -[BKUIPeriocularSelectionCell initWithStyle:reuseIdentifier:]([BKUIPeriocularSelectionCell alloc], "initWithStyle:reuseIdentifier:", 3, &stru_1EA281248);
  v5 = objc_msgSend(v3, "section");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACE_MASK_ID_DONT_USE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACE_MASK_ID_DONT_USE_DETAIL_TEXT"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("faceid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACE_MASK_ID_USE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FACE_MASK_ID_USE_DETAIL_TEXT"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v14);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("faceid.and.mask"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  if (!v13)
  {
    v20 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageNamed:inBundle:withConfiguration:", CFSTR("local.faceid.and.mask"), v14, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v19);

  if (!v13)
  {

    goto LABEL_7;
  }
LABEL_8:

  -[BKUIPeriocularSelectionCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  uint64_t v3;

  -[BKUIPeriocularEnableSplashViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 1)
    return 3;
  else
    return 1;
}

- (double)maxCellHeight
{
  return self->_maxCellHeight;
}

- (void)setMaxCellHeight:(double)a3
{
  self->_maxCellHeight = a3;
}

- (BKUIPeriocularSelectionCell)cellTop
{
  return self->_cellTop;
}

- (void)setCellTop:(id)a3
{
  objc_storeStrong((id *)&self->_cellTop, a3);
}

- (BKUIPeriocularSelectionCell)cellBottom
{
  return self->_cellBottom;
}

- (void)setCellBottom:(id)a3
{
  objc_storeStrong((id *)&self->_cellBottom, a3);
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (id)endEnrollActionPrimary
{
  return self->_endEnrollActionPrimary;
}

- (void)setEndEnrollActionPrimary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (id)endEnrollActionSecondary
{
  return self->_endEnrollActionSecondary;
}

- (void)setEndEnrollActionSecondary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1272);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (BKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)upsell
{
  return self->_upsell;
}

- (void)setUpsell:(BOOL)a3
{
  self->_upsell = a3;
}

- (OBPrivacyLinkController)linkController
{
  return self->_linkController;
}

- (void)setLinkController:(id)a3
{
  objc_storeStrong((id *)&self->_linkController, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (id)userSkippedAction
{
  return self->_userSkippedAction;
}

- (void)setUserSkippedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong(&self->_userSkippedAction, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_linkController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong(&self->_endEnrollActionSecondary, 0);
  objc_storeStrong(&self->_endEnrollActionPrimary, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_cellBottom, 0);
  objc_storeStrong((id *)&self->_cellTop, 0);
}

- (void)initInBuddy:(uint64_t)a3 bkDevice:(uint64_t)a4 upsell:(uint64_t)a5 withEndEnrollmentActionPrimary:(uint64_t)a6 enrollmentActionSecondary:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "BKUIPearl:unable to fetch BKUserProtectedConfiguration and determine if the user already enabled Periocular Splash ... error?:%@", a5, a6, a7, a8, 2u);
}

- (void)initInBuddy:(uint64_t)a3 bkDevice:(uint64_t)a4 upsell:(uint64_t)a5 withEndEnrollmentActionPrimary:(uint64_t)a6 enrollmentActionSecondary:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "BKUIPearl:unable to fetch BKSystemProtectedConfiguration and determine if the user already enabled Periocular Splash ... error?:%@", a5, a6, a7, a8, 2u);
}

void __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_cold_1()
{
  __assert_rtn("+[BKUIPeriocularEnableSplashViewController setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:authContext:enabled:completion:]_block_invoke", "BKUIPeriocularEnableSplashViewController.m", 219, "authContext != nil");
}

@end
