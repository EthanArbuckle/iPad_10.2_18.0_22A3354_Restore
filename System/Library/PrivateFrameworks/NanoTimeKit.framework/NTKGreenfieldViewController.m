@implementation NTKGreenfieldViewController

- (NTKGreenfieldViewController)initWithUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  NTKGreenfieldViewController *v9;
  NTKGreenfieldViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKGreenfieldViewController;
  v9 = -[NTKGreenfieldViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceURL, a3);
    objc_storeStrong((id *)&v10->_sourceApplicationBundleIdentifier, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NTKGreenfieldCompanionLoadingViewController *v10;
  NTKGreenfieldCompanionLoadingViewController *loadingViewController;
  UINavigationController *v12;
  UINavigationController *hiddenNavigationController;
  void *v14;
  void *v15;
  NTKGreenfieldAddWatchFaceManager *v16;
  void *v17;
  UILabel *v18;
  UILabel *complicationsCounterLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NTKGreenfieldViewController;
  -[NTKGreenfieldViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[NTKGreenfieldViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalInPresentation:", 1);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffect:", v5);

  -[NTKGreenfieldViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStandardAppearance:", v4);

  BPSBackgroundColor();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = objc_alloc_init(NTKGreenfieldCompanionLoadingViewController);
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = v10;

  v12 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_loadingViewController);
  hiddenNavigationController = self->_hiddenNavigationController;
  self->_hiddenNavigationController = v12;

  -[NTKGreenfieldViewController addChildViewController:](self, "addChildViewController:", self->_hiddenNavigationController);
  -[NTKGreenfieldViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](self->_hiddenNavigationController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[UINavigationController didMoveToParentViewController:](self->_hiddenNavigationController, "didMoveToParentViewController:", self);
  -[UINavigationController setNavigationBarHidden:animated:](self->_hiddenNavigationController, "setNavigationBarHidden:animated:", 1, 0);
  v16 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
  -[NTKGreenfieldViewController setAddWatchFaceManager:](self, "setAddWatchFaceManager:", v16);

  -[NTKGreenfieldViewController addWatchFaceManager](self, "addWatchFaceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  -[NTKGreenfieldAddWatchFaceManager decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:](self->_addWatchFaceManager, "decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:", self->_faceURL, self->_sourceApplicationBundleIdentifier);
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  complicationsCounterLabel = self->_complicationsCounterLabel;
  self->_complicationsCounterLabel = v18;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_complicationsCounterLabel, "setFont:", v20);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_complicationsCounterLabel, "setTextColor:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_complicationsCounterLabel);
  -[NTKGreenfieldViewController navigationItem](self, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRightBarButtonItem:", v22);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldViewController;
  -[NTKGreenfieldViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[NTKGreenfieldAddWatchFaceManager addedFaceID](self->_addWatchFaceManager, "addedFaceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("NTKGreenfieldAddWatchFaceManagerDidAddFaceNotification"), v4);

  }
  -[NTKGreenfieldAddWatchFaceManager handleDidExitAddWatchFaceFlow](self->_addWatchFaceManager, "handleDidExitAddWatchFaceFlow");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKGreenfieldViewController;
  -[NTKGreenfieldViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[UINavigationController view](self->_hiddenNavigationController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)_didTapCancelButton
{
  -[NTKGreenfieldViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_toggleRightCounterLabel:(BOOL)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  if (a3)
  {
    v5 = -[NTKGreenfieldAddWatchFaceManager viewedNonInstalledAppCount](self->_addWatchFaceManager, "viewedNonInstalledAppCount");
    v6 = -[NTKGreenfieldAddWatchFaceManager totalNonInstalledAppCount](self->_addWatchFaceManager, "totalNonInstalledAppCount");
    v7 = (void *)MEMORY[0x1E0CB3940];
    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_APPS_COUNTER"), CFSTR("%lu of %lu"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_complicationsCounterLabel, "setText:", v9);
    -[UILabel sizeToFit](self->_complicationsCounterLabel, "sizeToFit");

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__NTKGreenfieldViewController__toggleRightCounterLabel___block_invoke;
  v10[3] = &unk_1E6BCF930;
  v10[4] = self;
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.2, 0.0);
}

uint64_t __56__NTKGreenfieldViewController__toggleRightCounterLabel___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setAlpha:", v1);
}

- (void)_toggleCancelButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[NTKGreenfieldViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (!v3)
  {
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", 0, 1);
LABEL_6:

    return;
  }
  objc_msgSend(v5, "leftBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__didTapCancelButton);
    -[NTKGreenfieldViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:animated:", v8, 1);

    goto LABEL_6;
  }
}

- (void)companionContentViewController:(id)a3 didStartInstallingAppWithItemId:(id)a4
{
  -[NTKGreenfieldAddWatchFaceManager markComplicationAsInstalled](self->_addWatchFaceManager, "markComplicationAsInstalled", a3, a4);
}

- (void)companionContentViewController:(id)a3 handleButtonEvent:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      -[NTKGreenfieldAddWatchFaceManager handleAddToMyFacesAction](self->_addWatchFaceManager, "handleAddToMyFacesAction");
      goto LABEL_8;
    case 1:
      -[NTKGreenfieldAddWatchFaceManager handleContinueAction](self->_addWatchFaceManager, "handleContinueAction");
      goto LABEL_8;
    case 2:
      -[NTKGreenfieldAddWatchFaceManager handleDoneAction](self->_addWatchFaceManager, "handleDoneAction");
      goto LABEL_8;
    case 3:
      -[NTKGreenfieldAddWatchFaceManager handleRevisitSkippedComplicationsAction](self->_addWatchFaceManager, "handleRevisitSkippedComplicationsAction");
      goto LABEL_8;
    case 4:
      -[NTKGreenfieldAddWatchFaceManager handleSkipComplicationAction](self->_addWatchFaceManager, "handleSkipComplicationAction");
      goto LABEL_8;
    case 5:
      -[NTKGreenfieldViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_8:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (void)didStartLoadingInAddWatchFaceManager:(id)a3
{
  id v4;

  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 0);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 1);
  v4 = -[UINavigationController popToRootViewControllerAnimated:](self->_hiddenNavigationController, "popToRootViewControllerAnimated:", 1);
}

- (void)addWatchFaceManager:(id)a3 updateStateToWelcomeWithCanAddFaceDirectly:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 0);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 1);
  -[NTKGreenfieldAddWatchFaceManager addFaceDescription](self->_addWatchFaceManager, "addFaceDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldAddWatchFaceManager decodedRecipe](self->_addWatchFaceManager, "decodedRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKGreenfieldCompanionContentViewController initStartStateWithDecodedRecipe:canAddFaceDirectly:addFaceDescription:]([NTKGreenfieldCompanionContentViewController alloc], "initStartStateWithDecodedRecipe:canAddFaceDirectly:addFaceDescription:", v6, v4, v8);
  objc_msgSend(v7, "setGreenfieldDelegate:", self);
  -[UINavigationController pushViewController:animated:](self->_hiddenNavigationController, "pushViewController:animated:", v7, 0);

}

- (void)addWatchFaceManager:(id)a3 updateStateToComplicationsNotAvailableWithSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 0);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 1);
  -[NTKGreenfieldAddWatchFaceManager decodedRecipe](self->_addWatchFaceManager, "decodedRecipe");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[NTKGreenfieldCompanionContentViewController initComplicationNotAvailableStateWithDecodedRecipe:unavailableSlots:unavailableTitle:unavailableDescription:]([NTKGreenfieldCompanionContentViewController alloc], "initComplicationNotAvailableStateWithDecodedRecipe:unavailableSlots:unavailableTitle:unavailableDescription:", v13, v11, v10, v9);

  objc_msgSend(v12, "setGreenfieldDelegate:", self);
  -[UINavigationController pushViewController:animated:](self->_hiddenNavigationController, "pushViewController:animated:", v12, 1);

}

