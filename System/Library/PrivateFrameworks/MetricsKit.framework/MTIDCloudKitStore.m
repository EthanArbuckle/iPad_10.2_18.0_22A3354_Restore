@implementation MTIDCloudKitStore

- (MTIDCloudKitStore)initWithContainerIdentifer:(id)a3 enableSync:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  MTIDCloudKitStore *v7;
  MTIDCloudKitStore *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_queue_t v13;
  MTIDCloudKitLocalDB *v14;
  void *v15;
  MTIDCloudKitLocalDB *v16;
  void *v17;
  void *v18;
  MTIDCloudKitPromiseManager *v19;
  void *v20;
  MTIDCloudKitPromiseManager *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MTIDCloudKitStore;
  v7 = -[MTIDCloudKitStore init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MTIDCloudKitStore setContainerIdentifier:](v7, "setContainerIdentifier:", v6);
    if (v4)
    {
      +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForEntitlement:", CFSTR("com.apple.developer.icloud-container-identifiers"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MTIDCloudKitStore setCanSyncBetweenDevices:](v8, "setCanSyncBetweenDevices:", objc_msgSend(v10, "containsObject:", v6));
      if (!-[MTIDCloudKitStore canSyncBetweenDevices](v8, "canSyncBetweenDevices"))
      {
        MTMetricsKitOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v6;
          v26 = 2112;
          v27 = CFSTR("com.apple.developer.icloud-container-identifiers");
          _os_log_impl(&dword_20D758000, v11, OS_LOG_TYPE_ERROR, "MetricsKit: The application is missing container %@ in %@ entitlement.", buf, 0x16u);
        }

      }
    }
    else
    {
      -[MTIDCloudKitStore setCanSyncBetweenDevices:](v8, "setCanSyncBetweenDevices:", 0);
    }
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".accessqueue"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    -[MTIDCloudKitStore setAccessQueue:](v8, "setAccessQueue:", v13);

    v14 = [MTIDCloudKitLocalDB alloc];
    +[MTIDCloudKitStore recordZoneID](MTIDCloudKitStore, "recordZoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MTIDCloudKitLocalDB initWithContainerIdentifier:recordType:recordZoneID:](v14, "initWithContainerIdentifier:recordType:recordZoneID:", v6, CFSTR("MT_IDSecret"), v15);

    -[MTIDCloudKitLocalDB setDelegate:](v16, "setDelegate:", v8);
    -[MTIDCloudKitStore setLocalDB:](v8, "setLocalDB:", v16);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCloudKitStore setGeneratedDates:](v8, "setGeneratedDates:", v17);

    if (-[MTIDCloudKitStore canSyncBetweenDevices](v8, "canSyncBetweenDevices"))
    {
      -[MTIDCloudKitStore syncEngine](v8, "syncEngine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "start");

    }
    v19 = [MTIDCloudKitPromiseManager alloc];
    -[MTIDCloudKitStore accessQueue](v8, "accessQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MTIDCloudKitPromiseManager initWithCallbackQueue:](v19, "initWithCallbackQueue:", v20);
    -[MTIDCloudKitStore setPromiseManager:](v8, "setPromiseManager:", v21);

  }
  return v8;
}

