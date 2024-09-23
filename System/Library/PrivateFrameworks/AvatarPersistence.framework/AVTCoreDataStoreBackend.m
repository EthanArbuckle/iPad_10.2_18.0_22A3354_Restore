@implementation AVTCoreDataStoreBackend

- (AVTCoreDataStoreBackend)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  AVTAvatarManagedRecordTransformer *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  AVTEventCoalescer *v11;
  void *v12;
  AVTEventCoalescer *v13;
  AVTCoreDataRemoteChangesObserver *v14;
  AVTCoreDataChangeTracker *v15;
  void *v16;
  void *v17;
  AVTCoreDataStoreBackend *v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(AVTAvatarManagedRecordTransformer);
  objc_msgSend(v6, "serialQueueProvider");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v9)[2](v9, "com.apple.AvatarUI.AVTCoreDataStoreBackend.changesObserverQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [AVTEventCoalescer alloc];
  objc_msgSend(v6, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AVTEventCoalescer initWithDelay:queue:logger:](v11, "initWithDelay:queue:logger:", v10, v12, 1.0);

  v14 = -[AVTCoreDataRemoteChangesObserver initWithConfiguration:workQueue:coalescer:environment:]([AVTCoreDataRemoteChangesObserver alloc], "initWithConfiguration:workQueue:coalescer:environment:", v7, v10, v13, v6);
  v15 = -[AVTCoreDataChangeTracker initWithConfiguration:recordTransformer:environment:]([AVTCoreDataChangeTracker alloc], "initWithConfiguration:recordTransformer:environment:", v7, v8, v6);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "processName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[AVTCoreDataStoreBackend initWithConfiguration:recordTransformer:remoteChangesObserver:localProcessName:recordChangeTracker:environment:](self, "initWithConfiguration:recordTransformer:remoteChangesObserver:localProcessName:recordChangeTracker:environment:", v7, v8, v14, v17, v15, v6);
  return v18;
}

- (AVTCoreDataStoreBackend)initWithConfiguration:(id)a3 recordTransformer:(id)a4 remoteChangesObserver:(id)a5 localProcessName:(id)a6 recordChangeTracker:(id)a7 environment:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  AVTCoreDataStoreBackend *v19;
  AVTCoreDataStoreBackend *v20;
  uint64_t v21;
  AVTUILogger *logger;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)AVTCoreDataStoreBackend;
  v19 = -[AVTCoreDataStoreBackend init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_recordTransformer, a4);
    objc_msgSend(v18, "logger", v24, v25);
    v21 = objc_claimAutoreleasedReturnValue();
    logger = v20->_logger;
    v20->_logger = (AVTUILogger *)v21;

    objc_storeStrong((id *)&v20->_configuration, a3);
    objc_storeStrong((id *)&v20->_remoteChangesObserver, a5);
    objc_storeStrong((id *)&v20->_recordChangeTracker, a7);
    objc_storeStrong((id *)&v20->_localProcessName, a6);
  }

  return v20;
}

