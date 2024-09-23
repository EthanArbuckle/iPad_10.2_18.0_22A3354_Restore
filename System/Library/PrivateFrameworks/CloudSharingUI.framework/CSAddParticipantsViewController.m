@implementation CSAddParticipantsViewController

- (CSAddParticipantsViewController)initWithCKShare:(id)a3 containerSetupInfo:(id)a4 fileURL:(id)a5 collaborationOptionsGroups:(id)a6 headerImageData:(id)a7 headerTitle:(id)a8 loadingText:(id)a9 supplementaryText:(id)a10 primaryButtonText:(id)a11 secondaryButtonText:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  CSAddParticipantsViewController *v27;
  CSAddParticipantsViewController *v28;
  CSAddressingViewModel *v29;
  CSAddressingViewModel *addressingViewModel;
  id obj;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v33 = a4;
  v37 = a4;
  obj = a5;
  v18 = a5;
  v19 = a6;
  v36 = v18;
  v35 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = v20;
  v25 = a11;
  v26 = a12;
  v39.receiver = self;
  v39.super_class = (Class)CSAddParticipantsViewController;
  v27 = -[CSAddParticipantsViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_share, a3);
    objc_storeStrong((id *)&v28->_collaborationOptionsGroups, v19);
    v29 = -[CSAddressingViewModel initWithHeaderImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:]([CSAddressingViewModel alloc], "initWithHeaderImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:", v24, v21, v22, v23, 0, v25, v26);
    addressingViewModel = v28->_addressingViewModel;
    v28->_addressingViewModel = v29;

    objc_storeStrong((id *)&v28->_fileURL, obj);
    objc_storeStrong((id *)&v28->_containerSetupInfo, v33);
    -[CSAddParticipantsViewController setTitle:](v28, "setTitle:", v21);
  }

  return v28;
}

- (void)viewDidLoad
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D60A000, a2, OS_LOG_TYPE_ERROR, "No CloudSharingAddParticipantsViewService extension: %@", (uint8_t *)&v2, 0xCu);
}

void __46__CSAddParticipantsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
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
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v14, "serviceViewControllerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPublicController:", WeakRetained);
    objc_msgSend(WeakRetained, "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained, "share");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShare:", v6);

    }
    objc_msgSend(WeakRetained, "collaborationOptionsGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(WeakRetained, "collaborationOptionsGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCollaborationOptionsGroups:", v8);

    }
    objc_msgSend(WeakRetained, "addressingViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAddressingViewModel:", v9);

    objc_msgSend(WeakRetained, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(WeakRetained, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFileURL:", v11);

    }
    objc_msgSend(WeakRetained, "containerSetupInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(WeakRetained, "containerSetupInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setContainerSetupInfo:", v13);

    }
  }

}

uint64_t __46__CSAddParticipantsViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)embedViewController:(id)a3
{
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
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  objc_msgSend(v18, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[CSAddParticipantsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v18, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[CSAddParticipantsViewController addChildViewController:](self, "addChildViewController:", v18);
  -[CSAddParticipantsViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v18, "didMoveToParentViewController:", self);
}

- (void)dismissViewControllerWithError:(id)a3 shareURL:(id)a4 ckShare:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CSAddParticipantsViewController *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  CSAddParticipantsViewController *v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __83__CSAddParticipantsViewController_dismissViewControllerWithError_shareURL_ckShare___block_invoke;
  v27 = &unk_24C74AA40;
  v28 = v8;
  v29 = self;
  v30 = v9;
  v31 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = (void (**)(_QWORD))_Block_copy(&v24);
  -[CSAddParticipantsViewController presentingViewController](self, "presentingViewController", v24, v25, v26, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CSAddParticipantsViewController navigationController](self, "navigationController");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_6;
    v17 = (void *)v16;
    -[CSAddParticipantsViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (CSAddParticipantsViewController *)objc_claimAutoreleasedReturnValue();

    if (v20 == self)
    {
LABEL_6:
      -[CSAddParticipantsViewController presentingViewController](self, "presentingViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dismissViewControllerAnimated:completion:", 1, v14);

      goto LABEL_7;
    }
    -[CSAddParticipantsViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "popViewControllerAnimated:", 1);

  }
  v14[2](v14);
LABEL_7:

}

void __83__CSAddParticipantsViewController_dismissViewControllerWithError_shareURL_ckShare___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "addParticipantsViewController:failedToSaveShareWithError:", v4, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v3, "addParticipantsViewController:completedSharingWithShareURL:ckShare:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)showContactPickerFromSourceRect:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDBAE78];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithNibName:bundle:", 0, 0);
  v7 = *MEMORY[0x24BDBA288];
  v22[0] = *MEMORY[0x24BDBA348];
  v22[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayedPropertyKeys:", v8);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setAllowsEditing:", 0);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicateForEnablingContact:", v9);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((emailAddresses.@count == 1) AND (phoneNumbers.@count == 0)) OR ((emailAddresses.@count == 0) AND (phoneNumbers.@count == 1))"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicateForSelectionOfContact:", v10);

  -[CSAddParticipantsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceView:", v11);

  objc_msgSend(v5, "CGRectValue");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v6, "popoverPresentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  objc_msgSend(v6, "setModalPresentationStyle:", 6);
  -[CSAddParticipantsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[CSAddParticipantsViewController childViewController](self, "childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userDidSelectContact:contactProperty:", v5, 0);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[CSAddParticipantsViewController childViewController](self, "childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userDidSelectContact:contactProperty:", 0, v5);
}

- (BOOL)commitEditingAndReturnError:(id *)a3
{
  return 0;
}

- (CSAddParticipantsViewControllerDelegate)delegate
{
  return (CSAddParticipantsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (NSArray)collaborationOptionsGroups
{
  return self->_collaborationOptionsGroups;
}

- (void)setCollaborationOptionsGroups:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationOptionsGroups, a3);
}

- (CSAddressingViewModel)addressingViewModel
{
  return self->_addressingViewModel;
}

- (void)setAddressingViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_addressingViewModel, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_containerSetupInfo, a3);
}

- (_UIResilientRemoteViewContainerViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_addressingViewModel, 0);
  objc_storeStrong((id *)&self->_collaborationOptionsGroups, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
