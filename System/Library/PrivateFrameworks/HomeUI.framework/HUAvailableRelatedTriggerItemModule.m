@implementation HUAvailableRelatedTriggerItemModule

- (HUAvailableRelatedTriggerItemModule)initWithItems:(id)a3 itemUpdater:(id)a4 home:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  HUAvailableRelatedTriggerItemModule *v13;
  HUAvailableRelatedTriggerItemModule *v14;
  uint64_t v15;
  NSMutableArray *waitingRequests;
  id v17;
  void *v18;
  id v19;
  HUAvailableRelatedTriggerItemModuleContext *v20;
  HUAvailableRelatedTriggerItemModuleContextProviding *context;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HUAvailableRelatedTriggerItemModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v24, sel_initWithItemUpdater_, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    waitingRequests = v14->_waitingRequests;
    v14->_waitingRequests = (NSMutableArray *)v15;

    objc_opt_class();
    v17 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19)
    {
      v20 = (HUAvailableRelatedTriggerItemModuleContext *)v17;

    }
    else
    {
      v20 = -[HUAvailableRelatedTriggerItemModuleContext initWithContext:]([HUAvailableRelatedTriggerItemModuleContext alloc], "initWithContext:", v17);
    }
    -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v20, "setEngineOptions:", -[HUAvailableRelatedTriggerItemModuleContext engineOptions](v20, "engineOptions") & 0xFFFFFFFFFFFFFFF8);
    -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v20, "setEngineOptions:", -[HUAvailableRelatedTriggerItemModuleContext engineOptions](v20, "engineOptions") | 2);
    context = v14->_context;
    v14->_context = (HUAvailableRelatedTriggerItemModuleContextProviding *)v20;

    v14->_enableNaturalLighting = 1;
    -[HUAvailableRelatedTriggerItemModule _updateRelatedItems:](v14, "_updateRelatedItems:", v10);
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "HUAvailableRelatedTriggerItemModule configured with items: %@", buf, 0xCu);
    }

  }
  return v14;
}

+ (id)defaultContext
{
  HUAvailableRelatedTriggerItemModuleContext *v2;

  v2 = objc_alloc_init(HUAvailableRelatedTriggerItemModuleContext);
  -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v2, "setEngineOptions:", 82);
  return v2;
}