- (id)newManagedObjectContext
{
  void *v2;
  void *v3;

  -[AVTCoreDataStoreBackend configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performWorkWithManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = -[AVTCoreDataStoreBackend newManagedObjectContext](self, "newManagedObjectContext");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__AVTCoreDataStoreBackend_performWorkWithManagedObjectContext___block_invoke;
  v8[3] = &unk_24DD31768;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

uint64_t __63__AVTCoreDataStoreBackend_performWorkWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)setupStoreIfNeeded:(id *)a3
{
  void *v5;
  int v6;

  -[AVTCoreDataStoreBackend configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setupIfNeeded:", a3);

  if (v6)
    -[AVTCoreDataStoreBackend startObservingChangesIfNeeded](self, "startObservingChangesIfNeeded");
  return v6;
}

- (id)recordIdentifiersForManagedObjectIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Avatar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultType:", 2);
  v35[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self in %@"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  objc_msgSend(v8, "executeFetchRequest:error:", v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v25 = v9;
    v26 = v8;
    v27 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v12;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v19 = objc_alloc(MEMORY[0x24BDD1880]);
            v20 = objc_retainAutorelease(v18);
            v18 = (void *)objc_msgSend(v19, "initWithUUIDBytes:", objc_msgSend(v20, "bytes"));

          }
          -[AVTCoreDataStoreBackend recordTransformer](self, "recordTransformer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifierForManagedRecordIdentifier:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v22);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    v8 = v26;
    v7 = v27;
    v12 = v24;
    v9 = v25;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)getChangedObjectIDsOfInterest:(id *)a3 deletedIdentifiers:(id *)a4 forTransactions:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataStoreBackend localProcessName](self, "localProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    v28 = *(_QWORD *)v40;
    v29 = v7;
    do
    {
      v11 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
        objc_msgSend(v12, "processID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v7);

        if ((v14 & 1) == 0)
        {
          v32 = v11;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v12, "changes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (!v16)
            goto LABEL_23;
          v17 = v16;
          v18 = *(_QWORD *)v36;
          while (1)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
              if (!(*((BOOL (**)(uint64_t, void *))AVTIsPersistentChangeOfInterest + 2))((uint64_t)AVTIsPersistentChangeOfInterest, v20))
              {
                -[AVTCoreDataStoreBackend logger](self, "logger");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "description");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "logPersistentChangeNotOfInterest:", v23);
LABEL_17:

                goto LABEL_19;
              }
              if (objc_msgSend(v20, "changeType") == 2)
              {
                objc_msgSend(v20, "tombstone");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("identifier"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  -[AVTCoreDataStoreBackend recordTransformer](self, "recordTransformer");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "identifierForManagedRecordIdentifier:", v22);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v24);

                }
                else
                {
                  -[AVTCoreDataStoreBackend logger](self, "logger");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "logMissingTombstonedIdentifier");
                }
                goto LABEL_17;
              }
              objc_msgSend(v20, "changedObjectID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v22);
LABEL_19:

              ++v19;
            }
            while (v17 != v19);
            v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            v17 = v25;
            if (!v25)
            {
LABEL_23:

              v10 = v28;
              v7 = v29;
              v9 = v30;
              v11 = v32;
              break;
            }
          }
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v9);
  }

  *a3 = (id)objc_msgSend(v34, "copy");
  *a4 = (id)objc_msgSend(v33, "copy");

}

- (void)startObservingChangesIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  -[AVTCoreDataStoreBackend remoteChangesObserver](self, "remoteChangesObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isObservingChanges");

  if ((v4 & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[AVTCoreDataStoreBackend remoteChangesObserver](self, "remoteChangesObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __56__AVTCoreDataStoreBackend_startObservingChangesIfNeeded__block_invoke;
    v10 = &unk_24DD31790;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "addChangesHandler:", &v7);

    -[AVTCoreDataStoreBackend remoteChangesObserver](self, "remoteChangesObserver", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startObservingChanges");

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__AVTCoreDataStoreBackend_startObservingChangesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v17 = 0;
  v18 = 0;
  objc_msgSend(WeakRetained, "getChangedObjectIDsOfInterest:deletedIdentifiers:forTransactions:", &v18, &v17, v6);

  v8 = v18;
  v9 = v17;
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v16 = 0;
    objc_msgSend(WeakRetained, "recordIdentifiersForManagedObjectIDs:managedObjectContext:error:", v8, v5, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (!v10)
    {
      objc_msgSend(WeakRetained, "logger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logErrorGettingChangedRecordsContentForIdentifiers:error:", v13, v14);

      v10 = (void *)MEMORY[0x24BDBD1A8];
    }
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "contentDidChangeWithIdentifiers:", v15);

  }
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  AVTCoreDataStoreBackend *v15;
  id v16;
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
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "fetchRequestCriteriaSupported:", objc_msgSend(v6, "criteria")))
  {
    if (-[AVTCoreDataStoreBackend setupStoreIfNeeded:](self, "setupStoreIfNeeded:", a4))
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy_;
      v29 = __Block_byref_object_dispose_;
      v30 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy_;
      v23 = __Block_byref_object_dispose_;
      v24 = 0;
      v11 = MEMORY[0x24BDAC760];
      v12 = 3221225472;
      v13 = __56__AVTCoreDataStoreBackend_avatarsForFetchRequest_error___block_invoke;
      v14 = &unk_24DD317B8;
      v15 = self;
      v7 = v6;
      v16 = v7;
      v17 = &v19;
      v18 = &v25;
      -[AVTCoreDataStoreBackend performWorkWithManagedObjectContext:](self, "performWorkWithManagedObjectContext:", &v11);
      if (v26[5])
      {
        if (objc_msgSend(v7, "criteria", v11, v12, v13, v14, v15) != 1 && objc_msgSend(v7, "criteria") != 2
          || objc_msgSend((id)v26[5], "count"))
        {
          v8 = (id)v26[5];
LABEL_16:

          _Block_object_dispose(&v19, 8);
          _Block_object_dispose(&v25, 8);

          goto LABEL_17;
        }
        if (a4)
        {
          +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 404, 0);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      else if (a4)
      {
        v9 = objc_retainAutorelease((id)v20[5]);
LABEL_14:
        v8 = 0;
        *a4 = v9;
        goto LABEL_16;
      }
      v8 = 0;
      goto LABEL_16;
    }
    v8 = 0;
  }
  else
  {
    v8 = (id)MEMORY[0x24BDBD1A8];
  }
