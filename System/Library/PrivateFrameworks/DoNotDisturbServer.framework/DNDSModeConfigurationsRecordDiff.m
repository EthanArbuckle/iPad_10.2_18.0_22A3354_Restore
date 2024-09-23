@implementation DNDSModeConfigurationsRecordDiff

- (DNDSModeConfigurationsRecordDiff)initWithOriginalModeConfigurations:(id)a3 updatedModeConfigurations:(id)a4 zone:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDSModeConfigurationsRecordDiff *v11;
  uint64_t v12;
  DNDSModeConfigurationsRecord *original;
  uint64_t v14;
  DNDSModeConfigurationsRecord *updated;
  uint64_t v16;
  CKRecordZone *zone;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSModeConfigurationsRecordDiff;
  v11 = -[DNDSModeConfigurationsRecordDiff init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    original = v11->_original;
    v11->_original = (DNDSModeConfigurationsRecord *)v12;

    v14 = objc_msgSend(v9, "copy");
    updated = v11->_updated;
    v11->_updated = (DNDSModeConfigurationsRecord *)v14;

    v16 = objc_msgSend(v10, "copy");
    zone = v11->_zone;
    v11->_zone = (CKRecordZone *)v16;

    -[DNDSModeConfigurationsRecordDiff _generateDiff](v11, "_generateDiff");
  }

  return v11;
}

- (void)_generateDiff
{
  void *v3;
  NSArray *v4;
  NSArray *modifiedIDs;
  NSArray *v6;
  NSArray *removedIDs;
  id v8;

  -[DNDSModeConfigurationsRecordDiff _modifiedConfigurations](self, "_modifiedConfigurations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsRecordDiff _removedConfigurations](self, "_removedConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsRecordDiff _recordIDsInModeConfigurations:](self, "_recordIDsInModeConfigurations:", v8);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  modifiedIDs = self->_modifiedIDs;
  self->_modifiedIDs = v4;

  -[DNDSModeConfigurationsRecordDiff _recordIDsInModeConfigurations:](self, "_recordIDsInModeConfigurations:", v3);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  removedIDs = self->_removedIDs;
  self->_removedIDs = v6;

}

- (id)_recordIDsInModeConfigurations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0C95070]);
        objc_msgSend(v10, "mode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "modeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKRecordZone zoneID](self->_zone, "zoneID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v11, "initWithRecordName:zoneID:", v13, v14);

        objc_msgSend(v5, "addObject:", v15);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)_modifiedConfigurations
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[DNDSModeConfigurationsRecord modeConfigurations](self->_updated, "modeConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "mode", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "modeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[DNDSModeConfigurationsRecord modeConfigurationForModeIdentifier:](self->_original, "modeConfigurationForModeIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqual:", v13) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_removedConfigurations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsRecord modeConfigurations](self->_original, "modeConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "mode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "modeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[DNDSModeConfigurationsRecord modeConfigurationForModeIdentifier:](self->_updated, "modeConfigurationForModeIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (DNDSModeConfigurationsRecord)original
{
  return self->_original;
}

- (DNDSModeConfigurationsRecord)updated
{
  return self->_updated;
}

- (NSArray)modifiedIDs
{
  return self->_modifiedIDs;
}

- (NSArray)removedIDs
{
  return self->_removedIDs;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_removedIDs, 0);
  objc_storeStrong((id *)&self->_modifiedIDs, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_original, 0);
}

@end