- (id)activateItem:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HUAvailableTriggerItemActivationRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[4];
  HUAvailableTriggerItemActivationRequest *v18;

  v4 = a4;
  v6 = a3;
  v7 = -[HUAvailableTriggerItemActivationRequest initWithItem:active:]([HUAvailableTriggerItemActivationRequest alloc], "initWithItem:active:", v6, v4);

  -[HUAvailableRelatedTriggerItemModule activeRequest](self, "activeRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUAvailableRelatedTriggerItemModule waitingRequests](self, "waitingRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke;
    v17[3] = &unk_1E6F51040;
    v7 = v7;
    v18 = v7;
    objc_msgSend(v9, "na_filter:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke_2;
    v16[3] = &unk_1E6F51068;
    v16[4] = self;
    objc_msgSend(v11, "na_each:", v16);
    -[HUAvailableRelatedTriggerItemModule activeRequest](self, "activeRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = -[HUAvailableTriggerItemActivationRequest isSameAsRequest:](v7, "isSameAsRequest:", v12);

    if ((_DWORD)v10)
    {
      -[HUAvailableRelatedTriggerItemModule activeRequest](self, "activeRequest");
      v13 = v7;
      v7 = (HUAvailableTriggerItemActivationRequest *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUAvailableRelatedTriggerItemModule waitingRequests](self, "waitingRequests");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v7);
    }

  }
  else
  {
    -[HUAvailableRelatedTriggerItemModule _performRequest:](self, "_performRequest:", v7);
  }
  -[HUAvailableTriggerItemActivationRequest completionFuture](v7, "completionFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "completionFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "waitingRequests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v3);

}

- (id)activateAllSelectedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v46;
  BOOL v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[4];
  BOOL v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableUpdatesWithReason:", CFSTR("CommittingAllActive"));

  -[HFItemModule allItems](self, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_62);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_2;
  v57[3] = &unk_1E6F510B0;
  v57[4] = self;
  objc_msgSend(v6, "na_map:", v57);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModule naturalLightingItem](self, "naturalLightingItem");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 0x1E0C99000;
  if (v11)
  {
    v13 = (void *)v11;
    v50 = v8;
    -[HUAvailableRelatedTriggerItemModule naturalLightingItem](self, "naturalLightingItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if ((v17 & 1) != 0)
    {
      v8 = v50;
      v7 = MEMORY[0x1E0C809B0];
      v12 = 0x1E0C99000;
    }
    else
    {
      -[HUAvailableRelatedTriggerItemModule naturalLightingItem](self, "naturalLightingItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "latestResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v49, "integerValue") == 2;
      v20 = (void *)MEMORY[0x1E0C99E60];
      -[HUAvailableRelatedTriggerItemModule home](self, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hf_allLightProfilesSupportingNaturalLighting");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0C99E60];
      -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v27 = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_5;
      v55[3] = &unk_1E6F51100;
      v56 = v23;
      v48 = v23;
      objc_msgSend(v26, "na_flatMap:", v55);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x1E0C99E60];
      -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "na_flatMap:", &__block_literal_global_24_0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "allObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v27;
      v53[1] = 3221225472;
      v53[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_9;
      v53[3] = &__block_descriptor_33_e24__16__0__HMLightProfile_8l;
      v54 = v47;
      objc_msgSend(v32, "na_map:", v53);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "na_map:", &__block_literal_global_30_2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)MEMORY[0x1E0D519C0];
      v59[0] = v33;
      v59[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "na_arrayByFlattening");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "combineAllFutures:", v38);
      v39 = objc_claimAutoreleasedReturnValue();

      v7 = MEMORY[0x1E0C809B0];
      v12 = 0x1E0C99000uLL;
      v10 = (void *)v39;
      v8 = v50;
    }
  }
  v40 = (void *)MEMORY[0x1E0D519C0];
  v58[0] = v9;
  v58[1] = v10;
  objc_msgSend(*(id *)(v12 + 3360), "arrayWithObjects:count:", v58, 2, v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "combineAllFutures:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v7;
  v51[1] = 3221225472;
  v51[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_13;
  v51[3] = &unk_1E6F4C0D8;
  v51[4] = self;
  v52 = v6;
  v43 = v6;
  objc_msgSend(v42, "addCompletionBlock:", v51);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    if (objc_msgSend(v5, "isActive"))
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_3;
  v8[3] = &unk_1E6F4D600;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_activateItem:active:", *(_QWORD *)(a1 + 40), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_4;
  v7[3] = &unk_1E6F4C610;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_6;
  v6[3] = &unk_1E6F510D8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lightProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_26_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_supportsNaturalLighting"))
  {
    objc_msgSend(v2, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_10;
  v8[3] = &unk_1E6F511A8;
  v9 = v3;
  v10 = *(_BYTE *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNaturalLightingEnabled:shouldRetryOnFailure:completion:", *(unsigned __int8 *)(a1 + 40), 1, a2);
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_12;
  v7[3] = &unk_1E6F4C5E8;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "futureWithErrorOnlyHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasOnboardedForNaturalLightingWithCompletion:", a2);
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishCommitWithItems:updatesDelayReason:", *(_QWORD *)(a1 + 40), CFSTR("CommittingAllActive"));
}

- (void)_finishCommitWithItems:(id)a3 updatesDelayReason:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDisableUpdatesWithReason:", v6);

  objc_msgSend(v8, "na_each:", &__block_literal_global_33_1);
}

uint64_t __81__HUAvailableRelatedTriggerItemModule__finishCommitWithItems_updatesDelayReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetActiveToDefault");
}

- (id)itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemsToHideInSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRelatedItems:(id)a3
{
  NSArray *v5;
  NSArray *sensorCharacteristics;
  NSArray *actionBuilderFactories;
  NSArray *eventOptionsItems;
  NSArray *v9;

  v5 = (NSArray *)a3;
  if (self->_relatedItems != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_relatedItems, a3);
    sensorCharacteristics = self->_sensorCharacteristics;
    self->_sensorCharacteristics = 0;

    actionBuilderFactories = self->_actionBuilderFactories;
    self->_actionBuilderFactories = 0;

    eventOptionsItems = self->_eventOptionsItems;
    self->_eventOptionsItems = 0;

    v5 = v9;
  }

}

- (void)setAutomationItemIsLoading:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (self->_automationItemIsLoading != a3)
  {
    self->_automationItemIsLoading = a3;
    v5 = (void *)MEMORY[0x1E0D314C0];
    v6 = (void *)MEMORY[0x1E0C99E60];
    -[HUAvailableRelatedTriggerItemModule addAutomationItem](self, "addAutomationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setWithSafeObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestToUpdateItems:senderSelector:", v8, a2);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v11);

  }
}

