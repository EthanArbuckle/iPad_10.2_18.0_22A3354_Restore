@implementation MCProfileTitlePageViewController

- (MCProfileTitlePageViewController)initWithViewModel:(id)a3
{
  id v5;
  MCProfileTitlePageViewController *v6;
  MCProfileTitlePageViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCProfileTitlePageViewController;
  v6 = -[MCProfileTitlePageViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[MCProfileTitlePageViewModel setDelegate:](v7->_viewModel, "setDelegate:", v7);
    objc_msgSend(v5, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageViewController _sectionControllersWithProfile:](v7, "_sectionControllersWithProfile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCSectionBasedTableViewController setSectionControllers:](v7, "setSectionControllers:", v9);

  }
  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageViewController;
  -[MCSectionBasedTableViewController loadView](&v9, sel_loadView);
  -[MCProfileTitlePageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController setProfileTitlePageView:](self, "setProfileTitlePageView:", v3);

  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 1);

  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomBarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

}

- (id)defaultView
{
  return (id)objc_opt_new();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
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
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)MCProfileTitlePageViewController;
  -[MCSectionBasedTableViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[MCProfileTitlePageViewController metaDataSectionController](self, "metaDataSectionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "heightForHeader");
  v17 = v8 - v16;

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentInset:", v17, v10, v12, v14);

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentInset");
  objc_msgSend(v21, "setContentOffset:animated:", 0, 0.0, -v24);

  -[MCProfileTitlePageViewController _updateMetaDataSectionHeight](self, "_updateMetaDataSectionHeight");
  -[MCProfileTitlePageViewController animationController](self, "animationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController metaDataSectionController](self, "metaDataSectionController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topBarView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startTrackingWithMetaDataSectionController:topBar:", v26, v28);

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "infoButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addTarget:action:forControlEvents:", self, sel_infoButtonTapped_, 64);

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "installButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel_installButtonTapped_, 64);

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "cancelButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addTarget:action:forControlEvents:", self, sel_cancelButtonTapped_, 64);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomBarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  -[MCProfileTitlePageViewController dealloc](&v5, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  -[MCProfileTitlePageViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:animated:", 1, 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  -[MCProfileTitlePageViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[MCProfileTitlePageViewController _updateBottomInsetToEnableCompleteScrollAnimation](self, "_updateBottomInsetToEnableCompleteScrollAnimation");
  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showBottomView:animated:", 1, 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewController;
  -[MCProfileTitlePageViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:animated:", 0, 1);

}

- (void)viewControllerHasBeenDismissed
{
  void *v3;

  -[MCProfileTitlePageViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "terminateProfileInstallationFlow");

  -[MCProfileTitlePageViewController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (id)_sectionControllersWithProfile:(id)a3
{
  id v4;
  void *v5;
  MCProfileTitlePageMetaDataSectionController *v6;
  MCProfileTitlePageMetaDataSectionController *metaDataSectionController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  MCProfileTitlePageWarningSectionController *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[MCProfileTitlePageMetaDataSectionController initWithProfile:]([MCProfileTitlePageMetaDataSectionController alloc], "initWithProfile:", v4);
  metaDataSectionController = self->_metaDataSectionController;
  self->_metaDataSectionController = v6;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "installationWarnings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  objc_msgSend(v4, "localizedConsentText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedString(CFSTR("INSTALL_CONSENT_MESSAGE_FROM_%@"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organization");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      objc_msgSend(v11, "stringWithFormat:", v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "friendlyName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = objc_alloc(MEMORY[0x1E0D47238]);
    objc_msgSend(v4, "localizedConsentText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithLocalizedTitle:localizedBody:isLongForm:", v15, v18, 1);

    objc_msgSend(v8, "addObject:", v19);
  }
  objc_msgSend(v5, "addObject:", self->_metaDataSectionController);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = -[MCProfileTitlePageWarningSectionController initWithWarning:]([MCProfileTitlePageWarningSectionController alloc], "initWithWarning:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v22);
  }

  v26 = (void *)objc_msgSend(v5, "copy");
  return v26;
}

- (void)_updateMetaDataSectionHeight
{
  void *v3;
  double Height;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[MCProfileTitlePageViewController metaDataSectionController](self, "metaDataSectionController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v14);
  -[MCProfileTitlePageViewController metaDataSectionController](self, "metaDataSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = Height + CGRectGetHeight(v15);
  -[MCProfileTitlePageViewController metaDataSectionController](self, "metaDataSectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitleCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = v7 + CGRectGetHeight(v16);
  -[MCProfileTitlePageViewController metaDataSectionController](self, "metaDataSectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orgCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[MCProfileTitlePageViewController setMetaDataSectionHeight:](self, "setMetaDataSectionHeight:", v10 + CGRectGetHeight(v17));

}

- (void)_resetNavigationBarStyleForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", 0, 0);

  objc_msgSend(v3, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowImage:", 0);

}

- (void)_updateBottomInsetToEnableCompleteScrollAnimation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;

  if (!-[MCProfileTitlePageViewController hasUpdatedBottomInset](self, "hasUpdatedBottomInset"))
  {
    -[MCProfileTitlePageViewController setHasUpdatedBottomInset:](self, "setHasUpdatedBottomInset:", 1);
    -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentSize");
    v6 = v5;

    -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentInset");
    v14 = v13;

    v15 = -v14;
    if (v14 >= 0.0)
      v15 = v14;
    v16 = v10 - v15;
    -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentInset");
    v20 = v19;

    v21 = -v20;
    if (v20 >= 0.0)
      v21 = v20;
    v22 = v16 - v21;

    NSLog(CFSTR("contentSize: %f, visibleSize:%f"), *(_QWORD *)&v6, *(_QWORD *)&v22);
    if (v6 > v22)
    {
      -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentInset");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      -[MCProfileTitlePageViewController metaDataSectionHeight](self, "metaDataSectionHeight");
      v34 = v30 + fmax(v33 - (v6 - v22), 0.0);
      -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "tableView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setContentInset:", v26, v28, v34, v32);

    }
  }
}

- (MCProfileTitlePageMetaDataSectionAnimationController)animationController
{
  MCProfileTitlePageMetaDataSectionAnimationController *animationController;
  MCProfileTitlePageMetaDataSectionAnimationController *v4;
  MCProfileTitlePageMetaDataSectionAnimationController *v5;

  animationController = self->_animationController;
  if (!animationController)
  {
    v4 = (MCProfileTitlePageMetaDataSectionAnimationController *)objc_opt_new();
    v5 = self->_animationController;
    self->_animationController = v4;

    animationController = self->_animationController;
  }
  return animationController;
}

- (void)infoButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;

  v4 = objc_alloc(MEMORY[0x1E0D1BFB0]);
  -[MCProfileTitlePageViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithProfileViewModel:", v6);

  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomBarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v11, "setTableViewBottomInset:", CGRectGetHeight(v12));

  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v11, 1);

  objc_msgSend(v11, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNavigationBarHidden:animated:", 0, 1);

  -[MCProfileTitlePageViewController _resetNavigationBarStyleForViewController:](self, "_resetNavigationBarStyleForViewController:", v11);
}

- (void)installButtonTapped:(id)a3
{
  id v3;

  -[MCProfileTitlePageViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startProfileInstallationFlow");

}

- (void)cancelButtonTapped:(id)a3
{
  id v3;

  -[MCProfileTitlePageViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "terminateProfileInstallationFlowAndDeleteProfile");

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "contentInset");
  v8 = v7;

  -[MCProfileTitlePageViewController animationController](self, "animationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController metaDataSectionHeight](self, "metaDataSectionHeight");
  objc_msgSend(v10, "updateProgressWithTranslationDistance:referenceDistance:isScrolling:", 1, v6 + v8, v9);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "contentInset");
  v8 = v7;

  -[MCProfileTitlePageViewController animationController](self, "animationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController metaDataSectionHeight](self, "metaDataSectionHeight");
  objc_msgSend(v10, "updateProgressWithTranslationDistance:referenceDistance:isScrolling:", 1, v6 + v8, v9);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "contentInset");
  v8 = v7;

  -[MCProfileTitlePageViewController animationController](self, "animationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewController metaDataSectionHeight](self, "metaDataSectionHeight");
  objc_msgSend(v10, "updateProgressWithTranslationDistance:referenceDistance:isScrolling:", 0, v6 + v8, v9);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if (!a4)
  {
    v5 = a3;
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    objc_msgSend(v5, "contentInset");
    v9 = v8;

    -[MCProfileTitlePageViewController animationController](self, "animationController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageViewController metaDataSectionHeight](self, "metaDataSectionHeight");
    objc_msgSend(v11, "updateProgressWithTranslationDistance:referenceDistance:isScrolling:", 0, v7 + v9, v10);

  }
}

- (void)promptForPasscodeWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MCProfileTitlePageViewController setPasscodeCompletionHandler:](self, "setPasscodeCompletionHandler:", a3);
  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setDelegate:", self);
  if (MCUIIsiPad())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v9);
    objc_msgSend(v4, "setModalPresentationStyle:", 2);
    -[MCProfileTitlePageViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    objc_msgSend(v9, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, 0);

  }
  else
  {
    objc_msgSend(v9, "setStyle:", 1);
    -[MCProfileTitlePageViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "popToViewController:pushViewController:animated:", self, v9, 1);

    objc_msgSend(v9, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, 1);

    -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showBottomView:animated:", 0, 1);
  }

}

- (void)promptForUserInput:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  -[MCProfileTitlePageViewController setUserInputCompletionHandler:](self, "setUserInputCompletionHandler:", a4);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BFA8]), "initWithUserInput:", v6);

  objc_msgSend(v10, "setQuestionsDelegate:", self);
  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popToViewController:pushViewController:animated:", self, v10, 1);

  objc_msgSend(v10, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, 1);

  -[MCProfileTitlePageViewController _resetNavigationBarStyleForViewController:](self, "_resetNavigationBarStyleForViewController:", v10);
  -[MCProfileTitlePageViewController profileTitlePageView](self, "profileTitlePageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showBottomView:animated:", 0, 1);

}

- (void)informQuestionViewControllerOfPreflightResult:(id)a3 profileConnection:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__MCProfileTitlePageViewController_informQuestionViewControllerOfPreflightResult_profileConnection___block_invoke;
  block[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __100__MCProfileTitlePageViewController_informQuestionViewControllerOfPreflightResult_profileConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "questionsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "profileConnectionDidFinishPreflightWithError:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)presentAuthenticationViewControllerWithContext:(id)a3 authenticationPreparationHandler:(id)a4 authenticationCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  v9 = a5;
  -[MCProfileTitlePageViewController setAuthenticationPreparationHandler:](self, "setAuthenticationPreparationHandler:", a4);
  -[MCProfileTitlePageViewController setAuthenticationCompletionHandler:](self, "setAuthenticationCompletionHandler:", v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __148__MCProfileTitlePageViewController_presentAuthenticationViewControllerWithContext_authenticationPreparationHandler_authenticationCompletionHandler___block_invoke;
  v11[3] = &unk_1EA2B5E68;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __148__MCProfileTitlePageViewController_presentAuthenticationViewControllerWithContext_authenticationPreparationHandler_authenticationCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MCUISignInViewController *v8;

  v8 = objc_alloc_init(MCUISignInViewController);
  -[MCUISignInViewController setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[MCUISignInViewController setContext:](v8, "setContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "organization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISignInViewController setOrgName:](v8, "setOrgName:", v4);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popToViewController:pushViewController:animated:", *(_QWORD *)(a1 + 32), v8, 1);

  -[MCUISignInViewController navigationController](v8, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "profileTitlePageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showBottomView:animated:", 0, 1);

}

- (void)promptForManagedRestoreWithManagedAppleID:(id)a3 snapshot:(id)a4 conflictingApps:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[MCProfileTitlePageViewController setRestoreCompletionHandler:](self, "setRestoreCompletionHandler:", a6);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __121__MCProfileTitlePageViewController_promptForManagedRestoreWithManagedAppleID_snapshot_conflictingApps_completionHandler___block_invoke;
  v16[3] = &unk_1EA2B5E90;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __121__MCProfileTitlePageViewController_promptForManagedRestoreWithManagedAppleID_snapshot_conflictingApps_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BF90]), "initWithDelegate:managedAppleID:restoreSnapshot:conflictingApps:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popToViewController:pushViewController:animated:", *(_QWORD *)(a1 + 32), v4, 1);

  objc_msgSend(v4, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:animated:", 0, 1);

}

