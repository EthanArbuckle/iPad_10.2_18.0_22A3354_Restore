@implementation _ATXInspectionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_33 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_33, &__block_literal_global_183);
  return (id)sharedInstance__pasExprOnceResult_43;
}

- (_ATXInspectionServer)init
{
  _ATXInspectionServer *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXInspectionServer;
  v2 = -[_ATXInspectionServer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.duet.appPrediction.inspection"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.duet.appPrediction.inspection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    _ATXInspectionInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_13_2);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_15);
    objc_msgSend(v5, "resume");
    v8 = 1;
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_ATXInspectionServer listener:shouldAcceptNewConnection:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (void)appAndActionHistoryClear:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLaunchMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearHistory");

  v5[2](v5, 0);
}

- (void)appHistoryClearAppIntent:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLaunchMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearIntentHistogramHistory");

  v5[2](v5, 0);
}

- (void)appHistoryAddLaunch:(id)a3 launchReason:(id)a4 date:(id)a5 timeZone:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void (**v17)(id, _QWORD);

  v17 = (void (**)(id, _QWORD))a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appLaunchMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addLaunchWithBundleId:date:timeZone:reason:", v14, v12, v11, v13);

  v17[2](v17, 0);
}

- (void)appHistoryUpdateActionPredictionPipelineWithAction:(id)a3 date:(id)a4 timeZone:(id)a5 reply:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void (**v96)(id, void *, void *);
  id v97;
  id v98;
  void *v99;
  id v100;
  id v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  const __CFString *v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  void *v111;
  _QWORD v112[4];

  v112[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v98 = a4;
  v97 = a5;
  v96 = (void (**)(id, void *, void *))a6;
  v10 = (void *)MEMORY[0x1E0D15A08];
  v99 = v9;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectWithUUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v12;
  objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v11, v14, 0, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "eventStreams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v107 = v19;
    v108 = 2080;
    v109 = "-[_ATXInspectionServer appHistoryUpdateActionPredictionPipelineWithAction:date:timeZone:reply:]";
    v110 = 2112;
    v111 = v15;
    _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStoreWithDirectReadOnlyAccess");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  objc_msgSend(v20, "executeQuery:error:", v15, &v101);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v101;

  if (v21 && objc_msgSend(v21, "count"))
  {
    v95 = v22;
    objc_msgSend(v21, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stream");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    v94 = v15;
    if (v26)
    {
      objc_msgSend(v23, "metadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A40], "serializedInteraction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1CAA48B6C]();
      v100 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v29, &v100);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v100;
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v31, "intent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_intents_bundleIdForDisplay");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v35 = v33;
      }
      else
      {
        objc_msgSend(v23, "source");
        v41 = v21;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bundleID");
        v35 = (id)objc_claimAutoreleasedReturnValue();

        v21 = v41;
      }

      objc_msgSend(v31, "intent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "_className");
      v44 = objc_claimAutoreleasedReturnValue();

      v45 = objc_alloc(MEMORY[0x1E0CF8C20]);
      objc_msgSend(v31, "intent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_opt_new();
      LOBYTE(v85) = 0;
      v93 = (void *)objc_msgSend(v45, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v46, v47, v35, 0, 0, 0, v85, 0, 0);

      v40 = (void *)v44;
    }
    else
    {
      v93 = 0;
      v40 = 0;
      v35 = 0;
    }
    objc_msgSend(v23, "stream");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (v50)
    {
      objc_msgSend(v23, "metadata");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "itemRelatedContentURL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", v52);
      v53 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "metadata");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "itemRelatedUniqueIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", v55);
      v56 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "metadata");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "contentDescription");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", v58);
      v59 = objc_claimAutoreleasedReturnValue();

      v91 = (void *)v56;
      v92 = v21;
      v88 = v40;
      v89 = (void *)v53;
      v87 = (void *)v59;
      if (v53 || v56 || v59)
      {
        v62 = objc_alloc(MEMORY[0x1E0CA6B50]);
        v60 = (void *)objc_msgSend(v62, "initWithContentType:", *MEMORY[0x1E0CEC498]);
        objc_msgSend(v60, "setRelatedUniqueIdentifier:", v56);
        objc_msgSend(v60, "setContentURL:", v53);
        objc_msgSend(v60, "setContentDescription:", v59);
      }
      else
      {
        v60 = 0;
      }
      objc_msgSend(v23, "value");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringValue");
      v64 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "metadata");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "itemIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "metadata");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "userActivityRequiredString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", v70, 0, 0);
      v72 = (void *)MEMORY[0x1E0CF8C20];
      objc_msgSend(v71, "activityType");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "getNSUATypefromActivityType:", v73);
      v74 = objc_claimAutoreleasedReturnValue();

      v75 = objc_alloc(MEMORY[0x1E0CF8C20]);
      v76 = (void *)objc_opt_new();
      LOBYTE(v86) = 0;
      v61 = (void *)objc_msgSend(v75, "initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:", v70, v76, v64, v67, v60, 0, 0, v86, 0, 0);

      v40 = (void *)v74;
      v35 = (id)v64;
      v21 = v92;
    }
    else
    {
      v61 = v93;
    }
    v39 = v98;
    if (v35
      && v40
      && v61
      && (objc_msgSend(v61, "actionTitle"), v77 = (void *)objc_claimAutoreleasedReturnValue(), v77, v77))
    {
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v98, v98);
      v79 = v40;
      v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8ED8]), "initWithBundleId:intentType:dateInterval:action:", v35, v40, v78, v61);
      +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "appIntentMonitor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v83) = 1.0;
      objc_msgSend(v82, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v80, 0, 0, v83);

      objc_msgSend(v61, "description");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
    }
    else
    {
      v79 = v40;
      v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v104 = *MEMORY[0x1E0CB2D50];
      v105 = CFSTR("The action does not have a bundleId, intentType, or title.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v84, "initWithDomain:code:userInfo:", CFSTR("appHistoryUpdateActionPredictionPipelineWithAction"), -1, v78);
      v38 = 0;
    }

    v15 = v94;
    v22 = v95;
  }
  else
  {
    v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v102 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No events found for UUID: %@"), v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", CFSTR("appHistoryUpdateActionPredictionPipelineWithAction"), -1, v35);
    v38 = 0;
    v39 = v98;
  }

  v96[2](v96, v38, v37);
}

