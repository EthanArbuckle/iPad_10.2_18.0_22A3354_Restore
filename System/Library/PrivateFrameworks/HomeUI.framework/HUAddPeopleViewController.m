@implementation HUAddPeopleViewController

- (HUAddPeopleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddPeopleViewController.m"), 98, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddPeopleViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUAddPeopleViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddPeopleViewController.m"), 103, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddPeopleViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUAddPeopleViewController)initWithHome:(id)a3 viewContext:(unint64_t)a4
{
  id v7;
  HUAddPeopleViewController *v8;
  HUAddPeopleViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  HFContactController *contactsController;
  NSArray *familyMembersNotInHome;
  HFContactController *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUAddPeopleViewController;
  v8 = -[HUAddPeopleViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_viewContext = a4;
    v10 = objc_alloc(MEMORY[0x1E0D31318]);
    -[HUAddPeopleViewController requiredKeyDescriptors](v9, "requiredKeyDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithKeyDescriptors:", v11);
    contactsController = v9->_contactsController;
    v9->_contactsController = (HFContactController *)v12;

    -[HFContactController setDelegate:](v9->_contactsController, "setDelegate:", v9);
    familyMembersNotInHome = v9->_familyMembersNotInHome;
    v9->_familyMembersNotInHome = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_initWeak(&location, v9);
    v15 = v9->_contactsController;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke;
    v17[3] = &unk_1E6F4DE30;
    objc_copyWeak(&v18, &location);
    -[HFContactController fetchFamilyMembersWithCompletion:](v15, "fetchFamilyMembersWithCompletion:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outgoingInvitations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_2;
  v16[3] = &unk_1E6F543F8;
  v15 = WeakRetained;
  v17 = v15;
  v9 = v6;
  v18 = v9;
  v10 = v8;
  v19 = v10;
  objc_msgSend(v3, "na_filter:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFamilyMembersNotInHome:", v11);
  if (objc_msgSend(v15, "isViewLoaded"))
  {
    objc_msgSend(v15, "familyMembersNotInHome");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
    {
LABEL_5:

      goto LABEL_6;
    }
    v13 = objc_msgSend(v15, "showingAutoCompleteResults");

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v15, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSections:withRowAnimation:", v14, 3);

      goto LABEL_5;
    }
  }
LABEL_6:

}

uint64_t __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  objc_msgSend(v3, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = *(void **)(a1 + 40);
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_3;
    v17[3] = &unk_1E6F4D040;
    v12 = v3;
    v18 = v12;
    if ((objc_msgSend(v10, "na_any:", v17) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v13 = *(void **)(a1 + 48);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_4;
      v15[3] = &unk_1E6F543D0;
      v16 = v12;
      v9 = objc_msgSend(v13, "na_any:", v15) ^ 1;

    }
  }

  return v9;
}

uint64_t __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

uint64_t __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invitee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (HUAddPeopleViewController)initWithHome:(id)a3
{
  return -[HUAddPeopleViewController initWithHome:viewContext:](self, "initWithHome:viewContext:", a3, 0);
}

+ (void)presentAddPersonOrAlertForHH2Upgrade:(id)a3 withHome:(id)a4 viewContext:(unint64_t)a5 delegate:(id)a6 presentationDelegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HUAddPeopleViewController *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = -[HUAddPeopleViewController initWithHome:viewContext:]([HUAddPeopleViewController alloc], "initWithHome:viewContext:", v12, a5);
  -[HUAddPeopleViewController setDelegate:](v15, "setDelegate:", v14);

  -[HUAddPeopleViewController setPresentationDelegate:](v15, "setPresentationDelegate:", v13);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v15);
  objc_msgSend(v16, "setModalPresentationStyle:", 2);
  v17 = v16;
  v18 = v17;
  if (objc_msgSend(v12, "hf_canUpdateToHH2"))
  {
    objc_msgSend(v12, "hf_residentDevicesAddedToHome");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    v18 = v17;
    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0CEA2E8];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __117__HUAddPeopleViewController_presentAddPersonOrAlertForHH2Upgrade_withHome_viewContext_delegate_presentationDelegate___block_invoke;
      v22[3] = &unk_1E6F54420;
      v23 = v12;
      v24 = v11;
      v25 = v17;
      objc_msgSend(v21, "hu_alertControllerForAddingPersonWithCompletionHandler:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v11, "presentViewController:animated:completion:", v18, 1, 0);

}

