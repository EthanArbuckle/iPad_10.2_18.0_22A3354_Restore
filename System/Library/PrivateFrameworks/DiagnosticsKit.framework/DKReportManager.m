@implementation DKReportManager

- (DKReportManager)init
{
  return -[DKReportManager initWithBundleIdentifier:](self, "initWithBundleIdentifier:", CFSTR("Default"));
}

- (DKReportManager)initWithBundleIdentifier:(id)a3
{
  id v5;
  DKReportManager *v6;
  DKReportManager *v7;
  uint64_t v8;
  DKReporterRegistry *registry;
  uint64_t v10;
  DKReportPlanner *planner;
  DKReporterRegistry *v12;
  void *v13;
  uint64_t v14;
  DKExtensionDiscovery *discovery;
  dispatch_queue_t v16;
  OS_dispatch_queue *reportManagerQueue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DKReportManager;
  v6 = -[DKReportManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = objc_opt_new();
    registry = v7->_registry;
    v7->_registry = (DKReporterRegistry *)v8;

    +[DKReportPlanner plannerWithReportGeneratorRegistry:](DKReportPlanner, "plannerWithReportGeneratorRegistry:", v7->_registry);
    v10 = objc_claimAutoreleasedReturnValue();
    planner = v7->_planner;
    v7->_planner = (DKReportPlanner *)v10;

    v12 = v7->_registry;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.diagnostics-reporter-service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKExtensionDiscovery discoveryUsingExtensionRegistry:services:bundleIdentifier:](DKExtensionDiscovery, "discoveryUsingExtensionRegistry:services:bundleIdentifier:", v12, v13, v7->_bundleIdentifier);
    v14 = objc_claimAutoreleasedReturnValue();
    discovery = v7->_discovery;
    v7->_discovery = (DKExtensionDiscovery *)v14;

    v16 = dispatch_queue_create("com.apple.DiagnosticsKit.reportManager", MEMORY[0x24BDAC9C0]);
    reportManagerQueue = v7->_reportManagerQueue;
    v7->_reportManagerQueue = (OS_dispatch_queue *)v16;

    v7->_cancelled = 0;
  }

  return v7;
}

- (void)reportWithComponentPredicateManifest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[DKReportManager setCancelled:](self, "setCancelled:", 0);
  -[DKReportManager reportManagerQueue](self, "reportManagerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__DKReportManager_reportWithComponentPredicateManifest_completion___block_invoke;
  block[3] = &unk_24F99AD38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __67__DKReportManager_reportWithComponentPredicateManifest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  uint64_t v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v2, OS_LOG_TYPE_DEFAULT, "Waiting for discovery...", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "discovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitUntilComplete");

  objc_msgSend(*(id *)(a1 + 32), "planner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestGroupsForPredicateManifest:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKReport reportWithComponents:](DKReport, "reportWithComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "Starting to request reports...", buf, 2u);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v28;
LABEL_7:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(v9);
      v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14);
      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
        goto LABEL_19;
      v16 = *(void **)(a1 + 32);
      v26 = v12;
      objc_msgSend(v16, "sendRequestsForGroup:concurrent:failOnError:error:", v15, 1, 1, &v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;

      if (v17)
        break;
      v19 = *(void **)(a1 + 32);
      v25 = v18;
      objc_msgSend(v19, "sendRequestsForGroup:concurrent:failOnError:error:", v15, 0, 0, &v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v25;

      if (v17)
        goto LABEL_14;
LABEL_15:
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v11)
          goto LABEL_7;
        goto LABEL_19;
      }
    }
    v12 = v18;
LABEL_14:
    objc_msgSend(v17, "reportByMergingReport:", v7);
    v20 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v20;
    goto LABEL_15;
  }
  v12 = 0;
LABEL_19:

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    DKErrorLocalizedDescriptionForCode(-1003);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1003, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v24;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)sendRequestsForGroup:(id)a3 concurrent:(BOOL)a4 failOnError:(BOOL)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  int v32;
  dispatch_time_t v33;
  void *v34;
  id v35;
  _BOOL4 v37;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *group;
  _BOOL4 v49;
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  id v53;
  NSObject *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  BOOL v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  NSObject *v89;
  uint8_t buf[4];
  _BYTE v91[10];
  int v92;
  __int16 v93;
  _BOOL4 v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  id v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v37 = a5;
  v49 = a4;
  v107 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  group = dispatch_group_create();
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy_;
  v82 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKReport reportWithComponents:](DKReport, "reportWithComponents:", v7);
  v83 = (id)objc_claimAutoreleasedReturnValue();

  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 1;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy_;
  v72 = __Block_byref_object_dispose_;
  v73 = 0;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v43, "requests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v106, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v65;
    v44 = *MEMORY[0x24BDD0FC8];
