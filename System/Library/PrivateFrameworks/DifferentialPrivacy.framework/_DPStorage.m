@implementation _DPStorage

- (_DPStorage)init
{

  return 0;
}

- (_DPStorage)initWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _DPStorage *v7;
  void *v8;
  uint64_t v9;
  _DPCoreDataStorage *coredataStorage;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *converterFromEntity;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *converterFromClass;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  _DPStorage *v74;
  objc_super v75;
  _QWORD v76[14];
  _QWORD v77[14];
  _QWORD v78[12];
  _QWORD v79[14];

  v4 = a4;
  v79[12] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)_DPStorage;
  v7 = -[_DPStorage init](&v75, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", CFSTR("DifferentialPrivacyDataModel"), CFSTR("momd"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_readOnly = v4;
    +[_DPCoreDataStorage storageWithDirectory:databaseName:modelURL:readOnly:](_DPCoreDataStorage, "storageWithDirectory:databaseName:modelURL:readOnly:", v6, CFSTR("DifferentialPrivacy"), v71, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    coredataStorage = v7->_coredataStorage;
    v7->_coredataStorage = (_DPCoreDataStorage *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.DifferentialPrivacy.storage", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    +[_DPModelInfoRecord entityName](_DPModelInfoRecord, "entityName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v69;
    v67 = (void *)objc_opt_new();
    v79[0] = v67;
    +[_DPPrivacyBudgetRecord entityName](_DPPrivacyBudgetRecord, "entityName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v65;
    v63 = (void *)objc_opt_new();
    v79[1] = v63;
    +[_DPNumericDataRecord entityName](_DPNumericDataRecord, "entityName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v61;
    v59 = (void *)objc_opt_new();
    v79[2] = v59;
    +[_DPBitValueRecord entityName](_DPBitValueRecord, "entityName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v57;
    v55 = (void *)objc_opt_new();
    v79[3] = v55;
    +[_DPOBHSequenceRecord entityName](_DPOBHSequenceRecord, "entityName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v78[4] = v53;
    v51 = (void *)objc_opt_new();
    v79[4] = v51;
    +[_DPCMSSequenceRecord entityName](_DPCMSSequenceRecord, "entityName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v78[5] = v49;
    v47 = (void *)objc_opt_new();
    v79[5] = v47;
    +[_DPCMSWordRecord entityName](_DPCMSWordRecord, "entityName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v78[6] = v45;
    v43 = (void *)objc_opt_new();
    v79[6] = v43;
    +[_DPHCMSSequenceRecord entityName](_DPHCMSSequenceRecord, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v78[7] = v14;
    v15 = (void *)objc_opt_new();
    v79[7] = v15;
    +[_DPHCMSWordRecord entityName](_DPHCMSWordRecord, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v78[8] = v16;
    v17 = (void *)objc_opt_new();
    v79[8] = v17;
    +[_DPPTRecord entityName](_DPPTRecord, "entityName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v78[9] = v18;
    v73 = v6;
    v19 = (void *)objc_opt_new();
    v79[9] = v19;
    +[_DPBSSFPRecord entityName](_DPBSSFPRecord, "entityName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v78[10] = v20;
    v21 = (void *)objc_opt_new();
    v79[10] = v21;
    +[_DPPrioRecord entityName](_DPPrioRecord, "entityName");
    v74 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v78[11] = v22;
    v23 = (void *)objc_opt_new();
    v79[11] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 12);
    v24 = objc_claimAutoreleasedReturnValue();
    converterFromEntity = v74->_converterFromEntity;
    v74->_converterFromEntity = (NSDictionary *)v24;

    objc_msgSend((id)objc_opt_class(), "description");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v70;
    v68 = (void *)objc_opt_new();
    v77[0] = v68;
    objc_msgSend((id)objc_opt_class(), "description");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v66;
    v64 = (void *)objc_opt_new();
    v77[1] = v64;
    objc_msgSend((id)objc_opt_class(), "description");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v62;
    v60 = (void *)objc_opt_new();
    v77[2] = v60;
    objc_msgSend((id)objc_opt_class(), "description");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v58;
    v56 = (void *)objc_opt_new();
    v77[3] = v56;
    objc_msgSend((id)objc_opt_class(), "description");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v54;
    v52 = (void *)objc_opt_new();
    v77[4] = v52;
    objc_msgSend((id)objc_opt_class(), "description");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76[5] = v50;
    v48 = (void *)objc_opt_new();
    v77[5] = v48;
    objc_msgSend((id)objc_opt_class(), "description");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v76[6] = v46;
    v44 = (void *)objc_opt_new();
    v77[6] = v44;
    objc_msgSend((id)objc_opt_class(), "description");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v76[7] = v42;
    v41 = (void *)objc_opt_new();
    v77[7] = v41;
    objc_msgSend((id)objc_opt_class(), "description");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v76[8] = v40;
    v39 = (void *)objc_opt_new();
    v77[8] = v39;
    objc_msgSend((id)objc_opt_class(), "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v76[9] = v26;
    v27 = (void *)objc_opt_new();
    v77[9] = v27;
    objc_msgSend((id)objc_opt_class(), "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v76[10] = v28;
    v29 = (void *)objc_opt_new();
    v77[10] = v29;
    objc_msgSend((id)objc_opt_class(), "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v76[11] = v30;
    v31 = (void *)objc_opt_new();
    v77[11] = v31;
    objc_msgSend((id)objc_opt_class(), "description");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v76[12] = v32;
    v33 = (void *)objc_opt_new();
    v77[12] = v33;
    objc_msgSend((id)objc_opt_class(), "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v76[13] = v34;
    v35 = (void *)objc_opt_new();
    v77[13] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 14);
    v36 = objc_claimAutoreleasedReturnValue();
    converterFromClass = v74->_converterFromClass;
    v74->_converterFromClass = (NSDictionary *)v36;

    v6 = v73;
    v7 = v74;

  }
  return v7;
}

+ (id)storageWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDirectory:readOnly:", v6, v4);

  return v7;
}

- (id)removeBadObjects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D8256B78]();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v12[7] = objc_opt_class();
  v12[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31___DPStorage_removeBadObjects___block_invoke;
  v10[3] = &unk_1E95D96D8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v8);

  objc_autoreleasePoolPop(v4);
  return v5;
}

+ (id)errorStringFor:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (errorStringFor__onceToken != -1)
    dispatch_once(&errorStringFor__onceToken, &__block_literal_global_4);
  v4 = (void *)errorStringFor__errorsDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)handleEmptyArrayError:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  if (v6)
  {
    -[_DPStorage queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47___DPStorage_handleEmptyArrayError_completion___block_invoke;
    block[3] = &unk_1E95D9700;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

+ (id)createFetchRequestFor:(id)a3 entityName:(id)a4 predicate:(id)a5 fetchLimit:(unint64_t)a6 fetchOffset:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEntity:", v15);

  objc_msgSend(v14, "setPredicate:", v13);
  objc_msgSend(v14, "predicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allowEvaluation");

  objc_msgSend(v14, "setFetchLimit:", a6);
  objc_msgSend(v14, "setFetchOffset:", a7);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v18);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v14, "sortDescriptors", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v23++), "allowEvaluation");
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v21);
  }

  return v14;
}

+ (id)shuffleOrderOfRecords:(id)a3 count:(unint64_t)a4
{
  id v5;
  void *v6;
  int v7;
  unint64_t i;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = 0;
  for (i = 0; ; ++i)
  {
    v9 = objc_msgSend(v5, "count");
    v10 = a4;
    if (v9 <= a4)
      v10 = objc_msgSend(v5, "count");
    if (i >= v10)
      break;
    objc_msgSend(v6, "exchangeObjectAtIndex:withObjectAtIndex:", i, i + arc4random_uniform(v7 + objc_msgSend(v6, "count")));
    --v7;
  }
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

- (void)fetchRecordCountForEntity:(id)a3 predicate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;
  _QWORD block[5];
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10 && v9 && v11)
  {
    -[_DPStorage coredataStorage](self, "coredataStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mocForProtectionClass:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)os_transaction_create();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2;
      v19[3] = &unk_1E95D97A0;
      v19[4] = self;
      v20 = v15;
      v21 = v9;
      v22 = v10;
      v25 = a2;
      v23 = v16;
      v24 = v12;
      v17 = v16;
      objc_msgSend(v20, "performWithOptions:andBlock:", 4, v19);

    }
    else
    {
      -[_DPStorage queue](self, "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke;
      block[3] = &unk_1E95D9728;
      block[4] = self;
      v27 = v12;
      dispatch_async(v18, block);

    }
  }

}

- (void)fetchKeynamesFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  SEL v31;
  _QWORD block[5];
  id v33;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = v15;
  if (v14 && v13 && v15)
  {
    -[_DPStorage coredataStorage](self, "coredataStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mocForProtectionClass:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)os_transaction_create();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2;
      v23[3] = &unk_1E95D97F0;
      v23[4] = self;
      v24 = v19;
      v25 = v13;
      v26 = v14;
      v29 = a5;
      v30 = a6;
      v31 = a2;
      v27 = v20;
      v28 = v16;
      v21 = v20;
      objc_msgSend(v24, "performWithOptions:andBlock:", 4, v23);

    }
    else
    {
      -[_DPStorage queue](self, "queue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke;
      block[3] = &unk_1E95D9728;
      block[4] = self;
      v33 = v16;
      dispatch_async(v22, block);

    }
  }

}

- (void)fetchRecordsFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 withCompletion:(id)a7
{
  -[_DPStorage fetchRecordsFor:predicate:fetchLimit:fetchOffset:randomizeOrder:withCompletion:](self, "fetchRecordsFor:predicate:fetchLimit:fetchOffset:randomizeOrder:withCompletion:", a3, a4, a5, a6, 0, a7);
}

- (void)fetchRecordsFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 randomizeOrder:(BOOL)a7 withCompletion:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  SEL v34;
  BOOL v35;
  _QWORD block[5];
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = v17;
  if (v16 && v15 && v17)
  {
    v25 = a7;
    -[_DPStorage coredataStorage](self, "coredataStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mocForProtectionClass:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)os_transaction_create();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2;
      v26[3] = &unk_1E95D9818;
      v26[4] = self;
      v27 = v21;
      v28 = v15;
      v29 = v16;
      v32 = a5;
      v33 = a6;
      v35 = v25;
      v34 = a2;
      v30 = v22;
      v31 = v18;
      v23 = v22;
      objc_msgSend(v27, "performWithOptions:andBlock:", 4, v26);

    }
    else
    {
      -[_DPStorage queue](self, "queue");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke;
      block[3] = &unk_1E95D9728;
      block[4] = self;
      v37 = v18;
      dispatch_async(v24, block);

    }
  }

}

- (void)saveRecords:(id)a3 withCompletion:(id)a4
{
  -[_DPStorage saveRecords:andFlush:withCompletion:](self, "saveRecords:andFlush:withCompletion:", a3, 1, a4);
}

- (void)saveRecords:(id)a3 andFlush:(BOOL)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__4;
    v30 = __Block_byref_object_dispose__4;
    -[_DPStorage removeBadObjects:](self, "removeBadObjects:", v9);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)v27[5], "count");
    if (v11 != objc_msgSend(v9, "count"))
    {
      +[_DPLog framework](_DPLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (id)objc_opt_class();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPStorage saveRecords:andFlush:withCompletion:].cold.2(v13, v14, (uint64_t)v32, v12);
      }

    }
    if (objc_msgSend((id)v27[5], "count"))
    {
      -[_DPStorage coredataStorage](self, "coredataStorage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mocForProtectionClass:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        +[_DPLog daemon](_DPLog, "daemon");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[_DPStorage saveRecords:andFlush:withCompletion:].cold.1(v18);

      }
      v19 = (void *)os_transaction_create();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke;
      v21[3] = &unk_1E95D9868;
      v24 = &v26;
      v21[4] = self;
      v20 = v17;
      v22 = v20;
      v25 = a4;
      v23 = v10;
      objc_msgSend(v20, "performWithOptions:andBlock:", 4, v21);

    }
    else
    {
      -[_DPStorage handleEmptyArrayError:completion:](self, "handleEmptyArrayError:completion:", 4, v10);
    }
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    -[_DPStorage handleEmptyArrayError:completion:](self, "handleEmptyArrayError:completion:", 3, v10);
  }

}

