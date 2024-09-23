@implementation MCInstallProfileViewController

- (MCInstallProfileViewController)initWithProfileDataFromSettingsJump:(id)a3
{
  return -[MCInstallProfileViewController initWithInstallableProfileData:fromSource:](self, "initWithInstallableProfileData:fromSource:", a3, 0);
}

- (MCInstallProfileViewController)initWithInstallableProfileData:(id)a3 fromSource:(unint64_t)a4
{
  id v7;
  void *v8;
  MCInstallProfileViewController *v9;
  MCInstallProfileViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCInstallProfileViewController initWithProfile:viewMode:](self, "initWithProfile:viewMode:", v8, 1);
  v10 = v9;
  if (v9)
  {
    -[MCInstallProfileViewController setInstallState:animated:](v9, "setInstallState:animated:", 1, 1);
    objc_storeStrong((id *)&v10->_profileData, a3);
    -[MCInstallProfileViewController setOriginalProfileData:](v10, "setOriginalProfileData:", v7);
    -[MCInstallProfileViewController profileViewController](v10, "profileViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInstallProfileSource:", a4);

    if (a4)
    {
      MCUILocalizedString(CFSTR("BLOB_INSTALL_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCInstallProfileViewController navigationItem](v10, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v12);

    }
    else
    {
      objc_msgSend(v8, "friendlyName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCInstallProfileViewController navigationItem](v10, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:", v14);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel__applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
    }

  }
  return v10;
}

- (MCInstallProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4
{
  id v6;
  void *v7;
  MCInstallProfileViewController *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[MCInstallProfileViewController initWithProfile:viewMode:profileUIDataProvider:](self, "initWithProfile:viewMode:profileUIDataProvider:", v6, a4, v7);

  return v8;
}

- (MCInstallProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4 profileUIDataProvider:(id)a5
{
  id v9;
  id v10;
  MCInstallProfileViewController *v11;
  MCInstallProfileViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v9 = a3;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)MCInstallProfileViewController;
  v11 = -[MCUIViewController init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profile, a3);
    -[MCInstallProfileViewController setOriginalProfile:](v12, "setOriginalProfile:", v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BFC8]), "initWithProfile:viewMode:profileUIDataProvider:", v9, a4, v10);
    -[MCInstallProfileViewController setProfileViewController:](v12, "setProfileViewController:", v13);

    -[MCInstallProfileViewController profileViewController](v12, "profileViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallProfileViewController addChildViewController:](v12, "addChildViewController:", v14);

    -[MCInstallProfileViewController view](v12, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[MCInstallProfileViewController profileViewController](v12, "profileViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

    -[MCInstallProfileViewController view](v12, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallProfileViewController profileViewController](v12, "profileViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v28);

    -[MCInstallProfileViewController profileViewController](v12, "profileViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "didMoveToParentViewController:", v12);

    -[MCInstallProfileViewController profileViewController](v12, "profileViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setProfileViewControllerDelegate:", v12);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MCInstallProfileViewController setIsDeallocating:](self, "setIsDeallocating:", 1);
  -[MCInstallProfileViewController _cancelInstallDueToApplicationExit](self, "_cancelInstallDueToApplicationExit");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MCInstallProfileViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "willMoveToParentViewController:", 0);
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        objc_msgSend(v8, "removeFromParentViewController");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)MCInstallProfileViewController;
  -[MCUIViewController dealloc](&v10, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCInstallProfileViewController;
  -[MCInstallProfileViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[MCInstallProfileViewController didAppearBlock](self, "didAppearBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCInstallProfileViewController didAppearBlock](self, "didAppearBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    -[MCInstallProfileViewController setDidAppearBlock:](self, "setDidAppearBlock:", 0);
  }
  else
  {
    -[MCInstallProfileViewController setDelayNextQuesion:](self, "setDelayNextQuesion:", 0);
  }
  -[MCInstallProfileViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (BOOL)displayedAsSheet
{
  void *v2;
  BOOL v3;

  -[MCInstallProfileViewController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_returnToSender
{
  _BOOL8 v3;
  _QWORD v4[5];

  if (-[MCInstallProfileViewController installHasFailed](self, "installHasFailed"))
    v3 = -[MCInstallProfileViewController userCancelledInstall](self, "userCancelledInstall");
  else
    v3 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__MCInstallProfileViewController__returnToSender__block_invoke;
  v4[3] = &unk_1EA2B5C20;
  v4[4] = self;
  -[UIViewController MCUIReturnToSender:returnToAccountSettings:viewControllerDismissalBlock:](self, "MCUIReturnToSender:returnToAccountSettings:viewControllerDismissalBlock:", v3, 0, v4);
}

void __49__MCInstallProfileViewController__returnToSender__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", a2, 0);

}

- (void)_takeMeBack
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[MCInstallProfileViewController profileViewController](self, "profileViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "installProfileSource");

  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "popProfileDataFromHeadOfInstallationQueue");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[MCInstallProfileViewController queueNextProfileData:](self, "queueNextProfileData:", v6);
      else
        -[MCInstallProfileViewController _returnToSender](self, "_returnToSender");

    }
  }
  else
  {
    -[MCInstallProfileViewController _returnToSender](self, "_returnToSender");
  }
}

- (void)queueNextProfileData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCInstallProfileViewController profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController setOriginalProfile:](self, "setOriginalProfile:", v5);

  -[MCInstallProfileViewController profileData](self, "profileData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController setOriginalProfileData:](self, "setOriginalProfileData:", v6);

  -[MCInstallProfileViewController setProfileData:](self, "setProfileData:", v4);
  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 1, 1);
}

- (void)setProfile:(id)a3
{
  id v5;
  NSData *profileData;
  void *v7;
  id v8;

  v8 = a3;
  -[MCInstallProfileViewController profile](self, "profile");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_profile, a3);
    profileData = self->_profileData;
    self->_profileData = 0;

    -[MCInstallProfileViewController profileViewController](self, "profileViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProfile:", v8);

  }
}

- (void)setProfileData:(id)a3
{
  id v5;
  MCProfile *v6;
  MCProfile *profile;
  MCProfile *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MCInstallProfileViewController profileData](self, "profileData");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v10)
  {
    objc_storeStrong((id *)&self->_profileData, a3);
    objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v10, 0);
    v6 = (MCProfile *)objc_claimAutoreleasedReturnValue();
    profile = self->_profile;
    self->_profile = v6;

    v8 = self->_profile;
    -[MCInstallProfileViewController profileViewController](self, "profileViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProfile:", v8);

  }
}

