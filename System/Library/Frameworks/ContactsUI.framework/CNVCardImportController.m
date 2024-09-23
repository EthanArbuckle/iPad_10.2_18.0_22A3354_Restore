@implementation CNVCardImportController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNVCardImportController)initWithContactStore:(id)a3 presentationDelegate:(id)a4
{
  return -[CNVCardImportController initWithContactStore:presentationDelegate:targetGroup:targetContainer:](self, "initWithContactStore:presentationDelegate:targetGroup:targetContainer:", a3, a4, 0, 0);
}

- (CNVCardImportController)initWithContactStore:(id)a3 presentationDelegate:(id)a4 targetGroup:(id)a5 targetContainer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNVCardImportController *v15;
  CNVCardImportController *v16;
  CNQueue *v17;
  CNQueue *receivedContactsQueue;
  CNVCardImportController *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNVCardImportController;
  v15 = -[CNVCardImportController init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_presentationDelegate, v12);
    objc_storeStrong((id *)&v16->_contactStore, a3);
    v17 = (CNQueue *)objc_alloc_init(MEMORY[0x1E0D13B40]);
    receivedContactsQueue = v16->_receivedContactsQueue;
    v16->_receivedContactsQueue = v17;

    objc_storeStrong((id *)&v16->_targetGroup, a5);
    objc_storeStrong((id *)&v16->_targetContainer, a6);
    v19 = v16;
  }

  return v16;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  CNUIGroupsAndContainersSaveManager *groupsAndContainersSaveManager;
  CNUIGroupsAndContainersSaveManager *v4;
  void *v5;
  CNUIGroupsAndContainersSaveManager *v6;
  CNUIGroupsAndContainersSaveManager *v7;

  groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  if (!groupsAndContainersSaveManager)
  {
    v4 = [CNUIGroupsAndContainersSaveManager alloc];
    -[CNVCardImportController contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:](v4, "initWithContactStore:", v5);
    v7 = self->_groupsAndContainersSaveManager;
    self->_groupsAndContainersSaveManager = v6;

    groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  }
  return groupsAndContainersSaveManager;
}

- (CNContainer)targetContainer
{
  CNContainer *targetContainer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  targetContainer = self->_targetContainer;
  if (targetContainer)
    return targetContainer;
  v5 = (void *)MEMORY[0x1E0C972C0];
  -[CNVCardImportController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultContainerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContainersWithIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVCardImportController contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containersMatchingPredicate:error:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContainer *)v12;
}

- (id)contactsFromURL:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = 0;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
LABEL_3:
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");
LABEL_4:
  -[CNVCardImportController presentEnqueueResultsUIForResultContacts:](self, "presentEnqueueResultsUIForResultContacts:", v7);

  return v7;
}

- (void)presentEnqueueResultsUIForResultContacts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!a3)
  {
    -[CNVCardImportController presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0DC3450];
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unable to open contact card."), &stru_1E20507A8, CFSTR("Localized"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[CNVCardImportController presentationDelegate](self, "presentationDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vCardImportController:presentViewController:animated:", self, v9, 1);

    }
  }
}

- (BOOL)enqueueContactsAtURL:(id)a3
{
  void *v4;
  char v5;

  -[CNVCardImportController contactsFromURL:](self, "contactsFromURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))();
  if ((v5 & 1) == 0)
    -[CNVCardImportController enqueueContacts:](self, "enqueueContacts:", v4);

  return v5 ^ 1;
}

- (void)enqueueContacts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueue:", v8);

  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
    -[CNVCardImportController processNextContacts](self, "processNextContacts");
  objc_sync_exit(v4);

}

- (id)dequeueContacts
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)processNextContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peek");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    -[CNVCardImportController delegate](self, "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[CNVCardImportController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[CNVCardImportController delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "vCardImportControllerDidCompleteQueue:", self);

        -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v9);
        -[CNVCardImportController setReceivedContactsQueue:](self, "setReceivedContactsQueue:", 0);
        objc_sync_exit(v9);

      }
    }
  }
  else
  {
    -[CNVCardImportController presentImportUIForContacts:](self, "presentImportUIForContacts:", v10);
  }

}

