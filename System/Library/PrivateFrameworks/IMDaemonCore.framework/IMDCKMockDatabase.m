@implementation IMDCKMockDatabase

- (id)_initWithContainer:(id)a3 scope:(int64_t)a4
{
  _QWORD *v4;
  IMDCKMockRecordKeyZone *v5;
  IMDCKMockRecordZone *v6;
  IMDCKMockRecordZone *v7;
  IMDCKMockRecordZone *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMDCKMockDatabase;
  v4 = -[IMDCKMockDatabase _initWithContainer:scope:](&v10, sel__initWithContainer_scope_, a3, a4);
  if (v4)
  {
    v5 = -[IMDCKMockRecordZone initWithIdentifier:]([IMDCKMockRecordKeyZone alloc], "initWithIdentifier:", CFSTR("recordKeyZone"));
    v6 = -[IMDCKMockRecordZone initWithIdentifier:]([IMDCKMockRecordZone alloc], "initWithIdentifier:", CFSTR("chatManateeZone"));
    v7 = -[IMDCKMockRecordZone initWithIdentifier:]([IMDCKMockRecordZone alloc], "initWithIdentifier:", CFSTR("messageManateeZone"));
    v8 = -[IMDCKMockRecordZone initWithIdentifier:]([IMDCKMockRecordZone alloc], "initWithIdentifier:", CFSTR("attachmentManateeZone"));
    v4[3] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, -[IMDCKMockRecordZone identifier](v5, "identifier"), v6, -[IMDCKMockRecordZone identifier](v6, "identifier"), v7, -[IMDCKMockRecordZone identifier](v7, "identifier"), v8, -[IMDCKMockRecordZone identifier](v8, "identifier"), 0);

  }
  return v4;
}

- (IMDCKMockDatabase)init
{
  IMDCKMockDatabase *v2;
  IMDCKMockRecordZone *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMDCKMockDatabase;
  v2 = -[IMDCKMockDatabase init](&v5, sel_init);
  if (v2)
  {
    v3 = -[IMDCKMockRecordZone initWithIdentifier:]([IMDCKMockRecordZone alloc], "initWithIdentifier:", CFSTR("recordKeyZone"));
    v2->_identifierToZoneMap = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v3, -[IMDCKMockRecordZone identifier](v3, "identifier"), 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDCKMockDatabase;
  -[IMDCKMockDatabase dealloc](&v3, sel_dealloc);
}

- (id)_zoneManager
{
  return +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
}

- (id)_zoneIdentifierForOperation:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
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
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = (void *)objc_msgSend(a3, "recordsToSave");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = CFSTR("recordKeyZone");
      v9 = *(_QWORD *)v24;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if ((objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", CFSTR("SyncCompleteRecordType")) & 1) != 0)
          return (id)v8;
        if ((objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", CFSTR("chatEncryptedv2")) & 1) != 0)
          return CFSTR("chatManateeZone");
        if ((objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", CFSTR("MessageEncryptedV3")) & 1) != 0)
          return CFSTR("messageManateeZone");
        if ((objc_msgSend((id)objc_msgSend(v11, "recordType"), "isEqualToString:", CFSTR("attachment")) & 1) != 0)
          return CFSTR("attachmentManateeZone");
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v7)
            goto LABEL_4;
          return &stru_1E92346B0;
        }
      }
    }
    return &stru_1E92346B0;
  }
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    {
      v17 = (void *)objc_msgSend((id)objc_msgSend(a3, "recordZoneIDs"), "firstObject");
      v8 = CFSTR("chatManateeZone");
      if ((objc_msgSend((id)objc_msgSend(v17, "zoneName"), "isEqualToString:", CFSTR("chatManateeZone")) & 1) != 0)
        return (id)v8;
      v8 = CFSTR("messageManateeZone");
      if ((objc_msgSend((id)objc_msgSend(v17, "zoneName"), "isEqualToString:", CFSTR("messageManateeZone")) & 1) != 0)
        return (id)v8;
      v8 = CFSTR("attachmentManateeZone");
      if ((objc_msgSend((id)objc_msgSend(v17, "zoneName"), "isEqualToString:", CFSTR("attachmentManateeZone")) & 1) != 0)
        return (id)v8;
    }
    return &stru_1E92346B0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_msgSend(a3, "recordIDs", 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (!v13)
    return &stru_1E92346B0;
  v14 = v13;
  v15 = *(_QWORD *)v20;
  v8 = CFSTR("recordKeyZone");
LABEL_17:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v15)
      objc_enumerationMutation(v12);
    if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "zoneID"), "isEqual:", objc_msgSend(-[IMDCKMockDatabase _zoneManager](self, "_zoneManager"), "deDupeSaltZoneID")) & 1) != 0)return (id)v8;
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v14)
        goto LABEL_17;
      return &stru_1E92346B0;
    }
  }
}

- (void)addOperation:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Adding operation %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v6 = -[IMDCKMockDatabase _zoneIdentifierForOperation:](self, "_zoneIdentifierForOperation:", a3);
  v7 = -[NSDictionary objectForKey:](-[IMDCKMockDatabase identifierToZoneMap](self, "identifierToZoneMap"), "objectForKey:", v6);
  if (v7)
  {
    objc_msgSend(v7, "handleOperation:", a3);
  }
  else if (IMOSLoggingEnabled(0))
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = a3;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Did not find mock database for operation %@ zoneID %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (NSDictionary)identifierToZoneMap
{
  return self->_identifierToZoneMap;
}

@end
