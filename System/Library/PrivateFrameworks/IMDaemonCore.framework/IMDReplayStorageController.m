@implementation IMDReplayStorageController

- (IMDReplayStorageController)initWithFilePath:(id)a3
{
  IMDReplayStorageController *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[16];

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)IMDReplayStorageController;
    v4 = -[IMDReplayStorageController init](&v7, sel_init);
    if (v4)
    {
      v4->_filePath = (NSString *)a3;
      v4->_store = (IDSKVStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", a3, CFSTR("IMDReplayStorageController"), 2);
    }
  }
  else
  {
    if (IMOSLoggingEnabled(self))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "passing in nil filePath to initWithFilePath", buf, 2u);
      }
    }
    return 0;
  }
  return v4;
}

- (BOOL)storeDictionary:(id)a3 error:(id *)a4
{
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];

  v7 = objc_sync_enter(self);
  if (a3)
    goto LABEL_2;
  if (IMOSLoggingEnabled(v7))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "IMDReplayStorageController was asked to store nil dictionary", v11, 2u);
    }
  }
  if (!a4)
  {
LABEL_2:
    -[IDSKVStore persistData:forKey:error:](self->_store, "persistData:forKey:error:", JWEncodeDictionary(), 0, 0);
    v8 = 1;
  }
  else
  {
    v8 = 0;
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMDReplayMessageStorageControllerErrorDomain"), 0, 0);
  }
  objc_sync_exit(self);
  return v8;
}

- (id)copyNextBatchWithSize:(unint64_t)a3 iterationContext:(id *)a4
{
  void *v7;
  IMDReplayStorageIterationContext *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (a4 && *a4)
  {
    -[IDSKVStore deleteBatchWithContext:error:](self->_store, "deleteBatchWithContext:error:", objc_msgSend(*a4, "deleteContext"), 0);
    *a4 = 0;
  }
  v19 = 0;
  v7 = (void *)-[IDSKVStore datasUpToLimit:deleteContext:error:](self->_store, "datasUpToLimit:deleteContext:error:", a3, &v19, 0);
  if (v7)
  {
    if (a4)
    {
      v8 = objc_alloc_init(IMDReplayStorageIterationContext);
      *a4 = v8;
      -[IMDReplayStorageIterationContext setDeleteContext:](v8, "setDeleteContext:", v19);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v13 = (void *)MEMORY[0x1D17EA968]();
          objc_msgSend(v9, "addObject:", JWDecodeDictionary());
          objc_autoreleasePoolPop(v13);
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }
  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(self);
  return v9;
}

- (void)deleteReplayDB
{
  uint64_t v3;
  NSObject *v4;
  NSString *filePath;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_sync_enter(self);
  if (IMOSLoggingEnabled(v3))
  {
    v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      filePath = self->_filePath;
      v6 = 138412290;
      v7 = filePath;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Deleting replay db with path %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IDSKVStore deleteDatabase](self->_store, "deleteDatabase");
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_super v3;

  objc_sync_enter(self);

  objc_sync_exit(self);
  v3.receiver = self;
  v3.super_class = (Class)IMDReplayStorageController;
  -[IMDReplayStorageController dealloc](&v3, sel_dealloc);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (IDSKVStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