- (void)appHistoryActionWithUUID:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__84;
  v25 = __Block_byref_object_dispose__84;
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v28 = *MEMORY[0x1E0CB2D50];
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("There is no action found with UUID: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("appHistoryActionWithUUID"), -1, v11);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__84;
  v19 = __Block_byref_object_dispose__84;
  v20 = 0;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55___ATXInspectionServer_appHistoryActionWithUUID_reply___block_invoke;
  v14[3] = &unk_1E82E7878;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v12, "enumerateActionsInUUIDSet:block:", v13, v14);

  v6[2](v6, v16[5], v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)appHistoryAddNSUALaunch:(id)a3 requiredString:(id)a4 itemIdentifier:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v12;
  void (**v13)(id, _QWORD);
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v12 = a6;
  v13 = (void (**)(id, _QWORD))a8;
  v14 = (objc_class *)MEMORY[0x1E0CF8C20];
  v15 = a5;
  v16 = a4;
  v17 = [v14 alloc];
  v18 = (void *)objc_opt_new();
  LOBYTE(v28) = 0;
  v19 = (void *)objc_msgSend(v17, "initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:", v16, v18, v29, v15, 0, 0, 0, v28, 0, 0);

  objc_msgSend(v19, "userActivity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activityType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CF8C20], "getNSUATypefromActivityType:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v12);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8ED8]), "initWithBundleId:intentType:dateInterval:action:", v29, v22, v23, v19);
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appIntentMonitor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1.0;
    objc_msgSend(v26, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v24, 0, 0, v27);

  }
  v13[2](v13, 0);

}

- (void)appHistoryAddAppIntentLaunch:(id)a3 intent:(id)a4 source:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  void (**v12)(id, _QWORD);
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;

  v21 = a4;
  v12 = (void (**)(id, _QWORD))a8;
  v13 = a6;
  v14 = a3;
  v15 = v21;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("NSUA")))
  {
    objc_msgSend(MEMORY[0x1E0CF8C20], "getNSUATypefromActivityType:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v13);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8ED8]), "initWithBundleId:intentType:dateInterval:", v14, v15, v16);
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appIntentMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1.0;
  objc_msgSend(v19, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v17, 0, 0, v20);

  v12[2](v12, 0);
}

- (void)appIntentHistoryMockIntentLaunch:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a8;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NSUA")) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", CFSTR("INIntent")))
  {
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appIntentMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateActionPredictionPipelineForAppSession:startDate:endDate:", v18, v13, v14);

  }
  v15[2](v15, 0);

}

