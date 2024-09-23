@implementation DMCEnrollmentESSOApplicationDisclosureViewController

- (DMCEnrollmentESSOApplicationDisclosureViewController)initWithDelegate:(id)a3 lockupRequest:(id)a4 lockupViewGroup:(id)a5 requiredEntitlements:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  DMCEnrollmentESSOApplicationDisclosureViewController *v15;
  uint64_t v16;
  NSArray *requiredEntitlements;
  DMCEnrollmentTableViewTextCell *v18;
  void *v19;
  DMCEnrollmentTableViewTextCell *v20;
  DMCEnrollmentTableViewAppLockupCell *v21;
  void *v22;
  DMCEnrollmentInstallAppButtonView *v23;
  DMCEnrollmentESSOApplicationDisclosureViewController *v24;
  DMCEnrollmentInstallAppButtonView *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  DMCEnrollmentESSOApplicationDisclosureViewController *v31;
  objc_super v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  DMCLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)DMCEnrollmentESSOApplicationDisclosureViewController;
  v15 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:title:subTitle:](&v32, sel_initWithIconNames_title_subTitle_, &unk_24D5486F0, v14, 0);

  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v10);
    v16 = objc_msgSend(v13, "copy");
    requiredEntitlements = v15->_requiredEntitlements;
    v15->_requiredEntitlements = (NSArray *)v16;

    v18 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v18, "initWithText:bold:", v19, 0);
    v33[0] = v20;
    v21 = -[DMCEnrollmentTableViewAppLockupCell initWithLockupRequest:lockupViewGroup:presentingViewController:]([DMCEnrollmentTableViewAppLockupCell alloc], "initWithLockupRequest:lockupViewGroup:presentingViewController:", v11, v12, v15);
    v33[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController addCellData:animated:](v15, "addCellData:animated:", v22, 0);

    v23 = [DMCEnrollmentInstallAppButtonView alloc];
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke;
    v30 = &unk_24D52E500;
    v24 = v15;
    v31 = v24;
    v25 = -[DMCEnrollmentInstallAppButtonView initWithLockupRequest:lockupViewGroup:completionHandler:](v23, "initWithLockupRequest:lockupViewGroup:completionHandler:", v11, v12, &v27);
    -[DMCEnrollmentTemplateTableViewController addBottomView:](v24, "addBottomView:", v25, v27, v28, v29, v30);

  }
  return v15;
}

void __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ESSOApplicationDisclosurViewController:didReceiveUserAction:error:", *(_QWORD *)(a1 + 32), 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentESSOApplicationDisclosureViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[DMCEnrollmentESSOApplicationDisclosureViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[DMCEnrollmentESSOApplicationDisclosureViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[DMCEnrollmentESSOApplicationDisclosureViewController _setupNavigationBar](self, "_setupNavigationBar");
  }
  -[DMCEnrollmentESSOApplicationDisclosureViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (void)_setupNavigationBar
{
  -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", 1, 0, 1);
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4;

  -[DMCEnrollmentESSOApplicationDisclosureViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ESSOApplicationDisclosurViewController:didReceiveUserAction:error:", self, 0, 0);

}

- (DMCEnrollmentESSOApplicationDisclosureViewControllerDelegate)delegate
{
  return (DMCEnrollmentESSOApplicationDisclosureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (void)setRequiredEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_requiredEntitlements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
