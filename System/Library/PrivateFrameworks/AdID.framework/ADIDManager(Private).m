@implementation ADIDManager(Private)

- (void)setDSID:()Private completionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  v14 = (id)objc_msgSend(v6, "copy");
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__ADIDManager_Private__setDSID_completionHandler___block_invoke;
  v10[3] = &unk_24D7108B0;
  v10[4] = a1;
  v12 = v13;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", v10);

  _Block_object_dispose(v13, 8);
}

- (void)notifyActiveRecordChanged
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Active record changed. Posting %@"), CFSTR("kADIDManager_ChangedNotification"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("kADIDManager_ChangedNotification"), *MEMORY[0x24BE02100]);

}

- (void)saveDataForPCD
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Saving latest accounts data for promotedcontentd."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(a1, "activeDSIDRecord");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idAccountsDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ADSaveToPromotedContentKeychain();
  objc_msgSend(a1, "notifyActiveRecordChanged");

}

+ (void)initialize
{
  id v0;
  void *v1;

  _reconcileRetryCount = 0;
  v0 = objc_alloc_init(MEMORY[0x24BE021C0]);
  v1 = (void *)_reconcileOperations;
  _reconcileOperations = (uint64_t)v0;

}

- (id)init
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v16.receiver = a1;
  v16.super_class = (Class)&off_254EECAE8;
  v1 = objc_msgSendSuper2(&v16, sel_init);
  if (v1)
  {
    v2 = (void *)_reconcileWatchdogToken;
    _reconcileWatchdogToken = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_postReconcileOperations;
    _postReconcileOperations = v3;

    objc_msgSend(MEMORY[0x24BE02180], "registerTaskDelegate:forRequestID:", v1, CFSTR("com.apple.ap.adprivacyd.reconcile"));
    objc_msgSend(MEMORY[0x24BE02180], "registerTaskDelegate:forRequestID:", v1, CFSTR("com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"));
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unitTesting");

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Check On Task has been disabled. If you see this outside of unit tests, Please file a radar..."));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "checkOnTask:", CFSTR("com.apple.ap.adprivacyd.reconcile"));

      objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "checkOnTask:", CFSTR("com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"));
    }

    if (MGGetBoolAnswer())
    {
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BE02100];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __28__ADIDManager_Private__init__block_invoke;
      v14[3] = &unk_24D710298;
      v15 = v1;
      v12 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", CFSTR("ClearMonthlyResetCount"), v10, v11, v14);

    }
  }
  return v1;
}

- (void)prepareForPushNotification
{
  id v1;

  objc_msgSend(a1, "activeDSIDRecord");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSegmentDataTimestamp:", 1);

}

- (void)deleteRecords:()Private
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__ADIDManager_Private__deleteRecords___block_invoke;
    v6[3] = &unk_24D7102C0;
    v6[4] = a1;
    v7 = v4;
    objc_msgSend(v5, "addOperationWithBlock:", v6);

  }
}

- (void)incrementMonthlyResetCount
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v19 = v5;
  objc_msgSend(a1, "monthlyResetArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __50__ADIDManager_Private__incrementMonthlyResetCount__block_invoke;
  v15 = &unk_24D7108D8;
  v17 = v18;
  v7 = v2;
  v16 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v12);

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMonthlyResetArray:", v11);

  _Block_object_dispose(v18, 8);
}