- (void)addWatchFaceManager:(id)a3 updateStateToAddComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 1);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 1);
  -[NTKGreenfieldAddWatchFaceManager decodedRecipe](self->_addWatchFaceManager, "decodedRecipe");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKGreenfieldCompanionContentViewController initAddComplicationStateWithDecodedRecipe:complicationItemId:installMode:skippedComplicationSlots:]([NTKGreenfieldCompanionContentViewController alloc], "initAddComplicationStateWithDecodedRecipe:complicationItemId:installMode:skippedComplicationSlots:", v12, v10, a5, v9);

  objc_msgSend(v11, "setGreenfieldDelegate:", self);
  -[UINavigationController pushViewController:animated:](self->_hiddenNavigationController, "pushViewController:animated:", v11, 1);

}

- (void)addWatchFaceManager:(id)a3 updateStateToRevisitComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  UINavigationController *hiddenNavigationController;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a4;
  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 1);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 1);
  -[NTKGreenfieldAddWatchFaceManager decodedRecipe](self->_addWatchFaceManager, "decodedRecipe");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NTKGreenfieldCompanionContentViewController initAddComplicationStateWithDecodedRecipe:complicationItemId:installMode:skippedComplicationSlots:]([NTKGreenfieldCompanionContentViewController alloc], "initAddComplicationStateWithDecodedRecipe:complicationItemId:installMode:skippedComplicationSlots:", v11, v10, a5, v9);

  objc_msgSend(v12, "setGreenfieldDelegate:", self);
  -[UINavigationController topViewController](self->_hiddenNavigationController, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  hiddenNavigationController = self->_hiddenNavigationController;
  v17[0] = v12;
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController setViewControllers:animated:](hiddenNavigationController, "setViewControllers:animated:", v15, 0);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __131__NTKGreenfieldViewController_addWatchFaceManager_updateStateToRevisitComplicationWithItemId_installMode_skippedComplicationSlots___block_invoke;
  v16[3] = &unk_1E6BCD5F0;
  v16[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

id __131__NTKGreenfieldViewController_addWatchFaceManager_updateStateToRevisitComplicationWithItemId_installMode_skippedComplicationSlots___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "popToRootViewControllerAnimated:", 1);
}

