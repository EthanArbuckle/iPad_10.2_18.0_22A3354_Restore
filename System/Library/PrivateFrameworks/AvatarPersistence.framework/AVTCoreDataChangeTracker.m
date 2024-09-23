@implementation AVTCoreDataChangeTracker

- (AVTCoreDataChangeTracker)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  AVTAvatarManagedRecordTransformer *v8;
  AVTCoreDataChangeTracker *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(AVTAvatarManagedRecordTransformer);
  v9 = -[AVTCoreDataChangeTracker initWithConfiguration:recordTransformer:environment:](self, "initWithConfiguration:recordTransformer:environment:", v7, v8, v6);

  return v9;
}

- (AVTCoreDataChangeTracker)initWithConfiguration:(id)a3 recordTransformer:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTCoreDataChangeTracker *v12;
  AVTCoreDataChangeTracker *v13;
  uint64_t v14;
  AVTUILogger *logger;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTCoreDataChangeTracker;
  v12 = -[AVTCoreDataChangeTracker init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a5);
    objc_msgSend(v11, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    objc_storeStrong((id *)&v13->_recordTransformer, a4);
    objc_storeStrong((id *)&v13->_configuration, a3);
  }

  return v13;
}

- (BOOL)processChangeTransactionsWithChangeTokenLocation:(id)a3 handler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD v25[4];
  id v26;
  AVTCoreDataChangeTracker *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  v8 = a3;
  v9 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  -[AVTCoreDataChangeTracker currentHistoryTokenForLocation:](self, "currentHistoryTokenForLocation:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataChangeTracker configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createManagedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke;
  v25[3] = &unk_24DD32B08;
  v30 = &v45;
  v13 = v12;
  v31 = &v33;
  v32 = &v39;
  v26 = v13;
  v27 = self;
  v14 = v10;
  v28 = v14;
  v15 = v9;
  v29 = v15;
  objc_msgSend(v13, "performBlockAndWait:", v25);
  if (!*((_BYTE *)v46 + 24))
  {
    if (a5)
    {
      v19 = 0;
      *a5 = objc_retainAutorelease((id)v34[5]);
      goto LABEL_11;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v16 = (id)v40[5];
  if (v16 != v14)
  {
    v17 = (id *)(v34 + 5);
    obj = (id)v34[5];
    v18 = -[AVTCoreDataChangeTracker saveToken:location:error:](self, "saveToken:location:error:", v16, v8, &obj);
    objc_storeStrong(v17, obj);
    *((_BYTE *)v46 + 24) = v18;
    if (!v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease((id)v34[5]);
      -[AVTCoreDataChangeTracker logger](self, "logger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v34[5], "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logErrorSavingChangeToken:location:", v21, v22);

      goto LABEL_10;
    }
  }
  v19 = 1;
LABEL_11:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v19;
}

void __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(id *)(v4 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "setQueryGenerationFromToken:error:", v3, &v16);
  objc_storeStrong((id *)(v4 + 40), v16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_BYTE)v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v6 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke_2;
    v13[3] = &unk_24DD32AE0;
    v13[4] = v6;
    v14 = v7;
    v15 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(v6, "enumerateChangesAfterToken:managedObjectContext:changesHandler:error:", v5, v14, v13, &obj);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), obj);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                           + 40) == 0;

  }
}

uint64_t __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "trackerChangesFromPersistentChanges:managedObjectContext:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(*(id *)(a1 + 32), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logTrackerProcessingChanges:count:from:", v5, v6, v7);

    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)trackerChangesFromPersistentChanges:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  AVTCoreDataChangeTrackerChange *v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((*((BOOL (**)(uint64_t, void *))AVTIsPersistentChangeOfInterest + 2))((uint64_t)AVTIsPersistentChangeOfInterest, v12))
        {
          -[AVTCoreDataChangeTracker recordIdentifierForChange:managedObjectContext:](self, "recordIdentifierForChange:managedObjectContext:", v12, v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = -[AVTCoreDataChangeTrackerChange initWithRecordIdentifier:changeType:]([AVTCoreDataChangeTrackerChange alloc], "initWithRecordIdentifier:changeType:", v13, +[AVTCoreDataChangeTrackerChange trackerChangeTypeFromPersistentChangeType:](AVTCoreDataChangeTrackerChange, "trackerChangeTypeFromPersistentChangeType:", objc_msgSend(v12, "changeType")));
            objc_msgSend(v17, "addObject:", v14);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v17, "copy");
  return v15;
}

+ (id)tokenFileURLForLocation:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("currentHistoryToken"));
}