- (MTIDSyncEngine)syncEngine
{
  MTIDSyncEngine *v3;
  void *v4;
  void *v5;
  void *v6;
  MTIDSyncEngine *v7;
  MTIDSyncEngine *syncEngine;

  if (!self->_syncEngine && -[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    v3 = [MTIDSyncEngine alloc];
    -[MTIDCloudKitStore containerIdentifier](self, "containerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTIDCloudKitStore recordZoneID](MTIDCloudKitStore, "recordZoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCloudKitStore accessQueue](self, "accessQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MTIDSyncEngine initWithContainerIdentifier:zoneID:queue:delegate:](v3, "initWithContainerIdentifier:zoneID:queue:delegate:", v4, v5, v6, self);
    syncEngine = self->_syncEngine;
    self->_syncEngine = v7;

  }
  return self->_syncEngine;
}

- (void)generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "lifespan") && -[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    objc_initWeak(&location, self);
    -[MTIDCloudKitStore accessQueue](self, "accessQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__MTIDCloudKitStore_generateFutureRecordsForScheme_referenceRecord___block_invoke;
    v9[3] = &unk_24C7A0AD0;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __68__MTIDCloudKitStore_generateFutureRecordsForScheme_referenceRecord___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_generateFutureRecordsForScheme:referenceRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  MTIDCloudKitStore *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  unint64_t v42;

  v6 = a3;
  v7 = a4;
  v8 = 0x24C79F000uLL;
  +[MTIDCloudKitStore referenceDateOfRecord:](MTIDCloudKitStore, "referenceDateOfRecord:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v37 = 0;
    v17 = 0;
    v20 = objc_msgSend(v6, "storagePoolSize") - 1;
LABEL_10:
    v25 = 0;
    do
    {
      v26 = v25;
      v27 = v8;
      v28 = *(void **)(v8 + 872);
      objc_msgSend(v7, "recordID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v28;
      v8 = v27;
      objc_msgSend(v30, "spanRecordIDForScheme:referenceRecordID:serialNumber:", v6, v29, v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __69__MTIDCloudKitStore__generateFutureRecordsForScheme_referenceRecord___block_invoke;
      v39[3] = &unk_24C7A0AF8;
      v40 = v7;
      v42 = v17;
      v41 = v6;
      v38 = v26;
      v32 = -[MTIDCloudKitStore recordWithID:qualityOfService:updateRecordMaybe:error:](self, "recordWithID:qualityOfService:updateRecordMaybe:error:", v31, -1, v39, &v38);
      v25 = v38;

      ++v17;
    }
    while (v17 <= v20);

    v9 = v37;
    goto LABEL_14;
  }
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "maxFutureTimeInterval");
  objc_msgSend(v11, "dateByAddingTimeInterval:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitStore generatedDates](self, "generatedDates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idNamespace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v12, "compare:", v15) == -1)
  {

    goto LABEL_14;
  }
  v36 = v15;
  +[MTIDSpan spanForScheme:date:referenceDate:](MTIDSpan, "spanForScheme:date:referenceDate:", v6, v11, v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTIDSpan spanForScheme:date:referenceDate:](MTIDSpan, "spanForScheme:date:referenceDate:", v6, v12, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v35, "serialNumber");
  v18 = objc_msgSend(v16, "serialNumber");
  v19 = objc_msgSend(v6, "storagePoolSize");
  if (v18 >= v17 + v19 - 2)
    v20 = v17 + v19 - 2;
  else
    v20 = v18;
  objc_msgSend(v16, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitStore generatedDates](self, "generatedDates");
  v33 = self;
  v34 = v11;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idNamespace");
  v23 = v12;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v24);

  if (v17 <= v20)
  {
    self = v33;
    v37 = v9;
    v8 = 0x24C79F000;
    goto LABEL_10;
  }
LABEL_14:

}

BOOL __69__MTIDCloudKitStore__generateFutureRecordsForScheme_referenceRecord___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a1[4];
  v4 = a1[6];
  v5 = a2;
  +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:serialNumber:](MTIDCloudKitStore, "spanRecordKeyWithReferenceRecord:serialNumber:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MTIDCloudKitStore updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:](MTIDCloudKitStore, "updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:", v5, 1, a1[5], v6, 0, 0);

  return v7;
}

