@implementation DMCEnrollmentDebuggingESSOApplicationInstallationViewController

- (DMCEnrollmentDebuggingESSOApplicationInstallationViewController)initWithDelegate:(id)a3 appBundleIDs:(id)a4 requiredEntitlements:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DMCEnrollmentDebuggingESSOApplicationInstallationViewController *v12;
  uint64_t v13;
  NSArray *bundleIDs;
  uint64_t v15;
  NSArray *requiredEntitlements;
  uint64_t v17;
  LSApplicationWorkspace *appWorkspace;
  DMCEnrollmentTableViewTextCell *v19;
  void *v20;
  DMCEnrollmentTableViewTextCell *v21;
  void *v22;
  DMCEnrollmentNameListCell *v23;
  void *v24;
  DMCEnrollmentTableViewTextCell *v25;
  void *v26;
  DMCEnrollmentTableViewTextCell *v27;
  void *v28;
  objc_super v30;
  DMCEnrollmentTableViewTextCell *v31;
  DMCEnrollmentNameListCell *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)DMCEnrollmentDebuggingESSOApplicationInstallationViewController;
  v12 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:title:subTitle:](&v30, sel_initWithIconNames_title_subTitle_, &unk_24D5486D8, v11, 0);

  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v8);
    v13 = objc_msgSend(v9, "copy");
    bundleIDs = v12->_bundleIDs;
    v12->_bundleIDs = (NSArray *)v13;

    v15 = objc_msgSend(v10, "copy");
    requiredEntitlements = v12->_requiredEntitlements;
    v12->_requiredEntitlements = (NSArray *)v15;

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v17 = objc_claimAutoreleasedReturnValue();
    appWorkspace = v12->_appWorkspace;
    v12->_appWorkspace = (LSApplicationWorkspace *)v17;

    -[LSApplicationWorkspace addObserver:](v12->_appWorkspace, "addObserver:", v12);
    v19 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v19, "initWithText:bold:", v20, 0);
    v33[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController addCellData:animated:](v12, "addCellData:animated:", v22, 0);

    v23 = -[DMCEnrollmentNameListCell initWithNames:numberOfColumns:]([DMCEnrollmentNameListCell alloc], "initWithNames:numberOfColumns:", v9, 1);
    v32 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v12, "addSectionWithCellData:animated:", v24, 0);

    v25 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v25, "initWithText:bold:", v26, 0);
    v31 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v12, "addSectionWithCellData:animated:", v28, 0);

  }
  return v12;
}

- (void)loadView
{
  DMCEnrollmentConfirmationView *v3;
  void *v4;
  DMCEnrollmentConfirmationView *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentDebuggingESSOApplicationInstallationViewController;
  -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController loadView](&v12, sel_loadView);
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __75__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_loadView__block_invoke;
  v9 = &unk_24D52E7F8;
  objc_copyWeak(&v10, &location);
  v5 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v3, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v4, CFSTR(" "), &v6, &__block_literal_global_1);

  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v5, v6, v7, v8, v9);
  -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController setConfirmationView:](self, "setConfirmationView:", v5);
  -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController updateContinueButtonStatus](self, "updateContinueButtonStatus");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "debuggingApplicationInstallationViewController:didReceiveUserAction:", v3, 1);

    WeakRetained = v3;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentDebuggingESSOApplicationInstallationViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[DMCEnrollmentDebuggingESSOApplicationInstallationViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController _setupNavigationBar](self, "_setupNavigationBar");
  }
}

- (void)_setupNavigationBar
{
  -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", 1, 0, 1);
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4;

  -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debuggingApplicationInstallationViewController:didReceiveUserAction:", self, 0);

}

- (void)updateContinueButtonStatus
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = -[DMCEnrollmentTemplateTableViewController inProgress](self, "inProgress");
  -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController confirmationView](self, "confirmationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setInProgress:", 1);
  }
  else
  {
    objc_msgSend(v4, "setInProgress:", 0);

    v6 = -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController requiredAppInstalled](self, "requiredAppInstalled");
    -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController confirmationView](self, "confirmationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConfirmationButtonEnabled:", v6);
  }

  -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsDisplay");

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  DMCEnrollmentDebuggingESSOApplicationInstallationViewController *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    v29 = self;
    v30 = v4;
    v28 = *(_QWORD *)v39;
    while (2)
    {
      v8 = 0;
      v31 = v6;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        v32 = v8;
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
        v10 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v9, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v12;
          _os_log_impl(&dword_216358000, v11, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) installed.", buf, 0xCu);

        }
        -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController bundleIDs](self, "bundleIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "containsObject:", v14);

        if (v15)
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController requiredEntitlements](self, "requiredEntitlements");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          if (!v17)
          {

LABEL_25:
            -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController setRequiredAppInstalled:](self, "setRequiredAppInstalled:", 1);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __90__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_applicationsDidInstall___block_invoke;
            block[3] = &unk_24D52E500;
            block[4] = self;
            dispatch_async(MEMORY[0x24BDAC9B8], block);
            goto LABEL_26;
          }
          v18 = v17;
          v19 = *(_QWORD *)v35;
          v20 = 1;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v35 != v19)
                objc_enumerationMutation(v16);
              v22 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v9, "entitlementValueForKey:ofClass:", v22, objc_opt_class());
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "BOOLValue");

              if ((v24 & 1) == 0)
              {
                v25 = *(NSObject **)DMCLogObjects();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v26 = v25;
                  objc_msgSend(v9, "bundleIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v43 = v27;
                  v44 = 2114;
                  v45 = v22;
                  _os_log_impl(&dword_216358000, v26, OS_LOG_TYPE_ERROR, "Application (%{public}@) doesn't have the required entitlement: %{public}@", buf, 0x16u);

                }
                v20 = 0;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          }
          while (v18);

          self = v29;
          v4 = v30;
          v7 = v28;
          v6 = v31;
          if ((v20 & 1) != 0)
            goto LABEL_25;
        }
        v8 = v32 + 1;
      }
      while (v32 + 1 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v6)
        continue;
      break;
    }
  }

LABEL_26:
}

uint64_t __90__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContinueButtonStatus");
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_appWorkspace, a3);
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationView, a3);
}

- (DMCEnrollmentDebuggingESSOApplicationInstallationViewControllerDelegate)delegate
{
  return (DMCEnrollmentDebuggingESSOApplicationInstallationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (NSArray)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (void)setRequiredEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_requiredEntitlements, a3);
}

- (BOOL)requiredAppInstalled
{
  return self->_requiredAppInstalled;
}

- (void)setRequiredAppInstalled:(BOOL)a3
{
  self->_requiredAppInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlements, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
}

@end
