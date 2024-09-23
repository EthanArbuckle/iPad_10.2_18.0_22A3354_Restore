@implementation HUPersonalPINCodeItemManager

- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3 item:(id)a4 pinCodeManager:(id)a5 home:(id)a6
{
  id v11;
  id v12;
  HUPersonalPINCodeItemManager *v13;
  HUPersonalPINCodeItemManager *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HUPersonalPINCodeItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v16, sel_initWithDelegate_sourceItem_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pinCodeManager, a5);
    objc_storeStrong((id *)&v14->_overrideHome, a6);
  }

  return v14;
}

- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_item_pinCodeManager_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalPINCodeItemManager.m"), 58, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalPINCodeItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_item_pinCodeManager_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalPINCodeItemManager.m"), 63, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalPINCodeItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  char v50;
  char v51;
  unint64_t v52;
  id v53;
  id v54;
  _QWORD v55[5];
  char v56;
  _QWORD v57[4];
  id v58;
  id v59;
  char v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (unint64_t)v8;
  else
    v9 = 0;

  v52 = v9;
  if (!(v9 | v7))
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Expected Item %@ to be a pin code or user"), v10);

  }
  v11 = objc_msgSend((id)v7, "isGuest");
  if ((objc_msgSend(v4, "hf_hasHomeHubSupportingAccessCodes") & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v4, "hf_currentUserIsOwner");
  v13 = objc_alloc(MEMORY[0x1E0D31840]);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke;
  v57[3] = &unk_1E6F4D650;
  v58 = v4;
  v59 = (id)v7;
  v60 = v11;
  v53 = v4;
  v54 = (id)v7;
  v14 = (void *)objc_msgSend(v13, "initWithResultsBlock:", v57);
  -[HUPersonalPINCodeItemManager setPinCodeValueItem:](self, "setPinCodeValueItem:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D31840]);
  v16 = v11;
  v51 = v11;
  v17 = *MEMORY[0x1E0D30D18];
  v66[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeChangeCellTitle"), CFSTR("HUPinCodeChangeCellTitle"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v18;
  v19 = *MEMORY[0x1E0D30D70];
  v66[1] = *MEMORY[0x1E0D30D70];
  if (v7)
    v20 = v12;
  else
    v20 = 0;
  v50 = v20;
  if (!v7)
    v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20 ^ 1u);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v22 = v12;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v15, "initWithResults:", v23);
  -[HUPersonalPINCodeItemManager setPinCodeChangeItem:](self, "setPinCodeChangeItem:", v24);

  v25 = objc_alloc(MEMORY[0x1E0D31840]);
  v64[0] = v17;
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeShareButtonTitle"), CFSTR("HUPinCodeShareButtonTitle"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v19;
  v65[0] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16 ^ 1u);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v25, "initWithResults:", v28);
  -[HUPersonalPINCodeItemManager setShareButtonItem:](self, "setShareButtonItem:", v29);

  if (v54)
    v30 = 1;
  else
    v30 = v52 == 0;
  if (v30)
    v31 = 0;
  else
    v31 = v22;
  v32 = objc_alloc(MEMORY[0x1E0D31840]);
  v62[0] = v17;
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeCreateUserPINButtonTitle"), CFSTR("HUPinCodeCreateUserPINButtonTitle"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v19;
  v63[0] = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31 ^ 1u);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v32, "initWithResults:", v35);
  -[HUPersonalPINCodeItemManager setCreateUserPINButtonItem:](self, "setCreateUserPINButtonItem:", v36);

  v37 = objc_alloc(MEMORY[0x1E0D31840]);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke_2;
  v55[3] = &unk_1E6F4DF80;
  v56 = v50 & ~v51;
  v55[4] = self;
  v38 = (void *)objc_msgSend(v37, "initWithResultsBlock:", v55);
  -[HUPersonalPINCodeItemManager setRemoveUserPINButtonItem:](self, "setRemoveUserPINButtonItem:", v38);

  v39 = (void *)objc_opt_new();
  -[HUPersonalPINCodeItemManager pinCodeValueItem](self, "pinCodeValueItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "na_safeAddObject:", v40);

  -[HUPersonalPINCodeItemManager pinCodeChangeItem](self, "pinCodeChangeItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "na_safeAddObject:", v41);

  -[HUPersonalPINCodeItemManager shareButtonItem](self, "shareButtonItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "na_safeAddObject:", v42);

  -[HUPersonalPINCodeItemManager createUserPINButtonItem](self, "createUserPINButtonItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "na_safeAddObject:", v43);

  -[HUPersonalPINCodeItemManager removeUserPINButtonItem](self, "removeUserPINButtonItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "na_safeAddObject:", v44);

  v45 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v45, "initWithItems:", v46);

  v61 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

id __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeValueCellTitle"), CFSTR("HUPinCodeValueCellTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isActive") & 1) == 0)
  {

LABEL_7:
    _HULocalizedStringWithDefaultValue(CFSTR("HUPINCodeMasking"), CFSTR("HUPINCodeMasking"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 48))
    v8 = 1;

  if (v8 != 1)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 40), "pinCodeValue");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = (void *)v10;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(a1 + 40) == 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeRemoveUserPINButtonTitle"), CFSTR("HUPinCodeRemoveUserPINButtonTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 40) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "operationInProgress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
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
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PinCodeValue"));
  -[HUPersonalPINCodeItemManager pinCodeValueItem](self, "pinCodeValueItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  -[HUPersonalPINCodeItemManager pinCodeChangeItem](self, "pinCodeChangeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v10);

  objc_msgSend(v6, "na_safeAddObject:", v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("SharePinCode"));
  -[HUPersonalPINCodeItemManager shareButtonItem](self, "shareButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItems:", v13);

  objc_msgSend(v6, "na_safeAddObject:", v11);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("CreateRemovePIN"));
  -[HUPersonalPINCodeItemManager createUserPINButtonItem](self, "createUserPINButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalPINCodeItemManager removeUserPINButtonItem](self, "removeUserPINButtonItem", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItems:", v17);

  objc_msgSend(v6, "na_safeAddObject:", v14);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v6, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUPersonalPINCodeItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemsToUpdateForApplicationResignActive
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUPersonalPINCodeItemManager pinCodeValueItem](self, "pinCodeValueItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (HFStaticItem)shareButtonItem
{
  return self->_shareButtonItem;
}

- (void)setShareButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareButtonItem, a3);
}

- (HFStaticItem)createUserPINButtonItem
{
  return self->_createUserPINButtonItem;
}

- (void)setCreateUserPINButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_createUserPINButtonItem, a3);
}

- (HFStaticItem)removeUserPINButtonItem
{
  return self->_removeUserPINButtonItem;
}

- (void)setRemoveUserPINButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeUserPINButtonItem, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_removeUserPINButtonItem, 0);
  objc_storeStrong((id *)&self->_createUserPINButtonItem, 0);
  objc_storeStrong((id *)&self->_shareButtonItem, 0);
  objc_storeStrong((id *)&self->_pinCodeChangeItem, 0);
  objc_storeStrong((id *)&self->_pinCodeValueItem, 0);
}

@end