- (id)recordWithID:(id)a3 qualityOfService:(int64_t)a4 updateRecordMaybe:(id)a5 error:(id *)a6
{
  id v10;
  unsigned int (**v11)(id, void *);
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (unsigned int (**)(id, void *))a5;
  -[MTIDCloudKitStore accessQueue](self, "accessQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[MTIDCloudKitStore localDB](self, "localDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v13, "recordWithID:error:", v10, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (!v15)
  {
    if (!v14)
    {
      v18 = objc_alloc(MEMORY[0x24BDB91D8]);
      objc_msgSend(v13, "recordType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v18, "initWithRecordType:recordID:", v19, v10);

    }
    if (v11[2](v11, v14))
    {
      v24 = 0;
      v20 = objc_msgSend(v13, "writeRecord:error:", v14, &v24);
      v16 = v24;
      if ((v20 & 1) == 0)
      {
        if (a6)
          goto LABEL_3;
LABEL_13:
        v17 = 0;
        goto LABEL_14;
      }
      if (-[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
      {
        -[MTIDCloudKitStore syncEngine](self, "syncEngine");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "saveRecordsWithIDs:qualityOfService:", v22, a4);

      }
    }
    else
    {
      v16 = 0;
    }
    v17 = v14;
    v14 = v17;
    goto LABEL_14;
  }
  v16 = v15;
  if (!a6)
    goto LABEL_13;
LABEL_3:
  v16 = objc_retainAutorelease(v16);
  v17 = 0;
  *a6 = v16;
LABEL_14:

  return v17;
}

- (id)promiseForRecordWithID:(id)a3 timeout:(double)a4 qualityOfService:(int64_t)a5 existingOnly:(BOOL)a6 updateRecordMaybe:(id)a7
{
  id v12;
  id v13;
  MTPromise *v14;
  NSObject *v15;
  MTPromise *v16;
  id v17;
  id v18;
  MTPromise *v19;
  MTPromise *v20;
  _QWORD block[5];
  id v23;
  MTPromise *v24;
  id v25;
  int64_t v26;
  double v27;
  BOOL v28;

  v12 = a3;
  v13 = a7;
  v14 = objc_alloc_init(MTPromise);
  -[MTIDCloudKitStore accessQueue](self, "accessQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke;
  block[3] = &unk_24C7A0B48;
  block[4] = self;
  v23 = v12;
  v25 = v13;
  v26 = a5;
  v16 = v14;
  v24 = v16;
  v27 = a4;
  v28 = a6;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, block);

  v19 = v24;
  v20 = v16;

  return v20;
}

void __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v16 = 0;
  objc_msgSend(v2, "recordWithID:qualityOfService:updateRecordMaybe:error:", v3, v4, v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v7);
  }
  else if ((objc_msgSend(v6, "mt_isSynchronized") & 1) != 0
         || !objc_msgSend(*(id *)(a1 + 32), "canSyncBetweenDevices")
         || *(double *)(a1 + 72) <= 0.0
         || *(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v6);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("secretKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "promiseManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "waitForRecordToSync:timeout:", v6, *(double *)(a1 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke_2;
    v12[3] = &unk_24C7A0B20;
    v13 = v8;
    v14 = *(id *)(a1 + 48);
    v15 = v6;
    v11 = v8;
    objc_msgSend(v10, "addFinishBlock:", v12);

  }
}

void __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)a1[4];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("secretKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  v8 = (void *)a1[5];
  if ((_DWORD)v6)
    objc_msgSend(v8, "finishWithResult:error:", v9, v5);
  else
    objc_msgSend(v8, "finishWithResult:", a1[6]);

}

+ (id)recordZoneID
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BDB91F8]);
  return (id)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("MT_IDZone"), *MEMORY[0x24BDB8E88]);
}

+ (id)referenceRecordIDForScheme:(id)a3 dsId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "idNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "idType");

  if (v5 && v8 == 2)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("_%llx"), objc_msgSend(v5, "unsignedLongLongValue"));
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v7, "mt_SHA1Base62String");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("MT_ID"), "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDB91E8]);
  +[MTIDCloudKitStore recordZoneID](MTIDCloudKitStore, "recordZoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordName:zoneID:", v11, v13);

  return v14;
}

+ (id)referenceDateOfRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("secretKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)keyOfReferenceDate:(id)a3
{
  void *v3;
  double v4;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lld"), (uint64_t)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)spanRecordIDForScheme:(id)a3 referenceRecordID:(id)a4 serialNumber:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a3;
  objc_msgSend(a4, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "storagePoolSize");

  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%02lx"), v10, a5 % v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x24BDB91E8]);
  objc_msgSend(a1, "recordZoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithRecordName:zoneID:", v12, v14);

  return v15;
}

+ (id)spanRecordKeyWithReferenceRecord:(id)a3 serialNumber:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llx"), a4);
}

