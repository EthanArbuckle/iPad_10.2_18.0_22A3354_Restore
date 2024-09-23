@implementation CloudSettingsService

- (CloudSettingsService)initWithStoreIdentifier:(id)a3 settingsMediator:(id)a4
{
  id v6;
  id v7;
  CloudSettingsService *v8;
  CloudSettingsService *v9;
  CloudSettingsStore *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CloudSettingsService;
  v8 = -[CloudSettingsService init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CloudSettingsService setIdentifier:](v8, "setIdentifier:", v6);
    v10 = -[CloudSettingsStore initWithStoreIdentifier:]([CloudSettingsStore alloc], "initWithStoreIdentifier:", v6);
    -[CloudSettingsService setStore:](v9, "setStore:", v10);

    -[CloudSettingsService setMediator:](v9, "setMediator:", v7);
  }

  return v9;
}

- (void)performFirstTimeSetupForStore:(id)a3 newDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "in CloudSettings Service, performFirstTimeSetupForStore: %@, isNewDevice: %d", (uint8_t *)&v11, 0x12u);
  }
  -[CloudSettingsService store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  LODWORD(v10) = v4 | 2;
  if (v9)
    v10 = v10;
  else
    v10 = v4;
  __asm { BR              X10 }
}

- (void)applyCloudSettingsToDevice:(id)a3 forStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CloudSettingsService *v32;
  id v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33 = a4;
  -[CloudSettingsService store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v8, "allKeys");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = self;
  -[CloudSettingsService mediator](self, "mediator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceSettingsForKeys:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  v34 = v11;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    v15 = MEMORY[0x24BDACB70];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16);
        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 && (v20 = objc_opt_class(), v21 = v20 == objc_opt_class(), v11 = v34, v21))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              if ((objc_msgSend(v18, "isEqual:", v19) & 1) == 0)
                goto LABEL_11;
            }
            else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20DD2C000, v15, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: storeValue does not respond to isEqual", buf, 2u);
            }
          }
          else
          {
LABEL_11:
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);
          }

          goto LABEL_15;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v17;
          _os_log_impl(&dword_20DD2C000, v15, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: key not found in KVS store: %@", buf, 0xCu);
        }
LABEL_15:

        ++v16;
      }
      while (v13 != v16);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      v13 = v22;
    }
    while (v22);
  }

  -[CloudSettingsService mediator](v32, "mediator");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23
    && (v24 = (void *)v23,
        -[CloudSettingsService mediator](v32, "mediator"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_opt_respondsToSelector(),
        v25,
        v11 = v34,
        v24,
        (v26 & 1) != 0))
  {
    -[CloudSettingsService mediator](v32, "mediator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mergeSettings:", v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v33;
    if (v28 && objc_msgSend(v28, "count"))
      -[CloudSettingsService writeToCloudSettingsDict:forStore:](v32, "writeToCloudSettingsDict:forStore:", v28, v33);
    v30 = v34;
  }
  else
  {
    -[CloudSettingsService mediator](v32, "mediator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "applySettings:", v11);

    v28 = 0;
    v30 = v11;
    v29 = v33;
  }

}

- (void)writeToCloudSettingsDict:(id)a3 forStore:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 138412546;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[CloudSettingsService store](self, "store");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBool:forKey:", objc_msgSend(v12, "BOOLValue"), v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CloudSettingsService store](self, "store");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setNumber:forKey:", v12, v11);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[CloudSettingsService store](self, "store");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setString:forKey:", v12, v11);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[CloudSettingsService store](self, "store");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setArray:forKey:", v12, v11);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[CloudSettingsService store](self, "store");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setDictionary:forKey:", v12, v11);
                }
                else
                {
                  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                    goto LABEL_19;
                  objc_msgSend(v12, "description");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v16;
                  v22 = v15;
                  v23 = 2112;
                  v24 = v11;
                  _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: writeToCloudSettings - unsupported class: %@ write for key: %@", buf, 0x16u);
                }
              }
            }
          }
        }

LABEL_19:
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v8);
  }

}

- (void)writeToCloudSettings:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CloudSettingsService mediator](self, "mediator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceSettingsForKeys:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CloudSettingsService writeToCloudSettingsDict:forStore:](self, "writeToCloudSettingsDict:forStore:", v9, v6);
}

- (void)performSmartMergeWithStoreSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  id v23;
  __CFString *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  CloudSettingsService *v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  -[CloudSettingsService mediator](self, "mediator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceSettingsForKeys:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (v9 = v4, !objc_msgSend(v4, "count")))
  {
    -[CloudSettingsService store](self, "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: performSmartMergeWithStoreSettings - nil cloud dict, this should not happen, do nothing", buf, 2u);
      }
      goto LABEL_35;
    }
  }
  if (!objc_msgSend(v9, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "ERROR | CloudSettingsService: performSmartMergeWithStoreSettings - empty cloud dict, this should not happen, do nothing";
    goto LABEL_24;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (!v11)
    goto LABEL_18;
  v12 = v11;
  v13 = *(_QWORD *)v39;
  v35 = self;
  v36 = v4;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v39 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v9, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v23 = v15;
        v24 = CFSTR("no matching local setting");
LABEL_34:

        +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CloudSettingsService identifier](v35, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setConflict:forStore:", 2, v31);

        +[CloudSettingsManager sharedCloudSettingsManager](CloudSettingsManager, "sharedCloudSettingsManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CloudSettingsService identifier](v35, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setEnabled:forStore:", 0, v33);

        v4 = v36;
        goto LABEL_35;
      }
      v18 = objc_opt_class();
      if (v18 != objc_opt_class())
      {
        v25 = v15;
        v26 = (void *)MEMORY[0x24BDD17C8];
        v27 = objc_opt_class();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("kvsStore type: %@, does not match local type: %@"), v27, objc_opt_class());
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v28 = v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kvsStore type: %@, does not respond to isEqual"), objc_opt_class());
        goto LABEL_32;
      }
      if (!objc_msgSend(v16, "isEqual:", v17))
      {
        v29 = v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cloudValue is NOT equal to local value"), v34);
LABEL_32:
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v15;
          v44 = 2112;
          v45 = v24;
          _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "CloudSettingsService: performSmartMergeWithStoreSettings - conflict found for key: %@.  Conflict: %@", buf, 0x16u);
        }
        goto LABEL_34;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v15;
        _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Removing match: %@", buf, 0xCu);
      }
      objc_msgSend(v8, "removeObjectForKey:", v15);

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    self = v35;
    v4 = v36;
    if (v12)
      continue;
    break;
  }
LABEL_18:

  if (!objc_msgSend(v8, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "No Conflicts, no remaining setting, exit";
LABEL_24:
    _os_log_impl(&dword_20DD2C000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_25;
  }
  objc_msgSend(v8, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v19;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No Conflicts, but some left over local settings to be uploaded: %@", buf, 0xCu);
  }
  -[CloudSettingsService identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudSettingsService writeToCloudSettings:forStore:](self, "writeToCloudSettings:forStore:", v19, v20);

LABEL_25:
LABEL_35:

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CloudSettingsStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (CloudSettingsMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
  objc_storeStrong((id *)&self->_mediator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
