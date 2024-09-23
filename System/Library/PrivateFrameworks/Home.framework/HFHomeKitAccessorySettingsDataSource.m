@implementation HFHomeKitAccessorySettingsDataSource

- (HFHomeKitAccessorySettingsDataSource)initWithHomeManager:(id)a3
{
  id v4;
  HFHomeKitAccessorySettingsDataSource *v5;
  uint64_t v6;
  HMAccessorySettingsDataSource *dataSource;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFHomeKitAccessorySettingsDataSource;
  v5 = -[HFHomeKitAccessorySettingsDataSource init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hf_accessorySettingsDataSource");
    v6 = objc_claimAutoreleasedReturnValue();
    dataSource = v5->_dataSource;
    v5->_dataSource = (HMAccessorySettingsDataSource *)v6;

    -[HMAccessorySettingsDataSource setDelegate:](v5->_dataSource, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitAccessorySettingsDataSource observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HFHomeKitAccessorySettingsDataSource *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFHomeKitAccessorySettingsDataSource observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  HFLogForCategory(0x25uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitAccessorySettingsDataSource observers](self, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Removed observer = [%@]. Remaining observers = [%@]", (uint8_t *)&v10, 0x2Au);

  }
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HFHomeKitAccessorySettingsDataSource observers](self, "observers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "updateSettingValue:forKeyPath:accessoryIdentifier:", v8, v9, v10);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)hf_localizedTitleForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFHomeKitAccessorySettingsDataSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitleForKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)hf_subscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  HFHomeKitAccessorySettingsDataSource *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  HFLogForCategory(0x25uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413314;
    v21 = self;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Subscribing to setting for homeIdentifier %@ accessoryIdentifier %@ keyPaths %@", (uint8_t *)&v20, 0x34u);

  }
  -[HFHomeKitAccessorySettingsDataSource dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v13, v14, v15, a6, v16);

}

- (void)hf_fetchAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HFHomeKitAccessorySettingsDataSource dataSource](self, "dataSource");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:", v13, v12, v11, v10);

}

- (id)hf_defaultSettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HFHomeKitAccessorySettingsDataSource dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultSettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  HFHomeKitAccessorySettingsDataSource *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HFHomeKitAccessorySettingsDataSource observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  HFLogForCategory(0x25uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v26 = self;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Settings updated for accessoryIdentifier [%@] setting [%@]. Notifying observers [%@]", buf, 0x34u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:", v8, v9, (_QWORD)v20);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

}

- (HMAccessorySettingsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
