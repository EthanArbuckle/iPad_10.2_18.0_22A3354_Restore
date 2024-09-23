@implementation MKSIMMigrator

- (MKSIMMigrator)init
{
  MKSIMMigrator *v2;
  MKSIMMigrator *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  CoreTelephonyClient *client;
  NSMutableDictionary *v8;
  NSMutableDictionary *labels;
  NSMutableSet *v10;
  NSMutableSet *existingLabels;
  NSMutableSet *v12;
  NSMutableSet *existingNumbers;
  CoreTelephonyClient *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)MKSIMMigrator;
  v2 = -[MKMigrator init](&v44, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKMigrator setType:](v2, "setType:", 16);
    v4 = dispatch_queue_create("com.apple.migrationkit.migrator.sim", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v3->_queue);
    client = v3->_client;
    v3->_client = (CoreTelephonyClient *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    labels = v3->_labels;
    v3->_labels = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    existingLabels = v3->_existingLabels;
    v3->_existingLabels = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    existingNumbers = v3->_existingNumbers;
    v3->_existingNumbers = v12;

    v14 = v3->_client;
    v43 = 0;
    -[CoreTelephonyClient getSubscriptionInfoWithError:](v14, "getSubscriptionInfoWithError:", &v43);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v43;
    if (v16)
    {
      +[MKLog log](MKLog, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MKSIMMigrator init].cold.1((uint64_t)v16, v17, v18);
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v34 = v15;
      objc_msgSend(v15, "subscriptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v40 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v24, "labelID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "phoneNumber");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "length"))
            {
              -[NSMutableSet addObject:](v3->_existingLabels, "addObject:", v25);
              if (objc_msgSend(v26, "length"))
              {
                v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v25);
                -[NSMutableDictionary setObject:forKey:](v3->_labels, "setObject:forKey:", v27, v26);

              }
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        }
        while (v21);
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = v34;
      objc_msgSend(v34, "subscriptionsInUse");
      v17 = objc_claimAutoreleasedReturnValue();
      v28 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v36 != v30)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "phoneNumber");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "length"))
              -[NSMutableSet addObject:](v3->_existingNumbers, "addObject:", v32);

          }
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        }
        while (v29);
      }
      v16 = 0;
    }

  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKSIMMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKSIMMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  MKSIM *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CoreTelephonyClient *client;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = -[MKSIM initWithData:]([MKSIM alloc], "initWithData:", v4);
  if (v5)
  {
    -[MKMigrator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "migratorWillExecuteOperation:", self);

    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x24BDC2720]);
    -[MKSIM number](v5, "number");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSIM carrier](v5, "carrier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSIM mccmnc](v5, "mccmnc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSIM gid1](v5, "gid1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSIM carrierID](v5, "carrierID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithPhoneNumber:carrierName:mccMnc:gid1:gid2:carrierID:", v8, v9, v10, v11, &stru_24E35A3B8, v12);

    client = self->_client;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __24__MKSIMMigrator_import___block_invoke;
    v16[3] = &unk_24E359B58;
    objc_copyWeak(&v17, &location);
    -[CoreTelephonyClient prepareCrossPlatformPlanTransfer:completion:](client, "prepareCrossPlatformPlanTransfer:completion:", v13, v16);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKSIMImportError"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v15);

  }
}

void __24__MKSIMMigrator_import___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:", v3);

}

- (void)coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MKSIMMigrator coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:].cold.1(v4, v6);

    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "sim is transferred to CoreTelephony", v8, 2u);
    }

    -[MKMigrator migratorDidImport](self, "migratorDidImport");
  }
  -[MKMigrator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "migratorDidExecuteOperation:", self);

}

- (void)remove
{
  NSObject *v3;
  CoreTelephonyClient *client;
  _QWORD v5[4];
  id v6;
  id buf[2];

  +[MKLog log](MKLog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "will invalidate cached sim metadata.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  client = self->_client;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __23__MKSIMMigrator_remove__block_invoke;
  v5[3] = &unk_24E359B58;
  objc_copyWeak(&v6, buf);
  -[CoreTelephonyClient invalidateCrossPlatformPlanTransfer:](client, "invalidateCrossPlatformPlanTransfer:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __23__MKSIMMigrator_remove__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "coreTelephonyClientDidInvalidateCrossPlatformPlanTransfer:", v3);

}

- (void)coreTelephonyClientDidInvalidateCrossPlatformPlanTransfer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_21EC08000, v5, OS_LOG_TYPE_INFO, "did invalidate cached sim metadata. error=%@", (uint8_t *)&v7, 0xCu);

  }
  -[MKMigrator migratorDidResetImport](self, "migratorDidResetImport");

}

