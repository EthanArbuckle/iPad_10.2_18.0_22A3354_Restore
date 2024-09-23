@implementation SFAccountDetailViewController

- (SFAccountDetailViewController)initWithSavedAccount:(id)a3 passwordWarning:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  SFAccountDetailViewController *v11;
  SFAccountDetailViewController *v12;
  void *v13;
  uint64_t v14;
  UIBarButtonItem *editBarButtonItem;
  uint64_t v16;
  UIBarButtonItem *shareBarButtonItem;
  uint64_t v18;
  UIBarButtonItem *cancelBarButtonItem;
  uint64_t v20;
  UIBarButtonItem *doneBarButtonItem;
  void *v22;
  void *v23;
  UIBarButtonItem **v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  ASAccountAuthenticationModificationController *v29;
  ASAccountAuthenticationModificationController *accountAuthenticationModificationController;
  SFAccountDetailViewController *v31;
  UIBarButtonItem *v33;
  UIBarButtonItem *v34;
  UIBarButtonItem *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = -[SFAccountDetailViewController initWithStyle:](self, "initWithStyle:", +[_SFAccountManagerAppearanceValues preferencesTableViewStyle](_SFAccountManagerAppearanceValues, "preferencesTableViewStyle"));
  v12 = v11;
  if (v11)
  {
    -[SFAccountDetailViewController navigationItem](v11, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_options = a5;
    if (-[SFAccountDetailViewController _allowEditing](v12, "_allowEditing"))
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, v12, sel__editBarButtonItemTapped_);
      editBarButtonItem = v12->_editBarButtonItem;
      v12->_editBarButtonItem = (UIBarButtonItem *)v14;

      -[UIBarButtonItem setAccessibilityIdentifier:](v12->_editBarButtonItem, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewNavigationBarEditButton"));
      -[SFAccountDetailViewController _createShareBarButtonItem](v12, "_createShareBarButtonItem");
      v16 = objc_claimAutoreleasedReturnValue();
      shareBarButtonItem = v12->_shareBarButtonItem;
      v12->_shareBarButtonItem = (UIBarButtonItem *)v16;

      -[UIBarButtonItem setAccessibilityIdentifier:](v12->_shareBarButtonItem, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewNavigationBarShareButton"));
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v12, sel__cancelBarButtonItemTapped_);
      cancelBarButtonItem = v12->_cancelBarButtonItem;
      v12->_cancelBarButtonItem = (UIBarButtonItem *)v18;

      -[UIBarButtonItem setAccessibilityIdentifier:](v12->_cancelBarButtonItem, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewNavigationBarCancelButton"));
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v12, sel__doneBarButtonItemTapped_);
      doneBarButtonItem = v12->_doneBarButtonItem;
      v12->_doneBarButtonItem = (UIBarButtonItem *)v20;

      -[UIBarButtonItem setAccessibilityIdentifier:](v12->_doneBarButtonItem, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewNavigationBarDoneButton"));
      objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isAirDropPasswordsAvailable") & 1) != 0)
      {
        v34 = v12->_editBarButtonItem;
        v35 = v12->_shareBarButtonItem;
        v23 = (void *)MEMORY[0x1E0C99D20];
        v24 = &v34;
        v25 = 2;
      }
      else
      {
        v33 = v12->_editBarButtonItem;
        v23 = (void *)MEMORY[0x1E0C99D20];
        v24 = &v33;
        v25 = 1;
      }
      objc_msgSend(v23, "arrayWithObjects:count:", v24, v25, v33, v34, v35, v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRightBarButtonItems:", v26);

    }
    -[UIBarButtonItem setEnabled:](v12->_shareBarButtonItem, "setEnabled:", objc_msgSend(v9, "isOneTimeSharable"));
    if (-[SFAccountDetailViewController _allowAuditing](v12, "_allowAuditing"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObserver:selector:name:object:", v12, sel__accountStoreDidUpdate, *MEMORY[0x1E0D8B490], 0);

    }
    objc_storeStrong((id *)&v12->_savedAccount, a3);
    objc_msgSend(v13, "backBarButtonItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewNavigationBarBackButton"));

    objc_storeStrong((id *)&v12->_passwordWarning, a4);
    v29 = (ASAccountAuthenticationModificationController *)objc_alloc_init(MEMORY[0x1E0C925A0]);
    accountAuthenticationModificationController = v12->_accountAuthenticationModificationController;
    v12->_accountAuthenticationModificationController = v29;

    -[ASAccountAuthenticationModificationController setDelegate:](v12->_accountAuthenticationModificationController, "setDelegate:", v12);
    -[ASAccountAuthenticationModificationController setPresentationContextProvider:](v12->_accountAuthenticationModificationController, "setPresentationContextProvider:", v12);
    -[SFAccountDetailViewController _updateCachedTOTPGenerators](v12, "_updateCachedTOTPGenerators");
    v12->_showPasswordAsBulletsWhenNotEditing = 1;
    v31 = v12;

  }
  return v12;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)_allowEditing
{
  return self->_options & 1;
}

- (BOOL)_allowAuditing
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (id)_passwordWarningManager
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "passwordWarningManagerForAccountDetailViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_passwordAuditor
{
  void *v2;
  void *v3;

  -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passwordAuditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_passwordEvaluator
{
  void *v2;
  void *v3;

  -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passwordEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_passwordGenerator
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "passwordGeneratorForAccountDetailViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  SFTableViewDiffableDataSource *v5;
  SFTableViewDiffableDataSource *tableViewDiffableDataSource;
  void *v7;
  UIEditMenuInteraction *v8;
  UIEditMenuInteraction *editMenuInteraction;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t, void *, void *);
  void *v14;
  id v15;
  objc_super v16;
  id location;

  objc_initWeak(&location, self);
  v16.receiver = self;
  v16.super_class = (Class)SFAccountDetailViewController;
  -[SFAccountDetailViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0D4EE40]);
  -[SFAccountDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __44__SFAccountDetailViewController_viewDidLoad__block_invoke;
  v14 = &unk_1E4ABFD40;
  objc_copyWeak(&v15, &location);
  v5 = (SFTableViewDiffableDataSource *)objc_msgSend(v3, "initWithTableView:cellProvider:", v4, &v11);
  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  self->_tableViewDiffableDataSource = v5;

  -[SFTableViewDiffableDataSource setDelegate:](self->_tableViewDiffableDataSource, "setDelegate:", self, v11, v12, v13, v14);
  -[SFTableViewDiffableDataSource setDefaultRowAnimation:](self->_tableViewDiffableDataSource, "setDefaultRowAnimation:", 0);
  -[SFAccountDetailViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SFDeviceIsPad())
    objc_msgSend(v7, "setCellLayoutMarginsFollowReadableWidth:", 1);
  objc_msgSend(v7, "setAllowsSelectionDuringEditing:", 1);
  objc_msgSend(v7, "_setTopPadding:", 20.0);
  objc_msgSend(v7, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("PasswordDetailView"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("NotesCell"));
  if (-[SFAccountDetailViewController _allowAuditing](self, "_allowAuditing") && !self->_passwordWarning)
    -[SFAccountDetailViewController _updateWarningForSavedAccount](self, "_updateWarningForSavedAccount");
  v8 = (UIEditMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", self);
  editMenuInteraction = self->_editMenuInteraction;
  self->_editMenuInteraction = v8;

  objc_msgSend(v7, "addInteraction:", self->_editMenuInteraction);
  if (self->_isForFillingIndividualAccountFields)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPressGesture_);
    objc_msgSend(v7, "addGestureRecognizer:", v10);

  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __44__SFAccountDetailViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_cellForIdentifier:indexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFAccountDetailViewController;
  -[SFAccountDetailViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addChangeObserver:", self);

  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SFAccountDetailViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_1E4AC07E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "extensionForDomain:completionHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__SFAccountDetailViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SFAccountDetailViewController_viewWillAppear___block_invoke_2;
    v6[3] = &unk_1E4ABFB20;
    v6[4] = WeakRetained;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __48__SFAccountDetailViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1272), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateAccountModificationOptions");
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSourceAnimated:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (self->_showsChangePasswordControllerOnAppearance)
  {
    self->_showsChangePasswordControllerOnAppearance = 0;
    -[SFAccountDetailViewController _showChangePasswordSafariViewController](self, "_showChangePasswordSafariViewController");
  }
  v5.receiver = self;
  v5.super_class = (Class)SFAccountDetailViewController;
  -[SFAccountDetailViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFAccountDetailViewController;
  -[SFAccountDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChangeObserver:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAccountDetailViewController;
  -[SFAccountDetailViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SFAccountDetailViewController safari_dismissPresentedAlert](self, "safari_dismissPresentedAlert");
}

- (void)_accountStoreDidUpdate
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_shouldIgnoreAccountStoreUpdates)
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke;
    block[3] = &unk_1E4ABFE00;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "savedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke_2;
  v5[3] = &unk_1E4ABFB20;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAccountStoreUpdateWithSavedAccounts:", *(_QWORD *)(a1 + 40));
}

- (void)_processAccountStoreUpdateWithSavedAccounts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  WBSSavedAccount **p_savedAccount;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id WeakRetained;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_changePasswordSafariViewController);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v27;
    obj = v5;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        p_savedAccount = &self->_savedAccount;
        -[WBSSavedAccount uniqueIdentifierForPasswordManagerLegacy](self->_savedAccount, "uniqueIdentifierForPasswordManagerLegacy", WeakRetained);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueIdentifierForPasswordManagerLegacy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          objc_storeStrong((id *)&self->_savedAccount, v11);
          if ((objc_msgSend(v11, "isEqual:", *p_savedAccount) & 1) != 0)
            goto LABEL_22;
          -[WBSSavedAccount password](*p_savedAccount, "password");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "password");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          v8 = 1;
          if ((v18 & 1) == 0)
          {
            if (WeakRetained)
            {
              objc_msgSend(WeakRetained, "setDismissButtonStyle:", 0);
              -[SFAccountDetailViewController _passwordEvaluator](self, "_passwordEvaluator");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "password");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "evaluatePassword:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "strength");

              if (v22 == 2)
              {
                self->_completedUpgradeToStrongPassword = 1;
                v23 = objc_loadWeakRetained((id *)&self->_delegate);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    objc_msgSend(v23, "setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:", v11);
                }

              }
LABEL_22:
              v5 = obj;

              goto LABEL_23;
            }
          }
        }
      }
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
        continue;
      break;
    }

    if ((v8 & 1) != 0)
      goto LABEL_23;
  }
  else
  {

  }
  if (self->_completedUpgradeToSignInWithApple)
  {
LABEL_23:
    -[SFAccountDetailViewController _updateSavedAccountChangeRequest](self, "_updateSavedAccountChangeRequest", WeakRetained);
    -[SFAccountDetailViewController _updateCachedTOTPGenerators](self, "_updateCachedTOTPGenerators");
    -[SFAccountDetailViewController _updateWarningForSavedAccount](self, "_updateWarningForSavedAccount");
    -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
    goto LABEL_24;
  }
  -[SFAccountDetailViewController _popViewController](self, "_popViewController");
LABEL_24:

}

- (void)_popViewController
{
  void *v3;
  SFAccountDetailViewController *v4;
  id v5;
  id v6;

  -[SFAccountDetailViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (SFAccountDetailViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[SFAccountDetailViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (id)_changePasswordURL
{
  return (id)-[WBSSavedAccount wellKnownChangePasswordURL](self->_savedAccount, "wellKnownChangePasswordURL");
}

- (void)_showChangePasswordSafariViewController
{
  void *v3;
  _BOOL4 v4;
  SFSafariViewControllerConfiguration *v5;
  SFSafariViewController *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SFAccountDetailViewController _changePasswordURL](self, "_changePasswordURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = -[UIViewController safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:](self, "safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:", v3);
    v3 = v9;
    if (v4)
    {
      v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
      -[SFSafariViewControllerConfiguration _setPerformingAccountSecurityUpgrade:](v5, "_setPerformingAccountSecurityUpgrade:", 1);
      v6 = -[SFSafariViewController initWithURL:configuration:]([SFSafariViewController alloc], "initWithURL:configuration:", v9, v5);
      -[SFAccountDetailViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSafariViewController setPreferredControlTintColor:](v6, "setPreferredControlTintColor:", v8);

      -[SFSafariViewController setDismissButtonStyle:](v6, "setDismissButtonStyle:", 2);
      -[SFSafariViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 1);
      -[SFSafariViewController setModalInPresentation:](v6, "setModalInPresentation:", 1);
      -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
      objc_storeWeak((id *)&self->_changePasswordSafariViewController, v6);

      v3 = v9;
    }
  }

}

- (void)_openChangePasswordURLInWebBrowser
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountDetailViewController _changePasswordURL](self, "_changePasswordURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CA57D8];
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_openURL:withOptions:completionHandler:", v4, v5, 0);

}

- (void)_editBarButtonItemTapped:(id)a3
{
  -[SFAccountDetailViewController _setEditing:animated:](self, "_setEditing:animated:", 1, 1);
}

- (void)_cancelChangesAndFinishEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void *v12;

  -[SFAccountDetailViewController _setEditing:animated:](self, "_setEditing:animated:", 0, 1);
  -[WBSSavedAccount user](self->_savedAccount, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[WBSSavedAccount password](self->_savedAccount, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[SFAccountNoteTableViewCell textDidChange](self->_notesCell, "textDidChange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SFAccountNoteTableViewCell textDidChange](self->_notesCell, "textDidChange");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

  }
  -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountHeaderViewCell titleTextField](self->_headerCell, "titleTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  -[SFAccountDetailViewController _configureHeaderViewCell:](self, "_configureHeaderViewCell:", self->_headerCell);
}

- (void)_cancelBarButtonItemTapped:(id)a3
{
  -[SFAccountDetailViewController _updateSavedAccountChangeRequest](self, "_updateSavedAccountChangeRequest", a3);
  if (-[WBSSavedAccountChangeRequest hasChanges](self->_savedAccountChangeRequest, "hasChanges"))
    -[SFAccountDetailViewController _presentDialogToConfirmCancelEditing](self, "_presentDialogToConfirmCancelEditing");
  else
    -[SFAccountDetailViewController _cancelChangesAndFinishEditing](self, "_cancelChangesAndFinishEditing");
}

- (void)_presentDialogToConfirmCancelEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v4, v5, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke;
  v20[3] = &unk_1E4AC0010;
  v20[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v16 = 3221225472;
  v17 = __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke_2;
  v18 = &unk_1E4AC0010;
  v19 = v6;
  v13 = v6;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14, v15, v16, v17, v18);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

uint64_t __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelChangesAndFinishEditing");
}

uint64_t __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_shareBarButtonItemTapped:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SFAccountDetailViewController__shareBarButtonItemTapped___block_invoke;
  v6[3] = &unk_1E4AC0810;
  v7 = v4;
  v5 = v4;
  -[SFAccountDetailViewController _sharePasswordWithPopoverPresentationControllerConfiguration:](self, "_sharePasswordWithPopoverPresentationControllerConfiguration:", v6);

}

uint64_t __59__SFAccountDetailViewController__shareBarButtonItemTapped___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBarButtonItem:", *(_QWORD *)(a1 + 32));
}

- (id)_groupSharingMenu
{
  void *v3;
  void *v4;
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
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC36F8];
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__SFAccountDetailViewController__groupSharingMenu__block_invoke;
  v20[3] = &unk_1E4AC0838;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v4, "elementWithUncachedProvider:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)MEMORY[0x1E0DC39D0];
  v8 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __50__SFAccountDetailViewController__groupSharingMenu__block_invoke_2;
  v18[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0DC39D0];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "menuWithTitle:children:", v15, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v16;
}

void __50__SFAccountDetailViewController__groupSharingMenu__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_allSharedCredentialGroupsMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a2)[2](v4, v5);

}

void __50__SFAccountDetailViewController__groupSharingMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_shareSavedAccountToSharedCredentialsGroup");

}

- (id)_allSharedCredentialGroupsMenu
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WBSSavedAccount *savedAccount;
  void *v22;
  void *v24;
  void *v25;
  id obj;
  id v27;
  _QWORD v29[5];
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  char v38;
  id location;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v2 = -[WBSSavedAccount isSavedInPersonalKeychain](self->_savedAccount, "isSavedInPersonalKeychain");
  _WBSLocalizedString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke;
  v36[3] = &unk_1E4AC0860;
  objc_copyWeak(&v37, &location);
  v38 = v2;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v24, v4, 0, v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setState:", v2);
  if ((v2 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_canMoveSavedAccount:toGroupWithID:", self->_savedAccount, 0),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(v25, "setAttributes:", 1);
  }
  objc_msgSend(v27, "addObject:", v25);
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[WBSSavedAccount sharedGroupID](self->_savedAccount, "sharedGroupID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "groupID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        v16 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v12, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke_2;
        v29[3] = &unk_1E4ABFA08;
        objc_copyWeak(&v30, &location);
        v31 = v15;
        v29[4] = v12;
        objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "setState:", v15);
        if ((v15 & 1) != 0)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        savedAccount = self->_savedAccount;
        objc_msgSend(v12, "groupID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(savedAccount) = objc_msgSend(v20, "_canMoveSavedAccount:toGroupWithID:", savedAccount, v22);

        if ((savedAccount & 1) == 0)
LABEL_11:
          objc_msgSend(v19, "setAttributes:", 1);
        objc_msgSend(v27, "addObject:", v19);

        objc_destroyWeak(&v30);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v9);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
  return v27;
}