LABEL_3:
    v42 = 0;
    while (1)
    {
      if (*(_QWORD *)v65 != v40)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v42);
      if (-[DKReportManager isCancelled](self, "isCancelled"))
        break;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v8, "manifest");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v105, 16);
      if (v47)
      {
        v46 = *(_QWORD *)v61;
LABEL_9:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v61 != v46)
            objc_enumerationMutation(v45);
          v10 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v9);
          if (-[DKReportManager isCancelled](self, "isCancelled"))
            break;
          objc_msgSend(v8, "generator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "extensionAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[DKExtensionRequest requestWithExtensionAttributes:](DKExtensionRequest, "requestWithExtensionAttributes:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setHostServicesDelegate:", self);
          if (v13)
          {
            dispatch_group_enter(group);
            ++*((_DWORD *)v85 + 6);
            DiagnosticsKitLogHandleForCategory(1);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "requestIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = *((_DWORD *)v85 + 6);
              *(_DWORD *)buf = 138414082;
              *(_QWORD *)v91 = v15;
              *(_WORD *)&v91[8] = 1024;
              v92 = v16;
              v93 = 1024;
              v94 = v49;
              v95 = 2112;
              v96 = v13;
              v97 = 2112;
              v98 = v10;
              v99 = 2112;
              v100 = v8;
              v101 = 2112;
              v102 = v43;
              v103 = 2112;
              v104 = v13;
              _os_log_impl(&dword_22DE4C000, v14, OS_LOG_TYPE_DEFAULT, "[RID: %@] Starting; count: %d, concurrent: %d; %@ < %@ < %@ < %@; request: %@",
                buf,
                0x4Au);

            }
            v17 = dispatch_semaphore_create(0);
            v18 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v13, "requestIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v13, "description");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithString:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "generator");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = MEMORY[0x24BDAC760];
            v50[1] = 3221225472;
            v50[2] = __69__DKReportManager_sendRequestsForGroup_concurrent_failOnError_error___block_invoke;
            v50[3] = &unk_24F99AD60;
            v55 = &v78;
            v56 = &v74;
            v57 = &v68;
            v51 = group;
            v58 = &v84;
            v25 = v20;
            v52 = v25;
            v59 = v49;
            v26 = v23;
            v53 = v26;
            v27 = v17;
            v54 = v27;
            objc_msgSend(v24, "beginRequest:payload:completion:", v13, v10, v50);

            if (!v49)
            {
              v28 = dispatch_time(0, 60000000000);
              dispatch_semaphore_wait(v27, v28);
            }

          }
          else
          {
            DiagnosticsKitLogHandleForCategory(1);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v32 = *((_DWORD *)v85 + 6);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v91 = v32;
              *(_WORD *)&v91[4] = 1024;
              *(_DWORD *)&v91[6] = v49;
              _os_log_error_impl(&dword_22DE4C000, v29, OS_LOG_TYPE_ERROR, "Could not start report request; count: %d, concurrent: %d",
                buf,
                0xEu);
            }

            v30 = (void *)MEMORY[0x24BDD1540];
            v88 = v44;
            DKErrorLocalizedDescriptionForCode(-1001);
            v27 = objc_claimAutoreleasedReturnValue();
            v89 = v27;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v25);
            v31 = objc_claimAutoreleasedReturnValue();
            v26 = (id)v69[5];
            v69[5] = v31;
          }

          if (v47 == ++v9)
          {
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v105, 16);
            if (v47)
              goto LABEL_9;
            break;
          }
        }
      }

      if (++v42 == v41)
      {
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v106, 16);
        if (v41)
          goto LABEL_3;
        break;
      }
    }
  }

  if (a6)
    *a6 = objc_retainAutorelease((id)v69[5]);
  v33 = dispatch_time(0, 60000000000);
  dispatch_group_wait(group, v33);
  if (v37 && !*((_BYTE *)v75 + 24))
  {
    v34 = (void *)v79[5];
    v79[5] = 0;

  }
  v35 = (id)v79[5];
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  return v35;
}

void __69__DKReportManager_sendRequestsForGroup_concurrent_failOnError_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_sync_enter(v8);
  objc_msgSend(v7, "reportByMergingReport:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_sync_exit(v8);
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  DiagnosticsKitLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v14 = *(unsigned __int8 *)(a1 + 96);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = 138413570;
    v18 = v15;
    v19 = 1024;
    v20 = v13;
    v21 = 1024;
    v22 = v14;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_22DE4C000, v12, OS_LOG_TYPE_DEFAULT, "[RID: %@] Finished; count: %d, concurrent: %d; Report: %@, error: %@; request: %@",
      (uint8_t *)&v17,
      0x36u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)reportersWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DKReportManager reportManagerQueue](self, "reportManagerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__DKReportManager_reportersWithCompletion___block_invoke;
  v7[3] = &unk_24F99AC68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__DKReportManager_reportersWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "discovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilComplete");

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "availableReportGenerators");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)cancelAllReports
{
  id v3;

  -[DKReportManager setCancelled:](self, "setCancelled:", 1);
  -[DKReportManager registry](self, "registry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateExtensionAdaptersWithBlock:", &__block_literal_global_7);

}

uint64_t __35__DKReportManager_cancelAllReports__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelAll");
}

- (NSArray)availableReportGenerators
{
  return self->_availableReportGenerators;
}

- (void)setAvailableReportGenerators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (DKReporterRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (DKReportPlanner)planner
{
  return self->_planner;
}

- (void)setPlanner:(id)a3
{
  objc_storeStrong((id *)&self->_planner, a3);
}

- (DKExtensionDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (OS_dispatch_queue)reportManagerQueue
{
  return self->_reportManagerQueue;
}

- (void)setReportManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reportManagerQueue, a3);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportManagerQueue, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_planner, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_availableReportGenerators, 0);
}

@end