LABEL_17:

  return v8;
}

void __56__AVTCoreDataStoreBackend_avatarsForFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id obj;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "recordTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdFetchRequestForAvatarFetchRequest:recordTransformer:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    v10 = +[AVTPAvatarStore maximumNumberOfFetchableAvatars](AVTPAvatarStore, "maximumNumberOfFetchableAvatars");
    v37 = v7;
    v38 = v3;
    if (objc_msgSend(v9, "count") > v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logTooManyAvatars:limit:", objc_msgSend(v9, "count"), v10);

      objc_msgSend(v9, "subarrayWithRange:", objc_msgSend(v9, "count") - v10, v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 40), "criteria");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = v9;
    v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v41)
    {
      v16 = *(_QWORD *)v44;
      v39 = a1;
      v40 = v13;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v44 != v16)
            objc_enumerationMutation(v15);
          v18 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v17);
          objc_msgSend(*(id *)(a1 + 32), "recordTransformer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v19, "recordWithManagedRecord:error:", v18, &v42);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v42;

          if (v20)
          {
            objc_msgSend(v14, "addObject:", v20);
            if (v13 == 5)
            {

              goto LABEL_18;
            }
          }
          else
          {
            if (objc_msgSend(v21, "code") == 703)
            {
              v22 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v21, "description");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "userInfo");
              v24 = v14;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", 0);
              v26 = v16;
              v27 = v15;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ : unexpected class is %@"), v23, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = v27;
              v16 = v26;

              v14 = v24;
              a1 = v39;
              v13 = v40;

              objc_msgSend(*(id *)(v39 + 32), "logger");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30;
              v32 = v29;
              v33 = 1;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "logger");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "description");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              v32 = v31;
              v33 = 0;
            }
            objc_msgSend(v30, "logUnableToReadRemoteRecord:isCritical:", v32, v33);

          }
          ++v17;
        }
        while (v41 != v17);
        v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v41);
    }
LABEL_18:

    v34 = objc_msgSend(v14, "copy");
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    v7 = v37;
    v3 = v38;
  }

}

- (BOOL)saveAvatar:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[AVTCoreDataStoreBackend saveAvatars:error:](self, "saveAvatars:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)saveAvatars:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  AVTCoreDataStoreBackend *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (-[AVTCoreDataStoreBackend setupStoreIfNeeded:](self, "setupStoreIfNeeded:", a4))
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 1;
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy_;
      v18 = __Block_byref_object_dispose_;
      v19 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke;
      v9[3] = &unk_24DD317B8;
      v10 = v6;
      v11 = self;
      v12 = &v14;
      v13 = &v20;
      -[AVTCoreDataStoreBackend performWorkWithManagedObjectContext:](self, "performWorkWithManagedObjectContext:", v9);
      v7 = *((_BYTE *)v21 + 24) != 0;
      if (a4 && !*((_BYTE *)v21 + 24))
        *a4 = objc_retainAutorelease((id)v15[5]);

      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id obj;
  _QWORD v45[5];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke_2;
  v45[3] = &unk_24DD317E0;
  v4 = *(void **)(a1 + 32);
  v45[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "avt_map:", v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cdFetchRequestWithPredicate:fetchLimit:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "_avtui_dictionaryByIndexingObjectsInArray:by:", v10, &__block_literal_global);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v43 = *(id *)(v13 + 40);
    v14 = objc_msgSend(v12, "nts_avatarCountWithManagedObjectContext:error:", v3, &v43);
    objc_storeStrong((id *)(v13 + 40), v43);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "count");
      v16 = objc_msgSend(v10, "count");
      if (v15 == v16
        || v15 + v14 - v16 <= +[AVTPAvatarStore maximumNumberOfSavableAvatars](AVTPAvatarStore, "maximumNumberOfSavableAvatars"))
      {
        v34 = v10;
        v35 = v8;
        v36 = v5;
        v37 = v3;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v20 = *(id *)(a1 + 32);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v40 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 40), "recordTransformer");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "managedRecordIdentifierForIdentifier:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v29)
              {
                objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Avatar"), v37);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(*(id *)(a1 + 40), "recordTransformer");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "updateManagedRecord:withRecord:", v29, v25);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          }
          while (v22);
        }

        v31 = *(void **)(a1 + 40);
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v38 = *(id *)(v32 + 40);
        v3 = v37;
        v33 = objc_msgSend(v31, "nts_saveManagedObjectContext:error:", v37, &v38);
        objc_storeStrong((id *)(v32 + 40), v38);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v33;
        v8 = v35;
        v5 = v36;
        v10 = v34;
        goto LABEL_18;
      }
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 578, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_18:

    goto LABEL_19;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_19:

}

