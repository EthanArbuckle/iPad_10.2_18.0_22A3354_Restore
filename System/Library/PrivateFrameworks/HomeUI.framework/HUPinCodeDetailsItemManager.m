@implementation HUPinCodeDetailsItemManager

- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 pinCodeManager:(id)a5 home:(id)a6
{
  id v12;
  id v13;
  HUPinCodeDetailsItemManager *v14;
  HUPinCodeDetailsItemManager *v15;
  NAFuture *v16;
  NAFuture *restoreFuture;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  HUPinCodeDetailsItemManager *v27;
  SEL v28;
  objc_super v29;

  v12 = a5;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HUPinCodeDetailsItemManager;
  v14 = -[HFItemManager initWithDelegate:sourceItem:](&v29, sel_initWithDelegate_sourceItem_, a3, a4);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pinCodeManager, a5);
    objc_storeStrong((id *)&v15->_overrideHome, a6);
    v16 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    restoreFuture = v15->_restoreFuture;
    v15->_restoreFuture = v16;

  }
  objc_opt_class();
  -[HFItemManager sourceItem](v15, "sourceItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_msgSend(v20, "user");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v20, "user");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __79__HUPinCodeDetailsItemManager_initWithDelegate_sourceItem_pinCodeManager_home___block_invoke;
    v26[3] = &unk_1E6F5C000;
    v27 = v15;
    v28 = a2;
    objc_msgSend(v13, "fetchMissingWalletKeysForUser:completion:", v22, v26);

    v23 = v27;
  }
  else
  {
    -[HUPinCodeDetailsItemManager restoreFuture](v15, "restoreFuture");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "finishWithResult:", v24);

  }
  return v15;
}

void __79__HUPinCodeDetailsItemManager_initWithDelegate_sourceItem_pinCodeManager_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2080;
      v13 = "-[HUPinCodeDetailsItemManager initWithDelegate:sourceItem:pinCodeManager:home:]_block_invoke";
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%@:%s) Request to fetch missing wallet keys for user returned nil set", (uint8_t *)&v10, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "restoreFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "finishWithResult:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v7);

  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

}

- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_pinCodeManager_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPinCodeDetailsItemManager.m"), 92, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPinCodeDetailsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_pinCodeManager_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPinCodeDetailsItemManager.m"), 97, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPinCodeDetailsItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
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
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unsigned __int8 v75;
  id v76;
  char v77;
  BOOL v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  BOOL v85;
  char v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[5];
  _QWORD v90[4];
  id v91;
  HUPinCodeDetailsItemManager *v92;
  BOOL v93;
  unsigned __int8 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  _QWORD v99[5];
  id v100;
  id v101;
  id v102;
  unsigned __int8 v103;
  BOOL v104;
  unsigned __int8 v105;
  char v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  HUPinCodeDetailsItemManager *v111;
  unsigned __int8 v112;
  char v113;
  _QWORD v114[4];
  id v115;
  char v116;
  unsigned __int8 v117;
  BOOL v118;
  _QWORD v119[4];
  id v120;
  id v121;
  id v122;
  id v123;
  unsigned __int8 v124;
  unsigned __int8 v125;
  id location;
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[4];

  v129[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v76 = v6;

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[HFItemManager sourceItem](self, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && !v9 && !v76)
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Expected Item %@ to be a pin code or user"), v11);

  }
  -[HFItemManager sourceItem](self, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v12 == 0;

  if (v9)
    objc_msgSend(v9, "user");
  else
    objc_msgSend(v76, "user");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "hasOnboardedForAccessCode");
  objc_msgSend(v4, "hf_accessoriesSupportingAccessCodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    v16 = v14;
  else
    v16 = 0;
  v75 = v16;

  if ((objc_msgSend(v4, "hf_hasHomeHubSupportingAccessCodes") & 1) != 0)
    v77 = 1;
  else
    v77 = objc_msgSend(v4, "hf_currentUserIsOwner");
  objc_initWeak(&location, self);
  v17 = objc_alloc(MEMORY[0x1E0D31840]);
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke;
  v119[3] = &unk_1E6F5C028;
  objc_copyWeak(&v123, &location);
  v18 = v13;
  v120 = v18;
  v124 = v75;
  v19 = v4;
  v121 = v19;
  v125 = v14;
  v20 = v9;
  v122 = v20;
  v21 = (void *)objc_msgSend(v17, "initWithResultsBlock:", v119);
  -[HUPinCodeDetailsItemManager setPinCodeLabelItem:](self, "setPinCodeLabelItem:", v21);

  v22 = objc_alloc(MEMORY[0x1E0D31840]);
  v23 = v14 & (v12 == 0);
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_66;
  v114[3] = &unk_1E6F5C050;
  v24 = v20;
  v115 = v24;
  v116 = v23;
  v117 = v14;
  v118 = v78;
  v25 = (void *)objc_msgSend(v22, "initWithResultsBlock:", v114);
  -[HUPinCodeDetailsItemManager setPinCodeValueItem:](self, "setPinCodeValueItem:", v25);

  v26 = objc_alloc(MEMORY[0x1E0D31840]);
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_69;
  v107[3] = &unk_1E6F5C078;
  v27 = v19;
  v108 = v27;
  v28 = v24;
  v109 = v28;
  v112 = v14;
  v29 = v18;
  v113 = v77;
  v110 = v29;
  v111 = self;
  v30 = (void *)objc_msgSend(v26, "initWithResultsBlock:", v107);
  -[HUPinCodeDetailsItemManager setPinCodeRestoreAccessItem:](self, "setPinCodeRestoreAccessItem:", v30);

  v31 = objc_alloc(MEMORY[0x1E0D31840]);
  v128[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeChangeCellTitle"), CFSTR("HUPinCodeChangeCellTitle"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v128[1] = *MEMORY[0x1E0D30D70];
  v129[0] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23 ^ 1u);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, v128, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v31, "initWithResults:", v34);
  -[HUPinCodeDetailsItemManager setPinCodeChangeItem:](self, "setPinCodeChangeItem:", v35);

  v36 = objc_alloc(MEMORY[0x1E0D31840]);
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_76;
  v99[3] = &unk_1E6F5C0A0;
  v99[4] = self;
  v103 = v14;
  v104 = v78;
  v37 = v28;
  v100 = v37;
  v105 = v75;
  v38 = v29;
  v101 = v38;
  v106 = v77;
  v39 = v27;
  v102 = v39;
  v40 = (void *)objc_msgSend(v36, "initWithResultsBlock:", v99);
  -[HUPinCodeDetailsItemManager setPersonalPINCodeItem:](self, "setPersonalPINCodeItem:", v40);

  v41 = objc_alloc(MEMORY[0x1E0D31840]);
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_80;
  v95[3] = &unk_1E6F5C130;
  objc_copyWeak(&v98, &location);
  v42 = v39;
  v96 = v42;
  v43 = v38;
  v97 = v43;
  v44 = (void *)objc_msgSend(v41, "initWithResultsBlock:", v95);
  -[HUPinCodeDetailsItemManager setAddOrShowHomeKeyItem:](self, "setAddOrShowHomeKeyItem:", v44);

  v45 = objc_alloc(MEMORY[0x1E0D31840]);
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_95;
  v90[3] = &unk_1E6F5C158;
  v93 = v78;
  v46 = v43;
  v94 = v14;
  v91 = v46;
  v92 = self;
  v47 = (void *)objc_msgSend(v45, "initWithResultsBlock:", v90);
  -[HUPinCodeDetailsItemManager setDeleteGuestPINCodeItem:](self, "setDeleteGuestPINCodeItem:", v47);

  v48 = objc_alloc(MEMORY[0x1E0D31840]);
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_98;
  v89[3] = &unk_1E6F4C518;
  v89[4] = self;
  v49 = (void *)objc_msgSend(v48, "initWithResultsBlock:", v89);
  -[HUPinCodeDetailsItemManager setRestoreHomeKeyAccessItem:](self, "setRestoreHomeKeyAccessItem:", v49);

  v50 = (void *)objc_opt_new();
  -[HUPinCodeDetailsItemManager pinCodeLabelItem](self, "pinCodeLabelItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v51);

  -[HUPinCodeDetailsItemManager pinCodeValueItem](self, "pinCodeValueItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v52);

  -[HUPinCodeDetailsItemManager pinCodeRestoreAccessItem](self, "pinCodeRestoreAccessItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v53);

  -[HUPinCodeDetailsItemManager pinCodeChangeItem](self, "pinCodeChangeItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v54);

  -[HUPinCodeDetailsItemManager personalPINCodeItem](self, "personalPINCodeItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v55);

  -[HUPinCodeDetailsItemManager addOrShowHomeKeyItem](self, "addOrShowHomeKeyItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v56);

  -[HUPinCodeDetailsItemManager deleteGuestPINCodeItem](self, "deleteGuestPINCodeItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v57);

  -[HUPinCodeDetailsItemManager restoreHomeKeyAccessItem](self, "restoreHomeKeyAccessItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "na_safeAddObject:", v58);

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D310B0]), "initWithHome:", v42);
  -[HUPinCodeDetailsItemManager setLocksItemProvider:](self, "setLocksItemProvider:", v59);

  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_106;
  v87[3] = &unk_1E6F4D8E8;
  v60 = v46;
  v88 = v60;
  -[HUPinCodeDetailsItemManager locksItemProvider](self, "locksItemProvider");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFilter:", v87);

  v62 = objc_alloc(MEMORY[0x1E0D31928]);
  -[HUPinCodeDetailsItemManager locksItemProvider](self, "locksItemProvider");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_110;
  v79[3] = &unk_1E6F5C1C8;
  v64 = v37;
  v80 = v64;
  objc_copyWeak(&v84, &location);
  v65 = v60;
  v81 = v65;
  v66 = v76;
  v82 = v66;
  v85 = v78;
  v67 = v42;
  v83 = v67;
  v86 = v77;
  v68 = (void *)objc_msgSend(v62, "initWithSourceProvider:transformationBlock:", v63, v79);
  -[HUPinCodeDetailsItemManager setTransformedLocksItemProvider:](self, "setTransformedLocksItemProvider:", v68);

  v69 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v50);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v69, "initWithItems:", v70);

  v127[0] = v71;
  -[HUPinCodeDetailsItemManager transformedLocksItemProvider](self, "transformedLocksItemProvider");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v98);

  objc_destroyWeak(&v123);
  objc_destroyWeak(&location);

  return v73;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v6);

  if (*(_QWORD *)(a1 + 32))
    v8 = 1;
  else
    v8 = *(_BYTE *)(a1 + 64) == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D70]);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "hf_accessoriesSupportingAccessCodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = *(unsigned __int8 *)(a1 + 65);
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136316162;
    v19 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    v20 = 1024;
    v21 = v8;
    v22 = 2048;
    v23 = v12;
    v24 = 1024;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) For pinCodeLabelItem, shouldHide = %{BOOL}d | accessoriesSupportingAccessCodes.count = %ld | hasOnboardedForAccessCode = %{BOOL}d | user = %@", (uint8_t *)&v18, 0x2Cu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isUnknownGuestFromMatter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30C80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_66(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeValueCellTitle"), CFSTR("HUPinCodeValueCellTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 32), "pinCodeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 40) == 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D70]);

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(unsigned __int8 *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 41);
    v9 = *(unsigned __int8 *)(a1 + 42);
    v12 = 136315906;
    v13 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    v14 = 1024;
    v15 = v7;
    v16 = 1024;
    v17 = v8;
    v18 = 1024;
    v19 = v9;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) For pinCodeValueItem, showPinCodeValue = %{BOOL}d | hasOnboardedForAccessCode = %{BOOL}d | newPinCode = %{BOOL}d", (uint8_t *)&v12, 0x1Eu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_69(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  v23[3] = &unk_1E6F4E5D8;
  v24 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_firstObjectPassingTest:", v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 64) && *(_QWORD *)(a1 + 48) && *(_BYTE *)(a1 + 65))
  {
    objc_msgSend(*(id *)(a1 + 56), "pinCodeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isAccessoryFetchInProgress") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      if (*(_QWORD *)(a1 + 40))
        v6 = v3 == 0;
      else
        v6 = 1;
      v5 = !v6;
    }

  }
  else
  {
    v5 = 0;
  }
  v41[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeRestoreAccessButtonTitle"), CFSTR("HUPinCodeRestoreAccessButtonTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v7;
  v41[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5 ^ 1u);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D30CE8];
  v42[1] = v8;
  v42[2] = MEMORY[0x1E0C9AAA0];
  v10 = *MEMORY[0x1E0D30C80];
  v41[2] = v9;
  v41[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "operationInProgress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(unsigned __int8 *)(a1 + 64);
    v22 = *(unsigned __int8 *)(a1 + 65);
    objc_msgSend(*(id *)(a1 + 56), "pinCodeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAccessoryFetchInProgress");
    objc_msgSend(v3, "hf_minimumDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316930;
    v26 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    v27 = 1024;
    v28 = v5;
    v29 = 1024;
    v30 = v14;
    v31 = 1024;
    v32 = v22;
    v33 = 1024;
    v34 = v16;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v18;
    v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "(%s) For pinCodeRestoreAccessItem, showRestoreAccess = %{BOOL}d | hasOnboardedForAccessCode = %{BOOL}d | hasResidentDevice = %{BOOL}d | isAccessoryFetchInProgress = %{BOOL}d | pinCodeRestorableAccessory = %@ | pinCodeItem = %@ | user = %@", buf, 0x42u);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CB7A38]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "hf_primaryService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9A80]);

  }
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v3);

  if (v5 && objc_msgSend(v3, "isReachable"))
    v10 = objc_msgSend(v3, "supportsAccessCodes") & (v9 ^ 1);
  else
    v10 = 0;

  return v10;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_76(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  _BYTE v32[10];
  _BYTE v33[6];
  void *v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodePersonalPINCodeCellTitle"), CFSTR("HUPinCodePersonalPINCodeCellTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  v4 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v28 = 0;
  v5 = objc_msgSend(v4, "canEvaluatePolicy:error:", 2, &v28);
  v6 = v28;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC1280]))
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == -5)
        v5 = 1;
    }
    else
    {

    }
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v25 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v30 = v25;
      v31 = 2080;
      *(_QWORD *)v32 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)v33 = v5;
      *(_WORD *)&v33[4] = 2112;
      v34 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "(%@:%s) canLocalAuthenticate = %{BOOL}d, localAuthenticationError = %@", buf, 0x26u);
    }

  }
  if (*(_BYTE *)(a1 + 64)
    && !*(_BYTE *)(a1 + 65)
    && ((v24 = *(void **)(a1 + 40)) != 0 && *(_BYTE *)(a1 + 66)
     || *(_QWORD *)(a1 + 48) && *(_BYTE *)(a1 + 66) && *(_BYTE *)(a1 + 67)))
  {
    v11 = v5 & ~objc_msgSend(v24, "isUnknownGuestFromMatter");
  }
  else
  {
    v11 = 0;
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(unsigned __int8 *)(a1 + 64);
    v14 = *(unsigned __int8 *)(a1 + 65);
    v27 = v4;
    v15 = *(unsigned __int8 *)(a1 + 67);
    objc_msgSend(*(id *)(a1 + 56), "hf_accessoriesSupportingAccessCodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
    v26 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316930;
    v30 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    v31 = 1024;
    *(_DWORD *)v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v13;
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v14;
    LOWORD(v34) = 1024;
    *(_DWORD *)((char *)&v34 + 2) = v15;
    v4 = v27;
    HIWORD(v34) = 2048;
    v35 = v17;
    v36 = 2112;
    v37 = v18;
    v38 = 2112;
    v39 = v19;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "(%s) For personalPINCodeItem, shouldShow = %{BOOL}d | hasOnboardedForAccessCode = %{BOOL}d | newPinCode = %{BOOL}d | hasResidentDevice = %{BOOL}d | accessoriesSupportingAccessCodes.count = %ld | user = %@ | pinCodeItem = %@", buf, 0x42u);

    v7 = v26;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11 ^ 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 56), "hf_hasHomeHubSupportingAccessCodes") ^ 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30C80]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_80(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "na_safeAddObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "na_safeAddObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30B80]);

  v8 = objc_msgSend(v5, "count");
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
    v11 = *(_QWORD *)(a1 + 40) == 0;
  else
    v11 = 1;

  v12 = objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPhone") ^ 1;
  if (v11 || (v12 & 1) != 0 || !v8 || (objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey") & 1) == 0)
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey");
      *(_DWORD *)buf = 138413826;
      v24 = WeakRetained;
      v25 = 2080;
      v26 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      v27 = 1024;
      v28 = v11;
      v29 = 1024;
      v30 = v12;
      v31 = 1024;
      v32 = v8 != 0;
      v33 = 1024;
      v34 = v17;
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding addOrShowHomeKeyItem. shouldHideForUser: %{BOOL}d, shouldHideForDevice: %{BOOL}d, hasWalletKeyAccessories: %{BOOL}d, home.hasOnboardedForWalletKey = hasWalletKeyAccessories: %{BOOL}d, walletKeyAccessories: %@", buf, 0x38u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E0D30D70]);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_83;
    v20[3] = &unk_1E6F5C108;
    v20[4] = WeakRetained;
    v21 = v3;
    v22 = *(id *)(a1 + 32);
    objc_msgSend(v14, "flatMap:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_83(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "canAddWalletKeyErrorCode") == 8)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2080;
      v14 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause current device has Wallet app deleted", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 40));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "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");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_84;
    v8[3] = &unk_1E6F54A58;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v6, "flatMap:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_84(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "hf_hasWalletKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_85;
    v18 = &unk_1E6F4CD58;
    v6 = &v19;
    v19 = *(id *)(a1 + 40);
    v7 = &v15;
  }
  else
  {
    objc_msgSend(v4, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
    v13 = &unk_1E6F4CD30;
    v6 = &v14;
    v14 = *(id *)(a1 + 40);
    v7 = &v10;
  }
  objc_msgSend(v5, "flatMap:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_85(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;

  if (objc_msgSend(a2, "BOOLValue"))
    v3 = CFSTR("HUShowHomeKeyInWalletButtonTitle");
  else
    v3 = CFSTR("HUHomeSettingsLockAddHomeKeyToWallet");
  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke_3";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) For addOrShowHomeKeyItem | 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 returned NO and hf_walletKeyDeviceStatesOfCompatiblePairedWatches is %@", (uint8_t *)&v13, 0x16u);
  }

  v5 = objc_msgSend(v3, "count");
  v6 = *(void **)(a1 + 32);
  v7 = *MEMORY[0x1E0D30D70];
  if (v5)
  {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], v7);
    objc_msgSend(v3, "na_filter:", &__block_literal_global_229);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v9 = CFSTR("HUHomeSettingsLockAddHomeKeyToWallet");
    else
      v9 = CFSTR("HUShowHomeKeyInWalletButtonTitle");
    _HULocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], v7);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