+ (BOOL)updateRecord:(id)a3 isSpanRecord:(BOOL)a4 scheme:(id)a5 expectedKey:(id)a6 expiration:(id)a7 reset:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v8 = a8;
  v12 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v32 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("namespace"));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("secretKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "idNamespace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v16;
  LODWORD(v16) = objc_msgSend((id)v16, "isEqualToString:", v18);

  v19 = v16 ^ 1;
  if (!v12 || (v19 & 1) != 0)
  {
    if ((v19 | v8) != 1)
    {
LABEL_5:
      v20 = 0;
      if (v17)
        v21 = 0;
      else
        v21 = !v12;
      if (v15)
      {
        v22 = v31;
        v23 = v32;
        if (v21)
        {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("secretKey"));
          MTMetricsKitOSLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v13;
            _os_log_impl(&dword_20D758000, v24, OS_LOG_TYPE_DEBUG, "MetricsKit: Updating reference record %@ with current date", buf, 0xCu);
          }

          v20 = 1;
        }
      }
      else
      {
        v22 = v31;
        v23 = v32;
      }
      goto LABEL_17;
    }
  }
  else if (objc_msgSend(v17, "isEqualToString:", v15) && !v8)
  {
    goto LABEL_5;
  }
  MTMetricsKitOSLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "idNamespace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v13;
    v35 = 2112;
    v36 = v26;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_20D758000, v25, OS_LOG_TYPE_DEBUG, "MetricsKit: Updating record %@ for namespace %@ key %@", buf, 0x20u);

  }
  objc_msgSend(v14, "idNamespace");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("namespace"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("secretKey"));
  v23 = v32;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("expiration"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mt_setSecretValue:", v29);

  objc_msgSend(v13, "mt_setSynchronized:", 0);
  v20 = 1;
  v22 = v31;
LABEL_17:

  return v20;
}

- (id)referenceRecordForScheme:(id)a3 dsId:(id)a4 date:(id)a5 reset:(BOOL)a6 timeout:(double)a7 existingOnly:(BOOL)a8 qualityOfService:(int64_t)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;

  v10 = a8;
  v16 = a3;
  v17 = a5;
  +[MTIDCloudKitStore referenceRecordIDForScheme:dsId:](MTIDCloudKitStore, "referenceRecordIDForScheme:dsId:", v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __100__MTIDCloudKitStore_referenceRecordForScheme_dsId_date_reset_timeout_existingOnly_qualityOfService___block_invoke;
  v23[3] = &unk_24C7A0B70;
  v26 = v10;
  v24 = v17;
  v25 = v16;
  v27 = a6;
  v19 = v16;
  v20 = v17;
  -[MTIDCloudKitStore promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:](self, "promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:", v18, a9, v10, v23, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

BOOL __100__MTIDCloudKitStore_referenceRecordForScheme_dsId_date_reset_timeout_existingOnly_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  if (*(_BYTE *)(a1 + 48))
    return 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  +[MTIDCloudKitStore keyOfReferenceDate:](MTIDCloudKitStore, "keyOfReferenceDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MTIDCloudKitStore updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:](MTIDCloudKitStore, "updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:", v5, 0, *(_QWORD *)(a1 + 40), v6, 0, *(unsigned __int8 *)(a1 + 49));

  return v7;
}

- (id)spanRecordForScheme:(id)a3 span:(id)a4 timeout:(double)a5 existingOnly:(BOOL)a6 qualityOfService:(int64_t)a7 referenceRecord:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  objc_msgSend(v16, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTIDCloudKitStore spanRecordIDForScheme:referenceRecordID:serialNumber:](MTIDCloudKitStore, "spanRecordIDForScheme:referenceRecordID:serialNumber:", v14, v17, objc_msgSend(v15, "serialNumber"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __100__MTIDCloudKitStore_spanRecordForScheme_span_timeout_existingOnly_qualityOfService_referenceRecord___block_invoke;
  v24[3] = &unk_24C7A0B98;
  v28 = v10;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v19 = v14;
  v20 = v15;
  v21 = v16;
  -[MTIDCloudKitStore promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:](self, "promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:", v18, a7, v10, v24, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

BOOL __100__MTIDCloudKitStore_spanRecordForScheme_span_timeout_existingOnly_qualityOfService_referenceRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  if (*(_BYTE *)(a1 + 56))
    return 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:serialNumber:](MTIDCloudKitStore, "spanRecordKeyWithReferenceRecord:serialNumber:", v4, objc_msgSend(v5, "serialNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[MTIDCloudKitStore updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:](MTIDCloudKitStore, "updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:", v6, 1, v8, v7, v9, 0);

  return v10;
}

- (void)fetchChangesIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[MTIDCloudKitStore localDB](self, "localDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsFetchRecords");

  if (v4)
  {
    -[MTIDCloudKitStore localDB](self, "localDB");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsFetchRecords:", 0);

    -[MTIDCloudKitStore syncEngine](self, "syncEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAllRecords");

  }
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("dsId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        +[MTIDCloudKitStore referenceRecordIDForScheme:dsId:](MTIDCloudKitStore, "referenceRecordIDForScheme:dsId:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13), v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayByAddingObject:", v15);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[MTIDCloudKitStore syncEngine](self, "syncEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MTIDCloudKitStore syncEngine](self, "syncEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchRecordWithIDs:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __44__MTIDCloudKitStore_syncForSchemes_options___block_invoke;
    v21[3] = &unk_24C7A03D0;
    v21[4] = self;
    objc_msgSend(v18, "thenWithBlock:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

id __44__MTIDCloudKitStore_syncForSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  NSObject *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v24 = MEMORY[0x24BDBD1C0];
    goto LABEL_21;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (!v5)
    goto LABEL_19;
  v7 = v5;
  v8 = *(_QWORD *)v30;
  *(_QWORD *)&v6 = 138412546;
  v27 = v6;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v4);
      objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v27);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "recordType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("MT_IDSecret"));

        if (v13)
        {
          objc_msgSend(v11, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recordName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("MT_ID"));

          if (v16)
          {
            objc_msgSend(v11, "mt_setSynchronized:", 1);
            objc_msgSend(*(id *)(a1 + 32), "localDB");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            v18 = objc_msgSend(v17, "writeRecord:error:", v11, &v28);
            v19 = v28;

            if ((v18 & 1) == 0)
            {
              MTMetricsKitOSLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v11, "recordID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "recordName");
                v22 = a1;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v27;
                v35 = v23;
                v36 = 2112;
                v37 = v19;
                _os_log_impl(&dword_20D758000, v20, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);

                a1 = v22;
                goto LABEL_14;
              }
              goto LABEL_15;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "syncEngine");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "recordID");
            v20 = objc_claimAutoreleasedReturnValue();
            v33 = v20;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "deleteRecordsWithIDs:", v21);
LABEL_14:

LABEL_15:
          }

        }
      }

    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  }
  while (v7);
