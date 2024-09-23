@implementation CNContactNavigationController

- (BOOL)contactListViewController:(id)a3 canSelectContact:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CNContactNavigationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "contactNavigationController:canSelectContact:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)updateNavigationButtonsAnimated:(BOOL)a3
{
  -[CNContactNavigationController updateNavigationButtonsAnimated:viewWillAppear:](self, "updateNavigationButtonsAnimated:viewWillAppear:", a3, 0);
}

- (void)applicationDidResume
{
  -[CNContactNavigationController updateNavigationButtonsAnimated:](self, "updateNavigationButtonsAnimated:", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNContactNavigationController setUpAccountAndGroupsViewIfNeeded](self, "setUpAccountAndGroupsViewIfNeeded");
}

- (void)setUpAccountAndGroupsViewIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactNavigationController shouldShowGroupsBackButton](self, "shouldShowGroupsBackButton"))
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) == 0
      || (-[CNContactNavigationController delegate](self, "delegate"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "contactNavigationControllerShouldManageGroupsController:", self),
          v5,
          v6))
    {
      if (-[CNContactNavigationController isSinglePickerOnVisionOS](self, "isSinglePickerOnVisionOS"))
      {
        -[CNContactNavigationController contactListViewController](self, "contactListViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactNavigationController setViewControllers:](self, "setViewControllers:", v8);
      }
      else
      {
        -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactNavigationController contactListViewController](self, "contactListViewController", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactNavigationController setViewControllers:](self, "setViewControllers:", v9);

      }
    }
  }
}

- (CNContactNavigationController)initWithDataSource:(id)a3 contactFormatter:(id)a4 applyGroupFilterFromPreferences:(BOOL)a5 environment:(id)a6 allowsLargeTitles:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  CNContactNavigationController *v15;
  uint64_t v16;
  CNContactStore *contactStore;
  void *v18;
  CNAccountsAndGroupsDataSource *v19;
  CNUIGroupsAndContainersSaveManager *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CNScheduler *backgroundScheduler;
  void *v26;
  uint64_t v27;
  CNScheduler *mainThreadScheduler;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  CNManagedConfiguration *managedConfiguration;
  void *v35;
  void *v36;
  CNContactListViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  CNUIUserActivityManager *activityManager;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  CNContactNavigationController *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  _QWORD block[4];
  CNContactNavigationController *v84;
  objc_super v85;
  _QWORD v86[3];

  v7 = a7;
  v9 = a5;
  v86[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v85.receiver = self;
  v85.super_class = (Class)CNContactNavigationController;
  v15 = -[CNContactNavigationController initWithNibName:bundle:](&v85, sel_initWithNibName_bundle_, 0, 0);
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "store");
      v16 = objc_claimAutoreleasedReturnValue();
      contactStore = v15->_contactStore;
      v15->_contactStore = (CNContactStore *)v16;

      if (v9)
      {
        +[CNContactStoreFilter contactStoreFilterFromPreferencesWithContactStore:](CNContactStoreFilter, "contactStoreFilterFromPreferencesWithContactStore:", v15->_contactStore);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "setFilter:", v18);

      }
      v19 = -[CNAccountsAndGroupsDataSource initWithStore:]([CNAccountsAndGroupsDataSource alloc], "initWithStore:", v15->_contactStore);
      -[CNContactNavigationController setAccountsAndGroupsDataSource:](v15, "setAccountsAndGroupsDataSource:", v19);

      v20 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:]([CNUIGroupsAndContainersSaveManager alloc], "initWithContactStore:", v15->_contactStore);
      v21 = 1560;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v12, "store");
      else
        objc_msgSend(v14, "inProcessContactStore");
      v20 = (CNUIGroupsAndContainersSaveManager *)objc_claimAutoreleasedReturnValue();
      v21 = 1440;
    }
    v22 = *(Class *)((char *)&v15->super.super.super.super.isa + v21);
    *(Class *)((char *)&v15->super.super.super.super.isa + v21) = (Class)v20;

    objc_msgSend(v14, "defaultSchedulerProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backgroundSchedulerWithQualityOfService:", 2);
    v24 = objc_claimAutoreleasedReturnValue();
    backgroundScheduler = v15->_backgroundScheduler;
    v15->_backgroundScheduler = (CNScheduler *)v24;

    objc_msgSend(v14, "defaultSchedulerProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mainThreadScheduler");
    v27 = objc_claimAutoreleasedReturnValue();
    mainThreadScheduler = v15->_mainThreadScheduler;
    v15->_mainThreadScheduler = (CNScheduler *)v27;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bundleIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = objc_alloc(MEMORY[0x1E0D13AA8]);
    objc_msgSend(MEMORY[0x1E0D13AB0], "sharedConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)v30;
    v33 = objc_msgSend(v31, "initWithBundleIdentifier:managedProfileConnection:", v30, v32);
    managedConfiguration = v15->_managedConfiguration;
    v15->_managedConfiguration = (CNManagedConfiguration *)v33;

    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C97218]);
      objc_msgSend(v13, "setStyle:", 0);
      objc_msgSend(v13, "setEmphasizesPrimaryNameComponent:", 1);
      objc_msgSend(v13, "setFallbackStyle:", -1);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "setContactFormatter:", v13);
    -[CNContactNavigationController setAllowsLargeTitles:](v15, "setAllowsLargeTitles:", v7);
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController setContactStyle:](v15, "setContactStyle:", v35);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v15, sel_contactStyleCurrentStyleDidChange_, CFSTR("CNContactStyleCurrentStyleDidChangeNotification"), 0);

    v82 = v12;
    v37 = -[CNContactListViewController initWithDataSource:environment:shouldUseLargeTitle:]([CNContactListViewController alloc], "initWithDataSource:environment:shouldUseLargeTitle:", v12, v14, v7);
    v81 = v13;
    -[CNContactListViewController setContactFormatter:](v37, "setContactFormatter:", v13);
    -[CNContactListViewController setDelegate:](v37, "setDelegate:", v15);
    -[CNContactNavigationController contactListStyleApplier](v15, "contactListStyleApplier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setContactListStyleApplier:](v37, "setContactListStyleApplier:", v38);

    -[CNContactListViewController navigationItem](v37, "navigationItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidesBackButton:", 1);

    -[CNContactListViewController navigationItem](v37, "navigationItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setStyle:", 0);

    if (CNUIIsMobilePhone() || CNUIIsContacts())
      -[CNContactListViewController setAllowsMultiSelectContextMenus:](v37, "setAllowsMultiSelectContextMenus:", 1);
    v80 = v14;
    objc_msgSend(v14, "inProcessActivityManager");
    v41 = objc_claimAutoreleasedReturnValue();
    activityManager = v15->_activityManager;
    v15->_activityManager = (CNUIUserActivityManager *)v41;

    objc_storeStrong((id *)&v15->_contactListViewController, v37);
    v86[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController setViewControllers:](v15, "setViewControllers:", v43);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 0x100000, sel_beginSearch_);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("BEGIN_SEARCH_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setDiscoverabilityTitle:", v46);

    v78 = v44;
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v44);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("["), 0x100000);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("SELECT_PREVIOUS_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDiscoverabilityTitle:", v49);

    v77 = v47;
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v47);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("]"), 0x100000);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("SELECT_NEXT_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setDiscoverabilityTitle:", v52);

    v76 = v50;
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v50);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("s"), 1310720, sel_toggleGroupsPanel_);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("TOGGLE_GROUPS_PANEL_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setDiscoverabilityTitle:", v55);

    v75 = v53;
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v53);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("l"), 0x100000, sel_toggleEditContact_);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("EDIT_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setDiscoverabilityTitle:", v58);

    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v56);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0x100000, sel_deleteContact_);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:");
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, sel_deleteContact_);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("DELETE_SELECTED_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setDiscoverabilityTitle:", v61);

    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v59);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("L"), 1179648, sel_mergeUnifyContacts_);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("MERGE_UNIFY_SELECTED_CONTACTS_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setDiscoverabilityTitle:", v64);

    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v62);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("V"), 0x100000, sel_pasteContacts_);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("PASTE_CONTACTS_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setDiscoverabilityTitle:", v67);

    objc_msgSend(v65, "setWantsPriorityOverSystemBehavior:", 1);
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v65);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E28], 0, sel_selectNextContact_);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v68);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E10], 0, sel_selectPreviousContact_);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:", v69);

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "featureFlags");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = objc_msgSend(v71, "isFeatureEnabled:", 18);

    if ((_DWORD)v66)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __131__CNContactNavigationController_initWithDataSource_contactFormatter_applyGroupFilterFromPreferences_environment_allowsLargeTitles___block_invoke;
      block[3] = &unk_1E204F648;
      v84 = v15;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    v72 = v15;

    v13 = v81;
    v12 = v82;
    v14 = v80;
  }

  return v15;
}

- (void)setContactStyle:(id)a3
{
  id v5;
  CNContactListStyleApplier *v6;
  id v7;

  objc_storeStrong((id *)&self->_contactStyle, a3);
  v5 = a3;
  +[CNContactListStyleProvider contactListStyleWithContactStyle:](CNContactListStyleProvider, "contactListStyleWithContactStyle:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactListStyleApplier initWithContactListStyle:]([CNContactListStyleApplier alloc], "initWithContactListStyle:", v7);
  -[CNContactNavigationController setContactListStyleApplier:](self, "setContactListStyleApplier:", v6);

  LODWORD(v6) = objc_msgSend(v5, "shouldPresentInCurrentContext");
  -[CNContactNavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", v6);

}

- (void)setContactListStyleApplier:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
  v5 = a3;
  -[CNContactListViewController setContactListStyleApplier:](self->_contactListViewController, "setContactListStyleApplier:", v5);

}

- (void)setAllowsLargeTitles:(BOOL)a3
{
  self->_allowsLargeTitles = a3;
}

- (void)setAccountsAndGroupsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_accountsAndGroupsDataSource, a3);
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (void)updateLeftNavigationButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC3470], "shouldMakeUIForDefaultPNG") & 1) != 0)
  {
    v5 = 0;
    goto LABEL_10;
  }
  if (-[CNContactNavigationController shouldShowGroupsBackButton](self, "shouldShowGroupsBackButton"))
  {
    v5 = 1;
    goto LABEL_10;
  }
  if (-[CNContactNavigationController shouldShowLeftCancelAndRightDoneButton](self, "shouldShowLeftCancelAndRightDoneButton"))
  {
    goto LABEL_6;
  }
  if (-[CNContactNavigationController shouldShowLeftDoneAndRightAddButton](self, "shouldShowLeftDoneAndRightAddButton")
    || -[CNContactNavigationController shouldShowLeftDoneAndRightEditButton](self, "shouldShowLeftDoneAndRightEditButton"))
  {
    v5 = 3;
  }
  else
  {
    if (-[CNContactNavigationController shouldShowLeftCancelAndRightAddButton](self, "shouldShowLeftCancelAndRightAddButton"))
    {
LABEL_6:
      v5 = 2;
      goto LABEL_10;
    }
    if (-[CNContactNavigationController shouldShowLeftCloseAndRightGroupsButton](self, "shouldShowLeftCloseAndRightGroupsButton"))
    {
      v5 = 4;
    }
    else
    {
      v5 = 0;
    }
  }