void __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*(_BYTE *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentConfirmationAlertToShareSavedAccountToGroup:", 0);
    WeakRetained = v3;
  }

}

void __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(_BYTE *)(a1 + 48))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentConfirmationAlertToShareSavedAccountToGroup:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (id)_airDropMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!-[WBSSavedAccount isOneTimeSharable](self->_savedAccount, "isOneTimeSharable"))
    return MEMORY[0x1E0C9AA60];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC39D0];
  v4 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("airdrop"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__SFAccountDetailViewController__airDropMenu__block_invoke;
  v12[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v10;
}

void __45__SFAccountDetailViewController__airDropMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__SFAccountDetailViewController__airDropMenu__block_invoke_2;
    v3[3] = &unk_1E4AC0810;
    v3[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_sharePasswordWithPopoverPresentationControllerConfiguration:", v3);
  }

}

uint64_t __45__SFAccountDetailViewController__airDropMenu__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBarButtonItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
}

- (void)_presentConfirmationAlertToShareSavedAccountToGroup:(id)a3
{
  id v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
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
  _QWORD v42[4];
  id v43;
  id v44;
  id location;
  _QWORD v46[5];

  v4 = a3;
  v5 = -[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes");
  v6 = -[WBSSavedAccount isSavedInPersonalKeychain](self->_savedAccount, "isSavedInPersonalKeychain");
  -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v4;
  objc_msgSend(v4, "groupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "savedAccountsForGroupID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "savedAccountsFromGroup:containsPasswordFromSavedAccount:", v10, self->_savedAccount);

  v12 = 0;
  if ((v5 & 1) != 0 && v6 && (v11 & 1) == 0)
  {
    -[WBSPasswordWarning localizedAlertWarningForSharingReusedPassword](self->_passwordWarning, "localizedAlertWarningForSharingReusedPassword");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount sharedGroupID](self->_savedAccount, "sharedGroupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cachedGroupWithID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayName");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "displayName");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v39 = (void *)v16;
  v40 = v15;
  if (v17 && v16)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForMovingSavedAccount:fromGroupWithName:", self->_savedAccount, v16);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v20 = (void *)v19;
    goto LABEL_13;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForMovingSavedAccount:toMyPasswordsFromGroup:", self->_savedAccount, v15);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForMovingSavedAccount:fromMyPasswordsToGroupWithName:", self->_savedAccount, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v20 = 0;
LABEL_13:
  if (v12)
    v21 = v12;
  else
    v21 = v20;
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForMovingSavedAccount:toGroupWithName:", self->_savedAccount, v18);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v22;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:imageNamed:preferredStyle:", v36, v22, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v12, "length");
  v25 = MEMORY[0x1E0C809B0];
  if (v24)
  {
    v26 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v25;
    v46[1] = 3221225472;
    v46[2] = __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke;
    v46[3] = &unk_1E4AC0010;
    v46[4] = self;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v28);

  }
  v38 = v20;
  _WBSLocalizedString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v30 = (void *)MEMORY[0x1E0DC3448];
  v42[0] = v25;
  v42[1] = 3221225472;
  v42[2] = __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_2;
  v42[3] = &unk_1E4AC0888;
  objc_copyWeak(&v44, &location);
  v31 = v41;
  v43 = v31;
  objc_msgSend(v30, "actionWithTitle:style:handler:", v29, 0, v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v32);

  v33 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 1, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v35);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

uint64_t __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_openChangePasswordURLInWebBrowser");
  else
    return objc_msgSend(v3, "_showChangePasswordSafariViewController");
}

void __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  _QWORD *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = WeakRetained[127];
    objc_msgSend(*(id *)(a1 + 32), "groupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v3, "_moveSavedAccount:toGroupWithID:", v4, v5);

    if ((v4 & 1) == 0)
    {
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_3;
      v9 = &unk_1E4ABFB20;
      v10 = WeakRetained;
      v11 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], &v6);

    }
    objc_msgSend(WeakRetained, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0, v6, v7, v8, v9, v10);
  }

}

uint64_t __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentErrorAlertForFailingToMoveAccountToGroup:", *(_QWORD *)(a1 + 40));
}

- (void)_presentErrorAlertForFailingToMoveAccountToGroup:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D6C058];
  v5 = a3;
  objc_msgSend(v4, "alertTitleForFailingToMoveToGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D6C058];
  v18[0] = self->_savedAccount;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "alertSubtitleForFailingToMoveSavedAccounts:toGroupWithName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:imageNamed:preferredStyle:", v6, v10, CFSTR("alert-passwords"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__SFAccountDetailViewController__presentErrorAlertForFailingToMoveAccountToGroup___block_invoke;
  v16[3] = &unk_1E4AC0010;
  v17 = v11;
  v14 = v11;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v15);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __82__SFAccountDetailViewController__presentErrorAlertForFailingToMoveAccountToGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_shareSavedAccountToSharedCredentialsGroup
{
  SFSharedAccountsGroupCreationFlowNavigationController *v3;
  void *v4;
  SFSharedAccountsGroupCreationFlowNavigationController *v5;

  v3 = [SFSharedAccountsGroupCreationFlowNavigationController alloc];
  -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFSharedAccountsGroupCreationFlowNavigationController initWithOriginType:initialParticipants:passwordWarningManager:](v3, "initWithOriginType:initialParticipants:passwordWarningManager:", 2, 0, v4);

  -[SFSharedAccountsGroupCreationFlowNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
  -[SFSharedAccountsGroupCreationFlowNavigationController setModalInPresentation:](v5, "setModalInPresentation:", 1);
  -[SFSharedAccountsGroupCreationFlowNavigationController setSharingDelegate:](v5, "setSharingDelegate:", self);
  -[SFSharedAccountsGroupCreationFlowNavigationController setSavedAccountToMoveToNewlyCreatedGroup:](v5, "setSavedAccountToMoveToNewlyCreatedGroup:", self->_savedAccount);
  self->_shouldIgnoreAccountStoreUpdates = 1;
  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *userForEditing;
  void *v12;
  NSString *v13;
  NSString *passwordForEditing;
  void *v15;
  NSString *v16;
  NSString *notesForEditing;
  void *v18;
  NSString *v19;
  NSString *titleForEditing;
  void *v21;
  UIBarButtonItem *shareBarButtonItem;
  void *v23;
  UIBarButtonItem **p_editBarButtonItem;
  uint64_t v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  _QWORD block[5];
  BOOL v31;
  objc_super v32;
  UIBarButtonItem *editBarButtonItem;
  _QWORD v34[2];
  _QWORD v35[2];

  v4 = a4;
  v5 = a3;
  v35[1] = *MEMORY[0x1E0C80C00];
  if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing"))
  {
    v32.receiver = self;
    v32.super_class = (Class)SFAccountDetailViewController;
    -[SFAccountDetailViewController setEditing:animated:](&v32, sel_setEditing_animated_, v5, v4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SFAccountDetailViewController__setEditing_animated___block_invoke;
    block[3] = &unk_1E4AC08D8;
    block[4] = self;
    v31 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (v5)
    {
      -[SFAccountDetailViewController _revealPasswordIfNecessary](self, "_revealPasswordIfNecessary");
      -[SFAccountDetailViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItem:animated:", self->_cancelBarButtonItem, v4);
      v35[0] = self->_doneBarButtonItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItems:animated:", v8, v4);

      -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      userForEditing = self->_userForEditing;
      self->_userForEditing = v10;

      -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      passwordForEditing = self->_passwordForEditing;
      self->_passwordForEditing = v13;

      -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "text");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      notesForEditing = self->_notesForEditing;
      self->_notesForEditing = v16;

      -[SFAccountHeaderViewCell titleTextField](self->_headerCell, "titleTextField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "text");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      titleForEditing = self->_titleForEditing;
      self->_titleForEditing = v19;

    }
    else
    {
      -[SFAccountDetailViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItem:animated:", 0, v4);
      objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isAirDropPasswordsAvailable") & 1) != 0)
      {
        shareBarButtonItem = self->_shareBarButtonItem;
        v34[0] = self->_editBarButtonItem;
        v34[1] = shareBarButtonItem;
        v23 = (void *)MEMORY[0x1E0C99D20];
        p_editBarButtonItem = (UIBarButtonItem **)v34;
        v25 = 2;
      }
      else
      {
        editBarButtonItem = self->_editBarButtonItem;
        v23 = (void *)MEMORY[0x1E0C99D20];
        p_editBarButtonItem = &editBarButtonItem;
        v25 = 1;
      }
      objc_msgSend(v23, "arrayWithObjects:count:", p_editBarButtonItem, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItems:animated:", v26, v4);

      v27 = self->_userForEditing;
      self->_userForEditing = 0;

      v28 = self->_passwordForEditing;
      self->_passwordForEditing = 0;

      v29 = self->_notesForEditing;
      self->_notesForEditing = 0;

      v18 = self->_titleForEditing;
      self->_titleForEditing = 0;
    }

  }
}

void __54__SFAccountDetailViewController__setEditing_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  _QWORD v12[4];
  id v13;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cellsThatChangeAppearanceOnEdit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__SFAccountDetailViewController__setEditing_animated___block_invoke_2;
  v12[3] = &unk_1E4AC08B0;
  v11 = v2;
  v13 = v11;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "reconfigureItemsWithIdentifiers:", v4);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "count"))
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v11, "deleteItemsWithIdentifiers:", &unk_1E4B26A28);
      goto LABEL_9;
    }
    objc_msgSend(v11, "sectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", &unk_1E4B25648);

    if (v6)
    {
      v7 = &unk_1E4B269F8;
      v8 = &unk_1E4B25648;
    }
    else
    {
      objc_msgSend(v11, "sectionIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", &unk_1E4B25678);

      if (!v10)
        goto LABEL_9;
      v7 = &unk_1E4B26A10;
      v8 = &unk_1E4B25678;
    }
    objc_msgSend(v11, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, v8);
  }
LABEL_9:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "credentialTypes") == 2)
    objc_msgSend(*(id *)(a1 + 32), "_updateAddPasswordButton:forSnapshot:", *(unsigned __int8 *)(a1 + 40), v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "applySnapshot:animatingDifferences:", v11, 1);

}

uint64_t __54__SFAccountDetailViewController__setEditing_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)_updateAddPasswordButton:(BOOL)a3 forSnapshot:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = a4;
  v8 = v5;
  if (v4)
  {
    objc_msgSend(v5, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", &unk_1E4B26A40, &unk_1E4B25660);
    objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26A58, &unk_1E4B25678);
  }
  else
  {
    objc_msgSend(v5, "sectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", &unk_1E4B25678);

    if (v7)
      objc_msgSend(v8, "deleteSectionsWithIdentifiers:", &unk_1E4B26A70);
  }

}

- (id)_createShareBarButtonItem
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImage:style:target:action:", v4, 0, self, sel__shareBarButtonItemTapped_);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFAccountDetailViewController;
  -[SFAccountDetailViewController dealloc](&v4, sel_dealloc);
}