- (void)appIntentHistoryDonateINIntent:(id)a3 intentType:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  dispatch_semaphore_t v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(id, _QWORD);
  void *v43;
  _QWORD v44[4];
  dispatch_semaphore_t v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = (objc_class *)MEMORY[0x1E0CBDA60];
  v42 = (void (**)(id, _QWORD))a8;
  v40 = a6;
  v39 = a5;
  v41 = a3;
  v14 = [v13 alloc];
  objc_msgSend(CFSTR("alice"), "stringByAppendingString:", CFSTR("@example.com"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CBD588];
  v17 = objc_msgSend(v14, "initWithValue:type:label:", v15, 1, *MEMORY[0x1E0CBD588]);

  v18 = objc_alloc(MEMORY[0x1E0CBDA58]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v17;
  v21 = objc_msgSend(v18, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v17, 0, CFSTR("Alice"), 0, v20, 0);

  v22 = objc_alloc(MEMORY[0x1E0CBDA60]);
  objc_msgSend(CFSTR("bob"), "stringByAppendingString:", CFSTR("@example.com"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithValue:type:label:", v23, 1, v16);

  v25 = objc_alloc(MEMORY[0x1E0CBDA58]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v25, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v24, 0, CFSTR("Bob"), 0, v27, 0);

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SendMessage")))
  {
    v29 = objc_alloc(MEMORY[0x1E0CBDB80]);
    v47[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithSpokenPhrase:", CFSTR("Hello"));
    v32 = (void *)objc_msgSend(v29, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", v30, 0, CFSTR("Hello"), v31, CFSTR("Conversation"), CFSTR("Service"), v28, 0);

  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("AudioCall")))
    {
      v34 = (void *)v21;
      v35 = 0;
      goto LABEL_7;
    }
    v33 = objc_alloc(MEMORY[0x1E0CBDC10]);
    v46 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v33, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, v30, 1);
  }
  v34 = (void *)v21;

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v32, 0);
LABEL_7:
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v39, v40);

  objc_msgSend(v35, "setDateInterval:", v36);
  v37 = dispatch_semaphore_create(0);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke;
  v44[3] = &unk_1E82E6638;
  v45 = v37;
  v38 = v37;
  objc_msgSend(v35, "_donateInteractionWithBundleId:completion:", v41, v44);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v38, 5.0);
  v42[2](v42, 0);

}

- (void)appHistoryStartDeltaRecording:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLaunchMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDeltaRecording");

  v5[2](v5, 0);
}

- (void)appHistoryStopDeltaRecording:(id)a3
{
  void (**v3)(id, id, _QWORD);
  void *v4;
  void *v5;
  id v6;

  v3 = (void (**)(id, id, _QWORD))a3;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLaunchMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopDeltaRecording");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3[2](v3, v6, 0);
}

- (void)appInstallHistoryClear:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAppInstallInfo");

  v4[2](v4, 0);
}

- (void)appInstallHistorySet:(id)a3 date:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a5;
  v7 = a4;
  v8 = a3;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addInstallForBundleId:date:", v8, v7);

  v10[2](v10, 0);
}

- (void)appInstallHistoryStartDeltaRecording:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startInstallDeltaRecording");

  v4[2](v4, 0);
}

- (void)appInstallHistoryStopDeltaRecording:(id)a3
{
  void (**v3)(id, id, _QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(id, id, _QWORD))a3;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopInstallDeltaRecording");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3[2](v3, v5, 0);
}

- (void)feedbackClear:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetData");

  +[ATXActionFeedback sharedInstance](ATXActionFeedback, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetData");

  v5[2](v5, 0);
}

- (void)feedbackLaunchedWithConsumerSubType:(unsigned __int8)a3 forBundleId:(id)a4 rejected:(id)a5 reply:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  ATXPredictionContextBuilder *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = objc_alloc_init(ATXPredictionContextBuilder);
  -[ATXPredictionContextBuilder predictionContextForCurrentContext](v12, "predictionContextForCurrentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", v8);
    +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "feedbackLaunchedWithConsumerType:forBundleId:rejected:explicitlyRejected:context:", v14, v9, v10, 0, v13);

  }
  else
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_ATXInspectionServer feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:].cold.1();

  }
  v11[2](v11, 0);

}

- (void)feedbackLaunched:(id)a3 rejected:(id)a4 reply:(id)a5
{
  -[_ATXInspectionServer feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:](self, "feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:", 9, a3, a4, a5);
}

- (void)predictAppsAndReturnInputsAndSubscores:(id)a3
{
  -[_ATXInspectionServer predictItemsAndReturnInputsAndSubscoresForConsumerSubType:intent:candidateBundleIds:candidateActiontypes:reply:](self, "predictItemsAndReturnInputsAndSubscoresForConsumerSubType:intent:candidateBundleIds:candidateActiontypes:reply:", 0, 0, 0, 0, a3);
}

- (void)predictItemsAndReturnInputsAndSubscoresForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIds:(id)a5 candidateActiontypes:(id)a6 reply:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v10 = a3;
  v18 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, void *, _QWORD))a7;
  v14 = (void *)objc_opt_new();
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:", 8, v10, v18, v11, v12, v14);

  objc_msgSend(v14, "inputsAndSubscores");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v17, 0);

}

- (void)predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
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
  void (**v22)(id, void *, void *, _QWORD);
  id v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[4];

  v7 = a5;
  v28[3] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v22 = (void (**)(id, void *, void *, _QWORD))a6;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v12 = +[ATXActionPredictions predictionsWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:](ATXActionPredictions, "predictionsWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:", v24, v23, v7, v9, v10, v11, v21);
  v27[0] = CFSTR("firstStage");
  objc_msgSend(v9, "actionMetaDataItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v27[1] = CFSTR("secondStage");
  objc_msgSend(v10, "actionMetaDataItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  v27[2] = CFSTR("thirdStage");
  objc_msgSend(v11, "actionMetaDataItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = CFSTR("firstStage");
  objc_msgSend(v9, "inputsAndSubscores");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v25[1] = CFSTR("secondStage");
  objc_msgSend(v10, "inputsAndSubscores");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  v25[2] = CFSTR("thirdStage");
  objc_msgSend(v11, "inputsAndSubscores");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[2](v22, v16, v20, 0);
}

- (void)predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v7 = a5;
  v17 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = +[ATXActionPredictions predictionsWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:](ATXActionPredictions, "predictionsWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:", v17, v9, v7, v12, v13, v14, v11);

  objc_msgSend(v11, "stageScores");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v16, 0);

}

