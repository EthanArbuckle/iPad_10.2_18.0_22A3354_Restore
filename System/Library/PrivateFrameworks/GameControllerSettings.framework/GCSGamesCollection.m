@implementation GCSGamesCollection

- (GCSGamesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  GCSGamesCollection *v8;
  GCSGamesCollection *v9;
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
  v17.super_class = (Class)GCSGamesCollection;
  v8 = -[GCSGamesCollection init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    +[GCSGame defaultGame](GCSGame, "defaultGame");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v18, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    values = v9->_values;
    v9->_values = (NSArray *)v11;

    -[GCUserDefaults addObserver:forKeyPath:options:context:](v9->_userDefaults, "addObserver:forKeyPath:options:context:", v9, CFSTR("games"), 5, 0);
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

- (id)gameWithBundleIdentifier:(id)a3
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
        objc_msgSend(v9, "bundleIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

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

- (void)updateGames:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  GCSGame *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  GCSGame *v18;
  GCSGame *defaultGame;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  _QWORD v30[4];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[GCSGamesCollection storeVersionIsCompatible](self, "storeVersionIsCompatible"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v22 = v4;
      v6 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF4908), "initWithCapacity:", -[NSObject count](v5, "count"));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v5 = v5;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        do
        {
          v10 = v5;
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v10);
            v12 = -[GCSGame initWithJSONObject:]([GCSGame alloc], "initWithJSONObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            -[GCSGame bundleIdentifier](v12, "bundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            +[GCSGame defaultIdentifier](GCSGame, "defaultIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if (v15)
              objc_storeStrong((id *)&self->_defaultGame, v12);
            objc_msgSend(v6, "addObject:", v12);

          }
          v5 = v10;
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v8);
      }

      -[GCSGamesCollection setValues:](self, "setValues:", v6);
      getGCSLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[GCSGamesCollection values](self, "values");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_2159AA000, v16, OS_LOG_TYPE_INFO, "GCSGamesCollection.values = %@", buf, 0xCu);

      }
      v4 = v22;
    }
  }
  else
  {
    +[GCSGame defaultGame](GCSGame, "defaultGame");
    v18 = (GCSGame *)objc_claimAutoreleasedReturnValue();
    defaultGame = self->_defaultGame;
    self->_defaultGame = v18;

    v30[0] = self->_defaultGame;
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCSGamesCollection setValues:](self, "setValues:", v20);

    getGCSLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[GCSGamesCollection values](self, "values");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_2159AA000, v5, OS_LOG_TYPE_INFO, "GCSGamesCollection.values = %@", buf, 0xCu);

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
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("games")))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("settingsVersion")))
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSGamesCollection;
      -[GCSGamesCollection observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_7;
    }
    -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("games"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  -[GCSGamesCollection updateGames:](self, "updateGames:", v13);

LABEL_7:
}

- (void)dealloc
{
  id WeakRetained;
  char isKindOfClass;
  id v5;
  objc_super v6;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("games"), 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("settingsVersion"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)GCSGamesCollection;
  -[GCSGamesCollection dealloc](&v6, sel_dealloc);
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
  objc_storeStrong((id *)&self->_defaultGame, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