- (void)setInstallState:(int)a3
{
  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", *(_QWORD *)&a3, 0);
}

- (void)setInstallState:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  int v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (!-[MCInstallProfileViewController isDeallocating](self, "isDeallocating")
    && -[MCInstallProfileViewController installState](self, "installState") != (_DWORD)v5)
  {
    self->_installState = v5;
    v7 = -[MCInstallProfileViewController installState](self, "installState");
    switch(v7)
    {
      case 1:
        -[MCInstallProfileViewController _resetInstallationVariables](self, "_resetInstallationVariables");
        break;
      case 9:
        -[MCInstallProfileViewController _resetInstallationVariables](self, "_resetInstallationVariables");
        -[MCInstallProfileViewController profileViewController](self, "profileViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadData");

        break;
      case 2:
        -[MCInstallProfileViewController setInstallHasFailed:](self, "setInstallHasFailed:", 0);
        break;
    }
    -[MCInstallProfileViewController updateTitleForProfileInstallationState:](self, "updateTitleForProfileInstallationState:", v5);
    -[MCInstallProfileViewController updateBarButtonItemsForProfileInstallationState:animated:](self, "updateBarButtonItemsForProfileInstallationState:animated:", v5, v4);
  }
}

- (void)_resetInstallationVariables
{
  -[MCInstallProfileViewController setProcessingPayload:](self, "setProcessingPayload:", 0);
  -[MCInstallProfileViewController setUserCancelledInstall:](self, "setUserCancelledInstall:", 0);
  -[MCInstallProfileViewController setQuestionsAlreadyAsked:](self, "setQuestionsAlreadyAsked:", 0);
  -[MCInstallProfileViewController setPin:](self, "setPin:", 0);
  -[MCInstallProfileViewController setDidAppearBlock:](self, "setDidAppearBlock:", 0);
  -[MCInstallProfileViewController _hideProgressIndicatorIfNeeded](self, "_hideProgressIndicatorIfNeeded");
}

- (void)showProgressIndicator
{
  void *v3;
  void *v4;

  if (-[MCInstallProfileViewController displayedAsSheet](self, "displayedAsSheet"))
  {
    -[MCInstallProfileViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftBarButtonItem:animated:", 0, 0);

    -[MCInstallProfileViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:animated:", 0, 0);

  }
  -[UIViewController MCUIShowProgressInNavBar](self, "MCUIShowProgressInNavBar");
}

- (void)_hideProgressIndicatorIfNeeded
{
  if (-[UIViewController MCUIIsShowingProgress](self, "MCUIIsShowingProgress"))
    -[UIViewController MCUIHideProgressInNavBarShowBackButton:](self, "MCUIHideProgressInNavBarShowBackButton:", 1);
}

- (void)updateTitleForProfileInstallationState:(int)a3
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a3 == 1)
  {
    v4 = CFSTR("BLOB_INSTALL_TITLE");
    goto LABEL_5;
  }
  if (a3 == 9)
  {
    v4 = CFSTR("BLOB_JUST_INSTALLED_TITLE");
LABEL_5:
    MCUILocalizedString(v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  if (-[MCInstallProfileViewController processingPayload](self, "processingPayload"))
  {
    MCUILocalizedString(CFSTR("BLOB_INSTALLING_TITLE"));
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v5;
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v6 = v8;
  if (v8)
  {
LABEL_11:
    v9 = v6;
    -[MCInstallProfileViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    v6 = v9;
  }
LABEL_12:

}

- (void)updateBarButtonItemsForProfileInstallationState:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  if (a3 == 9)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__takeMeBack);
    v9 = 0;
  }
  else if (a3 == 1)
  {
    v6 = -[MCInstallProfileViewController _newRightBarButtonItem](self, "_newRightBarButtonItem");
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__takeMeBack);
  }
  else
  {
    v9 = 0;
    v6 = 0;
  }
  -[MCInstallProfileViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:animated:", v6, v4);

  -[MCInstallProfileViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:animated:", v9, v4);

}

- (id)_newRightBarButtonItem
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;

  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mustInstallProfileNonInteractively:", v3);

  if ((v5 & 1) != 0 || -[MCInstallProfileViewController installState](self, "installState") != 1)
  {
    v8 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    MCUILocalizedString(CFSTR("INSTALL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, sel__beginInstallFlow);

  }
  return v8;
}

- (void)_beginInstallFlow
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 2, 1);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasscodeSet");

  if ((v4 & 1) != 0)
  {
    -[MCInstallProfileViewController delegate](self, "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          -[MCInstallProfileViewController delegate](self, "delegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      objc_initWeak(&location, self);
      -[MCInstallProfileViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__MCInstallProfileViewController__beginInstallFlow__block_invoke;
      v10[3] = &unk_1EA2B5C48;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v9, "performPinAuthenticationWithCompletionHandler:", v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      -[MCInstallProfileViewController pinExtensionShowPINSheet](self, "pinExtensionShowPINSheet");
    }
  }
  else
  {
    -[MCInstallProfileViewController continueInstallFlowAfterPINVerification](self, "continueInstallFlowAfterPINVerification");
  }
}

void __51__MCInstallProfileViewController__beginInstallFlow__block_invoke(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  _QWORD block[4];
  id v7;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "continueInstallFlowAfterPINVerification");
    }
    else if (objc_msgSend(WeakRetained, "installHasFailed"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__MCInstallProfileViewController__beginInstallFlow__block_invoke_2;
      block[3] = &unk_1EA2B5BE8;
      objc_copyWeak(&v7, v3);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v7);
    }
  }

}

void __51__MCInstallProfileViewController__beginInstallFlow__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setInstallState:animated:", 1, 1);
    WeakRetained = v2;
  }

}