- (id)save
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "activeDSIDRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "activeDSIDRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      && (objc_msgSend(a1, "activeDSIDRecord"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "dirty"),
          v4,
          v3,
          !v5))
    {
      return 0;
    }
    else
    {
      v6 = a1;
      objc_sync_enter(v6);
      objc_msgSend(v6, "activeDSIDRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.adprivacyd [%@ save] starting"), objc_opt_class());
      v8 = objc_claimAutoreleasedReturnValue();
      takeXPCTransaction();
      v44 = (void *)v8;
      objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getDSIDDicFromStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if (!v11)
      {
        v12 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("iAdIDRecordsVersion"), 0);

      }
      objc_msgSend(v11, "valueForKey:", CFSTR("kADiAdIDManager_RecordsKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "mutableCopy");

      if (!v15)
        v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v7, "DSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valueForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "DSID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Overwriting existing DSID record for %@."), v19);
      else
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Writing new record for DSID %@."), v19);
      v20 = objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(v7, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "DSID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v24);

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("kADiAdIDManager_RecordsKey"));
      objc_msgSend(v6, "monthlyResetArray");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "copy");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("kADiADIDMonthResetKey"));

      objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v27, "setDSIDDicToStorage:", v11);

      objc_msgSend(v6, "saveDataForPCD");
      v28 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "monthlyResetArray");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithUnsignedLong:", objc_msgSend(v29, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      ADSaveToPromotedContentKeychain();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("monthlyIDResetCount is %d."), objc_msgSend(v30, "intValue"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      releaseXPCTransaction();
      if ((v20 & 1) != 0)
      {
        objc_msgSend(v7, "setDirty:", 0);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v7, "ADIDRecords");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "allValues");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v46 != v35)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "setDirty:", 0);
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v34);
        }

        v37 = v44;
        v38 = 0;
      }
      else
      {
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 0, CFSTR("Error writing DSID record to keychain."));
        if (v38)
        {
          v39 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v7, "DSID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v38, "code");
          objc_msgSend(v38, "localizedDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("Failed to save DSID record for %@ to keychain with error %ld: %@"), v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog();

        }
        v37 = v44;
      }

      objc_sync_exit(v6);
      return v38;
    }
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 0, CFSTR("Aborting save, no DSID record."));
    objc_msgSend(v21, "AD_Log:", CFSTR("iAdIDLogging"));
    return v21;
  }
}

- (id)saveAndNotifyIfNecessary
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "activeDSIDRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSendNotification");

  objc_msgSend(a1, "save");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && v3)
  {
    objc_msgSend(a1, "notifyActiveRecordChanged");
    objc_msgSend(a1, "activeDSIDRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNotificationRequired:", 0);

  }
  return v4;
}

- (void)performOperationWhenNotReconciling:()Private
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  if (_reconcileInProgress == 1)
  {
    v5 = (void *)_postReconcileOperations;
    v6 = (void *)MEMORY[0x219A082AC](v7);
    objc_msgSend(v5, "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperationWithBlock:", v7);
  }

  objc_sync_exit(v4);
}

- (void)performOperationAfterReconcile:()Private
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)_postReconcileOperations;
  v6 = (void *)MEMORY[0x219A082AC](v7);
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)finishedReconciling:()Private withError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  void (**v43)(void);
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v44 = a4;
  v6 = a1;
  objc_sync_enter(v6);
  _reconcileInProgress = 0;
  objc_sync_exit(v6);

  objc_msgSend(v6, "activeDSIDRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "saveAndNotifyIfNecessary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Error %ld saving the record to the keychain. We will retry..."), objc_opt_class(), objc_msgSend(v45, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_5:
    ++_reconcileRetryCount;
    v16 = (double)RequestRetryDelay();
    goto LABEL_6;
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_opt_class();
  v12 = v11;
  if (v44)
  {
    v13 = objc_msgSend(v44, "code");
    objc_msgSend(v44, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]: Error %ld reconciling DSID record: %@"), v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v6, "logIDs:", CFSTR("IDs after failed reconcile:"));
    goto LABEL_5;
  }
  objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]: Successfully reconciled DSID record for DSID %@"), v11, v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(v6, "logIDs:", CFSTR("Final reconciled IDs:"));
  _reconcileRetryCount = 0;
  objc_msgSend(v6, "activeDSIDRecord");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "segmentDataTimestamp");
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "segmentRetrievalInterval");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v39 + v37 - objc_msgSend(v40, "AD_toServerTime");

  if (v41 < 0)
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v42, "segmentRetrievalInterval");

  }
  v16 = (double)v41;
