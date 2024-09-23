@implementation DNDSIDSSyncEngineMetadataStore

- (DNDSIDSSyncEngineMetadataStore)init
{
  return -[DNDSIDSSyncEngineMetadataStore initWithURL:](self, "initWithURL:", 0);
}

- (DNDSIDSSyncEngineMetadataStore)initWithURL:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSIDSSyncEngineMetadataStore;
  v5 = -[DNDSIDSSyncEngineMetadataStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v6;

    *(_OWORD *)(v5 + 40) = xmmword_1CB953C10;
    objc_msgSend(v5, "_read");
    objc_msgSend(v5, "garbageCollect");
    objc_msgSend(v5, "_write");
  }

  return (DNDSIDSSyncEngineMetadataStore *)v5;
}

- (DNDSIDSSyncEngineMetadataStore)initWithDeviceObsoletionDuration:(double)a3 tombstoneObsoletionDuration:(double)a4
{
  DNDSIDSSyncEngineMetadataStore *v6;
  DNDSIDSSyncEngineMetadataStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DNDSIDSSyncEngineMetadataStore;
  v6 = -[DNDSIDSSyncEngineMetadataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_deviceObsoletionDuration = a3;
    v6->_tombstoneObsoletionDuration = a4;
    -[DNDSIDSSyncEngineMetadataStore _parseDictionary:](v6, "_parseDictionary:", 0);
  }
  return v7;
}

- (id)unknownRecordIDsInRecordIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)modifiedRecordIDsForPairedDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  NSMutableDictionary *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = v4;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_recordMetadataByRecordID;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isDeleted") & 1) == 0)
        {
          if (!v11
            || (objc_msgSend(v12, "lastModified"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v11, "earlierDate:", v13),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                v14 == v11))
          {
            objc_msgSend(v17, "addObject:", v10);
          }
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v17;
}

- (id)deletedRecordIDsForPairedDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  NSMutableDictionary *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = v4;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_recordMetadataByRecordID;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isDeleted"))
        {
          if (!v11
            || (objc_msgSend(v12, "lastModified"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v11, "earlierDate:", v13),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                v14 == v11))
          {
            objc_msgSend(v17, "addObject:", v10);
          }
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v17;
}

- (void)setLastModifiedDate:(id)a3 forRecordIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DNDSIDSRecordMetadata *v14;
  DNDSIDSRecordMetadata *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = [DNDSIDSRecordMetadata alloc];
          v15 = -[DNDSIDSRecordMetadata initWithRecordID:lastModified:deleted:](v14, "initWithRecordID:lastModified:deleted:", v13, v6, 0, (_QWORD)v16);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordMetadataByRecordID, "setObject:forKeyedSubscript:", v15, v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");
  }

}

- (void)setDeletedAtDate:(id)a3 forRecordIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DNDSIDSRecordMetadata *v14;
  DNDSIDSRecordMetadata *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = [DNDSIDSRecordMetadata alloc];
          v15 = -[DNDSIDSRecordMetadata initWithRecordID:lastModified:deleted:](v14, "initWithRecordID:lastModified:deleted:", v13, v6, 1, (_QWORD)v16);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordMetadataByRecordID, "setObject:forKeyedSubscript:", v15, v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");
  }

}

- (id)recordMetadataForRecordID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", a3);
}

- (void)setSyncDate:(id)a3 forRecordIDs:(id)a4 forPairedDeviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  if (objc_msgSend(v9, "count"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", v11, v10);
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

    -[DNDSIDSSyncEngineMetadataStore garbageCollect](self, "garbageCollect");
    -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");

  }
}

- (void)setSyncDate:(id)a3 forRecordsMatchingMetadata:(id)a4 forPairedDeviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableDictionary *recordMetadataByRecordID;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", v11, v10);
    }
    v22 = v10;
    v23 = v9;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          recordMetadataByRecordID = self->_recordMetadataByRecordID;
          objc_msgSend(v17, "recordID", v22, v23, (_QWORD)v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](recordMetadataByRecordID, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "isEqual:", v20))
          {
            objc_msgSend(v17, "recordID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v21);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    -[DNDSIDSSyncEngineMetadataStore garbageCollect](self, "garbageCollect");
    -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");

    v10 = v22;
    v9 = v23;
  }

}