LABEL_10:
  if (self->_leftButtonBehavior != v5)
  {
    self->_leftButtonBehavior = v5;
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:", 1);

    switch(v5)
    {
      case 1:
        -[CNContactNavigationController contactListViewController](self, "contactListViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "navigationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidesBackButton:", 0);

        goto LABEL_13;
      case 2:
        v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
        v11 = sel_cancel_;
        v12 = 1;
        goto LABEL_17;
      case 3:
        v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
        v11 = sel_done_;
        v12 = 0;
        goto LABEL_17;
      case 4:
        v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
        v11 = sel_cancel_;
        v12 = 24;
LABEL_17:
        v15 = (id)objc_msgSend(v10, "initWithBarButtonSystemItem:target:action:", v12, self, v11);
        break;
      default:
LABEL_13:
        v15 = 0;
        break;
    }
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:animated:", v15, v3);

  }
}

- (CNContactDataSource)dataSource
{
  void *v2;
  void *v3;

  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactDataSource *)v3;
}

- (id)contactListViewController
{
  return self->_contactListViewController;
}

- (BOOL)shouldShowGroupsBackButton
{
  _BOOL4 v3;

  if (-[CNContactNavigationController isSinglePickerOnVisionOS](self, "isSinglePickerOnVisionOS"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[CNContactNavigationController shouldShowAccountsAndGroups](self, "shouldShowAccountsAndGroups");
    if (v3)
      LOBYTE(v3) = !-[CNContactNavigationController hideGroupsButton](self, "hideGroupsButton");
  }
  return v3;
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (BOOL)hideGroupsButton
{
  return self->_hideGroupsButton;
}

- (CNAccountsAndGroupsViewController)accountsAndGroupsViewController
{
  CNAccountsAndGroupsViewController *accountsAndGroupsViewController;
  CNAccountsAndGroupsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNAccountsAndGroupsViewController *v14;

  accountsAndGroupsViewController = self->_accountsAndGroupsViewController;
  if (!accountsAndGroupsViewController)
  {
    v4 = (CNAccountsAndGroupsViewController *)objc_opt_new();
    -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
    else
      -[CNContactListViewController dataSource](self->_contactListViewController, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilter:", v7);

    -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reload");

    -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsViewController setDataSource:](v4, "setDataSource:", v10);

    -[CNAccountsAndGroupsViewController setDelegate:](v4, "setDelegate:", self);
    -[CNContactNavigationController managedConfiguration](self, "managedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsViewController setManagedConfiguration:](v4, "setManagedConfiguration:", v11);

    -[CNAccountsAndGroupsViewController navigationItem](v4, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidesBackButton:", 1);

    -[CNAccountsAndGroupsViewController navigationItem](v4, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStyle:", 0);

    v14 = self->_accountsAndGroupsViewController;
    self->_accountsAndGroupsViewController = v4;

    accountsAndGroupsViewController = self->_accountsAndGroupsViewController;
  }
  return accountsAndGroupsViewController;
}

- (BOOL)shouldShowAccountsAndGroups
{
  void *v2;
  BOOL v3;

  -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CNAccountsAndGroupsDataSource)accountsAndGroupsDataSource
{
  return self->_accountsAndGroupsDataSource;
}

- (CNContactStoreDataSource)nonServerDataSource
{
  return self->_nonServerDataSource;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

+ (id)newContactFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v2, "setStyle:", 0);
  objc_msgSend(v2, "setEmphasizesPrimaryNameComponent:", 1);
  objc_msgSend(v2, "setFallbackStyle:", -1);
  return v2;
}

- (void)checkForFacebookContactsWithDelay:(double)a3 allowAlert:(BOOL)a4
{
  void *v7;
  id v8;
  _QWORD v9[5];
  BOOL v10;

  -[CNContactNavigationController backgroundScheduler](self, "backgroundScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke;
  v9[3] = &unk_1E204C4D0;
  v9[4] = self;
  v10 = a4;
  v8 = (id)objc_msgSend(v7, "afterDelay:performBlock:", v9, a3);

}

- (CNScheduler)backgroundScheduler
{
  return self->_backgroundScheduler;
}

- (void)setHideGroupsButton:(BOOL)a3
{
  self->_hideGroupsButton = a3;
  -[CNContactNavigationController updateLeftNavigationButtonAnimated:](self, "updateLeftNavigationButtonAnimated:", 0);
}

- (void)setAllowsCardEditing:(BOOL)a3
{
  self->_allowsCardEditing = a3;
}

- (void)setAllowsCardDeletion:(BOOL)a3
{
  self->_allowsCardDeletion = a3;
}

- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:", a3, a4, a5, a6, a7, a8, v8);
}

- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8 dismissingPresentedController:(BOOL)a9
{
  uint64_t v9;

  BYTE1(v9) = 1;
  LOBYTE(v9) = a9;
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8 dismissingPresentedController:(BOOL)a9 shouldHideContactListIfNeeded:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
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
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void (**v34)(_QWORD);
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  void (**v42)(_QWORD);
  _QWORD aBlock[5];
  id v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  void *v48;
  _QWORD v49[2];

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a4;
  v49[1] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  if (-[CNContactNavigationController hasPendingShowCard](self, "hasPendingShowCard"))
  {
    NSLog(CFSTR("Already pending display of card, cannot show another card"));

    return;
  }
  -[CNContactNavigationController setHasPendingShowCard:](self, "setHasPendingShowCard:", 1);
  if (v13)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilter:", 0);
    goto LABEL_5;
  }
  v17 = v36;
  if (v36 && v12)
  {
    -[CNContactListViewController dataSource](self->_contactListViewController, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indexPathForContact:", v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_9;
    v16 = v36;
    v36 = 0;
LABEL_5:

LABEL_9:
    v17 = v36;
  }
  if (!v17 && v12)
  {
    -[CNContactListViewController dataSource](self->_contactListViewController, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contacts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v37;
    if (v37)
      goto LABEL_15;
    -[CNContactListViewController originalDataSource](self->_contactListViewController, "originalDataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v38 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v38;
  }
  if (!v17)
  {
    -[CNContactNavigationController setHasPendingShowCard:](self, "setHasPendingShowCard:", 0);
    return;
  }
LABEL_15:
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v39, "areKeysAvailable:", v24);

  if ((v25 & 1) != 0)
  {
    v26 = v39;
    if (!v11)
      goto LABEL_20;
    goto LABEL_19;
  }
  -[CNContactNavigationController dataSource](self, "dataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v39, 0, v29);
  v30 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v30;
  if (v11)
  {
LABEL_19:
    -[CNContactListViewController visibleListViewController](self->_contactListViewController, "visibleListViewController", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "selectContact:animated:scrollPosition:", v40, v10, 0);

    v26 = v40;
  }
LABEL_20:
  v32 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke;
  aBlock[3] = &unk_1E204A6B8;
  aBlock[4] = self;
  v33 = v26;
  v44 = v33;
  v45 = v10;
  v46 = a9;
  v47 = a10;
  v34 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[CNContactNavigationController transitionCoordinator](self, "transitionCoordinator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v41[0] = v32;
    v41[1] = 3221225472;
    v41[2] = __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_3;
    v41[3] = &unk_1E204A6E0;
    v42 = v34;
    objc_msgSend(v35, "animateAlongsideTransition:completion:", 0, v41);

  }
  else
  {
    v34[2](v34);
  }

}

- (void)setHasPendingShowCard:(BOOL)a3
{
  self->_hasPendingShowCard = a3;
}

uint64_t __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  id v23;
  id v24;

  if ((objc_msgSend(*(id *)(a1 + 32), "ignoresMapsData") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "mapsData"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isUnknown"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isSuggestedMe"))
        v10 = 1;
      else
        v10 = 2;
    }
    else
    {
      v10 = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0
      || (objc_msgSend(*(id *)(a1 + 32), "delegate"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "contactNavigationController:contactViewControllerForContact:preferredMode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10), v3 = (id)objc_claimAutoreleasedReturnValue(), v13, !v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "reuseableContactViewControllerConfiguredForContact:mode:", *(_QWORD *)(a1 + 40), v10);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(MEMORY[0x1E0C97200], "quickActionsEnabled"))
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x200);
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "contactStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContactStore:", v14);

    objc_msgSend(v3, "setShouldShowLinkedContacts:", 1);
    objc_msgSend(v3, "setAllowsEditing:", objc_msgSend(*(id *)(a1 + 32), "allowsCardEditing"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "contactFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContactFormatter:", v15);

    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredForNameMeContactIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "allLinkedIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShowingMeContact:", objc_msgSend(v17, "containsObject:", v6));

    objc_msgSend(v3, "setContact:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "allowsCardDeletion"))
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x100);
    if (objc_msgSend(*(id *)(a1 + 32), "allowsContactBlocking"))
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x80);
    if (objc_msgSend(*(id *)(a1 + 32), "allowsContactBlockingAndReporting"))
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x800);
    objc_msgSend(*(id *)(a1 + 32), "_cnui_presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", v3, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50));
  }
  else
  {
    v3 = objc_alloc_init((Class)getMUPlaceViewControllerConfigurationClass[0]());
    objc_msgSend(v3, "setOptions:", 16);
    objc_msgSend(v3, "setContactsNavigationController:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_msgSend(objc_alloc((Class)getMUPlaceViewControllerClass[0]()), "initWithConfiguration:", v3);
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

    v6 = objc_alloc_init((Class)getMKLocalSearchRequestClass[0]());
    objc_msgSend(*(id *)(a1 + 40), "mapsData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setContactsDataString:", v7);

    v8 = (void *)objc_msgSend(objc_alloc((Class)getMKLocalSearchClass[0]()), "initWithRequest:", v6);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_2;
    v22 = &unk_1E204A690;
    v23 = v4;
    v24 = *(id *)(a1 + 40);
    v9 = v4;
    objc_msgSend(v8, "startWithCompletionHandler:", &v19);
    objc_msgSend(*(id *)(a1 + 32), "_cnui_presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", v9, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), v19, v20, v21, v22);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingShowCard:", 0);
}

- (id)reuseableContactViewControllerConfiguredForContact:(id)a3 mode:(int64_t)a4
{
  id v6;
  CNContactViewController *v7;
  CNContactViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CNContactNavigationController reusableContactViewController](self, "reusableContactViewController");
  v7 = (CNContactViewController *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    if (-[CNContactViewController isEditing](v7, "isEditing"))
    {
      -[CNContactViewController contentViewController](v8, "contentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "saveChanges");

      -[CNContactViewController contentViewController](v8, "contentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEditing:animated:", 0, 0);

      -[CNContactViewController setEditing:animated:](v8, "setEditing:animated:", 0, 0);
    }
    -[CNContactViewController setContact:additionalContact:mode:](v8, "setContact:additionalContact:mode:", v6, 0, a4);
  }
  else
  {
    v8 = -[CNContactViewController initWithMode:]([CNContactViewController alloc], "initWithMode:", a4);
    -[CNContactViewController setContact:](v8, "setContact:", v6);
    -[CNContactNavigationController setReusableContactViewController:](self, "setReusableContactViewController:", v8);
  }

  return v8;
}

- (void)setReusableContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reusableContactViewController, a3);
}

