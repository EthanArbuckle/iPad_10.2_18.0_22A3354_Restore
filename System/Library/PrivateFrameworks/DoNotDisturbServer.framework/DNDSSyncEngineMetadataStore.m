@implementation DNDSSyncEngineMetadataStore

- (DNDSSyncEngineMetadataStore)init
{
  return -[DNDSSyncEngineMetadataStore initWithURL:](self, "initWithURL:", 0);
}

- (DNDSSyncEngineMetadataStore)initWithURL:(id)a3
{
  id v4;
  DNDSSyncEngineMetadataStore *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSSyncEngineMetadataStore;
  v5 = -[DNDSSyncEngineMetadataStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    -[DNDSSyncEngineMetadataStore _read](v5, "_read");
  }

  return v5;
}

- (NSData)metadata
{
  return (NSData *)(id)-[NSData copy](self->_metadata, "copy");
}

- (void)setMetadata:(id)a3
{
  NSData *v4;
  NSData *metadata;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  metadata = self->_metadata;
  self->_metadata = v4;

  -[DNDSSyncEngineMetadataStore _write](self, "_write");
}

- (NSString)userRecordID
{
  return (NSString *)(id)-[NSString copy](self->_userRecordID, "copy");
}

- (void)setUserRecordID:(id)a3
{
  NSString *v4;
  NSString *userRecordID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  userRecordID = self->_userRecordID;
  self->_userRecordID = v4;

  -[DNDSSyncEngineMetadataStore _write](self, "_write");
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
  -[DNDSSyncEngineMetadataStore _write](self, "_write");
}

- (BOOL)isEncryptionAvailable
{
  return self->_encryptionAvailable;
}

- (void)setEncryptionAvailable:(BOOL)a3
{
  self->_encryptionAvailable = a3;
  -[DNDSSyncEngineMetadataStore _write](self, "_write");
}

- (id)recordWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_systemFieldsByRecordID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v11);
    v7 = v11;
    if (v7)
    {
      v8 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngineMetadataStore recordWithID:].cold.1(v8, v4, (uint64_t)v7);
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v6);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addRecord:(id)a3
{
  -[DNDSSyncEngineMetadataStore _updateSystemFieldsForRecord:](self, "_updateSystemFieldsForRecord:", a3);
  -[DNDSSyncEngineMetadataStore _write](self, "_write");
}

- (void)removeRecordWithID:(id)a3
{
  -[DNDSSyncEngineMetadataStore _removeSystemFieldsForRecordID:](self, "_removeSystemFieldsForRecordID:", a3);
  -[DNDSSyncEngineMetadataStore _write](self, "_write");
}

- (void)removeRecordsWithZoneID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_systemFieldsByRecordID;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "zoneID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[DNDSSyncEngineMetadataStore _removeSystemFieldsForRecordID:](self, "_removeSystemFieldsForRecordID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

    -[DNDSSyncEngineMetadataStore _write](self, "_write");
  }

}

- (void)purge
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Failed to delete metadata store: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)recordIDsWithZoneID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_systemFieldsByRecordID;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "zoneID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)addZoneName:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_zoneNames, "containsObject:", v4);
  if ((v5 & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_zoneNames, "addObject:", v4);
    -[DNDSSyncEngineMetadataStore _write](self, "_write");
  }

  return v5 ^ 1;
}

- (BOOL)removeZoneName:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_zoneNames, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableSet removeObject:](self->_zoneNames, "removeObject:", v4);
    -[DNDSSyncEngineMetadataStore _write](self, "_write");
  }

  return v5;
}

- (id)zoneNames
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)-[NSMutableSet copy](self->_zoneNames, "copy");
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_read
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_7(&dword_1CB895000, a3, (uint64_t)a3, "Failed to load metadata store at url %@: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_write
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Failed to write metadata store: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateSystemFieldsForRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngineMetadataStore _encodedSystemFieldsFromRecord:](self, "_encodedSystemFieldsFromRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemFieldsByRecordID, "setObject:forKeyedSubscript:", v5, v6);
}

- (void)_removeSystemFieldsForRecordID:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemFieldsByRecordID, "setObject:forKeyedSubscript:", 0, a3);
}

- (id)_encodedSystemFieldsFromRecord:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeSystemFieldsWithCoder:", v5);

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_encodedRecordIDFromRecordID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeWithCoder:", v5);

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_decodeRecordIDFromData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithCoder:", v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_systemFieldsByRecordID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)recordWithID:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v5, v7, "Failed to decode system fields for record %{public}@: %{public}@", (uint8_t *)&v8);

}

@end