- (void)updateRecords:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _DPStorage *v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[_DPStorage removeBadObjects:](self, "removeBadObjects:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 != objc_msgSend(v7, "count"))
    {
      +[_DPLog framework](_DPLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPStorage updateRecords:withCompletion:].cold.1((uint64_t)self, a2, v11);

    }
    if (objc_msgSend(v9, "count"))
    {
      -[_DPStorage coredataStorage](self, "coredataStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mocForProtectionClass:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)os_transaction_create();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __43___DPStorage_updateRecords_withCompletion___block_invoke;
      v17[3] = &unk_1E95D9890;
      v18 = v9;
      v19 = self;
      v20 = v14;
      v21 = v8;
      v16 = v14;
      objc_msgSend(v16, "performWithOptions:andBlock:", 4, v17);

    }
    else
    {
      -[_DPStorage handleEmptyArrayError:completion:](self, "handleEmptyArrayError:completion:", 4, v8);
    }

  }
  else
  {
    -[_DPStorage handleEmptyArrayError:completion:](self, "handleEmptyArrayError:completion:", 3, v8);
  }

}

- (void)deleteRecords:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _DPStorage *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[_DPStorage removeBadObjects:](self, "removeBadObjects:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 != objc_msgSend(v7, "count"))
    {
      +[_DPLog framework](_DPLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPStorage updateRecords:withCompletion:].cold.1((uint64_t)self, a2, v11);

    }
    if (objc_msgSend(v9, "count"))
    {
      -[_DPStorage coredataStorage](self, "coredataStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mocForProtectionClass:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)os_transaction_create();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __43___DPStorage_deleteRecords_withCompletion___block_invoke;
      v17[3] = &unk_1E95D98B8;
      v18 = v9;
      v19 = v14;
      v20 = self;
      v21 = v8;
      v16 = v14;
      objc_msgSend(v16, "performWithOptions:andBlock:", 4, v17);

    }
    else
    {
      -[_DPStorage handleEmptyArrayError:completion:](self, "handleEmptyArrayError:completion:", 4, v8);
    }

  }
  else
  {
    -[_DPStorage handleEmptyArrayError:completion:](self, "handleEmptyArrayError:completion:", 3, v8);
  }

}