LABEL_19:
  v24 = MEMORY[0x24BDBD1C8];
LABEL_21:
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)accountDidChangeWithUserRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTIDCloudKitStore accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MTIDCloudKitStore localDB](self, "localDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "setUserRecordIDName:", v7);

  if (v8)
  {
    MTMetricsKitOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "recordName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20D758000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Updated user record with ID %@", (uint8_t *)&v11, 0xCu);

    }
    +[MTInterprocessChangeNotifier notify:](MTInterprocessChangeNotifier, "notify:", CFSTR("MTCloudKitAccountDidChangeNotification"));
  }

}

- (void)syncEngineDidStartWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTIDCloudKitStore accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%ld"), v7, objc_msgSend(v4, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTIDCloudKitStore localDB](self, "localDB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSyncStatusCode:", v8);

    MTMetricsKitOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      v11 = "MetricsKit: Error starting sync engine: %@";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 12;
LABEL_9:
      _os_log_impl(&dword_20D758000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    -[MTIDCloudKitStore localDB](self, "localDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSyncStatusCode:", CFSTR("Ready"));

    -[MTIDCloudKitStore fetchChangesIfNeeded](self, "fetchChangesIfNeeded");
    -[MTIDCloudKitStore localDB](self, "localDB");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pendingRecordIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      -[MTIDCloudKitStore syncEngine](self, "syncEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "saveRecordsWithIDs:qualityOfService:", v8, 25);

      MTMetricsKitOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = objc_msgSend(v8, "count");
        v11 = "MetricsKit: Started sync engine with %d unsynchronized records";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEBUG;
        v14 = 8;
        goto LABEL_9;
      }
    }
    else
    {
      MTMetricsKitOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v11 = "MetricsKit: Started sync engine with all records synchronized";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEBUG;
        v14 = 2;
        goto LABEL_9;
      }
    }
  }

}

