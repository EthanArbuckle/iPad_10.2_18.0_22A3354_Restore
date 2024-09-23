@implementation ASCMetrics

+ (ASCMetrics)sharedMetrics
{
  if (sharedMetrics_onceToken != -1)
    dispatch_once(&sharedMetrics_onceToken, &__block_literal_global_15);
  return (ASCMetrics *)(id)sharedMetrics_sharedMetrics;
}

void __27__ASCMetrics_sharedMetrics__block_invoke()
{
  ASCMetrics *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ASCMetrics alloc];
  +[ASCServicesConnection sharedConnection](ASCServicesConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ASCMetrics initWithConnection:](v0, "initWithConnection:", v3);
  v2 = (void *)sharedMetrics_sharedMetrics;
  sharedMetrics_sharedMetrics = v1;

}

- (ASCMetrics)initWithConnection:(id)a3
{
  id v5;
  ASCMetrics *v6;
  ASCMetrics *v7;
  ASCPendingPromises *v8;
  ASCPendingPromises *pendingProcesses;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v13.receiver = self;
  v13.super_class = (Class)ASCMetrics;
  v6 = -[ASCMetrics init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(ASCPendingPromises);
    pendingProcesses = v7->_pendingProcesses;
    v7->_pendingProcesses = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_daemonConnectionWasLost_, 0x1E7565F68, v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_daemonConnectionWasLost_, 0x1E7565F88, v5);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCMetrics;
  -[ASCMetrics dealloc](&v4, sel_dealloc);
}

- (void)daemonConnectionWasLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("Connection to daemon was lost");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", 0x1E75653A8, 1, v5);

  -[ASCMetrics pendingProcesses](self, "pendingProcesses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishAllWithError:", v6);

}

- (id)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ASCMetrics pendingProcesses](self, "pendingProcesses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);

  v12 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  -[ASCMetrics connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metricsService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke;
  v26[3] = &unk_1E75611A8;
  objc_copyWeak(&v31, &location);
  v16 = v12;
  v27 = v16;
  v17 = v8;
  v28 = v17;
  v18 = v9;
  v29 = v18;
  v19 = v10;
  v30 = v19;
  objc_msgSend(v14, "addSuccessBlock:", v26);
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_3;
  v24[3] = &unk_1E7560410;
  v20 = v16;
  v25 = v20;
  objc_msgSend(v14, "addErrorBlock:", v24);
  v21 = v25;
  v22 = v20;

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v22;
}

void __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addBinaryPromise:", *(_QWORD *)(a1 + 32));

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_2;
  v9[3] = &unk_1E7560410;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "processMetricsData:pageFields:activity:withReplyHandler:", v8, v6, v7, v9);

}

uint64_t __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id location;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "offer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {

    goto LABEL_5;
  }
  ASCOfferGetCodableClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "offer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", objc_opt_class());

  if ((v14 & 1) != 0)
  {
LABEL_5:
    -[ASCMetrics pendingProcesses](self, "pendingProcesses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v24);

    v25 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
    -[ASCMetrics connection](self, "connection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "metricsService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke;
    v35[3] = &unk_1E75611A8;
    objc_copyWeak(&v40, &location);
    v29 = v25;
    v36 = v29;
    v37 = v8;
    v38 = v9;
    v39 = v10;
    objc_msgSend(v27, "addSuccessBlock:", v35);
    v33[0] = v28;
    v33[1] = 3221225472;
    v33[2] = __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_3;
    v33[3] = &unk_1E7560410;
    v30 = v29;
    v34 = v30;
    objc_msgSend(v27, "addErrorBlock:", v33);
    v31 = v34;
    v23 = v30;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "offer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Unsupported custom lockup offer type: %@."), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v42 = *MEMORY[0x1E0CB2D50];
  v43[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", 0x1E75653A8, 3, v21);

  objc_msgSend(MEMORY[0x1E0CFDA00], "promiseWithError:", v22);
  v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v23;
}

void __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addBinaryPromise:", *(_QWORD *)(a1 + 32));

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_2;
  v9[3] = &unk_1E7560410;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "recordCampaignToken:providerToken:withLockup:withReplyHandler:", v8, v6, v7, v9);

}