LABEL_6:
  objc_msgSend(v6, "scheduleReconciliation:", v16);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "iTunesAccountDSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v8);

    if ((v19 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      v21 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "iTunesAccountDSID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("[%@]: DSID changed from %@ to %@ during reconcile process. Posting handleAccountChange to work queue."), v21, v8, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(MEMORY[0x24BE02228], "workQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addOperationWithBlock:", &__block_literal_global_2);

    }
  }
  if (v43)
    v43[2]();
  objc_msgSend((id)_reconcileOperations, "reset");
  releaseXPCTransaction();
  objc_msgSend(MEMORY[0x24BE02258], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeWatchdogWithToken:", _reconcileWatchdogToken);

  v27 = v6;
  objc_sync_enter(v27);
  if (objc_msgSend((id)_postReconcileOperations, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Running post-reconcile operations"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = (id)_postReconcileOperations;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v29);
        v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BE02228], "workQueue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addOperationWithBlock:", v33);

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v30);
  }

  if (objc_msgSend((id)_postReconcileOperations, "count"))
    objc_msgSend((id)_postReconcileOperations, "removeAllObjects");
  objc_sync_exit(v27);

}

- (void)updateAccountData:()Private
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  objc_msgSend(a1, "activeDSIDRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__ADIDManager_Private__updateAccountData___block_invoke;
  v7[3] = &unk_24D710970;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = a1;
  v8 = v6;
  objc_msgSend(v5, "retrieveSegmentDataFromiTunes:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)reconcile:()Private
{
  void (**v4)(id, void *);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  _QWORD v17[4];
  __CFString *v18;
  void (**v19)(id, void *);
  _QWORD *v20;
  id v21;
  id location;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  if (_reconcileInProgress == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: DSID record reconcile already in progress."), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 1, v6);
    objc_msgSend(v7, "AD_Log:", CFSTR("iAdIDLogging"));
    if (v4)
      v4[2](v4, v7);

    objc_sync_exit(v5);
  }
  else
  {
    _reconcileInProgress = 1;
    objc_sync_exit(v5);

    objc_msgSend(MEMORY[0x24BE02258], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createNewWatchdog:withTimer:", CFSTR("Reconcile in progress"), 1800);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_reconcileWatchdogToken;
    _reconcileWatchdogToken = v9;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.adprivacyd [%@ reconcile]"), objc_opt_class());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_reconcileReason;
    _reconcileReason = v11;

    takeXPCTransaction();
    +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "refreshConfiguration:", 0);

    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iTunesAccountDSID");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v15 || !-[__CFString length](v15, "length"))
    {

      v15 = CFSTR("0");
    }
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__0;
    v23[4] = __Block_byref_object_dispose__0;
    v24 = 0;
    objc_initWeak(&location, v5);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __34__ADIDManager_Private__reconcile___block_invoke;
    v17[3] = &unk_24D7109C0;
    objc_copyWeak(&v21, &location);
    v19 = v4;
    v16 = v15;
    v18 = v16;
    v20 = v23;
    objc_msgSend(v5, "setDSID:completionHandler:", v16, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(v23, 8);

  }
}

- (void)handleAccountChange:()Private
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ADIDManager_Private__handleAccountChange___block_invoke;
  v7[3] = &unk_24D7102C0;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)cancelPendingReconcile
{
  id v0;

  objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelBackgroundTask:", CFSTR("com.apple.ap.adprivacyd.reconcile"));

}

- (BOOL)scheduleReconciliation:()Private
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = _reconcileRetryCount;
  if (_reconcileRetryCount >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Not rescheduling reconcile, MAX_RETRY_COUNT of %d exceeded."), objc_opt_class(), 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    _reconcileRetryCount = 0;
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scheduleReconciliation:", (double)(int)objc_msgSend(v5, "segmentRetrievalInterval"));
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE02178]), "initWithID:", CFSTR("com.apple.ap.adprivacyd.reconcile"));
    objc_msgSend(v5, "setPropertyAsInteger:value:", CFSTR("kBackgroundTaskProperty_RetryCount"), _reconcileRetryCount);
    objc_msgSend(v5, "setDelay:", (uint64_t)a2);
    objc_msgSend(v5, "setRequireClassCData:", 1);
    objc_msgSend(v5, "setRequireBuddyComplete:", 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (int)((double)(int)objc_msgSend(v6, "AD_toServerTime") + a2);
    objc_msgSend(a1, "activeDSIDRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNextReconcileTimestamp:", v7);

    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_opt_class();
    v11 = objc_msgSend(v5, "delay");
    v12 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(a1, "activeDSIDRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "AD_dateFromServerTime:", objc_msgSend(v13, "nextReconcileTimestamp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "AD_localDateTimeAsString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[%@]: Rescheduling DSID record reconcile to run again in %lld seconds (%@)."), v10, v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addBackgroundTask:", v5);

  }
  return v3 < 4;
}