- (void)continueInstallFlowAfterPINVerification
{
  unsigned int v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MCInstallProfileViewController showProgressIndicator](self, "showProgressIndicator");
  v3 = MCUIForPairedDevice();
  v4 = v3;
  NSLog(CFSTR("MCInstallProfileViewController: continueInstallFlowAfterPINVerification for watch? %d"), v3);
  if ((v4 & 1) == 0)
  {
    -[MCInstallProfileViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[MCInstallProfileViewController profileData](self, "profileData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "installProfileData:interactionDelegate:", v10, self);
      goto LABEL_8;
    }
  }
  -[MCInstallProfileViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installationWarnings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

LABEL_6:
    -[MCInstallProfileViewController profile](self, "profile");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installationWarnings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallProfileViewController profileConnection:didShowUserWarnings:](self, "profileConnection:didShowUserWarnings:", 0, v10);
LABEL_8:

    return;
  }
  -[MCInstallProfileViewController profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedConsentText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_6;
  if (!-[MCInstallProfileViewController _attemptRemoteInstallAfterCompletingPrecheck](self, "_attemptRemoteInstallAfterCompletingPrecheck"))NSLog(CFSTR("Error: MCInstallProfileViewController's remote profile installation path was taken despite no Watch or delegate"));
}

- (void)continueInstallFlowAfterCompletingPrecheck
{
  id v3;

  -[MCInstallProfileViewController setProcessingPayload:](self, "setProcessingPayload:", 1);
  -[MCInstallProfileViewController setQuestionsAlreadyAsked:](self, "setQuestionsAlreadyAsked:", 1);
  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 2, 1);
  -[MCInstallProfileViewController showProgressIndicator](self, "showProgressIndicator");
  if (!-[MCInstallProfileViewController _attemptRemoteInstallAfterCompletingPrecheck](self, "_attemptRemoteInstallAfterCompletingPrecheck"))
  {
    NSLog(CFSTR("MCInstallProfileViewController using Managed Configuration to install profile locally"));
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "respondToWarningsContinueInstallation:", 1);

  }
}

- (BOOL)_attemptRemoteInstallAfterCompletingPrecheck
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  -[MCInstallProfileViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__MCInstallProfileViewController__attemptRemoteInstallAfterCompletingPrecheck__block_invoke;
  v13[3] = &unk_1EA2B5C70;
  objc_copyWeak(&v15, &location);
  v5 = v4;
  v14 = v5;
  v6 = (void *)MEMORY[0x1DF0AD9A4](v13);
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    NSLog(CFSTR("MCInstallProfileViewController installing profile on watch..."));
    +[MCUIWatchManager shared](MCUIWatchManager, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallProfileViewController profileData](self, "profileData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installProfileData:completion:", v9, v6);

  }
  else
  {
    -[MCInstallProfileViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = 0;
      goto LABEL_6;
    }
    NSLog(CFSTR("MCInstallProfileViewController installing profile via delegate..."));
    -[MCInstallProfileViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installProfileWithCompletionHandler:", v6);
  }

  v11 = 1;
LABEL_6:

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __78__MCInstallProfileViewController__attemptRemoteInstallAfterCompletingPrecheck__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_installFinishedWithIdentifier:error:", *(_QWORD *)(a1 + 32), v5);

}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
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
  block[2] = __72__MCInstallProfileViewController_profileConnection_didRequestUserInput___block_invoke;
  block[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__MCInstallProfileViewController_profileConnection_didRequestUserInput___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "questionsExtensionDidRequestAnswersForQuestions:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4
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
  block[2] = __72__MCInstallProfileViewController_profileConnection_didShowUserWarnings___block_invoke;
  block[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__MCInstallProfileViewController_profileConnection_didShowUserWarnings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "consentExtensionShowConsentAndWarnings:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)profileConnection:(id)a3 didUpdateStatus:(id)a4
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
  block[2] = __68__MCInstallProfileViewController_profileConnection_didUpdateStatus___block_invoke;
  block[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__MCInstallProfileViewController_profileConnection_didUpdateStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
    if (v3)
    {
      objc_msgSend(WeakRetained, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v3);

    }
    else
    {
      objc_msgSend(WeakRetained, "updateTitleForProfileInstallationState:", 2);
    }
    WeakRetained = v5;
  }

}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
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
  block[2] = __80__MCInstallProfileViewController_profileConnection_didFinishPreflightWithError___block_invoke;
  block[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __80__MCInstallProfileViewController_profileConnection_didFinishPreflightWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "questionsExtensionDidFinishPreflightWithError:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v7 = a4;
  v8 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__MCInstallProfileViewController_profileConnection_didFinishInstallationWithIdentifier_error___block_invoke;
  v11[3] = &unk_1EA2B5CC0;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __94__MCInstallProfileViewController_profileConnection_didFinishInstallationWithIdentifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_installFinishedWithIdentifier:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)profileConnection:(id)a3 didBeginInstallingNextProfile:(id)a4
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
  block[2] = __82__MCInstallProfileViewController_profileConnection_didBeginInstallingNextProfile___block_invoke;
  block[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__MCInstallProfileViewController_profileConnection_didBeginInstallingNextProfile___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setSecondaryProfileReceived:", 1);
    objc_msgSend(v3, "setProfile:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setInstallState:animated:", 2, 1);
    WeakRetained = v3;
  }

}

- (void)profileConnectionDidRequestCurrentPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCInstallProfileViewController pin](self, "pin");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondToCurrentPasscodeRequestContinue:passcode:", 1, v5);

}

- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D1C1F0], "currentPersonaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController setEnrollmentPersonaID:](self, "setEnrollmentPersonaID:", v9);

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke;
  v12[3] = &unk_1EA2B5CC0;
  objc_copyWeak(&v15, &location);
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setInstallState:", 5);
    objc_msgSend(v4, "hideProgressIndicatorWithShowButtons:", 1);
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_2;
    v6[3] = &unk_1EA2B5D10;
    objc_copyWeak(&v8, v2);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_signInMAID:completionHandler:", v5, v6);

    objc_destroyWeak(&v8);
  }

}

void __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_2(uint64_t a1, char a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;

  v7 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_3;
  v10[3] = &unk_1EA2B5CE8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v14 = a4;
  v8 = *(id *)(a1 + 32);
  v15 = a2;
  v11 = v8;
  v12 = v7;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
}

void __83__MCInstallProfileViewController_profileConnection_didRequestMAIDSignIn_personaID___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(WeakRetained, "_cancelInstallAfterMAIDAuthenticationAnimated:", 1);
    }
    else
    {
      objc_msgSend(WeakRetained, "showProgressIndicator");
      objc_msgSend(*(id *)(a1 + 32), "respondToMAIDAuthenticationRequest:error:isCancelled:", *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    }
    WeakRetained = v3;
  }

}

- (void)submitQuestionAnswers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 2, 1);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitUserInputResponses:", v4);

}