- (void)getParseTreeForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4;
  void (**v5)(id, id, _QWORD);
  id v6;

  v4 = a3;
  v5 = (void (**)(id, id, _QWORD))a4;
  +[_ATXAppPredictor getParseTreeForConsumerSubType:](_ATXAppPredictor, "getParseTreeForConsumerSubType:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);

}

- (void)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4;
  void (**v5)(id, id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void (**)(id, id, void *, _QWORD))a4;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPredictionModelDetailsForConsumerSubType:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getABGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v9, v8, 0);
}

- (void)benchmarkAppPrediction:(unint64_t)a3 reply:(id)a4
{
  -[_ATXInspectionServer benchmarkAppPredictionForConsumerSubType:ntimes:reply:](self, "benchmarkAppPredictionForConsumerSubType:ntimes:reply:", 0, a3, a4);
}

- (void)benchmarkAppPredictionForConsumerSubType:(unsigned __int8)a3 ntimes:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6;
  void (**v7)(id, void *, _QWORD);
  unint64_t v8;
  unint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  mach_timebase_info info;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a5;
  if (*(double *)&benchmarkAppPredictionForConsumerSubType_ntimes_reply__msPerTick == 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v9) = info.denom;
    LODWORD(v8) = info.numer;
    *(double *)&benchmarkAppPredictionForConsumerSubType_ntimes_reply__msPerTick = (double)v8 / (double)v9 * 0.000001;
  }
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4); a4; --a4)
  {
    v11 = (void *)MEMORY[0x1CAA48B6C]();
    v12 = mach_absolute_time();
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:", 8, v6, 0, 0, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&benchmarkAppPredictionForConsumerSubType_ntimes_reply__msPerTick* (double)(mach_absolute_time() - v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v15);

    objc_autoreleasePoolPop(v11);
  }
  v7[2](v7, i, 0);

}

- (void)createAppPredictionLogs:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  +[ATXPredictionJSONScoreLogger sharedInstance](ATXPredictionJSONScoreLogger, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(&unk_1E83D04D8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(&unk_1E83D04D8);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        dispatch_group_enter(v4);
        LOBYTE(v9) = objc_msgSend(v9, "unsignedIntegerValue");
        +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:", 8, v9, 0, 0, 0, v3);

        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __48___ATXInspectionServer_createAppPredictionLogs___block_invoke;
        v21[3] = &unk_1E82DAC38;
        v22 = v4;
        objc_msgSend(v3, "flushWithCompletion:", v21);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(&unk_1E83D04D8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }
  v13 = (void *)MEMORY[0x1E0D81598];
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_99;
  v19[3] = &unk_1E82DA9F8;
  v20 = v16;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_100;
  v17[3] = &unk_1E82DA9F8;
  v18 = v20;
  v15 = v20;
  objc_msgSend(v13, "waitForGroup:timeoutSeconds:onGroupComplete:onTimeout:", v4, v19, v17, 3.0);

}

- (void)getActionLogs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void (**v33)(id, void *, _QWORD);
  id obj;
  id obja;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v33 = (void (**)(id, void *, _QWORD))a3;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v3, "actionLogKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v10, "first");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "second");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v12);

        }
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __38___ATXInspectionServer_getActionLogs___block_invoke;
        v42[3] = &unk_1E82E78A0;
        v43 = v16;
        v18 = v16;
        objc_msgSend(v3, "enumerateActionOfType:bundleId:block:", v12, v11, v42);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v7);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v3, "actionFeedbackLogKeys");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(obja);
        v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v23, "first");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "second");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          v27 = (void *)objc_opt_new();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, v24);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          v29 = (void *)objc_opt_new();
          objc_msgSend(v5, "objectForKeyedSubscript:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v25);

        }
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __38___ATXInspectionServer_getActionLogs___block_invoke_2;
        v36[3] = &unk_1E82E78C8;
        v37 = v29;
        v31 = v29;
        objc_msgSend(v3, "enumerateFeedbackForActionOfType:bundleId:block:", v25, v24, v36);

      }
      v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v20);
  }

  v48[0] = CFSTR("actions");
  v48[1] = CFSTR("feedback");
  v49[0] = v4;
  v49[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2](v33, v32, 0);

}

- (void)histogramsInMemory:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_opt_new();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43___ATXInspectionServer_histogramsInMemory___block_invoke;
  v16[3] = &unk_1E82E78F0;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "enumerateInMemoryHistogramsWithBlock:", v16);

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12 = 3221225472;
  v13 = __43___ATXInspectionServer_histogramsInMemory___block_invoke_2;
  v14 = &unk_1E82E7918;
  v15 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateInMemoryCategoricalHistogramsWithBlock:", &v11);

  v10 = (void *)objc_msgSend(v9, "copy", v11, v12, v13, v14);
  v3[2](v3, v10, 0);

}