- (uint64_t)scheduleDailyUpdate
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE02178]), "initWithID:", CFSTR("com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"));
  objc_msgSend(v0, "setGracePeriod:", 300);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAC6A8], 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPriority:", v1);

  objc_msgSend(v0, "setAllowBattery:", 1);
  objc_msgSend(v0, "setDelay:", 86400);
  objc_msgSend(v0, "setIsRepeating:", 0);
  objc_msgSend(v0, "setRequireSleep:", 1);
  objc_msgSend(v0, "setRequireClassCData:", 1);
  objc_msgSend(v0, "setRequiresNetworkConnectivity:", 0);
  objc_msgSend(v0, "setRequireBuddyComplete:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Rescheduling deviceNewsPlusSubscriberID rotation to run again in %lld seconds."), objc_opt_class(), objc_msgSend(v0, "delay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addBackgroundTask:", v0);

  return 1;
}

- (uint64_t)runTask:()Private
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = objc_opt_class();
  objc_msgSend(v4, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]: Received request to run background task %@."), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(v4, "requestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.reconcile"));

  if ((_DWORD)v6)
  {
    if ((objc_msgSend(v4, "continueTask") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR: Unable to mark the task as being continue. Please file a radar..."), objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __32__ADIDManager_Private__runTask___block_invoke;
    v19[3] = &unk_24D710658;
    v19[4] = a1;
    v20 = v4;
    objc_msgSend(v11, "addOperationWithBlock:", v19);

    v12 = 1;
  }
  else
  {
    objc_msgSend(v4, "requestIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"));

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Rotate deviceNewsPlusSubscriberID"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(a1, "activeDSIDRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "resetDeviceNewsPlusSubscriberIDIfNeeded");

      if ((_DWORD)v12)
        v17 = (id)objc_msgSend(a1, "save");
      objc_msgSend(a1, "scheduleDailyUpdate");
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)checkOnTask:()Private activity:
{
  _xpc_activity_s *v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.reconcile")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID")))
  {
    v7 = xpc_activity_copy_criteria(v6);
    if (!v7)
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.reconcile")))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Checking in on task %@ - PLIST Launch"), objc_opt_class(), v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(a1, "scheduleReconciliation:", 0.0);
        goto LABEL_5;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID")))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Checking in on task %@ - PLIST Launch"), objc_opt_class(), v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(a1, "scheduleDailyUpdate");
        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Reconcile task %@ already scheduled: %@"), objc_opt_class(), v11, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_5:
  }

}

- (uint64_t)reconcileInProgress
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_sync_enter(v1);
  v2 = _reconcileInProgress;
  objc_sync_exit(v1);

  return v2;
}

- (id)reconcileOperations
{
  return (id)_reconcileOperations;
}

- (void)setReconcileOperations:()Private
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_reconcileOperations;
  _reconcileOperations = v3;

}

@end