uint64_t __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id location;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "offer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {

    goto LABEL_5;
  }
  ASCOfferGetCodableClasses();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "offer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", objc_opt_class());

  if ((v17 & 1) != 0)
  {
LABEL_5:
    -[ASCMetrics pendingProcesses](self, "pendingProcesses");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v27);

    v28 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
    -[ASCMetrics connection](self, "connection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "metricsService");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke;
    v38[3] = &unk_1E75611D0;
    objc_copyWeak(&v44, &location);
    v32 = v28;
    v39 = v32;
    v40 = v10;
    v41 = v11;
    v42 = v12;
    v43 = v13;
    objc_msgSend(v30, "addSuccessBlock:", v38);
    v36[0] = v31;
    v36[1] = 3221225472;
    v36[2] = __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_3;
    v36[3] = &unk_1E7560410;
    v33 = v32;
    v37 = v33;
    objc_msgSend(v30, "addErrorBlock:", v36);
    v34 = v37;
    v26 = v33;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "offer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Unsupported custom lockup offer type: %@."), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v46 = *MEMORY[0x1E0CB2D50];
  v47[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", 0x1E75653A8, 3, v24);

  objc_msgSend(MEMORY[0x1E0CFDA00], "promiseWithError:", v25);
  v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v26;
}

void __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = (id *)(a1 + 72);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addBinaryPromise:", *(_QWORD *)(a1 + 32));

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_2;
  v10[3] = &unk_1E7560410;
  v9 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "recordQToken:campaignToken:advertisementID:withLockup:withReplyHandler:", v9, v6, v7, v8, v10);

}

uint64_t __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)processMetricsData:(id)a3 withActivity:(id)a4
{
  return -[ASCMetrics processMetricsData:pageFields:activity:](self, "processMetricsData:pageFields:activity:", a3, 0, a4);
}

- (id)processViewMetrics:(id)a3 atInvocationPoint:(id)a4 withActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "dataForInvocationPoint:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v24 = v9;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
          objc_msgSend(v8, "pageFields", v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCMetrics processMetricsData:pageFields:activity:](self, "processMetricsData:pageFields:activity:", v18, v19, v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0CFDA00], "promiseWithFlattenedPromises:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v23;
    v9 = v24;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ASCMetrics processViewMetrics:atInvocationPoint:withActivity:].cold.1((uint64_t)v9);
    objc_msgSend(MEMORY[0x1E0CFDA00], "promiseWithSuccess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)processViewRenderWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id location;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEmpty"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("View render signpost predicate is empty.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", 0x1E75653A8, 0, v6);

    objc_msgSend(MEMORY[0x1E0CFDA00], "promiseWithError:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ASCMetrics pendingProcesses](self, "pendingProcesses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v9);

    v10 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
    -[ASCMetrics connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metricsService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__ASCMetrics_processViewRenderWithPredicate___block_invoke;
    v20[3] = &unk_1E75611F8;
    objc_copyWeak(&v23, &location);
    v14 = v10;
    v21 = v14;
    v22 = v4;
    objc_msgSend(v12, "addSuccessBlock:", v20);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_3;
    v18[3] = &unk_1E7560410;
    v15 = v14;
    v19 = v15;
    objc_msgSend(v12, "addErrorBlock:", v18);
    v16 = v19;
    v8 = v15;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__ASCMetrics_processViewRenderWithPredicate___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addBinaryPromise:", *(_QWORD *)(a1 + 32));

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_2;
  v7[3] = &unk_1E7560410;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "processViewRenderWithPredicate:withReplyHandler:", v6, v7);

}

uint64_t __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (void)logErrorMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[ASCMetrics connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__ASCMetrics_logErrorMessage___block_invoke;
    v7[3] = &unk_1E7561220;
    v8 = v4;
    objc_msgSend(v6, "addSuccessBlock:", v7);

  }
}

uint64_t __30__ASCMetrics_logErrorMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logErrorMessage:", *(_QWORD *)(a1 + 32));
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCPendingPromises)pendingProcesses
{
  return self->_pendingProcesses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingProcesses, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)processViewMetrics:(uint64_t)a1 atInvocationPoint:withActivity:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "No metrics for invocation point %@, skipping XPC call", (uint8_t *)&v1, 0xCu);
}

@end