- (CNContactViewController)reusableContactViewController
{
  return self->_reusableContactViewController;
}

- (BOOL)ignoresMapsData
{
  return self->_ignoresMapsData;
}

- (BOOL)hasPendingShowCard
{
  return self->_hasPendingShowCard;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (BOOL)allowsCardEditing
{
  if (self->_allowsCardEditing)
    return !-[CNContactNavigationController isContactProviderDataSource](self, "isContactProviderDataSource");
  else
    return 0;
}

- (BOOL)allowsCardDeletion
{
  if (self->_allowsCardDeletion)
    return !-[CNContactNavigationController isContactProviderDataSource](self, "isContactProviderDataSource");
  else
    return 0;
}

- (void)_cnui_presentViewController:(id)a3 animated:(BOOL)a4 dismissingPresentedController:(BOOL)a5 shouldHideContactListIfNeeded:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  id v27;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  objc_opt_class();
  v27 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v27;
  else
    v11 = 0;
  v12 = v11;

  -[CNContactNavigationController setPresentedContactViewController:](self, "setPresentedContactViewController:", v12);
  -[CNContactNavigationController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  -[CNContactNavigationController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    v17 = objc_msgSend(v15, "contactNavigationController:presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", self, v27, v8, v7, v6);
LABEL_8:
    v19 = v17;

    if ((objc_msgSend(v27, "isViewLoaded") & 1) == 0)
    {
      v20 = v27;
      if ((v19 & 1) != 0)
        goto LABEL_23;
      goto LABEL_22;
    }
    v20 = v27;
    goto LABEL_10;
  }
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "contactNavigationController:presentViewController:animated:", self, v27, v8);
    goto LABEL_8;
  }
  if (!-[CNContactNavigationController isPresentedContactViewControllerVisible](self, "isPresentedContactViewControllerVisible"))
  {
    v26 = objc_msgSend(v27, "isViewLoaded");
    v20 = v27;
    if ((v26 & 1) == 0)
      goto LABEL_22;
    v19 = 0;
LABEL_10:
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "window");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v27;
    if ((v19 & 1) != 0 || v22)
      goto LABEL_23;
LABEL_22:
    -[CNContactNavigationController pushViewController:animated:](self, "pushViewController:animated:", v20, v8);
    v20 = v27;
    goto LABEL_23;
  }
  -[CNContactNavigationController presentedViewController](self, "presentedViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CNContactNavigationController presentedViewController](self, "presentedViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  v25 = objc_msgSend(v27, "isViewLoaded");
  v20 = v27;
  if ((v25 & 1) != 0)
  {
    v19 = 1;
    goto LABEL_10;
  }
LABEL_23:

}

- (void)setPresentedContactViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedContactViewController, a3);
}

- (void)updateNavigationButtonsAnimated:(BOOL)a3 viewWillAppear:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  -[CNContactNavigationController visibleViewController](self, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || v4)
    -[CNContactNavigationController updateNavigationButtonsInSearchMode:animated:](self, "updateNavigationButtonsInSearchMode:animated:", -[CNContactListViewController isSearching](self->_contactListViewController, "isSearching"), v5);
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (CNContactNavigationController)initWithDataSource:(id)a3 allowsLargeTitles:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CNContactNavigationController *v8;

  v4 = a4;
  v6 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactNavigationController initWithDataSource:environment:allowsLargeTitles:](self, "initWithDataSource:environment:allowsLargeTitles:", v6, v7, v4);

  return v8;
}

- (CNContactNavigationController)initWithDataSource:(id)a3 environment:(id)a4 allowsLargeTitles:(BOOL)a5
{
  return -[CNContactNavigationController initWithDataSource:contactFormatter:applyGroupFilterFromPreferences:environment:allowsLargeTitles:](self, "initWithDataSource:contactFormatter:applyGroupFilterFromPreferences:environment:allowsLargeTitles:", a3, 0, 1, a4, a5);
}

void __131__CNContactNavigationController_initWithDataSource_contactFormatter_applyGroupFilterFromPreferences_environment_allowsLargeTitles___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "presentedContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[CNUIDraftSupport loadNewContactDraft](CNUIDraftSupport, "loadNewContactDraft");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      objc_msgSend(*(id *)(a1 + 32), "showNewDraftContact:animated:", v3, 1);
      v3 = v4;
    }

  }
}

- (CNContactViewController)presentedContactViewController
{
  return (CNContactViewController *)objc_loadWeakRetained((id *)&self->_presentedContactViewController);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v14;

  v3 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController tipKitContext](self, "tipKitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTipKitContext:", v6);

  v14.receiver = self;
  v14.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
  -[CNContactNavigationController setUpLargeTitles](self, "setUpLargeTitles");
  -[CNContactNavigationController updateNavigationButtonsAnimated:viewWillAppear:](self, "updateNavigationButtonsAnimated:viewWillAppear:", 0, 1);
  -[CNContactNavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "_setRequestedMaxBackButtonWidth:", v9 / 3.0);

  -[CNContactNavigationController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v11, "_setRequestedMaxBackButtonWidth:", v13 / 3.0);

}

- (void)updateNavigationButtonsInSearchMode:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  void *v35;
  _QWORD v36[2];
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v4 = a4;
  v40[1] = *MEMORY[0x1E0C80C00];
  if (a3 && -[CNContactNavigationController allowsCanceling](self, "allowsCanceling"))
  {
    if (!-[CNContactNavigationController shouldShowLeftCancelAndRightDoneButton](self, "shouldShowLeftCancelAndRightDoneButton")&& -[CNContactNavigationController shouldShowRightCancelButton](self, "shouldShowRightCancelButton"))
    {
      goto LABEL_5;
    }
    v6 = 1;
  }
  else if (-[CNContactNavigationController shouldShowLeftCloseAndRightGroupsButton](self, "shouldShowLeftCloseAndRightGroupsButton"))
  {
    v6 = 6;
  }
  else if (-[CNContactNavigationController shouldShowLeftCancelAndRightDoneButton](self, "shouldShowLeftCancelAndRightDoneButton"))
  {
    v6 = 3;
  }
  else if (-[CNContactNavigationController shouldShowLeftDoneAndRightAddButton](self, "shouldShowLeftDoneAndRightAddButton"))
  {
    v6 = 5;
  }
  else if (-[CNContactNavigationController shouldShowLeftDoneAndRightEditButton](self, "shouldShowLeftDoneAndRightEditButton"))
  {
    v6 = 9;
  }
  else if (-[CNContactNavigationController shouldShowLeftCancelAndRightAddButton](self, "shouldShowLeftCancelAndRightAddButton"))
  {
    v6 = 4;
  }
  else if (-[CNContactNavigationController shouldShowRightAddAndCancelButton](self, "shouldShowRightAddAndCancelButton"))
  {
    v6 = 8;
  }
  else
  {
    if (-[CNContactNavigationController shouldShowRightCancelButton](self, "shouldShowRightCancelButton"))
    {
LABEL_5:
      v6 = 2;
      goto LABEL_22;
    }
    v7 = -[CNContactNavigationController shouldShowRightAddButton](self, "shouldShowRightAddButton");
    v6 = 7;
    if (!v7)
      v6 = 0;
  }
LABEL_22:
  if (self->_rightButtonBehavior == v6)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightBarButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_mailButtonItem)
      v11 = objc_msgSend(v10, "containsObject:");
    else
      v11 = 0;
    if (v11 != -[CNContactNavigationController shouldShowMailButton](self, "shouldShowMailButton"))
    {
      if (-[CNContactNavigationController shouldShowMailButton](self, "shouldShowMailButton"))
      {
        -[CNContactNavigationController mailButtonItem](self, "mailButtonItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObject:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __78__CNContactNavigationController_updateNavigationButtonsInSearchMode_animated___block_invoke;
        v34[3] = &unk_1E204A668;
        v34[4] = self;
        objc_msgSend(v10, "_cn_filter:", v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRightBarButtonItems:", v15);

    }
  }
  else
  {
    self->_rightButtonBehavior = v6;
    switch(v6)
    {
      case 1:
      case 3:
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
        v38 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[CNContactNavigationController limitedAccessPickerType](self, "limitedAccessPickerType") != 2)
          goto LABEL_39;
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEnabled:", 0);
        goto LABEL_38;
      case 2:
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
        v39 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 4:
      case 5:
      case 7:
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 4, self, sel_addContact_);
        v37 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 6:
        v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
        CNContactsUIBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("LISTS"), &stru_1E20507A8, CFSTR("Localized"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithTitle:style:target:action:", v21, 0, self, sel_presentGroupsViewController_);
        v40[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
        goto LABEL_39;
      case 8:
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
        v36[0] = v25;
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 4, self, sel_addContact_);
        v36[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "lastObject");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_41:
        v24 = (void *)v13;
        objc_msgSend((id)objc_opt_class(), "keyCommandForNewContact");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      case 9:
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editLimitedAccess);
        v35 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        goto LABEL_42;
      default:
        v10 = 0;
LABEL_39:
        v23 = 0;
        v24 = 0;
LABEL_42:
        -[CNContactNavigationController setAddContactBarButtonItem:](self, "setAddContactBarButtonItem:", v24);
        -[CNContactNavigationController addKeyCommand](self, "addKeyCommand");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[CNContactNavigationController addKeyCommand](self, "addKeyCommand");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactNavigationController removeKeyCommand:](self, "removeKeyCommand:", v28);

        }
        if (v23)
          -[CNContactNavigationController addKeyCommand:](self, "addKeyCommand:", v23);
        -[CNContactNavigationController setAddKeyCommand:](self, "setAddKeyCommand:", v23);
        if (-[CNContactNavigationController shouldShowMailButton](self, "shouldShowMailButton"))
        {
          -[CNContactNavigationController mailButtonItem](self, "mailButtonItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "arrayByAddingObject:", v29);
          v30 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v30;
        }
        -[CNContactNavigationController contactListViewController](self, "contactListViewController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "navigationItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setRightBarButtonItems:animated:", v10, v4);

        break;
    }
  }

  -[CNContactNavigationController refreshMailButtonEnabled](self, "refreshMailButtonEnabled");
  -[CNContactNavigationController updateLeftNavigationButtonAnimated:](self, "updateLeftNavigationButtonAnimated:", v4);
}