- (void)_handleLongPressGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "state") == 1)
  {
    -[SFAccountDetailViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[SFAccountDetailViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForRowAtPoint:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu");
      v11 = (void *)MEMORY[0x1E0DC3798];
      -[SFAccountDetailViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rectForRowAtIndexPath:", v10);
      UIRectGetCenter();
      objc_msgSend(v11, "configurationWithIdentifier:sourcePoint:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v13);
    }

  }
}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SFAccountHeaderViewCell *v12;
  SFAccountHeaderViewCell *v13;
  SFAccountHeaderViewCell **p_headerCell;
  UITableViewCell *v15;
  void *v16;
  SFAccountNoteTableViewCell *v17;
  SFAccountNoteTableViewCell *notesCell;
  NSString *notesForEditing;
  void *v20;
  SFEditableTableViewCell *v21;
  SFEditableTableViewCell *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SFEditableTableViewCell *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  SFAccountDetailTOTPTableViewCell *v37;
  UITableViewCell **p_setupTOTPCodeCell;
  UITableViewCell *setupTOTPCodeCell;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  SFEditableTableViewCell *v44;
  void *v45;
  void *v46;
  void *v47;
  SFEditableTableViewCell *v48;
  uint64_t v49;
  SFSecurityRecommendationInfoCell *v50;
  SFSecurityRecommendationInfoCell *securityRecommendationInfoCell;
  char v52;
  uint64_t v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UITableViewCell *upgradeToSignInWithAppleCell;
  UITableViewCell *v66;
  UITableViewCell *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  UITableViewCell *changeToStrongPasswordCell;
  UITableViewCell *v76;
  UITableViewCell *v77;
  void *v78;
  id v79;
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
  UITableViewCell **p_changePasswordOnWebsiteCell;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
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
  id v112;
  _BOOL4 isForFillingIndividualAccountFields;
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
  void *v126;
  SFEditableTableViewCell *v127;
  SFEditableTableViewCell *userCell;
  void *v129;
  SFEditableTableViewCell *v130;
  SFEditableTableViewCell *passwordCell;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  _QWORD v148[4];
  id v149;
  id location;
  const __CFString *v151;
  void *v152;
  _QWORD v153[6];
  _QWORD v154[6];
  uint64_t v155;
  _QWORD v156[3];

  v156[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v6);
  if (-[SFAccountDetailViewController isEditing](self, "isEditing"))
    v9 = 2;
  else
    v9 = 0;
  if (UIAccessibilityButtonShapesEnabled())
  {
    v155 = *MEMORY[0x1E0DC3320];
    v156[0] = &unk_1E4B256A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, &v155, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }
  switch(v8)
  {
    case 0:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dequeueReusableCellWithIdentifier:", CFSTR("AccountHeaderCell"));
      v12 = (SFAccountHeaderViewCell *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
        v13 = -[SFAccountHeaderViewCell initWithStyle:reuseIdentifier:]([SFAccountHeaderViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AccountHeaderCell"));
      p_headerCell = &self->_headerCell;
      objc_storeStrong((id *)&self->_headerCell, v13);
      if (!v12)

      -[SFAccountDetailViewController _configureHeaderViewCell:](self, "_configureHeaderViewCell:", *p_headerCell);
      v15 = (UITableViewCell *)*p_headerCell;
      goto LABEL_55;
    case 1:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dequeueReusableCellWithIdentifier:", CFSTR("editableTableViewCell"));
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing"))
          v24 = -[SFAccountDetailViewController isEditing](self, "isEditing");
        else
          v24 = 0;
        v22 = -[SFEditableTableViewCell initWithEnabledState:]([SFEditableTableViewCell alloc], "initWithEnabledState:", v24);
      }
      -[SFAccountDetailViewController _configureUserCell:](self, "_configureUserCell:", v22);
      -[SFAccountDetailViewController _editableCellWithCell:](self, "_editableCellWithCell:", v22);
      v127 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();
      userCell = self->_userCell;
      self->_userCell = v127;

      -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "setDelegate:", self);

      -[SFEditableTableViewCell setEnabled:](self->_userCell, "setEnabled:", -[SFAccountDetailViewController isEditing](self, "isEditing"));
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v26);

      -[SFAccountDetailViewController _passkeyCreationDateString](self, "_passkeyCreationDateString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSecondaryText:", v27);

      -[SFAccountDetailViewController tableView](self, "tableView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dequeueReusableCellWithIdentifier:", CFSTR("PasskeyCell"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        v31 = v29;
      else
        v31 = (SFEditableTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PasskeyCell"));
      v22 = v31;

      -[SFEditableTableViewCell setContentConfiguration:](v22, "setContentConfiguration:", v25);
      break;
    case 3:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dequeueReusableCellWithIdentifier:", CFSTR("editableTableViewCell"));
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing"))
          v33 = -[SFAccountDetailViewController isEditing](self, "isEditing");
        else
          v33 = 0;
        v22 = -[SFEditableTableViewCell initWithEnabledState:]([SFEditableTableViewCell alloc], "initWithEnabledState:", v33);
      }
      -[SFAccountDetailViewController _configurePasswordCell:](self, "_configurePasswordCell:", v22);
      -[SFAccountDetailViewController _editableCellWithCell:](self, "_editableCellWithCell:", v22);
      v130 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();
      passwordCell = self->_passwordCell;
      self->_passwordCell = v130;

      -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setDelegate:", self);

      v133 = (void *)MEMORY[0x1E0DC37E8];
      -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "font");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "pointSize");
      objc_msgSend(v133, "monospacedSystemFontOfSize:weight:");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "setFont:", v136);

      -[SFEditableTableViewCell setEnabled:](self->_passwordCell, "setEnabled:", -[SFAccountDetailViewController isEditing](self, "isEditing"));
      break;
    case 4:
      -[SFAccountDetailViewController _groupPickerTableViewCell](self, "_groupPickerTableViewCell");
      v21 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 5:
      -[SFAccountDetailViewController _originalContributorCell](self, "_originalContributorCell");
      v21 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 6:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dequeueReusableCellWithIdentifier:", CFSTR("TOTPCell"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
        v37 = v35;
      else
        v37 = -[SFAccountDetailTOTPTableViewCell initWithStyle:reuseIdentifier:]([SFAccountDetailTOTPTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("TOTPCell"));
      v22 = (SFEditableTableViewCell *)v37;

      -[SFEditableTableViewCell configureWithGenerator:](v22, "configureWithGenerator:", v6);
      isForFillingIndividualAccountFields = self->_isForFillingIndividualAccountFields;
      if (self->_isForFillingIndividualAccountFields)
      {
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v114 = 0;
      }
      -[SFEditableTableViewCell setOverrideVerificationCodeLabelTextColor:](v22, "setOverrideVerificationCodeLabelTextColor:", v114);
      if (isForFillingIndividualAccountFields)

      objc_storeStrong((id *)&self->_TOTPCodeCell, v22);
      break;
    case 7:
      p_setupTOTPCodeCell = &self->_setupTOTPCodeCell;
      setupTOTPCodeCell = self->_setupTOTPCodeCell;
      if (setupTOTPCodeCell)
      {
        v40 = 0;
      }
      else
      {
        -[SFAccountDetailViewController tableView](self, "tableView");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "dequeueReusableCellWithIdentifier:", CFSTR("TOTPSetupCell"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v110;
        if (v110)
          v112 = v110;
        else
          v112 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("TOTPSetupCell"));
        v40 = v112;

        _WBSLocalizedString();
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "textLabel");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "setText:", v138);

        objc_msgSend(v40, "detailTextLabel");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setText:", 0);

        objc_msgSend(v40, "detailTextLabel");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setAttributedText:", 0);

        objc_msgSend(v40, "editableTextField");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "setText:", 0);

        objc_msgSend(v40, "textLabel");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "setNumberOfLines:", 0);

        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "textLabel");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setTintColor:", v144);

        objc_msgSend(v40, "textLabel");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "_setTextColorFollowsTintColor:", 1);

        objc_storeStrong((id *)p_setupTOTPCodeCell, v40);
        setupTOTPCodeCell = *p_setupTOTPCodeCell;
      }
      -[UITableViewCell textLabel](setupTOTPCodeCell, "textLabel");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setTintAdjustmentMode:", v9);

      v22 = *p_setupTOTPCodeCell;
      break;
    case 8:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dequeueReusableCellWithIdentifier:", CFSTR("TOTPDeleteCell"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42)
        v44 = v42;
      else
        v44 = (SFEditableTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("TOTPDeleteCell"));
      v22 = v44;

      _WBSLocalizedString();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "setText:", v115);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "setTextColor:", v117);

      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setNumberOfLines:", 0);

      break;
    case 9:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "dequeueReusableCellWithIdentifier:", CFSTR("AddPasswordCell"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v46)
        v48 = v46;
      else
        v48 = (SFEditableTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AddPasswordCell"));
      v22 = v48;

      _WBSLocalizedString();
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setText:", v120);

      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "_setTextColorFollowsTintColor:", 1);

      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setNumberOfLines:", 0);

      +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setTintColor:", v124);

      break;
    case 10:
      v49 = 1192;
      if (!self->_securityRecommendationInfoCell)
      {
        v50 = -[SFSecurityRecommendationInfoCell initWithConfiguration:reuseIdentifier:]([SFSecurityRecommendationInfoCell alloc], "initWithConfiguration:reuseIdentifier:", 0, 0);
        securityRecommendationInfoCell = self->_securityRecommendationInfoCell;
        self->_securityRecommendationInfoCell = v50;

        -[SFSecurityRecommendationInfoCell setDelegate:](self->_securityRecommendationInfoCell, "setDelegate:", self);
        v52 = -[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes");
        v153[0] = CFSTR("priority");
        v53 = -[WBSPasswordWarning severity](self->_passwordWarning, "severity");
        v54 = CFSTR("standard");
        if (v53 == 1)
          v54 = CFSTR("high");
        v154[0] = v54;
        v153[1] = CFSTR("domain");
        -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v154[1] = v55;
        v153[2] = CFSTR("user");
        -[WBSSavedAccount user](self->_savedAccount, "user");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v56;
        v58 = CFSTR("true");
        if ((v52 & 1) != 0)
          v59 = CFSTR("true");
        else
          v59 = CFSTR("false");
        v154[2] = v56;
        v154[3] = v59;
        v153[3] = CFSTR("reused");
        v153[4] = CFSTR("weak");
        v153[5] = CFSTR("compromised");
        if ((v52 & 2) != 0)
          v60 = CFSTR("true");
        else
          v60 = CFSTR("false");
        if ((v52 & 0xC) == 0)
          v58 = CFSTR("false");
        v154[4] = v60;
        v154[5] = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 6);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        WBSMakeAccessibilityIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell setAccessibilityIdentifier:](self->_securityRecommendationInfoCell, "setAccessibilityIdentifier:", v62);

        -[SFSecurityRecommendationInfoCell titleLabel](self->_securityRecommendationInfoCell, "titleLabel");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewSecurityRecommendationsCellTitle"));

        -[SFSecurityRecommendationInfoCell subtitleLabel](self->_securityRecommendationInfoCell, "subtitleLabel");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewSecurityRecommendationsCellSubtitle"));

      }
      -[SFAccountDetailViewController _configureSecurityRecommendationInfoCell](self, "_configureSecurityRecommendationInfoCell");
      goto LABEL_54;
    case 11:
      upgradeToSignInWithAppleCell = self->_upgradeToSignInWithAppleCell;
      if (!upgradeToSignInWithAppleCell)
      {
        v66 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("upgradeToSignInWithApple"));
        v67 = self->_upgradeToSignInWithAppleCell;
        self->_upgradeToSignInWithAppleCell = v66;

        -[UITableViewCell textLabel](self->_upgradeToSignInWithAppleCell, "textLabel");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "_setTextColorFollowsTintColor:", 1);

        _WBSLocalizedString();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell textLabel](self->_upgradeToSignInWithAppleCell, "textLabel");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setText:", v69);

        -[UITableViewCell textLabel](self->_upgradeToSignInWithAppleCell, "textLabel");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setNumberOfLines:", 0);

        -[UITableViewCell setAccessibilityIdentifier:](self->_upgradeToSignInWithAppleCell, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewSignInWithAppleUpgradeCell"));
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell textLabel](self->_upgradeToSignInWithAppleCell, "textLabel");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setTintColor:", v72);

        upgradeToSignInWithAppleCell = self->_upgradeToSignInWithAppleCell;
      }
      -[UITableViewCell textLabel](upgradeToSignInWithAppleCell, "textLabel");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setTintAdjustmentMode:", v9);

      v15 = self->_upgradeToSignInWithAppleCell;
      goto LABEL_55;
    case 12:
      v49 = 1256;
      changeToStrongPasswordCell = self->_changeToStrongPasswordCell;
      if (!changeToStrongPasswordCell)
      {
        v76 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("changeToStrongPassword"));
        v77 = self->_changeToStrongPasswordCell;
        self->_changeToStrongPasswordCell = v76;

        -[UITableViewCell textLabel](self->_changeToStrongPasswordCell, "textLabel");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "_setTextColorFollowsTintColor:", 1);

        v79 = objc_alloc(MEMORY[0x1E0CB3498]);
        _WBSLocalizedString();
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = (void *)objc_msgSend(v79, "initWithString:attributes:", v80, v10);
        -[UITableViewCell textLabel](self->_changeToStrongPasswordCell, "textLabel");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setAttributedText:", v81);

        -[UITableViewCell textLabel](self->_changeToStrongPasswordCell, "textLabel");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setNumberOfLines:", 0);

        -[UITableViewCell setAccessibilityIdentifier:](self->_changeToStrongPasswordCell, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewChangeToStrongPasswordUpgradeCell"));
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell textLabel](self->_changeToStrongPasswordCell, "textLabel");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setTintColor:", v84);

        changeToStrongPasswordCell = self->_changeToStrongPasswordCell;
      }
      -[UITableViewCell textLabel](changeToStrongPasswordCell, "textLabel");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setTintAdjustmentMode:", v9);

LABEL_54:
      v15 = *(UITableViewCell **)((char *)&self->super.super.super.super.isa + v49);
LABEL_55:
      v21 = v15;
      goto LABEL_63;
    case 13:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "dequeueReusableCellWithIdentifier:", CFSTR("changePassword"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v88;
      if (!v88)
        v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("changePassword"));
      p_changePasswordOnWebsiteCell = &self->_changePasswordOnWebsiteCell;
      objc_storeStrong((id *)&self->_changePasswordOnWebsiteCell, v89);
      if (!v88)

      -[UITableViewCell setAccessibilityIdentifier:](*p_changePasswordOnWebsiteCell, "setAccessibilityIdentifier:", CFSTR("ChangePasswordOnWebsiteCell"));
      -[UITableViewCell textLabel](*p_changePasswordOnWebsiteCell, "textLabel");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setTintAdjustmentMode:", v9);

      -[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes");
      _WBSLocalizedString();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v102, v10);
      -[UITableViewCell textLabel](*p_changePasswordOnWebsiteCell, "textLabel");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setAttributedText:", v103);

      -[UITableViewCell textLabel](*p_changePasswordOnWebsiteCell, "textLabel");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setNumberOfLines:", 0);

      -[UITableViewCell textLabel](*p_changePasswordOnWebsiteCell, "textLabel");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "_setTextColorFollowsTintColor:", 1);

      +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell textLabel](*p_changePasswordOnWebsiteCell, "textLabel");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setTintColor:", v107);

      v22 = *p_changePasswordOnWebsiteCell;
      break;
    case 14:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dequeueReusableCellWithIdentifier:", CFSTR("NotesCell"));
      v17 = (SFAccountNoteTableViewCell *)objc_claimAutoreleasedReturnValue();
      notesCell = self->_notesCell;
      self->_notesCell = v17;

      -[SFAccountNoteTableViewCell setDelegate:](self->_notesCell, "setDelegate:", self);
      notesForEditing = self->_notesForEditing;
      if (notesForEditing)
      {
        v20 = self->_notesForEditing;
      }
      else
      {
        -[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "setText:", v20);

      if (!notesForEditing)
      v148[0] = MEMORY[0x1E0C809B0];
      v148[1] = 3221225472;
      v148[2] = __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke;
      v148[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v149, &location);
      -[SFAccountNoteTableViewCell setTextDidChange:](self->_notesCell, "setTextDidChange:", v148);
      v22 = self->_notesCell;
      objc_destroyWeak(&v149);
      break;
    case 15:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController _savedAccountWebsiteCellForTableView:atIndexPath:](self, "_savedAccountWebsiteCellForTableView:atIndexPath:", v92, v7);
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      v151 = CFSTR("domain");
      -[SFEditableTableViewCell textLabel](v22, "textLabel");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "text");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = v94;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      WBSMakeAccessibilityIdentifier();
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEditableTableViewCell setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", v96);

      break;
    case 16:
      -[SFAccountDetailViewController _recoverRecentlyDeletedAccountCell](self, "_recoverRecentlyDeletedAccountCell");
      v21 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 17:
      -[SFAccountDetailViewController _moveRecentlyDeletedAccountToMyPasswordsCell](self, "_moveRecentlyDeletedAccountToMyPasswordsCell");
      v21 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();
LABEL_63:
      v22 = v21;
      break;
    case 18:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController _deletePasskeyCellForTableView:](self, "_deletePasskeyCellForTableView:", v98);
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[SFEditableTableViewCell setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("AccountDetailViewDeletePasskeyCell"));
      break;
    case 19:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController _deletePasswordCellForTableView:shouldRemoveTOTPGenerator:](self, "_deletePasswordCellForTableView:shouldRemoveTOTPGenerator:", v99, 0);
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[SFEditableTableViewCell setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("AccountDetailViewDeletePasswordCell"));
      break;
    case 20:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController _deletePasswordCellForTableView:shouldRemoveTOTPGenerator:](self, "_deletePasswordCellForTableView:shouldRemoveTOTPGenerator:", v100, 1);
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[SFEditableTableViewCell setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("AccountDetailViewDeletePasswordAndVerificationCodeCell"));
      break;
    case 21:
      -[SFAccountDetailViewController tableView](self, "tableView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController _deleteCellForTableView:](self, "_deleteCellForTableView:", v101);
      v22 = (SFEditableTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[SFEditableTableViewCell setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("AccountDetailViewDeleteCell"));
      break;
    default:
      v22 = 0;
      break;
  }

  objc_destroyWeak(&location);
  return v22;
}

void __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke_2;
  block[3] = &unk_1E4ABFF20;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "beginUpdates");
    objc_msgSend(v2, "endUpdates");
    objc_msgSend(v6[145], "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v6[147];
    v6[147] = (id)v4;

    WeakRetained = v6;
  }

}

- (void)_reloadDiffableDataSourceOnInternalQueueAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__SFAccountDetailViewController__reloadDiffableDataSourceOnInternalQueueAnimated___block_invoke;
  v3[3] = &unk_1E4AC08D8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __82__SFAccountDetailViewController__reloadDiffableDataSourceOnInternalQueueAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSourceAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_reloadDiffableDataSourceAnimated:(BOOL)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  SFTableViewDiffableDataSource *tableViewDiffableDataSource;
  unsigned int v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E4B26A88);
  objc_msgSend(v5, "appendItemsWithIdentifiers:", &unk_1E4B26AA0);
  objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", &unk_1E4B26AB8);
  switch(-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes"))
  {
    case 1:
      v6 = &unk_1E4B26AD0;
      goto LABEL_4;
    case 2:
      v6 = &unk_1E4B26AE8;
LABEL_4:
      v7 = &unk_1E4B256C0;
      goto LABEL_11;
    case 3:
      if (self->_isForFillingIndividualAccountFields)
        v8 = &unk_1E4B26B00;
      else
        v8 = &unk_1E4B26B18;
      objc_msgSend(v5, "appendSectionsWithIdentifiers:", v8);
      objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26B30, &unk_1E4B256A8);
      if (-[SFAccountDetailViewController _shouldAddDeletePasskeyItem](self, "_shouldAddDeletePasskeyItem"))
        objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26B48, &unk_1E4B256A8);
      v6 = &unk_1E4B26B60;
      v7 = &unk_1E4B25678;
LABEL_11:
      objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, v7);
      goto LABEL_12;
    case 4:
      goto LABEL_52;
    default:
LABEL_12:
      -[WBSSavedAccount password](self->_savedAccount, "password");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", &unk_1E4B26B78);
      if (-[SFAccountDetailViewController _completedUpgrade](self, "_completedUpgrade"))
      {
        objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E4B26B90);
        objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26BA8, &unk_1E4B25708);
        objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", &unk_1E4B26BC0);
        if (self->_completedUpgradeToStrongPassword)
        {
          -[SFAccountDetailViewController _addGroupCellsToSnapshot:](self, "_addGroupCellsToSnapshot:", v5);
          objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E4B26BD8);
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          -[WBSSavedAccount userVisibleSites](self->_savedAccount, "userVisibleSites");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v36 != v13)
                  objc_enumerationMutation(v10);
                v42 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, &unk_1E4B25660);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v12);
          }

          objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E4B26BF0);
          objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26C08, &unk_1E4B25690);
          v3 = v3;
        }
        -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_tableViewDiffableDataSource, "applySnapshot:animatingDifferences:", v5, v3);
        goto LABEL_52;
      }
      -[SFAccountDetailViewController _addGroupCellsToSnapshot:](self, "_addGroupCellsToSnapshot:", v5);
      if (-[SFAccountDetailViewController _shouldShowSecurityRecommendationSection](self, "_shouldShowSecurityRecommendationSection"))
      {
        -[SFAccountDetailViewController _addAccountUpgradeItemsForSectionType:toSnapshot:](self, "_addAccountUpgradeItemsForSectionType:toSnapshot:", 5, v5);
        self->_accountUpgradeOriginType = 1;
      }
      if (-[NSArray count](self->_TOTPGenerators, "count"))
        -[SFAccountDetailViewController _addTOTPGeneratorsToSnapshot:](self, "_addTOTPGeneratorsToSnapshot:", v5);
      if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing")
        || (-[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "length"),
            v16,
            v17))
      {
        -[SFAccountDetailViewController _addNotesSectionToSnapshot:](self, "_addNotesSectionToSnapshot:", v5);
      }
      -[SFAccountDetailViewController _updateAddButtonsInAccountOptionsSectionForSnapshot:](self, "_updateAddButtonsInAccountOptionsSectionForSnapshot:", v5);
      if (-[SFAccountDetailViewController _shouldShowSecurityRecommendationSection](self, "_shouldShowSecurityRecommendationSection")|| (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") & 1) == 0)
      {
        goto LABEL_40;
      }
      v18 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
      if (v18 == 1)
      {
        v19 = 6;
      }
      else
      {
        if (v18 != 3)
          goto LABEL_39;
        v19 = 2;
      }
      -[SFAccountDetailViewController _addAccountUpgradeItemsForSectionType:toSnapshot:](self, "_addAccountUpgradeItemsForSectionType:toSnapshot:", v19, v5);
LABEL_39:
      self->_accountUpgradeOriginType = 2;
LABEL_40:
      if (-[WBSSavedAccount hasValidWebsite](self->_savedAccount, "hasValidWebsite"))
      {
        v29 = v3;
        objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E4B26C20);
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[WBSSavedAccount userVisibleSites](self->_savedAccount, "userVisibleSites");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              v40 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v25, &unk_1E4B25660);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          }
          while (v22);
        }

        v3 = v29;
      }
      if (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") == 2)
      {
        -[WBSSavedAccount passkeyRelyingPartyID](self->_savedAccount, "passkeyRelyingPartyID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v27, &unk_1E4B25660);

      }
      -[SFAccountDetailViewController _configureDeleteSectionInSnapshot:](self, "_configureDeleteSectionInSnapshot:", v5);
      tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __67__SFAccountDetailViewController__reloadDiffableDataSourceAnimated___block_invoke;
      v30[3] = &unk_1E4ABFE00;
      v30[4] = self;
      -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](tableViewDiffableDataSource, "applySnapshot:animatingDifferences:completion:", v5, v3, v30);
LABEL_52:

      return;
  }
}

