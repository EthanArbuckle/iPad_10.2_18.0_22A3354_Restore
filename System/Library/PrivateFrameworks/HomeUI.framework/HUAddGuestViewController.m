@implementation HUAddGuestViewController

- (HUAddGuestViewController)initWithPinCodeManager:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUPinCodeDetailsViewController *v8;
  void *v9;
  HUAddGuestViewController *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:]([HUPinCodeDetailsViewController alloc], "initWithItem:pinCodeManager:home:", 0, v7, v6);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAddGuestPinCodeTitle"), CFSTR("HUAddGuestPinCodeTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HUAddGuestViewController;
  v10 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v12, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v9, 0, 0, 3, v8);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_pinCodeDetailsController, v8);
    -[HUPinCodeDetailsViewController setDelegate:](v10->_pinCodeDetailsController, "setDelegate:", v10);
  }

  return v10;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUAddGuestViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeAddButtonTitle"), CFSTR("HUPinCodeAddButtonTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_saveButtonPressed_);
  -[HUAddGuestViewController setSaveButtonItem:](self, "setSaveButtonItem:", v5);

  -[HUAddGuestViewController saveButtonItem](self, "saveButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[HUAddGuestViewController saveButtonItem](self, "saveButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (UIBarButtonItem)addButtonItem
{
  void *v2;
  void *v3;

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (void)setAddButtonItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    -[HUAddGuestViewController saveButtonItem](self, "saveButtonItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

}

- (void)saveButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HUAddGuestViewController pinCodeDetailsController](self, "pinCodeDetailsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitNewPinCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HUAddGuestViewController_saveButtonPressed___block_invoke;
  v8[3] = &unk_1E6F52E88;
  objc_copyWeak(&v9, &location);
  v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __46__HUAddGuestViewController_saveButtonPressed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRequiresPresentingViewControllerDismissal:", 1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D30980];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HUAddGuestViewController_saveButtonPressed___block_invoke_2;
    v10[3] = &unk_1E6F4C638;
    v11 = v4;
    v12 = WeakRetained;
    objc_msgSend(v6, "handleError:operationType:options:retryBlock:cancelBlock:", v11, v7, 0, 0, v10);

  }
  else
  {
    objc_msgSend(WeakRetained, "presentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "finishPresentation:animated:", WeakRetained, 1);

  }
}

void __46__HUAddGuestViewController_saveButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D30598]))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v2 != 80)
      return;
    objc_msgSend(*(id *)(a1 + 40), "presentationDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "finishPresentation:animated:", *(_QWORD *)(a1 + 40), 1);
  }

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HUPinCodeDetailsViewController)pinCodeDetailsController
{
  return self->_pinCodeDetailsController;
}

- (void)setPinCodeDetailsController:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeDetailsController, a3);
}

- (UIBarButtonItem)saveButtonItem
{
  return self->_saveButtonItem;
}

- (void)setSaveButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_saveButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveButtonItem, 0);
  objc_storeStrong((id *)&self->_pinCodeDetailsController, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
