@implementation CPLEngineStorage

- (CPLEngineStorage)initWithEngineStore:(id)a3 name:(id)a4
{
  id v8;
  id v9;
  CPLEngineStorage *v10;
  CPLEngineStorage *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  uint64_t v15;
  CPLPlatformObject *platformObject;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CPLEngineStorage;
  v10 = -[CPLEngineStorage init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_engineStore, a3);
    v12 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    -[CPLEngineStore registerStorage:](v11->_engineStore, "registerStorage:", v11);
    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "newPlatformImplementationForObject:", v11);
    platformObject = v11->_platformObject;
    v11->_platformObject = (CPLPlatformObject *)v15;

    if (!v11->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_18809();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v25 = v19;
          v20 = v19;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorage.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, v22, 32, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
  }

  return v11;
}

- (NSString)mainScopeIdentifier
{
  return -[CPLEngineStore mainScopeIdentifier](self->_engineStore, "mainScopeIdentifier");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %@ %@]"), v4, v7, self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ %@]"), objc_opt_class(), self->_name);
}

- (BOOL)openWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  CPLEngineStorage *v13;
  int v15;
  CPLEngineStorage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_18809();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Opening %@", (uint8_t *)&v15, 0xCu);
    }

  }
  self->_superWasCalled = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "openWithError:", a3);

  if ((v7 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_18809();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        v9 = "Opened";
        v10 = v8;
        v11 = OS_LOG_TYPE_DEBUG;
        v12 = 2;
LABEL_12:
        _os_log_impl(&dword_1B03C2000, v10, v11, v9, (uint8_t *)&v15, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_18809();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = (CPLEngineStorage *)*a3;
      v15 = 138412290;
      v16 = v13;
      v9 = "Opening failed with error: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_12;
    }
LABEL_13:

  }
  return v7;
}

- (BOOL)closeWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  int v15;
  CPLEngineStorage *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_18809();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Closing %@", (uint8_t *)&v15, 0xCu);
    }

  }
  self->_superWasCalled = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "closeWithError:", a3);

  if ((v7 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_18809();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138412290;
        v16 = self;
        v9 = "%@ closed";
        v10 = v8;
        v11 = OS_LOG_TYPE_DEBUG;
        v12 = 12;
LABEL_12:
        _os_log_impl(&dword_1B03C2000, v10, v11, v9, (uint8_t *)&v15, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_18809();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = *a3;
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v13;
      v9 = "Closing %@ failed with error: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
      goto LABEL_12;
    }
LABEL_13:

  }
  return v7;
}

- (BOOL)performMaintenanceWithError:(id *)a3
{
  return 1;
}

- (unint64_t)scopeType
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorage.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 78, CFSTR("-[%@ %@] should be implemented by subclasses"), v6, v7);

  abort();
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorage.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 83, CFSTR("-[%@ %@] should be implemented by subclasses"), v10, v11);

  abort();
}

- (id)statusPerScopeIndex
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldIncludeInStatus");

  if (v4)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusPerScopeIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)writeTransactionDidFail
{
  id v2;

  self->_superWasCalled = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeTransactionDidFail");

}

- (void)writeTransactionDidSucceed
{
  id v2;

  self->_superWasCalled = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeTransactionDidSucceed");

}

- (void)transactionDidFinish
{
  id v2;

  self->_superWasCalled = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionDidFinish");

}

- (BOOL)isEmpty
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty");

  return v3;
}

- (BOOL)isAlive
{
  void *v3;
  char v4;

  if (!-[CPLEngineStorage shouldBeCreatedDynamically](self, "shouldBeCreatedDynamically"))
    return 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAlive");

  return v4;
}

- (BOOL)shouldIncludeInStatus
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldIncludeInStatus");

  return v3;
}

- (id)status
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldIncludeInStatus");

  if (v4)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)statusDictionary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldIncludeInStatus");

  if (v4)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_checkSuperWasCalled
{
  void *v3;
  char v4;

  if (self->_superWasCalled)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_checkSuperWasCalled");

  }
  else
  {
    v4 = 0;
  }
  self->_superWasCalled = 0;
  return v4;
}

- (BOOL)testKey:(id)a3 value:(id)a4 didHandle:(BOOL *)a5 result:(id *)a6 error:(id *)a7
{
  *a5 = 0;
  return 1;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (BOOL)shouldBeCreatedDynamically
{
  return self->_shouldBeCreatedDynamically;
}

- (CPLEngineStore)engineStore
{
  return self->_engineStore;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_engineStore, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

+ (id)platformImplementationProtocol
{
  void *v2;
  NSString *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Implementation"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