- (id)recordWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTIDCloudKitStore localDB](self, "localDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "recordWithID:error:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (!v6)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "recordName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to read local record data with ID %@ error %@", buf, 0x16u);

    }
  }

  return v6;
}

- (void)recordWasSaved:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("MT_IDSecret"));

  if (v6)
  {
    objc_msgSend(v4, "mt_setSynchronized:", 1);
    -[MTIDCloudKitStore localDB](self, "localDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v7, "writeRecord:error:", v4, &v13);
    v9 = v13;

    if ((v8 & 1) == 0)
    {
      MTMetricsKitOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "recordID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_20D758000, v10, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);

      }
    }

  }
}

- (void)recordWasFailedToSave:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MT_IDSecret"));

  if (v5)
  {
    -[MTIDCloudKitStore promiseManager](self, "promiseManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishPromisesOfRecord:", v7);

  }
}

- (void)recordWasFetched:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("MT_IDSecret"));

  if (v6)
  {
    objc_msgSend(v4, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("MT_ID"));

    if (v9)
    {
      objc_msgSend(v4, "mt_setSynchronized:", 1);
      -[MTIDCloudKitStore localDB](self, "localDB");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v11 = objc_msgSend(v10, "writeRecord:error:", v4, &v16);
      v12 = v16;

      if ((v11 & 1) != 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      MTMetricsKitOSLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v4, "recordID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_20D758000, v13, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);

    }
    else
    {
      -[MTIDCloudKitStore syncEngine](self, "syncEngine");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordID");
      v13 = objc_claimAutoreleasedReturnValue();
      v17 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteRecordsWithIDs:", v14);
    }

    goto LABEL_8;
  }
LABEL_10:

}

- (void)recordWasDeleted:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTIDCloudKitStore localDB](self, "localDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "deleteRecordWithID:error:", v4, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "recordName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete local record data with ID %@ error %@", buf, 0x16u);

    }
  }

}

- (void)cloudKitLocalDB:(id)a3 didChangeRecord:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "mt_isSynchronized"))
  {
    -[MTIDCloudKitStore promiseManager](self, "promiseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishPromisesOfRecord:", v7);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("namespace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTInterprocessChangeNotifier notify:](MTInterprocessChangeNotifier, "notify:", v6);

  }
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MTIDSecret *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  MTIDCloudKitStore *v38;
  _BYTE *v39;
  double v40;
  char v41;
  id v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitStore syncEngine](self, "syncEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dsId"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reset"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("syncWaitTime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("existingOnly"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v16)
    objc_msgSend(v16, "doubleValue");
  else
    +[MTIDSyncEngine transactionTimeout](MTIDSyncEngine, "transactionTimeout");
  v20 = v19;
  MTMetricsKitOSLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "idNamespace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v22;
    if ((_DWORD)v18)
      v23 = CFSTR("YES");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v44 = (uint64_t (*)(uint64_t, uint64_t))v23;
    LOWORD(v45) = 2048;
    *(double *)((char *)&v45 + 2) = v20;
    _os_log_impl(&dword_20D758000, v21, OS_LOG_TYPE_INFO, "MetricsKit: Secret requested for scheme %@, date: %@, existingOnly: %@, timeout: %f", buf, 0x2Au);

  }
  if (!(_DWORD)v18)
    goto LABEL_14;
  +[MTIDCloudKitStore referenceRecordIDForScheme:dsId:](MTIDCloudKitStore, "referenceRecordIDForScheme:dsId:", v6, v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitStore localDB](self, "localDB");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v25, "recordWithID:error:", v24, &v42);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v42;

  if (v26)
  {

LABEL_14:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    *(_QWORD *)&v45 = __Block_byref_object_dispose_;
    *((_QWORD *)&v45 + 1) = 0;
    -[MTIDCloudKitStore referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:](self, "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:", v6, v34, v12, v15, v18, 25, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __45__MTIDCloudKitStore_secretForScheme_options___block_invoke;
    v35[3] = &unk_24C7A0BE8;
    v36 = v6;
    v38 = self;
    v39 = buf;
    v37 = v12;
    v40 = v20;
    v41 = v18;
    objc_msgSend(v27, "thenWithBlock:", v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }
  v30 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]([MTIDSecret alloc], "initWithValue:effectiveDate:expirationDate:isSynchronize:", &stru_24C7A22D0, 0, 0, 0);
  MTMetricsKitOSLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "idNamespace");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v32;
    _os_log_impl(&dword_20D758000, v31, OS_LOG_TYPE_INFO, "MetricsKit: Secret doesn't exist, returning empty secret for scheme %@", buf, 0xCu);

  }
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v28;
}