void __117__HUAddPeopleViewController_presentAddPersonOrAlertForHH2Upgrade_withHome_viewContext_delegate_presentationDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (objc_msgSend(a2, "BOOLValue"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.HOME-PRIVATE://homepodSoftwareUpdate?homeId=%@"), v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "openURL:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 48), 1, 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_statusQueryDebounceTimer, "invalidate");
  -[IDSBatchIDQueryController invalidate](self->_statusQueryController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HUAddPeopleViewController;
  -[HUAddPeopleViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
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
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  objc_class *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[4];

  v51[3] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HUAddPeopleViewController;
  -[HUAddPeopleViewController viewDidLoad](&v50, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPeopleAddPeople"), CFSTR("HUPeopleAddPeople"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController setTitle:](self, "setTitle:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0CC68A0]);
  -[HUAddPeopleViewController setComposeView:](self, "setComposeView:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeView](self, "composeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTypingTextColor:", v5);

  _HULocalizedStringWithDefaultValue(CFSTR("HUPeopleRecipientToLabel"), CFSTR("HUPeopleRecipientToLabel"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeView](self, "composeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeView](self, "composeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorHidden:", 1);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUAddPeopleViewController composeView](self, "composeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsAddButtonWhenExpanded:", 0);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[HUAddPeopleViewController setSeparatorView:](self, "setSeparatorView:", v14);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController separatorView](self, "separatorView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v18 = (void *)objc_msgSend(v17, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUAddPeopleViewController setTableView:](self, "setTableView:", v18);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEstimatedRowHeight:", 55.0);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSectionHeaderTopPadding:", 0.0);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDataSource:", self);

  -[HUAddPeopleViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeView](self, "composeView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v24;
  -[HUAddPeopleViewController separatorView](self, "separatorView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v25;
  -[HUAddPeopleViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "naui_addAutoLayoutSubviews:", v27);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:", v28);

  -[HUAddPeopleViewController navigationController](self, "navigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "viewControllers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v32, "isEqual:", self);

  if ((_DWORD)v26)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
    -[HUAddPeopleViewController navigationItem](self, "navigationItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLeftBarButtonItem:", v33);

  }
  else
  {
    -[HUAddPeopleViewController navigationItem](self, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLeftBarButtonItem:", 0);
  }

  v35 = objc_alloc(MEMORY[0x1E0CEA380]);
  -[HUAddPeopleViewController rightBarButtonTitle](self, "rightBarButtonTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithTitle:style:target:action:", v36, 2, self, sel_sendButtonPressed_);
  -[HUAddPeopleViewController navigationItem](self, "navigationItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRightBarButtonItem:", v37);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_class();
  +[HUAddPeopleTableHeaderFooterView identifier](HUAddPeopleTableHeaderFooterView, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerClass:forHeaderFooterViewReuseIdentifier:", v40, v41);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_opt_class();
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "registerClass:forCellReuseIdentifier:", v43, v45);

  -[HUAddPeopleViewController tableView](self, "tableView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CC68F8], "identifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "registerClass:forCellReuseIdentifier:", v47, v48);

  -[HUAddPeopleViewController updateStateDependentUI](self, "updateStateDependentUI");
  -[HUAddPeopleViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setNeedsUpdateConstraints");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[HUAddPeopleViewController viewDidAppear:]";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s)", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)HUAddPeopleViewController;
  -[HUAddPeopleViewController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
  -[HUAddPeopleViewController composeView](self, "composeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

  -[HUAddPeopleViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController setEffectiveTintColor:](self, "setEffectiveTintColor:", v8);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[HUAddPeopleViewController viewWillDisappear:]";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s)", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)HUAddPeopleViewController;
  -[HUAddPeopleViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  -[HUAddPeopleViewController composeView](self, "composeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resignFirstResponder");

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUAddPeopleViewController composeView](self, "composeView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[HUAddPeopleViewController statusQueryDebounceTimer](self, "statusQueryDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[HUAddPeopleViewController scheduleDelayedLookupVisibleRecipients](self, "scheduleDelayedLookupVisibleRecipients", a3);
}

- (void)updateViewConstraints
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_super v67;

  -[HUAddPeopleViewController constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController composeView](self, "composeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    -[HUAddPeopleViewController separatorView](self, "separatorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    -[HUAddPeopleViewController separatorView](self, "separatorView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    -[HUAddPeopleViewController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[HUAddPeopleViewController tableView](self, "tableView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "safeAreaLayoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v40);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController separatorView](self, "separatorView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v45);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC68A0], "preferredHeight");
    objc_msgSend(v47, "constraintEqualToConstant:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController setComposeViewBottomConstraint:](self, "setComposeViewBottomConstraint:", v48);

    -[HUAddPeopleViewController composeViewBottomConstraint](self, "composeViewBottomConstraint");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v49);

    -[HUAddPeopleViewController separatorView](self, "separatorView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController tableView](self, "tableView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v54);

    -[HUAddPeopleViewController separatorView](self, "separatorView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "scale");
    objc_msgSend(v56, "constraintEqualToConstant:", 1.0 / v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v59);

    -[HUAddPeopleViewController tableView](self, "tableView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v64);

    -[HUAddPeopleViewController setConstraints:](self, "setConstraints:", v4);
    v65 = (void *)MEMORY[0x1E0CB3718];
    -[HUAddPeopleViewController constraints](self, "constraints");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v66);

  }
  v67.receiver = self;
  v67.super_class = (Class)HUAddPeopleViewController;
  -[HUAddPeopleViewController updateViewConstraints](&v67, sel_updateViewConstraints);
}

- (void)cancelButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[HUAddPeopleViewController cancelButtonPressed:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'cancel' button %@", (uint8_t *)&v10, 0x16u);
  }

  -[HUAddPeopleViewController presentationDelegate](self, "presentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "finishPresentation:animated:", self, 1);

  -[HUAddPeopleViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUAddPeopleViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addPeopleViewControllerDidCancel:", self);

  }
}

- (void)sendButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[HUAddPeopleViewController sendButtonPressed:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'send' button %@", (uint8_t *)&v7, 0x16u);
  }

  if (-[HUAddPeopleViewController state](self, "state"))
    NSLog(CFSTR("Send button not disabled when invitation send in progress"));
  -[HUAddPeopleViewController setUnatomizedAddress:](self, "setUnatomizedAddress:", 0);
  -[HUAddPeopleViewController composeView](self, "composeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishEnteringRecipient");

  -[HUAddPeopleViewController sendInvites](self, "sendInvites");
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("invited");
      if (a3 == 1)
        v6 = CFSTR("send requested");
      if (!a3)
        v6 = CFSTR("composing");
      v7 = 136315394;
      v8 = "-[HUAddPeopleViewController setState:]";
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) State is now \"%@\", (uint8_t *)&v7, 0x16u);
    }

    -[HUAddPeopleViewController updateStateDependentUI](self, "updateStateDependentUI");
  }
}

- (MFContactsSearchManager)searchManager
{
  MFContactsSearchManager *v3;
  MFContactsSearchManager *v4;
  MFContactsSearchManager *searchManager;

  if (self->_searchManager || -[HUAddPeopleViewController addressBookAccessDenied](self, "addressBookAccessDenied"))
    goto LABEL_8;
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) <= 1)
    -[HUAddPeopleViewController setAddressBookAccessDenied:](self, "setAddressBookAccessDenied:", 1);
  if (!-[HUAddPeopleViewController addressBookAccessDenied](self, "addressBookAccessDenied"))
  {
    v4 = (MFContactsSearchManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC68A8]), "initWithAutocompleteSearchType:", 0);
    searchManager = self->_searchManager;
    self->_searchManager = v4;