- (id)tipKitContext
{
  return 0;
}

- (BOOL)shouldShowRightCancelButton
{
  _BOOL4 v3;

  v3 = -[CNContactNavigationController allowsCanceling](self, "allowsCanceling");
  if (v3)
    LOBYTE(v3) = !-[CNContactNavigationController hideGroupsButton](self, "hideGroupsButton")
              && -[CNContactNavigationController limitedAccessPickerType](self, "limitedAccessPickerType") != 1;
  return v3;
}

- (BOOL)shouldShowRightAddButton
{
  _BOOL4 v3;

  v3 = -[CNContactNavigationController allowsCardEditing](self, "allowsCardEditing");
  if (v3)
    LOBYTE(v3) = -[CNContactNavigationController canAddContacts](self, "canAddContacts");
  return v3;
}

- (BOOL)shouldShowRightAddAndCancelButton
{
  return -[CNContactNavigationController allowsCanceling](self, "allowsCanceling")
      && -[CNContactNavigationController shouldShowRightAddButton](self, "shouldShowRightAddButton")
      && -[CNContactNavigationController shouldShowGroupsBackButton](self, "shouldShowGroupsBackButton");
}

- (BOOL)shouldShowMailButton
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[CNContactListViewController originalDataSource](self->_contactListViewController, "originalDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5 && !-[CNContactNavigationController hideMailToGroupButton](self, "hideMailToGroupButton"))
  {
    if ((objc_msgSend(v5, "filterShowsSingleGroup") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "filterShowsSingleExchangeFolder");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowLeftDoneAndRightAddButton
{
  _BOOL4 v3;

  v3 = -[CNContactNavigationController allowsDone](self, "allowsDone");
  if (v3)
  {
    v3 = -[CNContactNavigationController shouldShowRightAddButton](self, "shouldShowRightAddButton");
    if (v3)
      LOBYTE(v3) = !-[CNContactNavigationController shouldShowGroupsBackButton](self, "shouldShowGroupsBackButton");
  }
  return v3;
}

- (BOOL)shouldShowLeftCancelAndRightDoneButton
{
  _BOOL4 v3;

  v3 = -[CNContactNavigationController allowsCanceling](self, "allowsCanceling");
  if (v3)
    LOBYTE(v3) = -[CNContactNavigationController allowsDone](self, "allowsDone");
  return v3;
}

- (BOOL)shouldShowLeftCancelAndRightAddButton
{
  _BOOL4 v3;

  v3 = -[CNContactNavigationController allowsCanceling](self, "allowsCanceling");
  if (v3)
  {
    v3 = -[CNContactNavigationController shouldShowRightAddButton](self, "shouldShowRightAddButton");
    if (v3)
      LOBYTE(v3) = !-[CNContactNavigationController shouldShowGroupsBackButton](self, "shouldShowGroupsBackButton");
  }
  return v3;
}

- (void)setUpLargeTitles
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = -[CNContactNavigationController allowsLargeTitles](self, "allowsLargeTitles");
  -[CNContactNavigationController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefersLargeTitles:", v3);

  v6 = -[CNContactNavigationController allowsLargeTitles](self, "allowsLargeTitles");
  -[CNContactNavigationController navigationBar](self, "navigationBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersLargeTitles:", v6);

}

- (void)setAddKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->_addKeyCommand, a3);
}

- (void)setAddContactBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addContactBarButtonItem, a3);
}

- (void)refreshMailButtonEnabled
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CNContactNavigationController shouldShowMailButton](self, "shouldShowMailButton"))
  {
    -[CNContactListViewController originalDataSource](self->_contactListViewController, "originalDataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contacts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      -[CNContactListViewController originalDataSource](self->_contactListViewController, "originalDataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contacts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setEnabled:](self->_mailButtonItem, "setEnabled:", (unint64_t)objc_msgSend(v5, "count") < 0x65);

    }
    else
    {
      -[UIBarButtonItem setEnabled:](self->_mailButtonItem, "setEnabled:", 0);
    }

  }
}

- (BOOL)hideMailToGroupButton
{
  return self->_hideMailToGroupButton;
}

- (BOOL)canAddContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CNContactNavigationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactNavigationController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_msgSend(v6, "isServerFilter") & 1) == 0
      && objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3;

  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3;
  }

  return v7;
}

- (BOOL)allowsLargeTitles
{
  return self->_allowsLargeTitles;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (BOOL)allowsCanceling
{
  return self->_allowsCanceling;
}

- (UIKeyCommand)addKeyCommand
{
  return self->_addKeyCommand;
}

+ (id)keyCommandForNewContact
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("n"), 0x100000, sel_addContact_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoverabilityTitle:", v4);

  return v2;
}

- (CNContactNavigationController)initWithDataSource:(id)a3
{
  return -[CNContactNavigationController initWithDataSource:allowsLargeTitles:](self, "initWithDataSource:allowsLargeTitles:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController dealloc](&v4, sel_dealloc);
}

- (void)_updateUserActivity
{
  NSObject *v3;
  void *v4;
  CNContactNavigationController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  CNContactNavigationController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    CNUILogContactList();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (CNContactNavigationController *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v15, 0xCu);

    }
    -[CNContactNavigationController activityManager](self, "activityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeActivityAdvertisingViewingList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactNavigationController userActivity](self, "userActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {

      if (!v9)
      {
        -[CNContactNavigationController setUserActivity:](self, "setUserActivity:", v7);
        -[CNContactNavigationController userActivity](self, "userActivity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "becomeCurrent");

        CNUILogContactList();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[CNContactNavigationController userActivity](self, "userActivity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412546;
          v16 = self;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v15, 0x16u);

        }
      }
    }
    else
    {
      objc_msgSend(v8, "resignCurrent");

      CNUILogContactList();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[CNContactNavigationController userActivity](self, "userActivity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = self;
        v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_18AC56000, v13, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v15, 0x16u);

      }
      -[CNContactNavigationController setUserActivity:](self, "setUserActivity:", 0);
    }

  }
}

- (void)updateUserActivityState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[CNContactNavigationController firstVisibleContact](self, "firstVisibleContact");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[CNContactNavigationController isPresentedContactViewControllerVisible](self, "isPresentedContactViewControllerVisible"))
  {
    -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSearchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 | v7)
  {
    if (!v4 && v7)
      v4 = (uint64_t)(id)v7;
  }
  else
  {
    v4 = 0;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
      goto LABEL_14;
  }
  -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isViewLoaded"))
  {
    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }

  -[CNContactNavigationController activityManager](self, "activityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentSearchString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateUserActivityState:withContentsOfListTopContact:displayedContact:searchString:isShowingGroups:", v18, v4, v7, v17, v14);

LABEL_14:
}

- (id)firstVisibleContact
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;

  -[CNContactNavigationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleListViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentOffset");
    v10 = v9;
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visibleListViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactListHeaderHeight");
    v14 = v13;

    objc_msgSend(v8, "center");
    v16 = v15;
    -[CNContactNavigationController navigationBar](self, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v8, "collectionViewLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutAttributesForElementsInRect:", v16, v10 + v14 + v19, v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "_cn_map:", &__block_literal_global_23358);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "globalIndexForCollectionViewIndexPath:", v30);

      v29 = 0;
      if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactNavigationController dataSource](self, "dataSource");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "contacts");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

        if (v32 >= v35)
        {
          v29 = 0;
        }
        else
        {
          -[CNContactNavigationController dataSource](self, "dataSource");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "contacts");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }
  else
  {
    v29 = 0;
  }
  return v29;
}

- (void)scrollToContact:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scrollTopToContactWithIdentifier:animated:", v6, 0);
}

- (void)contactStyleCurrentStyleDidChange:(id)a3
{
  CNScheduler *mainThreadScheduler;
  _QWORD v4[5];

  mainThreadScheduler = self->_mainThreadScheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CNContactNavigationController_contactStyleCurrentStyleDidChange___block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  -[CNScheduler performBlock:](mainThreadScheduler, "performBlock:", v4);
}

- (void)setShouldDisplayMeContactBanner:(BOOL)a3
{
  -[CNContactListViewController setShouldDisplayMeContactBanner:](self->_contactListViewController, "setShouldDisplayMeContactBanner:", a3);
}

- (BOOL)shouldDisplayMeContactBanner
{
  return -[CNContactListViewController shouldDisplayMeContactBanner](self->_contactListViewController, "shouldDisplayMeContactBanner");
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesSearchableSources:", v3);

}

- (BOOL)hidesSearchableSources
{
  void *v2;
  char v3;

  -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesSearchableSources");

  return v3;
}