uint64_t __67__SFAccountDetailViewController__reloadDiffableDataSourceAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPasskeySectionFooters");
}

- (void)_addGroupCellsToSnapshot:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26C38, &unk_1E4B256C0);
    objc_msgSend(v7, "reconfigureItemsWithIdentifiers:", &unk_1E4B26C50);
  }
  if (-[WBSSavedAccount isSavedInSharedGroup](self->_savedAccount, "isSavedInSharedGroup"))
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26C68, &unk_1E4B256C0);

}

- (BOOL)_shouldAddDeletePasskeyItem
{
  return (-[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted") & 1) == 0
      && !self->_isForFillingIndividualAccountFields;
}

- (void)_configureDeleteSectionInSnapshot:(id)a3
{
  id v4;
  int v5;
  WBSSavedAccount *savedAccount;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WBSSavedAccount canUserEditSavedAccount](self->_savedAccount, "canUserEditSavedAccount")
    && !self->_isForFillingIndividualAccountFields)
  {
    v5 = -[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted");
    savedAccount = self->_savedAccount;
    if (v5)
    {
      if (-[WBSSavedAccount canUserEditSavedAccount](savedAccount, "canUserEditSavedAccount"))
      {
        objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E4B26C80);
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26C98, &unk_1E4B25690);
        if (-[WBSSavedAccount isSavedInSharedGroup](self->_savedAccount, "isSavedInSharedGroup")
          && -[WBSSavedAccount isCurrentUserOriginalContributor](self->_savedAccount, "isCurrentUserOriginalContributor"))
        {
          objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26CB0, &unk_1E4B25690);
        }
        v7 = &unk_1E4B26CC8;
        goto LABEL_12;
      }
    }
    else
    {
      v8 = -[WBSSavedAccount credentialTypes](savedAccount, "credentialTypes");
      if ((unint64_t)(v8 - 3) < 2)
      {
        v9 = -[NSArray count](self->_TOTPGenerators, "count");
        v10 = &unk_1E4B25780;
        if (!v9)
          v10 = &unk_1E4B25798;
        v12[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v11, &unk_1E4B25678);

      }
      else if ((unint64_t)(v8 - 1) <= 1)
      {
        objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E4B26CE0);
        v7 = &unk_1E4B26CF8;
LABEL_12:
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &unk_1E4B25690);
      }
    }
  }

}

- (id)_groupSectionValueStyleTableViewCellWithText:(id)a3 secondaryText:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0DC39A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "valueCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v9, "setSecondaryText:", v7);
  -[SFAccountDetailViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", CFSTR("sharedGroupValueCell"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("sharedGroupValueCell"));
  v14 = v13;

  objc_msgSend(v14, "setContentConfiguration:", v9);
  return v14;
}

- (BOOL)_shouldShowSecurityRecommendationSection
{
  WBSPasswordWarning *passwordWarning;

  passwordWarning = self->_passwordWarning;
  if (passwordWarning)
    LOBYTE(passwordWarning) = (!-[WBSPasswordWarning hasBeenHidden](passwordWarning, "hasBeenHidden")
                            || (self->_options & 4) != 0)
                           && -[WBSPasswordWarning severity](self->_passwordWarning, "severity") != 0;
  return (char)passwordWarning;
}

- (void)_addAccountUpgradeItemsForSectionType:(int64_t)a3 toSnapshot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[SFAccountDetailViewController _allowAuditing](self, "_allowAuditing")
    && (-[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v7);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendSectionsWithIdentifiers:", v10);

    }
    if (a3 == 5)
    {
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26D10, v7);
      objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", &unk_1E4B26D28);
    }
    if (self->_eligibleToUpgradeToSignInWithApple)
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26D40, v7);
    if (self->_eligibleToChangeToStrongPassword)
      v11 = &unk_1E4B26D58;
    else
      v11 = &unk_1E4B26D70;
    objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v11, v7);

  }
}

- (void)_updateAddButtonsInAccountOptionsSectionForSnapshot:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SFAccountDetailViewController _allowEditing](self, "_allowEditing")
    && !-[NSArray count](self->_TOTPGenerators, "count")
    && -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") != 2;
  v6 = objc_msgSend(v4, "indexOfItemIdentifier:", &unk_1E4B257F8);
  v7 = v6 == 0x7FFFFFFFFFFFFFFFLL || v5;
  if (((v5 ^ (v6 == 0x7FFFFFFFFFFFFFFFLL)) & 1) == 0)
  {
    v8 = !v5;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      v8 = 1;
    if ((v8 & 1) != 0)
    {
      if ((v7 & 1) == 0)
        objc_msgSend(v4, "deleteItemsWithIdentifiers:", &unk_1E4B26DD0);
      goto LABEL_29;
    }
    if (objc_msgSend(v4, "indexOfSectionIdentifier:", &unk_1E4B25810) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_22:
      v11 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
      if (v11 == 3)
      {
        objc_msgSend(v4, "insertItemsWithIdentifiers:afterItemWithIdentifier:", &unk_1E4B26DB8, &unk_1E4B256D8);
      }
      else if (v11 == 1)
      {
        objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", &unk_1E4B25810);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", &unk_1E4B26D88, v13);

        }
        else
        {
          objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26DA0, &unk_1E4B25810);
        }

      }
LABEL_29:
      if (objc_msgSend(v4, "indexOfSectionIdentifier:", &unk_1E4B25810) != 0x7FFFFFFFFFFFFFFFLL
        && !objc_msgSend(v4, "numberOfItemsInSection:", &unk_1E4B25810))
      {
        v15 = &unk_1E4B25810;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deleteSectionsWithIdentifiers:", v14);

      }
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "indexOfSectionIdentifier:", &unk_1E4B25660) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v4, "indexOfSectionIdentifier:", &unk_1E4B25690) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = &unk_1E4B25810;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendSectionsWithIdentifiers:", v9);
LABEL_21:

        goto LABEL_22;
      }
      v17 = &unk_1E4B25810;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &unk_1E4B25690;
    }
    else
    {
      v18[0] = &unk_1E4B25810;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &unk_1E4B25660;
    }
    objc_msgSend(v4, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v9, v10);
    goto LABEL_21;
  }
LABEL_32:

}

- (void)_addTOTPGeneratorsToSnapshot:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
  if (v4 == 3)
  {
    objc_msgSend(v7, "insertItemsWithIdentifiers:afterItemWithIdentifier:", self->_TOTPGenerators, &unk_1E4B256D8);
  }
  else
  {
    if (v4 == 2)
    {
      objc_msgSend(v7, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", &unk_1E4B26E00, &unk_1E4B256C0);
    }
    else
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_10;
      objc_msgSend(v7, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", &unk_1E4B26DE8, &unk_1E4B256C0);
    }
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_TOTPGenerators, &unk_1E4B25648);
  }
  v6 = v7;
LABEL_10:

}

- (void)_configureSecurityRecommendationInfoCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_completedUpgradeToSignInWithApple)
  {
    -[SFSecurityRecommendationInfoCell showCheckmarkForDetailView](self->_securityRecommendationInfoCell, "showCheckmarkForDetailView");
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell setTitle:](self->_securityRecommendationInfoCell, "setTitle:", v3);

    -[SFAccountDetailViewController _subtitleStringForSignInWithAppleUpgrade](self, "_subtitleStringForSignInWithAppleUpgrade");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    -[SFSecurityRecommendationInfoCell setSubtitle:](self->_securityRecommendationInfoCell, "setSubtitle:", v4);

    -[SFSecurityRecommendationInfoCell subtitleLabel](self->_securityRecommendationInfoCell, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableUpdateMask:", 0);

    -[SFSecurityRecommendationInfoCell setShowsHideButton:](self->_securityRecommendationInfoCell, "setShowsHideButton:", 0);
    return;
  }
  if (self->_completedUpgradeToStrongPassword)
  {
    -[SFSecurityRecommendationInfoCell showCheckmarkForDetailView](self->_securityRecommendationInfoCell, "showCheckmarkForDetailView");
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell setTitle:](self->_securityRecommendationInfoCell, "setTitle:", v5);

    -[SFAccountDetailViewController _subtitleStringForStrongPasswordUpgrade](self, "_subtitleStringForStrongPasswordUpgrade");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes") == 1)
    v9 = CFSTR("secondaryWarningImageColor");
  else
    v9 = CFSTR("warningImageColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithTintColor:renderingMode:", v17, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  -[SFSecurityRecommendationInfoCell setIcon:](self->_securityRecommendationInfoCell, "setIcon:", v11);

  -[WBSPasswordWarning localizedShortDescriptivePhrase](self->_passwordWarning, "localizedShortDescriptivePhrase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSecurityRecommendationInfoCell setTitle:](self->_securityRecommendationInfoCell, "setTitle:", v12);

  -[SFAccountDetailViewController _securityRecommendationSubtitleString](self, "_securityRecommendationSubtitleString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSecurityRecommendationInfoCell setSubtitle:](self->_securityRecommendationInfoCell, "setSubtitle:", v13);

  -[SFSecurityRecommendationInfoCell setShowsHideButton:](self->_securityRecommendationInfoCell, "setShowsHideButton:", -[WBSPasswordWarning hasBeenHidden](self->_passwordWarning, "hasBeenHidden") ^ 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v14, "_sf_passwordManagerIsInDemoMode");

  if ((v11 & 1) == 0)
  {
    -[SFSecurityRecommendationInfoCell subtitleLabel](self->_securityRecommendationInfoCell, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisableUpdateMask:", 18);

  }
}

- (id)_securityRecommendationSubtitleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((-[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes") & 8) != 0)
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPasswordWarning localizedLongDescriptionForClient:](self->_passwordWarning, "localizedLongDescriptionForClient:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSPasswordWarning localizedLongDescriptionForClient:](self->_passwordWarning, "localizedLongDescriptionForClient:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_subtitleStringForSignInWithAppleUpgrade
{
  int64_t accountUpgradeOriginType;

  accountUpgradeOriginType = self->_accountUpgradeOriginType;
  if (accountUpgradeOriginType != 2 && accountUpgradeOriginType != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D8A8F8], "isAppleAccountBrandingEnabled");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_subtitleStringForStrongPasswordUpgrade
{
  int64_t accountUpgradeOriginType;
  void *v3;

  accountUpgradeOriginType = self->_accountUpgradeOriginType;
  if (accountUpgradeOriginType == 2 || accountUpgradeOriginType == 1)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_editableCellWithCell:(id)a3
{
  return a3;
}

- (void)_configureUserCell:(id)a3
{
  void *v4;
  NSString *userForEditing;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  userForEditing = self->_userForEditing;
  v6 = userForEditing;
  if (!userForEditing)
  {
    -[WBSSavedAccount user](self->_savedAccount, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountDetailViewController _configureCell:withText:detailText:detailPlaceholderText:secureEntry:](self, "_configureCell:withText:detailText:detailPlaceholderText:secureEntry:", v10, v4, v6, v7, 0);

  if (!userForEditing)
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewUsernameCell"));
  objc_msgSend(v10, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewUsernameLabel"));

  if (self->_isForFillingIndividualAccountFields)
  {
    +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverrideEditableTextFieldTextColor:", v9);

  }
  else
  {
    objc_msgSend(v10, "setOverrideEditableTextFieldTextColor:", 0);
  }

}

- (id)_securePasswordPlaceholderText:(id)a3
{
  return (id)objc_msgSend(&stru_1E4AC8470, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(a3, "safari_numberOfComposedCharacters"), CFSTR("•"), 0);
}

- (void)_configurePasswordCell:(id)a3
{
  NSString *passwordForEditing;
  NSString *v5;
  NSString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  passwordForEditing = self->_passwordForEditing;
  if (passwordForEditing)
  {
    v5 = passwordForEditing;
  }
  else
  {
    -[WBSSavedAccount password](self->_savedAccount, "password");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (self->_showPasswordAsBulletsWhenNotEditing
    && !-[SFAccountDetailViewController isEditing](self, "isEditing"))
  {
    -[SFAccountDetailViewController _securePasswordPlaceholderText:](self, "_securePasswordPlaceholderText:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  if (self->_completedUpgradeToSignInWithApple)
  {

    v8 = CFSTR("—");
  }
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountDetailViewController _configureCell:withText:detailText:detailPlaceholderText:secureEntry:](self, "_configureCell:withText:detailText:detailPlaceholderText:secureEntry:", v15, v9, v8, v10, objc_msgSend(v11, "_sf_passwordManagerIsInDemoMode") ^ 1);

  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewPasswordCell"));
  objc_msgSend(v15, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("PasswordDetailViewUsernameLabel"));

  if (self->_completedUpgradeToSignInWithApple)
    v13 = 0;
  else
    v13 = -[SFAccountDetailViewController isEditing](self, "isEditing");
  objc_msgSend(v15, "setEnabled:", v13);
  -[SFAccountDetailViewController _setHighLyLegibleFontForDetailTextInCell:](self, "_setHighLyLegibleFontForDetailTextInCell:", v15);
  if (self->_isForFillingIndividualAccountFields)
  {
    +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOverrideEditableTextFieldTextColor:", v14);

  }
  else
  {
    objc_msgSend(v15, "setOverrideEditableTextFieldTextColor:", 0);
  }

}

- (void)_setHighLyLegibleFontForDetailTextInCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing"))
  {
    -[SFAccountDetailViewController _editableCellWithCell:](self, "_editableCellWithCell:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(v5, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_sf_highLegibilityAlternateFont:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "setFont:", v8);

  }
  else
  {
    objc_msgSend(v4, "detailTextLabel");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(v11, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sf_highLegibilityAlternateFont:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v11, "setFont:", v5);
  }

}

- (void)_configureCell:(id)a3 withText:(id)a4 detailText:(id)a5 detailPlaceholderText:(id)a6 secureEntry:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a7;
  v17 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v13);

  objc_msgSend(v14, "editableTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setText:", v12);
  objc_msgSend(v16, "setSecureTextEntry:", v7);
  objc_msgSend(v16, "setDisplaySecureTextUsingPlainText:", v7);
  if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing"))
  {
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__textFieldChanged_, 0x20000);
    objc_msgSend(v16, "setPlaceholder:", v17);
  }

}

- (id)_savedAccountWebsiteCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  WBSSavedAccount *savedAccount;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFWebsiteButton *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
  savedAccount = self->_savedAccount;
  if (v8 == 2)
  {
    -[WBSSavedAccount passkeyRelyingPartyID](savedAccount, "passkeyRelyingPartyID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSSavedAccount userVisibleSites](savedAccount, "userVisibleSites");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("site"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("site"));
  objc_msgSend(v12, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v10);

  if ((-[SFAccountDetailViewController _allowEditing](self, "_allowEditing")
     || -[SFAccountDetailViewController _allowAuditing](self, "_allowAuditing"))
    && v10)
  {
    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc_init(_SFWebsiteButton);
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __82__SFAccountDetailViewController__savedAccountWebsiteCellForTableView_atIndexPath___block_invoke;
      v19[3] = &unk_1E4AC0900;
      objc_copyWeak(&v21, &location);
      v20 = v16;
      -[_SFWebsiteButton setActivationHandler:](v17, "setActivationHandler:", v19);
      objc_msgSend(v12, "setAccessoryView:", v17);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

    }
  }

  return v12;
}

void __82__SFAccountDetailViewController__savedAccountWebsiteCellForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  SFSafariViewControllerConfiguration *v5;
  SFSafariViewController *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:", *(_QWORD *)(a1 + 32));
    v3 = v7;
    if (v4)
    {
      v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
      -[SFSafariViewControllerConfiguration _setPerformingAccountSecurityUpgrade:](v5, "_setPerformingAccountSecurityUpgrade:", 1);
      v6 = -[SFSafariViewController initWithURL:configuration:]([SFSafariViewController alloc], "initWithURL:configuration:", *(_QWORD *)(a1 + 32), v5);
      -[SFSafariViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 1);
      -[SFSafariViewController setModalInPresentation:](v6, "setModalInPresentation:", 1);
      objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

      v3 = v7;
    }
  }

}

- (id)_deleteCellForTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("deleteAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("deleteAccount"));
  v5 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
  if (v5 == 3 || v5 == 2 || v5 == 1)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
  v8 = -[SFAccountDetailViewController _canUserDeleteSavedAccount](self, "_canUserDeleteSavedAccount");
  if (v8)
    v9 = 0;
  else
    v9 = 2;
  objc_msgSend(v4, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintAdjustmentMode:", v9);

  objc_msgSend(v4, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  v14 = -[SFAccountDetailViewController _textAlignmentOfCellsInDeleteAccountSection](self, "_textAlignmentOfCellsInDeleteAccountSection");
  objc_msgSend(v4, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextAlignment:", v14);

  objc_msgSend(v4, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  return v4;
}

- (BOOL)_canUserDeleteSavedAccount
{
  int v3;

  v3 = -[WBSSavedAccount canUserEditSavedAccount](self->_savedAccount, "canUserEditSavedAccount");
  if (v3)
  {
    if (-[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted"))
      LOBYTE(v3) = -[WBSSavedAccount isCurrentUserOriginalContributor](self->_savedAccount, "isCurrentUserOriginalContributor");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_configureHeaderViewCell:(id)a3
{
  void *v4;
  void *v5;
  NSString *titleForEditing;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setDelegate:", self);
  -[WBSSavedAccount userVisibleDomain](self->_savedAccount, "userVisibleDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeaderTitleForHighLevelDomain:customTitle:", v4, v5);

  titleForEditing = self->_titleForEditing;
  if (titleForEditing)
  {
    objc_msgSend(v12, "titleTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", titleForEditing);

  }
  -[SFAccountDetailViewController _updateIconForCell:](self, "_updateIconForCell:", v12);
  -[SFAccountDetailViewController _lastModifiedDateString](self, "_lastModifiedDateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastModifiedDateString:", v8);

  -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSString *)objc_msgSend(v9, "copy");
  v11 = self->_titleForEditing;
  self->_titleForEditing = v10;

  -[SFAccountDetailViewController _updateHeaderViewCell](self, "_updateHeaderViewCell");
  objc_msgSend(v12, "setSavedAccount:", self->_savedAccount);

}

- (void)_updateIconForCell:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "iconControllerForAccountDetailViewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconForDomain:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && ((v8 = v7, objc_msgSend(v7, "size"), v10 == 56.0) ? (v11 = v9 == 56.0) : (v11 = 0),
          v11
       || (objc_msgSend(MEMORY[0x1E0D8A9C8], "resizedImage:withSize:", v8),
           v12 = objc_claimAutoreleasedReturnValue(),
           v8,
           (v8 = (void *)v12) != 0)))
    {
      objc_msgSend(v13, "setIcon:", v8);
    }
    else
    {
      objc_msgSend(v6, "backgroundColorForDomain:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMonogramBackgroundColor:", v8);
    }

  }
  else
  {
    +[_SFAccountManagerAppearanceValues defaultMonogramBackgroundColor](_SFAccountManagerAppearanceValues, "defaultMonogramBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMonogramBackgroundColor:", v6);
  }

}

- (id)_deletePasswordCellForTableView:(id)a3 shouldRemoveTOTPGenerator:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("removePassword"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("removePassword"));
    if (v4)
      goto LABEL_3;
LABEL_5:
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);
    objc_msgSend(v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v6);

    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);
LABEL_6:

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  objc_msgSend(v5, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  return v5;
}

- (id)_deletePasskeyCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("removePasskey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("removePasskey"));
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 0);

  return v3;
}

- (id)_groupPickerTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted");
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WBSSavedAccount isSavedInSharedGroup](self->_savedAccount, "isSavedInSharedGroup"))
  {
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount sharedGroupID](self->_savedAccount, "sharedGroupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedGroupWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SFAccountDetailViewController _groupSectionValueStyleTableViewCellWithText:secondaryText:](self, "_groupSectionValueStyleTableViewCellWithText:secondaryText:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing")
    && (-[SFAccountDetailViewController isEditing](self, "isEditing") & 1) == 0
    && -[WBSSavedAccount isCurrentUserOriginalContributor](self->_savedAccount, "isCurrentUserOriginalContributor"))
  {
    -[SFAccountDetailViewController _groupPickerMenuButton](self, "_groupPickerMenuButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v8, "setAccessoryView:", v9);
  objc_msgSend(v8, "_setPopupMenuButton:", v9);

  return v8;
}

- (id)_groupPickerMenuButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.up.chevron.down"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithSymbolConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "systemButtonWithImage:target:action:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountDetailViewController _groupSharingMenu](self, "_groupSharingMenu");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenu:", v9);

  objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v8, "setChangesSelectionAsPrimaryAction:", 1);

  return v8;
}

- (id)_originalContributorCell
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
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount originalContributorParticipantID](self->_savedAccount, "originalContributorParticipantID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount sharedGroupID](self->_savedAccount, "sharedGroupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameForOriginalContributorParticipantID:inGroupID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v8);

  -[SFAccountDetailViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", CFSTR("originalContributor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("originalContributor"));
  v13 = v12;

  objc_msgSend(v13, "setContentConfiguration:", v3);
  return v13;
}

