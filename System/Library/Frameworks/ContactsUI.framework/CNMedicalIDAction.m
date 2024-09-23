@implementation CNMedicalIDAction

- (void)performActionWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D13A38];
  v8 = a3;
  objc_msgSend(v4, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled:", 10);

  if (v7)
    -[CNMedicalIDAction presentMedicalIDViewControllerWithSender:](self, "presentMedicalIDViewControllerWithSender:", v8);
  else
    -[CNMedicalIDAction presentHKMedicalIDViewControllerWithSender:](self, "presentHKMedicalIDViewControllerWithSender:", v8);

}

- (void)presentHKMedicalIDViewControllerWithSender:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (-[CNMedicalIDAction medicalIDActionType](self, "medicalIDActionType") == 2)
  {
    v5 = objc_alloc_init((Class)getHKMedicalIDViewControllerClass[0]());
  }
  else
  {
    if (-[CNMedicalIDAction medicalIDActionType](self, "medicalIDActionType") != 1
      && -[CNMedicalIDAction medicalIDActionType](self, "medicalIDActionType") != 3)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = (id)objc_msgSend(objc_alloc((Class)getHKMedicalIDViewControllerClass[0]()), "initInEditMode:", 1);
  }
  v6 = v5;
LABEL_7:
  -[CNMedicalIDAction healthStoreManager](self, "healthStoreManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[CNMedicalIDAction healthStoreManager](self, "healthStoreManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke;
  v14[3] = &unk_1E2048FD0;
  objc_copyWeak(&v18, &location);
  v10 = v6;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v12 = v4;
  v17 = v12;
  v13 = (id)objc_msgSend(v9, "registerMedicalIDDataHandler:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)presentMedicalIDViewControllerWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend((Class)getMIUIDisplayConfigurationClass[0](), "standardConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNMedicalIDAction medicalIDActionType](self, "medicalIDActionType") != 1
    && -[CNMedicalIDAction medicalIDActionType](self, "medicalIDActionType") != 3)
  {
    objc_msgSend(v5, "setIsEditingAvailable:", 0);
  }
  if (-[CNMedicalIDAction medicalIDActionType](self, "medicalIDActionType") == 3)
    objc_msgSend(v5, "setIsDeletionAvailable:", 1);
  -[CNMedicalIDAction healthStoreManager](self, "healthStoreManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[CNMedicalIDAction healthStoreManager](self, "healthStoreManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke;
  v13[3] = &unk_1E2048FD0;
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v14 = v9;
  v10 = v5;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  v12 = (id)objc_msgSend(v8, "registerMedicalIDDataHandler:", v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)dismissMedicalID
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMedicalIDAction medicalIDNavigationController](self, "medicalIDNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action:dismissViewController:sender:", self, v5, self);

  -[CNMedicalIDAction setMedicalIDNavigationController:](self, "setMedicalIDNavigationController:", 0);
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWasCanceled:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(v4, "medicalIDStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CNMedicalIDAction_medicalIDViewControllerDidDelete___block_invoke;
  v9[3] = &unk_1E2048FF8;
  v9[4] = self;
  objc_msgSend(v5, "deleteMedicalIDDataWithCompletion:", v9);

  -[CNContactAction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v8, self);
}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);
}

- (int64_t)medicalIDActionType
{
  return self->_medicalIDActionType;
}

- (void)setMedicalIDActionType:(int64_t)a3
{
  self->_medicalIDActionType = a3;
}

- (CNHealthStoreManager)healthStoreManager
{
  return self->_healthStoreManager;
}

- (void)setHealthStoreManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthStoreManager, a3);
}

- (UINavigationController)medicalIDNavigationController
{
  return self->_medicalIDNavigationController;
}

- (void)setMedicalIDNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, 0);
  objc_storeStrong((id *)&self->_healthStoreManager, 0);
}

void __54__CNMedicalIDAction_medicalIDViewControllerDidDelete___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v8 = a3;
    v3 = objc_opt_class();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNMedicalIDAction.m", 145, 3, CFSTR("[%@] Failed to delete Medical ID: %@"), v4, v5, v6, v7, v3);

  }
}

void __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "healthStoreManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterHandlerForToken:", v6);

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke_2;
  v13[3] = &unk_1E2048FA8;
  v14 = a1[4];
  v15 = v5;
  v16 = a1[5];
  v17 = WeakRetained;
  v18 = a1[6];
  v12 = v5;
  objc_msgSend(v11, "performBlock:", v13);

}

void __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc((Class)getMIUIMedicalIDViewControllerClass[0]()), "initWithHealthStore:medicalIDData:displayConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  objc_msgSend(*(id *)(a1 + 56), "setMedicalIDNavigationController:", v2);

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 56), sel_dismissMedicalID);
  objc_msgSend(v8, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(*(id *)(a1 + 56), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 56);
  objc_msgSend(v6, "medicalIDNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action:presentViewController:sender:", v6, v7, *(_QWORD *)(a1 + 64));

}

void __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "healthStoreManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterHandlerForToken:", v6);

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke_2;
  v13[3] = &unk_1E2048FA8;
  v14 = v5;
  v15 = WeakRetained;
  v16 = a1[4];
  v17 = a1[5];
  v18 = a1[6];
  v12 = v5;
  objc_msgSend(v11, "performBlock:", v13);

}

void __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = *(id *)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "healthStoreManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createMedicalIDFromContact:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 48), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setAllowsEditing:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setShowsDismissButton:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setMedicalID:", v6);
  objc_msgSend(*(id *)(a1 + 48), "setHealthStore:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 40), "medicalIDActionType") == 3)
    objc_msgSend(*(id *)(a1 + 48), "setShowsDeleteButton:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action:presentViewController:sender:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 64));

}

@end
