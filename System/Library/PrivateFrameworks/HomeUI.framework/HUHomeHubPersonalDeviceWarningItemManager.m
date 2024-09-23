@implementation HUHomeHubPersonalDeviceWarningItemManager

- (HUHomeHubPersonalDeviceWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_devices_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeHubPersonalDeviceWarningItemManager.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeHubPersonalDeviceWarningItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUHomeHubPersonalDeviceWarningItemManager)initWithDelegate:(id)a3 devices:(id)a4
{
  id v7;
  HUHomeHubPersonalDeviceWarningItemManager *v8;
  HUHomeHubPersonalDeviceWarningItemManager *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeHubPersonalDeviceWarningItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_devices, a4);

  return v9;
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
    -[HUHomeHubPersonalDeviceWarningItemManager devices](self, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUHomeHubPersonalDeviceWarningItemManager _buildItemProvidersForHome:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s fetched devices: %@.", buf, 0x16u);

  }
  -[HUHomeHubPersonalDeviceWarningItemManager devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HUHomeHubPersonalDeviceWarningItemManager__buildItemProvidersForHome___block_invoke;
  v11[3] = &unk_1E6F5A080;
  v11[4] = self;
  objc_msgSend(v6, "na_map:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v7);
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __72__HUHomeHubPersonalDeviceWarningItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemForDevice:", a2);
}

- (id)itemForDevice:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(v3, "name");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315394;
      v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%s fetched device: %@.", (uint8_t *)&v25, 0x16u);
    }

    if (-[__CFString length](v5, "length")
      || (objc_msgSend(v3, "productInfo"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v3, "productInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "productClass");

      HMFProductClassToString();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "productInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 136315650;
        v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%s device productClassName: %@, productInfo: %@.", (uint8_t *)&v25, 0x20u);

      }
    }
    objc_msgSend(v4, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30D18]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[__CFString length](v7, "length") == 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E0D30D70]);

    objc_msgSend(v3, "productInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "productInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "productClass");

      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFProductClassToString();
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v25 = 136315394;
        v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%s device productClass String: %@.", (uint8_t *)&v25, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CEA638], "hu_symbolForDevice:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageWithRenderingMode:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E0D30C70]);
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = CFSTR("populated");
        if (!v18)
          v20 = CFSTR("nil: no icon");
        v25 = 136315394;
        v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%s deviceImage is %@", (uint8_t *)&v25, 0x16u);
      }

    }
  }
  v21 = objc_alloc(MEMORY[0x1E0D31840]);
  v22 = (void *)objc_msgSend(v4, "copy");
  v23 = (void *)objc_msgSend(v21, "initWithResults:", v22);

  return v23;
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

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("devicesSectionIdentifier"));
  -[HFItemManager allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_187);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v10);

  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __78__HUHomeHubPersonalDeviceWarningItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30C70];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(v5, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v14 = 1;
      goto LABEL_10;
    }
  }
  objc_msgSend(v4, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_9;
  }
  v11 = (void *)v10;
  objc_msgSend(v5, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v14 = objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v14 = -1;
LABEL_10:

  return v14;
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