- (void)purge
{
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *recordIDSyncDatesByPairedDeviceIdentifier;
  NSMutableDictionary *v6;
  NSMutableDictionary *recordMetadataByRecordID;
  NSMutableSet *v8;
  NSMutableSet *initialSyncPairedDeviceIdentifiers;
  uint8_t v10[16];

  v3 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Purging metadata store", v10, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  recordIDSyncDatesByPairedDeviceIdentifier = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  self->_recordIDSyncDatesByPairedDeviceIdentifier = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  recordMetadataByRecordID = self->_recordMetadataByRecordID;
  self->_recordMetadataByRecordID = v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  initialSyncPairedDeviceIdentifiers = self->_initialSyncPairedDeviceIdentifiers;
  self->_initialSyncPairedDeviceIdentifiers = v8;

  -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");
}

- (void)updateMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *recordMetadataByRecordID;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        recordMetadataByRecordID = self->_recordMetadataByRecordID;
        objc_msgSend(v10, "recordID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](recordMetadataByRecordID, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v13)
        {
          v14 = !v10 || v13 == 0;
          if (v14 || (objc_msgSend(v10, "isEqual:", v13) & 1) == 0)
          {
            objc_msgSend(v10, "recordID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngineMetadataStore _forgetSyncDatesForRecordID:](self, "_forgetSyncDatesForRecordID:", v15);

            v16 = self->_recordMetadataByRecordID;
            objc_msgSend(v10, "recordID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v10, v17);

            v7 = 1;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");
  }

}

- (BOOL)hasMetadataForPairedDeviceIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)garbageCollect
{
  -[DNDSIDSSyncEngineMetadataStore _forgetSyncDatesForDevicesWithoutInitialSync](self, "_forgetSyncDatesForDevicesWithoutInitialSync");
  -[DNDSIDSSyncEngineMetadataStore _forgetSyncDatesForOutdatedDevices](self, "_forgetSyncDatesForOutdatedDevices");
  -[DNDSIDSSyncEngineMetadataStore _forgetObsoleteTombstones](self, "_forgetObsoleteTombstones");
}

- (BOOL)isValidAtDate:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[DNDSIDSSyncEngineMetadataStore _isMetadataValidAtDate:](self, "_isMetadataValidAtDate:", v4))
    v5 = -[DNDSIDSSyncEngineMetadataStore _areSyncDatesValidAtDate:](self, "_areSyncDatesValidAtDate:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)removePairedDeviceIdentifier:(id)a3
{
  NSMutableSet *initialSyncPairedDeviceIdentifiers;
  id v5;

  initialSyncPairedDeviceIdentifiers = self->_initialSyncPairedDeviceIdentifiers;
  v5 = a3;
  -[NSMutableSet removeObject:](initialSyncPairedDeviceIdentifiers, "removeObject:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "removeObjectForKey:", v5);

  -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");
}

- (BOOL)hasPerformedInitialSyncForPairedDeviceIdentifier:(id)a3
{
  return -[NSMutableSet containsObject:](self->_initialSyncPairedDeviceIdentifiers, "containsObject:", a3);
}

- (void)setPerformedInitialSyncForPairedDeviceIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_initialSyncPairedDeviceIdentifiers, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_initialSyncPairedDeviceIdentifiers, "addObject:", v4);
    -[DNDSIDSSyncEngineMetadataStore _write](self, "_write");
  }

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
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Failed to load metadata store at url %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_parseDictionary:(id)a3
{
  id v4;
  DNDSBackingStoreDictionaryContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v31;
  NSMutableDictionary *recordIDSyncDatesByPairedDeviceIdentifier;
  NSMutableDictionary *v33;
  void *v34;
  uint64_t v35;
  NSMutableSet *initialSyncPairedDeviceIdentifiers;
  void *v37;
  DNDSIDSSyncEngineMetadataStore *v38;
  void *v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 3, 0, 0, 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(obj);
        v12 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:context:](DNDSIDSRecordMetadata, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), v5);
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v9);
  }

  v37 = v7;
  v38 = self;
  objc_storeStrong((id *)&self->_recordMetadataByRecordID, v7);
  v39 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncDates"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v15;
  v17 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v40);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        v22 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("syncDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("recordID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = +[DNDSIDSRecordID newWithDictionaryRepresentation:context:](DNDSIDSRecordID, "newWithDictionaryRepresentation:context:", v25, v5);

        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("pairedDeviceIdentifier"));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v24)
          v29 = v26 == 0;
        else
          v29 = 1;
        if (!v29 && v27 != 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v31, v28);
          }
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v24, v26);

        }
      }
      v18 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v18);
  }

  recordIDSyncDatesByPairedDeviceIdentifier = v38->_recordIDSyncDatesByPairedDeviceIdentifier;
  v38->_recordIDSyncDatesByPairedDeviceIdentifier = v16;
  v33 = v16;

  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("initialSyncs"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v34);
  else
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v35 = objc_claimAutoreleasedReturnValue();
  initialSyncPairedDeviceIdentifiers = v38->_initialSyncPairedDeviceIdentifiers;
  v38->_initialSyncPairedDeviceIdentifiers = (NSMutableSet *)v35;

}

