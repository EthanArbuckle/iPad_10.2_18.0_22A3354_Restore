@implementation BCSRemoteFetchCloudKit

- (BCSRemoteFetchCloudKit)initWithEnvironment:(id)a3 database:(id)a4 databaseContainer:(id)a5 queryOperationFactory:(id)a6 coalesceHelper:(id)a7 bloomFilterExtractor:(id)a8 operationGroupFactory:(id)a9 metricFactory:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BCSCloudKitQueryProvider *v22;
  id v23;
  id v24;
  BCSCloudKitQueryProvider *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BCSRemoteFetchCloudKit *v31;
  BCSRemoteFetchCloudKit *v32;
  BCSCloudKitQueryProvider *v33;
  BCSRemoteFetchCloudKit *v34;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v44 = a10;
  v43 = a9;
  v41 = a8;
  v42 = a8;
  v40 = a7;
  v17 = a7;
  v39 = a6;
  v18 = a6;
  v38 = a5;
  v19 = a5;
  v37 = a4;
  v20 = a4;
  obj = a3;
  v21 = a3;
  v22 = objc_alloc_init(BCSCloudKitQueryProvider);
  v23 = v21;
  v24 = v20;
  v45 = v19;
  v25 = v22;
  v26 = v18;
  v27 = v17;
  v28 = v42;
  v29 = v43;
  v30 = v44;
  if (self)
  {
    v46.receiver = self;
    v46.super_class = (Class)BCSRemoteFetchCloudKit;
    v31 = -[BCSRemoteFetchCloudKit init](&v46, sel_init);
    self = v31;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_environment, obj);
      objc_storeStrong((id *)&self->_database, v37);
      objc_storeStrong((id *)&self->_databaseContainer, v38);
      objc_storeStrong((id *)&self->_queryProvider, v22);
      objc_storeStrong((id *)&self->_queryOperationFactory, v39);
      objc_storeStrong((id *)&self->_coalesceHelper, v40);
      objc_storeStrong((id *)&self->_bloomFilterExtractor, v41);
      objc_storeStrong((id *)&self->_operationGroupFactory, a9);
      objc_storeStrong((id *)&self->_metricFactory, a10);
    }
  }

  v32 = self;
  v33 = v25;
  v34 = v32;

  return v34;
}