id __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordTransformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "managedRecordIdentifierForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (BOOL)nts_saveManagedObjectContext:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "save:", a4);
}

- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  if (-[AVTCoreDataStoreBackend setupStoreIfNeeded:](self, "setupStoreIfNeeded:", a4))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__AVTCoreDataStoreBackend_deleteAvatarWithIdentifier_error___block_invoke;
    v9[3] = &unk_24DD317B8;
    v9[4] = self;
    v10 = v6;
    v11 = &v19;
    v12 = &v13;
    -[AVTCoreDataStoreBackend performWorkWithManagedObjectContext:](self, "performWorkWithManagedObjectContext:", v9);
    v7 = *((_BYTE *)v20 + 24) != 0;
    if (a4 && !*((_BYTE *)v20 + 24))
      *a4 = objc_retainAutorelease((id)v14[5]);

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __60__AVTCoreDataStoreBackend_deleteAvatarWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;

  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a2;
  objc_msgSend(v3, "fetchRequestWithEntityName:", CFSTR("Avatar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedRecordIdentifierForIdentifier:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v5);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v4, "executeRequest:error:", v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  objc_msgSend(v11, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "BOOLValue");

}

- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  if (-[AVTCoreDataStoreBackend setupStoreIfNeeded:](self, "setupStoreIfNeeded:", a4))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__AVTCoreDataStoreBackend_duplicateAvatarRecord_error___block_invoke;
    v10[3] = &unk_24DD31848;
    v10[4] = self;
    v12 = &v14;
    v11 = v6;
    v13 = &v20;
    -[AVTCoreDataStoreBackend performWorkWithManagedObjectContext:](self, "performWorkWithManagedObjectContext:", v10);
    v7 = (void *)v21[5];
    if (v7)
    {
      v8 = v7;
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease((id)v15[5]);
    }

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __55__AVTCoreDataStoreBackend_duplicateAvatarRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  AVTAvatarRecord *v28;
  void *v29;
  void *v30;
  AVTAvatarRecord *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  id v37;
  id v38;
  id obj;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "nts_avatarCountWithManagedObjectContext:error:", v3, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 >= +[AVTPAvatarStore maximumNumberOfSavableAvatars](AVTPAvatarStore, "maximumNumberOfSavableAvatars"))
    {
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 578, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      v7 = (void *)objc_opt_class();
      v8 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(*(id *)(a1 + 40), "orderDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "orderDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingTimeInterval:", 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K > %@ AND %K < %@"), CFSTR("orderDate"), v9, CFSTR("orderDate"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cdFetchRequestWithPredicate:fetchLimit:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setResultType:", 2);
      v40[0] = CFSTR("orderDate");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPropertiesToFetch:", v14);

      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v38 = *(id *)(v15 + 40);
      objc_msgSend(v3, "executeFetchRequest:error:", v13, &v38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v15 + 40), v38);
      if (v16)
      {
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("orderDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "orderDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v19);
          v21 = v20;

          v22 = v21 * 0.5;
        }
        else
        {
          v22 = 0.5;
        }
        objc_msgSend(*(id *)(a1 + 40), "orderDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dateByAddingTimeInterval:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = [AVTAvatarRecord alloc];
        objc_msgSend(*(id *)(a1 + 40), "avatarData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "copy");
        v31 = -[AVTAvatarRecord initWithAvatarData:orderDate:](v28, "initWithAvatarData:orderDate:", v30, v26);

        objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Avatar"), v3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "recordTransformer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "updateManagedRecord:withRecord:", v32, v31);

        v34 = *(void **)(a1 + 32);
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v37 = *(id *)(v35 + 40);
        v36 = objc_msgSend(v34, "nts_saveManagedObjectContext:error:", v3, &v37);
        objc_storeStrong((id *)(v35 + 40), v37);
        if (v36)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v31);

      }
      else
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = 0;
      }

    }
  }

}

