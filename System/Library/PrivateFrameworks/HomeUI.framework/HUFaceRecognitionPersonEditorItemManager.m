@implementation HUFaceRecognitionPersonEditorItemManager

+ (id)dateFormatter
{
  if (qword_1EF2269B0 != -1)
    dispatch_once(&qword_1EF2269B0, &__block_literal_global_14);
  return (id)_MergedGlobals_3_0;
}

void __57__HUFaceRecognitionPersonEditorItemManager_dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D313F0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relativeDateFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = v0;

}

- (HUFaceRecognitionPersonEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  HUFaceRecognitionPersonEditorItemManager *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  HMHome *personHome;
  uint64_t v14;
  HFUserNameFormatter *userNameFormatter;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EF347D90) & 1) == 0)
    NSLog(CFSTR("Source item %@ does not implement required protocol HFPersonLikeItem"), v7);
  v17.receiver = self;
  v17.super_class = (Class)HUFaceRecognitionPersonEditorItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v17, sel_initWithDelegate_sourceItem_, v6, v7);
  if (v8)
  {
    v9 = v7;
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF347D90))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "home");
    v12 = objc_claimAutoreleasedReturnValue();

    personHome = v8->_personHome;
    v8->_personHome = (HMHome *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31998]), "initWithHome:", v8->_personHome);
    userNameFormatter = v8->_userNameFormatter;
    v8->_userNameFormatter = (HFUserNameFormatter *)v14;

    -[HFUserNameFormatter setStyle:](v8->_userNameFormatter, "setStyle:", 0);
  }

  return v8;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUFaceRecognitionPersonEditorItemManager personHome](self, "personHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  char v40;
  _QWORD v41[4];
  id v42;
  id v43;
  char v44;
  _QWORD v45[4];
  id v46;
  char v47;
  id location;
  _QWORD v49[4];
  char v50;

  v36 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionPersonEditorItemManager personItem](self, "personItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  v6 = objc_alloc(MEMORY[0x1E0D31920]);
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)objc_msgSend(v6, "initWithSourceItem:transformationBlock:", v7, &__block_literal_global_69);
  -[HUFaceRecognitionPersonEditorItemManager setFaceCropItem:](self, "setFaceCropItem:", v8);

  v9 = objc_alloc(MEMORY[0x1E0D31920]);
  v10 = (void *)objc_msgSend(v4, "copy");
  v11 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_3;
  v49[3] = &__block_descriptor_33_e36___NSDictionary_16__0__NSDictionary_8l;
  v50 = v5;
  v12 = (void *)objc_msgSend(v9, "initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:", v10, &__block_literal_global_72, v49);
  -[HUFaceRecognitionPersonEditorItemManager setNameItem:](self, "setNameItem:", v12);

  objc_initWeak(&location, self);
  v13 = objc_alloc(MEMORY[0x1E0D31920]);
  v14 = (void *)objc_msgSend(v4, "copy");
  v45[0] = v11;
  v45[1] = 3221225472;
  v45[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_5;
  v45[3] = &unk_1E6F4D5B0;
  objc_copyWeak(&v46, &location);
  v47 = v5;
  v15 = (void *)objc_msgSend(v13, "initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:", v14, &__block_literal_global_74, v45);
  -[HUFaceRecognitionPersonEditorItemManager setAddNameItem:](self, "setAddNameItem:", v15);

  -[HFItemManager home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "personSettingsManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0D31840]);
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_6;
  v41[3] = &unk_1E6F4D650;
  v19 = v4;
  v42 = v19;
  v35 = v17;
  v43 = v35;
  v44 = v5;
  v20 = (void *)objc_msgSend(v18, "initWithResultsBlock:", v41);
  -[HUFaceRecognitionPersonEditorItemManager setHideNotificationsItem:](self, "setHideNotificationsItem:", v20);

  v21 = objc_alloc(MEMORY[0x1E0D31920]);
  v22 = (void *)objc_msgSend(v19, "copy");
  v38[0] = v11;
  v38[1] = 3221225472;
  v38[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_10;
  v38[3] = &unk_1E6F4D5B0;
  objc_copyWeak(&v39, &location);
  v40 = v5;
  v23 = (void *)objc_msgSend(v21, "initWithSourceItem:transformationBlock:", v22, v38);
  -[HUFaceRecognitionPersonEditorItemManager setDeleteItem:](self, "setDeleteItem:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D31848]);
  v25 = (void *)MEMORY[0x1E0C99E60];
  -[HUFaceRecognitionPersonEditorItemManager faceCropItem](self, "faceCropItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionPersonEditorItemManager nameItem](self, "nameItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionPersonEditorItemManager addNameItem](self, "addNameItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionPersonEditorItemManager hideNotificationsItem](self, "hideNotificationsItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionPersonEditorItemManager deleteItem](self, "deleteItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithObjects:", v26, v27, v28, v29, v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v24, "initWithItems:", v31);
  -[HUFaceRecognitionPersonEditorItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v32);

  -[HUFaceRecognitionPersonEditorItemManager staticItemProvider](self, "staticItemProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v33);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

  return v37;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *MEMORY[0x1E0D30A90];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v3, v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 == 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0D30D70]);

  return v4;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
  if ((v2 & 1) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30918]);
  return v3;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
    v9 = *(unsigned __int8 *)(a1 + 32);
  else
    v9 = 1;
  objc_msgSend(v7, "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30C80]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30CE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "length") == 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30D70]);

  v12 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);

  return v4;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
  if ((v2 & 1) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30918]);
  return v3;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
    v8 = CFSTR("HUFaceRecognitionPersonEditorUnknownPersonNameButton");
  else
    v8 = CFSTR("HUFaceRecognitionPersonEditorUnknownPersonNameButtonPhotoLibrary");
  _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D18]);

  objc_msgSend(WeakRetained, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_currentUserIsAdministrator");

  objc_msgSend(v3, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(v13, "length"))
    v15 = 1;
  else
    v15 = v12 ^ 1u;
  objc_msgSend(v14, "numberWithInt:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30D70]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30CE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30C80]);

  v18 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v18);

  return v5;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  char v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_7;
  v10[3] = &unk_1E6F4D600;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "futureWithBlock:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_9;
  v7[3] = &unk_1E6F4D628;
  v8 = *(id *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_8;
    v7[3] = &unk_1E6F4D5D8;
    v8 = v3;
    objc_msgSend(v6, "fetchClassificationNotificationsEnabledForPersonWithUUID:completion:", v5, v7);

  }
  else
  {
    objc_msgSend(v3, "finishWithNoResult");
  }

}