- (NSString)debugDescription
{
  return (NSString *)-[BCSRemoteFetchCloudKit descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)fetchConfigItemWithType:(int64_t)a3 clientBundleID:(id)a4 completion:(id)a5
{
  -[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:](self, "fetchConfigItemWithType:clientBundleID:systemTask:completion:", a3, a4, 0, a5);
}

- (void)fetchConfigItemWithType:(int64_t)a3 clientBundleID:(id)a4 systemTask:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BCSCoalesceObjectConfig *v15;
  BCSCoalesceHelperProtocol *coalesceHelper;
  int v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v22;
  void *v23;
  void *v24;
  void *v25;
  BCSMetricFactoryProtocol *v26;
  BCSMetricFactoryProtocol *v27;
  void *v28;
  void *v29;
  void *v30;
  BCSCloudKitQueryProviding *queryProvider;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  BCSCloudKitDatabaseProtocol *database;
  void *v41;
  void *v42;
  BCSCoalesceObjectConfig *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  int64_t v49;
  _QWORD v50[4];
  NSObject *v51;
  BCSRemoteFetchCloudKit *v52;
  id v53;
  unsigned __int8 v54;
  uint8_t buf[24];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]";
    _os_log_debug_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (v12)
  {
    v54 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cloudkit_config_fetch_type_%ld"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[BCSCoalesceObjectConfig initWithCompletionBlock:coalesceKey:]([BCSCoalesceObjectConfig alloc], "initWithCompletionBlock:coalesceKey:", v12, v14);
    if (self)
      coalesceHelper = self->_coalesceHelper;
    else
      coalesceHelper = 0;
    -[BCSCoalesceHelperProtocol enqueueCoalesceObject:isDuplicateRequest:](coalesceHelper, "enqueueCoalesceObject:isDuplicateRequest:", v15, &v54);
    v17 = v54;
    ABSLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]";
        _os_log_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress:%s", buf, 0xCu);
      }
    }
    else
    {
      v43 = v15;
      v20 = os_signpost_id_generate(v18);

      v45 = v10;
      if (self)
        metricFactory = self->_metricFactory;
      else
        metricFactory = 0;
      v22 = metricFactory;
      -[BCSMetricFactoryProtocol measurementFactory](v22, "measurementFactory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSRemoteFetchCloudKit environment](self, "environment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "configCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v24, "type"), v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "begin");
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke;
      v50[3] = &unk_24C39D118;
      v19 = v25;
      v51 = v19;
      v52 = self;
      v53 = v14;
      v41 = (void *)MEMORY[0x20BD30274](v50);
      v44 = v11;
      if (self)
        v26 = self->_metricFactory;
      else
        v26 = 0;
      v27 = v26;
      -[BCSMetricFactoryProtocol measurementFactory](v27, "measurementFactory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSRemoteFetchCloudKit environment](self, "environment");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "configCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v29, "type"), v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "begin");
      if (self)
        queryProvider = self->_queryProvider;
      else
        queryProvider = 0;
      -[BCSCloudKitQueryProviding queryForFetchConfigItemWithType:](queryProvider, "queryForFetchConfigItemWithType:", a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v14;
      if (self)
      {
        switch(a3)
        {
          case 1:
            v56[0] = CFSTR("X-CloudKit-BusinessChat-QueryName");
            v33 = CFSTR("ChatSuggestConfig");
            break;
          case 2:
            v56[0] = CFSTR("X-CloudKit-BusinessLink-QueryName");
            v33 = CFSTR("DomainLinkConfig");
            break;
          case 3:
            v56[0] = CFSTR("X-CloudKit-BusinessCaller-QueryName");
            v33 = CFSTR("CallerIdConfig");
            break;
          case 4:
            v56[0] = CFSTR("X-CloudKit-BusinessEmail-QueryName");
            v33 = CFSTR("BrandedEmailConfig");
            break;
          default:
            goto LABEL_18;
        }
        *(_QWORD *)buf = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v56, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_18:
        v34 = 0;
      }
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke_48;
      v46[3] = &unk_24C39D140;
      v35 = v30;
      v47 = v35;
      v49 = a3;
      v36 = v41;
      v48 = v36;
      v37 = v32;
      v11 = v44;
      -[BCSRemoteFetchCloudKit _queryOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:singleFetchCompletion:]((id *)&self->super.isa, v32, v45, v44, v34, a3, v46);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(a3 - 1) <= 3)
      {
        -[__objc2_class keysRequestedForCloudKitFetch](*off_24C39D340[a3 - 1], "keysRequestedForCloudKitFetch");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setDesiredKeys:", v39);

      }
      if (self)
        database = self->_database;
      else
        database = 0;
      -[BCSCloudKitDatabaseProtocol addOperation:](database, "addOperation:", v38);

      v10 = v45;
      v14 = v42;
      v15 = v43;
    }

  }
}

void __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v8 = *(void **)(v7 + 56);
  else
    v8 = 0;
  objc_msgSend(v8, "dequeueCoalesceObjectsForCoalesceKey:", *(_QWORD *)(a1 + 48));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "configCompletionBlock");
          v15 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
        }
        else
        {
          ABSLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v21 = "-[BCSRemoteFetchCloudKit fetchConfigItemWithType:clientBundleID:systemTask:completion:]_block_invoke";
            _os_log_error_impl(&dword_20ACAD000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to config pool:%s", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

}

void __87__BCSRemoteFetchCloudKit_fetchConfigItemWithType_clientBundleID_systemTask_completion___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  if (v5 && !v6)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSType(*(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "Query returned, parsing config with type: %@", buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 48) - 1;
    if (v9 <= 3 && (v10 = objc_msgSend(objc_alloc(*off_24C39D340[v9]), "initWithRecord:", v5)) != 0)
    {
      v11 = (void *)v10;
      v12 = 0;
    }
    else
    {
      ABSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "CKFetch config item - CKRecord has incorrect format", buf, 2u);
      }

      v20 = *MEMORY[0x24BDD0FC8];
      v21 = CFSTR("Fetch config item failed - CKRecord has incorrect format");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 40, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_19:
    goto LABEL_20;
  }
  if (!v6)
  {
    v18 = *MEMORY[0x24BDD0FC8];
    v19 = CFSTR("Fetch config item failed, nothing returned from fetch");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = 0;
      _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "CKFetch config item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEFAULT, "CKFetch config item - error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_20:

}