- (void)deleteAllRecordsByKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _DPStorage *v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[_DPStorage coredataStorage](self, "coredataStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mocForProtectionClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPRecordQueryPredicates entityForKey:](_DPRecordQueryPredicates, "entityForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)os_transaction_create();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke;
  v17[3] = &unk_1E95D98E0;
  v18 = v6;
  v19 = self;
  v20 = v10;
  v21 = v11;
  v22 = v7;
  v13 = v7;
  v14 = v11;
  v15 = v10;
  v16 = v6;
  objc_msgSend(v15, "performWithOptions:andBlock:", 4, v17);

}

- (BOOL)deleteStorageWithObliterationOption:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (self->_readOnly)
    return 0;
  v4 = a3;
  -[_DPStorage coredataStorage](self, "coredataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "deleteStorageFor:obliterate:", v6, v4);

  return v4;
}

- (void)flush
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = (void *)os_transaction_create();
  if (!-[_DPStorage readOnly](self, "readOnly"))
  {
    -[_DPStorage coredataStorage](self, "coredataStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mocForProtectionClass:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __19___DPStorage_flush__block_invoke;
    v10[3] = &unk_1E95D8F98;
    v11 = v6;
    v7 = v6;
    objc_msgSend(v7, "performWithOptions:andBlock:", 4, v10);

  }
  -[_DPStorage coredataStorage](self, "coredataStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateManagedObjectContextFor:", v9);

}

