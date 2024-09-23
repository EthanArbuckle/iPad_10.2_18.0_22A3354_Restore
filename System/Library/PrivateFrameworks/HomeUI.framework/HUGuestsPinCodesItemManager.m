@implementation HUGuestsPinCodesItemManager

- (HUGuestsPinCodesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPinCodeManager_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUGuestsPinCodesItemManager.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUGuestsPinCodesItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUGuestsPinCodesItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPinCodeManager_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUGuestsPinCodesItemManager.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUGuestsPinCodesItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUGuestsPinCodesItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4
{
  id v7;
  HUGuestsPinCodesItemManager *v8;
  HUGuestsPinCodesItemManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUGuestsPinCodesItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a4, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_pinCodeManager, a3);

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31990]);
  -[HUGuestsPinCodesItemManager pinCodeManager](self, "pinCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithHome:", v7);
  -[HUGuestsPinCodesItemManager setUserItemProvider:](self, "setUserItemProvider:", v8);

  -[HUGuestsPinCodesItemManager userItemProvider](self, "userItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludeGuestUsers:", 1);

  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v15, &location);
  -[HUGuestsPinCodesItemManager userItemProvider](self, "userItemProvider", v14, 3221225472, __58__HUGuestsPinCodesItemManager__buildItemProvidersForHome___block_invoke, &unk_1E6F4DD60);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilter:", &v14);

  -[HUGuestsPinCodesItemManager userItemProvider](self, "userItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

uint64_t __58__HUGuestsPinCodesItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_userIsRestrictedGuest:", v7);

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    -[HUGuestsPinCodesItemManager userItemProvider](self, "userItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    -[HUGuestsPinCodesItemManager guestsListModule](self, "guestsListModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildSectionsWithDisplayedItems:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "na_flatMap:", &__block_literal_global_109);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

    -[HUGuestsPinCodesItemManager otherEcosystemListModule](self, "otherEcosystemListModule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buildSectionsWithDisplayedItems:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "na_flatMap:", &__block_literal_global_11_1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUGuestsSections"));
    objc_msgSend(v15, "setItems:", v5);
    v16 = (void *)MEMORY[0x1E0D314B0];
    v20[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filterSections:toDisplayedItems:", v17, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

uint64_t __64__HUGuestsPinCodesItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

uint64_t __64__HUGuestsPinCodesItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (id)_buildItemModulesForHome:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31640];
  v5 = a3;
  v6 = [v4 alloc];
  -[HUGuestsPinCodesItemManager pinCodeManager](self, "pinCodeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithItemUpdater:pinCodeManager:listType:home:forAccessory:", self, v7, 2, v5, 0);
  -[HUGuestsPinCodesItemManager setGuestsListModule:](self, "setGuestsListModule:", v8);

  v9 = objc_alloc(MEMORY[0x1E0D31640]);
  -[HUGuestsPinCodesItemManager pinCodeManager](self, "pinCodeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithItemUpdater:pinCodeManager:listType:home:forAccessory:", self, v10, 4, v5, 0);

  -[HUGuestsPinCodesItemManager setOtherEcosystemListModule:](self, "setOtherEcosystemListModule:", v11);
  -[HUGuestsPinCodesItemManager guestsListModule](self, "guestsListModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  -[HUGuestsPinCodesItemManager otherEcosystemListModule](self, "otherEcosystemListModule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUGuestsPinCodesItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUGuestsPinCodesItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUGuestsPinCodesItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUGuestsPinCodesItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HFPinCodeListModule)guestsListModule
{
  return self->_guestsListModule;
}

- (void)setGuestsListModule:(id)a3
{
  objc_storeStrong((id *)&self->_guestsListModule, a3);
}

- (HFPinCodeListModule)otherEcosystemListModule
{
  return self->_otherEcosystemListModule;
}

- (void)setOtherEcosystemListModule:(id)a3
{
  objc_storeStrong((id *)&self->_otherEcosystemListModule, a3);
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_otherEcosystemListModule, 0);
  objc_storeStrong((id *)&self->_guestsListModule, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end
