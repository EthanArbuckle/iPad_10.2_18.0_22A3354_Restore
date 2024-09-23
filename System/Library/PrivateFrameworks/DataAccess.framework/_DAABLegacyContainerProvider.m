@implementation _DAABLegacyContainerProvider

- (_DAABLegacyContainerProvider)initWithAddressBook:(void *)a3
{
  _DAABLegacyContainerProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DAABLegacyContainerProvider;
  v4 = -[_DAABLegacyContainerProvider init](&v6, sel_init);
  if (v4)
    v4->_addressBook = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_addressBook);
  v3.receiver = self;
  v3.super_class = (Class)_DAABLegacyContainerProvider;
  -[_DAABLegacyContainerProvider dealloc](&v3, sel_dealloc);
}

- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  DAABLegacyContainer *v9;

  v6 = a4;
  v7 = a3;
  -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
  v8 = (const void *)ABAddressBookCopySourceWithAccountAndExternalIdentifiers();

  if (v8)
  {
    v9 = -[DAABLegacyContainer initWithABSource:]([DAABLegacyContainer alloc], "initWithABSource:", v8);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)allContainers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DAABLegacyContainer *v10;
  DAABLegacyContainer *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
  v2 = (void *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [DAABLegacyContainer alloc];
        v11 = -[DAABLegacyContainer initWithABSource:](v10, "initWithABSource:", v9, (_QWORD)v13);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allContainersForAccountWithExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DAABLegacyContainer *v13;
  DAABLegacyContainer *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
  v5 = (void *)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = [DAABLegacyContainer alloc];
        v14 = -[DAABLegacyContainer initWithABSource:](v13, "initWithABSource:", v12, (_QWORD)v16);
        objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const void *v20;
  DAABLegacyContainer *v21;
  _BOOL4 v23;

  v23 = a8;
  v15 = a10;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = (const void *)ABSourceCreate();
  objc_msgSend(v15, "legacyIdentifier");

  ABRecordSetIntValue();
  v21 = -[DAABLegacyContainer initWithABSource:]([DAABLegacyContainer alloc], "initWithABSource:", v20);
  -[DAABLegacyContainer setType:](v21, "setType:", a3);
  -[DAABLegacyContainer setName:](v21, "setName:", v19);

  -[DAABLegacyContainer setExternalIdentifier:](v21, "setExternalIdentifier:", v18);
  -[DAABLegacyContainer setConstraintsPath:](v21, "setConstraintsPath:", v17);

  -[DAABLegacyContainer setSyncData:](v21, "setSyncData:", v16);
  -[DAABLegacyContainer setContentReadonly:](v21, "setContentReadonly:", v23);
  -[DAABLegacyContainer setArePropertiesReadonly:](v21, "setArePropertiesReadonly:", a9);
  ABAddressBookAddRecord(-[_DAABLegacyContainerProvider addressBook](self, "addressBook"), v20, 0);
  CFRelease(v20);
  return v21;
}

- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5
{
  id v6;

  v6 = a3;
  -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
  objc_msgSend(v6, "asSource");

  ABAddressBookSetDefaultSource();
}

- (void)mergeAllRecordsIntoContainer:(id)a3 shouldInsertChangeHistoryRecords:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  ABRecordID RecordID;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  os_log_type_t v20;
  _QWORD v21[8];
  ABRecordID v22;
  BOOL v23;
  uint8_t buf[4];
  _BOOL4 v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (const void *)objc_msgSend(v6, "asSource");
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      v11 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
      if (os_log_type_enabled(v9, v11))
      {
        *(_DWORD *)buf = 67240192;
        v25 = v4;
        _os_log_impl(&dword_1B51E4000, v10, v11, "About to mergeAllRecordsIntoContainer, shouldInsertChangeHistoryRecords: %{public}d ", buf, 8u);
      }

      -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
      if (ABAddressBookGetCountOfRecordsOutsideSource() >= 1)
      {
        -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
        v12 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
        if (v12)
        {
          v13 = v12;
          Count = CFArrayGetCount(v12);
          RecordID = ABRecordGetRecordID(v8);
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __94___DAABLegacyContainerProvider_mergeAllRecordsIntoContainer_shouldInsertChangeHistoryRecords___block_invoke;
          v21[3] = &unk_1E68CBC08;
          v23 = v4;
          v22 = RecordID;
          v21[4] = self;
          v21[5] = Count;
          v21[6] = v13;
          v21[7] = v8;
          v16 = MEMORY[0x1B5E48C2C](v21);
          v17 = (void *)v16;
          if (v4)
          {
            -[_DAABLegacyContainerProvider addressBook](self, "addressBook");
            ABChangeHistoryInsertUpdatesForRecordsFromBlockWithClientIdentifier();
          }
          else
          {
            (*(void (**)(uint64_t))(v16 + 16))(v16);
          }
          CFRelease(v13);

        }
      }
    }
    else
    {
      v20 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
      if (os_log_type_enabled(v9, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B51E4000, v10, v20, "Could not derive an ABSource from DAContainer in -mergeAllRecordsIntoContainer:shouldInsertChangeHistoryRecords, aborting merge", buf, 2u);
      }

    }
  }
  else
  {
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B51E4000, v18, v19, "Nil container passed to -mergeAllRecordsIntoContainer:shouldInsertChangeHistoryRecords, aborting merge", buf, 2u);
    }

  }
}

- (BOOL)setLastSyncDateForContainer:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  ABPropertyID v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const void *)objc_msgSend(v3, "asSource");
  v6 = *MEMORY[0x1E0CF6308];
  v7 = (void *)ABRecordCopyValue(v5, *MEMORY[0x1E0CF6308]);
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  v10 = os_log_type_enabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1B51E4000, v8, v9, "Another sync finishing %{public}@, not setting lastSyncDate", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    if (v10)
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1B51E4000, v8, v9, "First sync finishing %{public}@, setting lastSyncDate", (uint8_t *)&v12, 0xCu);
    }

    ABRecordSetValue((ABRecordRef)objc_msgSend(v3, "asSource"), v6, v4, 0);
  }

  return v7 == 0;
}

- (void)addressBook
{
  return self->_addressBook;
}

@end