- (id)currentHistoryTokenForLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "tokenFileURLForLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 0, &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v24;
    if (v9)
    {
      v23 = v10;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v23);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v23;

      if (v11)
      {
        v11 = v11;
        v10 = v12;
        v13 = v11;
      }
      else
      {
        -[AVTCoreDataChangeTracker environment](self, "environment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logger");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logErrorReadingCurrentHistoryToken:", v21);

        v10 = v12;
        v13 = 0;
      }
    }
    else
    {
      -[AVTCoreDataChangeTracker environment](self, "environment");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logErrorReadingCurrentHistoryToken:", v18);

      v13 = 0;
    }

  }
  else
  {
    -[AVTCoreDataChangeTracker environment](self, "environment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logCurrentHistoryTokenFileDoesntExist:", v16);

    v13 = 0;
  }

  return v13;
}

- (BOOL)saveToken:(id)a3 location:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  AVTCoreDataChangeTracker *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__5;
    v23 = __Block_byref_object_dispose__5;
    v24 = 0;
    -[AVTCoreDataChangeTracker logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__AVTCoreDataChangeTracker_saveToken_location_error___block_invoke;
    v13[3] = &unk_24DD32B30;
    v14 = v9;
    v17 = &v25;
    v18 = &v19;
    v15 = v8;
    v16 = self;
    objc_msgSend(v10, "savingChangeTrackerToken:", v13);

    v11 = *((_BYTE *)v26 + 24) != 0;
    if (a5 && !*((_BYTE *)v26 + 24))
      *a5 = objc_retainAutorelease((id)v20[5]);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else if (a5)
  {
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 730, 0);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __53__AVTCoreDataChangeTracker_saveToken_location_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  id obj;

  v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((v4 & 1) != 0
    || (v5 = *(_QWORD *)(a1 + 32),
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
        obj = *(id *)(v6 + 40),
        v7 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &obj),
        objc_storeStrong((id *)(v6 + 40), obj),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7) != 0))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(id *)(v9 + 40);
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), v15);
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "tokenFileURLForLocation:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(id *)(v12 + 40);
      v13 = objc_msgSend(v10, "writeToURL:options:error:", v11, 1, &v14);
      objc_storeStrong((id *)(v12 + 40), v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }

  }
}

- (id)enumerateChangesAfterToken:(id)a3 managedObjectContext:(id)a4 changesHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(id, void *);
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setResultType:", 5);
  v42 = 0;
  objc_msgSend(v11, "executeRequest:error:", v13, &v42);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v42;
  if (!v14)
  {
    v30 = v15;
    if (v15)
    {
      if (a6)
      {
LABEL_18:
        v30 = objc_retainAutorelease(v30);
        v17 = 0;
        *a6 = v30;
        goto LABEL_21;
      }
    }
    else
    {
      v44 = *MEMORY[0x24BDD0FD8];
      v45[0] = CFSTR("Got a nil NSPersistentHistoryResult, but no error filled in");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 1, v31);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      if (a6)
        goto LABEL_18;
    }
    v17 = 0;
    goto LABEL_21;
  }
  v33 = v15;
  v34 = v14;
  v35 = v13;
  v36 = v11;
  objc_msgSend(v14, "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v10;
  v17 = v10;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (!v19)
    goto LABEL_15;
  v20 = v19;
  v21 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v39 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v23, "token");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "changes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24)
      {
        v27 = v12[2](v12, v25);

        if (!v27)
          goto LABEL_15;
        objc_msgSend(v23, "token");
        v28 = v17;
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = objc_msgSend(v25, "count");

        if (!v29)
          continue;
        -[AVTCoreDataChangeTracker logger](self, "logger");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logTransactionHasChangesButNoToken");
      }

    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  }
  while (v20);
LABEL_15:

  v11 = v36;
  v10 = v37;
  v14 = v34;
  v13 = v35;
  v30 = v33;
LABEL_21:

  return v17;
}

- (id)recordIdentifierForChange:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "changeType") == 2)
  {
    objc_msgSend(v6, "tombstone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  }
  else
  {
    objc_msgSend(v6, "changedObjectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectWithID:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCoreDataChangeTracker logger](self, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "changeType");
    objc_msgSend(v6, "changedObjectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URIRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logFoundRecordIdentifier:changeType:managedObjectID:", v12, v13, v16);

    -[AVTCoreDataChangeTracker recordTransformer](self, "recordTransformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifierForManagedRecordIdentifier:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_msgSend(v6, "changeType");
    objc_msgSend(v6, "changedObjectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URIRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logCouldntFindRecordIdentifierForChangeType:managedObjectID:", v18, v21);

    v17 = 0;
  }

  return v17;
}

- (AVTCoreDataPersistentStoreConfiguration)configuration
{
  return self->_configuration;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarManagedRecordTransformer)recordTransformer
{
  return self->_recordTransformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTransformer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