- (id)_queryOperationForQuery:(void *)a3 clientBundleID:(void *)a4 systemTask:(void *)a5 requestSpecificAdditionalHTTPHeaders:(uint64_t)a6 type:(void *)a7 singleFetchCompletion:
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void (**v21)(id, id *);
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[3];
  char v38;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (a1)
  {
    v16 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __140__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_singleFetchCompletion___block_invoke;
    v26[3] = &unk_24C39D280;
    v26[4] = a1;
    v27 = v13;
    v28 = v14;
    v29 = v15;
    v30 = a6;
    v17 = a7;
    v18 = a2;
    v19 = (void *)MEMORY[0x20BD30274](v26);
    v20 = v18;
    v21 = v19;
    v22 = v17;
    objc_msgSend(a1[5], "makeQueryOperation");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setQuery:", v20);
    v21[2](v21, a1);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    v34[0] = v16;
    v34[1] = 3221225472;
    v34[2] = __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke;
    v34[3] = &unk_24C39D2A8;
    v36 = v37;
    v23 = v22;
    v35 = v23;
    objc_msgSend(a1, "setRecordFetchedBlock:", v34);
    v31[0] = v16;
    v31[1] = 3221225472;
    v31[2] = __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke_2;
    v31[3] = &unk_24C39D2D0;
    v33 = v37;
    v24 = v23;
    v32 = v24;
    objc_msgSend(a1, "setQueryCompletionBlock:", v31);

    _Block_object_dispose(v37, 8);
  }

  return a1;
}

- (void)fetchShardMatching:(id)a3 clientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BCSCoalesceObjectShard *v13;
  BCSCoalesceHelperProtocol *coalesceHelper;
  int v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v20;
  void *v21;
  void *v22;
  void *v23;
  BCSCoalesceObjectShard *v24;
  BCSMetricFactoryProtocol *v25;
  BCSMetricFactoryProtocol *v26;
  void *v27;
  void *v28;
  void *v29;
  BCSCloudKitQueryProviding *queryProvider;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  BCSCloudKitDatabaseProtocol *database;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  BCSRemoteFetchCloudKit *v50;
  id v51;
  unsigned __int8 v52;
  uint8_t buf[24];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchShardMatching:clientBundleID:completion:]";
    _os_log_debug_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEBUG, "%s@", buf, 0xCu);
  }

  if (v10)
  {
    v52 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cloudkit_shard_fetch_type_%ld_start_%lld_count_%lld"), objc_msgSend(v8, "type"), objc_msgSend(v8, "startIndex"), objc_msgSend(v8, "shardCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BCSCoalesceObjectShard initWithCompletionBlock:coalesceKey:]([BCSCoalesceObjectShard alloc], "initWithCompletionBlock:coalesceKey:", v10, v12);
    if (self)
      coalesceHelper = self->_coalesceHelper;
    else
      coalesceHelper = 0;
    -[BCSCoalesceHelperProtocol enqueueCoalesceObject:isDuplicateRequest:](coalesceHelper, "enqueueCoalesceObject:isDuplicateRequest:", v13, &v52);
    v15 = v52;
    ABSLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchShardMatching:clientBundleID:completion:]";
        _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress:%s", buf, 0xCu);
      }
    }
    else
    {
      v43 = v9;
      v18 = os_signpost_id_generate(v16);

      if (self)
        metricFactory = self->_metricFactory;
      else
        metricFactory = 0;
      v20 = metricFactory;
      -[BCSMetricFactoryProtocol measurementFactory](v20, "measurementFactory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSRemoteFetchCloudKit environment](self, "environment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shardCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v22, "type"), v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "begin");
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke;
      v48[3] = &unk_24C39D168;
      v17 = v23;
      v49 = v17;
      v50 = self;
      v41 = v12;
      v51 = v12;
      v40 = (void *)MEMORY[0x20BD30274](v48);
      v24 = v13;
      if (self)
        v25 = self->_metricFactory;
      else
        v25 = 0;
      v26 = v25;
      -[BCSMetricFactoryProtocol measurementFactory](v26, "measurementFactory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSRemoteFetchCloudKit environment](self, "environment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shardCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v28, "type"), v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "begin");
      if (self)
        queryProvider = self->_queryProvider;
      else
        queryProvider = 0;
      -[BCSCloudKitQueryProviding queryForFetchShardIdentifier:](queryProvider, "queryForFetchShardIdentifier:", v8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v8, "type");
      v13 = v24;
      if (self)
      {
        v12 = v41;
        switch(v31)
        {
          case 1:
            v54[0] = CFSTR("X-CloudKit-BusinessChat-QueryName");
            v32 = CFSTR("ChatSuggestFilter");
            goto LABEL_23;
          case 2:
            v54[0] = CFSTR("X-CloudKit-BusinessLink-QueryName");
            v32 = CFSTR("BusinessLinkFilterV2");
            goto LABEL_23;
          case 3:
            v54[0] = CFSTR("X-CloudKit-BusinessLink-QueryName");
            v32 = CFSTR("DomainShard");
            goto LABEL_23;
          case 4:
            v54[0] = CFSTR("X-CloudKit-BusinessCaller-QueryName");
            v32 = CFSTR("CallerIdFilter");
            goto LABEL_23;
          case 5:
            v54[0] = CFSTR("X-CloudKit-BusinessEmail-QueryName");
            v32 = CFSTR("BrandedEmailFilter");
LABEL_23:
            *(_QWORD *)buf = v32;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v54, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            v33 = 0;
            break;
        }
      }
      else
      {
        v33 = 0;
        v12 = v41;
      }
      v34 = objc_msgSend(v8, "type");
      if ((unint64_t)(v34 - 2) > 3)
        v35 = 1;
      else
        v35 = qword_20AD1B600[v34 - 2];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke_62;
      v44[3] = &unk_24C39D190;
      v45 = v29;
      v46 = v8;
      v47 = v40;
      v36 = v40;
      v37 = v29;
      -[BCSRemoteFetchCloudKit _queryOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:singleFetchCompletion:]((id *)&self->super.isa, v42, v43, 0, v33, v35, v44);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        database = self->_database;
      else
        database = 0;
      -[BCSCloudKitDatabaseProtocol addOperation:](database, "addOperation:", v38);

      v9 = v43;
    }

  }
}