BOOL __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_91(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "walletKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_95(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeDeleteGuestButtonTitle"), CFSTR("HUPinCodeDeleteGuestButtonTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  if (!*(_BYTE *)(a1 + 48) && !*(_QWORD *)(a1 + 32))
    v3 = *(_BYTE *)(a1 + 49) == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "operationInProgress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30C80]);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(unsigned __int8 *)(a1 + 48);
    v9 = *(unsigned __int8 *)(a1 + 49);
    v10 = objc_msgSend(*(id *)(a1 + 40), "operationInProgress");
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136316418;
    v15 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke_2";
    v16 = 1024;
    v17 = v3;
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) For deleteGuestPINCodeItem, hide = %{BOOL}d | newPinCode = %{BOOL}d |  hasOnboardedForAccessCode = %{BOOL}d | operationInProgress = %{BOOL}d | user = %@", (uint8_t *)&v14, 0x2Eu);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_98(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "restoreFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "restoreFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_101_0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) restoreHomeKeyAccessItem is hidden because restoreFuture is NOT finished", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;

  return v8;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_99(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v5 = objc_msgSend(v2, "hmf_isEmpty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D70]);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke_2";
    v12 = 1024;
    v13 = v5;
    v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) For restoreHomeKeyAccessItem, hidden = %{BOOL}d | missingWalletKeys = %@ | restoreFuture.isFinished = YES", (uint8_t *)&v10, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL8 v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB7A38]))
  {

  }
  else
  {
    objc_msgSend(v6, "hf_primaryService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9A80]);

    if (!v10)
    {
      v11 = 0;
      goto LABEL_11;
    }
  }
  v11 = (objc_msgSend(v6, "supportsAccessCodes") & 1) != 0 || *(_QWORD *)(a1 + 32) != 0;
LABEL_11:

  return v11;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_110(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  char v21;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isUnknownGuestFromMatter")
    && (objc_msgSend(*(id *)(a1 + 32), "accessories"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v7),
        v8,
        !v9))
  {
    v12 = 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0D31920]);
    v11 = (void *)objc_msgSend(v4, "copy");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3_113;
    v14[3] = &unk_1E6F5C1A0;
    objc_copyWeak(&v19, (id *)(a1 + 64));
    v15 = v7;
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v20 = *(_BYTE *)(a1 + 72);
    v18 = *(id *)(a1 + 56);
    v21 = *(_BYTE *)(a1 + 73);
    v12 = (void *)objc_msgSend(v10, "initWithSourceItem:transformationBlock:", v11, v14);

    objc_destroyWeak(&v19);
  }

  return v12;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3_113(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _BOOL4 v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  __CFString *v27;
  void *v28;
  int v30;

  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_opt_class();
  objc_msgSend(WeakRetained, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32));

  v11 = objc_msgSend(*(id *)(a1 + 32), "supportsAccessCodes");
  if (*(_QWORD *)(a1 + 40))
    v12 = *(_QWORD *)(a1 + 48) != 0;
  else
    v12 = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v14);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("lock.fill"), *MEMORY[0x1E0D30C78]);
  objc_msgSend(MEMORY[0x1E0D31130], "securityAccessoryTypeGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hu_tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D10]);

  if (objc_msgSend(*(id *)(a1 + 56), "hf_currentUserIsAdministrator")
    && objc_msgSend(*(id *)(a1 + 56), "hf_userIsRestrictedGuest:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 56), "homeAccessControlForUser:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "restrictedGuestAccessSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessAllowedToAccessories");
    v30 = v10;
    v20 = v8;
    v21 = WeakRetained;
    v22 = v12;
    v23 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "containsObject:", *(_QWORD *)(a1 + 32));

    v11 = v23;
    v12 = v22;
    WeakRetained = v21;
    v8 = v20;
    v10 = v30;

  }
  v25 = objc_msgSend(*(id *)(a1 + 32), "isReachable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30E20]);

  if ((v25 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 56), "hf_shouldBlockCurrentRestrictedGuestFromHome") & 1) == 0)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C80]);
    v27 = CFSTR("HUPinCodeAccessorySectionIsUnReachable");
    goto LABEL_17;
  }
  if (((v12 | v10) & 1) == 0 && ((v11 ^ 1) & 1) == 0 && *(_BYTE *)(a1 + 73))
  {
    v27 = CFSTR("HUPinCodeAccessorySectionUserPINUnset");
LABEL_17:
    _HULocalizedStringWithDefaultValue(v27, v27, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_safeSetObject:forKey:", v28, *MEMORY[0x1E0D30BF8]);

  }
  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[2];
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[HFItemManager sourceItem](self, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hf_hasHomeHubSupportingAccessCodes") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    -[HFItemManager home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "hf_currentUserIsAdministrator");

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PinCodesLabel"));
  -[HUPinCodeDetailsItemManager pinCodeLabelItem](self, "pinCodeLabelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItems:", v16);

  if (v10)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeNameLabelSectionHeader"), CFSTR("HUPinCodeNameLabelSectionHeader"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHeaderTitle:", v17);

  }
  v61 = v9;
  if (objc_msgSend(v9, "isUnknownGuestFromMatter"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeNameLabelSectionFooter"), CFSTR("HUPinCodeNameLabelSectionFooter"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFooterTitle:", v18);

  }
  v59 = v14;
  objc_msgSend(v6, "na_safeAddObject:", v14);
  v60 = v5;
  if (v12)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PinCodesAccessories"));
    -[HUPinCodeDetailsItemManager transformedLocksItemProvider](self, "transformedLocksItemProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingComparator:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    -[HUPinCodeDetailsItemManager pinCodeRestoreAccessItem](self, "pinCodeRestoreAccessItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);

    -[HUPinCodeDetailsItemManager restoreHomeKeyAccessItem](self, "restoreHomeKeyAccessItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v27);

    objc_msgSend(v19, "setItems:", v25);
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeAccessorySectionHeader"), CFSTR("HUPinCodeAccessorySectionHeader"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHeaderTitle:", v28);

    objc_msgSend(v61, "user");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[HFItemManager home](self, "home");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUPinCodeUserAccessorySectionFooter"), CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFooterTitle:", v38);

    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeGuestAccessorySectionFooter"), CFSTR("HUPinCodeGuestAccessorySectionFooter"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFooterTitle:", v30);
    }

    objc_msgSend(v6, "addObject:", v19);
  }
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PinCodesValue"));
  v40 = (void *)MEMORY[0x1E0C99DE8];
  -[HUPinCodeDetailsItemManager pinCodeValueItem](self, "pinCodeValueItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v41;
  -[HUPinCodeDetailsItemManager pinCodeChangeItem](self, "pinCodeChangeItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "arrayWithArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "setItems:", v44);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeValueSectionFooter"), CFSTR("HUPinCodeValueSectionFooter"), 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFooterTitle:", v45);

  objc_msgSend(v6, "na_safeAddObject:", v39);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PersonalPINCode"));
  v47 = (void *)MEMORY[0x1E0C99D20];
  -[HUPinCodeDetailsItemManager personalPINCodeItem](self, "personalPINCodeItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "na_arrayWithSafeObject:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setItems:", v49);

  objc_msgSend(v6, "na_safeAddObject:", v46);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("ShowHomeKeyInWallet"));
  v51 = (void *)MEMORY[0x1E0C99D20];
  -[HUPinCodeDetailsItemManager addOrShowHomeKeyItem](self, "addOrShowHomeKeyItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "na_arrayWithSafeObject:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setItems:", v53);

  objc_msgSend(v6, "na_safeAddObject:", v50);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PinCodesDelete"));
  -[HUPinCodeDetailsItemManager deleteGuestPINCodeItem](self, "deleteGuestPINCodeItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setItems:", v56);

  objc_msgSend(v6, "addObject:", v54);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v6, v60);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUPinCodeDetailsItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUPinCodeDetailsItemManager addOrShowHomeKeyItem](self, "addOrShowHomeKeyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPinCodeDetailsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUPinCodeDetailsItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPinCodeDetailsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUPinCodeDetailsItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HUPinCodeDetailsItemManager *v16;
  SEL v17;
  uint8_t buf[16];

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Updating details", buf, 2u);
  }

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HUPinCodeDetailsItemManager pinCodeManager](self, "pinCodeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pinCodeValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pinCodeForCodeValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__HUPinCodeDetailsItemManager_pinCodeManagerDidUpdate_pinCodes___block_invoke;
    v14[3] = &unk_1E6F5C1F0;
    v15 = v9;
    v16 = self;
    v17 = a2;
    v13 = (id)objc_msgSend(v12, "addSuccessBlock:", v14);

  }
}

