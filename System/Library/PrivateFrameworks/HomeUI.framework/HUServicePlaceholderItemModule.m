@implementation HUServicePlaceholderItemModule

- (HUDashboardContext)context
{
  return self->_context;
}

- (id)buildItemProviders
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  +[HUAddAccessoryUtilities addAccessoryLocalizationStringKey](HUAddAccessoryUtilities, "addAccessoryLocalizationStringKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HFStaticItem-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D31840]);
  v22[0] = *MEMORY[0x1E0D30D18];
  +[HUAddAccessoryUtilities addAccessoryString](HUAddAccessoryUtilities, "addAccessoryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30D90];
  v23[0] = v7;
  v23[1] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0D30C60];
  v22[1] = v8;
  v22[2] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("plus"));
  v11 = *MEMORY[0x1E0D30D70];
  v23[2] = v10;
  v23[3] = MEMORY[0x1E0C9AAA0];
  v12 = *MEMORY[0x1E0D30E10];
  v22[3] = v11;
  v22[4] = v12;
  v23[4] = v5;
  v22[5] = *MEMORY[0x1E0D30B28];
  v23[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v6, "initWithResults:", v13);

  v15 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithItems:", v16);
  -[HUServicePlaceholderItemModule setPlaceholderItemProvider:](self, "setPlaceholderItemProvider:", v17);

  v18 = (void *)MEMORY[0x1E0C99E60];
  -[HUServicePlaceholderItemModule placeholderItemProvider](self, "placeholderItemProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setPlaceholderItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderItemProvider, a3);
}

- (HFStaticItemProvider)placeholderItemProvider
{
  return self->_placeholderItemProvider;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("servicePlaceholder"));
  -[HUServicePlaceholderItemModule placeholderItemProvider](self, "placeholderItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setItems:", v9);
  v10 = (void *)MEMORY[0x1E0D314B0];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filterSections:toDisplayedItems:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