- (BOOL)isSinglePickerOnVisionOS
{
  void *v3;
  int v4;

  if (-[CNContactNavigationController hostIdiom](self, "hostIdiom") == 6)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsMultiSelection") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)shouldShowLeftDoneAndRightEditButton
{
  return -[CNContactNavigationController limitedAccessPickerType](self, "limitedAccessPickerType") == 5;
}

- (BOOL)isContactProviderDataSource
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  objc_opt_class();
  -[CNContactNavigationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "filteredContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type") == 1003;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateNavigationButtonsInSearchMode:(BOOL)a3
{
  -[CNContactNavigationController updateNavigationButtonsInSearchMode:animated:](self, "updateNavigationButtonsInSearchMode:animated:", a3, 1);
}

- (void)setContactPickerTargetGroupIdentifier:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[NSString isEqualToString:](self->_contactPickerTargetGroupIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_contactPickerTargetGroupIdentifier, a3);
    -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acAccountForGroupIdentifier:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTargetAccountExternalIdentifiers:", v9);

    }
  }

}

- (void)setManagedConfiguration:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[CNManagedConfiguration isEqual:](self->_managedConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_managedConfiguration, a3);
    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setManagedConfiguration:", v6);

  }
}

- (UIBarButtonItem)mailButtonItem
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *mailButtonItem;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!self->_mailButtonItem && !-[CNContactNavigationController hideMailToGroupButton](self, "hideMailToGroupButton"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithImage:style:target:action:", v4, 0, self, sel_mailContacts_);
    mailButtonItem = self->_mailButtonItem;
    self->_mailButtonItem = v5;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_mailButtonItem, "setAccessibilityIdentifier:", CFSTR("EmailGroupButton"));
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP_ACCESSIBILITY_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_mailButtonItem, "setAccessibilityLabel:", v8);

    -[CNContactNavigationController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_mailButtonItem, "setEnabled:", objc_msgSend(v10, "count") != 0);

  }
  return self->_mailButtonItem;
}

- (void)mailContacts:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[CNContactNavigationController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController presentErrorAlertWithTitle:message:animated:](self, "presentErrorAlertWithTitle:message:animated:", 0, v13, 1);

    CNUILogContactList();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v15 = "Data source is not of type CNContactStoreDataSource";
LABEL_17:
    _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
    goto LABEL_24;
  }
  objc_msgSend(v6, "filteredGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "filteredGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForContactsInGroupWithIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "filteredContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
LABEL_15:
      CNContactsUIBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController presentErrorAlertWithTitle:message:animated:](self, "presentErrorAlertWithTitle:message:animated:", 0, v30, 1);

      CNUILogContactList();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v15 = "Not viewing a single group";
      goto LABEL_17;
    }
    v17 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "filteredContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateForContactsInContainerWithIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = v11;

  if (!v14)
    goto LABEL_15;
  -[CNContactNavigationController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "store");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97348], "descriptorForRequiredKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v19, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, v21, &v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v35;

  if (v22)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C97348]);
    -[NSObject mailUrlForContacts:needsEmailAddresses:](v24, "mailUrlForContacts:needsEmailAddresses:", v22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v26 = objc_claimAutoreleasedReturnValue();
      -[NSObject applicationWorkspace](v26, "applicationWorkspace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x1E0CA57C0];
      v37 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "openSensitiveURLInBackground:withOptions:", v25, v28);

    }
    else
    {
      CNContactsUIBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController presentErrorAlertWithTitle:message:animated:](self, "presentErrorAlertWithTitle:message:animated:", 0, v34, 1);

      CNUILogContactList();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v26, OS_LOG_TYPE_INFO, "Failed to create mail URL", buf, 2u);
      }
    }

  }
  else
  {
    CNContactsUIBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController presentErrorAlertWithTitle:message:animated:](self, "presentErrorAlertWithTitle:message:animated:", 0, v32, 1);

    CNUILogContactList();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl(&dword_18AC56000, v24, OS_LOG_TYPE_INFO, "Failed to fetch contacts with keys for mailing, error: %@", buf, 0xCu);
    }
  }

LABEL_24:
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OKAY"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v10);
  -[CNContactNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, v5, 0);

}

- (void)clearServerSearchIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactNavigationController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeServerFilter");

    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController accountsAndGroupsViewControllerDidUpdateSelection:](self, "accountsAndGroupsViewControllerDidUpdateSelection:", v7);

    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (void)presentGroupsViewController:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  -[CNContactNavigationController contactListViewController](self, "contactListViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearching");

  if (v5)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelSearch:", 0);

  }
  -[CNContactNavigationController presentGroupsViewControllerAnimated:](self, "presentGroupsViewControllerAnimated:", 1);
}

- (void)presentGroupsViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;
  id v11;

  v3 = a3;
  if (-[CNContactNavigationController isSinglePickerOnVisionOS](self, "isSinglePickerOnVisionOS"))
  {
    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController pushViewController:animated:](self, "pushViewController:animated:", v11, 1);
LABEL_9:

    return;
  }
  -[CNContactNavigationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contactNavigationControllerShouldShowGroupsViewController:", self);

    if (!v7)
      return;
  }
  else
  {

  }
  -[CNContactNavigationController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showGroupsAnimated:", 1);
    goto LABEL_9;
  }
  v10 = (id)-[CNContactNavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", v3);
}

- (void)done:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  -[CNContactNavigationController contactListViewController](self, "contactListViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearching");

  if (v5)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchForString:animated:completionBlock:", 0, 1, 0);
  }
  else
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    -[CNContactNavigationController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactNavigationControllerDidComplete:", self);
  }

}

- (void)cancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactNavigationController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactNavigationControllerDidCancel:", self);

  }
}

- (id)addContactPresenter
{
  void *v3;
  CNContactNavigationController *v4;
  CNContactNavigationController *v5;

  -[CNContactNavigationController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "conformsToProtocol:", &unk_1EE020760))
  {
    -[CNContactNavigationController parentViewController](self, "parentViewController");
    v4 = (CNContactNavigationController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  v5 = v4;

  return v5;
}

- (void)presentAddContactViewController:(id)a3 animated:(BOOL)a4
{
  -[CNContactNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, a4, 0);
}

- (void)addContact:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v4 = a4;
  +[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContactStore:", v6);

  objc_msgSend(v14, "setDelegate:", self);
  -[CNContactNavigationController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProhibitedPropertyKeys:", v7);

  -[CNContactNavigationController targetGroupForNewContact](self, "targetGroupForNewContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController targetContainerForNewContactWithTargetGroup:](self, "targetContainerForNewContactWithTargetGroup:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setParentContainer:", v9);
  objc_msgSend(v14, "setParentGroup:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v14);
  -[CNContactNavigationController contactStyle](self, "contactStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "usesInsetPlatterStyle");

  if ((v12 & 1) == 0)
    objc_msgSend(v10, "setModalPresentationStyle:", 3);
  -[CNContactNavigationController addContactPresenter](self, "addContactPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentAddContactViewController:animated:", v10, v4);

}

- (void)showNewDraftContact:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v4 = a4;
  +[CNContactViewController viewControllerForNewDraftContact:](CNContactViewController, "viewControllerForNewDraftContact:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContactStore:", v6);

  objc_msgSend(v14, "setDelegate:", self);
  -[CNContactNavigationController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProhibitedPropertyKeys:", v7);

  -[CNContactNavigationController targetGroupForNewContact](self, "targetGroupForNewContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController targetContainerForNewContactWithTargetGroup:](self, "targetContainerForNewContactWithTargetGroup:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setParentContainer:", v9);
  objc_msgSend(v14, "setParentGroup:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v14);
  -[CNContactNavigationController contactStyle](self, "contactStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "usesInsetPlatterStyle");

  if ((v12 & 1) == 0)
    objc_msgSend(v10, "setModalPresentationStyle:", 3);
  -[CNContactNavigationController addContactPresenter](self, "addContactPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentAddContactViewController:animated:", v10, v4);

}

- (void)dismissSearchAndSelectContact:(id)a3 allowsMultiSelection:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelSearch:", 0);

  if (!a4)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectAllSelectedIndexPathsAnimated:", 0);

  }
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCellStateSelected:forContact:animated:", 1, v6, 0);

  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scrollTopToContactWithIdentifier:animated:", v10, 1);
}

- (void)showCardForContact:(id)a3 animated:(BOOL)a4 scrollToContact:(BOOL)a5
{
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", a3, 0, 1, 0, a5, a4);
}

- (void)showCardForContact:(id)a3 animated:(BOOL)a4
{
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", a3, 0, 1, 0, 1, a4);
}

- (void)showCardForContactAfterIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleListViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "globalIndexForCollectionViewIndexPath:", v4);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0)
    v9 = 0;
  else
    v9 = v7 + 1;
  -[CNContactNavigationController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v9 < v12)
  {
    -[CNContactNavigationController dataSource](self, "dataSource");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController showCardForContactIfPossible:](self, "showCardForContactIfPossible:", v14);

  }
}

- (void)showCardForContactBeforeIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleListViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "globalIndexForCollectionViewIndexPath:", v4);

  if (!v4 || v7)
  {
    if (v7)
      v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v8 = 1;
    if (v8 || v4 == 0)
      v10 = 0;
    else
      v10 = v7 - 1;
    -[CNContactNavigationController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v10 < v13)
    {
      -[CNContactNavigationController dataSource](self, "dataSource");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contacts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController showCardForContactIfPossible:](self, "showCardForContactIfPossible:", v15);

    }
  }
}

- (BOOL)isPresentedContactViewControllerVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)showCardForContactIfPossible:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v4 = -[CNContactNavigationController isPresentedContactViewControllerVisible](self, "isPresentedContactViewControllerVisible");
  v5 = v10;
  if (v4)
  {
    -[CNContactNavigationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[CNContactNavigationController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CNContactNavigationController delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "contactNavigationControllerShouldShowContactsOnKeyCommands:", self);

        v5 = v10;
        if (!v9)
          goto LABEL_10;
      }
      else
      {

      }
      -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", v10, 0, 1, 1, 1, 0);
    }
    v5 = v10;
  }
LABEL_10:

}

- (id)currentlyDisplayedContact
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNContactNavigationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayedContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)startEditingPresentedContact
{
  void *v3;
  id v4;

  -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditing:animated:", 1, 1);

  }
}

