@implementation HUMatterConnectedServicesListItem

- (HUMatterConnectedServicesListItem)initWithAccessory:(id)a3 home:(id)a4 itemProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUMatterConnectedServicesListItem *v12;
  HUMatterConnectedServicesListItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((v9 != 0) == (v10 != 0))
    NSLog(CFSTR("Exactly one should be non-nil."));
  v15.receiver = self;
  v15.super_class = (Class)HUMatterConnectedServicesListItem;
  v12 = -[HUMatterConnectedServicesListItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessory, a3);
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v13->_itemProvider, a5);
  }

  return v13;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v20[0] = *MEMORY[0x1E0D30D18];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMatterConnectedServicesTitle"), CFSTR("HUMatterConnectedServicesTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D30BF8];
    v21[0] = v7;
    v21[1] = &stru_1E6F60E80;
    v9 = *MEMORY[0x1E0D30D88];
    v20[1] = v8;
    v20[2] = v9;
    v20[3] = *MEMORY[0x1E0D30D70];
    v21[2] = MEMORY[0x1E0C9AAB0];
    v21[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithResult:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_initWeak(&location, self);
    -[HUMatterConnectedServicesListItem itemProvider](self, "itemProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__HUMatterConnectedServicesListItem__subclass_updateWithOptions___block_invoke;
    v17[3] = &unk_1E6F4D9D8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "flatMap:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v13;
}

id __65__HUMatterConnectedServicesListItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(WeakRetained, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsCHIP") ^ 1;
    if (v4 < 2)
      v8 = 1;
    else
      v8 = v7;

  }
  else
  {
    v8 = v4 == 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMatterConnectedServicesTitle"), CFSTR("HUMatterConnectedServicesTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D30BF8];
  v20[0] = v10;
  v20[1] = v9;
  v12 = *MEMORY[0x1E0D30D88];
  v19[1] = v11;
  v19[2] = v12;
  v20[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMHome)home
{
  return self->_home;
}

- (HFItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
