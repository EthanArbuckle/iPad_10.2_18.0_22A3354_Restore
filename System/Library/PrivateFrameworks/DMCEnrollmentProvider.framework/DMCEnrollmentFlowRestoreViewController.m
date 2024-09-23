@implementation DMCEnrollmentFlowRestoreViewController

- (DMCEnrollmentFlowRestoreViewController)initWithDelegate:(id)a3 managedAppleID:(id)a4 restoreSnapshot:(id)a5 conflictingApps:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  DMCEnrollmentFlowRestoreViewController *v13;
  DMCEnrollmentTableViewTextCell *v14;
  void *v15;
  DMCEnrollmentTableViewTextCell *v16;
  DMCEnrollmentTableViewTextCell *v17;
  void *v18;
  DMCEnrollmentTableViewTextCell *v19;
  DMCEnrollmentTableViewTextCell *v20;
  void *v21;
  DMCEnrollmentTableViewTextCell *v22;
  void *v23;
  void *v24;
  DMCEnrollmentTableViewTextCell *v25;
  void *v26;
  DMCEnrollmentNameListCell *v27;
  void *v28;
  DMCEnrollmentNameListCell *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  id v36;
  id obj;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  uint64_t v44;
  DMCEnrollmentNameListCell *v45;
  DMCEnrollmentTableViewTextCell *v46;
  _QWORD v47[3];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v36 = a4;
  v39 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("clock.arrow.circlepath"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43.receiver = self;
  v43.super_class = (Class)DMCEnrollmentFlowRestoreViewController;
  v13 = -[DMCEnrollmentTemplateTableViewController initWithIconImages:title:subTitle:](&v43, sel_initWithIconImages_title_subTitle_, v11, v12, 0);

  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, obj);
    objc_storeStrong((id *)&v13->_restoreSnapshot, a5);
    objc_msgSend(v39, "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v35, 2, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedFormat();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v14, "initWithText:bold:", v15, 0, v36, v34);
    v47[0] = v16;
    v17 = [DMCEnrollmentTableViewTextCell alloc];
    objc_msgSend(v39, "deviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v17, "initWithText:bold:", v18, 1);
    v47[1] = v19;
    v20 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v20, "initWithText:bold:", v21, 0);
    v47[2] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v13, "addSectionWithCellData:animated:", v23, 0);
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "count");
      DMCLocalizedStringByDevice();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[DMCEnrollmentTableViewTextCell initWithText:bold:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:", v24, 0);
      v46 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController addCellData:animated:](v13, "addCellData:animated:", v26, 0);

      v27 = [DMCEnrollmentNameListCell alloc];
      -[DMCEnrollmentFlowRestoreViewController _appNamesFromBunldeIDs:](v13, "_appNamesFromBunldeIDs:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[DMCEnrollmentNameListCell initWithNames:numberOfColumns:](v27, "initWithNames:numberOfColumns:", v28, 2);
      v45 = v29;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v13, "addSectionWithCellData:animated:", v30, 0);

    }
    objc_initWeak(&location, v13);
    v44 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __106__DMCEnrollmentFlowRestoreViewController_initWithDelegate_managedAppleID_restoreSnapshot_conflictingApps___block_invoke;
    v40[3] = &unk_24D52E2D0;
    objc_copyWeak(&v41, &location);
    v32 = (id)-[DMCEnrollmentFlowRestoreViewController registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v31, v40);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __106__DMCEnrollmentFlowRestoreViewController_initWithDelegate_managedAppleID_restoreSnapshot_conflictingApps___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = WeakRetained;
  BSRunLoopPerformAfterCACommit();

}

void __106__DMCEnrollmentFlowRestoreViewController_initWithDelegate_managedAppleID_restoreSnapshot_conflictingApps___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)loadView
{
  DMCEnrollmentConfirmationView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  DMCEnrollmentConfirmationView *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMCEnrollmentFlowRestoreViewController;
  -[DMCEnrollmentFlowRestoreViewController loadView](&v13, sel_loadView);
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke;
  v10[3] = &unk_24D52E7F8;
  objc_copyWeak(&v11, &location);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke_25;
  v8[3] = &unk_24D52E7F8;
  objc_copyWeak(&v9, &location);
  v7 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v3, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v4, v5, v10, v8);

  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_216358000, v2, OS_LOG_TYPE_INFO, "DMCEnrollmentFlowRestoreViewController will restore", v4, 2u);
    }
    objc_msgSend(WeakRetained, "setInProgress:", 1);
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restoreViewController:didReceiveUserAction:", WeakRetained, 1);

  }
}

void __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_216358000, v2, OS_LOG_TYPE_INFO, "DMCEnrollmentFlowRestoreViewController skip restore", v4, 2u);
    }
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restoreViewController:didReceiveUserAction:", WeakRetained, 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMCEnrollmentFlowRestoreViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[DMCEnrollmentFlowRestoreViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);

  -[DMCEnrollmentFlowRestoreViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (void)updateContinueButtonStatus
{
  _BOOL8 v3;
  id v4;

  v3 = -[DMCEnrollmentTemplateTableViewController inProgress](self, "inProgress");
  -[DMCEnrollmentFlowRestoreViewController confirmationView](self, "confirmationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInProgress:", v3);

}

- (id)_appNamesFromBunldeIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138543618;
    v22 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x24BDC1540]);
        v23 = 0;
        v13 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 0, &v23);
        v14 = v23;
        if (v14)
        {
          v15 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v29 = v11;
            v30 = 2114;
            v31 = v14;
            _os_log_impl(&dword_216358000, v15, OS_LOG_TYPE_ERROR, "Failed to load record for app: %{public}@ with error: %{public}@", buf, 0x16u);
          }
        }
        objc_msgSend(v13, "localizedShortName", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(v13, "localizedName");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;

        if (v19)
          v20 = v19;
        else
          v20 = v11;
        objc_msgSend(v4, "addObject:", v20);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  return v4;
}

- (DMCEnrollmentFlowRestoreViewControllerDelegate)delegate
{
  return (DMCEnrollmentFlowRestoreViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMCRFSnapshot)restoreSnapshot
{
  return self->_restoreSnapshot;
}

- (void)setRestoreSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_restoreSnapshot, a3);
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_restoreSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