void __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v8 = *(void **)(v7 + 56);
  else
    v8 = 0;
  objc_msgSend(v8, "dequeueCoalesceObjectsForCoalesceKey:", *(_QWORD *)(a1 + 48));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "shardCompletionBlock");
          v15 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
        }
        else
        {
          ABSLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v21 = "-[BCSRemoteFetchCloudKit fetchShardMatching:clientBundleID:completion:]_block_invoke";
            _os_log_error_impl(&dword_20ACAD000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to shard pool:%s", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

}

void __71__BCSRemoteFetchCloudKit_fetchShardMatching_clientBundleID_completion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __objc2_class **v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  if (v5 && !v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "type");
    v8 = off_24C39B3C0;
    if (v7 != 3)
      v8 = off_24C39B3D8;
    v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithRecord:type:", v5, objc_msgSend(*(id *)(a1 + 40), "type"));
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      ABSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "CKFetch shard item - CKRecord has incorrect format", buf, 2u);
      }

      v20 = *MEMORY[0x24BDD0FC8];
      v21[0] = CFSTR("Fetch shard item failed - CKRecord has incorrect format");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 40, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_18:
    goto LABEL_19;
  }
  if (!v6)
  {
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Fetch shard item failed, nothing returned from fetch");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEFAULT, "CKFetch shard item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_18;
  }
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "CKFetch shard item - error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_19:

}

- (void)fetchMegashardItemWithType:(int64_t)a3 clientBundleID:(id)a4 completion:(id)a5
{
  -[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:](self, "fetchMegashardItemWithType:clientBundleID:systemTask:completion:", a3, a4, 0, a5);
}

- (void)fetchMegashardItemWithType:(int64_t)a3 clientBundleID:(id)a4 systemTask:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BCSCoalesceObjectMegashard *v15;
  BCSCoalesceHelperProtocol *coalesceHelper;
  int v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v22;
  void *v23;
  void *v24;
  void *v25;
  BCSMetricFactoryProtocol *v26;
  BCSMetricFactoryProtocol *v27;
  void *v28;
  void *v29;
  void *v30;
  BCSCloudKitQueryProviding *queryProvider;
  const __CFString *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  BCSCloudKitDatabaseProtocol *database;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  BCSRemoteFetchCloudKit *v44;
  id v45;
  int64_t v46;
  _QWORD v47[4];
  NSObject *v48;
  BCSRemoteFetchCloudKit *v49;
  id v50;
  unsigned __int8 v51;
  uint8_t buf[16];
  _QWORD v53[4];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]";
    _os_log_debug_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (v12)
  {
    v51 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cloudkit_config_and_shard_fetch_type_%ld"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[BCSCoalesceObjectMegashard initWithCompletionBlock:coalesceKey:]([BCSCoalesceObjectMegashard alloc], "initWithCompletionBlock:coalesceKey:", v12, v14);
    if (self)
      coalesceHelper = self->_coalesceHelper;
    else
      coalesceHelper = 0;
    -[BCSCoalesceHelperProtocol enqueueCoalesceObject:isDuplicateRequest:](coalesceHelper, "enqueueCoalesceObject:isDuplicateRequest:", v15, &v51);
    v17 = v51;
    ABSLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]";
        _os_log_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress:%s", buf, 0xCu);
      }
    }
    else
    {
      v20 = os_signpost_id_generate(v18);

      v41 = v10;
      v39 = v11;
      if (self)
        metricFactory = self->_metricFactory;
      else
        metricFactory = 0;
      v22 = metricFactory;
      -[BCSMetricFactoryProtocol measurementFactory](v22, "measurementFactory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSRemoteFetchCloudKit environment](self, "environment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "megashardCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v24, "type"), v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "begin");
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke;
      v47[3] = &unk_24C39D1B8;
      v19 = v25;
      v48 = v19;
      v49 = self;
      v50 = v14;
      v38 = (void *)MEMORY[0x20BD30274](v47);
      if (self)
        v26 = self->_metricFactory;
      else
        v26 = 0;
      v27 = v26;
      -[BCSMetricFactoryProtocol measurementFactory](v27, "measurementFactory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSRemoteFetchCloudKit environment](self, "environment");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "megashardCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v29, "type"), v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "begin");
      if (self)
        queryProvider = self->_queryProvider;
      else
        queryProvider = 0;
      v11 = v39;
      -[BCSCloudKitQueryProviding queryForFetchConfigItemWithType:](queryProvider, "queryForFetchConfigItemWithType:", a3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        switch(a3)
        {
          case 1:
            v53[0] = CFSTR("X-CloudKit-BusinessChat-QueryName");
            v32 = CFSTR("ChatSuggestConfigMegashard");
            break;
          case 2:
            v53[0] = CFSTR("X-CloudKit-BusinessLink-QueryName");
            v32 = CFSTR("DomainLinkConfigMegashards");
            break;
          case 3:
          case 4:
            v53[0] = CFSTR("X-CloudKit-BusinessCaller-QueryName");
            v32 = CFSTR("BrandedEmailConfigMegashard");
            break;
          default:
            goto LABEL_18;
        }
        *(_QWORD *)buf = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v53, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_18:
        v33 = 0;
      }
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_73;
      v42[3] = &unk_24C39D208;
      v43 = v30;
      v44 = self;
      v45 = v38;
      v46 = a3;
      v34 = v38;
      v35 = v30;
      -[BCSRemoteFetchCloudKit _queryOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:singleFetchCompletion:]((id *)&self->super.isa, v40, v41, v39, v33, a3, v42);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        database = self->_database;
      else
        database = 0;
      -[BCSCloudKitDatabaseProtocol addOperation:](database, "addOperation:", v36);

      v10 = v41;
    }

  }
}

