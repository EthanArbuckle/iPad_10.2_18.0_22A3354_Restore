@implementation GCSCopilotFusedControllersCollection

- (GCSCopilotFusedControllersCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  GCSCopilotFusedControllersCollection *v8;
  GCSCopilotFusedControllersCollection *v9;
  id WeakRetained;
  char isKindOfClass;
  id v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSCopilotFusedControllersCollection;
  v8 = -[GCSCopilotFusedControllersCollection init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    -[GCUserDefaults addObserver:forKeyPath:options:context:](v9->_userDefaults, "addObserver:forKeyPath:options:context:", v9, CFSTR("copilotFusedControllers"), 5, 0);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_settingsStore);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&v9->_settingsStore);
      objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v9, CFSTR("settingsVersion"), 5, 0);

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

- (id)copilotFusedControllerForControllerIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_values;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "fusedControllerIdentifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", v4) & 1) != 0)
          goto LABEL_14;
        objc_msgSend(v10, "pilotIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v4))
        {

LABEL_14:
LABEL_15:
          v15 = v10;
          goto LABEL_16;
        }
        objc_msgSend(v10, "copilotIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
          goto LABEL_15;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (id)copilotFusedControllerForFusedControllerIdentifier:(id)a3
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
        objc_msgSend(v9, "fusedControllerIdentifier", (_QWORD)v13);
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

- (id)copilotFusedControllerForPilotControllerIdentifier:(id)a3
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
        objc_msgSend(v9, "pilotIdentifier", (_QWORD)v13);
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

- (id)copilotFusedControllerForCopilotControllerIdentifier:(id)a3
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
        objc_msgSend(v9, "copilotIdentifier", (_QWORD)v13);
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

- (void)updateCopilotFusedControllers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GCSCopilotFusedController *v12;
  GCSCopilotFusedController *v13;
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
    && -[GCSCopilotFusedControllersCollection storeVersionIsCompatible](self, "storeVersionIsCompatible"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v5 = objc_claimAutoreleasedReturnValue();
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
            v12 = [GCSCopilotFusedController alloc];
            v13 = -[GCSCopilotFusedController initWithJSONObject:](v12, "initWithJSONObject:", v11, (_QWORD)v17);
            objc_msgSend(v6, "addObject:", v13);

            ++v10;
          }
          while (v8 != v10);
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

      -[GCSCopilotFusedControllersCollection setValues:](self, "setValues:", v6);
      getGCSLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[GCSCopilotFusedControllersCollection values](self, "values");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl(&dword_2159AA000, v14, OS_LOG_TYPE_INFO, "GCSCopilotFusedControllersCollection.values = %@", buf, 0xCu);

      }
    }
  }
  else
  {
    -[GCSCopilotFusedControllersCollection setValues:](self, "setValues:", MEMORY[0x24BDBD1A8]);
    getGCSLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[GCSCopilotFusedControllersCollection values](self, "values");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_2159AA000, v5, OS_LOG_TYPE_INFO, "GCSCopilotFusedControllersCollection.values = %@", buf, 0xCu);

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
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("copilotFusedControllers")))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("settingsVersion")))
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSCopilotFusedControllersCollection;
      -[GCSCopilotFusedControllersCollection observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_7;
    }
    -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("copilotFusedControllers"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  -[GCSCopilotFusedControllersCollection updateCopilotFusedControllers:](self, "updateCopilotFusedControllers:", v13);

LABEL_7:
}

- (void)dealloc
{
  id WeakRetained;
  char isKindOfClass;
  id v5;
  objc_super v6;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("copilotFusedControllers"), 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("settingsVersion"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)GCSCopilotFusedControllersCollection;
  -[GCSCopilotFusedControllersCollection dealloc](&v6, sel_dealloc);
}

- (id)_unitTest_fusePilotController:(id)a3 withCopilot:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GCSCopilotFusedController *v13;
  NSArray *values;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  void *v20;
  void *v21;

  v7 = a4;
  v8 = a3;
  -[GCSCopilotFusedControllersCollection copilotFusedControllerForControllerIdentifier:](self, "copilotFusedControllerForControllerIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    unk_254DF4E78(&off_254DF5018, "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCSCopilotFusedControllersCollection.m"), 134, CFSTR("The pilot controller is already fused to another controller"));

  }
  -[GCSCopilotFusedControllersCollection copilotFusedControllerForControllerIdentifier:](self, "copilotFusedControllerForControllerIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    unk_254DF4E78(&off_254DF5018, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCSCopilotFusedControllersCollection.m"), 135, CFSTR("The copilot controller is already fused to another controller"));

  }
  +[NSUUID UUID](&off_254DF3350, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[GCSCopilotFusedController initWithFusedControllerIdentifier:pilotIdentifier:copilotIdentifier:]([GCSCopilotFusedController alloc], "initWithFusedControllerIdentifier:pilotIdentifier:copilotIdentifier:", v12, v8, v7);
  values = self->_values;
  if (values)
    v15 = (NSArray *)-[NSArray mutableCopy](values, "mutableCopy");
  else
    v15 = (NSArray *)objc_opt_new();
  v16 = v15;
  -[NSArray addObject:](v15, "addObject:", v13);
  v17 = self->_values;
  self->_values = v16;
  v18 = v16;

  -[GCSCopilotFusedControllersCollection _unitTest_saveCopilotFusedControllers:](self, "_unitTest_saveCopilotFusedControllers:", v18);
  return v12;
}

- (void)_unitTest_unfuseCopilotFusedController:(id)a3
{
  NSArray *values;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  id v11;

  -[GCSCopilotFusedControllersCollection copilotFusedControllerForControllerIdentifier:](self, "copilotFusedControllerForControllerIdentifier:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_254DF4E78(&off_254DF5018, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCSCopilotFusedControllersCollection.m"), 151, CFSTR("The copilot fused controller does not exist"));

  }
  values = self->_values;
  if (values)
    v6 = (NSArray *)-[NSArray mutableCopy](values, "mutableCopy");
  else
    v6 = (NSArray *)objc_opt_new();
  v7 = v6;
  -[NSArray removeObject:](v6, "removeObject:", v11);
  v8 = self->_values;
  self->_values = v7;
  v9 = v7;

  -[GCSCopilotFusedControllersCollection _unitTest_saveCopilotFusedControllers:](self, "_unitTest_saveCopilotFusedControllers:", v9);
}

- (void)_unitTest_saveCopilotFusedControllers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "jsonObject", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  v20[0] = CFSTR("data");
  v20[1] = CFSTR("tombstones");
  v21[0] = v5;
  -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = MEMORY[0x24BDBD1A8];
  if (v12)
    v14 = v12;
  v21[1] = v14;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v21, v20, 2, (_QWORD)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", CFSTR("10.1.21"), CFSTR("settingsVersion"));
  -[GCUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v15, CFSTR("copilotFusedControllers"));

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