- (void)resetContactViewController
{
  void *v3;
  char v4;
  CNContactNavigationController *v5;
  id v6;

  -[CNContactNavigationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v5 = (CNContactNavigationController *)objc_claimAutoreleasedReturnValue();

    if (v5 != self)
    {
      -[CNContactNavigationController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resetContactViewController");

    }
  }
}

- (BOOL)contactListViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  v7 = a4;
  v8 = a5;
  -[CNContactNavigationController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "contactNavigationController:shouldSelectContact:atIndexPath:", self, v7, v8);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)contactSuggestionViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNContactNavigationController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "contactSuggestionViewController:shouldSelectContact:atIndexPath:", v8, v9, v10);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4 shouldScrollToContact:(BOOL)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD aBlock[5];
  id v24;
  BOOL v25;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke;
  aBlock[3] = &unk_1E204A708;
  aBlock[4] = self;
  v9 = v7;
  v24 = v9;
  v25 = a5;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSearching");

  if (!v12)
    goto LABEL_8;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "allowsMultiSelection");

  -[CNContactNavigationController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    if ((v14 & 1) == 0)
    {
      -[CNContactNavigationController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "contactNavigationControllerShouldDismissSearchOnSelection:", self);

      if ((v18 & 1) == 0)
        goto LABEL_8;
    }
  }
  else if (!v14)
  {
    goto LABEL_8;
  }
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController dismissSearchAndSelectContact:allowsMultiSelection:](self, "dismissSearchAndSelectContact:allowsMultiSelection:", v9, objc_msgSend(v19, "allowsMultiSelection"));

LABEL_8:
  -[CNContactNavigationController transitionCoordinator](self, "transitionCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke_2;
    v21[3] = &unk_1E204A6E0;
    v22 = v10;
    objc_msgSend(v20, "animateAlongsideTransition:completion:", 0, v21);

  }
  else
  {
    v10[2](v10);
  }

}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4
{
  -[CNContactNavigationController contactListViewController:didSelectContact:shouldScrollToContact:](self, "contactListViewController:didSelectContact:shouldScrollToContact:", a3, a4, 1);
}

- (void)contactListViewController:(id)a3 updatedSelectedContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  -[CNContactNavigationController reusableContactViewController](self, "reusableContactViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactNavigationController reusableContactViewController](self, "reusableContactViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (!v7 || (v12 & 1) == 0)
  {
    LOWORD(v13) = 1;
    -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", v14, 0, 0, 0, 0, 1, v13);
  }

}

- (void)contactListViewController:(id)a3 shouldPresentContact:(id)a4 shouldScrollToContact:(BOOL)a5
{
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", a4, 0, 1, 0, a5, 1);
}

- (void)dataSourceChangedForContactListViewController:(id)a3
{
  if ((objc_msgSend(a3, "isHandlingSearch") & 1) == 0)
    -[CNContactNavigationController refreshMailButtonEnabled](self, "refreshMailButtonEnabled");
}

- (void)contactListViewControllerSelectedAddContactToList:(id)a3 withSourceView:(id)a4
{
  -[CNContactNavigationController presentAddToGroupPickerWithSourceView:](self, "presentAddToGroupPickerWithSourceView:", a4);
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = a4;
  if (objc_msgSend(v25, "count"))
  {
    -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNContactNavigationController parentGroupForCurrentFilter](self, "parentGroupForCurrentFilter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "containerForGroupIdentifier:", v8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v11 = v25;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v34;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v34 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
                -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isAuthorizedToAddContact:toContainer:ignoresParentalRestrictions:", v15, v26, 0);

                if (v17)
                  v18 = v9;
                else
                  v18 = v10;
                objc_msgSend(v18, "addObject:", v15);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            }
            while (v12);
          }

          v19 = *MEMORY[0x1E0D137F8];
          if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v9) & 1) == 0)
          {
            -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (id)objc_msgSend(v20, "addContacts:toGroup:inContainer:moveWasAuthorized:", v9, v23, v26, 1);

          }
          if (((*(uint64_t (**)(uint64_t, id))(v19 + 16))(v19, v10) & 1) == 0)
          {
            objc_initWeak(&location, self);
            -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __65__CNContactNavigationController_contactPicker_didSelectContacts___block_invoke;
            v27[3] = &unk_1E204A730;
            objc_copyWeak(&v31, &location);
            v28 = v10;
            v29 = v23;
            v30 = v26;
            objc_msgSend(v22, "authorizeForViewController:sender:animated:completionBlock:", self, self, 1, v27);

            objc_destroyWeak(&v31);
            objc_destroyWeak(&location);
          }

        }
      }

    }
  }

}

- (void)contactPicker:(id)a3 didCompleteWithNewContact:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  if (a4)
  {
    v7 = a4;
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadContacts");

    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectContact:animated:scrollPosition:", v7, 1, 1);

    -[CNContactNavigationController showCardForContact:animated:](self, "showCardForContact:animated:", v7, 1);
  }
}

- (id)nextResponderForContactListViewController:(id)a3
{
  void *v4;
  void *v5;

  if (-[CNContactNavigationController isPresentedContactViewControllerVisible](self, "isPresentedContactViewControllerVisible", a3))
  {
    -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)didUpdateLimitedAccessSelection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CNContactNavigationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactNavigationController:didUpdateLimitedAccessSelection:", self, v14);

    if (-[CNContactNavigationController limitedAccessPickerType](self, "limitedAccessPickerType") == 2)
    {
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightBarButtonItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v14, "count");
      -[CNContactListViewController originalDataSource](self->_contactListViewController, "originalDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contacts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", v11 != objc_msgSend(v13, "count"));

    }
  }

}

- (void)didFinishLimitedAccessSelection
{
  -[CNContactNavigationController done:](self, "done:", 0);
}

- (void)didResetLimitedAccessSelectionTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didResetLimitedAccessSelectionTo:", v4);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CNContactNavigationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "contactNavigationController:shouldPerformDefaultActionForContactProperty:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldDisplayAddNewContactRow");

  v9 = objc_msgSend(v15, "mode");
  v10 = v9;
  if (v8 && v9 == 3)
  {
    -[CNContactNavigationController contactViewController:didCompleteWithNewContactFromPickerNewContactRow:](self, "contactViewController:didCompleteWithNewContactFromPickerNewContactRow:", v15, v6);
  }
  else
  {
    v11 = objc_msgSend(v15, "mode");
    if (v6 && v11 == 3)
    {
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadContacts");

      -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", v6, 0, 1, 0, 0, 1);
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectContact:animated:scrollPosition:", v6, 1, 0);

    }
    if (v10 == 3 || !-[CNContactNavigationController allowsCardEditing](self, "allowsCardEditing"))
    {
      objc_msgSend(v15, "parentViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }

}

- (void)contactViewController:(id)a3 didCompleteWithNewContactFromPickerNewContactRow:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  if (v14)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForSelectedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectContact:animated:scrollPosition:", v14, 0, 1);
LABEL_6:

      goto LABEL_7;
    }
    -[CNContactNavigationController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[CNContactNavigationController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactNavigationController:didCompleteWithNewContact:", self, v14);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadContacts");

  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDidDeleteContact:", 1);

  -[CNContactNavigationController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactNavigationController:didDeleteContact:", self, v10);

  }
}

- (void)accountsAndGroupsViewControllerDidFinish:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[CNContactNavigationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showContactList");
  }
  else
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isViewLoaded") & 1) != 0)
    {
      -[CNContactNavigationController contactListViewController](self, "contactListViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
    if (-[CNContactNavigationController isSinglePickerOnVisionOS](self, "isSinglePickerOnVisionOS"))
    {
      v11 = -[CNContactNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
      goto LABEL_11;
    }
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
  }

LABEL_11:
  objc_msgSend(v15, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startSearching");

  }
}

- (void)accountsAndGroupsViewControllerDidChangeList:(id)a3
{
  -[CNContactListViewController scrollToTopAnimated:](self->_contactListViewController, "scrollToTopAnimated:", 0);
}

- (void)accountsAndGroupsViewControllerDidUpdateSelection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  CNContactAsyncDataSource *v14;
  void *v15;
  CNContactAsyncDataSource *v16;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serverFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cancelSearch:", 0);

    -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
      v16 = (CNContactAsyncDataSource *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController dataSource](self->_contactListViewController, "dataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactFormatter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactAsyncDataSource setContactFormatter:](v16, "setContactFormatter:", v24);

      -[CNContactListViewController setDataSource:](self->_contactListViewController, "setDataSource:", v16);
    }
    else
    {
      -[CNContactListViewController dataSource](self->_contactListViewController, "dataSource");
      v16 = (CNContactAsyncDataSource *)objc_claimAutoreleasedReturnValue();
    }
    -[CNContactAsyncDataSource filter](v16, "filter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "limitedAccessIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLimitedAccessIdentifiers:", v26);

    -[CNContactAsyncDataSource filter](v16, "filter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLimitedAccessFilterMode:", objc_msgSend(v27, "limitedAccessFilterMode"));

    -[CNContactAsyncDataSource setFilter:](v16, "setFilter:", v7);
    -[CNContactAsyncDataSource delegate](v16, "delegate");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_13;
    v29 = (void *)v28;
    if ((-[CNContactListViewController isViewLoaded](self->_contactListViewController, "isViewLoaded") & 1) != 0)
    {
      -[CNContactListViewController view](self->_contactListViewController, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "window");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
LABEL_13:
        -[CNContactAsyncDataSource reload](v16, "reload");
        -[CNContactListViewController setDataSource:](self->_contactListViewController, "setDataSource:", v16);
LABEL_16:
        -[CNContactAsyncDataSource store](v16, "store");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "saveToPreferencesWithContactStore:", v32);

        -[CNContactNavigationController setNonServerDataSource:](self, "setNonServerDataSource:", 0);
        goto LABEL_17;
      }
    }
    else
    {

    }
    -[CNContactAsyncDataSource reloadAsynchronously](v16, "reloadAsynchronously");
    goto LABEL_16;
  }
  -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CNContactNavigationController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController dataSource](self, "dataSource");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactNavigationController.m"), 1552, CFSTR("Datasource %@ is not of expected type: CNContactStoreDataSource"), v37);

    }
    -[CNContactNavigationController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController setNonServerDataSource:](self, "setNonServerDataSource:", v13);

  }
  v14 = [CNContactAsyncDataSource alloc];
  -[CNContactNavigationController contactStore](self, "contactStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNContactAsyncDataSource initWithStore:](v14, "initWithStore:", v15);

  -[CNContactListViewController dataSource](self->_contactListViewController, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactFormatter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAsyncDataSource setContactFormatter:](v16, "setContactFormatter:", v18);

  -[CNContactAsyncDataSource setFilter:](v16, "setFilter:", v9);
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAsyncDataSource setAllKeysToFetchForTransientContacts:](v16, "setAllKeysToFetchForTransientContacts:", v20);

  -[CNContactAsyncDataSource reload](v16, "reload");
  -[CNContactListViewController setDataSource:](self->_contactListViewController, "setDataSource:", v16);
