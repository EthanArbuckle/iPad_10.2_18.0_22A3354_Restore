@implementation SGKeyValueCacheManager

- (id)cacheOfType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *basePath;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  __CFString *v16;
  __CFString *v17;
  NSString *v18;
  void *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheManager.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cacheType < SGKeyValueCacheTypeCount"));

  }
  pthread_mutex_lock(&self->_lock);
  -[NSMutableArray objectAtIndexedSubscript:](self->_cacheFiles, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    basePath = self->_basePath;
    v10 = (void *)MEMORY[0x1E0D19840];
    if (basePath)
    {
      v11 = CFSTR("email-to-name.kvcache");
      if (!a3)
        v11 = CFSTR("phone-to-name.kvcache");
      v12 = v11;
      -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyValueCacheForPath:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19840]), "initInMemory");
    }

    if (v7)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_cacheFiles, "setObject:atIndexedSubscript:", v7, a3);
    }
    else
    {
      sgLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v16 = CFSTR("email-to-name.kvcache");
        if (!a3)
          v16 = CFSTR("phone-to-name.kvcache");
        v17 = v16;
        v18 = self->_basePath;
        *(_DWORD *)buf = 138412546;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        _os_log_fault_impl(&dword_1C3607000, v14, OS_LOG_TYPE_FAULT, "Error opening file %@ at base path: %@", buf, 0x16u);

      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v7 = v5;
  }
  pthread_mutex_unlock(&self->_lock);
  return v7;
}

- (SGKeyValueCacheManager)initWithBasePath:(id)a3
{
  id v5;
  SGKeyValueCacheManager *v6;
  SGKeyValueCacheManager *v7;
  uint64_t v8;
  NSMutableArray *cacheFiles;
  NSMutableArray *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGKeyValueCacheManager;
  v6 = -[SGKeyValueCacheManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_basePath, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    cacheFiles = v7->_cacheFiles;
    v7->_cacheFiles = (NSMutableArray *)v8;

    v10 = v7->_cacheFiles;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v10, "addObject:", v11);

    v12 = v7->_cacheFiles;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v12, "addObject:", v13);

    pthread_mutex_init(&v7->_lock, 0);
  }

  return v7;
}

- (SGKeyValueCacheManager)init
{
  void *v3;
  SGKeyValueCacheManager *v4;

  +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SGKeyValueCacheManager initWithBasePath:](self, "initWithBasePath:", v3);

  return v4;
}

- (id)initInMemory
{
  return -[SGKeyValueCacheManager initWithBasePath:](self, "initWithBasePath:", 0);
}

- (void)replaceCacheOfType:(unint64_t)a3 block:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int (**v10)(id, void *);

  v10 = (unsigned int (**)(id, void *))a4;
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheManager.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cacheType < SGKeyValueCacheTypeCount"));

  }
  -[SGKeyValueCacheManager cacheOfType:](self, "cacheOfType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19840]), "initTemporaryForOverwritingCache:", v7);
    if (v8 && v10[2](v10, v8))
      objc_msgSend(v8, "commitTemporaryFile");

  }
}

- (void)deleteValueByRecordIdSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGKeyValueCacheManager cacheOfType:](self, "cacheOfType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteValueByRecordIdSet:", v8);

  objc_autoreleasePoolPop(v4);
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGKeyValueCacheManager cacheOfType:](self, "cacheOfType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteValueByRecordIdSet:", v8);

  objc_autoreleasePoolPop(v6);
}

- (void)deleteValueByRecordId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGKeyValueCacheManager cacheOfType:](self, "cacheOfType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteValueByRecordId:", v8);

  objc_autoreleasePoolPop(v4);
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGKeyValueCacheManager cacheOfType:](self, "cacheOfType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteValueByRecordId:", v8);

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheFiles, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
}

@end