LABEL_8:
    v3 = self->_searchManager;
    return v3;
  }
  v3 = 0;
  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4;
  void *v5;

  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults", a3))
    return 1;
  -[HUAddPeopleViewController familyMembersNotInHome](self, "familyMembersNotInHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "count") != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults", a3, a4))
    -[HUAddPeopleViewController autoCompleteResults](self, "autoCompleteResults");
  else
    -[HUAddPeopleViewController familyMembersNotInHome](self, "familyMembersNotInHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a4;
  v7 = a3;
  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults"))
  {
    objc_msgSend(MEMORY[0x1E0CC68F8], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAddPeopleViewController autoCompleteResults](self, "autoCompleteResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "row");

    objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRecipient:", v12);

    objc_msgSend(v9, "setShouldDimIrrelevantInformation:", 0);
    objc_msgSend(v9, "recipient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController tintColorForRecipient:](self, "tintColorForRecipient:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:animated:", v14, 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v15);
  }
  else
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAddPeopleViewController familyMembersNotInHome](self, "familyMembersNotInHome");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v6, "row");

    objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAddPeopleViewController contactsController](self, "contactsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dsid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contactForFamilyMemberWithDsid:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v20, "firstName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hf_formattedPersonNameForFirstName:lastName:", v25, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "appleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v27, "hf_isEmail");

    if ((_DWORD)v26)
    {
      objc_msgSend(v20, "appleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v9, "setTitleText:", v15);
    objc_msgSend(v9, "setDescriptionText:", v28);
    objc_msgSend(v9, "setContact:", v23);
    objc_msgSend(v23, "imageData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v23, "imageData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "imageWithData:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPhoto:", v32);

    }
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  if (!-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults", a3, a4))
    return *MEMORY[0x1E0CEBC10];
  objc_msgSend(MEMORY[0x1E0CC68F8], "height");
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults", a3, a4))
    return 0.0;
  +[HUAddPeopleTableHeaderFooterView preferredHeight](HUAddPeopleTableHeaderFooterView, "preferredHeight");
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  if (!-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults"))
  {
    -[HUAddPeopleViewController familyMembersNotInHome](self, "familyMembersNotInHome");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v6, "row");

    objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAddPeopleViewController contactsController](self, "contactsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dsid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contactForFamilyMemberWithDsid:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "emailAddresses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      objc_msgSend(v23, "emailAddresses");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
    }
    else
    {
      objc_msgSend(v23, "phoneNumbers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 1;
    }

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6898]), "initWithContact:address:kind:", v23, v28, v29);
    goto LABEL_8;
  }
  -[HUAddPeopleViewController autoCompleteResults](self, "autoCompleteResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAddPeopleViewController contactsController](self, "contactsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController IDSDestinationForRecipient:](self, "IDSDestinationForRecipient:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "statusForDestination:", v11);

  if (v12 != 4)
  {
LABEL_8:
    -[HUAddPeopleViewController composeView](self, "composeView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addRecipient:", v9);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clearText");
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D30990];
  v32 = *MEMORY[0x1E0D305A8];
  objc_msgSend(v9, "address");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleError:operationType:options:retryBlock:cancelBlock:", v13, v15, v17, 0, 0);

LABEL_9:
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0CEB5D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HUAddPeopleViewController familyMembersNotInHome](self, "familyMembersNotInHome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (a5 || !v10)
    v11 = CFSTR("HUPeopleTableSectionContacts");
  else
    v11 = CFSTR("HUPeopleTableSectionFamily");
  _HULocalizedStringWithDefaultValue(v11, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (-[HUAddPeopleViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4))
  {
    +[HUAddPeopleTableHeaderFooterView identifier](HUAddPeopleTableHeaderFooterView, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
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
  id v15;

  v15 = a4;
  -[HUAddPeopleViewController statusQueryDebounceTimer](self, "statusQueryDebounceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController setAdditionalAutoCompleteResults:](self, "setAdditionalAutoCompleteResults:", v6);

    -[HUAddPeopleViewController lastSearchID](self, "lastSearchID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HUAddPeopleViewController searchManager](self, "searchManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAddPeopleViewController lastSearchID](self, "lastSearchID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancelTaskWithID:", v9);

    }
    -[HUAddPeopleViewController searchManager](self, "searchManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchForText:withAutocompleteFetchContext:consumer:", v15, 0, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController setLastSearchID:](self, "setLastSearchID:", v11);

  }
  else
  {
    -[HUAddPeopleViewController lastSearchID](self, "lastSearchID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HUAddPeopleViewController searchManager](self, "searchManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAddPeopleViewController lastSearchID](self, "lastSearchID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancelTaskWithID:", v14);

    }
    -[HUAddPeopleViewController setShowingAutoCompleteResults:](self, "setShowingAutoCompleteResults:", 0);
    -[HUAddPeopleViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");
  }

  -[HUAddPeopleViewController updateStateDependentUI](self, "updateStateDependentUI");
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HUAddPeopleViewController updateStateDependentUI](self, "updateStateDependentUI");
  -[HUAddPeopleViewController tintColorForRecipient:](self, "tintColorForRecipient:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeView](self, "composeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atomViewForRecipient:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTintColor:", v6);
  -[HUAddPeopleViewController statusQueryDebounceTimer](self, "statusQueryDebounceTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[HUAddPeopleViewController lookupVisibleRecipients](self, "lookupVisibleRecipients");
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  objc_msgSend(a3, "removeRecipient:", a4);
  -[HUAddPeopleViewController updateStateDependentUI](self, "updateStateDependentUI");
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3500];
  v8 = a4;
  objc_msgSend(v7, "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "length"))
    goto LABEL_4;
  -[HUAddPeopleViewController composeRecipientForAddress:](self, "composeRecipientForAddress:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[HUAddPeopleViewController composeView](self, "composeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addRecipient:", v12);

LABEL_4:
    -[HUAddPeopleViewController setUnatomizedAddress:](self, "setUnatomizedAddress:", 0);
    objc_msgSend(v6, "clearText");
    goto LABEL_8;
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v10;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Found unatomized address \"%@\", (uint8_t *)&v15, 0xCu);
  }

  -[HUAddPeopleViewController setUnatomizedAddress:](self, "setUnatomizedAddress:", v10);
LABEL_8:

}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  id v5;

  height = a4.height;
  -[HUAddPeopleViewController composeViewBottomConstraint](self, "composeViewBottomConstraint", a3, a4.width);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", height);

}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C974B0]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPeopleAddPeoplePickerPrompt"), CFSTR("HUPeopleAddPeoplePickerPrompt"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrompt:", v5);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setAllowsCancel:", 1);
  objc_msgSend(v4, "setAllowsEditing:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("emailAddresses.@count > 0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForEnablingContact:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("emailAddresses.@count == 1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForSelectionOfContact:", v7);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("property == 'emailAddresses'"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForSelectionOfProperty:", v8);

  v9 = *MEMORY[0x1E0C967C0];
  v12[0] = *MEMORY[0x1E0C966A8];
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayedPropertyKeys:", v10);

  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[HUAddPeopleViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v3;

  -[HUAddPeopleViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)contactController:(id)a3 didFinishDownloadingFamilyMemberAvatar:(id)a4
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
  id v16;

  v16 = a4;
  if (!-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults"))
  {
    -[HUAddPeopleViewController familyMembersNotInHome](self, "familyMembersNotInHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v16);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[HUAddPeopleViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUAddPeopleViewController contactsController](self, "contactsController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dsid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contactForFamilyMemberWithDsid:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v12, "imageData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageWithData:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPhoto:", v15);

    }
  }

}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;

  -[HUAddPeopleViewController composeView](self, "composeView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", v4);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 1;
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6898]), "initWithContact:address:kind:", v5, v10, v11);
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v13;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Adding new recipient \"%@\" from contact %@", (uint8_t *)&v17, 0x16u);
  }

  -[HUAddPeopleViewController composeView](self, "composeView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addRecipient:", v13);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", v16);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v8)
  {
    objc_msgSend(v6, "emailAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
LABEL_5:

    goto LABEL_7;
  }
  objc_msgSend(v5, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v14)
  {
    objc_msgSend(v6, "phoneNumbers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 1;
    goto LABEL_5;
  }
  v11 = 0;
  v12 = 5;
LABEL_7:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6898]), "initWithContact:address:kind:", v6, v11, v12);
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v16;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Adding new recipient \"%@\" from contact %@", (uint8_t *)&v20, 0x16u);
  }

  -[HUAddPeopleViewController composeView](self, "composeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addRecipient:", v16);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", v19);

}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  v6 = a4;
  -[HUAddPeopleViewController lastSearchID](self, "lastSearchID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__HUAddPeopleViewController_consumeAutocompleteSearchResults_taskID___block_invoke;
    v12[3] = &unk_1E6F54448;
    v12[4] = self;
    objc_msgSend(v11, "na_filter:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController additionalAutoCompleteResults](self, "additionalAutoCompleteResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v9);

    -[HUAddPeopleViewController setShowingAutoCompleteResults:](self, "setShowingAutoCompleteResults:", 1);
  }

}