- (void)cancelInstallWhilePresentingQuestionsAnimated:(BOOL)a3
{
  id v3;

  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 1, a3);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelUserInputResponses");

}

- (void)_cancelInstallAfterMAIDAuthenticationAnimated:(BOOL)a3
{
  id v3;

  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 1, a3);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "respondToMAIDAuthenticationRequest:error:isCancelled:", 0, 0, 1);

}

- (void)cancelInstallWhilePresentingConsentAndWarningsAnimated:(BOOL)a3
{
  id v3;

  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 1, a3);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "respondToWarningsContinueInstallation:", 0);

}

- (void)cancelInstallWhilePresentingConsentAndWarningsUponDidAppear
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke;
  v8 = &unk_1EA2B5BE8;
  objc_copyWeak(&v9, &location);
  -[MCInstallProfileViewController setDidAppearBlock:](self, "setDidAppearBlock:", &v5);
  -[MCInstallProfileViewController navigationController](self, "navigationController", v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popToViewController:animated:", self, 1);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke_2;
  block[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __93__MCInstallProfileViewController_cancelInstallWhilePresentingConsentAndWarningsUponDidAppear__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "cancelInstallWhilePresentingConsentAndWarningsAnimated:", 1);
    WeakRetained = v2;
  }

}

- (void)_installFinishedWithIdentifier:(id)a3 error:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[MCInstallProfileViewController questionsExtensionInstallFinished](self, "questionsExtensionInstallFinished");
  if (v12)
  {
    -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 1, 0);
    -[MCInstallProfileViewController setInstallHasFailed:](self, "setInstallHasFailed:", 1);
    if (-[MCInstallProfileViewController _installErrorIsUserCancelledError:](self, "_installErrorIsUserCancelledError:", v12))
    {
      -[MCInstallProfileViewController setUserCancelledInstall:](self, "setUserCancelledInstall:", 1);
    }
    else
    {
      -[MCInstallProfileViewController _handleInstallationError:](self, "_handleInstallationError:", v12);
    }
    if (-[MCInstallProfileViewController secondaryProfileReceived](self, "secondaryProfileReceived"))
    {
      -[MCInstallProfileViewController originalProfileData](self, "originalProfileData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCInstallProfileViewController setProfileData:](self, "setProfileData:", v7);

      -[MCInstallProfileViewController setSecondaryProfileReceived:](self, "setSecondaryProfileReceived:", 0);
    }
  }
  else
  {
    -[MCInstallProfileViewController profileViewController](self, "profileViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInstallComplete:", 1);

    -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 9, 1);
    -[MCInstallProfileViewController originalProfile](self, "originalProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "needsReboot"))
    {

    }
    else
    {
      -[MCInstallProfileViewController profile](self, "profile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "needsReboot");

      if (!v9)
        goto LABEL_13;
    }
    -[MCInstallProfileViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MCInstallProfileViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "showRebootAlertAndReboot");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowRebootAlertFromViewController:", self);
    }
  }
LABEL_13:

}

- (BOOL)_installErrorIsUserCancelledError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v3 = a3;
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *MEMORY[0x1E0D471B8];
  v6 = *MEMORY[0x1E0D471D0];
  v7 = *MEMORY[0x1E0CB3388];
  while (1)
  {
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v5);

    if (!v9)
      break;
    if (objc_msgSend(v4, "code") == 4004)
      goto LABEL_11;
LABEL_8:
    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
    if (!v13)
    {
      v14 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v6);

  if (!v11 || objc_msgSend(v4, "code") != 24007)
    goto LABEL_8;
LABEL_11:
  v14 = 1;
LABEL_12:

  return v14;
}

- (void)_handleInstallationError:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MCInstallProfileViewController *v16;
  id v17;

  v16 = self;
  v17 = a3;
  objc_msgSend(v17, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedRecoverySuggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v5 = *MEMORY[0x1E0D46ED0];
    v6 = *MEMORY[0x1E0CB3388];
    v7 = v17;
    while (1)
    {
      objc_msgSend(v7, "userInfo", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedRecoverySuggestion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v7, "localizedRecoverySuggestion");
        v10 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v10;
      }
      objc_msgSend(v8, "objectForKey:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
            break;
        }
      }
      objc_msgSend(v8, "objectForKey:", v6);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
      if (!v13)
        goto LABEL_9;
    }
    v14 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "openURL:options:completionHandler:", v14, MEMORY[0x1E0C9AA70], 0);

  }
  else
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowAlertForError:fromViewController:suggestedTitle:suggestedMessage:completion:", v17, v16, v3, v4, 0, v16);
    v7 = 0;
  }

}

- (void)_cancelInstallDueToApplicationExit
{
  id v3;
  id v4;

  switch(-[MCInstallProfileViewController installState](self, "installState"))
  {
    case 1:
    case 9:
      -[MCInstallProfileViewController _takeMeBack](self, "_takeMeBack");
      break;
    case 2:
      -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 1, 0);
      break;
    case 3:
      -[MCInstallProfileViewController cancelInstallWhilePresentingConsentAndWarningsAnimated:](self, "cancelInstallWhilePresentingConsentAndWarningsAnimated:", 0);
      break;
    case 4:
      -[MCInstallProfileViewController cancelInstallWhilePresentingQuestionsAnimated:](self, "cancelInstallWhilePresentingQuestionsAnimated:", 0);
      break;
    case 5:
      -[MCInstallProfileViewController _cancelInstallAfterMAIDAuthenticationAnimated:](self, "_cancelInstallAfterMAIDAuthenticationAnimated:", 0);
      break;
    default:
      break;
  }
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popToViewController:animated:", self, 1);

}