id *__64__HUPinCodeDetailsItemManager_pinCodeManagerDidUpdate_pinCodes___block_invoke(id *result, uint64_t a2)
{
  id *v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(result[4], "updateFromPinCode:", a2);
    return (id *)(id)objc_msgSend(v2[5], "reloadAndUpdateAllItemsFromSenderSelector:", v2[6]);
  }
  return result;
}

- (HFTransformItemProvider)transformedLocksItemProvider
{
  return self->_transformedLocksItemProvider;
}

- (void)setTransformedLocksItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transformedLocksItemProvider, a3);
}

- (HFStaticItem)personalPINCodeItem
{
  return self->_personalPINCodeItem;
}

- (void)setPersonalPINCodeItem:(id)a3
{
  objc_storeStrong((id *)&self->_personalPINCodeItem, a3);
}

- (HFStaticItem)pinCodeLabelItem
{
  return self->_pinCodeLabelItem;
}

- (void)setPinCodeLabelItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeLabelItem, a3);
}

- (HFStaticItem)pinCodeValueItem
{
  return self->_pinCodeValueItem;
}

- (void)setPinCodeValueItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeValueItem, a3);
}

- (HFStaticItem)pinCodeChangeItem
{
  return self->_pinCodeChangeItem;
}

- (void)setPinCodeChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeChangeItem, a3);
}