- (NSArray)sensorCharacteristics
{
  NSArray *sensorCharacteristics;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[4];
  id v11;

  sensorCharacteristics = self->_sensorCharacteristics;
  if (!sensorCharacteristics)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke;
    v10[3] = &unk_1E6F51278;
    v11 = v4;
    v6 = v4;
    objc_msgSend(v5, "na_flatMap:", v10);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sensorCharacteristics;
    self->_sensorCharacteristics = v7;

    sensorCharacteristics = self->_sensorCharacteristics;
  }
  return sensorCharacteristics;
}

id __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_2;
  v7[3] = &unk_1E6F51250;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_3;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (NSArray)eventOptionsItems
{
  NSArray *eventOptionsItems;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[5];
  id v11;

  eventOptionsItems = self->_eventOptionsItems;
  if (!eventOptionsItems)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__HUAvailableRelatedTriggerItemModule_eventOptionsItems__block_invoke;
    v10[3] = &unk_1E6F512A0;
    v10[4] = self;
    v11 = v4;
    v6 = v4;
    objc_msgSend(v5, "na_filter:", v10);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_eventOptionsItems;
    self->_eventOptionsItems = v7;

    eventOptionsItems = self->_eventOptionsItems;
  }
  return eventOptionsItems;
}

uint64_t __56__HUAvailableRelatedTriggerItemModule_eventOptionsItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL4 v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v10;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "_itemClassSupportsEvents:", v3);
  v10 = 0;
  v5 = +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:outCharacteristicType:](HUCharacteristicEventOptionProvider, "hasOptionsForServiceVendingItem:outCharacteristicType:", v3, &v10);

  v6 = v10;
  v7 = v4 & (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6) ^ 1);
  if (v5)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (NSArray)actionBuilderFactories
{
  NSArray *actionBuilderFactories;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  actionBuilderFactories = self->_actionBuilderFactories;
  if (!actionBuilderFactories)
  {
    -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_42_0);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_actionBuilderFactories;
    self->_actionBuilderFactories = v5;

    actionBuilderFactories = self->_actionBuilderFactories;
  }
  return actionBuilderFactories;
}