- (void)presentSpinnerViewController
{
  MCActivityViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MCActivityViewController *activityViewController;

  v3 = (MCActivityViewController *)objc_opt_new();
  -[MCActivityViewController view](v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  MCUILocalizedString(CFSTR("BLOB_SIGN_IN_ACCOUNT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController setInProgresText:](v3, "setInProgresText:", v5);

  MCUILocalizedString(CFSTR("ENROLLMENT_SUCCESSFUL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController setCompletionText:](v3, "setCompletionText:", v6);

  MCUILocalizedString(CFSTR("SIGN_IN_DURATION_WARNING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCActivityViewController setLongWaitingWarningText:](v3, "setLongWaitingWarningText:", v7);

  -[MCActivityViewController setLongWaitingWarningThreshold:](v3, "setLongWaitingWarningThreshold:", 20.0);
  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popToViewController:pushViewController:animated:", self, v3, 1);

  -[MCActivityViewController navigationController](v3, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNavigationBarHidden:animated:", 1, 1);

  activityViewController = self->_activityViewController;
  self->_activityViewController = v3;

}

- (void)installationFinishedSuccessfully:(BOOL)a3 shouldDismiss:(BOOL)a4 shouldRedirect:(BOOL)a5 errorToDisplay:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  int v13;
  MCActivityViewController *activityViewController;
  void *v15;
  void *v16;
  int v17;
  int64_t v18;
  dispatch_time_t v19;
  dispatch_time_t v20;
  _QWORD v21[5];
  id v22;
  _QWORD block[5];
  BOOL v24;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", self->_activityViewController);

  if (!v8)
  {
LABEL_10:
    v18 = 0;
    if (v10)
      goto LABEL_11;
    goto LABEL_8;
  }
  activityViewController = self->_activityViewController;
  if (activityViewController)
  {
    if (!v13)
      goto LABEL_10;
  }
  else
  {
    -[MCProfileTitlePageViewController presentSpinnerViewController](self, "presentSpinnerViewController");
    -[MCProfileTitlePageViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", self->_activityViewController);

    if (!v17)
      goto LABEL_10;
    activityViewController = self->_activityViewController;
  }
  -[MCActivityViewController completeActivityAnimated:](activityViewController, "completeActivityAnimated:", 1);
  v18 = 1200000047;
  if (v10)
  {
LABEL_11:
    v20 = dispatch_time(0, 1000000000);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke_2;
    v21[3] = &unk_1EA2B5E68;
    v21[4] = self;
    v22 = v10;
    dispatch_after(v20, MEMORY[0x1E0C80D38], v21);

    goto LABEL_12;
  }
LABEL_8:
  if (v7)
  {
    v19 = dispatch_time(0, v18);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke;
    block[3] = &unk_1EA2B5E40;
    block[4] = self;
    v24 = a5;
    dispatch_after(v19, MEMORY[0x1E0C80D38], block);
  }
LABEL_12:

}

void __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D472A8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

  }
}

uint64_t __113__MCProfileTitlePageViewController_installationFinishedSuccessfully_shouldDismiss_shouldRedirect_errorToDisplay___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popToViewController:animated:", *(_QWORD *)(a1 + 32), 1);

  NSLog(CFSTR("sign-in failed, error: %@"), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_showAlertForInstallError:", *(_QWORD *)(a1 + 40));
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  -[MCProfileTitlePageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUserInteractionEnabled");

  if (v3)
  {
    if ((v6 & 1) != 0)
      return;
    NSLog(CFSTR("MCProfileTitlePageViewController accepting user interaction"));
    -[MCProfileTitlePageViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 1;
  }
  else
  {
    if (!v6)
      return;
    NSLog(CFSTR("MCProfileTitlePageViewController ignoring user interaction"));
    -[MCProfileTitlePageViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 0;
  }
  objc_msgSend(v7, "setUserInteractionEnabled:", v8);

}

- (void)_showAlertForInstallError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CEA2E8];
  v5 = a3;
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedRecoverySuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  MCUILocalizedString(CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "MCUIAddCancelActionWithTitle:", v8);

  -[MCProfileTitlePageViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "MCUIShowFromController:", v9);

}

- (void)presentRestoreFailedAlertWithError:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke;
  block[3] = &unk_1EA2B5DD8;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0CEA2E8];
    MCUILocalizedString(CFSTR("RESTORE_FAILED"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CEA2E0];
    MCUILocalizedString(CFSTR("OK"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke_2;
    v10[3] = &unk_1EA2B5EB8;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

    objc_msgSend(WeakRetained, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MCUIShowFromController:", v9);

  }
}

uint64_t __89__MCProfileTitlePageViewController_presentRestoreFailedAlertWithError_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (MCUIIsiPad())
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __56__MCProfileTitlePageViewController_didAcceptEnteredPIN___block_invoke;
    v9 = &unk_1EA2B5BE8;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E0C80D38], &v6);
    objc_destroyWeak(&v10);
  }
  -[MCProfileTitlePageViewController passcodeCompletionHandler](self, "passcodeCompletionHandler", v6, v7, v8, v9);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, id))v5)[2](v5, 1, v4);

  objc_destroyWeak(&location);
}

void __56__MCProfileTitlePageViewController_didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v3;
  }

}

