@implementation IMDCKMockRecordZone

- (id)_kvStorePath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/SMS/CloudKitMockStore/"), self->_identifier);
}

- (IMDCKMockRecordZone)initWithIdentifier:(id)a3
{
  IMDCKMockRecordZone *v4;
  IMDCKMockRecordZone *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDCKMockRecordZone;
  v4 = -[IMDCKMockRecordZone init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_identifier = (NSString *)a3;
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(a3, "cStringUsingEncoding:", 4), 0);
    v5->_recordStore = (IDSKVStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", -[IMDCKMockRecordZone _kvStorePath](v5, "_kvStorePath"), v5->_identifier, 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)IMDCKMockRecordZone;
  -[IMDCKMockRecordZone dealloc](&v3, sel_dealloc);
}

- (void)handleOperation:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  OS_dispatch_queue *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = (uint64_t)a3;
      v15 = 2112;
      v16 = -[IMDCKMockRecordZone identifier](self, "identifier");
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Mock Handle operation %@ identifier %@", buf, 0x16u);
    }
  }
  v6 = arc4random();
  v7 = v6 % 0x3C;
  if (IMOSLoggingEnabled(v6))
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Adding random delay of %@ seconds", buf, 0xCu);
    }
  }
  v10 = dispatch_time(0, v7);
  v11 = -[IMDCKMockRecordZone queue](self, "queue");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D1535ABC;
  v12[3] = &unk_1E922A180;
  v12[4] = a3;
  v12[5] = self;
  dispatch_after(v10, (dispatch_queue_t)v11, v12);
}

- (id)_fetchRecordZoneChangesOptionsFromOperation:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "configurationsByRecordZoneID"), "allValues"), "firstObject");
}

- (unint64_t)_fetchResultLimit:(id)a3
{
  id v3;

  v3 = -[IMDCKMockRecordZone _fetchRecordZoneChangesOptionsFromOperation:](self, "_fetchRecordZoneChangesOptionsFromOperation:", a3);
  return MEMORY[0x1E0DE7D20](v3, sel_resultsLimit);
}

- (id)_ckRecordFromData:(id)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, &v7);
  v4 = (void *)v3;
  if (v7)
  {
    if (IMOSLoggingEnabled(v3))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Failed to unarchive mock ck record data. Error: %@", buf, 0xCu);
      }
    }
  }
  return v4;
}