uint64_t __69__HUAddPeopleViewController_consumeAutocompleteSearchResults_taskID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isGroup") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", v8) ^ 1;

  }
  return v4;
}

- (void)finishedSearchingForAutocompleteResults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults")
    && (-[HUAddPeopleViewController additionalAutoCompleteResults](self, "additionalAutoCompleteResults"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    -[HUAddPeopleViewController additionalAutoCompleteResults](self, "additionalAutoCompleteResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[HUAddPeopleViewController setAutoCompleteResults:](self, "setAutoCompleteResults:", v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  -[HUAddPeopleViewController setShowingAutoCompleteResults:](self, "setShowingAutoCompleteResults:", v7);
  -[HUAddPeopleViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

  -[HUAddPeopleViewController scheduleDelayedLookupVisibleRecipients](self, "scheduleDelayedLookupVisibleRecipients");
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  uint8_t buf[4];
  HUAddPeopleViewController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ Received IDS update for destinations: %@", buf, 0x20u);

  }
  if (-[HUAddPeopleViewController _shouldCheckIDSCapabilities](self, "_shouldCheckIDSCapabilities"))
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Checking IDS capabilities...", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController _getIDSServiceName](self, "_getIDSServiceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
    v16[3] = &unk_1E6F54498;
    v16[4] = self;
    v18 = a2;
    v17 = v8;
    objc_msgSend(v13, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v14, v15, CFSTR("HomeUI"), MEMORY[0x1E0C80D38], v16);

  }
  else
  {
    -[HUAddPeopleViewController handleStatusQueryResults:](self, "handleStatusQueryResults:", v8);
  }

}

void __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t v20[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v27 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Received IDS fetch result for current remote devices: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  v29 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = (id)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke_122;
  v13[3] = &unk_1E6F54470;
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = &v14;
  v7 = *(_QWORD *)(a1 + 48);
  v13[6] = buf;
  v13[7] = v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v20 = 138412802;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Finished IDS capability checks. Updated destinations to status mapping : %@", v20, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "contactsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "restrictedGuestIDSCapabilityUpdated:", v15[5]);

  objc_msgSend(*(id *)(a1 + 32), "handleStatusQueryResults:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(buf, 8);
}

void __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCheckRestrictedGuestIDSCapability"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v7, v5);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = *MEMORY[0x1E0D34100];
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "capabilities", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "valueForCapability:", v12);

          if (v15 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v19, v5);

            goto LABEL_14;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v10)
          continue;
        break;
      }
    }

    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@: %@ RG IDS capability check not passed. Updating status to INVALID for destination : %@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v8, v5);