id __61__HUAvailableRelatedTriggerItemModule_actionBuilderFactories__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2AC8C8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if (objc_msgSend(v4, "containsActions"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)serviceTypesSupportingAutomation
{
  void *v2;
  void *v3;
  void *v4;

  -[HUAvailableRelatedTriggerItemModule serviceTypes](self, "serviceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_serviceTypesHiddenFromScenesOrAutomations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setByRemovingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_91_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__HUAvailableRelatedTriggerItemModule_serviceTypes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_93);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __51__HUAvailableRelatedTriggerItemModule_serviceTypes__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceType");
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v4;
  NSSet *v5;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    -[HUAvailableRelatedTriggerItemModule _buildItemProviders](self, "_buildItemProviders");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("includedInAutomations"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySceneListTriggersHeaderTitle"), CFSTR("HUAccessorySceneListTriggersHeaderTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v6);

  if (-[HUAvailableRelatedTriggerItemModule _editingAvailableWithDisplayedItems:](self, "_editingAvailableWithDisplayedItems:", v4))
  {
    -[HUAvailableRelatedTriggerItemModule editButtonHeaderDelegate](self, "editButtonHeaderDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[HUAvailableRelatedTriggerItemModule sectionHeaderEditButtonTitleKey](self, "sectionHeaderEditButtonTitleKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[HUAvailableRelatedTriggerItemModule editButtonHeaderDelegate](self, "editButtonHeaderDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHeaderAccessoryButtonDelegate:", v10);

        -[HUAvailableRelatedTriggerItemModule sectionHeaderEditButtonTitleKey](self, "sectionHeaderEditButtonTitleKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(v11, v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHeaderAccessoryButtonTitle:", v12);

      }
    }
  }
  -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_setByIntersectingWithSet:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAvailableRelatedTriggerItemModule previouslySortedItems](self, "previouslySortedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[HUAvailableRelatedTriggerItemModule progressivelySortItems:](self, "progressivelySortItems:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sortComparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingComparator:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(v19, "mutableCopy");
    -[HUAvailableRelatedTriggerItemModule setPreviouslySortedItems:](self, "setPreviouslySortedItems:", v16);
  }

  v21 = (void *)MEMORY[0x1E0C9AA60];
  if (v19)
    v21 = v19;
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModule naturalLightingItem](self, "naturalLightingItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "na_safeAddObject:", v24);

  v25 = (void *)MEMORY[0x1E0C99D20];
  -[HUAvailableRelatedTriggerItemModule addAutomationItem](self, "addAutomationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "na_arrayWithSafeObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = v23;
  v41[1] = v22;
  v41[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "na_arrayByFlattening");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v29);

  v30 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "items");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAvailableRelatedTriggerItemModule addAutomationItem](self, "addAutomationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "containsObject:", v34))
  {
    v35 = objc_msgSend(v33, "count");

    if (v35 == 1)
      objc_msgSend(v5, "setHeaderTitle:", 0);
  }
  else
  {

  }
  v36 = (void *)MEMORY[0x1E0D314B0];
  v40 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "filterSections:toDisplayedItems:", v37, v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)progressivelySortItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemModule previouslySortedItems](self, "previouslySortedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke;
  v18[3] = &unk_1E6F51368;
  v19 = v4;
  v8 = v4;
  objc_msgSend(v7, "predicateWithBlock:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterUsingPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  -[HUAvailableRelatedTriggerItemModule previouslySortedItems](self, "previouslySortedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke_2;
  v17[3] = &unk_1E6F51390;
  v17[4] = self;
  objc_msgSend(v14, "na_each:", v17);
  -[HUAvailableRelatedTriggerItemModule previouslySortedItems](self, "previouslySortedItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "previouslySortedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (objc_msgSend(v3, "count"))
  {
    while (1)
    {
      objc_msgSend((id)objc_opt_class(), "sortComparator");
      v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "previouslySortedItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = ((uint64_t (**)(_QWORD, void *, id))v5)[2](v5, v7, v13);

      if (v8 == 1)
        break;
      ++v4;
      objc_msgSend(*(id *)(a1 + 32), "previouslySortedItems");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 >= objc_msgSend(v3, "count"))
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:

  }
  objc_msgSend(*(id *)(a1 + 32), "previouslySortedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(*(id *)(a1 + 32), "previouslySortedItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4 >= v10)
    objc_msgSend(v11, "addObject:", v13);
  else
    objc_msgSend(v11, "insertObject:atIndex:", v13, v4);

}

- (BOOL)relatedItemsCanBeAutomated
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  -[HUAvailableRelatedTriggerItemModule actionBuilderFactories](self, "actionBuilderFactories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[HUAvailableRelatedTriggerItemModule sensorCharacteristics](self, "sensorCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[HUAvailableRelatedTriggerItemModule eventOptionsItems](self, "eventOptionsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_103);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAvailableRelatedTriggerItemModule serviceTypesSupportingAutomation](self, "serviceTypesSupportingAutomation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v13 = objc_msgSend(v10, "count");
  v14 = (v4 || v6 || v8) && (v12 | v13) != 0;

  return v14;
}

id __65__HUAvailableRelatedTriggerItemModule_relatedItemsCanBeAutomated__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)_editingAvailableWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_userIsAllowedToEditTrigger");

  if (v6
    && (-[HUAvailableRelatedTriggerItemModule context](self, "context"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "itemsAreEditable"),
        v7,
        v8))
  {
    -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__HUAvailableRelatedTriggerItemModule__editingAvailableWithDisplayedItems___block_invoke;
    v13[3] = &unk_1E6F4DAD8;
    v14 = v4;
    v11 = objc_msgSend(v10, "na_any:", v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __75__HUAvailableRelatedTriggerItemModule__editingAvailableWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
  {
    objc_msgSend(v6, "recommendationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldHideAutomationsModule
{
  void *v2;
  void *v3;
  int v4;

  -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_106);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_108_0) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

id __66__HUAvailableRelatedTriggerItemModule_shouldHideAutomationsModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

uint64_t __66__HUAvailableRelatedTriggerItemModule_shouldHideAutomationsModule__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHomePodAndIsInMediaSystem") ^ 1;
}

- (void)_performRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HUAvailableRelatedTriggerItemModule *v13;
  SEL v14;

  v5 = a3;
  -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableUpdatesWithReason:", CFSTR("PerformingRequests"));

  -[HUAvailableRelatedTriggerItemModule setActiveRequest:](self, "setActiveRequest:", v5);
  objc_msgSend(v5, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModule _activateItem:active:](self, "_activateItem:active:", v7, objc_msgSend(v5, "active"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HUAvailableRelatedTriggerItemModule__performRequest___block_invoke;
  v11[3] = &unk_1E6F51438;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v9 = v5;
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

}

void __55__HUAvailableRelatedTriggerItemModule__performRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "completionFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithResult:error:", v7, v6);

  objc_msgSend(*(id *)(a1 + 40), "waitingRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popFirstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  if (v17)
  {
    objc_msgSend(v10, "_performRequest:", v17);
  }
  else
  {
    objc_msgSend(v10, "setActiveRequest:", 0);
    objc_msgSend(*(id *)(a1 + 40), "availableTriggerItemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDisableUpdatesWithReason:", CFSTR("PerformingRequests"));

    v12 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(*(id *)(a1 + 40), "itemProviders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestToReloadItemProviders:senderSelector:", v13, *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "itemUpdater");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "performItemUpdateRequest:", v14);

  }
}

- (id)_activateItem:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  __CFString *v32;
  HUAvailableRelatedTriggerItemModule *v33;
  id v34;
  BOOL v35;
  _QWORD v36[4];
  __CFString *v37;
  BOOL v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = (void *)objc_opt_new();
  -[HUAvailableRelatedTriggerItemModule home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString buildersForActivating:inHome:withContext:serviceLikeItems:](v7, "buildersForActivating:inHome:withContext:serviceLikeItems:", v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("deactivating");
      if (v4)
        v15 = CFSTR("activating");
      *(_DWORD *)buf = 138412546;
      v40 = v15;
      v41 = 2112;
      v42 = v7;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Start %@ item: %@", buf, 0x16u);
    }

    -[__CFString setActive:](v7, "setActive:", v4);
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[__CFString identifier](v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("Committing"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "disableUpdatesWithReason:", v18);

    v20 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke;
    v36[3] = &unk_1E6F51510;
    v38 = v4;
    v21 = v7;
    v37 = v21;
    objc_msgSend(v11, "na_map:", v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_9;
    v31[3] = &unk_1E6F51538;
    v35 = v4;
    v32 = v21;
    v33 = self;
    v34 = v18;
    v24 = v18;
    objc_msgSend(v23, "addCompletionBlock:", v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "Attempted to activate item but there were no builders: %@", buf, 0xCu);
    }

    -[__CFString resetActiveToDefault](v7, "resetActiveToDefault");
    v26 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "requestToUpdateItems:senderSelector:", v27, a2);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(v28, "performItemUpdateRequest:", v24);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(a1 + 40))
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_2;
    v25[3] = &unk_1E6F4C660;
    v7 = v3;
    v26 = v7;
    objc_msgSend(v6, "futureWithBlock:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_3;
    v23[3] = &unk_1E6F514A0;
    v9 = v7;
    v24 = v9;
    objc_msgSend(v8, "flatMap:", v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_5;
    v21[3] = &unk_1E6F4F2D0;
    v22 = v9;
    objc_msgSend(v10, "recover:", v21);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
  }
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_7;
  v19[3] = &unk_1E6F4CD58;
  v20 = v3;
  v12 = v3;
  objc_msgSend(v4, "flatMap:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_8;
  v16[3] = &unk_1E6F514E8;
  v17 = *(id *)(a1 + 32);
  v18 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v13, "recover:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "validationError");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (v4)
    objc_msgSend(v3, "finishWithError:", v4);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActions");

  objc_opt_class();
  v4 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "characteristicInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v9 = 0;
    if (!v3)
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "deleteTrigger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flatMap:", &__block_literal_global_119);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  if (v9)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

uint64_t __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_4()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "deleteTrigger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flatMap:", &__block_literal_global_120);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_6()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_7(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "commitItem");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = *MEMORY[0x1E0D305C8];
  v16 = *MEMORY[0x1E0D305A8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v18[1] = *MEMORY[0x1E0D305B8];
  if (*(_BYTE *)(a1 + 40))
    v10 = (uint64_t *)MEMORY[0x1E0D30A70];
  else
    v10 = (uint64_t *)MEMORY[0x1E0D30A68];
  v11 = *v10;
  v19[0] = v8;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_errorWithAddedUserInfo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "futureWithError:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      v8 = "Failed to commit changes for item with error: %@, item: %@";
LABEL_9:
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);
    }
  }
  else if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
      v10 = CFSTR("Activated");
    else
      v10 = CFSTR("Deactivated");
    *(_DWORD *)buf = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v9;
    v8 = "%@ item: %@";
    goto LABEL_9;
  }

  v11 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_finishCommitWithItems:updatesDelayReason:", v12, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "didActivateItem:active:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), v4);
}