- (id)_recoverRecentlyDeletedAccountCell
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
  int64_t v12;
  void *v13;

  -[SFAccountDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("RecoverRecentlyDeletedAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("RecoverRecentlyDeletedAccount"));
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WBSSavedAccount isSavedInSharedGroup](self->_savedAccount, "isSavedInSharedGroup"))
    -[WBSSavedAccount isCurrentUserOriginalContributor](self->_savedAccount, "isCurrentUserOriginalContributor");
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);
  +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v10);

  v12 = -[SFAccountDetailViewController _listContentTextAlignmentOfCellsInDeleteAccountSection](self, "_listContentTextAlignmentOfCellsInDeleteAccountSection");
  objc_msgSend(v8, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", v12);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  return v7;
}

- (id)_moveRecentlyDeletedAccountToMyPasswordsCell
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
  int64_t v12;
  void *v13;

  -[SFAccountDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("MoveRecentlyDeletedAccountToMyPasswords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("MoveRecentlyDeletedAccountToMyPasswords"));
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v10);

  v12 = -[SFAccountDetailViewController _listContentTextAlignmentOfCellsInDeleteAccountSection](self, "_listContentTextAlignmentOfCellsInDeleteAccountSection");
  objc_msgSend(v8, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", v12);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  return v7;
}

- (int64_t)_listContentTextAlignmentOfCellsInDeleteAccountSection
{
  void *v2;
  int64_t v3;

  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsInSection:", &unk_1E4B25690) < 2;

  return v3;
}

- (int64_t)_textAlignmentOfCellsInDeleteAccountSection
{
  void *v2;
  int64_t v3;

  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "numberOfItemsInSection:", &unk_1E4B25690) <= 1)
    v3 = 1;
  else
    v3 = 4;

  return v3;
}

- (id)_cellsThatChangeAppearanceOnEdit
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E4B26E18);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E4B26E30);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E4B26E48);
  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  SFAccountDetailViewController *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v8);

  switch(v9)
  {
    case 18:
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      goto LABEL_3;
    case 19:
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      goto LABEL_9;
    case 20:
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      -[SFAccountDetailViewController _showConfirmationToDeletePasswordAndTOTPGenerator](self, "_showConfirmationToDeletePasswordAndTOTPGenerator");
      goto LABEL_21;
    case 21:
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      v14 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
      switch(v14)
      {
        case 3:
          v10 = self;
          v11 = 3;
          goto LABEL_10;
        case 2:
LABEL_3:
          v10 = self;
          v11 = 2;
LABEL_10:
          -[SFAccountDetailViewController _showConfirmationToDeleteCredentialTypes:](v10, "_showConfirmationToDeleteCredentialTypes:", v11);
          break;
        case 1:
LABEL_9:
          v10 = self;
          v11 = 1;
          goto LABEL_10;
      }
LABEL_21:

      return;
    default:
      if (-[SFAccountDetailViewController isEditing](self, "isEditing"))
      {
        if (v9 == 9)
        {
          -[SFAccountDetailViewController _replaceAddPasswordButtonWithPasswordCell](self, "_replaceAddPasswordButtonWithPasswordCell");
        }
        else if (v9 == 8)
        {
          -[WBSSavedAccount totpGenerators](self->_savedAccount, "totpGenerators");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAccountDetailViewController _deleteTOTPGeneratorWithConfirmation:](self, "_deleteTOTPGeneratorWithConfirmation:", v13);

        }
      }
      else
      {
        switch(v9)
        {
          case 4:
            break;
          case 7:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            self->_didAcceptTOTPQRCode = 0;
            _WBSLocalizedString();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", v16, v17);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:imageNamed:preferredStyle:", v38, v37, CFSTR("alert-passwords"), 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x1E0DC3448];
            _WBSLocalizedString();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = MEMORY[0x1E0C809B0];
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke;
            v42[3] = &unk_1E4AC0128;
            v42[4] = self;
            v22 = v18;
            v43 = v22;
            objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v42);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addAction:", v23);

            v24 = (void *)MEMORY[0x1E0DC3448];
            _WBSLocalizedString();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = v21;
            v41[1] = 3221225472;
            v41[2] = __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
            v41[3] = &unk_1E4AC0010;
            v41[4] = self;
            objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v41);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addAction:", v26);

            v27 = (void *)MEMORY[0x1E0DC3448];
            _WBSLocalizedString();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v39[0] = v21;
            v39[1] = 3221225472;
            v39[2] = __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
            v39[3] = &unk_1E4AC0010;
            v40 = v22;
            v29 = v22;
            objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 1, v39);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addAction:", v30);

            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);

            goto LABEL_21;
          case 11:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            -[SFAccountDetailViewController _initiateUpgradeToSignInWithApple](self, "_initiateUpgradeToSignInWithApple");
            goto LABEL_21;
          case 12:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            -[SFAccountDetailViewController _initiateChangeToStrongPassword](self, "_initiateChangeToStrongPassword");
            goto LABEL_21;
          case 13:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            if (objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle"))
              -[SFAccountDetailViewController _openChangePasswordURLInWebBrowser](self, "_openChangePasswordURLInWebBrowser");
            else
              -[SFAccountDetailViewController _showChangePasswordSafariViewController](self, "_showChangePasswordSafariViewController");
            goto LABEL_21;
          case 14:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            -[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "length");

            if (!v32)
            {
              -[SFAccountDetailViewController _setEditing:animated:](self, "_setEditing:animated:", 1, 1);
              -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "becomeFirstResponder");

            }
            goto LABEL_21;
          case 16:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            -[SFAccountDetailViewController _recoverSavedAccount](self, "_recoverSavedAccount");
            goto LABEL_21;
          case 17:
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
            -[SFAccountDetailViewController _presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert](self, "_presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert");
            goto LABEL_21;
          default:
            if (!self->_isForFillingIndividualAccountFields)
              goto LABEL_35;
            switch(v9)
            {
              case 6:
                -[SFAccountDetailViewController _fillVerificationCode](self, "_fillVerificationCode");
                goto LABEL_21;
              case 3:
                -[SFAccountDetailViewController _fillPassword](self, "_fillPassword");
                goto LABEL_21;
              case 1:
                -[SFAccountDetailViewController _fillUsername](self, "_fillUsername");
                goto LABEL_21;
            }
LABEL_35:
            if (-[SFAccountDetailViewController _shouldShowMenuForItemIdentifier:](self, "_shouldShowMenuForItemIdentifier:", v9))
            {
              -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setSelectedRange:", 0, 0);

              -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu");
              v35 = (void *)MEMORY[0x1E0DC3798];
              objc_msgSend(v6, "rectForRowAtIndexPath:", v7);
              UIRectGetCenter();
              objc_msgSend(v35, "configurationWithIdentifier:sourcePoint:", v7);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v36);

              goto LABEL_21;
            }
            break;
        }
      }
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      goto LABEL_21;
  }
}

void __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_newSecretEntryAlertController");
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1232), v2);
  objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);

}

void __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D6C068]);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);

}

uint64_t __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v7 = a3;
  v8 = a4;
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", &unk_1E4B25648)
    && -[SFAccountDetailViewController _allowEditing](self, "_allowEditing")
    && (-[SFAccountDetailViewController isEditing](self, "isEditing") & 1) == 0)
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0DC36B8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__SFAccountDetailViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v13[3] = &unk_1E4AC0928;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v12, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __91__SFAccountDetailViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_groupSharingMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_replaceAddPasswordButtonWithPasswordCell
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsWithIdentifiers:", &unk_1E4B26E60);
  objc_msgSend(v2, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26E78, &unk_1E4B25678);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1184);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_2;
  v5[3] = &unk_1E4ABFE00;
  v5[4] = v3;
  objc_msgSend(v4, "applySnapshot:animatingDifferences:completion:", v2, 1, v5);

}

void __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_3;
  block[3] = &unk_1E4ABFE00;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_3(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

  v3 = *(id **)(a1 + 32);
  objc_msgSend(v3[137], "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updatePasswordFieldTextSuggestions:", v4);

}

- (BOOL)_shouldShowMenuForItemIdentifier:(int64_t)a3
{
  BOOL v3;
  void *v4;

  v3 = 1;
  if (a3 > 5)
  {
    if (a3 != 6 && a3 != 15)
      return 0;
  }
  else
  {
    if (a3 == 1)
    {
      -[WBSSavedAccount user](self->_savedAccount, "user");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "length") != 0;

      return v3;
    }
    if (a3 != 3)
      return 0;
  }
  return v3;
}

- (void)_revealPasswordIfNecessary
{
  NSString *passwordForEditing;
  void *v4;
  id v5;

  if (self->_showPasswordAsBulletsWhenNotEditing)
  {
    self->_showPasswordAsBulletsWhenNotEditing = 0;
    passwordForEditing = self->_passwordForEditing;
    v5 = passwordForEditing;
    if (!passwordForEditing)
    {
      -[WBSSavedAccount password](self->_savedAccount, "password");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v5);

    if (!passwordForEditing)
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  int64_t v8;
  int64_t v9;

  v5 = a4;
  if (-[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v5, "section")) == 8)
  {
    v6 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") != 2;
  }
  else
  {
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v7);

    if (v8 == 6)
      v6 = -[SFAccountDetailViewController isEditing](self, "isEditing");
    else
      v6 = 0;
  }
  v9 = v6;

  return v9;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  void *v5;
  int64_t v6;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v5);

  return v6 == 15 || v6 == 6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  char v10;

  v6 = a3;
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v8);

  LOBYTE(v8) = 0;
  switch(v7)
  {
    case 1:
    case 3:
    case 6:
    case 7:
    case 11:
    case 12:
    case 13:
    case 15:
      LODWORD(v8) = objc_msgSend(v6, "isEditing") ^ 1;
      break;
    case 4:
      if (-[SFAccountDetailViewController _allowEditing](self, "_allowEditing")
        && (objc_msgSend(v6, "isEditing") & 1) == 0)
      {
        v10 = -[WBSSavedAccount isCurrentUserOriginalContributor](self->_savedAccount, "isCurrentUserOriginalContributor");
        goto LABEL_10;
      }
      LOBYTE(v8) = 0;
      break;
    case 8:
    case 9:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
      LOBYTE(v8) = 1;
      break;
    case 21:
      v10 = -[SFAccountDetailViewController _canUserDeleteSavedAccount](self, "_canUserDeleteSavedAccount");
LABEL_10:
      LOBYTE(v8) = v10;
      break;
    default:
      break;
  }

  return (char)v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;

  v5 = -[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v5 == 1)
  {
    if (!self->_isForFillingIndividualAccountFields)
    {
      -[SFAccountDetailViewController _passkeySectionFooterView](self, "_passkeySectionFooterView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    goto LABEL_6;
  }
  if (v5 || self->_isForFillingIndividualAccountFields)
  {
LABEL_6:
    v6 = 0;
    return v6;
  }
  -[SFAccountDetailViewController _accountHeaderSectionFooterView](self, "_accountHeaderSectionFooterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SFAccountDetailViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEditing");

  if (!v12)
  {
    -[SFAccountDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", MEMORY[0x1E0C9AA60]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    objc_initWeak(location, self);
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v15);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 > 5)
    {
      if (v16 == 6)
      {
        v27 = (void *)MEMORY[0x1E0DC3428];
        _WBSLocalizedString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = MEMORY[0x1E0C809B0];
        v32 = 3221225472;
        v33 = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4;
        v34 = &unk_1E4AC0950;
        v35 = v15;
        objc_copyWeak(&v36, location);
        objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v28, v18, 0, &v31);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v29, v31, v32, v33, v34);

        objc_destroyWeak(&v36);
        goto LABEL_16;
      }
      if (v16 == 15)
      {
        v23 = (void *)MEMORY[0x1E0DC3428];
        _WBSLocalizedString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3;
        v37[3] = &unk_1E4ABFAA8;
        v21 = &v39;
        objc_copyWeak(&v39, location);
        v38 = v14;
        objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v24, v18, 0, v37);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v25);

LABEL_14:
        objc_destroyWeak(v21);
      }
    }
    else
    {
      if (v16 == 1)
      {
        v26 = (void *)MEMORY[0x1E0DC3428];
        _WBSLocalizedString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
        v42[3] = &unk_1E4ABFFC0;
        v21 = &v43;
        objc_copyWeak(&v43, location);
        objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v20, v18, 0, v42);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);
        goto LABEL_13;
      }
      if (v16 == 3)
      {
        v19 = (void *)MEMORY[0x1E0DC3428];
        _WBSLocalizedString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
        v40[3] = &unk_1E4ABFFC0;
        v21 = &v41;
        objc_copyWeak(&v41, location);
        objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v18, 0, v40);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);