LABEL_14:

  }
}

- (void)handleStatusQueryResults:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  HUAddPeopleViewController *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  HUAddPeopleViewController *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v35 = self;
    v36 = 2112;
    v37 = v7;
    v38 = 2112;
    v39 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Will handle status query results for destinations: %@", buf, 0x20u);

  }
  -[HUAddPeopleViewController contactsController](self, "contactsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  objc_msgSend(v8, "entriesUpdated:", v5);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HUAddPeopleViewController composeView](self, "composeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[HUAddPeopleViewController IDSDestinationForRecipient:](self, "IDSDestinationForRecipient:", v15);
        v16 = (HUAddPeopleViewController *)objc_claimAutoreleasedReturnValue();
        -[HUAddPeopleViewController contactsController](self, "contactsController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "statusForDestination:", v16);

        HFLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0D31318], "stringForRecipientStatus:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v16;
          v36 = 2112;
          v37 = v20;
          _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Status of destination \"%@\" is \"%@\", buf, 0x16u);

        }
        -[HUAddPeopleViewController tintColorForRecipient:](self, "tintColorForRecipient:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAddPeopleViewController composeView](self, "composeView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "atomViewForRecipient:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTintColor:", v21);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults"))
  {
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "Updating search results...", buf, 2u);
    }

    -[HUAddPeopleViewController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "indexPathsForVisibleRows");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __54__HUAddPeopleViewController_handleStatusQueryResults___block_invoke;
    v28[3] = &unk_1E6F544C0;
    v28[4] = self;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v28);

  }
  if (-[HUAddPeopleViewController state](self, "state") == 1)
    -[HUAddPeopleViewController sendInvites](self, "sendInvites");

}

void __54__HUAddPeopleViewController_handleStatusQueryResults___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "recipient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v10, "recipient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tintColorForRecipient:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:animated:", v9, 1);

    }
  }

}