- (unint64_t)nts_avatarCountWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;

  v5 = (void *)MEMORY[0x24BDBB678];
  v6 = a3;
  objc_msgSend(v5, "fetchRequestWithEntityName:", CFSTR("Avatar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "countForFetchRequest:error:", v7, a4);

  return v8;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  unint64_t v5;
  BOOL v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (!-[AVTCoreDataStoreBackend setupStoreIfNeeded:](self, "setupStoreIfNeeded:"))
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__AVTCoreDataStoreBackend_canCreateAvatarWithError___block_invoke;
  v8[3] = &unk_24DD31870;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  -[AVTCoreDataStoreBackend performWorkWithManagedObjectContext:](self, "performWorkWithManagedObjectContext:", v8);
  v5 = v16[3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v10[5]);
  }
  else
  {
    v6 = v5 < +[AVTPAvatarStore maximumNumberOfSavableAvatars](AVTPAvatarStore, "maximumNumberOfSavableAvatars");
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __52__AVTCoreDataStoreBackend_canCreateAvatarWithError___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "nts_avatarCountWithManagedObjectContext:error:", a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
    && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)contentDidChangeWithIdentifiers:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTCoreDataStoreBackend backendDelegate](self, "backendDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTCoreDataStoreBackend backendDelegate](self, "backendDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backend:didChangeRecordsWithIdentifiers:", self, v7);

  }
}

+ (id)cdFetchRequestWithPredicate:(id)a3 fetchLimit:(int64_t)a4
{
  return (id)objc_msgSend(a1, "cdFetchRequestWithPredicate:fetchLimit:ascending:", a3, a4, 1);
}

+ (id)cdFetchRequestWithPredicate:(id)a3 fetchLimit:(int64_t)a4 ascending:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v5 = a5;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBB678];
  v8 = a3;
  objc_msgSend(v7, "fetchRequestWithEntityName:", CFSTR("Avatar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  if (a4)
    objc_msgSend(v9, "setFetchLimit:", a4);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("orderDate"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v11);

  return v9;
}

+ (id)cdFetchRequestForAvatarFetchRequest:(id)a3 recordTransformer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "criteria");
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  switch(v8)
  {
    case 1:
      objc_msgSend(v6, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "managedRecordIdentifierForIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    case 2:
      v16 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v6, "identifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v6, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v41;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(v7, "managedRecordIdentifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v23));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v18, "addObject:", v24);

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v21);
      }

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("identifier"), v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
      v11 = 0;
      goto LABEL_15;
    case 4:
      goto LABEL_26;
    case 5:
      break;
    case 6:
      v25 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v6, "identifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v6, "excludingIdentifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v37;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v37 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(v7, "managedRecordIdentifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v32));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
              objc_msgSend(v27, "addObject:", v33);

            ++v32;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v30);
      }

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K in %@)"), CFSTR("identifier"), v27);
      v9 = objc_claimAutoreleasedReturnValue();

LABEL_26:
      v11 = objc_msgSend(v6, "fetchLimit");
      v10 = 1;
      v12 = (void *)v9;
      break;
    default:
      v11 = 0;
      v12 = 0;
LABEL_15:
      v10 = 1;
      break;
  }
  objc_msgSend(a1, "cdFetchRequestWithPredicate:fetchLimit:ascending:", v12, v11, v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (BOOL)fetchRequestCriteriaSupported:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) != 3;
}

- (AVTStoreBackendDelegate)backendDelegate
{
  return (AVTStoreBackendDelegate *)objc_loadWeakRetained((id *)&self->backendDelegate);
}

- (void)setBackendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->backendDelegate, a3);
}

- (AVTAvatarRecordChangeTracker)recordChangeTracker
{
  return self->_recordChangeTracker;
}

- (AVTCoreDataPersistentStoreConfiguration)configuration
{
  return self->_configuration;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarManagedRecordTransformer)recordTransformer
{
  return self->_recordTransformer;
}

- (AVTCoreDataRemoteChangesObserver)remoteChangesObserver
{
  return self->_remoteChangesObserver;
}

- (NSString)localProcessName
{
  return self->_localProcessName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProcessName, 0);
  objc_storeStrong((id *)&self->_remoteChangesObserver, 0);
  objc_storeStrong((id *)&self->_recordTransformer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_recordChangeTracker, 0);
  objc_destroyWeak((id *)&self->backendDelegate);
}

@end