- (void)_write
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Failed to write metadata store: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_forgetSyncDatesForDevicesWithoutInitialSync
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_initialSyncPairedDeviceIdentifiers, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v6);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v20;
    *(_QWORD *)&v12 = 138543362;
    v18 = v12;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        v17 = DNDSLogIDSSyncEngine;
        if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v28 = v16;
          _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Forgetting device without initial sync data: %{public}@", buf, 0xCu);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", 0, v16, v18, (_QWORD)v19);
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v13);
  }

}

- (void)_forgetSyncDatesForOutdatedDevices
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_initialSyncPairedDeviceIdentifiers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[DNDSIDSSyncEngineMetadataStore _isPairedDeviceOutdated:](self, "_isPairedDeviceOutdated:", v9))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v6);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v20;
    *(_QWORD *)&v12 = 138543362;
    v18 = v12;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        v17 = DNDSLogIDSSyncEngine;
        if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v28 = v16;
          _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Forgetting outdated device: %{public}@", buf, 0xCu);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", 0, v16, v18, (_QWORD)v19);
        -[NSMutableSet removeObject:](self->_initialSyncPairedDeviceIdentifiers, "removeObject:", v16);
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v13);
  }

}

- (BOOL)_isPairedDeviceOutdated:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  NSMutableDictionary *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_recordMetadataByRecordID;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    while (2)
    {
      v7 = 0;
      v18 = v5;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v8, v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v9, "lastModified");
          v11 = v6;
          v12 = v4;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dateByAddingTimeInterval:", self->_deviceObsoletionDuration);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "laterDate:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v12;
          v6 = v11;
          v5 = v18;
          if (v16 == v15)
          {

            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

- (void)_forgetObsoleteTombstones
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_recordMetadataByRecordID;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isDeleted")
          && -[DNDSIDSSyncEngineMetadataStore _canTombstoneBeRemovedWithRecordID:](self, "_canTombstoneBeRemovedWithRecordID:", v9))
        {
          objc_msgSend(v3, "addObject:", v9);
        }

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[DNDSIDSSyncEngineMetadataStore _forgetRecordID:](self, "_forgetRecordID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)_forgetSyncDatesForRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
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
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Forgetting sync dates for record: %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v4);
        if (!objc_msgSend(v13, "count"))
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v6;
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
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)_forgetMetadataForRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Forgetting metadata for record: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordMetadataByRecordID, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)_forgetRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Forgetting record: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSIDSSyncEngineMetadataStore _forgetSyncDatesForRecordID:](self, "_forgetSyncDatesForRecordID:", v4);
  -[DNDSIDSSyncEngineMetadataStore _forgetMetadataForRecordID:](self, "_forgetMetadataForRecordID:", v4);

}

- (BOOL)_canTombstoneBeRemovedWithRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", self->_tombstoneObsoletionDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "laterDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_initialSyncPairedDeviceIdentifiers;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v19 = v5;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v10 = 0;
            goto LABEL_13;
          }
        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
      v10 = 1;
LABEL_13:
      v5 = v19;
    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isMetadataValidAtDate:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_recordMetadataByRecordID;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordMetadataByRecordID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastModified");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "earlierDate:", v4);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_areSyncDatesValidAtDate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  NSMutableDictionary *obj;
  char v19;
  DNDSIDSSyncEngineMetadataStore *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self;
  obj = self->_recordIDSyncDatesByPairedDeviceIdentifier;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v19 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](v20->_recordIDSyncDatesByPairedDeviceIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "earlierDate:", v4);
              v16 = (id)objc_claimAutoreleasedReturnValue();

              if (v16 == v4)
              {
                v19 = 0;
                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }
  else
  {
    v19 = 1;
  }

  return v19 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_initialSyncPairedDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordIDSyncDatesByPairedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordMetadataByRecordID, 0);
}

@end
