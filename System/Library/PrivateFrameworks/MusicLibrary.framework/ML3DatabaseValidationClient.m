@implementation ML3DatabaseValidationClient

void __59__ML3DatabaseValidationClient__validatableDatabaseForPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _ML3ValidatableDatabase *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = -[_ML3ValidatableDatabase initWithDatabasePath:]([_ML3ValidatableDatabase alloc], "initWithDatabasePath:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", v5, a1[5]);
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (BOOL)validateDatabaseForLibrary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "databasePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ML3DatabaseValidationClient _validateDatabaseForPath:usingLibrary:](self, "_validateDatabaseForPath:usingLibrary:", v5, v4);

  return (char)self;
}

- (BOOL)_validateDatabaseForPath:(id)a3 usingLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[ML3DatabaseValidationClient _validatableDatabaseForPath:](self, "_validatableDatabaseForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "currentQueueIsValidationQueue") & 1) == 0)
  {
    objc_msgSend(v8, "validationSerialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke;
    v12[3] = &unk_1E5B65730;
    v13 = v8;
    v14 = v7;
    v16 = &v17;
    v15 = v6;
    dispatch_sync(v9, v12);

  }
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)_validatableDatabaseForPath:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20081;
  v16 = __Block_byref_object_dispose__20082;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ML3DatabaseValidationClient__validatableDatabaseForPath___block_invoke;
  block[3] = &unk_1E5B65CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)sharedClient
{
  if (sharedClient___once != -1)
    dispatch_once(&sharedClient___once, &__block_literal_global_20127);
  return (id)sharedClient___sharedValidator;
}

void __43__ML3DatabaseValidationClient_sharedClient__block_invoke()
{
  ML3DatabaseValidationClient *v0;
  void *v1;

  v0 = objc_alloc_init(ML3DatabaseValidationClient);
  v1 = (void *)sharedClient___sharedValidator;
  sharedClient___sharedValidator = (uint64_t)v0;

}

- (ML3DatabaseValidationClient)init
{
  ML3DatabaseValidationClient *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *validatableDatabases;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3DatabaseValidationClient;
  v2 = -[ML3DatabaseValidationClient init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    validatableDatabases = v2->_validatableDatabases;
    v2->_validatableDatabases = v3;

    v5 = dispatch_queue_create("com.apple.MusicLibrary.ML3DatabaseValidationClient", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

uint64_t __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;
  ML3DatabaseValidation *v3;
  uint64_t v4;
  ML3DatabaseValidation *v5;
  uint64_t v6;
  char v7;
  id v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "validationState");
  if (result == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    return result;
  }
  objc_msgSend(*(id *)(a1 + 32), "setValidationState:", 1);
  if ((objc_msgSend(*(id *)(a1 + 40), "isHomeSharingLibrary") & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 40), "isUnitTesting"))
  {
    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v5 = (ML3DatabaseValidation *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v15 = 0;
    v7 = -[ML3DatabaseValidation validateDatabaseAtPath:error:](v5, "validateDatabaseAtPath:error:", v6, &v15);
    v8 = v15;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        v12 = "Database validation succeeded";
        v13 = v10;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      v12 = "Database validation FAILED with error: %{public}@";
      v13 = v10;
      v14 = 12;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  v3 = [ML3DatabaseValidation alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke_2;
  v16[3] = &unk_1E5B65708;
  v16[4] = *(_QWORD *)(a1 + 56);
  v5 = -[ML3DatabaseValidation initWithLibrary:delegate:completion:](v3, "initWithLibrary:delegate:completion:", v4, 0, v16);
  -[ML3DatabaseValidation runValidation](v5, "runValidation");
LABEL_13:

  return objc_msgSend(*(id *)(a1 + 32), "setValidationState:", 0);
}

- (BOOL)validateDatabaseAtPath:(id)a3
{
  return -[ML3DatabaseValidationClient _validateDatabaseForPath:usingLibrary:](self, "_validateDatabaseForPath:usingLibrary:", a3, 0);
}

- (BOOL)validateDatabaseForConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "databasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseValidationClient.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection.databasePath != nil"));

  }
  objc_msgSend(v5, "databasePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ML3DatabaseValidationClient _validateDatabaseForPath:usingLibrary:](self, "_validateDatabaseForPath:usingLibrary:", v7, 0);

  return v8;
}

- (BOOL)isValidatingDatabaseForPath:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ML3DatabaseValidationClient_isValidatingDatabaseForPath___block_invoke;
  block[3] = &unk_1E5B65CF0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_validatableDatabases, 0);
}

void __59__ML3DatabaseValidationClient_isValidatingDatabaseForPath___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "validationState") == 1;

}

uint64_t __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