- (HFStaticItem)pinCodeRestoreAccessItem
{
  return self->_pinCodeRestoreAccessItem;
}

- (void)setPinCodeRestoreAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeRestoreAccessItem, a3);
}

- (HFStaticItem)addOrShowHomeKeyItem
{
  return self->_addOrShowHomeKeyItem;
}

- (void)setAddOrShowHomeKeyItem:(id)a3
{
  objc_storeStrong((id *)&self->_addOrShowHomeKeyItem, a3);
}

- (HFStaticItem)deleteGuestPINCodeItem
{
  return self->_deleteGuestPINCodeItem;
}

- (void)setDeleteGuestPINCodeItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteGuestPINCodeItem, a3);
}

- (HFStaticItem)restoreHomeKeyAccessItem
{
  return self->_restoreHomeKeyAccessItem;
}

- (void)setRestoreHomeKeyAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_restoreHomeKeyAccessItem, a3);
}

- (NAFuture)restoreFuture
{
  return self->_restoreFuture;
}

- (void)setRestoreFuture:(id)a3
{
  objc_storeStrong((id *)&self->_restoreFuture, a3);
}

- (BOOL)operationInProgress
{
  return self->_operationInProgress;
}

- (void)setOperationInProgress:(BOOL)a3
{
  self->_operationInProgress = a3;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFAccessoryItemProvider)locksItemProvider
{
  return self->_locksItemProvider;
}

- (void)setLocksItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locksItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locksItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_restoreFuture, 0);
  objc_storeStrong((id *)&self->_restoreHomeKeyAccessItem, 0);
  objc_storeStrong((id *)&self->_deleteGuestPINCodeItem, 0);
  objc_storeStrong((id *)&self->_addOrShowHomeKeyItem, 0);
  objc_storeStrong((id *)&self->_pinCodeRestoreAccessItem, 0);
  objc_storeStrong((id *)&self->_pinCodeChangeItem, 0);
  objc_storeStrong((id *)&self->_pinCodeValueItem, 0);
  objc_storeStrong((id *)&self->_pinCodeLabelItem, 0);
  objc_storeStrong((id *)&self->_personalPINCodeItem, 0);
  objc_storeStrong((id *)&self->_transformedLocksItemProvider, 0);
}

@end