- (void)histogramsInMemoryBySize:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v3 = (void (**)(id, void *, _QWORD))a3;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke;
  v21[3] = &unk_1E82E7940;
  v8 = v4;
  v22 = v8;
  v9 = v5;
  v23 = v9;
  objc_msgSend(v6, "enumerateInMemoryHistogramsWithBlock:", v21);

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  v16 = 3221225472;
  v17 = __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_2;
  v18 = &unk_1E82E7968;
  v19 = v8;
  v20 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "enumerateInMemoryCategoricalHistogramsWithBlock:", &v15);

  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_166, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_168);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v14, 0);

}

- (void)allHistogramsBySize:(id)a3
{
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v17 = (void (**)(id, void *, _QWORD))a3;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  for (i = 0; i != 99; ++i)
  {
    objc_msgSend(v3, "histogramDataForHistogramType:", i);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = (void **)v21;
      v12 = &v20;
    }
    else
    {
      objc_msgSend(v3, "categoricalHistogramDataForHistogramType:", i);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        continue;
      v7 = (void *)v13;
      +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v19;
      v12 = &v18;
    }
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

  }
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_171);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_172_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2](v17, v16, 0);

}

- (void)retrainActionHistograms:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  +[_ATXActionUtils prefillActionHistograms](_ATXActionUtils, "prefillActionHistograms");
  v3[2](v3, 0);

}

- (void)retrainActionSlotDatabase:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  +[_ATXActionUtils prefillActionSlotDatabase](_ATXActionUtils, "prefillActionSlotDatabase");
  v3[2](v3, 0);

}

- (void)resetActionPredictions:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  +[_ATXActionUtils resetActionPredictions](_ATXActionUtils, "resetActionPredictions");
  v3[2](v3, 0);

}

- (void)getAppFeedbackData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  size_t v16;
  double *v17;
  double *v18;
  unint64_t v19;
  double *v20;
  double *v21;
  double *v22;
  double *v23;
  unint64_t v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  double *v31;
  double *v32;
  double *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[4];
  _QWORD v50[6];

  v50[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = CFSTR("baseAlpha");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  +[_ATXFeedbackConstants baseAlpha](_ATXFeedbackConstants, "baseAlpha");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v6;
  v49[1] = CFSTR("baseBeta");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  +[_ATXFeedbackConstants baseBeta](_ATXFeedbackConstants, "baseBeta");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v8;
  v49[2] = CFSTR("currentAlpha");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "currentAlpha");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v10;
  v49[3] = CFSTR("currentBeta");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "currentBeta");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
  v13 = objc_claimAutoreleasedReturnValue();

  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allInstalledAppsKnownToSpringBoard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v15, "count");
  v16 = 8 * v43;
  v17 = (double *)malloc_type_malloc(8 * v43, 0x100004000313F17uLL);
  if (!v17)
    goto LABEL_8;
  v18 = v17;
  v41 = (void *)v13;
  v19 = 0x1E0CB3000uLL;
  v20 = (double *)malloc_type_malloc(v16, 0x100004000313F17uLL);
  if (!v20
    || (v21 = v20,
        v39 = v14,
        v40 = (void (**)(_QWORD, _QWORD, _QWORD))v3,
        (v22 = (double *)malloc_type_malloc(v16, 0x100004000313F17uLL)) == 0))
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v23 = v22;
  v38 = v4;
  objc_msgSend(v4, "putFeedbackScoresForApps:intoScores:confirms:rejects:", v15, v18, v21, v22);
  v42 = (void *)objc_opt_new();
  v24 = 0x1E0C99000uLL;
  v25 = v15;
  if (v43)
  {
    for (i = 0; i != v43; ++i)
    {
      v47[0] = CFSTR("score");
      objc_msgSend(*(id *)(v19 + 2024), "numberWithDouble:", v18[i]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v44;
      v47[1] = CFSTR("confirms");
      objc_msgSend(*(id *)(v19 + 2024), "numberWithDouble:", v21[i]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v27;
      v47[2] = CFSTR("rejects");
      objc_msgSend(*(id *)(v19 + 2024), "numberWithDouble:", v23[i]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v28;
      objc_msgSend(*(id *)(v24 + 3456), "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", i);
      v30 = v24;
      v31 = v23;
      v32 = v21;
      v33 = v18;
      v34 = v25;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v29, v35);

      v25 = v34;
      v18 = v33;
      v21 = v32;
      v23 = v31;
      v24 = v30;

      v19 = 0x1E0CB3000;
    }
  }
  free(v18);
  free(v21);
  free(v23);
  v45[0] = CFSTR("params");
  v45[1] = CFSTR("apps");
  v46[0] = v41;
  v46[1] = v42;
  objc_msgSend(*(id *)(v24 + 3456), "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v40)[2](v40, v36, 0);

}

- (void)trainMagicalMomentsAppPredictor:(id)a3
{
  void *v3;
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  +[ATXMagicalMomentsAppPredictor sharedInstance](ATXMagicalMomentsAppPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trainWithXPCActivity:", 0);

  v4[2](v4, 1, 0);
}

- (void)forceMagicalMomentsAppPredictionForBundleId:(id)a3 expert:(id)a4 reply:(id)a5
{
  id v7;
  NSString *v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  Class v11;
  void *v12;
  ATXMagicalMomentsPrediction *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  ATXMagicalMomentsPrediction *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (NSString *)a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_ATXInspectionServer forceMagicalMomentsAppPredictionForBundleId:expert:reply:].cold.2();

  v11 = NSClassFromString(v8);
  if ((-[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    NSClassFromString(v8);
    v12 = (void *)objc_opt_new();
    v13 = -[ATXMagicalMomentsPrediction initWithConfidence:predictionIdentifier:]([ATXMagicalMomentsPrediction alloc], "initWithConfidence:predictionIdentifier:", v7, 1.0);
    v14 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "sampleEventForExpert");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "broadcastMMPredictionsForEvent:predictions:", v15, v16);

    v9[2](v9, 1, 0);
  }
  else
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_ATXInspectionServer forceMagicalMomentsAppPredictionForBundleId:expert:reply:].cold.1();

    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("ATXMM: Tried to force a MagicalMoments App Prediction with an unrecognized expert. Terminating operation.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (ATXMagicalMomentsPrediction *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("ATXMM"), -1, v12);
    ((void (**)(id, uint64_t, ATXMagicalMomentsPrediction *))v9)[2](v9, 0, v13);
  }

}

- (void)dumpPredictionTableForMMExpert:(id)a3 reply:(id)a4
{
  NSString *v5;
  void (**v6)(id, void *, _QWORD);
  NSObject *v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_ATXInspectionServer dumpPredictionTableForMMExpert:reply:].cold.2((uint64_t)v5, v7);

  v8 = NSClassFromString(v5);
  if ((-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    NSClassFromString(v5);
    v9 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "predictionTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "describeTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11, 0);

  }
  else
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_ATXInspectionServer forceMagicalMomentsAppPredictionForBundleId:expert:reply:].cold.1();

    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("ATXMM: Tried to force a MagicalMoments App Prediction with an unrecognized expert. Terminating operation.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("ATXMM"), -1, v9);
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v10);
  }

}

- (void)evaluateInfoSuggestionsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshInfoSuggestionsWithCompletionHandler:", v3);

}

- (void)getInfoSuggestionsInString:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void (**)(id, void *, _QWORD))a3;
  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allRelevantInfoSuggestions");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v6, 0);

}

- (void)fetchSuggestionsForSourceId:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void (**)(id, void *, _QWORD))a4;
  v6 = a3;
  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allInfoSuggestionsForSourceId:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9, 0);

}

- (void)widgetBundleIdentifiersForAllInfoSuggestionsInString:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, _QWORD))a3;
  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allInfoSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "widgetBundleIdentifier", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v15, 0);

}

- (void)getInfoPredictionsInString:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void (**)(id, void *, _QWORD))a3;
  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPredictions");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v6, 0);

}

- (void)rankAndReturnInfoPredictionsInString:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void (**)(id, void *, _QWORD))a3;
  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUpdateAndReturnPredictions");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v6, 0);

}

- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  v5 = a4;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_ATXInspectionServer categoriesWithShouldUseDefault:reply:].cold.1(v4, v6);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoriesWithShouldUseDefault:reply:", 1, v5);
  }
  else
  {
    +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoriesWithReply:", v5);
  }

}

- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[ATXNotificationsLoggingServer sharedInstance](ATXNotificationsLoggingServer, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getModeTimelineDataFromStartDate:reply:", v6, v5);

}

- (void)appLaunchInformationWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ATXInspectionServer appLaunchInformationWithReply:].cold.1();

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appLaunchInformationWithReply:", v3);

}

- (void)categoryLaunchInformationWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ATXInspectionServer categoryLaunchInformationWithReply:].cold.1();

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryLaunchInformationWithReply:", v3);

}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ATXInspectionServer categoryLaunchInformationWithReply:].cold.1();

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appLaunchDatesWithReply:", v3);

}

- (void)updateAppDirectoryCache:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___ATXInspectionServer_updateAppDirectoryCache___block_invoke;
  v6[3] = &unk_1E82DF310;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "updateCacheWithActivity:completionHandler:", 0, v6);

}

- (void)refreshBlendingLayer:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, _QWORD))a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "cachedSuggestionsForAllClientModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blendingLayerServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blendingLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:", v4);
  v3[2](v3, 0);

}

- (void)promoteSuggestionsFromClientModel:(id)a3 reply:(id)a4
{
  void (**v5)(id, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blendingLayerServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blendingLayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "promoteSuggestionsFromClientModelWithIdentifier:", v6);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "cachedSuggestionsForAllClientModels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:", v10);
  v5[2](v5, 0);

}