- (void)presentImportUIForContacts:(id)a3
{
  void *v4;
  CNMultipleUnknownContactsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNMultipleUnknownContactsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  if (objc_msgSend(v21, "count") == 1)
  {
    objc_msgSend(v21, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v4);
    v5 = (CNMultipleUnknownContactsViewController *)objc_claimAutoreleasedReturnValue();

    -[CNVCardImportController contactStore](self, "contactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController setContactStore:](v5, "setContactStore:", v6);

    -[CNMultipleUnknownContactsViewController setDelegate:](v5, "setDelegate:", self);
    -[CNVCardImportController targetGroup](self, "targetGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController setParentGroup:](v5, "setParentGroup:", v7);

    -[CNVCardImportController targetContainer](self, "targetContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController setParentContainer:](v5, "setParentContainer:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_saveUnknownPersons_);
    -[CNMultipleUnknownContactsViewController navigationItem](v5, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

  }
  else
  {
    v11 = [CNMultipleUnknownContactsViewController alloc];
    -[CNVCardImportController targetGroup](self, "targetGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardImportController targetContainer](self, "targetContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CNMultipleUnknownContactsViewController initWithContacts:targetGroup:targetContainer:](v11, "initWithContacts:targetGroup:targetContainer:", v21, v12, v13);

    -[CNVCardImportController contactStore](self, "contactStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController setContactStore:](v5, "setContactStore:", v14);

    -[CNMultipleUnknownContactsViewController setDelegate:](v5, "setDelegate:", self);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelModalUnknownPersons_);
  -[CNMultipleUnknownContactsViewController navigationItem](v5, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftBarButtonItem:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(v17, "setModalPresentationStyle:", 2);
  -[CNVCardImportController setPresentedViewController:](self, "setPresentedViewController:", v17);
  -[CNVCardImportController presentationDelegate](self, "presentationDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "vCardImportController:presentViewController:animated:", self, v17, 1);

}

- (void)dismissContactsAndPresentNext
{
  void *v3;
  _QWORD v4[5];

  -[CNVCardImportController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CNVCardImportController_dismissContactsAndPresentNext__block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)authorizeAndSaveUnknownPersons
{
  void *v3;
  int v4;

  -[CNVCardImportController authorizationCheckForSavingReceivedContacts](self, "authorizationCheckForSavingReceivedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPromptForPasscodeAuthorization");

  if (v4)
    -[CNVCardImportController showEditAuthorizationPane:animated:](self, "showEditAuthorizationPane:animated:", 0, 1);
  else
    -[CNVCardImportController saveUnknownPersonsAndMarkSaveWithAuthorizationResult:](self, "saveUnknownPersonsAndMarkSaveWithAuthorizationResult:", 0);
}

- (id)authorizationCheckForSavingReceivedContacts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D13CB8]);
  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peek");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardImportController targetContainer](self, "targetContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithContact:parentContainer:ignoresParentalRestrictions:", v6, v7, 0);

  return v8;
}

- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CNUIEditAuthorizationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNUIEditAuthorizationController);
  -[CNVCardImportController setEditAuthorizationController:](self, "setEditAuthorizationController:", v7);

  -[CNVCardImportController editAuthorizationController](self, "editAuthorizationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CNVCardImportController editAuthorizationController](self, "editAuthorizationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSender:", v6);

  -[CNVCardImportController editAuthorizationController](self, "editAuthorizationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnimated:", v4);

  -[CNVCardImportController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardImportController editAuthorizationController](self, "editAuthorizationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGuardedViewController:", v11);

  -[CNVCardImportController editAuthorizationController](self, "editAuthorizationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentAuthorizationUI");

}

- (void)saveUnknownPersonsAndMarkSaveWithAuthorizationResult:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  -[CNVCardImportController receivedContactsQueue](self, "receivedContactsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peek");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    objc_msgSend(v17, "_cn_map:", &__block_literal_global_36208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardImportController authorizationCheckForSavingReceivedContacts](self, "authorizationCheckForSavingReceivedContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldBypassRestrictionsGivenAuthorizationResult:", a3);

    -[CNVCardImportController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardImportController targetGroup](self, "targetGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardImportController targetContainer](self, "targetContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addContacts:toGroup:inContainer:moveWasAuthorized:", v6, v10, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "saveDidSucceed"))
    {
      -[CNVCardImportController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[CNVCardImportController delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addedContacts");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "vCardImportController:didSaveContacts:", self, v16);

      }
    }

  }
  -[CNVCardImportController dismissContactsAndPresentNext](self, "dismissContactsAndPresentNext");

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[CNVCardImportController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CNVCardImportController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "vCardImportController:didSaveContacts:", self, v11);

    }
  }
  -[CNVCardImportController dismissContactsAndPresentNext](self, "dismissContactsAndPresentNext");

}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  NSObject *v6;
  uint8_t v7[16];

  -[CNVCardImportController setEditAuthorizationController:](self, "setEditAuthorizationController:", 0);
  if (a4 == 2)
  {
    -[CNVCardImportController saveUnknownPersonsAndMarkSaveWithAuthorizationResult:](self, "saveUnknownPersonsAndMarkSaveWithAuthorizationResult:", 2);
  }
  else
  {
    CNUILogContactList();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "vCard not imported, user is not authorized to edit contacts", v7, 2u);
    }

    -[CNVCardImportController dismissContactsAndPresentNext](self, "dismissContactsAndPresentNext");
  }
}

- (CNVCardImportControllerPresentationDelegate)presentationDelegate
{
  return (CNVCardImportControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (CNVCardImportControllerDelegate)delegate
{
  return (CNVCardImportControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNGroup)targetGroup
{
  return self->_targetGroup;
}

- (void)setTargetGroup:(id)a3
{
  objc_storeStrong((id *)&self->_targetGroup, a3);
}

- (void)setTargetContainer:(id)a3
{
  objc_storeStrong((id *)&self->_targetContainer, a3);
}

- (CNQueue)receivedContactsQueue
{
  return self->_receivedContactsQueue;
}

- (void)setReceivedContactsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_receivedContactsQueue, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedViewController, a3);
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setEditAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_editAuthorizationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_receivedContactsQueue, 0);
  objc_storeStrong((id *)&self->_targetContainer, 0);
  objc_storeStrong((id *)&self->_targetGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

id __80__CNVCardImportController_saveUnknownPersonsAndMarkSaveWithAuthorizationResult___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

uint64_t __56__CNVCardImportController_dismissContactsAndPresentNext__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "dequeueContacts");
  return objc_msgSend(*(id *)(a1 + 32), "processNextContacts");
}

@end