LABEL_13:

        goto LABEL_14;
      }
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(location);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", MEMORY[0x1E0C9AA60]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v13;
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[127], "user");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "safari_setSensitiveString:", v2);

  }
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[127], "password");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "safari_setSensitiveString:", v2);

  }
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[127], "credentialTypes");
    v4 = v8[127];
    if (v3 == 2)
    {
      objc_msgSend(v4, "passkeyRelyingPartyID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "userVisibleSites");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "row"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setString:", v5);

    WeakRetained = v8;
  }

}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v3 = *(void **)(a1 + 32);
      v7 = WeakRetained;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "codeForDate:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_setSensitiveString:", v5);

      WeakRetained = v7;
    }

  }
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SFAccountDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SFAccountDetailViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rectForRowAtIndexPath:", v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;

  -[SFAccountDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v7);

    v6 = v9;
    if (v8 == 3)
    {
      -[SFAccountDetailViewController _revealPasswordIfNecessary](self, "_revealPasswordIfNecessary");
      v6 = v9;
    }
  }

}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;

  -[SFAccountDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SFAccountDetailViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

  }
}

- (id)_indexPathForEditMenuInteraction:(id)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    -[SFAccountDetailViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountDetailViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v10);
    objc_msgSend(v9, "indexPathForRowAtPoint:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_updateHeaderViewCell
{
  SFAccountHeaderViewCell *headerCell;
  id v4;

  headerCell = self->_headerCell;
  -[WBSSavedAccount userVisibleDomain](self->_savedAccount, "userVisibleDomain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAccountHeaderViewCell setHeaderTitleForHighLevelDomain:customTitle:](headerCell, "setHeaderTitleForHighLevelDomain:customTitle:", v4, self->_titleForEditing);

}

- (BOOL)_shouldUseZeroHeightHeaderForSectionType:(int64_t)a3
{
  BOOL result;

  if ((unint64_t)(a3 - 1) < 2)
    return self->_isForFillingIndividualAccountFields;
  result = 1;
  if (a3 && a3 != 4)
    return 0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;

  if (-[SFAccountDetailViewController _shouldUseZeroHeightHeaderForSectionType:](self, "_shouldUseZeroHeightHeaderForSectionType:", -[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4)))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  _BOOL4 v4;
  double result;

  v4 = -[SFAccountDetailViewController _shouldUseZeroHeightHeaderForSectionType:](self, "_shouldUseZeroHeightHeaderForSectionType:", -[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4));
  result = *MEMORY[0x1E0DC53D8];
  if (v4)
    return 0.0;
  return result;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  id v5;
  void *WeakRetained;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v10)
  {
    -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "text");
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = 1112;
LABEL_6:
    v7 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
    *(Class *)((char *)&self->super.super.super.super.isa + v9) = v8;
    goto LABEL_7;
  }
  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v10)
  {
    -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "text");
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = 1120;
    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_secretEntryAlertController);
  objc_msgSend(WeakRetained, "textFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");

LABEL_7:
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;
  SFEditableTableViewCell *passwordCell;
  id v7;
  void *v8;
  int v9;
  id WeakRetained;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  passwordCell = self->_passwordCell;
  if (v5 == v4)
  {
    if (passwordCell)
    {
      -[SFEditableTableViewCell editableTextField](passwordCell, "editableTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "becomeFirstResponder");

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  -[SFEditableTableViewCell editableTextField](passwordCell, "editableTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v4)
  {

    goto LABEL_8;
  }
  v9 = -[UIBarButtonItem isEnabled](self->_doneBarButtonItem, "isEnabled");

  if (v9)
  {
LABEL_7:
    -[SFAccountDetailViewController _saveAccountAndFinishEditing](self, "_saveAccountAndFinishEditing");
    goto LABEL_9;
  }
LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_secretEntryAlertController);
  objc_msgSend(WeakRetained, "textFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    v14 = objc_alloc(MEMORY[0x1E0D8ACE8]);
    objc_msgSend(v4, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithUserProvidedString:", v15);
    -[SFAccountDetailViewController _addTOTPGenerator:](self, "_addTOTPGenerator:", v16);

    v13 = 1;
    -[SFAccountDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_11;
  }
LABEL_9:
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)_updatePasswordFieldTextSuggestions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_bestURLForUserTypedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "autoGeneratedPasswordForURL:respectingPasswordRequirements:maxLength:", v9, 0, -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3E40], "textSuggestionWithInputText:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHeaderText:", v13);

      objc_msgSend(v12, "setDisplayText:", v11);
      v19[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__SFAccountDetailViewController__updatePasswordFieldTextSuggestions___block_invoke;
  v16[3] = &unk_1E4ABFB20;
  v17 = v4;
  v18 = v7;
  v14 = v7;
  v15 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __69__SFAccountDetailViewController__updatePasswordFieldTextSuggestions___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textInputSuggestionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuggestions:", *(_QWORD *)(a1 + 40));

}

- (void)_textFieldChanged:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v16)
    -[SFAccountDetailViewController _updatePasswordFieldTextSuggestions:](self, "_updatePasswordFieldTextSuggestions:", v16);
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v16)
  {

    goto LABEL_10;
  }
  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v16)
  {
LABEL_10:
    -[SFAccountDetailViewController _updateSavedAccountChangeRequest](self, "_updateSavedAccountChangeRequest");
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_doneBarButtonItem, "setEnabled:", objc_msgSend(WeakRetained, "canChangeSavedAccountWithRequest:", self->_savedAccountChangeRequest));
    goto LABEL_11;
  }
  -[SFAccountHeaderViewCell editableTextField](self->_headerCell, "editableTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v16)
    -[SFAccountDetailViewController _updateHeaderViewCell](self, "_updateHeaderViewCell");
  WeakRetained = objc_loadWeakRetained((id *)&self->_secretEntryAlertController);
  objc_msgSend(WeakRetained, "textFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v16)
  {
    v11 = objc_alloc(MEMORY[0x1E0D8ACE8]);
    objc_msgSend(v16, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUserProvidedString:", v12);
    objc_msgSend(WeakRetained, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", v13 != 0);

  }
LABEL_11:

}

- (id)_lastModifiedDateString
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_completedUpgradeToSignInWithApple)
  {
    _WBSLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8A738], "dateFormatterWithDynamicContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount lastModifiedDate](self->_savedAccount, "lastModifiedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)_passkeyCreationDateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D8A738], "dateFormatterWithStandaloneContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount creationDateForPasskey](self->_savedAccount, "creationDateForPasskey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)_sectionTypeForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (int64_t)_itemTypeForIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 6;
    else
      v4 = objc_msgSend(v3, "integerValue");
  }

  return v4;
}

- (void)_updateSavedAccountChangeRequest
{
  WBSSavedAccountChangeRequest *savedAccountChangeRequest;
  WBSSavedAccountChangeRequest *v4;
  WBSSavedAccountChangeRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  savedAccountChangeRequest = self->_savedAccountChangeRequest;
  if (!savedAccountChangeRequest)
  {
    v4 = (WBSSavedAccountChangeRequest *)objc_alloc_init(MEMORY[0x1E0D8ABE8]);
    v5 = self->_savedAccountChangeRequest;
    self->_savedAccountChangeRequest = v4;

    savedAccountChangeRequest = self->_savedAccountChangeRequest;
  }
  -[WBSSavedAccountChangeRequest setSavedAccount:](savedAccountChangeRequest, "setSavedAccount:", self->_savedAccount);
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountChangeRequest setUser:](self->_savedAccountChangeRequest, "setUser:", v7);

  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountChangeRequest setPassword:](self->_savedAccountChangeRequest, "setPassword:", v9);

  -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountChangeRequest setNotesEntry:](self->_savedAccountChangeRequest, "setNotesEntry:", v11);

  -[WBSSavedAccount totpGenerators](self->_savedAccount, "totpGenerators");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountChangeRequest setTotpGenerator:](self->_savedAccountChangeRequest, "setTotpGenerator:", v13);

  -[SFAccountHeaderViewCell titleTextField](self->_headerCell, "titleTextField");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountChangeRequest setCustomTitle:](self->_savedAccountChangeRequest, "setCustomTitle:", v14);

}

- (void)_saveAccountAndFinishEditing
{
  void *v3;
  SFEditableTableViewCell *passwordCell;

  self->_showPasswordAsBulletsWhenNotEditing = 0;
  -[SFAccountHeaderViewCell commitCustomTitle](self->_headerCell, "commitCustomTitle");
  -[SFAccountDetailViewController _updateSavedAccountChangeRequest](self, "_updateSavedAccountChangeRequest");
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeSavedAccountWithRequest:", self->_savedAccountChangeRequest);

  -[SFAccountDetailViewController _setEditing:animated:](self, "_setEditing:animated:", 0, 1);
  if (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") == 2)
  {
    passwordCell = self->_passwordCell;
    self->_passwordCell = 0;

  }
  -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
}

- (id)_warningTitleForPassword
{
  return 0;
}

- (void)_updateWarningForSavedAccount
{
  void *v3;
  WBSSavedAccount *savedAccount;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  savedAccount = self->_savedAccount;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SFAccountDetailViewController__updateWarningForSavedAccount__block_invoke;
  v5[3] = &unk_1E4AC0978;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "getWarningForSavedAccount:completionHandler:", savedAccount, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __62__SFAccountDetailViewController__updateWarningForSavedAccount__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 150, a2);
    objc_msgSend(WeakRetained, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
  }

}

- (void)_addTOTPGenerator:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD block[5];

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D8AC08];
    v5 = a3;
    objc_msgSend(v4, "sharedStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveTOTPGenerator:forSavedAccount:", v5, self->_savedAccount);

    -[SFAccountDetailViewController _updateCachedTOTPGenerators](self, "_updateCachedTOTPGenerators");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SFAccountDetailViewController__addTOTPGenerator___block_invoke;
    block[3] = &unk_1E4ABFE00;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __51__SFAccountDetailViewController__addTOTPGenerator___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "snapshot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", &unk_1E4B25648);

  if (v3)
    objc_msgSend(v4, "deleteSectionsWithIdentifiers:", &unk_1E4B26E90);
  objc_msgSend(*(id *)(a1 + 32), "_addTOTPGeneratorsToSnapshot:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateAddButtonsInAccountOptionsSectionForSnapshot:", v4);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "credentialTypes") == 3)
  {
    objc_msgSend(v4, "deleteItemsWithIdentifiers:", &unk_1E4B26EA8);
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26EC0, &unk_1E4B25678);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "applySnapshot:animatingDifferences:", v4, 1);

}

- (void)_deleteTOTPGenerator:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTOTPGeneratorForSavedAccount:", self->_savedAccount);

  -[SFAccountDetailViewController _updateCachedTOTPGenerators](self, "_updateCachedTOTPGenerators");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke;
  v7[3] = &unk_1E4ABFB20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsWithIdentifiers:", v3);

  if (objc_msgSend(v2, "indexOfSectionIdentifier:", &unk_1E4B25648) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "itemIdentifiersInSectionWithIdentifier:", &unk_1E4B25648);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      objc_msgSend(v2, "deleteSectionsWithIdentifiers:", &unk_1E4B26ED8);
  }
  objc_msgSend(v2, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", &unk_1E4B25780);

  if (v7)
  {
    objc_msgSend(v2, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", &unk_1E4B26EF0, &unk_1E4B25780);
    objc_msgSend(v2, "deleteItemsWithIdentifiers:", &unk_1E4B26F08);
  }
  objc_msgSend(v2, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", &unk_1E4B25660);

  if (v9)
    objc_msgSend(v2, "deleteItemsWithIdentifiers:", &unk_1E4B26F20);
  objc_msgSend(*(id *)(a1 + 32), "_updateAddButtonsInAccountOptionsSectionForSnapshot:", v2);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1184);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke_2;
  v12[3] = &unk_1E4ABFE00;
  v12[4] = v10;
  objc_msgSend(v11, "applySnapshot:animatingDifferences:completion:", v2, 1, v12);

}

uint64_t __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelChangesAndFinishEditing");
}

- (void)_updateCachedTOTPGenerators
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *TOTPGenerators;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[WBSSavedAccount totpGenerators](self->_savedAccount, "totpGenerators");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  TOTPGenerators = self->_TOTPGenerators;
  self->_TOTPGenerators = v5;

}

- (id)_newSecretEntryAlertController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  SFAccountDetailViewController *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v4, v8, CFSTR("alert-passwords"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke;
  v26[3] = &unk_1E4AC09A0;
  v26[4] = self;
  objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v26);
  v11 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_2;
  v24[3] = &unk_1E4AC0010;
  v13 = v9;
  v25 = v13;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_3;
  v21[3] = &unk_1E4AC0128;
  v17 = v13;
  v22 = v17;
  v23 = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setEnabled:", 0);
  objc_msgSend(v17, "addAction:", v18);
  v19 = v17;

  return v19;
}

void __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v3);

  v4 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(v7, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sf_highLegibilityAlternateFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "addTarget:action:forEvents:", *(_QWORD *)(a1 + 32), sel__textFieldChanged_, 0x20000);

}

uint64_t __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8ACE8]), "initWithUserProvidedString:", v6);
  objc_msgSend(v4, "_addTOTPGenerator:", v5);

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_deleteTOTPGeneratorWithConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  SFAccountDetailViewController *v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C92668], "configurationForDeleting:fromSavedAccount:", 1, self->_savedAccount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v7, v8, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v5, "buttonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke;
  v29[3] = &unk_1E4AC09C8;
  v29[4] = self;
  v30 = v4;
  v13 = v9;
  v31 = v13;
  v14 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_2;
  v26[3] = &unk_1E4AC0128;
  v18 = v13;
  v27 = v18;
  v28 = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_4;
  v24[3] = &unk_1E4AC0010;
  v25 = v18;
  v22 = v18;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v23);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
}

uint64_t __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deleteTOTPGenerator:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_3;
  v3[3] = &unk_1E4ABFE00;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_3(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[127], "userVisibleSites");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_bestURLForUserTypedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_openURLInSafariViewController:shouldSupressPasswordUpdatePrompts:", v3, 1);

}

uint64_t __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_addNotesSectionToSnapshot:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", &unk_1E4B257F8);

  if ((v5 & 1) == 0)
  {
    if (!self->_isForFillingIndividualAccountFields)
      goto LABEL_5;
    objc_msgSend(v14, "sectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = &unk_1E4B256A8;
    v8 = objc_msgSend(v6, "containsObject:", &unk_1E4B256A8);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v14, "sectionIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = &unk_1E4B25678;
      v10 = objc_msgSend(v9, "containsObject:", &unk_1E4B25678);

      if ((v10 & 1) == 0)
      {
LABEL_5:
        objc_msgSend(v14, "sectionIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", &unk_1E4B25648);
        v13 = &unk_1E4B256C0;
        if (v12)
          v13 = &unk_1E4B25648;
        v7 = v13;

      }
    }
    objc_msgSend(v14, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", &unk_1E4B26F38, v7);
    objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E4B26F50, &unk_1E4B257F8);
    objc_msgSend(v14, "reconfigureItemsWithIdentifiers:", &unk_1E4B26F68);

  }
}