- (id)label:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_labels;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_labels, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)createLabelsForNumbersInUse:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_labels;
  objc_sync_enter(v4);
  -[MKSIMMigrator determineAggregatedCellularPlans:](self, "determineAggregatedCellularPlans:", v5);
  -[MKSIMMigrator _createLabelsForNumbersInUse:](self, "_createLabelsForNumbersInUse:", v5);
  objc_sync_exit(v4);

}

- (void)setActivatedCellularPlansCount:(unint64_t)a3
{
  self->_activatedCellularPlansCount = a3;
  self->_aggregatedActivatedCellularPlansCount = a3;
}

- (void)determineAggregatedCellularPlans:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  unint64_t aggregatedActivatedCellularPlansCount;
  unint64_t activatedCellularPlansCount;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_existingNumbers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  self->_aggregatedActivatedCellularPlansCount = self->_activatedCellularPlansCount + v8;
  +[MKLog log](MKLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    aggregatedActivatedCellularPlansCount = self->_aggregatedActivatedCellularPlansCount;
    activatedCellularPlansCount = self->_activatedCellularPlansCount;
    v14 = -[NSMutableSet count](self->_existingNumbers, "count");
    *(_DWORD *)buf = 134218752;
    v20 = aggregatedActivatedCellularPlansCount;
    v21 = 2048;
    v22 = activatedCellularPlansCount;
    v23 = 2048;
    v24 = v14;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "did determine aggregated cellular plans. aggregated=%ld, android=%ld, ios=%ld, ios_in_use=%ld", buf, 0x2Au);
  }

  if (self->_aggregatedActivatedCellularPlansCount <= 1)
    -[NSMutableDictionary removeAllObjects](self->_labels, "removeAllObjects");

}

- (void)_createLabelsForNumbersInUse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  dispatch_semaphore_t v11;
  CoreTelephonyClient *client;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  dispatch_semaphore_t dsema;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  dispatch_semaphore_t v30;
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
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_aggregatedActivatedCellularPlansCount >= 2
    && (unint64_t)-[NSMutableDictionary count](self->_labels, "count") <= 7)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v6);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2710]), "initWithPhoneNumber:labelName:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), 0);
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v7);
    }

    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__3;
    v43 = __Block_byref_object_dispose__3;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__3;
    v37 = __Block_byref_object_dispose__3;
    v38 = 0;
    v11 = dispatch_semaphore_create(0);
    client = self->_client;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __46__MKSIMMigrator__createLabelsForNumbersInUse___block_invoke;
    v29[3] = &unk_24E359B80;
    v31 = &v39;
    v32 = &v33;
    dsema = v11;
    v30 = dsema;
    -[CoreTelephonyClient prepareCrossPlatformCellularPlanLabel:completion:](client, "prepareCrossPlatformCellularPlanLabel:completion:", v5, v29);
    if (!v40[5] && !v34[5])
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    +[MKLog log](MKLog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v34[5];
      *(_DWORD *)buf = 138412290;
      v51 = v14;
      _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "did create sim labels. error=%@", buf, 0xCu);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend((id)v40[5], "subscriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v49, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v19, "labelID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "phoneNumber");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
          {
            if ((-[NSMutableSet containsObject:](self->_existingLabels, "containsObject:", v20) & 1) == 0)
            {
              -[NSMutableSet addObject:](self->_existingLabels, "addObject:", v20);
              if (objc_msgSend(v21, "length"))
              {
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v20);
                -[NSMutableDictionary setObject:forKey:](self->_labels, "setObject:forKey:", v22, v21);

              }
            }
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v49, 16);
      }
      while (v16);
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

    v4 = v23;
  }

}

void __46__MKSIMMigrator__createLabelsForNumbersInUse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isSupported
{
  MKDevice *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  _BOOL4 v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MKDevice);
  if (-[MKDevice type](v2, "type") == 1 || -[MKDevice type](v2, "type") == 2)
  {
    v3 = dispatch_queue_create("com.apple.migrationkit.migrator.sim.config", 0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v3);
    v11 = 0;
    objc_msgSend(v4, "isEmbeddedSIMOnlyConfig:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v7 = objc_msgSend(v5, "BOOLValue");

    if (v6)
      v8 = 0;
    else
      v8 = v7;
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "did determine whether eSIM is supported or not. is_supported=%d, error=%@", buf, 0x12u);
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)activatedCellularPlansCount
{
  return self->_activatedCellularPlansCount;
}

- (unint64_t)aggregatedActivatedCellularPlansCount
{
  return self->_aggregatedActivatedCellularPlansCount;
}

- (void)setAggregatedActivatedCellularPlansCount:(unint64_t)a3
{
  self->_aggregatedActivatedCellularPlansCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingNumbers, 0);
  objc_storeStrong((id *)&self->_existingLabels, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_21EC08000, a2, a3, "could not get subscription info. error=%@", (uint8_t *)&v3);
}

- (void)coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_21EC08000, a2, v4, "CoreTelephony could not prepare cross platform plan transfer. error=%@", (uint8_t *)&v5);

}

@end