- (id)tintColorForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[HUAddPeopleViewController contactsController](self, "contactsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController IDSDestinationForRecipient:](self, "IDSDestinationForRecipient:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "statusForDestination:", v6);
  if (v7 == 3)
    -[HUAddPeopleViewController effectiveTintColor](self, "effectiveTintColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateStateDependentUI
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v3 = -[HUAddPeopleViewController state](self, "state");
  -[HUAddPeopleViewController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {

    if (v5)
    {
      -[HUAddPeopleViewController spinner](self, "spinner");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stopAnimating");

      -[HUAddPeopleViewController setSpinner:](self, "setSpinner:", 0);
      v19 = objc_alloc(MEMORY[0x1E0CEA380]);
      -[HUAddPeopleViewController rightBarButtonTitle](self, "rightBarButtonTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithTitle:style:target:action:", v20, 2, self, sel_sendButtonPressed_);
      -[HUAddPeopleViewController navigationItem](self, "navigationItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRightBarButtonItem:", v21);

    }
    -[HUAddPeopleViewController composeView](self, "composeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByRemovingCharactersFromSet:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length") != 0;
    -[HUAddPeopleViewController navigationItem](self, "navigationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rightBarButtonItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEnabled:", v28);

    -[HUAddPeopleViewController navigationItem](self, "navigationItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leftBarButtonItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEnabled:", 1);

    -[HUAddPeopleViewController tableView](self, "tableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAllowsSelection:", 1);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setEnabled:", 1);

    -[HUAddPeopleViewController composeView](self, "composeView");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setUserInteractionEnabled:", 1);
    goto LABEL_9;
  }

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    -[HUAddPeopleViewController setSpinner:](self, "setSpinner:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEA380]);
    -[HUAddPeopleViewController spinner](self, "spinner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCustomView:", v8);
    -[HUAddPeopleViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

    -[HUAddPeopleViewController spinner](self, "spinner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAnimating");

  }
  -[HUAddPeopleViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsSelection:", 0);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", 0);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInteractionEnabled:", 0);

  -[HUAddPeopleViewController composeView](self, "composeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resignFirstResponder");

  if (-[HUAddPeopleViewController state](self, "state") >= 2)
  {
    -[HUAddPeopleViewController navigationItem](self, "navigationItem");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leftBarButtonItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", 0);

LABEL_9:
  }
}

- (id)rightBarButtonTitle
{
  __CFString *v2;

  if (-[HUAddPeopleViewController viewContext](self, "viewContext"))
    v2 = CFSTR("HUAddRestrictedGuest_NextButton");
  else
    v2 = CFSTR("HUPeopleSendInvite");
  _HULocalizedStringWithDefaultValue(v2, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requiredKeyDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97468], "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)IDSDestinationForRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "uncommentedAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "address");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  IMStripFormattingFromAddress();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "kind") == 1)
  {
    v9 = IDSCopyIDForPhoneNumber();
LABEL_8:
    v10 = (void *)v9;

    v8 = v10;
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "kind"))
  {
    v9 = MEMORY[0x1BCCC0FB0](v8);
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (id)composeRecipientForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[HUAddPeopleViewController requiredKeyDescriptors](self, "requiredKeyDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_isPhoneNumber"))
  {
    objc_msgSend(MEMORY[0x1E0D31318], "contactForPhoneNumber:keyDescriptors:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (!v6)
    {
LABEL_7:
      v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    if (!objc_msgSend(v4, "hf_isEmail"))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0D31318], "contactForEmailAddress:keyDescriptors:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!v6)
      goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6898]), "initWithContact:address:kind:", v6, v4, v7);

LABEL_8:
  return v8;
}

- (void)scheduleDelayedLookupVisibleRecipients
{
  void *v3;
  id v4;

  -[HUAddPeopleViewController statusQueryDebounceTimer](self, "statusQueryDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_lookupVisibleRecipients, 0, 0, 0.5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController setStatusQueryDebounceTimer:](self, "setStatusQueryDebounceTimer:", v4);

}

- (void)lookupVisibleRecipients
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HUAddPeopleViewController composeView](self, "composeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        -[HUAddPeopleViewController IDSDestinationForRecipient:](self, "IDSDestinationForRecipient:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[HUAddPeopleViewController contactsController](self, "contactsController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "statusForDestination:", v10);

          if (!v12)
            objc_msgSend(v3, "na_safeAddObject:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  if (-[HUAddPeopleViewController showingAutoCompleteResults](self, "showingAutoCompleteResults"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HUAddPeopleViewController tableView](self, "tableView", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathsForVisibleRows");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v18);
          -[HUAddPeopleViewController autoCompleteResults](self, "autoCompleteResults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[HUAddPeopleViewController IDSDestinationForRecipient:](self, "IDSDestinationForRecipient:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[HUAddPeopleViewController contactsController](self, "contactsController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "statusForDestination:", v22);

            if (!v24)
              objc_msgSend(v3, "na_safeAddObject:", v22);
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v16);
    }

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleViewController lookupIDSDestinations:](self, "lookupIDSDestinations:", v25);

  }
}

- (void)lookupIDSDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAddPeopleViewController statusQueryController](self, "statusQueryController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUAddPeopleViewController statusQueryController](self, "statusQueryController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
  -[HUAddPeopleViewController contactsController](self, "contactsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markDestinationsPending:", v4);

  -[HUAddPeopleViewController _getIDSServiceName](self, "_getIDSServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController contactsController](self, "contactsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pendingDestinations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Performing IDS lookup with service name %@ for destination(s): %@. allPendingDestinations = %@", (uint8_t *)&v15, 0x20u);
  }

  v12 = objc_alloc(MEMORY[0x1E0D342B0]);
  v13 = (void *)objc_msgSend(v12, "initWithService:delegate:queue:", v8, self, MEMORY[0x1E0C80D38]);
  -[HUAddPeopleViewController setStatusQueryController:](self, "setStatusQueryController:", v13);

  -[HUAddPeopleViewController statusQueryController](self, "statusQueryController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDestinations:", v10);

}