- (void)_openURLInSafariViewController:(id)a3 shouldSupressPasswordUpdatePrompts:(BOOL)a4
{
  _BOOL8 v4;
  SFSafariViewControllerConfiguration *v6;
  SFSafariViewController *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (-[UIViewController safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:](self, "safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:"))
  {
    v6 = objc_alloc_init(SFSafariViewControllerConfiguration);
    -[SFSafariViewControllerConfiguration _setPerformingAccountSecurityUpgrade:](v6, "_setPerformingAccountSecurityUpgrade:", v4);
    v7 = -[SFSafariViewController initWithURL:configuration:]([SFSafariViewController alloc], "initWithURL:configuration:", v8, v6);
    -[SFSafariViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 1);
    -[SFSafariViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (id)_footerTextForLastOneTimeShareDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a3;
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8A738], "dateFormatterWithDynamicContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_reloadPasskeySectionFooters
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = -[SFTableViewDiffableDataSource indexForSectionIdentifier:](self->_tableViewDiffableDataSource, "indexForSectionIdentifier:", &unk_1E4B256C0);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[SFTableViewDiffableDataSource indexForSectionIdentifier:](self->_tableViewDiffableDataSource, "indexForSectionIdentifier:", &unk_1E4B256A8);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "addIndex:", v4);
  -[SFAccountDetailViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reloadSectionHeaderFooters:withRowAnimation:", v6, 5);

}

- (id)_accountHeaderSectionFooterView
{
  void *v3;

  if (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") == 2)
  {
    -[SFAccountDetailViewController _passkeyFooterView](self, "_passkeyFooterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_passkeySectionFooterView
{
  void *v3;

  if (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") == 3)
  {
    -[SFAccountDetailViewController _passkeyFooterView](self, "_passkeyFooterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_passkeyFooterView
{
  _SFTableLinkableFooterView *v3;
  _SFTableLinkableFooterView *v4;
  _SFTableLinkableFooterView *passkeyFooterView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _SFTableLinkableFooterView *v15;
  void *v16;
  void *v17;

  if (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") == 1)
  {
    v3 = 0;
  }
  else
  {
    if (!self->_passkeyFooterView)
    {
      v4 = objc_alloc_init(_SFTableLinkableFooterView);
      passkeyFooterView = self->_passkeyFooterView;
      self->_passkeyFooterView = v4;

      -[_SFTableLinkableFooterView setDelegate:](self->_passkeyFooterView, "setDelegate:", self);
    }
    -[WBSSavedAccount lastOneTimeShareDateForPasskey](self->_savedAccount, "lastOneTimeShareDateForPasskey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WBSSavedAccount lastOneTimeShareDateForPasskey](self->_savedAccount, "lastOneTimeShareDateForPasskey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController _footerTextForLastOneTimeShareDate:](self, "_footerTextForLastOneTimeShareDate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C92658], "footerString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@\n\n%@"), v8, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C92658], "footerString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C92658], "footerString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_SFTableLinkableFooterView textLabel](self->_passkeyFooterView, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v11);

    if ((v14 & 1) == 0)
      -[_SFTableLinkableFooterView invalidateIntrinsicContentSize](self->_passkeyFooterView, "invalidateIntrinsicContentSize");
    v15 = self->_passkeyFooterView;
    objc_msgSend(MEMORY[0x1E0C92658], "footerLearnMoreLinkBindingString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92658], "footerLearnMoreLinkString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFTableLinkableFooterView setText:linkPlaceholderString:linkReplacementString:](v15, "setText:linkPlaceholderString:linkReplacementString:", v11, v16, v17);

    v3 = self->_passkeyFooterView;
  }
  return v3;
}

- (void)_fillUsername
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountDetailViewController:fillUsernameForSavedAccount:", self, self->_savedAccount);

}

- (void)_fillPassword
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountDetailViewController:fillPasswordForSavedAccount:", self, self->_savedAccount);

}

- (void)_fillVerificationCode
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountDetailViewController:fillVerificationCodeForSavedAccount:", self, self->_savedAccount);

}

- (void)linkableFooterViewDidInteractWithLink:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C92660]);
  objc_initWeak(&location, v5);
  v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v7 = (void *)MEMORY[0x1E0DC3428];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __71__SFAccountDetailViewController_linkableFooterViewDidInteractWithLink___block_invoke;
  v15 = &unk_1E4ABFFC0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "actionWithHandler:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithBarButtonSystemItem:primaryAction:", 0, v8, v12, v13, v14, v15);
  objc_msgSend(v5, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __71__SFAccountDetailViewController_linkableFooterViewDidInteractWithLink___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_sharePasswordWithPopoverPresentationControllerConfiguration:(id)a3
{
  id v4;
  _SFAirDropAccountSharingAuthenticationContext *v5;
  id v6;
  _SFAirDropAccountSharingAuthenticationContext *v7;
  _QWORD v8[5];
  _SFAirDropAccountSharingAuthenticationContext *v9;
  id v10;

  v4 = a3;
  v5 = -[_SFAirDropAccountSharingAuthenticationContext initWithSavedAccount:]([_SFAirDropAccountSharingAuthenticationContext alloc], "initWithSavedAccount:", self->_savedAccount);
  self->_isOneTimeSharingAccount = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke;
  v8[3] = &unk_1E4AC09F0;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  +[_SFSettingsAuthentication authenticateForSettings:allowAuthenticationReuse:completionHandler:](_SFSettingsAuthentication, "authenticateForSettings:allowAuthenticationReuse:completionHandler:", v7, 0, v8);

}

void __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sharePasswordWithAuthenticationContext:popoverPresentationControllerConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke_cold_1(v7);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1336) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("_SFShowAccountManagerLockedViewIfNeededNotification"), 0);

  }
}

- (void)_sharePasswordWithAuthenticationContext:(id)a3 popoverPresentationControllerConfiguration:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  if (objc_msgSend(a3, "hasBeenAuthenticated"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A068]), "initWithSavedPassword:", self->_savedAccount);
    v8 = objc_alloc(MEMORY[0x1E0CEA2D8]);
    objc_msgSend(v7, "urlRepresentationForAirDrop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v10, 0);

    v15 = *MEMORY[0x1E0CEB1B0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIncludedActivityTypes:", v12);

    objc_msgSend(v11, "setExcludedActivityCategories:", 3);
    objc_msgSend(v11, "setModalPresentationStyle:", 7);
    objc_msgSend(v11, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPermittedArrowDirections:", 1);
    if (v6)
      v6[2](v6, v13);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __116__SFAccountDetailViewController__sharePasswordWithAuthenticationContext_popoverPresentationControllerConfiguration___block_invoke;
    v14[3] = &unk_1E4AC0A18;
    v14[4] = self;
    objc_msgSend(v11, "setCompletionWithItemsHandler:", v14);
    -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

void __116__SFAccountDetailViewController__sharePasswordWithAuthenticationContext_popoverPresentationControllerConfiguration___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateLastOneTimeShareDateforSavedAccountIfNeeded:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));

    objc_msgSend(*(id *)(a1 + 32), "_reloadPasskeySectionFooters");
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1336) = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("_SFShowAccountManagerLockedViewIfNeededNotification"), 0);

}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  void *v5;
  void *v7;

  v5 = 0;
  switch(-[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4))
  {
    case 1:
      if (self->_isForFillingIndividualAccountFields)
        return 0;
      goto LABEL_10;
    case 2:
      if (!self->_isForFillingIndividualAccountFields)
        goto LABEL_10;
      return 0;
    case 5:
      if (!-[SFAccountDetailViewController _completedUpgrade](self, "_completedUpgrade"))
        goto LABEL_10;
      return 0;
    case 6:
      if (-[SFAccountDetailViewController _shouldShowAccountOptionsHeader](self, "_shouldShowAccountOptionsHeader"))
        goto LABEL_10;
      return 0;
    case 7:
LABEL_10:
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 8:
      -[WBSSavedAccount sites](self->_savedAccount, "sites");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "count");
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    default:
      return v5;
  }
}

- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4
{
  void *v5;

  if (-[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4) == 9
    && -[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted"))
  {
    -[WBSSavedAccount pm_recentlyDeletedDetailViewDeleteSectionFooter](self->_savedAccount, "pm_recentlyDeletedDetailViewDeleteSectionFooter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)dataSource:(id)a3 commitEditingStyle:(int64_t)a4 forItemIdentifier:(id)a5
{
  id v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WBSSavedAccount *savedAccount;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v7 = a3;
  v8 = a5;
  v9 = -[SFAccountDetailViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v8);
  -[SFTableViewDiffableDataSource indexPathForItemIdentifier:](self->_tableViewDiffableDataSource, "indexPathForItemIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == 15)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount sites](self->_savedAccount, "sites");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    savedAccount = self->_savedAccount;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke;
    v15[3] = &unk_1E4AC07A8;
    objc_copyWeak(&v18, &location);
    v16 = v8;
    v17 = v10;
    objc_msgSend(v11, "removeSite:fromSavedAccountWithPassword:withCompletion:", v13, savedAccount, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke_2;
    block[3] = &unk_1E4ABFC38;
    block[4] = WeakRetained;
    v5 = a1[4];
    v6 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsWithIdentifiers:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "applySnapshot:animatingDifferences:", v2, 1);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[148];
  objc_msgSend(v4, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "tableView:numberOfRowsInSection:", v6, objc_msgSend(*(id *)(a1 + 48), "section"));

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DCCBB0]);
    objc_msgSend(v8, "schedulePasswordIconsCleanup");
    objc_msgSend(*(id *)(a1 + 32), "_popViewController");

  }
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "indexForSectionIdentifier:", &unk_1E4B25660);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_reloadSectionHeaderFooters:withRowAnimation:", v10, 5);

}

- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4
{
  SFTableViewDiffableDataSource *tableViewDiffableDataSource;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v13;
  void *v14;

  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  v6 = a4;
  -[SFTableViewDiffableDataSource snapshot](tableViewDiffableDataSource, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 == 8)
  {
    if (-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") != 2)
    {
      -[WBSSavedAccount sites](self->_savedAccount, "sites");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (unint64_t)objc_msgSend(v14, "count") > 1;

      return v13;
    }
    return 0;
  }
  if (v11 != 7)
  {
    if (!v11)
      return -[SFAccountDetailViewController _allowEditing](self, "_allowEditing");
    return 0;
  }
  return 1;
}

- (BOOL)_completedUpgrade
{
  return self->_completedUpgradeToSignInWithApple || self->_completedUpgradeToStrongPassword;
}

- (void)_updateAccountModificationOptions
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *rulesForStrongPasswordChange;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[NSExtension attributes](self->_accountModificationExtension, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E0D8A078]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8A9E0], "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_eligibleToChangeToStrongPassword = objc_msgSend(v4, "isKeychainSyncEnabled");

  }
  else
  {
    self->_eligibleToChangeToStrongPassword = 0;
  }
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E0D8A088]);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  rulesForStrongPasswordChange = self->_rulesForStrongPasswordChange;
  self->_rulesForStrongPasswordChange = v5;

  if ((-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") & 2) != 0)
  {
    self->_eligibleToUpgradeToSignInWithApple = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_sf_passwordManagerIsInDemoMode");

  if (v8)
  {
    self->_eligibleToUpgradeToSignInWithApple = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E0D8A080]);
LABEL_8:
    -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
    goto LABEL_9;
  }
  -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
  if (objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E0D8A080]))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D00158]);
    v10 = (void *)MEMORY[0x1E0CB34D0];
    -[NSExtension _plugIn](self->_accountModificationExtension, "_plugIn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containingUrl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleWithURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke;
    v15[3] = &unk_1E4AC0A40;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "getCredentialStateForClientID:completion:", v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
LABEL_9:

}

void __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *WeakRetained;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke_cold_1((uint64_t)WeakRetained, v6);
    }
    WeakRetained[1281] = a2 == 2;
    objc_msgSend(WeakRetained, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
  }

}

- (void)_initiateUpgradeToSignInWithApple
{
  id v3;
  void *v4;
  void *v5;
  NSExtension *accountModificationExtension;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0C925A8]);
  -[WBSSavedAccount user](self->_savedAccount, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount password](self->_savedAccount, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accountModificationExtension = self->_accountModificationExtension;
  v7 = objc_alloc(MEMORY[0x1E0C925B8]);
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:type:", v8, 0);
  v10 = (id)objc_msgSend(v3, "initWithUser:password:extension:serviceIdentifier:userInfo:", v4, v5, accountModificationExtension, v9, 0);

  -[ASAccountAuthenticationModificationController performRequest:](self->_accountAuthenticationModificationController, "performRequest:", v10);
}

- (void)_initiateChangeToStrongPassword
{
  id v3;
  void *v4;
  void *v5;
  NSExtension *accountModificationExtension;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0C925B0]);
  -[WBSSavedAccount user](self->_savedAccount, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount password](self->_savedAccount, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accountModificationExtension = self->_accountModificationExtension;
  v7 = objc_alloc(MEMORY[0x1E0C925B8]);
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:type:", v8, 0);
  v10 = (id)objc_msgSend(v3, "initWithUser:password:extension:serviceIdentifier:userInfo:", v4, v5, accountModificationExtension, v9, 0);

  -[ASAccountAuthenticationModificationController performRequest:](self->_accountAuthenticationModificationController, "performRequest:", v10);
}

- (void)accountAuthenticationModificationController:(id)a3 didSuccessfullyCompleteRequest:(id)a4 withUserInfo:(id)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFAccountDetailViewController _completedSignInWithAppleUpgrade](self, "_completedSignInWithAppleUpgrade");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SFAccountDetailViewController _completedStrongPasswordUpgrade](self, "_completedStrongPasswordUpgrade");
  }

}

- (void)_completedSignInWithAppleUpgrade
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:", self->_savedAccount);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCredentialTypes:forSavedAccount:", 1, self->_savedAccount);

  self->_completedUpgradeToSignInWithApple = 1;
  -[UIBarButtonItem setEnabled:](self->_editBarButtonItem, "setEnabled:", 0);
  -[UIBarButtonItem setEnabled:](self->_shareBarButtonItem, "setEnabled:", 0);
  -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
  -[SFAccountDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_reloadSectionHeaderFooters:withRowAnimation:", v5, 5);

}

- (void)_completedStrongPasswordUpgrade
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(WeakRetained, "setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:", self->_savedAccount);
  }
  self->_completedUpgradeToStrongPassword = 1;
  -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);

}

- (void)accountAuthenticationModificationController:(id)a3 didFailRequest:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  SFAccountDetailViewController *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFAccountDetailViewController accountAuthenticationModificationController:didFailRequest:withError:].cold.1(v11);
  }
  if (objc_msgSend(v10, "code") != 1)
  {
    v35 = v8;
    objc_msgSend(v10, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C92590]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "code") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v24 = (void *)MEMORY[0x1E0DC3450];
      v25 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSExtension _plugIn](self->_accountModificationExtension, "_plugIn");
      v27 = self;
      v28 = v9;
      v29 = v13;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedContainingName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", v26, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "alertControllerWithTitle:message:imageNamed:preferredStyle:", 0, v32, CFSTR("alert-passwords"), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v29;
      v9 = v28;
      self = v27;

      v33 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v33;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0DC3450];
      v15 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSExtension _plugIn](self->_accountModificationExtension, "_plugIn");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedContainingName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v19, v13, CFSTR("alert-passwords"), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
    }
    objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v34);

    -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
    v8 = v35;
  }

}

- (id)presentationAnchorForAccountAuthenticationModificationController:(id)a3
{
  void *v3;
  void *v4;

  -[SFAccountDetailViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)accountModificationExtensionManagerExtensionListDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke;
  v7[3] = &unk_1E4AC07E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "extensionForDomain:completionHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke_2;
    v6[3] = &unk_1E4ABFB20;
    v6[4] = WeakRetained;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1272), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateAccountModificationOptions");
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSourceAnimated:", 0);
}

- (void)_showConfirmationToDeletePasswordAndTOTPGenerator
{
  if ((-[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted") & 1) != 0)
    -[SFAccountDetailViewController _showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator](self, "_showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator");
  else
    -[SFAccountDetailViewController _showConfirmationToSoftDeletePasswordAndTOTPGenerator](self, "_showConfirmationToSoftDeletePasswordAndTOTPGenerator");
}

- (void)_showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator
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
  _QWORD v15[5];

  objc_msgSend(MEMORY[0x1E0C92668], "configurationForDeleting:fromSavedAccount:", 0, self->_savedAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v5, v6, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("DeletePasswordAndTOTPGeneratorConfirmation"));

  v9 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v3, "buttonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__SFAccountDetailViewController__showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator__block_invoke;
  v15[3] = &unk_1E4AC0010;
  v15[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __93__SFAccountDetailViewController__showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_permanentlyDeletePassword");
}

- (void)_showConfirmationToSoftDeletePasswordAndTOTPGenerator
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
  _QWORD v15[5];

  objc_msgSend(MEMORY[0x1E0C92668], "configurationForDeleting:fromSavedAccount:", 0, self->_savedAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v5, v6, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("SoftDeletePasswordAndTOTPGeneratorConfirmation"));

  v9 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v3, "buttonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__SFAccountDetailViewController__showConfirmationToSoftDeletePasswordAndTOTPGenerator__block_invoke;
  v15[3] = &unk_1E4AC0010;
  v15[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __86__SFAccountDetailViewController__showConfirmationToSoftDeletePasswordAndTOTPGenerator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_softDeletePassword");
}

- (void)_showConfirmationToDeleteCredentialTypes:(int64_t)a3
{
  if ((-[WBSSavedAccount isRecentlyDeleted](self->_savedAccount, "isRecentlyDeleted") & 1) != 0)
    -[SFAccountDetailViewController _showConfirmationToPermanentlyDeleteCredentialTypes:](self, "_showConfirmationToPermanentlyDeleteCredentialTypes:", a3);
  else
    -[SFAccountDetailViewController _showConfirmationToSoftDeleteCredentialTypes:](self, "_showConfirmationToSoftDeleteCredentialTypes:", a3);
}

- (void)_showConfirmationToPermanentlyDeleteCredentialTypes:(int64_t)a3
{
  void *v5;
  WBSSavedAccount *savedAccount;
  uint64_t v7;
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
  _QWORD v22[6];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    v8 = (void *)MEMORY[0x1E0C92668];
    v23[0] = self->_savedAccount;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationForDeletingSavedAccounts:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 2)
    {
      v5 = (void *)MEMORY[0x1E0C92668];
      savedAccount = self->_savedAccount;
      v7 = 2;
    }
    else
    {
      if (a3 != 1)
      {
        v10 = 0;
        goto LABEL_9;
      }
      v5 = (void *)MEMORY[0x1E0C92668];
      savedAccount = self->_savedAccount;
      v7 = 0;
    }
    objc_msgSend(v5, "configurationForDeleting:fromSavedAccount:", v7, savedAccount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v11 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v12, v13, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("DeleteCredentialConfirmation"));

  v16 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v10, "buttonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__SFAccountDetailViewController__showConfirmationToPermanentlyDeleteCredentialTypes___block_invoke;
  v22[3] = &unk_1E4AC0A68;
  v22[4] = self;
  v22[5] = a3;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 2, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18);

  v19 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v21);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

void __85__SFAccountDetailViewController__showConfirmationToPermanentlyDeleteCredentialTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1384));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountDetailViewController:didDeleteAccountWithWarning:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1200));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "credentialTypes");
  v3 = *(_QWORD *)(a1 + 40);
  switch(v3)
  {
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_permanentlyDeleteAllCredentials");
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_permanentlyDeletePasskey");
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "_permanentlyDeletePassword");
      break;
  }
  if (v2 == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_popViewController");

}

