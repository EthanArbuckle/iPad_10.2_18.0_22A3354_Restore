@implementation DMCEnrollmentManagementDetailsOverviewViewController

- (DMCEnrollmentManagementDetailsOverviewViewController)initWithDelegate:(id)a3 managedAppleID:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DMCEnrollmentManagementDetailsOverviewViewController *v12;
  void *v13;
  DMCEnrollmentTableViewTextCell *v14;
  void *v15;
  DMCEnrollmentTableViewTextCell *v16;
  DMCEnrollmentTableViewTextCell *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)DMCEnrollmentManagementDetailsOverviewViewController;
  v12 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:title:subTitle:](&v23, sel_initWithIconNames_title_subTitle_, &unk_24D548720, v11, 0);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_profile, a5);
    objc_storeWeak((id *)&v12->_delegate, v8);
    v13 = (void *)objc_opt_new();
    v14 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedFormat();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v14, "initWithText:bold:", v15, 0, v9);
    objc_msgSend(v13, "addObject:", v16);

    v17 = -[DMCEnrollmentTableViewTextCell initWithText:bold:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:", &stru_24D52F990, 0);
    objc_initWeak(&location, v12);
    DMCLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke;
    v20[3] = &unk_24D52E7F8;
    objc_copyWeak(&v21, &location);
    -[DMCEnrollmentTableViewTextCell configureLinkText:forceLineBreak:linkAction:](v17, "configureLinkText:forceLineBreak:linkAction:", v18, 0, v20);

    objc_msgSend(v13, "addObject:", v17);
    -[DMCEnrollmentTemplateTableViewController addCellData:animated:](v12, "addCellData:animated:", v13, 0);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke_2;
    block[3] = &unk_24D52E500;
    v4 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke_2(uint64_t a1)
{
  DMCProfileViewModel *v2;
  void *v3;
  DMCProfileDetailsViewController *v4;
  void *v5;
  void *v6;
  DMCProfileViewModel *v7;

  v2 = [DMCProfileViewModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMCProfileViewModel initWithProfile:managedPayloads:](v2, "initWithProfile:managedPayloads:", v3, 0);

  v4 = -[DMCProfileDetailsViewController initWithProfileViewModel:mode:]([DMCProfileDetailsViewController alloc], "initWithProfileViewModel:mode:", v7, 1);
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileDetailsViewController setTableTitle:](v4, "setTableTitle:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v4);
  if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
    objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

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
  v12.super_class = (Class)DMCEnrollmentManagementDetailsOverviewViewController;
  -[DMCEnrollmentManagementDetailsOverviewViewController loadView](&v12, sel_loadView);
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __64__DMCEnrollmentManagementDetailsOverviewViewController_loadView__block_invoke;
  v9 = &unk_24D52E7F8;
  objc_copyWeak(&v10, &location);
  v5 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v3, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v4, CFSTR(" "), &v6, &__block_literal_global_3);

  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__DMCEnrollmentManagementDetailsOverviewViewController_loadView__block_invoke(uint64_t a1)
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
    objc_msgSend(v2, "managementDetailsOverviewViewController:didReceiveUserAction:", v3, 1);

    WeakRetained = v3;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentManagementDetailsOverviewViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[DMCEnrollmentManagementDetailsOverviewViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[DMCEnrollmentManagementDetailsOverviewViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[DMCEnrollmentManagementDetailsOverviewViewController _setupNavigationBar](self, "_setupNavigationBar");
  }
}

- (void)_setupNavigationBar
{
  -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", 1, 0, 1);
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4;

  -[DMCEnrollmentManagementDetailsOverviewViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managementDetailsOverviewViewController:didReceiveUserAction:", self, 0);

}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (DMCEnrollmentManagementDetailsOverviewViewControllerDelegate)delegate
{
  return (DMCEnrollmentManagementDetailsOverviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
}

@end
