@implementation GCSMouseProfilesCollection

- (GCSMouseProfilesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  GCSMouseProfilesCollection *v8;
  uint64_t v9;
  NSArray *values;
  id v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCSMouseProfilesCollection;
  v8 = -[GCSMouseProfilesCollection init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    values = v8->_values;
    v8->_values = (NSArray *)v9;

    v11 = objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v8, CFSTR("mouseProfiles"), 5, KVOContext);

    objc_storeStrong((id *)&v8->_userDefaults, a4);
    -[GCUserDefaults addObserver:forKeyPath:options:context:](v8->_userDefaults, "addObserver:forKeyPath:options:context:", v8, CFSTR("settingsVersion"), 5, KVOContext);
  }

  return v8;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("settingsVersion"), KVOContext);
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("mouseProfiles"), KVOContext);

  v4.receiver = self;
  v4.super_class = (Class)GCSMouseProfilesCollection;
  -[GCSMouseProfilesCollection dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  GCUserDefaults *v12;
  id v13;
  GCUserDefaults *WeakRetained;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  objc_super v22;

  v11 = a3;
  v12 = (GCUserDefaults *)a4;
  v13 = a5;
  if ((void *)KVOContext == a6)
  {
    WeakRetained = (GCUserDefaults *)objc_loadWeakRetained((id *)&self->_settingsStore);

    if (WeakRetained == v12)
    {
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("mouseProfiles")) & 1) == 0)
      {
        unk_254DF4E78(&off_254DF5018, "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCSMouseProfilesCollection.m"), 52, CFSTR("Unhandled keypath %@"), v11);

      }
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->_userDefaults != v12)
      {
        v19 = *MEMORY[0x24BDBCAB0];
        +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("KVO notification from unknown object <%@:%p>"), objc_opt_class(), v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSException exceptionWithName:reason:userInfo:](&off_254DF4E20, "exceptionWithName:reason:userInfo:", v19, v20, 0);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v21);
      }
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("settingsVersion")) & 1) == 0)
      {
        unk_254DF4E78(&off_254DF5018, "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCSMouseProfilesCollection.m"), 55, CFSTR("Unhandled keypath %@"), v11);

      }
      -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("mouseProfiles"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    -[GCSMouseProfilesCollection updateMouseProfiles:](self, "updateMouseProfiles:", v15);

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)GCSMouseProfilesCollection;
    -[GCSMouseProfilesCollection observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v11, v12, v13, a6);
  }

}

- (BOOL)storeVersionIsCompatible
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  v3 = objc_msgSend(WeakRetained, "savedDataMeetsRequiredVersion:", CFSTR("10.1.21"));

  return v3;
}

- (void)updateMouseProfiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GCSMouseProfile *v12;
  GCSMouseProfile *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[GCSMouseProfilesCollection storeVersionIsCompatible](self, "storeVersionIsCompatible"))
  {
    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = [GCSMouseProfile alloc];
          v13 = -[GCSMouseProfile initWithJSONObject:](v12, "initWithJSONObject:", v11, (_QWORD)v14);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    -[GCSMouseProfilesCollection setValues:](self, "setValues:", v5);
  }
  else
  {
    -[GCSMouseProfilesCollection setValues:](self, "setValues:", MEMORY[0x24BDBD1A8]);
  }

}

- (id)mouseProfileForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
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
  -[GCSMouseProfilesCollection values](self, "values", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (GCSSettingsStoreService)settingsStore
{
  return (GCSSettingsStoreService *)objc_loadWeakRetained((id *)&self->_settingsStore);
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_destroyWeak((id *)&self->_settingsStore);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