- (void)_permanentlyDeletePassword
{
  void *v3;
  WBSPasswordWarning *passwordWarning;
  SFEditableTableViewCell *passwordCell;
  id v6;

  -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeWarningForSavedAccount:", self->_savedAccount);

  passwordWarning = self->_passwordWarning;
  self->_passwordWarning = 0;

  passwordCell = self->_passwordCell;
  self->_passwordCell = 0;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeCredentialTypes:forSavedAccount:", 1, self->_savedAccount);

}

- (void)_permanentlyDeletePasskey
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCredentialTypes:forSavedAccount:", 2, self->_savedAccount);

}

- (void)_permanentlyDeleteAllCredentials
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCredentialTypes:forSavedAccount:", 3, self->_savedAccount);

}

- (void)_showConfirmationToSoftDeleteCredentialTypes:(int64_t)a3
{
  void *v5;
  uint64_t v6;
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
  _QWORD v18[6];

  if (a3 == 1)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v5 = 0;
  if (a3 == 2)
  {
    v6 = 2;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C92668], "configurationForDeleting:fromSavedAccount:", v6, self->_savedAccount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v8, v9, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("DeleteCredentialConfirmation"));

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v5, "buttonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__SFAccountDetailViewController__showConfirmationToSoftDeleteCredentialTypes___block_invoke;
  v18[3] = &unk_1E4AC0A68;
  v18[4] = self;
  v18[5] = a3;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 2, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v17);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

void __78__SFAccountDetailViewController__showConfirmationToSoftDeleteCredentialTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "credentialTypes");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_softDeletePassword") & 1) != 0)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_presentSoftDeleteErrorAlertForCredentialTypes:", *(_QWORD *)(a1 + 40));
    return;
  }
  if (v3 != 2 || (objc_msgSend(*(id *)(a1 + 32), "_softDeletePasskey") & 1) == 0)
    goto LABEL_9;
LABEL_4:
  if (v2 == *(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1384));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "accountDetailViewController:didMoveSavedAccountToRecentlyDeleted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));
    objc_msgSend(*(id *)(a1 + 32), "_popViewController");

  }
}

- (BOOL)_softDeletePassword
{
  void *v3;
  void *v4;
  void *v5;
  WBSPasswordWarning *passwordWarning;
  SFEditableTableViewCell *passwordCell;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveCredentialTypesToRecentlyDeleted:fromSavedAccount:", 1, self->_savedAccount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SFAccountDetailViewController _passwordWarningManager](self, "_passwordWarningManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeWarningForSavedAccount:", self->_savedAccount);

    passwordWarning = self->_passwordWarning;
    self->_passwordWarning = 0;

    passwordCell = self->_passwordCell;
    self->_passwordCell = 0;

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFAccountDetailViewController _softDeletePassword].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return v4 != 0;
}

- (BOOL)_softDeletePasskey
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveCredentialTypesToRecentlyDeleted:fromSavedAccount:", 2, self->_savedAccount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

- (void)_presentSoftDeleteErrorAlertForCredentialTypes:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:imageNamed:preferredStyle:", v4, 0, CFSTR("alert-passwords"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SFAccountDetailViewController__presentSoftDeleteErrorAlertForCredentialTypes___block_invoke;
  v10[3] = &unk_1E4AC0010;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __80__SFAccountDetailViewController__presentSoftDeleteErrorAlertForCredentialTypes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_recoverSavedAccount
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to recover recently deleted saved account", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert
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
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  objc_msgSend(MEMORY[0x1E0D6C078], "alertTitleAndMessageForRecoveringSavedAccountToMyPasswords:", self->_savedAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v5, v6, CFSTR("alert-passwords"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __102__SFAccountDetailViewController__presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert__block_invoke;
  v17 = &unk_1E4AC0A90;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10, v14, v15, v16, v17);

  v11 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __102__SFAccountDetailViewController__presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_moveSavedAccountToMyPasswords");
    WeakRetained = v2;
  }

}

- (void)_moveSavedAccountToMyPasswords
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to move recently deleted saved account to personal keychain", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_presentErrorAlertForFailingToRecoverRecentlyDeletedSavedAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v4, 0, CFSTR("alert-passwords"), 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (BOOL)_shouldShowAccountOptionsHeader
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL result;

  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", &unk_1E4B25810);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
    return self->_didShowAccountOptionsHeaderText;
  result = 1;
  self->_didShowAccountOptionsHeaderText = 1;
  return result;
}

- (void)QRCodeScannerViewController:(id)a3 didScanQRCodeWithURLValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PMTOTPMigrationController *v9;
  PMTOTPMigrationController *totpMigrationController;
  uint64_t v11;
  PMTOTPMigrationController *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  UINavigationController *v25;
  UINavigationController *totpMigrationNavigationController;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_didAcceptTOTPQRCode)
  {
    if (objc_msgSend(v7, "safari_isOTPAuthMigrationURL"))
    {
      if (self->_totpMigrationNavigationController)
        goto LABEL_2;
      v9 = (PMTOTPMigrationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0A8]), "initWithMigrationURL:", v8);
      totpMigrationController = self->_totpMigrationController;
      self->_totpMigrationController = v9;

      if (self->_totpMigrationController)
      {
        self->_didAcceptTOTPQRCode = 1;
        v11 = -[PMTOTPMigrationController numberOfCodes](self->_totpMigrationController, "numberOfCodes");
        v12 = self->_totpMigrationController;
        if (v11 != 1)
        {
          -[PMTOTPMigrationController setDelegate:](v12, "setDelegate:", self);
          v23 = objc_alloc(MEMORY[0x1E0DC3A40]);
          -[PMTOTPMigrationController viewController](self->_totpMigrationController, "viewController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (UINavigationController *)objc_msgSend(v23, "initWithRootViewController:", v24);
          totpMigrationNavigationController = self->_totpMigrationNavigationController;
          self->_totpMigrationNavigationController = v25;

          -[UINavigationController setModalPresentationStyle:](self->_totpMigrationNavigationController, "setModalPresentationStyle:", 2);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke;
          v32[3] = &unk_1E4ABFE00;
          v32[4] = self;
          -[SFAccountDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v32);
          goto LABEL_2;
        }
        -[PMTOTPMigrationController totpGenerators](v12, "totpGenerators");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_9;
      }
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8ACE8]), "initWithOTPAuthURL:", v8);
    if (v14)
    {
LABEL_9:
      -[SFAccountDetailViewController _addTOTPGenerator:](self, "_addTOTPGenerator:", v14);
      self->_didAcceptTOTPQRCode = 1;
      -[SFAccountDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

      goto LABEL_2;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SFAccountDetailViewController QRCodeScannerViewController:didScanQRCodeWithURLValue:].cold.1(v15);
    v16 = (void *)MEMORY[0x1E0DC3450];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, 0, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke_606;
    v30 = &unk_1E4AC0010;
    v31 = v18;
    v21 = v18;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, &v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v22, v27, v28, v29, v30);

    objc_msgSend(v6, "presentViewController:animated:completion:", v21, 1, 0);
  }
LABEL_2:

}

uint64_t __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1360), 1, 0);
}

void __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke_606(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_presentHideSecurityRecommendationConfirmationAlert
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v4, v5, CFSTR("alert-passwords"), _SFDeviceAlertStyle());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __84__SFAccountDetailViewController__presentHideSecurityRecommendationConfirmationAlert__block_invoke;
  v16 = &unk_1E4AC0A90;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9, v13, v14, v15, v16);

  v10 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __84__SFAccountDetailViewController__presentHideSecurityRecommendationConfirmationAlert__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_hideSecurityRecommendation");
    v2 = objc_loadWeakRetained(v3 + 173);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "accountDetailViewController:didHideWarning:", v3, v3[150]);
    if (((_BYTE)v3[129] & 1) == 0)
      objc_msgSend(v3, "_popViewController");

    WeakRetained = v3;
  }

}

- (void)_hideSecurityRecommendation
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AAB0]), "initWithIssueTypes:", -[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes"));
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveHideMarker:forSavedAccount:", v4, self->_savedAccount);

  -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
}

- (BOOL)shouldSuppressAccountManagerLockedView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_changePasswordSafariViewController);

  return WeakRetained || self->_isOneTimeSharingAccount;
}

- (void)passwordManagerWillLock
{
  void *v3;
  void *v4;

  -[SFAccountDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissMenu");

  -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu");
}

- (void)noteTableViewCellTextViewTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if ((-[SFAccountDetailViewController isEditing](self, "isEditing", a3) & 1) == 0)
  {
    -[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      -[SFAccountDetailViewController _setEditing:animated:](self, "_setEditing:animated:", 1, 1);
      -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "becomeFirstResponder");

    }
  }
}

- (void)accountDetailHeaderViewCell:(id)a3 titleTextFieldDidChange:(id)a4
{
  NSString *v5;
  NSString *titleForEditing;

  objc_msgSend(a4, "text", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleForEditing = self->_titleForEditing;
  self->_titleForEditing = v5;

  -[SFAccountDetailViewController _updateHeaderViewCell](self, "_updateHeaderViewCell");
}

- (void)returnKeyActivatedInAccountDetailHeaderViewCell:(id)a3
{
  id v3;

  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)groupCreationFlowNavigationController:(id)a3 finishedWithGroup:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  self->_shouldIgnoreAccountStoreUpdates = 0;
  -[SFAccountDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToCreateGroupWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:imageNamed:preferredStyle:", v7, 0, CFSTR("alert-passwords"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__SFAccountDetailViewController_groupCreationFlowNavigationController_finishedWithGroup_error___block_invoke;
    v13[3] = &unk_1E4AC0010;
    v14 = v8;
    v11 = v8;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v12);

    -[SFAccountDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }
  else
  {
    -[SFAccountDetailViewController _reloadDiffableDataSourceOnInternalQueueAnimated:](self, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0);
  }

}

uint64_t __95__SFAccountDetailViewController_groupCreationFlowNavigationController_finishedWithGroup_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)updatedIconIsAvailableForDomain:(id)a3
{
  -[SFAccountDetailViewController _updateIconForCell:](self, "_updateIconForCell:", self->_headerCell);
}

- (void)totpMigrationControllerFinishedImport:(id)a3
{
  UINavigationController *v4;
  PMTOTPMigrationController *v5;
  PMTOTPMigrationController *totpMigrationController;
  UINavigationController *totpMigrationNavigationController;
  PMTOTPMigrationController *v8;

  v8 = (PMTOTPMigrationController *)a3;
  -[SFAccountDetailViewController presentedViewController](self, "presentedViewController");
  v4 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    v5 = v8;
    if (totpMigrationController != v8)
      goto LABEL_4;
    -[SFAccountDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    totpMigrationNavigationController = self->_totpMigrationNavigationController;
    self->_totpMigrationNavigationController = 0;

    v4 = (UINavigationController *)self->_totpMigrationController;
    self->_totpMigrationController = 0;
  }

  v5 = v8;
LABEL_4:

}

- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4
{
  id v6;
  UINavigationController *v7;
  SFAccountDetailViewController *v8;
  PMTOTPMigrationController *totpMigrationController;
  PMTOTPMigrationController *v10;

  v10 = (PMTOTPMigrationController *)a3;
  v6 = a4;
  -[SFAccountDetailViewController presentedViewController](self, "presentedViewController");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v8 = (SFAccountDetailViewController *)v7;
  if (v7 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    if (totpMigrationController != v10)
      goto LABEL_4;
    v8 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v6, 0, 0);
    -[UINavigationController pushViewController:animated:](self->_totpMigrationNavigationController, "pushViewController:animated:", v8, 1);
  }

LABEL_4:
}

- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4
{
  PMTOTPMigrationController *v6;
  id v7;
  UINavigationController *v8;
  PMTOTPMigrationController *totpMigrationController;
  SFAccountPickerConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SFAccountPickerViewController *v16;
  PMTOTPMigrationController *v17;
  SFAccountPickerViewController *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  PMTOTPMigrationController *v24;
  id v25;

  v6 = (PMTOTPMigrationController *)a3;
  v7 = a4;
  -[SFAccountDetailViewController presentedViewController](self, "presentedViewController");
  v8 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v8 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    if (totpMigrationController == v6)
    {
      v10 = objc_alloc_init(SFAccountPickerConfiguration);
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration setPrompt:](v10, "setPrompt:", v11);

      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration setTitle:](v10, "setTitle:", v12);

      -[SFAccountPickerConfiguration setMinimumNumberOfCredentialsToShowLikelyMatchesSection:](v10, "setMinimumNumberOfCredentialsToShowLikelyMatchesSection:", 1);
      -[SFAccountPickerConfiguration setShouldEnableAddingNewPasswordsIfPossible:](v10, "setShouldEnableAddingNewPasswordsIfPossible:", 1);
      -[SFAccountPickerConfiguration setShouldHideCreatePasswordsInSettingsHint:](v10, "setShouldHideCreatePasswordsInSettingsHint:", 1);
      objc_msgSend(v7, "heuristicallyDeterminedServiceNameHints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        objc_msgSend(v7, "heuristicallyDeterminedServiceNameHints");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountPickerConfiguration setServiceNameHintStrings:](v10, "setServiceNameHintStrings:", v15);

      }
      v16 = [SFAccountPickerViewController alloc];
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __83__SFAccountDetailViewController_totpMigrationController_presentPickerForGenerator___block_invoke;
      v23 = &unk_1E4AC00B0;
      v17 = v6;
      v24 = v17;
      v25 = v7;
      v18 = -[SFAccountPickerViewController initWithConfiguration:completionHandler:](v16, "initWithConfiguration:completionHandler:", v10, &v20);
      -[PMTOTPMigrationController viewController](v17, "viewController", v20, v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentViewController:animated:completion:", v18, 1, 0);

    }
  }
  else
  {

  }
}

void __83__SFAccountDetailViewController_totpMigrationController_presentPickerForGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addGenerator:toSavedAccount:", *(_QWORD *)(a1 + 40), v3);
    v3 = v4;
  }

}

- (SFAccountDetailViewControllerDelegate)delegate
{
  return (SFAccountDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsChangePasswordControllerOnAppearance
{
  return self->_showsChangePasswordControllerOnAppearance;
}

- (void)setShowsChangePasswordControllerOnAppearance:(BOOL)a3
{
  self->_showsChangePasswordControllerOnAppearance = a3;
}

- (BOOL)isForFillingIndividualAccountFields
{
  return self->_isForFillingIndividualAccountFields;
}

- (void)setIsForFillingIndividualAccountFields:(BOOL)a3
{
  self->_isForFillingIndividualAccountFields = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_totpMigrationController, 0);
  objc_storeStrong((id *)&self->_totpMigrationNavigationController, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_passkeyFooterView, 0);
  objc_storeStrong((id *)&self->_addPasswordNavigationController, 0);
  objc_storeStrong((id *)&self->_visitWebsiteCell, 0);
  objc_storeStrong((id *)&self->_accountAuthenticationModificationController, 0);
  objc_storeStrong((id *)&self->_accountModificationExtension, 0);
  objc_storeStrong((id *)&self->_rulesForStrongPasswordChange, 0);
  objc_storeStrong((id *)&self->_changeToStrongPasswordCell, 0);
  objc_storeStrong((id *)&self->_upgradeToSignInWithAppleCell, 0);
  objc_storeStrong((id *)&self->_TOTPGenerators, 0);
  objc_destroyWeak((id *)&self->_secretEntryAlertController);
  objc_storeStrong((id *)&self->_TOTPTimer, 0);
  objc_destroyWeak((id *)&self->_changePasswordSafariViewController);
  objc_storeStrong((id *)&self->_passwordWarning, 0);
  objc_storeStrong((id *)&self->_securityRecommendationInfoCell, 0);
  objc_storeStrong((id *)&self->_tableViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_notesForEditing, 0);
  objc_storeStrong((id *)&self->_notesCell, 0);
  objc_storeStrong((id *)&self->_TOTPCodeCell, 0);
  objc_storeStrong((id *)&self->_totpFooterView, 0);
  objc_storeStrong((id *)&self->_setupTOTPCodeCell, 0);
  objc_storeStrong((id *)&self->_changePasswordOnWebsiteCell, 0);
  objc_storeStrong((id *)&self->_passwordForEditing, 0);
  objc_storeStrong((id *)&self->_userForEditing, 0);
  objc_storeStrong((id *)&self->_titleForEditing, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_userCell, 0);
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
  objc_storeStrong((id *)&self->_savedAccountChangeRequest, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
}

void __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to authenticate for one time account sharing: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "_plugIn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedContainingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v6, v7, "Failed to get Sign in with Apple authorization credential state for %@", v8, v9, v10, v11, v12);

}

- (void)accountAuthenticationModificationController:(void *)a1 didFailRequest:withError:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Account Modification Extension request canceled with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_softDeletePassword
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to move password to recently deleted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)QRCodeScannerViewController:(void *)a1 didScanQRCodeWithURLValue:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1A3B2D000, v1, OS_LOG_TYPE_DEBUG, "Ignoring invalid QR-encoded URL. %@", v3, 0xCu);

  OUTLINED_FUNCTION_6();
}

@end