- (void)donateSuggestion:(id)a3 forClientModel:(int64_t)a4 withReply:(id)a5
{
  void *v7;
  void (**v8)(id, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = (void *)MEMORY[0x1E0D81198];
  v8 = (void (**)(id, _QWORD))a5;
  v9 = a3;
  objc_msgSend(v7, "clientModelIdFromClientModelType:", a4);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "blendingLayerServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithClientModelId:blendingLayerServer:", v20, v12);

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "cachedSuggestionsForAllClientModels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v15, "objectForKeyedSubscript:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "suggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addObject:", v9);
  objc_msgSend(v13, "updateSuggestions:", v19);
  v8[2](v8, 0);

}

- (void)clearBlendingSuggestionsForClientModel:(int64_t)a3 withReply:(id)a4
{
  void *v5;
  void (**v6)(id, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0D81198];
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v5, "clientModelIdFromClientModelType:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blendingLayerServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithClientModelId:blendingLayerServer:", v11, v9);

  objc_msgSend(v10, "updateSuggestions:", MEMORY[0x1E0C9AA60]);
  v6[2](v6, 0);

}

- (void)blendedSuggestionsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void (**)(id, void *, _QWORD))a4;
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blendingLayerServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blendingLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "cachedSuggestionsForAllClientModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rerankedValidSuggestionsFromClientModelSuggestions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9, 0);

}

- (void)buildAnchorModelTrainingDataset:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addNewTrainingSamplesToDatabase");

  v4[2](v4, 0);
}

- (void)trainAnchorModel:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "train");

  v4[2](v4, 0);
}

- (void)scheduledPredictionsForAnchorModelWithReply:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "predictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

}

- (void)validPredictionsRightNowForAnchorModelWithReply:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "predictionsValidNow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

}

- (void)schedulePredictionsForAnchorModel:(id)a3 anchorType:(id)a4 reply:(id)a5
{
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  id v10;

  v7 = (void (**)(id, _QWORD))a5;
  v8 = a3;
  +[ATXAnchor anchorClassFromAnchorTypeString:](ATXAnchor, "anchorClassFromAnchorTypeString:", a4);
  v10 = (id)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "schedulePredictions:anchor:", v8, v10);

  v7[2](v7, 0);
}

- (void)processLockscreenFeedbackWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processLockscreenFeedback");

  v4[2](v4, 0);
}

- (void)processHomeScreenFeedbackWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processHomeScreenFeedback");

  v4[2](v4, 0);
}

- (void)processSpotlightAppFeedbackWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processSpotlightAppFeedback");

  v4[2](v4, 0);
}

- (void)processSpotlightActionFeedbackWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processSpotlightActionFeedback");

  v4[2](v4, 0);
}

- (void)processAppDirectoryFeedbackWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processAppDirectoryFeedback");

  v4[2](v4, 0);
}

- (void)performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:", 0, v6, v5);

}

- (void)nPlusOneStudyDryRunResultFilterByExtensionBundleId:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "dryRunResultFilterByExtensionBundleId:completionHandler:", v6, v5);

}

- (void)trainModeEntityModelsWithDeferTrainingWhenApplicable:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "trainWithShouldDeferTrainingOnBackupRestoreOrUpgrade:", v4);

  v6[2](v6, 0);
}

- (void)trainModeSetupPredictionModelWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "train");

  v4[2](v4, 0);
}

- (void)inspectInferredActivitySessionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "[%@] Inspecting stream %@ from timestamp %f", (uint8_t *)&v12, 0x20u);

  }
  +[ATXUnifiedInferredActivityBiomeInspector retrieveInferredActivitySessionsFromPublisherName:startTime:reply:](ATXUnifiedInferredActivityBiomeInspector, "retrieveInferredActivitySessionsFromPublisherName:startTime:reply:", v7, v8, a4);

}

- (void)inspectInferredActivityTransitionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "[%@] Inspecting stream %@ from timestamp %f", (uint8_t *)&v12, 0x20u);

  }
  +[ATXUnifiedInferredActivityBiomeInspector retrieveInferredActivityTransitionsFromPublisherName:startTime:reply:](ATXUnifiedInferredActivityBiomeInspector, "retrieveInferredActivityTransitionsFromPublisherName:startTime:reply:", v7, v8, a4);

}

- (void)forceNotificationAndSuggestionDbUpdate:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "[%@] Forcing notification and suggestion DB update", (uint8_t *)&v8, 0xCu);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "updateDatabase");
  v3[2](v3, 0);

}