- (void)showFinalInstallationAlert:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[MCInstallProfileViewController profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trustLevel") == 2;

  -[MCInstallProfileViewController profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocked");

  if (v8)
  {
    -[MCInstallProfileViewController profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removalPasscode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = CFSTR("BLOB_INSTALL_NOT_REMOVABLE_AUTH");
    else
      v11 = CFSTR("BLOB_INSTALL_NOT_REMOVABLE");
    MCUILocalizedString(v11);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }
  else
  {
    v19 = 0;
  }
  v12 = MCUIPreferAlert();
  if (MCUIPreferAlert())
  {
    MCUILocalizedString(CFSTR("BLOB_INSTALL_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = v12;
  if (v6)
    v15 = 0;
  else
    v15 = 2;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v13, v19, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("INSTALL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController addInstallActionWithTitle:style:toAlert:completion:](self, "addInstallActionWithTitle:style:toAlert:completion:", v17, v15, v16, v4);

  -[MCInstallProfileViewController addCancelActionToAlert:withCompletion:](self, "addCancelActionToAlert:withCompletion:", v16, v4);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "MCUIShowFromController:", v18);

}

- (void)showMDMFinalInstallationAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  MCUILocalizedStringByDevice(CFSTR("MOBILE_DEVICE_MANAGEMENT_WARNING"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA2E8];
  MCUILocalizedString(CFSTR("BLOB_MDM_ENROLL_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MCUILocalizedString(CFSTR("TRUST"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController addInstallActionWithTitle:style:toAlert:completion:](self, "addInstallActionWithTitle:style:toAlert:completion:", v8, 2, v7, v4);

  -[MCInstallProfileViewController addCancelActionToAlert:withCompletion:](self, "addCancelActionToAlert:withCompletion:", v7, v4);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MCUIShowFromController:", v9);

}

- (void)showReEnrollFailureAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  MCUILocalizedString(CFSTR("PROFILE_UPDATE_ERROR"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("PROFILE_REENROLL_ERROR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  MCUILocalizedString(CFSTR("OK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCUIAddCancelActionWithTitle:", v6);

  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCUIShowFromController:", v7);

}

- (void)addInstallActionWithTitle:(id)a3 style:(int64_t)a4 toAlert:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__MCInstallProfileViewController_addInstallActionWithTitle_style_toAlert_completion___block_invoke;
  v14[3] = &unk_1EA2B5D38;
  v13 = v12;
  v15 = v13;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "MCUIAddActionWithTitle:style:completion:", v10, a4, v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __85__MCInstallProfileViewController_addInstallActionWithTitle_style_toAlert_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "continueInstallFlowAfterCompletingPrecheck");
    WeakRetained = v4;
  }

}

- (void)addCancelActionToAlert:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  MCUILocalizedString(CFSTR("CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__MCInstallProfileViewController_addCancelActionToAlert_withCompletion___block_invoke;
  v10[3] = &unk_1EA2B5D38;
  v9 = v7;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "MCUIAddActionWithTitle:style:completion:", v8, 1, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __72__MCInstallProfileViewController_addCancelActionToAlert_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "cancelInstallWhilePresentingConsentAndWarningsAnimated:", 1);
    WeakRetained = v4;
  }

}

- (BOOL)profileViewControllerIsProfileInstalled
{
  return 0;
}

- (void)performRemoveAfterFinalVerification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  MCUILocalizedString(CFSTR("BLOB_REMOVING_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  -[MCInstallProfileViewController showProgressIndicator](self, "showProgressIndicator");
  -[MCInstallProfileViewController setProcessingPayload:](self, "setProcessingPayload:", 1);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke;
  v11 = &unk_1EA2B5D60;
  objc_copyWeak(&v12, &location);
  v5 = (void *)MEMORY[0x1DF0AD9A4](&v8);
  -[MCInstallProfileViewController profile](self, "profile", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController _removeProfileWithIdentifier:isProtectedProfile:completionHandler:](self, "_removeProfileWithIdentifier:isProtectedProfile:completionHandler:", v7, 0, v5);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke_2;
  v5[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __69__MCInstallProfileViewController_performRemoveAfterFinalVerification__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = WeakRetained;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowAlertForError:fromViewController:suggestedTitle:suggestedMessage:completion:", v3, WeakRetained, 0, 0, 0);
      WeakRetained = v4;
    }
    objc_msgSend(WeakRetained, "hideProgressIndicatorWithShowButtons:", 1);
    objc_msgSend(v4, "profileRemovalDidFinish");
    WeakRetained = v4;
  }

}

- (void)_removeProfileWithIdentifier:(id)a3 isProtectedProfile:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!-[MCInstallProfileViewController profileViewControllerIsProfileInstalled](self, "profileViewControllerIsProfileInstalled"))
  {
    if ((MCUIForPairedDevice() & 1) != 0)
      v12 = 2;
    else
      v12 = objc_msgSend(MEMORY[0x1E0D47220], "thisDeviceType");
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke;
    v19[3] = &unk_1EA2B5D88;
    v20 = v9;
    objc_msgSend(v13, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:completion:", v8, 1, v12, v19);

    v14 = v20;
LABEL_8:

    goto LABEL_9;
  }
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v6)
    {
      objc_msgSend(v15, "removeProtectedProfileAsyncWithIdentifier:installationType:completion:", v8, 1, v9);

      goto LABEL_9;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke_2;
    v17[3] = &unk_1EA2B5D88;
    v18 = v9;
    objc_msgSend(v16, "removeProfileWithIdentifier:installationType:completion:", v8, 1, v17);

    v14 = v18;
    goto LABEL_8;
  }
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeProfileIdentifier:completion:", v8, v9);

LABEL_9:
}

uint64_t __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__MCInstallProfileViewController__removeProfileWithIdentifier_isProtectedProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)profileRemovalDidFinish
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popViewControllerAnimated:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__MCInstallProfileViewController_profileRemovalDidFinish__block_invoke;
    v5[3] = &unk_1EA2B5C48;
    objc_copyWeak(&v6, &location);
    -[UIViewController MCUIReturnToSender:returnToAccountSettings:viewControllerDismissalBlock:](self, "MCUIReturnToSender:returnToAccountSettings:viewControllerDismissalBlock:", 1, 0, v5);
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __57__MCInstallProfileViewController_profileRemovalDidFinish__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", a2, 0);

    WeakRetained = v6;
  }

}