id __45__MTIDCloudKitStore_secretForScheme_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MTIDSecret *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[4];
  id v29;
  id v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  MTMetricsKitOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "idNamespace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "mt_isSynchronized");
    v8 = CFSTR("unsynchronized");
    *(_DWORD *)buf = 138412802;
    v33 = v5;
    v34 = 2112;
    if (v7)
      v8 = CFSTR("synchronized");
    v35 = v6;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_INFO, "MetricsKit: Loaded reference record for scheme %@ with id %@, synchronized: %@", buf, 0x20u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "lifespan") < 1)
  {
    objc_msgSend(v3, "mt_secretValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v13 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]([MTIDSecret alloc], "initWithValue:effectiveDate:expirationDate:isSynchronize:", v9, 0, 0, objc_msgSend(v3, "mt_isSynchronized"));
    if (objc_msgSend(*(id *)(a1 + 48), "canSyncBetweenDevices"))
    {
      objc_msgSend(*(id *)(a1 + 48), "localDB");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syncStatusCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDSecret setSyncStatusCode:](v13, "setSyncStatusCode:", v16);

    }
    MTMetricsKitOSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "idNamespace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v18;
      _os_log_impl(&dword_20D758000, v17, OS_LOG_TYPE_INFO, "MetricsKit: Returning secret for scheme %@", buf, 0xCu);

    }
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  +[MTIDCloudKitStore referenceDateOfRecord:](MTIDCloudKitStore, "referenceDateOfRecord:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 || (v9 = *(id *)(a1 + 40)) != 0)
  {
    +[MTIDSpan spanForScheme:date:referenceDate:](MTIDSpan, "spanForScheme:date:referenceDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(a1 + 48), "generateFutureRecordsForScheme:referenceRecord:", *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(*(id *)(a1 + 48), "spanRecordForScheme:span:timeout:existingOnly:qualityOfService:referenceRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 72), 25, v3, *(double *)(a1 + 64));
    v13 = (MTIDSecret *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = (uint64_t)__45__MTIDCloudKitStore_secretForScheme_options___block_invoke_54;
    v28[3] = (uint64_t)&unk_24C7A0BC0;
    v29 = *(id *)(a1 + 32);
    v30 = v3;
    v31 = *(_OWORD *)(a1 + 48);
    -[MTIDSecret thenWithBlock:](v13, "thenWithBlock:", v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    goto LABEL_15;
  }
  MTMetricsKitOSLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "idNamespace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    _os_log_impl(&dword_20D758000, v20, OS_LOG_TYPE_ERROR, "MetricsKit: Reference date is null, returning error. Scheme: %@", buf, 0xCu);

  }
  MTError(703, CFSTR("Namespace date is null, are you sending multiple reset requests too quickly?"), v22, v23, v24, v25, v26, v27, v28[0]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v14;
}

id __45__MTIDCloudKitStore_secretForScheme_options___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MTIDSecret *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MTIDSecret *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  MTMetricsKitOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "idNamespace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_INFO, "MetricsKit: Span record obtained for scheme %@", buf, 0xCu);

  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "mt_secretValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mt_secretValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [MTIDSecret alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "mt_isSynchronized"))
    v13 = objc_msgSend(v3, "mt_isSynchronized");
  else
    v13 = 0;
  v14 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:](v10, "initWithValue:effectiveDate:expirationDate:isSynchronize:", v9, v11, v12, v13);

  if (objc_msgSend(*(id *)(a1 + 48), "canSyncBetweenDevices"))
  {
    objc_msgSend(*(id *)(a1 + 48), "localDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncStatusCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSecret setSyncStatusCode:](v14, "setSyncStatusCode:", v16);

  }
  MTMetricsKitOSLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "idNamespace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_impl(&dword_20D758000, v17, OS_LOG_TYPE_INFO, "MetricsKit: Returning secret for scheme %@", buf, 0xCu);

  }
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitStore syncEngine](self, "syncEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dsId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        -[MTIDCloudKitStore referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:](self, "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), v10, 0, 1, 0, 25, 0.0, (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "thenWithBlock:", &__block_literal_global_5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

MTPromise *__42__MTIDCloudKitStore_resetSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  MTPromise *v11;
  NSObject *v12;
  MTPromise *v13;
  MTPromise *v14;
  MTPromise *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  MTPromise *v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitStore syncEngine](self, "syncEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v8);

  if (-[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    MTMetricsKitOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v22 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_20D758000, v10, OS_LOG_TYPE_DEBUG, "MetricsKit: Performing maintenance on %d ID schemes", buf, 8u);
    }

    v11 = objc_alloc_init(MTPromise);
    -[MTIDCloudKitStore accessQueue](self, "accessQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke;
    v17[3] = &unk_24C7A0C80;
    v17[4] = self;
    v18 = v7;
    v19 = v6;
    v13 = v11;
    v20 = v13;
    dispatch_async(v12, v17);

    v14 = v20;
    v15 = v13;

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    v15 = (MTPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

void __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "generatedDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("dsId"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = a1[6];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(a1[4], "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:", v9, v16, 0, 0, 0, -1, 0.0, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_2;
        v19[3] = &unk_24C7A0C30;
        v19[4] = a1[4];
        v19[5] = v9;
        objc_msgSend(v10, "addSuccessBlock:", v19);
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(a1[4], "syncEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "localDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pendingRecordIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveRecordsWithIDs:qualityOfService:", v13, -1);

  v14 = v3;
  if (objc_msgSend(v3, "count"))
  {
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_3;
    v17[3] = &unk_24C7A0C58;
    v18 = a1[7];
    objc_msgSend(v15, "addFinishBlock:", v17);

  }
  else
  {
    objc_msgSend(a1[7], "finishWithResult:", MEMORY[0x24BDBD1C8]);
  }

}

void __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "mt_isSynchronized"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchRecordWithID:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "generateFutureRecordsForScheme:referenceRecord:", *(_QWORD *)(a1 + 40), v5);

}

uint64_t __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)(a1 + 32);
  if (a3)
    v5 = 0;
  else
    v5 = MEMORY[0x24BDBD1C8];
  return objc_msgSend(v4, "finishWithResult:error:", v5, a3);
}

