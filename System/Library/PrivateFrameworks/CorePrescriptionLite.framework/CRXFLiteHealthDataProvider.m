@implementation CRXFLiteHealthDataProvider

- (CRXFLiteHealthDataProvider)initWithDeviceModel:(id)a3
{
  id v4;
  CRXFLiteHealthDataProvider *v5;
  os_log_t v6;
  OS_os_log *log;
  uint64_t v8;
  NSString *deviceModel;
  HKHealthStore *v10;
  HKHealthStore *healthStore;
  uint64_t v12;
  HKSampleType *sampleType;
  uint64_t v14;
  NSPredicate *samplePredicate;
  void *v16;
  uint64_t v17;
  NSArray *sortDescriptors;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRXFLiteHealthDataProvider;
  v5 = -[CRXFLiteHealthDataProvider init](&v20, sel_init);
  if (v5)
  {
    v6 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v8 = objc_msgSend(v4, "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v8;

    v10 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
    healthStore = v5->_healthStore;
    v5->_healthStore = v10;

    objc_msgSend(MEMORY[0x24BDD3F08], "visionPrescriptionType");
    v12 = objc_claimAutoreleasedReturnValue();
    sampleType = v5->_sampleType;
    v5->_sampleType = (HKSampleType *)v12;

    objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsWithMetadataKey:", *MEMORY[0x24BDD4418]);
    v14 = objc_claimAutoreleasedReturnValue();
    samplePredicate = v5->_samplePredicate;
    v5->_samplePredicate = (NSPredicate *)v14;

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v17;

  }
  return v5;
}

- (void)fetchHealthRecordsWithCompletion:(id)a3
{
  id v4;
  id v5;
  HKSampleType *sampleType;
  NSPredicate *samplePredicate;
  NSArray *sortDescriptors;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  CRXFLiteHealthDataProvider *v14;
  id v15;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD3C40], "isHealthDataAvailable") & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDD3F00]);
    sampleType = self->_sampleType;
    samplePredicate = self->_samplePredicate;
    sortDescriptors = self->_sortDescriptors;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __63__CRXFLiteHealthDataProvider_fetchHealthRecordsWithCompletion___block_invoke;
    v13 = &unk_250B04338;
    v14 = self;
    v15 = v4;
    v9 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", sampleType, samplePredicate, 0, sortDescriptors, &v10);
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9, v10, v11, v12, v13, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x24BDBD1A8], 0);
  }

}

void __63__CRXFLiteHealthDataProvider_fetchHealthRecordsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v21 = v9;
    v22 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      v15 = *MEMORY[0x24BDD4430];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;
            objc_msgSend(v18, "metadata");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v20, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)))
              objc_msgSend(v23, "addObject:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v7 = v22;
    v10 = v21;
  }
  else if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 1, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionLite/CRXFLiteHealthDataProvider.m", 86, MEMORY[0x24BDBD1B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getSyncTimesWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CRXFLiteHealthDataProvider *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  +[CRXUDispatchQueue main](CRXUDispatchQueue, "main");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CRXUDispatchQueue dispatchQueueWithQueue:](CRXUDispatchQueue, "dispatchQueueWithQueue:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD39E8]), "initWithHealthStore:", self->_healthStore);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke;
  v13[3] = &unk_250B04388;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "fetchCloudSyncStatusWithCompletion:", v13);

}

void __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = 0;
  v14 = 0;
  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v14 = v15;
  }
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v16;
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke_2;
  v20[3] = &unk_250B04360;
  v18 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v12;
  v22 = v17;
  v23 = *(id *)(a1 + 48);
  v24 = v14;
  v25 = v13;
  v26 = a5;
  v19 = v12;
  objc_msgSend(v18, "dispatchAsync:", v20);

}

void __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    v5 = v2;
    if (objc_msgSend(*(id *)(a1 + 40), "isCloudSyncDisabledError:", v2))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 14, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionLite/CRXFLiteHealthDataProvider.m", 118, MEMORY[0x24BDBD1B8]);
      v3 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v3;
    }
    else
    {
      v4 = v5;
    }
  }
  else
  {
    v4 = 0;
  }
  v6 = v4;
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (BOOL)isCloudSyncDisabledError:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hk_isHealthKitErrorWithCode:", 701) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "hk_isHealthKitErrorWithCode:", 100))
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsString:", CFSTR("Code=701"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_samplePredicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