- (void)didActivateItem:(id)a3 active:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
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
  id v21;

  v5 = a4;
  v21 = a5;
  objc_msgSend(a3, "recommendationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recommendation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUAvailableRelatedTriggerItemModule serviceTypes](self, "serviceTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModule _accessoryCategoryUserFrieindlyDescription](self, "_accessoryCategoryUserFrieindlyDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analyticsData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21 == 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30368]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D302F8]);

    if (v21)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30300]);
    if (v11)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D302D8]);
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30350]);

    }
    -[HUAvailableRelatedTriggerItemModule context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "analyticsPresentationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[HUAvailableRelatedTriggerItemModule context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "analyticsPresentationContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30338]);

    }
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 14, v13);

  }
}

- (id)_accessoryCategoryUserFrieindlyDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_132_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __81__HUAvailableRelatedTriggerItemModule__accessoryCategoryUserFrieindlyDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D33550], "accessoryCategoryAnalyticsDescription:", a2);
}

- (id)_buildItemProviders
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  HUAvailableRelatedTriggerItemProvider *v7;
  void *v8;
  void *v9;
  HUAvailableRelatedTriggerItemProvider *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location[2];

  if (-[HUAvailableRelatedTriggerItemModule shouldHideAutomationsModule](self, "shouldHideAutomationsModule"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModule relatedItems](self, "relatedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [HUAvailableRelatedTriggerItemProvider alloc];
    -[HUAvailableRelatedTriggerItemModule home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModule context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUAvailableRelatedTriggerItemProvider initWithHome:relatedItems:context:](v7, "initWithHome:relatedItems:context:", v8, v6, v9);
    -[HUAvailableRelatedTriggerItemModule setAvailableTriggerItemProvider:](self, "setAvailableTriggerItemProvider:", v10);

    objc_initWeak(location, self);
    v11 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke;
    v34[3] = &unk_1E6F515A8;
    objc_copyWeak(&v35, location);
    -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTriggerFilter:", v34);

    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_3;
    v32[3] = &unk_1E6F515D0;
    objc_copyWeak(&v33, location);
    -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRecommendationsFilter:", v32);

    -[HUAvailableRelatedTriggerItemModule availableTriggerItemProvider](self, "availableTriggerItemProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    v15 = objc_alloc(MEMORY[0x1E0D31840]);
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_4;
    v30[3] = &unk_1E6F4C4E8;
    objc_copyWeak(&v31, location);
    v16 = (void *)objc_msgSend(v15, "initWithResultsBlock:", v30);
    -[HUAvailableRelatedTriggerItemModule setAddAutomationItem:](self, "setAddAutomationItem:", v16);

    -[HUAvailableRelatedTriggerItemModule addAutomationItem](self, "addAutomationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

    -[HUAvailableRelatedTriggerItemModule context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "showNaturalLightingItem");

    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0D31840]);
      v28[0] = v11;
      v28[1] = 3221225472;
      v28[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_5;
      v28[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v29, location);
      v21 = (void *)objc_msgSend(v20, "initWithResultsBlock:", v28);
      -[HUAvailableRelatedTriggerItemModule setNaturalLightingItem:](self, "setNaturalLightingItem:", v21);

      -[HUAvailableRelatedTriggerItemModule naturalLightingItem](self, "naturalLightingItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v22);

      objc_destroyWeak(&v29);
    }
    v23 = objc_alloc(MEMORY[0x1E0D31848]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithItems:", v24);
    -[HUAvailableRelatedTriggerItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v25);

    -[HUAvailableRelatedTriggerItemModule staticItemProvider](self, "staticItemProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

    v3 = (void *)objc_msgSend(v4, "copy");
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(location);

  }
  return v3;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hidesCustomTriggers");

  if ((v6 & 1) != 0 || !objc_msgSend(v3, "hf_shouldDisplayTrigger"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "relatedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_2;
    v10[3] = &unk_1E6F51580;
    v11 = v3;
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  return v8;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_affectsHomeKitObject:", v3);

  return v4;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend((id)objc_opt_class(), "shouldShowRecommendation:", v3);

  return v5;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "addAutomationItemShouldBeHidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D70]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSmartAutomationAddAutomation"), CFSTR("HUSmartAutomationAddAutomation"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("plus"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30C60]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "automationItemIsLoading"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30EA8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "automationItemIsLoading"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30C80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "relatedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_146);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_149);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combineAllFutures:scheduler:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_10;
  v15[3] = &unk_1E6F51740;
  v16 = v2;
  v17 = WeakRetained;
  v12 = v2;
  objc_msgSend(v11, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lightProfiles");
  }
  else
  {
    objc_msgSend(v3, "services");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_flatMap:", &__block_literal_global_148);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_lightProfiles");
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_9;
  v7[3] = &unk_1E6F51698;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "futureWithCompletionHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchSettingsWithCompletion:", a2);
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_10(uint64_t a1, void *a2)
{
  int v3;
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

  v3 = objc_msgSend(a2, "na_any:", &__block_literal_global_153);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 ^ 1u);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D70]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUNaturalLightingAccessorySetupEnableItem_Title"), CFSTR("HUNaturalLightingAccessorySetupEnableItem_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "enableNaturalLighting");
  objc_msgSend(v6, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30E20]);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierNaturalLightingRegular"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30C60]);

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 40), "relatedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_flatMap:", &__block_literal_global_158);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30B78]);

  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportedFeatures") & 1;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_159);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