- (void)_handleFetchZoneChangesOperation:(id)a3
{
  NSObject *v5;
  unsigned int v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  IDSKVStore *v22;
  uint64_t v23;
  NSObject *v24;
  NSString *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  uint64_t v42;
  uint8_t v43[128];
  uint8_t buf[4];
  NSString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = -[IMDCKMockRecordZone identifier](self, "identifier");
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "ID %@ MOCK Handling fetchRecordZoneChangesOperation", buf, 0xCu);
    }
  }
  v6 = objc_msgSend(a3, "fetchAllChanges");
  v7 = -[IMDCKMockRecordZone _fetchResultLimit:](self, "_fetchResultLimit:", a3);
  v8 = CFSTR("NO");
  if (v6)
    v8 = CFSTR("YES");
  v34 = v8;
  v35 = *MEMORY[0x1E0C947D8];
  do
  {
    v41 = 0;
    v42 = 0;
    v9 = -[IDSKVStore datasUpToLimit:deleteContext:error:](-[IMDCKMockRecordZone recordStore](self, "recordStore"), "datasUpToLimit:deleteContext:error:", v7, &v42, &v41);
    v10 = (void *)v9;
    if (v41)
    {
      if (IMOSLoggingEnabled(v9))
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = -[IMDCKMockRecordZone identifier](self, "identifier");
          *(_DWORD *)buf = 138412546;
          v45 = v12;
          v46 = 2112;
          v47 = v41;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@ Error reading from MOCK store %@ ", buf, 0x16u);
        }
      }
    }
    v13 = objc_msgSend(v10, "count");
    if (IMOSLoggingEnabled(v13))
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        *(_DWORD *)buf = 138412802;
        v16 = CFSTR("NO");
        if (v13 >= v7)
          v16 = CFSTR("YES");
        v45 = (NSString *)v15;
        v46 = 2112;
        v47 = v16;
        v48 = 2112;
        v49 = v34;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "About to give back %@ records moreComing %@ fetchAllChanges %@", buf, 0x20u);
      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v10);
          v20 = -[IMDCKMockRecordZone _ckRecordFromData:](self, "_ckRecordFromData:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          v21 = objc_msgSend(a3, "recordChangedBlock");
          (*(void (**)(uint64_t, id))(v21 + 16))(v21, v20);
        }
        v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v17);
    }
    v36 = 0;
    v22 = -[IMDCKMockRecordZone recordStore](self, "recordStore");
    v23 = -[IDSKVStore deleteBatchWithContext:error:](v22, "deleteBatchWithContext:error:", v42, &v36);
    if (v36)
    {
      if (IMOSLoggingEnabled(v23))
      {
        v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = -[IMDCKMockRecordZone identifier](self, "identifier");
          *(_DWORD *)buf = 138412546;
          v45 = v25;
          v46 = 2112;
          v47 = v36;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "%@ Error deleting from MOCK store %@ ", buf, 0x16u);
        }
      }
    }
    v26 = objc_msgSend(a3, "recordZoneChangeTokensUpdatedBlock");
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v26 + 16))(v26, objc_msgSend((id)objc_msgSend(a3, "recordZoneIDs"), "firstObject"), 0, 0);
    HIDWORD(v27) = -858993459 * arc4random();
    LODWORD(v27) = HIDWORD(v27);
    if ((v27 >> 1) <= 0x19999999)
    {
      v29 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E9271458, &unk_1E9271470, &unk_1E9271488, 0);
      v28 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v35, objc_msgSend((id)objc_msgSend(v29, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v29, "count")), "integerValue"), 0);
      if (IMOSLoggingEnabled(v28))
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v45 = (NSString *)v28;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Introducing random error %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v28 = 0;
    }
    v31 = v13 >= v7;
    v32 = objc_msgSend(a3, "recordZoneFetchCompletionBlock");
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _BOOL8, uint64_t))(v32 + 16))(v32, objc_msgSend((id)objc_msgSend(a3, "recordZoneIDs"), "firstObject"), 0, 0, v31, v28);
  }
  while (v31 & v6);
  v33 = objc_msgSend(a3, "fetchRecordZoneChangesCompletionBlock");
  (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, 0);
}

- (id)_serializedCKRecordData:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v7);
  if (!v4)
  {
    if (IMOSLoggingEnabled(0))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v9 = "-[IMDCKMockRecordZone _serializedCKRecordData:]";
        v10 = 2112;
        v11 = a3;
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%s: Unable to archive record %@, error %@", buf, 0x20u);
      }
    }
  }
  return v4;
}

- (void)_handleModifyRecordsOperation:(id)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = -[IMDCKMockRecordZone identifier](self, "identifier");
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "ID %@ MOCK Handling modifyRecordsOperation", buf, 0xCu);
    }
  }
  v6 = (void *)objc_msgSend(a3, "recordsToSave");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 138412290;
    v22 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v12 = -[IMDCKMockRecordZone _serializedCKRecordData:](self, "_serializedCKRecordData:", v11, v22);
        v23 = 0;
        v13 = -[IDSKVStore persistData:forKey:error:](-[IMDCKMockRecordZone recordStore](self, "recordStore"), "persistData:forKey:error:", v12, objc_msgSend((id)objc_msgSend(v11, "recordID"), "recordName"), &v23);
        v14 = v23 == 0;
        v15 = IMOSLoggingEnabled(v13);
        if (v14)
        {
          if (v15)
          {
            v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = objc_msgSend((id)objc_msgSend(v11, "recordID"), "recordName");
              *(_DWORD *)buf = v22;
              v29 = (NSString *)v19;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Successfully persisted record %@ ", buf, 0xCu);
            }
          }
          v20 = objc_msgSend(a3, "perRecordCompletionBlock");
          (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v11, 0);
        }
        else if (v15)
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = objc_msgSend((id)objc_msgSend(v11, "recordID"), "recordName");
            *(_DWORD *)buf = 138412546;
            v29 = (NSString *)v17;
            v30 = 2112;
            v31 = v23;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Error persisting record %@ error %@", buf, 0x16u);
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }
  v21 = objc_msgSend(a3, "modifyRecordsCompletionBlock");
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v21 + 16))(v21, v6, 0, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSKVStore)recordStore
{
  return self->_recordStore;
}

- (void)setRecordStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