- (void)didCancelEnteringPIN
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __56__MCProfileTitlePageViewController_didCancelEnteringPIN__block_invoke;
  v7 = &unk_1EA2B5BE8;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E0C80D38], &v4);
  -[MCProfileTitlePageViewController passcodeCompletionHandler](self, "passcodeCompletionHandler", v4, v5, v6, v7);
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0, 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__MCProfileTitlePageViewController_didCancelEnteringPIN__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = MCUIIsiPad();
    objc_msgSend(v6, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v2)
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      v5 = (id)objc_msgSend(v3, "popToViewController:animated:", v6, 1);

    WeakRetained = v6;
  }

}

- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4
{
  id v5;
  void (**v6)(id, id, BOOL);

  v5 = a4;
  -[MCProfileTitlePageViewController userInputCompletionHandler](self, "userInputCompletionHandler");
  v6 = (void (**)(id, id, BOOL))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, objc_msgSend(v5, "count") == 0);

}

- (BOOL)questionsControllerIsDisplayedInSheet:(id)a3
{
  void *v3;
  BOOL v4;

  -[MCProfileTitlePageViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, id, _QWORD);

  v7 = a5;
  v8 = a4;
  -[MCProfileTitlePageViewController authenticationCompletionHandler](self, "authenticationCompletionHandler");
  v9 = (void (**)(id, id, id, _QWORD))objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8, v7, 0);

}