- (BOOL)addAutomationItemShouldBeHidden
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[HUAvailableRelatedTriggerItemModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_userCanCreateTrigger"))
  {
    -[HUAvailableRelatedTriggerItemModule context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hidesAddAutomationItem") & 1) != 0)
      LOBYTE(v5) = 1;
    else
      v5 = !-[HUAvailableRelatedTriggerItemModule relatedItemsCanBeAutomated](self, "relatedItemsCanBeAutomated");

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_updateRelatedItems:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a3;
  if (a3)
  {
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v10 = (id)v7;
  objc_msgSend(v6, "na_flatMap:", &__block_literal_global_163);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObjectsFromArray:", v8);
  objc_msgSend(v10, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModule setRelatedItems:](self, "setRelatedItems:", v9);

}

id __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_2;
    v9[3] = &unk_1E6F517D0;
    v10 = v2;
    objc_msgSend(v6, "na_flatMap:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if ((objc_msgSend(v3, "hf_showAsIndividualServices") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_3;
    v7[3] = &unk_1E6F517A8;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "na_map:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D317D0];
    objc_msgSend(*(id *)(a1 + 32), "valueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceItemForService:valueSource:", v3, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (BOOL)shouldShowRecommendation:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  unint64_t v29;
  int v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  BOOL v34;
  id v35;
  int v36;
  void *v37;
  int v39;
  void *v40;
  _BOOL4 v41;
  uint8_t buf[4];
  _BYTE v43[10];
  _BYTE v44[6];
  _BYTE v45[6];
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BOOL4 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "hu_triggerBuilderIfAny");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresFMFDeviceToRun");

  objc_msgSend(v3, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeAccessControlForUser:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "presenceComputationStatus");

  objc_msgSend(v3, "hu_triggerBuilderIfAny");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  objc_msgSend(v14, "locationInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationEventBuilder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v40 = v18;
  if (v18)
  {
    objc_msgSend(v18, "region");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v19 != 0;

  }
  else
  {
    v41 = 1;
  }
  objc_msgSend(v3, "hu_asTriggerRecommendation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "triggerBuilders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "na_any:", &__block_literal_global_170);

  v23 = v10;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "supportsBeingCurrentLocationDevice"))
  {
    v39 = v5;
    objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "authorizationStatus");

    v26 = HFLocationServicesAvailableForAuthorizationStatus();
    v27 = (void *)MEMORY[0x1E0CBA780];
    objc_msgSend(v3, "home");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v27, "hf_presenceDisableReasonsForHome:", v28);

    v29 = v27 & 2;
    if ((v27 & 2) != 0)
      v30 = 0;
    else
      v30 = v26;
    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v43 = v30;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v25;
      *(_WORD *)v44 = 1024;
      *(_DWORD *)&v44[2] = v26;
      *(_WORD *)v45 = 1024;
      *(_DWORD *)&v45[2] = v29 >> 1;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, " => locationAvailable=%{BOOL}d because locationServicesAuthStatus=%d, locationServicesEnabled=%{BOOL}d, homeKitLocationServicesDisabled=%{BOOL}d", buf, 0x1Au);
    }
    v5 = v39;
  }
  else
  {
    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "!supportsBeingCurrentLocationDevice", buf, 2u);
    }
    v30 = 1;
  }

  v32 = ((v23 != 3) | ~v5) & (v30 | ~v22) & v41;
  HFLogForCategory();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v23 == 3;
    v35 = v14;
    v36 = !v34;
    objc_msgSend(v3, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    *(_QWORD *)v43 = v37;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)v44 = v32;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)v45 = v5;
    *(_WORD *)&v45[4] = 1024;
    v46 = v36;
    v14 = v35;
    v47 = 1024;
    v48 = v22;
    v49 = 1024;
    v50 = v30;
    v51 = 1024;
    v52 = v41;
    _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "Should show recommendation (%@) = %{BOOL}d\nrequiresFMF=%{BOOL}d, hasFMFDevice=%{BOOL}d, recommendationContainsLocationEvent=%{BOOL}d, locationAvailable=%{BOOL}d, allEventsAreValid=%{BOOL}d", buf, 0x30u);

  }
  return v32;
}