- (id)recipientsWithStatusPassingTest:(id)a3
{
  unsigned int (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HUAddPeopleViewController composeView](self, "composeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[HUAddPeopleViewController contactsController](self, "contactsController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAddPeopleViewController IDSDestinationForRecipient:](self, "IDSDestinationForRecipient:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "statusForDestination:", v13);

        if (v4[2](v4, v14))
          objc_msgSend(v18, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v18, "count"))
    v15 = v18;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (void)sendInvites
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  HUAddPeopleViewController *v51;
  _QWORD v52[5];
  _QWORD v53[4];
  NSObject *v54;
  _QWORD v55[5];
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[HUAddPeopleViewController setState:](self, "setState:", 1);
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUAddPeopleViewController composeView](self, "composeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v61 = v5;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to send invitation(s) to recipients: %@", buf, 0xCu);

  }
  -[HUAddPeopleViewController recipientsWithStatusPassingTest:](self, "recipientsWithStatusPassingTest:", &__block_literal_global_111);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPeopleViewController composeView](self, "composeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (v9)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "Failing send due to invalid recipients", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleError:operationType:options:retryBlock:cancelBlock:", v13, *MEMORY[0x1E0D30998], 0, 0, 0);

    -[HUAddPeopleViewController setState:](self, "setState:", 0);
  }
  else if (objc_msgSend(v6, "count"))
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "Failing send due to invalid recipient(s): %@", buf, 0xCu);
    }

    if (-[HUAddPeopleViewController _shouldCheckRestrictedGuestIDSCapability](self, "_shouldCheckRestrictedGuestIDSCapability"))
    {
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_140;
      v55[3] = &unk_1E6F54448;
      v55[4] = self;
      if (objc_msgSend(v6, "na_any:", v55))
        v11 = 84;
      else
        v11 = 40;
    }
    else
    {
      v11 = 40;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *MEMORY[0x1E0D305A8];
    objc_msgSend(v6, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "address");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleError:operationType:options:retryBlock:cancelBlock:", v13, *MEMORY[0x1E0D30990], v23, 0, 0);

    -[HUAddPeopleViewController setState:](self, "setState:", 0);
  }
  else
  {
    -[HUAddPeopleViewController unatomizedAddress](self, "unatomizedAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      HFLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[HUAddPeopleViewController unatomizedAddress](self, "unatomizedAddress");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v61 = v42;
        _os_log_error_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_ERROR, "Failing send due to invalid address: %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *MEMORY[0x1E0D305A8];
      -[HUAddPeopleViewController unatomizedAddress](self, "unatomizedAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleError:operationType:options:retryBlock:cancelBlock:", v13, *MEMORY[0x1E0D30990], v19, 0, 0);

      -[HUAddPeopleViewController setState:](self, "setState:", 0);
    }
    else
    {
      -[HUAddPeopleViewController recipientsWithStatusPassingTest:](self, "recipientsWithStatusPassingTest:", &__block_literal_global_142);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        HFLogForCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v13;
          _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "Delaying send due to pending lookups: %@", buf, 0xCu);
        }
      }
      else
      {
        -[HUAddPeopleViewController setState:](self, "setState:", 2);
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAddPeopleViewController composeView](self, "composeView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "recipients");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = MEMORY[0x1E0C809B0];
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_143;
        v53[3] = &unk_1E6F54548;
        v24 = v25;
        v54 = v24;
        objc_msgSend(v27, "na_map:", v53);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[HUAddPeopleViewController viewContext](self, "viewContext") == 1)
        {
          -[HUAddPeopleViewController delegate](self, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_opt_respondsToSelector();

          if ((v31 & 1) != 0)
          {
            -[HUAddPeopleViewController delegate](self, "delegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "didSelectPeopleForInvite:inviteeAddresses:", self, v29);

          }
          -[HUAddPeopleViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 0);
          -[HUAddPeopleViewController presentationDelegate](self, "presentationDelegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)objc_msgSend(v33, "finishPresentation:animated:", self, 1);

        }
        else
        {
          v52[0] = v28;
          v52[1] = 3221225472;
          v52[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2;
          v52[3] = &unk_1E6F53308;
          v52[4] = self;
          objc_msgSend(v29, "na_map:", v52);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = v28;
          v49[1] = 3221225472;
          v49[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_155;
          v49[3] = &unk_1E6F51740;
          v37 = v29;
          v50 = v37;
          v51 = self;
          objc_msgSend(v36, "flatMap:", v49);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, self);
          v47[0] = v28;
          v47[1] = 3221225472;
          v47[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2_163;
          v47[3] = &unk_1E6F545B8;
          objc_copyWeak(&v48, (id *)buf);
          v39 = (id)objc_msgSend(v38, "addCompletionBlock:", v47);
          v45[0] = v28;
          v45[1] = 3221225472;
          v45[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_3;
          v45[3] = &unk_1E6F4E2D8;
          v46 = v37;
          v40 = (id)objc_msgSend(v38, "addFailureBlock:", v45);
          v43[0] = v28;
          v43[1] = 3221225472;
          v43[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_4;
          v43[3] = &unk_1E6F4DE30;
          objc_copyWeak(&v44, (id *)buf);
          v41 = (id)objc_msgSend(v38, "addSuccessBlock:", v43);
          objc_destroyWeak(&v44);

          objc_destroyWeak(&v48);
          objc_destroyWeak((id *)buf);

        }
      }

    }
  }

}

BOOL __40__HUAddPeopleViewController_sendInvites__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 2;
}

uint64_t __40__HUAddPeopleViewController_sendInvites__block_invoke_140(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "contactsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "IDSDestinationForRecipient:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hasRestrictedGuestIDSCapabilityForDestination:", v6) ^ 1;
  return v7;
}

BOOL __40__HUAddPeopleViewController_sendInvites__block_invoke_141(uint64_t a1, uint64_t a2)
{
  return a2 == 1;
}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_143(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByRemovingCharactersFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outgoingInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v3;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_INFO, "Attempting to remove existing invitations that match address %@. Invitations: %@", buf, 0x16u);
  }

  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "invitee");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v3, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = MEMORY[0x1E0C809B0];
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_148;
          v22[3] = &unk_1E6F4C5E8;
          v22[4] = v11;
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v15;
          v21[1] = 3221225472;
          v21[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2_150;
          v21[3] = &unk_1E6F4E2D8;
          v21[4] = v11;
          objc_msgSend(v16, "addFailureBlock:", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v15;
          v19[1] = 3221225472;
          v19[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_152;
          v19[3] = &unk_1E6F502A0;
          v20 = v3;
          objc_msgSend(v17, "addSuccessBlock:", v19);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

uint64_t __40__HUAddPeopleViewController_sendInvites__block_invoke_148(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelInviteWithCompletionHandler:", a2);
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_2_150(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Removing existing invitation failed: %@ invitation: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_152(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_INFO, "Successfully removed existing invitation for %@", (uint8_t *)&v4, 0xCu);
  }

}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_155(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2_156;
  v7[3] = &unk_1E6F54590;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  objc_msgSend(v2, "futureWithCompletionHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_2_156(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Sending invitation(s) to address(es): %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_159_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inviteUsersWithInviteInformation:completionHandler:", v6, v3);

}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_157(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CBA948];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUser:administrator:remoteAccess:", v3, 0, 1);

  return v4;
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_2_163(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", 0);

}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v6 = (id *)MEMORY[0x1E0D30990];
  if (v5 != 1)
    v6 = (id *)MEMORY[0x1E0D30998];
  v7 = (void *)MEMORY[0x1E0D313A0];
  v8 = *v6;
  objc_msgSend(v7, "sharedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D305A8];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleError:operationType:options:retryBlock:cancelBlock:", v4, v8, v11, 0, 0);

}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __40__HUAddPeopleViewController_sendInvites__block_invoke_5;
    v15 = &unk_1E6F4F418;
    v16 = WeakRetained;
    v6 = v3;
    v17 = v6;
    objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", &v12, 0);

    objc_msgSend(WeakRetained, "delegate", v12, v13, v14, v15, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addPeopleViewController:didSendInvitations:", WeakRetained, v6);

    }
  }
  objc_msgSend(WeakRetained, "setRequiresPresentingViewControllerDismissal:", 1);
  objc_msgSend(WeakRetained, "presentationDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "finishPresentation:animated:", WeakRetained, 1);

}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateStateForOutgoingInvitations:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_shouldCheckRestrictedGuestIDSCapability
{
  return -[HUAddPeopleViewController viewContext](self, "viewContext") == 1;
}

- (BOOL)_shouldCheckIDSCapabilities
{
  return -[HUAddPeopleViewController viewContext](self, "viewContext") == 1;
}

- (id)_getIDSServiceName
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOptedToHH2");

  if (v4)
    return CFSTR("com.apple.private.alloy.home.invite");
  else
    return CFSTR("com.apple.private.alloy.willow");
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->requiresPresentingViewControllerDismissal = a3;
}