void __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPersonEditorHideNotifications"), CFSTR("HUFaceRecognitionPersonEditorHideNotifications"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v5 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(v7, "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D70]);

  objc_opt_class();
  v11 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v14, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30E20]);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id *v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v15[0] = *MEMORY[0x1E0D30D18];
  v7 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPersonEditorRemoveButton"), CFSTR("HUFaceRecognitionPersonEditorRemoveButton"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v15[1] = *MEMORY[0x1E0D30D70];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  if (v11)
  {
    objc_msgSend(WeakRetained, "home");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hf_currentUserIsAdministrator"))
      v7 = *(unsigned __int8 *)(a1 + 40);
  }
  objc_msgSend(v9, "numberWithInt:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v55[4];
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];

  v59[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  v8 = 0x1E0D31000uLL;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionPersonInformationSectionIdentifier"));
  -[HUFaceRecognitionPersonEditorItemManager faceCropItem](self, "faceCropItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v10;
  -[HUFaceRecognitionPersonEditorItemManager nameItem](self, "nameItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v11;
  -[HUFaceRecognitionPersonEditorItemManager addNameItem](self, "addNameItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v13);

  -[HUFaceRecognitionPersonEditorItemManager personItem](self, "personItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A98]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v16, "BOOLValue");

  -[HUFaceRecognitionPersonEditorItemManager personItem](self, "personItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v13 & 1) == 0 && (v7 & 1) == 0)
  {
    objc_msgSend(v17, "personManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUFaceRecognitionPersonEditorItemManager personHome](self, "personHome");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_allUsersIncludingCurrentUser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __77__HUFaceRecognitionPersonEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v55[3] = &unk_1E6F4D040;
    v56 = v19;
    v22 = v19;
    objc_msgSend(v21, "na_firstObjectPassingTest:", v55);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[HFItemManager home](self, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hf_handleForUser:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUFaceRecognitionPersonEditorItemManager userNameFormatter](self, "userNameFormatter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringForObjectValue:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUFaceRecognitionPersonEditorFromUserPhotoLibraryFormat"), CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 0x1E0D31000;
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPersonEditorFromAPhotoLibrary"), CFSTR("HUFaceRecognitionPersonEditorFromAPhotoLibrary"), 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = 0x1E0C99000uLL;

    v38 = v56;
    goto LABEL_14;
  }
  objc_opt_class();
  v35 = objc_opt_isKindOfClass() | v7;

  if ((v35 & 1) != 0)
  {
    -[HUFaceRecognitionPersonEditorItemManager personItem](self, "personItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "latestResults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A80]);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v34 = 0;
      v46 = 0x1E0C99000;
      goto LABEL_15;
    }
    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringFromDate:", v22);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUFaceRecognitionPersonEditorLastVisitedFooterFormat"), CFSTR("%@"), v40, v41, v42, v43, v44, v45, (uint64_t)v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0x1E0C99000;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  v34 = 0;
  v46 = 0x1E0C99000;
LABEL_16:
  objc_msgSend(v9, "setFooterTitle:", v34);
  objc_msgSend(v6, "addObject:", v9);
  v47 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 1392)), "initWithIdentifier:", CFSTR("HUFaceRecognitionPersonNotificationSectionIdentifier"));
  -[HUFaceRecognitionPersonEditorItemManager hideNotificationsItem](self, "hideNotificationsItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v48;
  objc_msgSend(*(id *)(v46 + 3360), "arrayWithObjects:count:", &v58, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setItems:", v49);

  objc_msgSend(v6, "addObject:", v47);
  v50 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 1392)), "initWithIdentifier:", CFSTR("HUFaceRecognitionPersonDeletionSectionIdentifier"));
  -[HUFaceRecognitionPersonEditorItemManager deleteItem](self, "deleteItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v51;
  objc_msgSend(*(id *)(v46 + 3360), "arrayWithObjects:count:", &v57, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setItems:", v52);

  objc_msgSend(v6, "addObject:", v50);
  objc_msgSend(*(id *)(v8 + 1392), "filterSections:toDisplayedItems:", v6, v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

uint64_t __77__HUFaceRecognitionPersonEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "photosPersonManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (HFItem)faceCropItem
{
  return self->_faceCropItem;
}

- (void)setFaceCropItem:(id)a3
{
  objc_storeStrong((id *)&self->_faceCropItem, a3);
}

- (HFItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameItem, a3);
}

- (HFItem)addNameItem
{
  return self->_addNameItem;
}

- (void)setAddNameItem:(id)a3
{
  objc_storeStrong((id *)&self->_addNameItem, a3);
}

- (HFStaticItem)hideNotificationsItem
{
  return self->_hideNotificationsItem;
}

- (void)setHideNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_hideNotificationsItem, a3);
}

- (HFItem)deleteItem
{
  return self->_deleteItem;
}

- (void)setDeleteItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteItem, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HMHome)personHome
{
  return self->_personHome;
}

- (void)setPersonHome:(id)a3
{
  objc_storeStrong((id *)&self->_personHome, a3);
}

- (HFUserNameFormatter)userNameFormatter
{
  return self->_userNameFormatter;
}

- (void)setUserNameFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_userNameFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNameFormatter, 0);
  objc_storeStrong((id *)&self->_personHome, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_hideNotificationsItem, 0);
  objc_storeStrong((id *)&self->_addNameItem, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);
  objc_storeStrong((id *)&self->_faceCropItem, 0);
}

@end