- (void)clearLocalData
{
  id v2;

  -[MTIDCloudKitStore localDB](self, "localDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearData");

}

- (id)debugInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  -[MTIDCloudKitStore localDB](self, "localDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("container");
  -[MTIDCloudKitStore containerIdentifier](self, "containerIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_24C7A22D0;
  v11[1] = CFSTR("secrets");
  v12[0] = v7;
  objc_msgSend(v4, "mt_map:", &__block_literal_global_66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __30__MTIDCloudKitStore_debugInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDBCED8];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("secretKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("key"));

  objc_msgSend(v3, "mt_secretValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("value"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v3, "mt_isSynchronized");

  objc_msgSend(v7, "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("isSynchronized"));

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (BOOL)canSyncBetweenDevices
{
  return self->_canSyncBetweenDevices;
}

- (void)setCanSyncBetweenDevices:(BOOL)a3
{
  self->_canSyncBetweenDevices = a3;
}

- (void)setSyncEngine:(id)a3
{
  objc_storeStrong((id *)&self->_syncEngine, a3);
}

- (MTIDCloudKitLocalDB)localDB
{
  return self->_localDB;
}

- (void)setLocalDB:(id)a3
{
  objc_storeStrong((id *)&self->_localDB, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSMutableDictionary)generatedDates
{
  return self->_generatedDates;
}

- (void)setGeneratedDates:(id)a3
{
  objc_storeStrong((id *)&self->_generatedDates, a3);
}

- (MTIDCloudKitPromiseManager)promiseManager
{
  return self->_promiseManager;
}

- (void)setPromiseManager:(id)a3
{
  objc_storeStrong((id *)&self->_promiseManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseManager, 0);
  objc_storeStrong((id *)&self->_generatedDates, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_localDB, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