- (void)dealloc
{
  objc_super v3;

  -[_DPStorage flush](self, "flush");
  v3.receiver = self;
  v3.super_class = (Class)_DPStorage;
  -[_DPStorage dealloc](&v3, sel_dealloc);
}

+ (id)entitiesRequiringMaintenance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  +[_DPNumericDataRecord entityName](_DPNumericDataRecord, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  +[_DPBitValueRecord entityName](_DPBitValueRecord, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v2;
  +[_DPOBHSequenceRecord entityName](_DPOBHSequenceRecord, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v3;
  +[_DPCMSWordRecord entityName](_DPCMSWordRecord, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v4;
  +[_DPCMSSequenceRecord entityName](_DPCMSSequenceRecord, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v5;
  +[_DPHCMSWordRecord entityName](_DPHCMSWordRecord, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v6;
  +[_DPHCMSSequenceRecord entityName](_DPHCMSSequenceRecord, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v7;
  +[_DPPTRecord entityName](_DPPTRecord, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v8;
  +[_DPBSSFPRecord entityName](_DPBSSFPRecord, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v9;
  +[_DPPrioRecord entityName](_DPPrioRecord, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)scheduleStorageCullingWithName:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "entitiesRequiringMaintenance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __54___DPStorage_scheduleStorageCullingWithName_database___block_invoke;
  v15 = &unk_1E95D9908;
  v16 = v5;
  v17 = v7;
  v18 = xmmword_1D400B630;
  v8 = v7;
  v9 = v5;
  v10 = (void *)MEMORY[0x1D8256D34](&v12);
  +[_DPPeriodicTask taskWithName:period:handler:](_DPPeriodicTask, "taskWithName:period:handler:", v6, kSecondsIn24Hours, v10, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v11);
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  double v17;

  v5 = a4;
  v6 = (double)(unint64_t)kSecondsIn14Day;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "entitiesRequiringMaintenance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51___DPStorage_scheduleMaintenanceWithName_database___block_invoke;
  v13[3] = &unk_1E95D9930;
  v14 = v5;
  v15 = v8;
  v16 = xmmword_1D400B630;
  v17 = v6;
  v9 = v8;
  v10 = v5;
  v11 = (void *)MEMORY[0x1D8256D34](v13);
  +[_DPPeriodicTask taskWithName:period:handler:](_DPPeriodicTask, "taskWithName:period:handler:", v7, kSecondsIn12Hours, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v12);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)converterFromEntity
{
  return self->_converterFromEntity;
}

- (NSDictionary)converterFromClass
{
  return self->_converterFromClass;
}

- (_DPCoreDataStorage)coredataStorage
{
  return self->_coredataStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coredataStorage, 0);
  objc_storeStrong((id *)&self->_converterFromClass, 0);
  objc_storeStrong((id *)&self->_converterFromEntity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)saveRecords:(os_log_t)log andFlush:withCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "NSManagedObjectContext is not found", v1, 2u);
}

- (void)saveRecords:(uint64_t)a3 andFlush:(NSObject *)a4 withCompletion:.cold.2(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a4, a3, "%@ : %@ : found foreign objects", (uint8_t *)a3);

}

- (void)updateRecords:(NSObject *)a3 withCompletion:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (id)objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v7, "%@ : %@ : found foreign objects", v8);

  OUTLINED_FUNCTION_1_0();
}

@end
