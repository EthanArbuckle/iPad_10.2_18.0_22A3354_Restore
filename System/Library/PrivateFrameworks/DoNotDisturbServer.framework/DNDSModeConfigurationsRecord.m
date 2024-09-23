@implementation DNDSModeConfigurationsRecord

+ (id)backingStoreWithFileURL:(id)a3 secureFileURL:(id)a4
{
  id v6;
  id v7;
  DNDSJSONBackingStore *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:secureFileURL:versionNumber:securityClass:]([DNDSJSONBackingStore alloc], "initWithRecordClass:fileURL:secureFileURL:versionNumber:securityClass:", a1, v7, v6, 2, 2);

  return v8;
}

- (DNDSModeConfigurationsRecord)init
{
  return (DNDSModeConfigurationsRecord *)-[DNDSModeConfigurationsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "modeConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSModeConfigurationsRecord _initWithModeConfigurations:](self, "_initWithModeConfigurations:", v4);

  return v5;
}

- (id)_initWithModeConfigurations:(id)a3
{
  id v4;
  DNDSModeConfigurationsRecord *v5;
  uint64_t v6;
  NSMutableDictionary *modeConfigurationsByModeIdentifier;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DNDSModeConfigurationsRecord;
  v5 = -[DNDSModeConfigurationsRecord init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    modeConfigurationsByModeIdentifier = v5->_modeConfigurationsByModeIdentifier;
    v5->_modeConfigurationsByModeIdentifier = (NSMutableDictionary *)v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = v5->_modeConfigurationsByModeIdentifier;
          objc_msgSend(v13, "mode", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "modeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (NSArray)modeConfigurations
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_modeConfigurationsByModeIdentifier, "allValues");
}

- (id)modeConfigurationForModeIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)configurationForModeIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)triggersForModeIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)modeForModeIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)log:(id)a3 withMessage:(id)a4
{
  NSObject *v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_modeConfigurationsByModeIdentifier;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "log:withMessage:", v6, CFSTR("Record"));

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_modeConfigurationsByModeIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeConfigurationsRecord *v4;
  DNDSModeConfigurationsRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSModeConfigurationsRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSModeConfigurationsRecord modeConfigurations](self, "modeConfigurations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeConfigurationsRecord modeConfigurations](v5, "modeConfigurations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSModeConfigurationsRecord modeConfigurations](self, "modeConfigurations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSModeConfigurationsRecord modeConfigurations](v5, "modeConfigurations");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSModeConfigurationsRecord modeConfigurations](self, "modeConfigurations");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeConfigurationsRecord modeConfigurations](v5, "modeConfigurations");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; modeConfigurations: %@>"),
                       objc_opt_class(),
                       self,
                       self->_modeConfigurationsByModeIdentifier);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSModeConfigurationsRecord _initWithRecord:]([DNDSMutableModeConfigurationsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("modeConfigurations"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:context:](DNDSModeConfigurationRecord, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v7, (_QWORD)v18);
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithModeConfigurations:", v9);
  return v16;
}

+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v26 = v7;
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("modeConfigurations"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("secureModeConfigurations"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:](DNDSModeConfigurationRecord, "newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:", v19, v20, v9);
        objc_msgSend(v12, "addObject:", v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithModeConfigurations:", v12);
  return v22;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  DNDSModeConfigurationsRecord *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  if ((objc_msgSend(v4, "partitionType") & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setPartitionType:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = self;
    -[NSMutableDictionary allValues](self->_modeConfigurationsByModeIdentifier, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v13, "dictionaryRepresentationWithContext:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "modeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v10);
    }

    v5 = v30;
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v7, CFSTR("modeConfigurations"));

    self = v29;
  }
  if ((objc_msgSend(v4, "partitionType") & 2) != 0)
  {
    v17 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v17, "setPartitionType:", 2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSMutableDictionary allValues](self->_modeConfigurationsByModeIdentifier, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v24, "dictionaryRepresentationWithContext:", v4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "mode");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "modeIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v21);
    }

    v5 = v30;
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v18, CFSTR("secureModeConfigurations"));

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurationsByModeIdentifier, 0);
}

@end