void __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "end");
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    v14 = *(void **)(v13 + 56);
  else
    v14 = 0;
  objc_msgSend(v14, "dequeueCoalesceObjectsForCoalesceKey:", *(_QWORD *)(a1 + 48));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "megashardCompletionBlock");
          v21 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, id, id, id, id))(v21 + 16))(v21, v9, v10, v11, v12);
        }
        else
        {
          ABSLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v27 = "-[BCSRemoteFetchCloudKit fetchMegashardItemWithType:clientBundleID:systemTask:completion:]_block_invoke";
            _os_log_error_impl(&dword_20ACAD000, (os_log_t)v21, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to bloom filter and config pool:%s", buf, 0xCu);
          }
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v17);
  }

}

void __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  BCSDomainConfigItem *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  BCSDomainConfigItem *v31;
  id v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  if (v5 && !v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = v7 > 4;
    v9 = (1 << v7) & 0x1A;
    if (v8 || v9 == 0)
    {
      v11 = -[BCSDomainConfigItem initWithRecord:]([BCSDomainConfigItem alloc], "initWithRecord:", v5);
      -[BCSDomainConfigItem domainMegaShardURL](v11, "domainMegaShardURL");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_27;
    }
    else
    {
      v11 = -[BCSConfigItem initWithRecord:]([BCSConfigItem alloc], "initWithRecord:", v5);
      v12 = 0;
      if (!v11)
        goto LABEL_27;
    }
    -[BCSConfigItem filterMegaShardURL](v11, "filterMegaShardURL");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16 | v12;

    if (v17)
    {
      ABSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[BCSConfigItem filterMegaShardURL](v11, "filterMegaShardURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v19;
        _os_log_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEFAULT, "Extracting shard URLs from filter shard URL: %@", buf, 0xCu);

      }
      v20 = (void *)MEMORY[0x24BDBCE50];
      -[BCSConfigItem filterMegaShardURL](v11, "filterMegaShardURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v20, "dataWithContentsOfURL:options:error:", v21, 0, &v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v33;

      if (!v22)
      {
        ABSLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v23;
          _os_log_error_impl(&dword_20ACAD000, v24, OS_LOG_TYPE_ERROR, "Failed to read filter shard from disk: %@", buf, 0xCu);
        }

      }
      v25 = *(_QWORD **)(a1 + 40);
      if (v25)
        v25 = (_QWORD *)v25[8];
      v26 = v25;
      -[BCSConfigItem filterMegaShardURL](v11, "filterMegaShardURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_75;
      v30[3] = &unk_24C39D1E0;
      v32 = *(id *)(a1 + 48);
      v31 = v11;
      objc_msgSend(v26, "extractShardsURLsFromFilterShardURL:domainShardURL:completion:", v27, v12, v30);

      goto LABEL_30;
    }
LABEL_27:
    ABSLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20ACAD000, v28, OS_LOG_TYPE_DEFAULT, "CKFetch megashard item - couldn't extract configItem and/or bloom filter URL", buf, 2u);
    }

    v36 = *MEMORY[0x24BDD0FC8];
    v37 = CFSTR("Fetch megashard item failed - CKRecord has incorrect format");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 40, v29);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_30:

LABEL_31:
    goto LABEL_32;
  }
  if (!v6)
  {
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = CFSTR("Fetch megashard item failed, nothing returned from fetch");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v14);
    v11 = (BCSDomainConfigItem *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = 0;
      _os_log_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_DEFAULT, "CKFetch megashard item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_31;
  }
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEFAULT, "CKFetch megshard item - error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_32:

}

uint64_t __90__BCSRemoteFetchCloudKit_fetchMegashardItemWithType_clientBundleID_systemTask_completion___block_invoke_75(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 40);
  if (a4)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(v5 + 16))(v5, 0, 0, 0, a4);
  else
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, a2, a3, *(_QWORD *)(a1 + 32));
}

- (void)fetchItemsWithBucketStartIndex:(int64_t)a3 endIndex:(int64_t)a4 type:(int64_t)a5 forClientBundleID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  BCSCoalesceObjectItems *v16;
  BCSCoalesceHelperProtocol *coalesceHelper;
  NSObject *v18;
  os_signpost_id_t v19;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  BCSMetricFactoryProtocol *v26;
  BCSMetricFactoryProtocol *v27;
  void *v28;
  void *v29;
  void *v30;
  BCSCloudKitQueryProviding *queryProvider;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  _QWORD *v39;
  id v40;
  void *v41;
  _QWORD *v42;
  BCSQueryOperationFactoryProtocol *queryOperationFactory;
  void (**v44)(id, void *);
  id v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD *v49;
  id v50;
  BCSCloudKitDatabaseProtocol *database;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  BCSCoalesceObjectItems *v60;
  _QWORD v61[4];
  id v62;
  BCSRemoteFetchCloudKit *v63;
  id v64;
  int64_t v65;
  _QWORD v66[4];
  id v67;
  BCSRemoteFetchCloudKit *v68;
  id v69;
  char v70;
  _QWORD v71[4];
  id v72;
  __int128 buf;
  void (*v74)(uint64_t, void *);
  void *v75;
  BCSRemoteFetchCloudKit *v76;
  id v77;
  id v78;
  id v79;
  int64_t v80;
  _QWORD v81[4];
  id v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = a7;
  ABSLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSRemoteFetchCloudKit fetchItemsWithBucketStartIndex:endIndex:type:forClientBundl"
                                    "eID:completion:]";
    _os_log_debug_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v13)
  {
    v70 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cloudkit_item_fetch_type_%ld_start_%lld_end_%lld"), a5, a3, a4);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[BCSCoalesceObjectItems initWithCompletionBlock:coalesceKey:]([BCSCoalesceObjectItems alloc], "initWithCompletionBlock:coalesceKey:", v13, v15);
    if (self)
      coalesceHelper = self->_coalesceHelper;
    else
      coalesceHelper = 0;
    v60 = v16;
    -[BCSCoalesceHelperProtocol enqueueCoalesceObject:isDuplicateRequest:](coalesceHelper, "enqueueCoalesceObject:isDuplicateRequest:");
    ABSLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    v58 = v12;
    v19 = os_signpost_id_generate(v18);

    v59 = (void *)v15;
    if (self)
      metricFactory = self->_metricFactory;
    else
      metricFactory = 0;
    v21 = metricFactory;
    -[BCSMetricFactoryProtocol measurementFactory](v21, "measurementFactory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSRemoteFetchCloudKit environment](self, "environment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemCloudKitFetchAndDecodeTimingMeasurementForType:identifier:", objc_msgSend(v23, "type"), v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "begin");
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke;
    v66[3] = &unk_24C39D230;
    v25 = v24;
    v67 = v25;
    v68 = self;
    v69 = v59;
    v55 = (void *)MEMORY[0x20BD30274](v66);
    if (self)
      v26 = self->_metricFactory;
    else
      v26 = 0;
    v27 = v26;
    -[BCSMetricFactoryProtocol measurementFactory](v27, "measurementFactory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSRemoteFetchCloudKit environment](self, "environment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "itemCloudKitFetchTimingMeasurementForType:identifier:", objc_msgSend(v29, "type"), v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "begin");
    if (self)
      queryProvider = self->_queryProvider;
    else
      queryProvider = 0;
    -[BCSCloudKitQueryProviding queryForFetchItemsWithStartIndex:endIndex:type:](queryProvider, "queryForFetchItemsWithStartIndex:endIndex:type:", a3, a4, a5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v33 = MEMORY[0x24BDAC760];
      switch(a5)
      {
        case 1:
          v81[0] = CFSTR("X-CloudKit-BusinessChat-QueryName");
          v34 = CFSTR("ChatSuggest");
          goto LABEL_18;
        case 2:
          v81[0] = CFSTR("X-CloudKit-BusinessLink-QueryName");
          v34 = CFSTR("BusinessLinkV2");
          goto LABEL_18;
        case 3:
          v81[0] = CFSTR("X-CloudKit-BusinessCaller-QueryName");
          v34 = CFSTR("CallerId");
          goto LABEL_18;
        case 4:
          v81[0] = CFSTR("X-CloudKit-BusinessCaller-QueryName");
          v34 = CFSTR("BrandedEmail");
LABEL_18:
          *(_QWORD *)&buf = v34;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v81, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          v35 = 0;
          break;
      }
    }
    else
    {
      v35 = 0;
      v33 = MEMORY[0x24BDAC760];
    }
    v61[0] = v33;
    v61[1] = 3221225472;
    v61[2] = __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke_85;
    v61[3] = &unk_24C39D258;
    v62 = v30;
    v63 = self;
    v64 = v55;
    v65 = a5;
    v56 = v55;
    v54 = v30;
    v36 = v58;
    v37 = v35;
    v57 = v32;
    v52 = v36;
    v53 = v37;
    if (self)
    {
      v38 = v37;
      *(_QWORD *)&buf = v33;
      *((_QWORD *)&buf + 1) = 3221225472;
      v74 = __142__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_multipleFetchCompletion___block_invoke;
      v75 = &unk_24C39D280;
      v76 = self;
      v77 = v36;
      v78 = 0;
      v79 = v38;
      v80 = a5;
      v39 = v61;
      v40 = v32;
      v41 = (void *)MEMORY[0x20BD30274](&buf);
      v42 = v39;
      queryOperationFactory = self->_queryOperationFactory;
      v44 = v41;
      v45 = v40;
      -[BCSQueryOperationFactoryProtocol makeQueryOperation](queryOperationFactory, "makeQueryOperation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setQuery:", v45);

      v44[2](v44, v46);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v33;
      v71[1] = 3221225472;
      v71[2] = __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke;
      v71[3] = &unk_24C39D2F8;
      v48 = v47;
      v72 = v48;
      objc_msgSend(v46, "setRecordFetchedBlock:", v71);
      v81[0] = v33;
      v81[1] = 3221225472;
      v81[2] = __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke_2;
      v81[3] = &unk_24C39D320;
      v49 = v42;
      v82 = v48;
      v83 = v49;
      v50 = v48;
      objc_msgSend(v46, "setQueryCompletionBlock:", v81);

    }
    else
    {
      v46 = 0;
    }

    if (self)
      database = self->_database;
    else
      database = 0;
    -[BCSCloudKitDatabaseProtocol addOperation:](database, "addOperation:", v46);

    v12 = v58;
  }

}

