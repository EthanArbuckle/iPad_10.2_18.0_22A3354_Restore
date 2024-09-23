@implementation GCSProfilesCollection

- (GCSProfilesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  GCSProfilesCollection *v8;
  GCSProfilesCollection *v9;
  void *v10;
  uint64_t v11;
  NSArray *values;
  id WeakRetained;
  char isKindOfClass;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GCSProfilesCollection;
  v8 = -[GCSProfilesCollection init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    +[GCSProfile defaultProfile](GCSProfile, "defaultProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v18, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    values = v9->_values;
    v9->_values = (NSArray *)v11;

    -[GCUserDefaults addObserver:forKeyPath:options:context:](v9->_userDefaults, "addObserver:forKeyPath:options:context:", v9, CFSTR("profiles"), 5, 0);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_settingsStore);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&v9->_settingsStore);
      objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v9, CFSTR("settingsVersion"), 5, 0);

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

- (id)profileForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_values;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "uuid", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;

          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  +[GCSProfile defaultProfile](GCSProfile, "defaultProfile");
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

- (void)updateProfiles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GCSProfile *v12;
  GCSProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  _QWORD v26[4];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[GCSProfilesCollection storeVersionIsCompatible](self, "storeVersionIsCompatible"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF4908), "initWithCapacity:", -[NSObject count](v5, "count"));
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v5 = v5;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v20;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v5);
            v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
            v12 = [GCSProfile alloc];
            v13 = -[GCSProfile initWithJSONObject:](v12, "initWithJSONObject:", v11, (_QWORD)v19);
            objc_msgSend(v6, "addObject:", v13);

            ++v10;
          }
          while (v8 != v10);
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v8);
      }

      -[GCSProfilesCollection setValues:](self, "setValues:", v6);
      getGCSLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[GCSProfilesCollection values](self, "values");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_2159AA000, v14, OS_LOG_TYPE_INFO, "GCSProfilesCollection.values = %@", buf, 0xCu);

      }
    }
  }
  else
  {
    +[GCSProfile defaultProfile](GCSProfile, "defaultProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCSProfilesCollection setValues:](self, "setValues:", v17);

    getGCSLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[GCSProfilesCollection values](self, "values");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_2159AA000, v5, OS_LOG_TYPE_INFO, "GCSProfilesCollection.values = %@", buf, 0xCu);

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
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("profiles")))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("settingsVersion")))
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSProfilesCollection;
      -[GCSProfilesCollection observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_7;
    }
    -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("profiles"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  -[GCSProfilesCollection updateProfiles:](self, "updateProfiles:", v13);

LABEL_7:
}

- (void)dealloc
{
  id WeakRetained;
  char isKindOfClass;
  id v5;
  objc_super v6;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("profiles"), 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("settingsVersion"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)GCSProfilesCollection;
  -[GCSProfilesCollection dealloc](&v6, sel_dealloc);
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
