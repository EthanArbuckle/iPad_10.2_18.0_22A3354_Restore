@implementation HUHomeHubSharedHomeWarningItemManager

- (HUHomeHubSharedHomeWarningItemManager)initWithDelegate:(id)a3 homes:(id)a4
{
  id v7;
  HUHomeHubSharedHomeWarningItemManager *v8;
  HUHomeHubSharedHomeWarningItemManager *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeHubSharedHomeWarningItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_homes, a4);

  return v9;
}

- (HUHomeHubSharedHomeWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_homes_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeHubSharedHomeWarningItemManager.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeHubSharedHomeWarningItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUHomeHubSharedHomeWarningItemManager homes](self, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUHomeHubSharedHomeWarningItemManager _buildItemProvidersForHome:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s fetched homes: %@.", buf, 0x16u);

  }
  -[HUHomeHubSharedHomeWarningItemManager homes](self, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HUHomeHubSharedHomeWarningItemManager__buildItemProvidersForHome___block_invoke;
  v11[3] = &unk_1E6F5D970;
  v11[4] = self;
  objc_msgSend(v6, "na_map:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v7);
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __68__HUHomeHubSharedHomeWarningItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemForHome:", a2);
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

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("homesSectionIdentifier"));
  -[HFItemManager allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v11);

  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)itemForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[HUHomeHubSharedHomeWarningItemManager itemForHome:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s fetched home: %@.", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v4, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0D30D18]);
    objc_msgSend(v4, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30C08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "length") == 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E0D30D70]);

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "hu_keyColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithTintColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E0D30C70]);
  }
  v13 = objc_alloc(MEMORY[0x1E0D31840]);
  v14 = (void *)objc_msgSend(v4, "copy");
  v15 = (void *)objc_msgSend(v13, "initWithResults:", v14);

  return v15;
}

- (NSSet)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_storeStrong((id *)&self->_homes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homes, 0);
}

@end
