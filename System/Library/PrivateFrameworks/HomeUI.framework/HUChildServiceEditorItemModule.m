@implementation HUChildServiceEditorItemModule

+ (id)supportedServiceTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUChildServiceEditorItemModule.m"), 22, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HUChildServiceEditorItemModule supportedServiceTypes]", objc_opt_class());

  return 0;
}

+ (id)childItemComparator
{
  return &__block_literal_global_275;
}

uint64_t __53__HUChildServiceEditorItemModule_childItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0D30C80];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v5, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (!v14 || v17)
  {
    if ((v14 | v17 ^ 1) == 1)
    {
      if (v8)
        v18 = -1;
      else
        v18 = v10 != 0;
      if (v8 && v10)
        v18 = objc_msgSend(v8, "localizedStandardCompare:", v10);
    }
    else
    {
      v18 = -1;
    }
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (HUChildServiceEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 mode:(unint64_t)a6
{
  id v12;
  id v13;
  HUChildServiceEditorItemModule *v14;
  uint64_t v15;
  NSSet *itemProviders;
  void *v18;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUChildServiceEditorItemModule;
  v14 = -[HFItemModule initWithItemUpdater:](&v19, sel_initWithItemUpdater_, a3);
  if (v14)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("HUChildServiceEditorItemModule.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceItem"));

    }
    objc_storeStrong((id *)&v14->_home, a4);
    objc_storeStrong((id *)&v14->_sourceItem, a5);
    v14->_editingMode = a6;
    -[HUChildServiceEditorItemModule _createItemProviders](v14, "_createItemProviders");
    v15 = objc_claimAutoreleasedReturnValue();
    itemProviders = v14->_itemProviders;
    v14->_itemProviders = (NSSet *)v15;

  }
  return v14;
}

- (HMAccessory)accessory
{
  void *v2;
  void *v3;
  void *v4;

  -[HUChildServiceEditorItemModule sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessory *)v4;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v4;
  NSSet *v5;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    -[HUChildServiceEditorItemModule _createItemProviders](self, "_createItemProviders");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)_createItemProviders
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  -[HUChildServiceEditorItemModule childServiceItemProvider](self, "childServiceItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D317D8]);
    -[HUChildServiceEditorItemModule home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedServiceTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithHome:serviceTypes:", v5, v6);
    -[HUChildServiceEditorItemModule setChildServiceItemProvider:](self, "setChildServiceItemProvider:", v7);

    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "supportedServiceTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke;
    v17[3] = &unk_1E6F5F218;
    objc_copyWeak(&v19, &location);
    v11 = v10;
    v18 = v11;
    -[HUChildServiceEditorItemModule childServiceItemProvider](self, "childServiceItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceServiceGenerator:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HUChildServiceEditorItemModule childServiceItemProvider](self, "childServiceItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeKitObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(v9, "hf_childServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_2;
    v37[3] = &unk_1E6F4EE58;
    v38 = *(id *)(a1 + 32);
    objc_msgSend(v11, "na_filter:", v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithResult:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v38;
  }
  else
  {
    objc_msgSend(WeakRetained, "sourceItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "homeKitObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(WeakRetained, "sourceItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "homeKitObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      v22 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(v21, "hf_visibleServices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_3;
      v35[3] = &unk_1E6F4EE58;
      v36 = *(id *)(a1 + 32);
      objc_msgSend(v11, "na_filter:", v35);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "futureWithResult:", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v36;
    }
    else
    {
      objc_msgSend(WeakRetained, "sourceItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) == 0)
      {
        v13 = 0;
        goto LABEL_17;
      }
      objc_opt_class();
      objc_msgSend(WeakRetained, "sourceItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v27;

      objc_msgSend(v28, "accessoryBuilder");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(v11, "hf_visibleServices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_4;
      v33[3] = &unk_1E6F4EE58;
      v34 = *(id *)(a1 + 32);
      objc_msgSend(v14, "na_filter:", v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "futureWithResult:", v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_17:
  return v13;
}

uint64_t __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __54__HUChildServiceEditorItemModule__createItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_isConfiguredControlItemForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childItemsForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_18_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __66__HUChildServiceEditorItemModule__isConfiguredControlItemForItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  if (_MergedGlobals_2_3 != -1)
    dispatch_once(&_MergedGlobals_2_3, &__block_literal_global_22_5);
  v3 = (id)qword_1EF226C38;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "characteristicOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allCharacteristicTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intersectsSet:", v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __66__HUChildServiceEditorItemModule__isConfiguredControlItemForItem___block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8B18];
  v5[0] = *MEMORY[0x1E0CB8918];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1EF226C38;
  qword_1EF226C38 = v3;

}

- (int64_t)configurationStateForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[HUChildServiceEditorItemModule _isConfiguredControlItemForItem:](self, "_isConfiguredControlItemForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (objc_msgSend(v6, "unsignedIntegerValue") == 2)
        v7 = 3;
      else
        v7 = 2;
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canToggleConfigurationStateForItem:(id)a3
{
  int64_t v4;
  void *v5;
  char v6;
  BOOL v7;
  BOOL v8;

  v4 = -[HUChildServiceEditorItemModule configurationStateForItem:](self, "configurationStateForItem:", a3);
  -[HUChildServiceEditorItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");
  if (v4)
    v7 = v6;
  else
    v7 = 0;
  v8 = v4 != 1 && v7;

  return v8;
}

- (id)toggleConfigurationStateForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUChildServiceEditorItemModule _isConfiguredControlItemForItem:](self, "_isConfiguredControlItemForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("No control item found for item %@!"), v4);
  objc_msgSend(v5, "toggleValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (HFServiceItemProvider)childServiceItemProvider
{
  return self->_childServiceItemProvider;
}

- (void)setChildServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_childServiceItemProvider, a3);
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_childServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