void __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v8 = *(void **)(v7 + 56);
  else
    v8 = 0;
  objc_msgSend(v8, "dequeueCoalesceObjectsForCoalesceKey:", *(_QWORD *)(a1 + 48));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "itemsCompletionBlock");
          v15 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
        }
        else
        {
          ABSLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v21 = "-[BCSRemoteFetchCloudKit fetchItemsWithBucketStartIndex:endIndex:type:forClientBundleID:completion:]_block_invoke";
            _os_log_error_impl(&dword_20ACAD000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to bloom filter and config pool:%s", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

}

void __100__BCSRemoteFetchCloudKit_fetchItemsWithBucketStartIndex_endIndex_type_forClientBundleID_completion___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  if (v5 && !v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = v5;
    if (!v7)
    {
      v16 = 0;
LABEL_23:

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_24;
    }
    switch(v8)
    {
      case 3:
        +[BCSBusinessCallerItem itemsFromRecords:](BCSBusinessCallerItem, "itemsFromRecords:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        +[BCSLinkItemModel linkItemModelsFromRecords:](BCSLinkItemModel, "linkItemModelsFromRecords:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[BCSLinkItem linkItemsFromLinkItemModels:](BCSLinkItem, "linkItemsFromLinkItemModels:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      case 1:
        +[BCSBusinessItem businessItemsFromRecords:](BCSBusinessItem, "businessItemsFromRecords:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v16 = 0;
LABEL_19:
        if (!objc_msgSend(v16, "count"))
        {
          ABSLogCommon();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "No items returned from CloudKit results", buf, 2u);
          }

        }
        goto LABEL_23;
    }
    v16 = (void *)v10;
    goto LABEL_19;
  }
  if (v6)
  {
    ABSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "CKFetch items - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v18 = *MEMORY[0x24BDD0FC8];
    v19 = CFSTR("Fetch items failed, nothing returned from fetch");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = 0;
      _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "CKFetch megashard item - error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_24:

}

- (id)shardItemFromURL:(id)a3 type:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  BCSDomainShardItem *v8;
  BCSDomainShardItem *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ABSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBCSShardType(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "shardItemFromURL:%@ type:%@", (uint8_t *)&v11, 0x16u);

  }
  if (a4 == 3)
    v8 = -[BCSDomainShardItem initWithURL:]([BCSDomainShardItem alloc], "initWithURL:", v5);
  else
    v8 = -[BCSFilterShardItem initWithURL:type:]([BCSFilterShardItem alloc], "initWithURL:type:", v5, a4);
  v9 = v8;

  return v9;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCSRemoteFetchCloudKit succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCSRemoteFetchCloudKit descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[BCSRemoteFetchCloudKit succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_environment, CFSTR("iCloudEnvironment"));
  return v4;
}