- (HUAddPeopleViewControllerDelegate)delegate
{
  return (HUAddPeopleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)viewContext
{
  return self->_viewContext;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (MFComposeRecipientTextView)composeView
{
  return self->_composeView;
}

- (void)setComposeView:(id)a3
{
  objc_storeStrong((id *)&self->_composeView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSLayoutConstraint)composeViewBottomConstraint
{
  return self->_composeViewBottomConstraint;
}

- (void)setComposeViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_composeViewBottomConstraint, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIColor)effectiveTintColor
{
  return self->_effectiveTintColor;
}

- (void)setEffectiveTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveTintColor, a3);
}

- (BOOL)addressBookAccessDenied
{
  return self->_addressBookAccessDenied;
}

- (void)setAddressBookAccessDenied:(BOOL)a3
{
  self->_addressBookAccessDenied = a3;
}

- (HFContactController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsController, a3);
}

- (void)setSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchManager, a3);
}

- (NSNumber)lastSearchID
{
  return self->_lastSearchID;
}

- (void)setLastSearchID:(id)a3
{
  objc_storeStrong((id *)&self->_lastSearchID, a3);
}

- (BOOL)showingAutoCompleteResults
{
  return self->_showingAutoCompleteResults;
}

- (void)setShowingAutoCompleteResults:(BOOL)a3
{
  self->_showingAutoCompleteResults = a3;
}

- (NSArray)autoCompleteResults
{
  return self->_autoCompleteResults;
}

- (void)setAutoCompleteResults:(id)a3
{
  objc_storeStrong((id *)&self->_autoCompleteResults, a3);
}

- (NSMutableArray)additionalAutoCompleteResults
{
  return self->_additionalAutoCompleteResults;
}

- (void)setAdditionalAutoCompleteResults:(id)a3
{
  objc_storeStrong((id *)&self->_additionalAutoCompleteResults, a3);
}

- (NSArray)familyMembersNotInHome
{
  return self->_familyMembersNotInHome;
}

- (void)setFamilyMembersNotInHome:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembersNotInHome, a3);
}

- (NSString)unatomizedAddress
{
  return self->_unatomizedAddress;
}

- (void)setUnatomizedAddress:(id)a3
{
  objc_storeStrong((id *)&self->_unatomizedAddress, a3);
}

- (NSTimer)statusQueryDebounceTimer
{
  return self->_statusQueryDebounceTimer;
}

- (void)setStatusQueryDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueryDebounceTimer, a3);
}

- (IDSBatchIDQueryController)statusQueryController
{
  return self->_statusQueryController;
}

- (void)setStatusQueryController:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueryController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusQueryController, 0);
  objc_storeStrong((id *)&self->_statusQueryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_unatomizedAddress, 0);
  objc_storeStrong((id *)&self->_familyMembersNotInHome, 0);
  objc_storeStrong((id *)&self->_additionalAutoCompleteResults, 0);
  objc_storeStrong((id *)&self->_autoCompleteResults, 0);
  objc_storeStrong((id *)&self->_lastSearchID, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong((id *)&self->_effectiveTintColor, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_composeViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_composeView, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
