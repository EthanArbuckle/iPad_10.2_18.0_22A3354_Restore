@implementation CPLEngineStoreTransaction

- (id)initForWrite:(BOOL)a3 store:(id)a4 identifier:(id)a5 description:(id)a6
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  CPLEngineStoreTransaction *v14;
  CPLEngineStoreTransaction *v15;
  CPLTransaction *v16;
  CPLTransaction *dirty;
  objc_super v19;

  v9 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CPLEngineStoreTransaction;
  v14 = -[CPLEngineStoreTransaction init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_forWrite = v9;
    objc_storeStrong((id *)&v14->_store, a4);
    v16 = +[CPLTransaction newTransactionWithIdentifier:description:keepPower:](CPLTransaction, "newTransactionWithIdentifier:description:keepPower:", v12, v13, v9);
    dirty = v15->_dirty;
    v15->_dirty = v16;

  }
  return v15;
}

- (BOOL)_forWrite
{
  return self->_forWrite;
}

- (BOOL)do:(id)a3
{
  NSError **p_error;
  char v4;
  id v5;
  id v6;
  id v8;

  p_error = &self->_error;
  if (self->_error)
    return 0;
  v8 = 0;
  v4 = (*((uint64_t (**)(id, id *))a3 + 2))(a3, &v8);
  v5 = v8;
  v6 = v8;
  if ((v4 & 1) == 0 && !*p_error)
    objc_storeStrong((id *)p_error, v5);

  return v4;
}

- (void)_transactionWillBeginOnThread:(id)a3
{
  NSThread *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (NSThread *)a3;
  if (self->_currentThread)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to set transaction thread twice", v9, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 2537, CFSTR("Trying to set transaction thread twice"));

    abort();
  }
  self->_currentThread = v5;

}

- (void)_transactionDidFinish
{
  NSThread *currentThread;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *cleanupBlocks;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentThread = self->_currentThread;
  self->_currentThread = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_cleanupBlocks, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  cleanupBlocks = self->_cleanupBlocks;
  self->_cleanupBlocks = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[CPLTransaction endTransaction](self->_dirty, "endTransaction");
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineStoreTransaction;
  -[CPLEngineStoreTransaction dealloc](&v3, sel_dealloc);
}

- (void)_releaseDirty
{
  CPLTransaction *dirty;

  -[CPLTransaction endTransaction](self->_dirty, "endTransaction");
  dirty = self->_dirty;
  self->_dirty = 0;

}

- (void)addCleanupBlock:(id)a3
{
  id v4;
  NSMutableArray *cleanupBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  cleanupBlocks = self->_cleanupBlocks;
  v10 = v4;
  if (!cleanupBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_cleanupBlocks;
    self->_cleanupBlocks = v6;

    v4 = v10;
    cleanupBlocks = self->_cleanupBlocks;
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  v9 = (void *)MEMORY[0x1B5E08DC4]();
  -[NSMutableArray addObject:](cleanupBlocks, "addObject:", v9);

}

- (BOOL)canWrite
{
  NSThread *v3;
  BOOL v4;

  if (!self->_forWrite)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (NSThread *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == self->_currentThread;

  return v4;
}

- (BOOL)canRead
{
  NSThread *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (NSThread *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self->_currentThread;

  return (char)self;
}

- (id)description
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self->_forWrite)
    v3 = " [WRITE]";
  else
    v3 = "";
  -[CPLTransaction identifier](self->_dirty, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[TRANSACTION%s %@]"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isLibraryClosed
{
  NSError *error;

  error = self->_error;
  if (error)
    LOBYTE(error) = -[NSError isCPLErrorWithCode:](error, "isCPLErrorWithCode:", 2);
  return (char)error;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (CPLEngineWriteTransactionBlocker)blocker
{
  return self->_blocker;
}

- (void)setBlocker:(id)a3
{
  objc_storeStrong((id *)&self->_blocker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocker, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dirty, 0);
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_storeStrong((id *)&self->_currentThread, 0);
}

+ (CPLEngineStoreTransaction)currentTransaction
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to get the current transaction outside of any transaction", v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v10, 2496, CFSTR("Trying to get the current transaction outside of any transaction"));

    abort();
  }

  return (CPLEngineStoreTransaction *)v6;
}

@end