- (void)signInViewControllerDidCancelAuthentication:(id)a3
{
  id v3;

  -[MCProfileTitlePageViewController authenticationCompletionHandler](self, "authenticationCompletionHandler", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v3 + 2))(v3, 0, 0, 1);

}

- (void)signInViewController:(id)a3 willAuthenticateWithCompletionHandler:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(void);

  v7 = (void (**)(void))a4;
  -[MCProfileTitlePageViewController authenticationPreparationHandler](self, "authenticationPreparationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCProfileTitlePageViewController authenticationPreparationHandler](self, "authenticationPreparationHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void (**)(void)))v6)[2](v6, v7);

  }
  else
  {
    v7[2]();
  }

}

- (void)restoreViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(id, _BOOL8);

  v4 = a4;
  -[MCProfileTitlePageViewController restoreCompletionHandler](self, "restoreCompletionHandler", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCProfileTitlePageViewController restoreCompletionHandler](self, "restoreCompletionHandler");
    v7 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

  }
}

- (MCProfileTitlePageViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (MCProfileTitlePageView)profileTitlePageView
{
  return self->_profileTitlePageView;
}

- (void)setProfileTitlePageView:(id)a3
{
  objc_storeStrong((id *)&self->_profileTitlePageView, a3);
}

- (double)metaDataSectionHeight
{
  return self->_metaDataSectionHeight;
}

- (void)setMetaDataSectionHeight:(double)a3
{
  self->_metaDataSectionHeight = a3;
}

- (BOOL)hasUpdatedBottomInset
{
  return self->_hasUpdatedBottomInset;
}

- (void)setHasUpdatedBottomInset:(BOOL)a3
{
  self->_hasUpdatedBottomInset = a3;
}

- (MCProfileTitlePageMetaDataSectionController)metaDataSectionController
{
  return self->_metaDataSectionController;
}

- (void)setMetaDataSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_metaDataSectionController, a3);
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (DMCInstallProfileQuestionViewController)questionsController
{
  return self->_questionsController;
}

- (void)setQuestionsController:(id)a3
{
  objc_storeStrong((id *)&self->_questionsController, a3);
}

- (MCActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (id)passcodeCompletionHandler
{
  return self->_passcodeCompletionHandler;
}

- (void)setPasscodeCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (id)authenticationCompletionHandler
{
  return self->_authenticationCompletionHandler;
}

- (void)setAuthenticationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (id)authenticationPreparationHandler
{
  return self->_authenticationPreparationHandler;
}

- (void)setAuthenticationPreparationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (id)userInputCompletionHandler
{
  return self->_userInputCompletionHandler;
}

- (void)setUserInputCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (id)restoreCompletionHandler
{
  return self->_restoreCompletionHandler;
}

- (void)setRestoreCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_restoreCompletionHandler, 0);
  objc_storeStrong(&self->_userInputCompletionHandler, 0);
  objc_storeStrong(&self->_authenticationPreparationHandler, 0);
  objc_storeStrong(&self->_authenticationCompletionHandler, 0);
  objc_storeStrong(&self->_passcodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_questionsController, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_metaDataSectionController, 0);
  objc_storeStrong((id *)&self->_profileTitlePageView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