- (void)_signInMAID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  MCUISignInViewController *v10;

  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init(MCUISignInViewController);
  -[MCUISignInViewController setDelegate:](v10, "setDelegate:", self);
  v8 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  objc_msgSend(v8, "setIsEphemeral:", 0);
  objc_msgSend(v8, "setAuthenticationType:", 2);
  objc_msgSend(v8, "setPresentingViewController:", v10);
  objc_msgSend(v8, "setUsername:", v7);

  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  -[MCUISignInViewController setContext:](v10, "setContext:", v8);
  -[MCInstallProfileViewController setSignInCompletionHandler:](self, "setSignInCompletionHandler:", v6);

  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id location;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MCInstallProfileViewController signInCompletionHandler](self, "signInCompletionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v10)
    {
      -[MCInstallProfileViewController signInCompletionHandler](self, "signInCompletionHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id, _QWORD))v12)[2](v12, 0, v10, 0);

    }
    else
    {
      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
      block[3] = &unk_1EA2B5BE8;
      objc_copyWeak(&v21, &location);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v14 = (void *)objc_opt_new();
      v15 = *MEMORY[0x1E0C8F170];
      v23[0] = *MEMORY[0x1E0C8F030];
      v23[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCInstallProfileViewController enrollmentPersonaID](self, "enrollmentPersonaID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2;
      v18[3] = &unk_1EA2B5DB0;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v14, "signInAccountsWithTypes:authenticationResult:personaID:canMakeAccountActive:baseViewController:completionHandler:", v16, v9, v17, 0, self, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

}

void __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showProgressIndicator");
    WeakRetained = v2;
  }

}

void __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_3;
  block[3] = &unk_1EA2B5BE8;
  a1 += 4;
  objc_copyWeak(&v10, a1);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  WeakRetained = objc_loadWeakRetained(a1);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "signInCompletionHandler");
    if (a2)
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 1, 0, 0);
    }
    else
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id, _QWORD))v8)[2](v8, 0, v5, 0);
    }

  }
  objc_destroyWeak(&v10);

}

void __88__MCInstallProfileViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "MCUIHideProgressInNavBarShowBackButton:", 0);
    WeakRetained = v2;
  }

}

- (MCInstallProfileDelegate)delegate
{
  return (MCInstallProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MCProfile)originalProfile
{
  return self->_originalProfile;
}

- (void)setOriginalProfile:(id)a3
{
  objc_storeStrong((id *)&self->_originalProfile, a3);
}

- (NSData)profileData
{
  return self->_profileData;
}

- (NSData)originalProfileData
{
  return self->_originalProfileData;
}

- (void)setOriginalProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_originalProfileData, a3);
}

- (BOOL)processingPayload
{
  return self->_processingPayload;
}

- (void)setProcessingPayload:(BOOL)a3
{
  self->_processingPayload = a3;
}

- (BOOL)userCancelledInstall
{
  return self->_userCancelledInstall;
}

- (void)setUserCancelledInstall:(BOOL)a3
{
  self->_userCancelledInstall = a3;
}

- (BOOL)secondaryProfileReceived
{
  return self->_secondaryProfileReceived;
}

- (void)setSecondaryProfileReceived:(BOOL)a3
{
  self->_secondaryProfileReceived = a3;
}

- (id)signInCompletionHandler
{
  return self->_signInCompletionHandler;
}

- (void)setSignInCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSString)enrollmentPersonaID
{
  return self->_enrollmentPersonaID;
}

- (void)setEnrollmentPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (DMCProfileViewController)profileViewController
{
  return self->_profileViewController;
}

- (void)setProfileViewController:(id)a3
{
  objc_storeStrong((id *)&self->_profileViewController, a3);
}

- (MCInstallProfileQuestionViewController)questionsController
{
  return self->_questionsController;
}

- (void)setQuestionsController:(id)a3
{
  objc_storeStrong((id *)&self->_questionsController, a3);
}

- (int)installState
{
  return self->_installState;
}

- (BOOL)installHasFailed
{
  return self->_installHasFailed;
}

- (void)setInstallHasFailed:(BOOL)a3
{
  self->_installHasFailed = a3;
}

- (BOOL)questionsAlreadyAsked
{
  return self->_questionsAlreadyAsked;
}

- (void)setQuestionsAlreadyAsked:(BOOL)a3
{
  self->_questionsAlreadyAsked = a3;
}

- (BOOL)waitingForNextQuestion
{
  return self->_waitingForNextQuestion;
}

- (void)setWaitingForNextQuestion:(BOOL)a3
{
  self->_waitingForNextQuestion = a3;
}

- (BOOL)delayNextQuesion
{
  return self->_delayNextQuesion;
}

- (void)setDelayNextQuesion:(BOOL)a3
{
  self->_delayNextQuesion = a3;
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
  objc_storeStrong((id *)&self->_pin, a3);
}

- (NSArray)warnings
{
  return self->_warnings;
}

- (void)setWarnings:(id)a3
{
  objc_storeStrong((id *)&self->_warnings, a3);
}

- (id)didAppearBlock
{
  return self->_didAppearBlock;
}

- (void)setDidAppearBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (BOOL)isDeallocating
{
  return self->_isDeallocating;
}

- (void)setIsDeallocating:(BOOL)a3
{
  self->_isDeallocating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didAppearBlock, 0);
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_questionsController, 0);
  objc_storeStrong((id *)&self->_profileViewController, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_enrollmentPersonaID, 0);
  objc_storeStrong(&self->_signInCompletionHandler, 0);
  objc_storeStrong((id *)&self->_originalProfileData, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_originalProfile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)consentExtensionShowConsentAndWarnings:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MCInstallProfileViewController hideProgressIndicatorWithShowButtons:](self, "hideProgressIndicatorWithShowButtons:", 0);
  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 3, 1);
  -[MCInstallProfileViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedConsentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[MCInstallProfileViewController _presentConsent:](self, "_presentConsent:", v6);
  else
    -[MCInstallProfileViewController _didFinishPresentingConsent:](self, "_didFinishPresentingConsent:", v6);

}

- (void)installationConsentViewController:(id)a3 finishedWithUserContinueResponse:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;

  v4 = a4;
  NSLog(CFSTR("MCInstallProfileViewController+Consent finishedWithUserContinueResponse: %d"), a2, a3, a4);
  if (v4)
  {
    -[MCInstallProfileViewController warnings](self, "warnings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallProfileViewController _didFinishPresentingConsent:](self, "_didFinishPresentingConsent:", v6);

    -[MCInstallProfileViewController setWarnings:](self, "setWarnings:", 0);
  }
  else
  {
    -[MCInstallProfileViewController cancelInstallWhilePresentingConsentAndWarningsUponDidAppear](self, "cancelInstallWhilePresentingConsentAndWarningsUponDidAppear");
  }
}