- (void)addWatchFaceManager:(id)a3 updateStateToCompletedWithSkippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a5;
  v7 = a4;
  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 0);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 0);
  -[NTKGreenfieldAddWatchFaceManager decodedRecipe](self->_addWatchFaceManager, "decodedRecipe");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKGreenfieldCompanionContentViewController initCompletedStateWithDecodedRecipe:skippedComplicationSlots:canRevisit:]([NTKGreenfieldCompanionContentViewController alloc], "initCompletedStateWithDecodedRecipe:skippedComplicationSlots:canRevisit:", v9, v7, v5);

  objc_msgSend(v8, "setGreenfieldDelegate:", self);
  -[UINavigationController pushViewController:animated:](self->_hiddenNavigationController, "pushViewController:animated:", v8, 1);

}

- (void)addWatchFaceManager:(id)a3 didFinishAddingFaceWithError:(id)a4
{
  id v5;
  void *v6;
  NTKGreenfieldCompanionContentViewController *v7;
  UINavigationController *hiddenNavigationController;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NTKGreenfieldViewController _toggleRightCounterLabel:](self, "_toggleRightCounterLabel:", 0);
  -[NTKGreenfieldViewController _toggleCancelButton:](self, "_toggleCancelButton:", 1);
  if (v5)
  {
    -[NTKGreenfieldAddWatchFaceManager decodedRecipe](self->_addWatchFaceManager, "decodedRecipe");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NTKGreenfieldCompanionContentViewController initWithError:decodedRecipe:]([NTKGreenfieldCompanionContentViewController alloc], "initWithError:decodedRecipe:", v5, v6);
    -[NTKGreenfieldCompanionContentViewController setGreenfieldDelegate:](v7, "setGreenfieldDelegate:", self);
    hiddenNavigationController = self->_hiddenNavigationController;
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController setViewControllers:animated:](hiddenNavigationController, "setViewControllers:animated:", v9, 0);

  }
  else
  {
    -[NTKGreenfieldViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (NSURL)faceURL
{
  return self->_faceURL;
}

- (void)setFaceURL:(id)a3
{
  objc_storeStrong((id *)&self->_faceURL, a3);
}

- (NTKGreenfieldAddWatchFaceManager)addWatchFaceManager
{
  return self->_addWatchFaceManager;
}

- (void)setAddWatchFaceManager:(id)a3
{
  objc_storeStrong((id *)&self->_addWatchFaceManager, a3);
}

- (UINavigationController)hiddenNavigationController
{
  return self->_hiddenNavigationController;
}

- (void)setHiddenNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenNavigationController, a3);
}

- (NTKGreenfieldCompanionLoadingViewController)loadingViewController
{
  return self->_loadingViewController;
}

- (void)setLoadingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_loadingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_hiddenNavigationController, 0);
  objc_storeStrong((id *)&self->_addWatchFaceManager, 0);
  objc_storeStrong((id *)&self->_faceURL, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationsCounterLabel, 0);
}

@end