- (void)generateSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 reply:(id)a5
{
  void (**v7)(id, void *, id);
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = (void (**)(id, void *, id))a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v13 = 0;
  objc_msgSend(v10, "fetchSerializedNotificationDigestFromFileData:digestTimeString:outError:", v9, v8, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  v7[2](v7, v11, v12);

}

- (void)generateSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v8;
  void (**v13)(id, void *, id);
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v8 = a7;
  v13 = (void (**)(id, void *, id))a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  v21 = 0;
  objc_msgSend(v18, "fetchSerializedNotificationDigestFromSource:digestTimeString:startDate:endDate:shouldInferMessages:outError:", v17, v16, v15, v14, v8, &v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v21;
  v13[2](v13, v19, v20);

}

- (void)generateSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v8;
  void (**v13)(id, void *, id);
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v8 = a7;
  v13 = (void (**)(id, void *, id))a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  v21 = 0;
  objc_msgSend(v18, "fetchSerializedAppGroupedNotificationDigestFromSource:digestTimeString:startDate:endDate:shouldInferMessages:outError:", v17, v16, v15, v14, v8, &v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v21;
  v13[2](v13, v19, v20);

}

- (void)generateSerializedMissedNotificationBundleFromFileData:(id)a3 modeString:(id)a4 reply:(id)a5
{
  void (**v7)(id, void *, id);
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = (void (**)(id, void *, id))a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v13 = 0;
  objc_msgSend(v10, "fetchSerializedMissedNotificationRankingFromFileData:modeString:outError:", v9, v8, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  v7[2](v7, v11, v12);

}

- (void)generateSerializedMissedNotificationBundleFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v8;
  void (**v13)(id, void *, id);
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v8 = a7;
  v13 = (void (**)(id, void *, id))a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  v21 = 0;
  objc_msgSend(v18, "fetchSerializedMissedNotificationRankingFromSource:modeString:startDate:endDate:shouldInferMessages:outError:", v17, v16, v15, v14, v8, &v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v21;
  v13[2](v13, v19, v20);

}

- (void)dumpNotificationJSONFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inferMessages:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  void (**v11)(id, void *, id);
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a6;
  v11 = (void (**)(id, void *, id))a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  v18 = 0;
  objc_msgSend(v15, "fetchSerializedNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:", v14, v13, v12, v7, &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v18;
  v11[2](v11, v16, v17);

}

- (void)clearNotificationsWithReply:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  id v5;
  id v6;

  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_opt_new();
  v6 = 0;
  objc_msgSend(v4, "clearAllNotificationData:", &v6);
  v5 = v6;
  v3[2](v3, v5);

}

- (void)showDigestFeedbackHistogramForBundleId:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "showHistogramForBundleId:withReply:", v6, v5);

}

- (void)addToDigestFeedbackHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "addToHistogramForBundleId:location:feedback:withReply:", v12, v11, v10, v9);

}

- (void)setDigestFeedbackHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (id)objc_opt_new();
  objc_msgSend(v16, "setHistogramValueForBundleId:location:feedback:value:withReply:", v15, v14, v13, v12, v11);

}

- (void)clearDigestFeedbackHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "clearHistogramWithShouldResetBookmarks:reply:", v4, v5);

}

- (void)getCurrentLocationWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D80DC8];
  v4 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(v3, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

- (void)generateDataForStressTestWithReply:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___ATXInspectionServer_generateDataForStressTestWithReply___block_invoke;
  v6[3] = &unk_1E82DD268;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "setupForStressCyclerWithCompletion:", v6);

}

- (void)clearAllDataForStressTestWithReply:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___ATXInspectionServer_clearAllDataForStressTestWithReply___block_invoke;
  v6[3] = &unk_1E82DD268;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "clearAllDataForStressCyclerWithCompletion:", v6);

}

- (void)fetchPosterDescriptorsWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[ATXPosterDescriptorCache sharedInstance](ATXPosterDescriptorCache, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v4, v6, 0);

}

- (void)logNotificationMetrics:(id)a3
{
  void (**v3)(id, _QWORD);
  ATXNotificationTelemetryLogger *v4;
  void *v5;
  ATXNotificationTelemetryLogger *v6;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = [ATXNotificationTelemetryLogger alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[ATXNotificationTelemetryLogger initWithContactStore:](v4, "initWithContactStore:", v5);

  -[ATXNotificationTelemetryLogger logNotificationMetricsWithXPCActivity:](v6, "logNotificationMetricsWithXPCActivity:", 0);
  v3[2](v3, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "Rejecting connection %@ without entitlement %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Can't record received feedback since ATXPredictionContext is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)forceMagicalMomentsAppPredictionForBundleId:expert:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXMM: Tried to force a MagicalMoments App Prediction with an unrecognized expert. Terminating operation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)forceMagicalMomentsAppPredictionForBundleId:expert:reply:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "ATXMM: Forcing MM App Prediction for bundleId: %@, expert: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)dumpPredictionTableForMMExpert:(uint64_t)a1 reply:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXMM: Dumping prediction table for expert: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)categoriesWithShouldUseDefault:(char)a1 reply:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "AppDirectoryOrdering: getting categories with default: %{BOOL}d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)appLaunchInformationWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "AppDirectoryOrdering: getting appLaunchCounts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoryLaunchInformationWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "AppDirectoryOrdering: getting categoryLaunchCounts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
