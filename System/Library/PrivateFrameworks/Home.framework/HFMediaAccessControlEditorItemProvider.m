@implementation HFMediaAccessControlEditorItemProvider

- (HFMediaAccessControlEditorItemProvider)initWithHome:(id)a3
{
  id v5;
  void *v6;
  HFMediaAccessControlEditorItemProvider *v7;
  uint64_t v8;
  NSMutableDictionary *itemForIdentifier;
  objc_super v11;

  v5 = a3;
  -[HFMediaAccessControlEditorItemProvider _buildItems](self, "_buildItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HFMediaAccessControlEditorItemProvider;
  v7 = -[HFStaticItemProvider initWithItems:](&v11, sel_initWithItems_, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_home, a3);
    v8 = objc_opt_new();
    itemForIdentifier = v7->_itemForIdentifier;
    v7->_itemForIdentifier = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (HFMediaAccessControlEditorItemProvider)initWithItems:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessControlEditorItemProvider.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessControlEditorItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)_buildItems
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HFStaticItem *v10;
  id v11;
  HFStaticItem *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  HFStaticItem *v16;
  HFStaticItem *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  HFStaticItem *v22;
  HFStaticItem *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40[2];
  id location;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[HFMediaAccessControlEditorItemProvider accessControlItems](self, "accessControlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = 0;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      NSLocalizedStringFromHFMediaAccessControlClassification((uint64_t)v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("AccessControlItem"), "stringByAppendingFormat:", CFSTR("_%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = [HFStaticItem alloc];
      v38[0] = v7;
      v38[1] = 3221225472;
      v38[2] = __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke;
      v38[3] = &unk_1EA73CE48;
      objc_copyWeak(v40, &location);
      v40[1] = v6;
      v11 = v9;
      v39 = v11;
      v12 = -[HFStaticItem initWithResultsBlock:](v10, "initWithResultsBlock:", v38);
      objc_msgSend(v5, "addObject:", v12);
      -[HFMediaAccessControlEditorItemProvider itemForIdentifier](self, "itemForIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);

      objc_destroyWeak(v40);
      ++v6;
    }
    while (v6 != (char *)3);
    -[HFMediaAccessControlEditorItemProvider setAccessControlItems:](self, "setAccessControlItems:", v5);

  }
  -[HFMediaAccessControlEditorItemProvider passwordEnableItem](self, "passwordEnableItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = [HFStaticItem alloc];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_2;
    v36[3] = &unk_1EA7317B0;
    objc_copyWeak(&v37, &location);
    v17 = -[HFStaticItem initWithResultsBlock:](v16, "initWithResultsBlock:", v36);
    -[HFMediaAccessControlEditorItemProvider setPasswordEnableItem:](self, "setPasswordEnableItem:", v17);

    -[HFMediaAccessControlEditorItemProvider passwordEnableItem](self, "passwordEnableItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessControlEditorItemProvider itemForIdentifier](self, "itemForIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("PasswordItem"));

    objc_destroyWeak(&v37);
  }
  -[HFMediaAccessControlEditorItemProvider passwordItem](self, "passwordItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
  {
    v22 = [HFStaticItem alloc];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_3;
    v34[3] = &unk_1EA7317B0;
    objc_copyWeak(&v35, &location);
    v23 = -[HFStaticItem initWithResultsBlock:](v22, "initWithResultsBlock:", v34);
    -[HFMediaAccessControlEditorItemProvider setPasswordItem:](self, "setPasswordItem:", v23);

    -[HFMediaAccessControlEditorItemProvider passwordItem](self, "passwordItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessControlEditorItemProvider itemForIdentifier](self, "itemForIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("PasswordEnableItem"));

    objc_destroyWeak(&v35);
  }
  v26 = (void *)MEMORY[0x1E0C99E60];
  -[HFMediaAccessControlEditorItemProvider accessControlItems](self, "accessControlItems");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessControlEditorItemProvider passwordItem](self, "passwordItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v28;
  -[HFMediaAccessControlEditorItemProvider passwordEnableItem](self, "passwordEnableItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v32;
}

id __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(WeakRetained, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessControlDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == objc_msgSend(v5, "access");

  v7 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = CFSTR("title");
  NSLocalizedStringFromHFMediaAccessControlClassification(*(_QWORD *)(a1 + 48), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v19[0] = v8;
  v19[1] = v9;
  v18[1] = CFSTR("HFAccessControlItemIdentifier");
  v18[2] = CFSTR("selected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  v18[3] = CFSTR("HFAccessControlValueResultKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  v18[4] = CFSTR("dependentHomeKitObjects");
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[9];

  v23[7] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_accessControlDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessSupportsPassword") ^ 1;

  v19 = (void *)MEMORY[0x1E0D519C0];
  v22[0] = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessControlRequirePasswordTitle"), CFSTR("HFMediaAccessControlRequirePasswordTitle"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v23[1] = CFSTR("HFMediaAccessControlRequirePasswordTitle");
  v22[1] = CFSTR("titleLocalizationKey");
  v22[2] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  v22[3] = CFSTR("selected");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_accessControlDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "accessRequiresPassword"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v7;
  v23[4] = CFSTR("PasswordItem");
  v22[4] = CFSTR("HFAccessControlItemIdentifier");
  v22[5] = CFSTR("HFAccessControlValueResultKey");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_accessControlDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v10, "accessRequiresPassword"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v11;
  v22[6] = CFSTR("dependentHomeKitObjects");
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __53__HFMediaAccessControlEditorItemProvider__buildItems__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_accessControlDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessSupportsPassword");

  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessControlDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessRequiresPassword");

  v8 = v4 & v7 ^ 1u;
  v9 = (void *)MEMORY[0x1E0D519C0];
  v23[0] = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessControlPasswordTitle"), CFSTR("HFMediaAccessControlPasswordTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v23[1] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  v24[2] = CFSTR("PasswordEnableItem");
  v23[2] = CFSTR("HFAccessControlItemIdentifier");
  v23[3] = CFSTR("HFAccessControlValueResultKey");
  objc_msgSend(WeakRetained, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_accessControlDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessPassword");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1EA741FF8;
  if (v14)
    v16 = (const __CFString *)v14;
  v24[3] = v16;
  v23[4] = CFSTR("dependentHomeKitObjects");
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)items
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HFMediaAccessControlEditorItemProvider accessControlItems](self, "accessControlItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaAccessControlEditorItemProvider passwordItem](self, "passwordItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v6);

  -[HFMediaAccessControlEditorItemProvider passwordEnableItem](self, "passwordEnableItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v7);

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)accessControlItems
{
  return self->_accessControlItems;
}

- (void)setAccessControlItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HFStaticItem)passwordEnableItem
{
  return self->_passwordEnableItem;
}

- (void)setPasswordEnableItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HFStaticItem)passwordItem
{
  return self->_passwordItem;
}

- (void)setPasswordItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableDictionary)itemForIdentifier
{
  return self->_itemForIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemForIdentifier, 0);
  objc_storeStrong((id *)&self->_passwordItem, 0);
  objc_storeStrong((id *)&self->_passwordEnableItem, 0);
  objc_storeStrong((id *)&self->_accessControlItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
