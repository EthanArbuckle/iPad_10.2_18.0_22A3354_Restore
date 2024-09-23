@implementation HUFaceRecognitionItemModule

- (HUFaceRecognitionItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUFaceRecognitionItemModule *v8;
  HUFaceRecognitionItemModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFaceRecognitionItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_home, a4);

  return v9;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  char v26;
  BOOL v27;
  id location;

  -[HUFaceRecognitionItemModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "camerasAccessLevel") == 2;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  -[HUFaceRecognitionItemModule staticItemProvider](self, "staticItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc(MEMORY[0x1E0D31840]);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __44__HUFaceRecognitionItemModule_itemProviders__block_invoke;
    v24 = &unk_1E6F4E270;
    objc_copyWeak(&v25, &location);
    v26 = v8;
    v27 = v7;
    v11 = (void *)objc_msgSend(v10, "initWithResultsBlock:", &v21);
    -[HUFaceRecognitionItemModule setFaceRecognitionCellItem:](self, "setFaceRecognitionCellItem:", v11);

    v12 = objc_alloc(MEMORY[0x1E0D31848]);
    v13 = (void *)MEMORY[0x1E0C99E60];
    -[HUFaceRecognitionItemModule faceRecognitionCellItem](self, "faceRecognitionCellItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObjects:", v14, 0, v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithItems:", v15);
    -[HUFaceRecognitionItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v16);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HUFaceRecognitionItemModule staticItemProvider](self, "staticItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObjects:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __44__HUFaceRecognitionItemModule_itemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personManagerSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "isFaceClassificationEnabled") & 1) != 0 || *(_BYTE *)(a1 + 40) != 0;

  v6 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionModuleRecognitionCell"), CFSTR("HUFaceRecognitionModuleRecognitionCell"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30CE8];
  v19[0] = v7;
  v19[1] = MEMORY[0x1E0C9AAA0];
  v9 = *MEMORY[0x1E0D30C80];
  v18[1] = v8;
  v18[2] = v9;
  if (*(_BYTE *)(a1 + 41))
    v10 = 0;
  else
    v10 = *(_BYTE *)(a1 + 40) == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  v18[3] = *MEMORY[0x1E0D30BF8];
  if (v5)
    v12 = CFSTR("HUFaceRecognitionModuleRecognitionCellOn");
  else
    v12 = CFSTR("HUFaceRecognitionModuleRecognitionCellOff");
  _HULocalizedStringWithDefaultValue(v12, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  v18[4] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionItemModuleMainSectionIdentifier"));
  -[HUFaceRecognitionItemModule faceRecognitionCellItem](self, "faceRecognitionCellItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v7);

  objc_msgSend(v4, "addObject:", v5);
  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFStaticItem)faceRecognitionCellItem
{
  return self->_faceRecognitionCellItem;
}

- (void)setFaceRecognitionCellItem:(id)a3
{
  objc_storeStrong((id *)&self->_faceRecognitionCellItem, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_faceRecognitionCellItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