LABEL_17:

  -[CNContactNavigationController delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_respondsToSelector();

  if ((v34 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contactNavigationControllerClearContactSelection:", self);

  }
  -[CNContactListViewController setDelegate:](self->_contactListViewController, "setDelegate:", self);
  -[CNContactNavigationController updateNavigationButtonsAnimated:viewWillAppear:](self, "updateNavigationButtonsAnimated:viewWillAppear:", 0, 1);

}

- (void)accountsAndGroupsViewControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactNavigationController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactNavigationControllerDidCancel:", self);

  }
}

- (void)accountsAndGroupsViewControllerDidGoBack:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactNavigationController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactNavigationControllerDidGoBack:", self);

  }
}

- (BOOL)accountsAndGroupsViewController:(id)a3 shouldEnableItemWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[CNContactNavigationController contactPickerTargetGroupIdentifier](self, "contactPickerTargetGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7 ^ 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CNContactNavigationController navigationBar](self, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = width / 3.0;
  objc_msgSend(v6, "_setRequestedMaxBackButtonWidth:", v7);

  -[CNContactNavigationController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setRequestedMaxBackButtonWidth:", v7);

}

- (BOOL)isDisplayingAddNewContactViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;

  -[CNContactNavigationController addContactPresenter](self, "addContactPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v5, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
      v9 = objc_msgSend(v8, "mode") == 3;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)popToContactListAndSaveChanges:(BOOL)a3
{
  -[CNContactNavigationController popToContactListAndSaveChanges:animated:](self, "popToContactListAndSaveChanges:animated:", a3, 0);
}

- (void)popToContactListAndSaveChanges:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  BOOL v17;

  v4 = a4;
  v5 = a3;
  -[CNContactNavigationController addContactPresenter](self, "addContactPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!v5)
      goto LABEL_3;
LABEL_11:
    -[CNContactNavigationController reusableContactViewController](self, "reusableContactViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveChanges");

    if (v8)
      goto LABEL_4;
LABEL_12:
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[CNContactNavigationController popToViewController:animated:](self, "popToViewController:animated:", v14, v4);

    goto LABEL_13;
  }
  -[CNContactNavigationController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_11;
LABEL_3:
  if (!v8)
    goto LABEL_12;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "contentViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "saveChanges");

      }
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__CNContactNavigationController_popToContactListAndSaveChanges_animated___block_invoke;
  v16[3] = &unk_1E204C4D0;
  v16[4] = self;
  v17 = v4;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, v16);
LABEL_13:

}

- (void)showAllContactsList
{
  -[CNContactNavigationController showAllContactsListAnimated:](self, "showAllContactsListAnimated:", 1);
}

- (void)showAllContactsListAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v3 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isViewLoaded") & 1) != 0)
  {
    -[CNContactNavigationController contactListViewController](self, "contactListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      return;
  }
  else
  {

  }
  -[CNContactNavigationController viewControllers](self, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (v11)
  {
    -[CNContactNavigationController popToContactListAndSaveChanges:animated:](self, "popToContactListAndSaveChanges:animated:", 1, v3);
  }
  else
  {
    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectAllContacts");

    -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController accountsAndGroupsViewControllerDidFinish:](self, "accountsAndGroupsViewControllerDidFinish:", v13);

  }
}

- (void)searchForString:(id)a3
{
  -[CNContactNavigationController searchForString:makeSearchBarFirstResponder:](self, "searchForString:makeSearchBarFirstResponder:", a3, 1);
}

- (void)searchForString:(id)a3 makeSearchBarFirstResponder:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CNContactNavigationController showAllContactsListAnimated:](self, "showAllContactsListAnimated:", 0);
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startSearchingForString:setSearchBarAsFirstResponder:", v6, v4);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = a3;
  objc_msgSend(v6, "setFrameStallSkipRequest:", 1);
  v8.receiver = self;
  v8.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController pushViewController:animated:](&v8, sel_pushViewController_animated_, v7, v4);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  v6.receiver = self;
  v6.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController popViewControllerAnimated:](&v6, sel_popViewControllerAnimated_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  CNContactNavigationController *v7;
  BOOL isEqual;
  BOOL v9;
  BOOL v10;
  objc_super v12;

  v6 = a4;
  -[CNContactNavigationController firstResponder](self, "firstResponder");
  v7 = (CNContactNavigationController *)objc_claimAutoreleasedReturnValue();
  if (v7 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (isEqual = sel_isEqual(a3, sel_selectNextContact_),
        v9 = sel_isEqual(a3, sel_selectPreviousContact_),
        v10 = 0,
        !isEqual)
    && !v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)CNContactNavigationController;
    v10 = -[CNContactNavigationController canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
  }

  return v10;
}

- (void)beginSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginSearch:", v4);

}

- (void)cancelSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelSearch:", v4);

}

- (void)deleteContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteContact:", v4);

}

- (void)addContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  -[CNContactNavigationController splitViewController](self, "splitViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactNavigationController splitViewController](self, "splitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endEditing:", 1);

  }
  -[CNContactNavigationController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    if (-[CNContactNavigationController shouldShowAddToGroupPicker](self, "shouldShowAddToGroupPicker"))
    {
      -[CNContactNavigationController presentAddToGroupPickerWithSourceView:](self, "presentAddToGroupPickerWithSourceView:", 0);
      return;
    }
    goto LABEL_8;
  }
  -[CNContactNavigationController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "contactNavigationControllerShouldAddNewContact:", self);

  if (v10)
LABEL_8:
    -[CNContactNavigationController executeAddContact](self, "executeAddContact");
}

- (void)editLimitedAccess
{
  void *v3;
  char v4;
  id v5;

  -[CNContactNavigationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactNavigationControllerShouldEditLimitedAccess:", self);

  }
}

- (BOOL)shouldShowAddToGroupPicker
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[CNContactNavigationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "filterShowsSingleGroup");
  else
    v6 = 0;

  return v6;
}

- (void)presentAddToGroupPickerWithSourceView:(id)a3
{
  CNContactPickerViewController *v4;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  double v33;
  id v34;

  v34 = a3;
  v4 = objc_alloc_init(CNContactPickerViewController);
  -[CNContactPickerViewController setDelegate:](v4, "setDelegate:", self);
  -[CNContactPickerViewController setMode:](v4, "setMode:", 2);
  -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController parentGroupForCurrentFilter](self, "parentGroupForCurrentFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController managedConfiguration](self, "managedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mdmUnauthorizedContactIdentifiersForTargetGroup:withManagedConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  -[CNContactNavigationController allContactIdentifiers](self, "allContactIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("!(identifier IN %@) AND !(identifier in %@)"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPredicateForEnablingContact:](v4, "setPredicateForEnablingContact:", v13);

  -[CNContactPickerViewController setShouldAllowSearchForMultiSelect:](v4, "setShouldAllowSearchForMultiSelect:", 1);
  -[CNContactPickerViewController setShouldDisplayAddNewContactRow:](v4, "setShouldDisplayAddNewContactRow:", 1);
  -[CNContactPickerViewController setOnlyRealContacts:](v4, "setOnlyRealContacts:", 1);
  -[CNContactNavigationController parentGroupForCurrentFilter](self, "parentGroupForCurrentFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setTargetGroupIdentifier:](v4, "setTargetGroupIdentifier:", v15);

  v16 = *MEMORY[0x1E0D13850];
  -[CNContactNavigationController parentGroupForCurrentFilter](self, "parentGroupForCurrentFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v18);

  if ((_DWORD)v16)
  {
    -[CNContactNavigationController parentGroupForCurrentFilter](self, "parentGroupForCurrentFilter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[CNUIStringUtilities composedCharacterCountForString:](CNUIStringUtilities, "composedCharacterCountForString:", v20) >= 31)
    {
      objc_msgSend(v20, "_cn_truncateAtLength:addEllipsisIfTrunctated:", 30, 1);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACTS_TO_GROUP_PROMPT-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v24, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPrompt:](v4, "setPrompt:", v25);

  }
  -[CNContactPickerViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 7);
  if (v34)
  {
    -[CNContactPickerViewController popoverPresentationController](v4, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceView:", v34);

    -[CNContactPickerViewController popoverPresentationController](v4, "popoverPresentationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", self);
  }
  else
  {
    -[CNContactNavigationController addContactBarButtonItem](self, "addContactBarButtonItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController popoverPresentationController](v4, "popoverPresentationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBarButtonItem:", v28);

    -[CNContactPickerViewController popoverPresentationController](v4, "popoverPresentationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPermittedArrowDirections:", 1);
  }

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "runningInContactsAppOniPad");

  if (v31)
  {
    -[CNContactNavigationController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    -[CNContactPickerViewController setPreferredContentSize:](v4, "setPreferredContentSize:", v33, 812.0);

  }
  -[CNContactNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v6;
  char v7;
  id v8;

  -[CNContactNavigationController delegate](self, "delegate", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showContactList");

  }
}

- (id)allContactIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[CNContactNavigationController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v5 = v7;

  }
  if (v5)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v5, "contacts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v25 = *(_QWORD *)v31;
      v24 = *MEMORY[0x1E0C96768];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v35 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v5;
          objc_msgSend(v5, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v11, 0, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);

          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v14, "linkedContacts");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v27 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v21);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v18);
          }

          v5 = v13;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

  }
  return v3;
}

- (void)executeAddContact
{
  id v3;

  -[CNContactNavigationController addContact:animated:](self, "addContact:animated:", 0, 1);
  -[CNContactNavigationController activityManager](self, "activityManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publishRequestToCreateContact:", 0);

}

- (id)targetGroupForNewContact
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[CNContactNavigationController contactPickerTargetGroupIdentifier](self, "contactPickerTargetGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || v6)
  {
    -[CNContactNavigationController parentGroupForCurrentFilter](self, "parentGroupForCurrentFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactPickerTargetGroupIdentifier](self, "contactPickerTargetGroupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupForGroupIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)parentGroupForCurrentFilter
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[CNContactNavigationController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v4 = v6;

  }
  if (v4)
  {
    objc_msgSend(v4, "filteredGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)targetContainerForNewContactWithTargetGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerForGroupIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CNContactNavigationController nonServerDataSource](self, "nonServerDataSource");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      -[CNContactNavigationController dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v5 = v11;

    }
    if (!v5)
    {
      v7 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v5, "filter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containerIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNContactNavigationController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "containerForContainerIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

LABEL_4:
  return v7;
}

- (void)selectNextContact:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[CNContactNavigationController shouldFlipDirectionWhenChangingSelectionWithKey:](self, "shouldFlipDirectionWhenChangingSelectionWithKey:", a3);
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visibleListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CNContactNavigationController showCardForContactBeforeIndexPath:](self, "showCardForContactBeforeIndexPath:", v8);
  else
    -[CNContactNavigationController showCardForContactAfterIndexPath:](self, "showCardForContactAfterIndexPath:", v8);

}

- (void)selectPreviousContact:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[CNContactNavigationController shouldFlipDirectionWhenChangingSelectionWithKey:](self, "shouldFlipDirectionWhenChangingSelectionWithKey:", a3);
  -[CNContactNavigationController contactListViewController](self, "contactListViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visibleListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CNContactNavigationController showCardForContactAfterIndexPath:](self, "showCardForContactAfterIndexPath:", v8);
  else
    -[CNContactNavigationController showCardForContactBeforeIndexPath:](self, "showCardForContactBeforeIndexPath:", v8);

}

- (BOOL)shouldFlipDirectionWhenChangingSelectionWithKey:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4E10]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4E28]);

  }
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (void)toggleGroupsPanel:(id)a3
{
  _BOOL4 v4;
  void *v5;
  char v6;
  id v7;

  -[CNContactNavigationController contactStyle](self, "contactStyle", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "usesInsetPlatterStyle"))
    goto LABEL_5;
  v4 = -[CNContactNavigationController shouldShowAccountsAndGroups](self, "shouldShowAccountsAndGroups");

  if (v4)
  {
    -[CNContactNavigationController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CNContactNavigationController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toggleGroupsPanel");
LABEL_5:

    }
  }
}

