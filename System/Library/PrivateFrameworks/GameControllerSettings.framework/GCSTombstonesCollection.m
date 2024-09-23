@implementation GCSTombstonesCollection

- (GCSTombstonesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  GCSTombstonesCollection *v8;
  GCSTombstonesCollection *v9;
  NSArray *values;
  id WeakRetained;
  char isKindOfClass;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GCSTombstonesCollection;
  v8 = -[GCSTombstonesCollection init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    values = v9->_values;
    v9->_values = (NSArray *)MEMORY[0x24BDBD1A8];

    -[GCUserDefaults addObserver:forKeyPath:options:context:](v9->_userDefaults, "addObserver:forKeyPath:options:context:", v9, CFSTR("tombstones"), 5, 0);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_settingsStore);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&v9->_settingsStore);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v9, CFSTR("tombstones"), 5, 0);

    }
  }

  return v9;
}

- (BOOL)storeVersionIsCompatible
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  v3 = objc_msgSend(WeakRetained, "savedDataMeetsRequiredVersion:", CFSTR("10.1.21"));

  return v3;
}

- (id)tombstoneForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_values;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateTombstones:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GCSTombstone *v12;
  GCSTombstone *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[GCSTombstonesCollection storeVersionIsCompatible](self, "storeVersionIsCompatible"))
  {
    v5 = v4;
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF4908), "initWithCapacity:", -[NSObject count](v5, "count"));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = v5;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v5);
            v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
            v12 = [GCSTombstone alloc];
            v13 = -[GCSTombstone initWithJSONObject:](v12, "initWithJSONObject:", v11, (_QWORD)v17);
            objc_msgSend(v6, "addObject:", v13);

            ++v10;
          }
          while (v8 != v10);
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

      -[GCSTombstonesCollection setValues:](self, "setValues:", v6);
      getGCSLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[GCSTombstonesCollection values](self, "values");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl(&dword_2159AA000, v14, OS_LOG_TYPE_INFO, "GCSTombstones.values = %@", buf, 0xCu);

      }
    }
  }
  else
  {
    -[GCSTombstonesCollection setValues:](self, "setValues:", MEMORY[0x24BDBD1A8]);
    getGCSLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[GCSTombstonesCollection values](self, "values");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_2159AA000, v5, OS_LOG_TYPE_INFO, "GCSTombstones.values = %@", buf, 0xCu);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("tombstones")))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("settingsVersion")))
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSTombstonesCollection;
      -[GCSTombstonesCollection observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_7;
    }
    -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("tombstones"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  -[GCSTombstonesCollection updateTombstones:](self, "updateTombstones:", v13);

LABEL_7:
}

- (void)dealloc
{
  id WeakRetained;
  char isKindOfClass;
  id v5;
  objc_super v6;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("tombstones"), 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("tombstones"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)GCSTombstonesCollection;
  -[GCSTombstonesCollection dealloc](&v6, sel_dealloc);
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (GCSSettingsStoreService)settingsStore
{
  return (GCSSettingsStoreService *)objc_loadWeakRetained((id *)&self->_settingsStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsStore);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