void __140__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_singleFetchCompletion___block_invoke(uint64_t a1, void *a2)
{
  -[BCSRemoteFetchCloudKit _configureOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:](*(id **)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_configureOperationForQuery:(void *)a3 clientBundleID:(void *)a4 systemTask:(void *)a5 requestSpecificAdditionalHTTPHeaders:(uint64_t)a6 type:
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a2;
  v11 = a5;
  if (a1)
  {
    v12 = (objc_class *)MEMORY[0x24BDB91F8];
    v13 = a4;
    v14 = a3;
    v15 = [v12 alloc];
    v16 = (void *)objc_msgSend(v15, "initWithZoneName:ownerName:", CFSTR("_defaultZone"), *MEMORY[0x24BDB8E88]);
    objc_msgSend(v31, "setZoneID:", v16);

    v17 = (void *)objc_opt_new();
    objc_msgSend(a1, "environment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "additionalRequestHTTPHeaders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bs_dictionaryByAddingEntriesFromDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "bs_dictionaryByAddingEntriesFromDictionary:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAdditionalRequestHTTPHeaders:", v21);

    objc_msgSend(v31, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSourceApplicationBundleIdentifier:", v14);

    objc_msgSend(v31, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSystemTask:", v13);

    if (!v13)
    {
      objc_msgSend(v31, "setQualityOfService:", 25);
      objc_msgSend(v31, "configuration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDiscretionaryNetworkBehavior:", 0);

      objc_msgSend(v31, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAutomaticallyRetryNetworkFailures:", 0);

    }
    objc_msgSend(a1[9], "makeOperationGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a6)
    {
      case 1:
        v28 = CFSTR("X-CloudKit-BusinessChat-QueryName");
        goto LABEL_9;
      case 2:
        v28 = CFSTR("X-CloudKit-BusinessLink-QueryName");
        goto LABEL_9;
      case 3:
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("X-CloudKit-BusinessCaller-QueryName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setName:", v29);

        objc_msgSend(v31, "configuration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.CommCenter.BrandedCalling"));
        goto LABEL_10;
      case 4:
        v28 = CFSTR("X-CloudKit-BusinessEmail-QueryName");
LABEL_9:
        objc_msgSend(v11, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setName:", v30);
LABEL_10:

        break;
      default:
        break;
    }
    objc_msgSend(v31, "setGroup:", v27);

  }
}

void __142__BCSRemoteFetchCloudKit__queryOperationForQuery_clientBundleID_systemTask_requestSpecificAdditionalHTTPHeaders_type_multipleFetchCompletion___block_invoke(uint64_t a1, void *a2)
{
  -[BCSRemoteFetchCloudKit _configureOperationForQuery:clientBundleID:systemTask:requestSpecificAdditionalHTTPHeaders:type:](*(id **)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_singleFetchCompletion___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __93__BCSRemoteFetchCloudKit__queryOperationForQuery_configurationBlock_multipleFetchCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
}

- (BCSICloudServerEnvironmentProtocol)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_operationGroupFactory, 0);
  objc_storeStrong((id *)&self->_bloomFilterExtractor, 0);
  objc_storeStrong((id *)&self->_coalesceHelper, 0);
  objc_storeStrong((id *)&self->_databaseContainer, 0);
  objc_storeStrong((id *)&self->_queryOperationFactory, 0);
  objc_storeStrong((id *)&self->_queryProvider, 0);
  objc_storeStrong((id *)&self->_queryOperation, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