uint64_t __64__HUAvailableRelatedTriggerItemModule_shouldShowRecommendation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "eventBuilders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_172);

  return v7;
}

uint64_t __64__HUAvailableRelatedTriggerItemModule_shouldShowRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF347FD0);
}

+ (id)sortComparator
{
  return &__block_literal_global_181;
}

uint64_t __53__HUAvailableRelatedTriggerItemModule_sortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t (**v28)(_QWORD, _QWORD, _QWORD);

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v8)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
    goto LABEL_16;
  objc_msgSend(v8, "recommendationItem");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        objc_msgSend(v11, "recommendationItem"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    objc_msgSend(v8, "recommendationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recommendationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (v25 == 0) ^ (v26 != 0);

    if ((v27 & 1) == 0)
    {
      objc_msgSend(v8, "recommendationItem");
      v28 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v28)
        v24 = -1;
      else
        v24 = 1;
      goto LABEL_17;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v28 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v24 = ((uint64_t (**)(_QWORD, id, id))v28)[2](v28, v6, v9);
LABEL_17:

    goto LABEL_18;
  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "recommendationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recommendation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortingPriority");
  objc_msgSend(v16, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "recommendationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recommendation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sortingPriority");
  objc_msgSend(v20, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v19, "compare:", v23);
  if (!v24)
    goto LABEL_16;
LABEL_18:

  return v24;
}