- (void)toggleEditContact:(id)a3
{
  void *v4;
  id v5;

  -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toggleEditing");

  }
}

- (void)observeOtherFacebookContactsAlert
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:suspensionBehavior:", self, sel_otherFacebookContactsAlertDidSelectActionWithNotification_, CFSTR("com.apple.ContactsUI.UserSelectedFacebookAction"), 0, 4);

}

- (void)otherFacebookContactsAlertDidSelectActionWithNotification:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.ContactsUI.UserSelectedFacebookAction"), 0);

  -[CNContactNavigationController facebookContactsAlertController](self, "facebookContactsAlertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  -[CNContactNavigationController setFacebookContactsAlertController:](self, "setFacebookContactsAlertController:", 0);
}

- (void)notifyOtherFacebookContactsAlertDidSelectAction
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.ContactsUI.UserSelectedFacebookAction"), 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.ContactsUI.UserSelectedFacebookAction"), 0, 0, 1);

}

- (id)userActivityRepresentingCurrentlyDisplayedContact
{
  void *v2;
  void *v3;
  void *v4;

  -[CNContactNavigationController presentedContactViewController](self, "presentedContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userActivityRepresentingGroupsView
{
  void *v2;
  void *v3;

  -[CNContactNavigationController accountsAndGroupsViewController](self, "accountsAndGroupsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (void)setAllowsCanceling:(BOOL)a3
{
  self->_allowsCanceling = a3;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSNumber)shouldShowAccountsAndGroupsCachedValue
{
  return self->_shouldShowAccountsAndGroupsCachedValue;
}

- (void)setShouldShowAccountsAndGroupsCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_shouldShowAccountsAndGroupsCachedValue, a3);
}

- (void)setAccountsAndGroupsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_accountsAndGroupsViewController, a3);
}

- (int64_t)leftButtonBehavior
{
  return self->_leftButtonBehavior;
}

- (void)setLeftButtonBehavior:(int64_t)a3
{
  self->_leftButtonBehavior = a3;
}

- (int64_t)rightButtonBehavior
{
  return self->_rightButtonBehavior;
}

- (void)setRightButtonBehavior:(int64_t)a3
{
  self->_rightButtonBehavior = a3;
}

- (void)setNonServerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_nonServerDataSource, a3);
}

- (UIAlertController)facebookContactsAlertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_facebookContactsAlertController);
}

- (void)setFacebookContactsAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_facebookContactsAlertController, a3);
}

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- (void)setMailButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_mailButtonItem, a3);
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (void)setIgnoresMapsData:(BOOL)a3
{
  self->_ignoresMapsData = a3;
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (unint64_t)limitedAccessContactCaption
{
  return self->_limitedAccessContactCaption;
}

- (void)setLimitedAccessContactCaption:(unint64_t)a3
{
  self->_limitedAccessContactCaption = a3;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (UIBarButtonItem)addContactBarButtonItem
{
  return self->_addContactBarButtonItem;
}

- (void)setHideMailToGroupButton:(BOOL)a3
{
  self->_hideMailToGroupButton = a3;
}

- (NSString)contactPickerTargetGroupIdentifier
{
  return self->_contactPickerTargetGroupIdentifier;
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactPickerTargetGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addContactBarButtonItem, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_mailButtonItem, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_destroyWeak((id *)&self->_facebookContactsAlertController);
  objc_storeStrong((id *)&self->_addKeyCommand, 0);
  objc_destroyWeak((id *)&self->_presentedContactViewController);
  objc_storeStrong((id *)&self->_nonServerDataSource, 0);
  objc_storeStrong((id *)&self->_accountsAndGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_accountsAndGroupsViewController, 0);
  objc_storeStrong((id *)&self->_shouldShowAccountsAndGroupsCachedValue, 0);
  objc_storeStrong((id *)&self->_reusableContactViewController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactStyle, 0);
  objc_storeStrong((id *)&self->_contactListViewController, 0);
}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressBook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_2;
  v5[3] = &unk_1E204A758;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 40);
  v4 = (id)objc_msgSend(v3, "performAsynchronousWorkWithInvalidatedAddressBook:", v5);

}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD);

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "observeOtherFacebookContactsAlert");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF5D68]), "initWithAddressBook:", a2);
  if (objc_msgSend(v6, "canMergeFacebookContacts") && *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_3;
    v10[3] = &unk_1E204F098;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    v13 = v5;
    objc_msgSend(v7, "performBlock:", v10);

  }
  else
  {
    v5[2](v5);
  }

}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_3(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int8x16_t v28;
  int8x16_t v29;
  void *v30;
  _QWORD v31[4];
  int8x16_t v32;
  id v33;
  _QWORD v34[4];
  int8x16_t v35;
  id v36;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("KEEP_FACEBOOK_CONTACTS_ALERT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0D13848];
  objc_msgSend(a1[4], "destinationDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  v7 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KEEP_FACEBOOK_CONTACTS_ON_DEVICE_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1[4], "facebookContactsCount");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KEEP_FACEBOOK_CONTACTS_WITH_ACCOUNT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(a1[4], "facebookContactsCount");
    objc_msgSend(a1[4], "destinationDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v10, v15, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E20507A8, CFSTR("Localized"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v3;
  v20 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_4;
  v34[3] = &unk_1E204CB30;
  v28 = *((int8x16_t *)a1 + 2);
  v21 = (id)v28.i64[0];
  v35 = vextq_s8(v28, v28, 8uLL);
  v36 = a1[6];
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 2, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v22);

  v23 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("KEEP"), &stru_1E20507A8, CFSTR("Localized"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v20;
  v31[1] = 3221225472;
  v31[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_6;
  v31[3] = &unk_1E204CB30;
  v29 = *((int8x16_t *)a1 + 2);
  v26 = (id)v29.i64[0];
  v32 = vextq_s8(v29, v29, 8uLL);
  v33 = a1[6];
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v27);

  objc_msgSend(a1[5], "setFacebookContactsAlertController:", v16);
  objc_msgSend(a1[5], "presentViewController:animated:completion:", v16, 1, 0);

}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_4(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "notifyOtherFacebookContactsAlertDidSelectAction");
  objc_msgSend(a1[4], "backgroundScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_5;
  v3[3] = &unk_1E204F9B0;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "performBlock:", v3);

}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_6(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "notifyOtherFacebookContactsAlertDidSelectAction");
  objc_msgSend(a1[4], "backgroundScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_7;
  v3[3] = &unk_1E204F9B0;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "performBlock:", v3);

}

uint64_t __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mergeFacebookContacts");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteFacebookContacts");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73__CNContactNavigationController_popToContactListAndSaveChanges_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "contactListViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popToViewController:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

void __65__CNContactNavigationController_contactPicker_didSelectContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 == 2)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "groupsAndContainersSaveManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "addContacts:toGroup:inContainer:moveWasAuthorized:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

    WeakRetained = v7;
  }

}

void __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contactNavigationController:shouldShowCardForContact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    if ((v6 & 1) != 0)
LABEL_15:
      objc_msgSend(*(id *)(a1 + 32), "showCardForContact:animated:scrollToContact:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v4, "splitViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCollapsed");

    if ((v8 & 1) != 0)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 32), "reusableContactViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "splitViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "displayMode") == 3)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "splitViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "displayMode") == 5)
      {
        v13 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "splitViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v15, "displayMode") == 6;

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "reusableContactViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v11 || v13 || !v20)
      goto LABEL_15;
  }
}

uint64_t __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  if (!a3)
  {
    v10 = v5;
    objc_msgSend(v5, "mapItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v10;
    if (v7)
    {
      objc_msgSend(v10, "mapItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setMapItem:contact:", v9, *(_QWORD *)(a1 + 40));
      v5 = v10;
    }
  }

}

BOOL __78__CNContactNavigationController_updateNavigationButtonsInSearchMode_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mailButtonItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

void __67__CNContactNavigationController_contactStyleCurrentStyleDidChange___block_invoke(uint64_t a1)
{
  id v2;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setContactStyle:", v2);

}

uint64_t __52__CNContactNavigationController_firstVisibleContact__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexPath");
}

+ (void)moveViewController:(id)a3 toParent:(id)a4
{
  id v5;
  id v6;
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
  id v30;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "willMoveToParentViewController:", 0);
  objc_msgSend(v6, "removeFromParentViewController");
  objc_msgSend(v5, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", v5);
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v5, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v5, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v5, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  objc_msgSend(v5, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  objc_msgSend(v6, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(v6, "title");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:", v30);
}

@end
