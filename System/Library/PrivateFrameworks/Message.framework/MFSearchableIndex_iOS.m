@implementation MFSearchableIndex_iOS

- (id)powerObservable
{
  void *v2;
  void *v3;

  +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "powerObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MFSearchableIndex_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_28 != -1)
    dispatch_once(&log_onceToken_28, block);
  return (OS_os_log *)(id)log_log_28;
}

- (MFSearchableIndex_iOS)initWithName:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  MFSearchableIndex_iOS *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFSearchableIndex_iOS;
  v8 = -[EDSearchableIndex initWithName:dataSource:](&v13, sel_initWithName_dataSource_, v6, v7);
  if (v8)
  {
    MFUserAgent();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndex setForeground:](v8, "setForeground:", objc_msgSend(v9, "isForeground"));

    objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addDiagnosticsGenerator:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel_attachmentBecameAvailable_, CFSTR("LibraryMessageAttachmentDataBecameAvailableNotification"), 0);

  return v8;
}

- (id)dataSourceRefreshReasons
{
  if (dataSourceRefreshReasons_onceToken != -1)
    dispatch_once(&dataSourceRefreshReasons_onceToken, &__block_literal_global_57);
  return (id)dataSourceRefreshReasons_reasons;
}

- (id)purgeReasons
{
  if (purgeReasons_onceToken != -1)
    dispatch_once(&purgeReasons_onceToken, &__block_literal_global_12);
  return (id)purgeReasons_reasons;
}

- (id)exclusionReasons
{
  if (exclusionReasons_onceToken != -1)
    dispatch_once(&exclusionReasons_onceToken, &__block_literal_global_13_0);
  return (id)exclusionReasons_reasons;
}

- (id)currentReasons
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFSearchableIndex_iOS;
    -[EDSearchableIndex currentReasons](&v8, sel_currentReasons);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_indexMessage:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MFSearchableIndexItem_iOS *v12;
  int v13;
  void *v14;
  char v15;
  _QWORD v16[2];

  v6 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    v15 = 0;
    objc_msgSend(v8, "bestAlternativePart:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = -[EDSearchableIndexItem initWithMessage:bodyData:fetchBody:]([MFSearchableIndexItem_iOS alloc], "initWithMessage:bodyData:fetchBody:", v9, v11, v6);
  -[EDSearchableIndexItem setIndexingType:](v12, "setIndexingType:", a5);
  v13 = objc_msgSend(MEMORY[0x1E0D1EBF0], "isIncrementalIndexingType:", a5);
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex indexItems:immediately:](self, "indexItems:immediately:", v14, v13 & (v6 ^ 1));

}

- (void)indexMessages:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v18;
    *(_QWORD *)&v10 = 138543362;
    v16 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v13, "messageFlags", v16, (_QWORD)v17) & 0x80) != 0)
        {
          +[MFSearchableIndex_iOS log](MFSearchableIndex_iOS, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "ef_publicDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v22 = v15;
            _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, "Skipping indexing of message %{public}@ since it's a server search result...", buf, 0xCu);

          }
        }
        else
        {
          -[MFSearchableIndex_iOS _indexMessage:includeBody:indexingType:](self, "_indexMessage:includeBody:indexingType:", v13, v6, a5);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

}

- (BOOL)isPluggedIn
{
  void *v2;
  char v3;

  +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPluggedIn");

  return v3;
}

@end