- (void)_presentConsent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MCInstallationConsentViewController *v8;

  v4 = a3;
  NSLog(CFSTR("MCInstallProfileViewController+Consent presenting consent"));
  -[MCInstallProfileViewController setWarnings:](self, "setWarnings:", v4);
  v8 = -[MCInstallationConsentViewController initWithStyle:]([MCInstallationConsentViewController alloc], "initWithStyle:", 2);
  -[MCInstallProfileViewController profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallationConsentViewController setProfile:](v8, "setProfile:", v5);

  -[MCInstallationConsentViewController setConsentDelegate:](v8, "setConsentDelegate:", self);
  v6 = objc_msgSend(v4, "count");

  -[MCInstallationConsentViewController setShowInstall:](v8, "setShowInstall:", v6 == 0);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)_didFinishPresentingConsent:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    NSLog(CFSTR("MCInstallProfileViewController+Consent presenting warnings: %@"), v4);
    -[MCInstallProfileViewController warningsExtensionPushWarningsControllerWithWarnings:](self, "warningsExtensionPushWarningsControllerWithWarnings:", v4);
  }
  else if (-[MCInstallProfileViewController questionsAlreadyAsked](self, "questionsAlreadyAsked"))
  {
    NSLog(CFSTR("MCInstallProfileViewController+Consent continuing install flow"));
    -[MCInstallProfileViewController continueInstallFlowAfterCompletingPrecheck](self, "continueInstallFlowAfterCompletingPrecheck");
  }
  else
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__MCInstallProfileViewController_Consent___didFinishPresentingConsent___block_invoke;
    v5[3] = &unk_1EA2B5BE8;
    objc_copyWeak(&v6, &location);
    -[MCInstallProfileViewController showFinalInstallationAlert:](self, "showFinalInstallationAlert:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __71__MCInstallProfileViewController_Consent___didFinishPresentingConsent___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(CFSTR("MCInstallProfileViewController+Consent showing final installation alert"));
    objc_msgSend(WeakRetained, "navigationController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v1, "popToViewController:animated:", WeakRetained, 1);

  }
}

- (void)pinExtensionShowPINSheet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setDelegate:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v6);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  if (MCUIIsiPad())
    objc_msgSend(v3, "setModalTransitionStyle:", 2);
  if (MCUIForPairedDevice())
  {
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BPSApplyStyleToNavBar();

  }
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MCInstallProfileViewController_PIN__didAcceptEnteredPIN___block_invoke;
  v6[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[MCInstallProfileViewController _didFinishEnteringPINWithCompletion:](self, "_didFinishEnteringPINWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __59__MCInstallProfileViewController_PIN__didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setPin:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "continueInstallFlowAfterPINVerification");
    WeakRetained = v3;
  }

}

- (void)didCancelEnteringPIN
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__MCInstallProfileViewController_PIN__didCancelEnteringPIN__block_invoke;
  v3[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v4, &location);
  -[MCInstallProfileViewController _didFinishEnteringPINWithCompletion:](self, "_didFinishEnteringPINWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __59__MCInstallProfileViewController_PIN__didCancelEnteringPIN__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setInstallState:animated:", 1, 1);
    WeakRetained = v2;
  }

}

- (void)_didFinishEnteringPINWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke;
  v8[3] = &unk_1EA2B5DD8;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)MEMORY[0x1DF0AD9A4](v8);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "installHasFailed") & 1) == 0 && *(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke_2;
    block[3] = &unk_1EA2B5D88;
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __75__MCInstallProfileViewController_PIN___didFinishEnteringPINWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)questionsExtensionDidRequestAnswersForQuestions:(id)a3
{
  id v4;

  v4 = a3;
  -[MCInstallProfileViewController setInstallState:animated:](self, "setInstallState:animated:", 4, 1);
  if (-[MCInstallProfileViewController delayNextQuesion](self, "delayNextQuesion"))
    -[MCInstallProfileViewController _promptUserWithQuestionsAfterDelay:](self, "_promptUserWithQuestionsAfterDelay:", v4);
  else
    -[MCInstallProfileViewController _promptUserWithQuestions:](self, "_promptUserWithQuestions:", v4);

}

- (void)questionsExtensionDidFinishPreflightWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCInstallProfileViewController questionsController](self, "questionsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileConnectionDidFinishPreflightWithError:", v4);

}

- (void)questionsExtensionInstallFinished
{
  void *v3;
  id v4;

  if (-[MCInstallProfileViewController waitingForNextQuestion](self, "waitingForNextQuestion"))
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__finishWaitingForMoreQuestions, 0);
    -[MCInstallProfileViewController _finishWaitingForMoreQuestions](self, "_finishWaitingForMoreQuestions");
  }
  -[MCInstallProfileViewController hideProgressIndicatorWithShowButtons:](self, "hideProgressIndicatorWithShowButtons:", 1);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popToViewController:animated:", self, 1);

  -[MCInstallProfileViewController setQuestionsController:](self, "setQuestionsController:", 0);
}

- (void)setCurrentQuestionsController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MCInstallProfileViewController questionsController](self, "questionsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[MCInstallProfileViewController setQuestionsController:](self, "setQuestionsController:", v6);
    v5 = v6;
  }

}

- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    -[MCInstallProfileViewController submitQuestionAnswers:](self, "submitQuestionAnswers:", v5);
    -[MCInstallProfileViewController _waitForNextQuestion](self, "_waitForNextQuestion");
  }
  else
  {
    -[MCInstallProfileViewController cancelInstallWhilePresentingQuestionsAnimated:](self, "cancelInstallWhilePresentingQuestionsAnimated:", 1);
  }

}