+ (BOOL)_itemClassSupportsEvents:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (HFStaticItem)addAutomationItem
{
  return self->_addAutomationItem;
}

- (void)setAddAutomationItem:(id)a3
{
  objc_storeStrong((id *)&self->_addAutomationItem, a3);
}

- (NSArray)relatedItems
{
  return self->_relatedItems;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFItemSectionAccessoryButtonHeaderDelegate)editButtonHeaderDelegate
{
  return (HFItemSectionAccessoryButtonHeaderDelegate *)objc_loadWeakRetained((id *)&self->_editButtonHeaderDelegate);
}

- (void)setEditButtonHeaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editButtonHeaderDelegate, a3);
}

- (HUAvailableRelatedTriggerItemModuleContextProviding)context
{
  return self->_context;
}

- (void)setSensorCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_sensorCharacteristics, a3);
}

- (void)setActionBuilderFactories:(id)a3
{
  objc_storeStrong((id *)&self->_actionBuilderFactories, a3);
}

- (void)setEventOptionsItems:(id)a3
{
  objc_storeStrong((id *)&self->_eventOptionsItems, a3);
}

- (HFStaticItem)naturalLightingItem
{
  return self->_naturalLightingItem;
}

- (void)setNaturalLightingItem:(id)a3
{
  objc_storeStrong((id *)&self->_naturalLightingItem, a3);
}

- (BOOL)enableNaturalLighting
{
  return self->_enableNaturalLighting;
}

- (void)setEnableNaturalLighting:(BOOL)a3
{
  self->_enableNaturalLighting = a3;
}

- (BOOL)automationItemIsLoading
{
  return self->_automationItemIsLoading;
}

- (NSString)sectionHeaderEditButtonTitleKey
{
  return self->_sectionHeaderEditButtonTitleKey;
}

- (void)setSectionHeaderEditButtonTitleKey:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderEditButtonTitleKey, a3);
}

- (HUAvailableRelatedTriggerItemProvider)availableTriggerItemProvider
{
  return self->_availableTriggerItemProvider;
}

- (void)setAvailableTriggerItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_availableTriggerItemProvider, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (NSMutableArray)previouslySortedItems
{
  return self->_previouslySortedItems;
}

- (void)setPreviouslySortedItems:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySortedItems, a3);
}

- (HUAvailableTriggerItemActivationRequest)activeRequest
{
  return self->_activeRequest;
}

- (void)setActiveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activeRequest, a3);
}

- (NSMutableArray)waitingRequests
{
  return self->_waitingRequests;
}

- (void)setWaitingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_waitingRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingRequests, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_previouslySortedItems, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_availableTriggerItemProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderEditButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_naturalLightingItem, 0);
  objc_storeStrong((id *)&self->_eventOptionsItems, 0);
  objc_storeStrong((id *)&self->_actionBuilderFactories, 0);
  objc_storeStrong((id *)&self->_sensorCharacteristics, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_editButtonHeaderDelegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_relatedItems, 0);
  objc_storeStrong((id *)&self->_addAutomationItem, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