- (void)_promptUserWithQuestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (-[MCInstallProfileViewController waitingForNextQuestion](self, "waitingForNextQuestion"))
  {
    -[MCInstallProfileViewController setWaitingForNextQuestion:](self, "setWaitingForNextQuestion:", 0);
    -[MCInstallProfileViewController questionsController](self, "questionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopWaitingForMoreInput");

  }
  -[MCInstallProfileViewController hideProgressIndicatorWithShowButtons:](self, "hideProgressIndicatorWithShowButtons:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BFA8]), "initWithUserInput:", v4);

  -[MCInstallProfileViewController setQuestionsController:](self, "setQuestionsController:", v6);
  -[MCInstallProfileViewController questionsController](self, "questionsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQuestionsDelegate:", self);

  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MCInstallProfileViewController questionsController](self, "questionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (void)_promptUserWithQuestionsAfterDelay:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke;
  v6[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[MCInstallProfileViewController setDidAppearBlock:](self, "setDidAppearBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDelayNextQuesion:", 0);

  v4 = dispatch_time(0, 2000000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke_2;
  v5[3] = &unk_1EA2B5C98;
  objc_copyWeak(&v7, v2);
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __80__MCInstallProfileViewController_Questions___promptUserWithQuestionsAfterDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_promptUserWithQuestions:", *(_QWORD *)(a1 + 32));

}

- (void)_waitForNextQuestion
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[MCInstallProfileViewController setWaitingForNextQuestion:](self, "setWaitingForNextQuestion:", 1);
  -[MCInstallProfileViewController questionsController](self, "questionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitForMoreInput");

  v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MCInstallProfileViewController_Questions___waitForNextQuestion__block_invoke;
  block[3] = &unk_1EA2B5BC0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

uint64_t __65__MCInstallProfileViewController_Questions___waitForNextQuestion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWaitingForMoreQuestions");
}

- (void)_finishWaitingForMoreQuestions
{
  void *v3;
  id v4;
  id v5;

  if (-[MCInstallProfileViewController waitingForNextQuestion](self, "waitingForNextQuestion"))
  {
    -[MCInstallProfileViewController setWaitingForNextQuestion:](self, "setWaitingForNextQuestion:", 0);
    -[MCInstallProfileViewController questionsController](self, "questionsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopWaitingForMoreInput");

    -[MCInstallProfileViewController showProgressIndicator](self, "showProgressIndicator");
    -[MCInstallProfileViewController setDelayNextQuesion:](self, "setDelayNextQuesion:", 1);
    -[MCInstallProfileViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popToViewController:animated:", self, 1);

  }
}

- (void)warningsExtensionPushWarningsControllerWithWarnings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MCInstallationWarningViewController *v9;

  v4 = a3;
  -[MCInstallProfileViewController profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MCInstallProfileViewController profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMDMProfile");

  }
  else
  {
    v7 = 0;
  }

  v9 = -[MCInstallationWarningViewController initWithStyle:]([MCInstallationWarningViewController alloc], "initWithStyle:", 2);
  -[MCInstallationWarningViewController setIsMDMInstall:](v9, "setIsMDMInstall:", v7);
  -[MCInstallationWarningViewController setWarnings:](v9, "setWarnings:", v4);

  -[MCInstallationWarningViewController setWarningDelegate:](v9, "setWarningDelegate:", self);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v9, 1);

}

- (void)installationWarningViewController:(id)a3 finishedWithUserContinueResponse:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id location;

  v6 = a3;
  if (!a4)
  {
    -[MCInstallProfileViewController cancelInstallWhilePresentingConsentAndWarningsUponDidAppear](self, "cancelInstallWhilePresentingConsentAndWarningsUponDidAppear");
    goto LABEL_17;
  }
  -[MCInstallProfileViewController profileViewController](self, "profileViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UIProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "finalInstallationWarningStyle");

  if (v9 == 1)
    goto LABEL_10;
  if (v9 == 3)
  {
    v9 = 1;
    goto LABEL_8;
  }
  if (v9 != 2)
  {
    v9 = 0;
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_8:
  v20 = 0;
  location = 0;
  v19 = 0;
  v10 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:outCount:photoCount:videoCount:", v11, &location, &v20, &v19);

  v12 = location != 0;
LABEL_11:
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __111__MCInstallProfileViewController_Warnings__installationWarningViewController_finishedWithUserContinueResponse___block_invoke;
  v17 = &unk_1EA2B5BE8;
  objc_copyWeak(&v18, &location);
  v13 = (void *)MEMORY[0x1DF0AD9A4](&v14);
  if (v12)
  {
    -[MCInstallProfileViewController _showCPLFinalInstallationWarning:withMDMWarning:](self, "_showCPLFinalInstallationWarning:withMDMWarning:", v13, v9, v14, v15, v16, v17);
  }
  else if ((_DWORD)v9)
  {
    -[MCInstallProfileViewController showMDMFinalInstallationAlert:](self, "showMDMFinalInstallationAlert:", v13, v14, v15, v16, v17);
  }
  else
  {
    -[MCInstallProfileViewController showFinalInstallationAlert:](self, "showFinalInstallationAlert:", v13, v14, v15, v16, v17);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
LABEL_17:

}

void __111__MCInstallProfileViewController_Warnings__installationWarningViewController_finishedWithUserContinueResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "popToViewController:animated:", v4, 1);

    WeakRetained = v4;
  }

}

- (void)_showCPLFinalInstallationWarning:(id)a3 withMDMWarning:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = MCUIPreferAlert();
  if (MCUIPreferAlert())
  {
    MCUILocalizedString(CFSTR("BLOB_INSTALL_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[MCInstallProfileViewController _localizedCPLFinalWarningString](self, "_localizedCPLFinalWarningString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, self);
    MCUILocalizedString(CFSTR("INSTALL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92__MCInstallProfileViewController_Warnings___showCPLFinalInstallationWarning_withMDMWarning___block_invoke;
    v14[3] = &unk_1EA2B5DD8;
    objc_copyWeak(&v16, &location);
    v15 = v6;
    objc_msgSend(v10, "MCUIAddActionWithTitle:style:completion:", v11, 2, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    MCUILocalizedString(CFSTR("INSTALL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallProfileViewController addInstallActionWithTitle:style:toAlert:completion:](self, "addInstallActionWithTitle:style:toAlert:completion:", v12, 2, v10, v6);

  }
  -[MCInstallProfileViewController addCancelActionToAlert:withCompletion:](self, "addCancelActionToAlert:withCompletion:", v10, v6);
  -[MCInstallProfileViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "MCUIShowFromController:", v13);

}

void __92__MCInstallProfileViewController_Warnings___showCPLFinalInstallationWarning_withMDMWarning___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "showMDMFinalInstallationAlert:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (id)_localizedCPLFinalWarningString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:outCount:photoCount:videoCount:", v3, &v11, &v10, &v9);

  if (v11 >= 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedStringByDevice(CFSTR("CLOUD_PHOTO_LIBRARY_RESTRICTION_PHOTOS_VIDEOS_WARNING_%d"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (v10 == 1)
  {
    v8 = CFSTR("CLOUD_PHOTO_LIBRARY_RESTRICTION_PHOTO_SINGULAR_WARNING");
LABEL_7:
    MCUILocalizedStringByDevice(v8);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (v9 == 1)
  {
    v8 = CFSTR("CLOUD_PHOTO_LIBRARY_RESTRICTION_VIDEO_SINGULAR_WARNING");
    goto LABEL_7;
  }
  return 0;
}

@end
