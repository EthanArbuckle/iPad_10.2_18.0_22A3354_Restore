@implementation CDMDataDispatcher

+ (void)dispatchServiceSetupMetrics:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[7];
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t v20[4];
  const char *v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchServiceSetupMetrics:selfMetadata:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM service setup metrics data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__317;
  v25 = __Block_byref_object_dispose__318;
  objc_msgSend(v7, "allValues");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__317;
  v18[4] = __Block_byref_object_dispose__318;
  v11 = v8;
  v19 = v11;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__317;
  v16[4] = __Block_byref_object_dispose__318;
  v12 = v9;
  v17 = v12;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__CDMDataDispatcher_dispatchServiceSetupMetrics_selfMetadata_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7B8;
  block[4] = &buf;
  block[5] = v18;
  block[6] = v16;
  dispatch_async(v13, block);

  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v20 = 136315138;
    v21 = "+[CDMDataDispatcher dispatchServiceSetupMetrics:selfMetadata:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched CDM service setup metrics data for SELF asynchronously.", v20, 0xCu);
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&buf, 8);
}

void __84__CDMDataDispatcher_dispatchServiceSetupMetrics_selfMetadata_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmServiceSetupMetricsData", buf, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BE95430]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1[4] + 8) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addSetupMetrics:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  v11 = objc_alloc_init(MEMORY[0x24BE95448]);
  objc_msgSend(v11, "setCdmServiceSetupMetricsReported:", v5);
  objc_msgSend(v11, "setEventMetadata:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  v12 = objc_alloc_init(MEMORY[0x24BE9E318]);
  objc_msgSend(v12, "setMainEvent:", v11);
  +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v12, CFSTR("Emitting CDMServiceSetupMetricsReported event"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v13 = (id)CDMLogContext;
  v14 = v13;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v14, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", buf, 2u);
  }

}

+ (void)insertFeatureStore:(id)a3 requester:(id)a4 debugLog:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  dispatch_block_t v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __59__CDMDataDispatcher_insertFeatureStore_requester_debugLog___block_invoke;
  v20 = &unk_24DCAC4A0;
  v11 = v7;
  v22 = v11;
  v12 = v10;
  v21 = v12;
  v13 = dispatch_block_create((dispatch_block_flags_t)0, &v17);
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue", v17, v18, v19, v20);
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v14, v13);

  CDMOSLoggerForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "+[CDMDataDispatcher insertFeatureStore:requester:debugLog:]";
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURARE")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("LIGHTHOUSE")))
  {
    v16 = dispatch_time(0, 3000000000);
    dispatch_group_wait(v12, v16);
  }

}

+ (void)waitForQueueCompletion
{
  NSObject *v2;

  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_async_and_wait(v2, &__block_literal_global_424);

}

+ (void)dispatchSELFRequestLink:(id)a3 dataDispatcherContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[7];
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t v22[4];
  const char *v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchSELFRequestLink:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch SELF RequestLink.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__317;
  v27 = __Block_byref_object_dispose__318;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v5);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__317;
  v20[4] = __Block_byref_object_dispose__318;
  v8 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v8)
  {
    objc_msgSend(v8, "nlId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "trpId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "targetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultCandidateId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "targetName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v9, v10, v11, v12, v13);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__317;
  v18[4] = __Block_byref_object_dispose__318;
  v14 = v6;
  v19 = v14;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CDMDataDispatcher_dispatchSELFRequestLink_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7B8;
  block[4] = &buf;
  block[5] = v20;
  block[6] = v18;
  dispatch_async(v15, block);

  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v22 = 136315138;
    v23 = "+[CDMDataDispatcher dispatchSELFRequestLink:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched SELF RequestLink asynchronously.", v22, 0xCu);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchCdmRequestData:(id)a3 requestId:(id)a4 withCurrentServiceGraph:(id)a5 dataDispatcherContext:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD aBlock[5];
  _QWORD block[4];
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v41 = a4;
  v9 = a5;
  v10 = a6;
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "+[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Request data.", buf, 0xCu);
  }

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__317;
  v54[4] = __Block_byref_object_dispose__318;
  v55 = (id)objc_msgSend(v42, "copy");
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__317;
  v52[4] = __Block_byref_object_dispose__318;
  if (v12)
  {
    v14 = v10;
    v15 = v9;
    objc_msgSend(v12, "nlId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trpId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultCandidateId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v16, v17, v18, v19, v20);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v15;
    v10 = v14;

  }
  else
  {
    v53 = 0;
  }
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__317;
  v50[4] = __Block_byref_object_dispose__318;
  v21 = v10;
  v51 = v21;
  CDMOSLoggerForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v30 = (void *)MEMORY[0x24BE9E340];
    objc_msgSend(v13, "nlId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertUUID:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "toSafeNSUUID");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultCandidateId");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BE9E340];
    objc_msgSend(v13, "trpId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertUUID:", v38);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "toSafeNSUUID");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetName");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v57 = "+[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:]";
    v58 = 2112;
    v59 = v31;
    v60 = 2112;
    v61 = v32;
    v62 = 2112;
    v63 = v35;
    v64 = 2112;
    v65 = v36;
    v66 = 2112;
    v67 = v37;
    _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s SELF RequestLinkData for dispatchCdmRequestData: \n RequestLinkData.nlId: %@ \n RequestLinkData.resultCandidateId: %@ \n RequestLinkData.trpId: %@ \n RequestLinkData.tragetName: %@ \n RequestLinkData.targetUUID: %@", buf, 0x3Eu);

  }
  v23 = mach_absolute_time();
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7E0;
  v26 = v9;
  v45 = v26;
  v46 = v54;
  v47 = v52;
  v48 = v50;
  v49 = v23;
  dispatch_async(v24, block);

  CDMOSLoggerForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "+[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched CDM Request data for SELF asynchronously.", buf, 0xCu);
  }

  if (v13)
  {
    objc_msgSend(v13, "targetName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  aBlock[0] = v25;
  aBlock[1] = 3221225472;
  aBlock[2] = __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke_241;
  aBlock[3] = &unk_24DCAB808;
  aBlock[4] = v54;
  v29 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v29, v28, CFSTR("CDMDataDispatcher dispatched CDM Request data for FeatureStore asynchronously."));

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(v54, 8);
}

+ (void)dispatchCdmResponseData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD aBlock[5];
  _QWORD block[8];
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t v31[4];
  const char *v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v23 = a4;
  v7 = a5;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCdmResponseData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Response data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__317;
  v36 = __Block_byref_object_dispose__318;
  v37 = (id)objc_msgSend(v24, "copy");
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__317;
  v29[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "nlId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trpId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resultCandidateId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v11, v12, v13, v14, v15);
    v30 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__317;
  v27[4] = __Block_byref_object_dispose__318;
  v16 = v7;
  v28 = v16;
  v17 = mach_absolute_time();
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB830;
  block[4] = &buf;
  block[5] = v29;
  block[6] = v27;
  block[7] = v17;
  dispatch_async(v18, block);

  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v31 = 136315138;
    v32 = "+[CDMDataDispatcher dispatchCdmResponseData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched CDM Response data for SELF asynchronously.", v31, 0xCu);
  }

  if (v10)
  {
    objc_msgSend(v10, "targetName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  aBlock[0] = v19;
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke_247;
  aBlock[3] = &unk_24DCAB808;
  aBlock[4] = &buf;
  v22 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v22, v21, CFSTR("CDMDataDispatcher dispatched CDM Response data for FeatureStore asynchronously."));

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchCdmPreprocessingWrapperData:(id)a3 requestId:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCdmPreprocessingWrapperData:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM PreprocessingWrapper data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__317;
  v19 = __Block_byref_object_dispose__318;
  v8 = v5;
  v20 = v8;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__317;
  v14[4] = __Block_byref_object_dispose__318;
  if (v6)
  {
    objc_msgSend(v6, "idA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v15 = v10;
  if (v9)
  {
    objc_msgSend(v9, "targetName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__CDMDataDispatcher_dispatchCdmPreprocessingWrapperData_requestId___block_invoke;
  v13[3] = &unk_24DCAC118;
  v13[4] = &buf;
  v13[5] = v14;
  v12 = _Block_copy(v13);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v12, v11, CFSTR("CDMDataDispatcher dispatched CDM PreprocessingWrapper data for FeatureStore asynchronously."));

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&buf, 8);

}

+ (void)dispatchCurrentTurnTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD aBlock[6];
  _QWORD block[7];
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch currentTurnTokenization data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__317;
  v40 = __Block_byref_object_dispose__318;
  v25 = v7;
  v41 = v25;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__317;
  v30[4] = __Block_byref_object_dispose__318;
  if (v11)
  {
    objc_msgSend(v11, "nlId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trpId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resultCandidateId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v13, v14, v15, v16, v17);
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__317;
  v28[4] = __Block_byref_object_dispose__318;
  v18 = v9;
  v29 = v18;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7B8;
  block[4] = &buf;
  block[5] = v30;
  block[6] = v28;
  dispatch_async(v19, block);

  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v32) = 136315138;
    *(_QWORD *)((char *)&v32 + 4) = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched currentTurnTokenization data for SELF asynchronously.", (uint8_t *)&v32, 0xCu);
  }

  *(_QWORD *)&v32 = 0;
  *((_QWORD *)&v32 + 1) = &v32;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__317;
  v35 = __Block_byref_object_dispose__318;
  if (v8)
  {
    objc_msgSend(v8, "idA");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v36 = v22;
  if (v12)
  {
    objc_msgSend(v12, "targetName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  aBlock[0] = v20;
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke_254;
  aBlock[3] = &unk_24DCAC118;
  aBlock[4] = &buf;
  aBlock[5] = &v32;
  v24 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v24, v23, CFSTR("CDMDataDispatcher dispatched currentTurnTokenization data for FeatureStore asynchronously."));

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&buf, 8);

}

+ (void)dispatchPreviousTurnTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[7];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t v27[4];
  const char *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch previousTurnTokenization data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__317;
  v32 = __Block_byref_object_dispose__318;
  v11 = v7;
  v33 = v11;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__317;
  v25[4] = __Block_byref_object_dispose__318;
  if (v12)
  {
    objc_msgSend(v12, "nlId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trpId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultCandidateId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v14, v15, v16, v17, v18);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__317;
  v23[4] = __Block_byref_object_dispose__318;
  v19 = v9;
  v24 = v19;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__CDMDataDispatcher_dispatchPreviousTurnTokenizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7B8;
  block[4] = &buf;
  block[5] = v25;
  block[6] = v23;
  dispatch_async(v20, block);

  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 136315138;
    v28 = "+[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched previousTurnTokenization data for SELF asynchronously.", v27, 0xCu);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchCorrectedUtteranceTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[7];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t v27[4];
  const char *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCorrectedUtteranceTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch correctedUtteranceTokenization data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__317;
  v32 = __Block_byref_object_dispose__318;
  v11 = v7;
  v33 = v11;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__317;
  v25[4] = __Block_byref_object_dispose__318;
  if (v12)
  {
    objc_msgSend(v12, "nlId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trpId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultCandidateId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v14, v15, v16, v17, v18);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__317;
  v23[4] = __Block_byref_object_dispose__318;
  v19 = v9;
  v24 = v19;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__CDMDataDispatcher_dispatchCorrectedUtteranceTokenizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7B8;
  block[4] = &buf;
  block[5] = v25;
  block[6] = v23;
  dispatch_async(v20, block);

  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 136315138;
    v28 = "+[CDMDataDispatcher dispatchCorrectedUtteranceTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched correctedUtteranceTokenization data for SELF asynchronously.", v27, 0xCu);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchContextUpdateData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[7];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t v27[4];
  const char *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch contextUpdate data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__317;
  v32 = __Block_byref_object_dispose__318;
  v11 = v7;
  v33 = v11;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__317;
  v25[4] = __Block_byref_object_dispose__318;
  if (v12)
  {
    objc_msgSend(v12, "nlId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trpId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultCandidateId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v14, v15, v16, v17, v18);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__317;
  v23[4] = __Block_byref_object_dispose__318;
  v19 = v9;
  v24 = v19;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__CDMDataDispatcher_dispatchContextUpdateData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB7B8;
  block[4] = &buf;
  block[5] = v25;
  block[6] = v23;
  dispatch_async(v20, block);

  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 136315138;
    v28 = "+[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched contextUpdate data for SELF asynchronously.", v27, 0xCu);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchSpanizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD aBlock[6];
  _QWORD block[8];
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t v35[4];
  const char *v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v26 = a4;
  v25 = a5;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch spanization data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__317;
  v40 = __Block_byref_object_dispose__318;
  v9 = v7;
  v41 = v9;
  v10 = v26;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__317;
  v33[4] = __Block_byref_object_dispose__318;
  if (v11)
  {
    objc_msgSend(v11, "nlId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trpId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resultCandidateId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v13, v14, v15, v16, v17);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v26;
  }
  else
  {
    v34 = 0;
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__317;
  v31[4] = __Block_byref_object_dispose__318;
  if (v10)
  {
    objc_msgSend(v10, "idA");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v32 = v18;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__317;
  v29[4] = __Block_byref_object_dispose__318;
  v19 = v25;
  v30 = v19;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAB858;
  block[4] = &buf;
  block[5] = v33;
  block[6] = v29;
  block[7] = v31;
  dispatch_async(v20, block);

  CDMOSLoggerForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v35 = 136315138;
    v36 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched spanization data for SELF asynchronously.", v35, 0xCu);
  }

  if (v12)
  {
    objc_msgSend(v12, "targetName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  aBlock[0] = v21;
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke_270;
  aBlock[3] = &unk_24DCAC118;
  aBlock[4] = &buf;
  aBlock[5] = v31;
  v24 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v24, v23, CFSTR("CDMDataDispatcher dispatched spanization data for FeatureStore asynchronously."));

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&buf, 8);

}

+ (void)dispatchSNLCData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchSNLCData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch SNLC data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__317;
  v26 = __Block_byref_object_dispose__318;
  v11 = v7;
  v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__317;
  v21[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__317;
  v19[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20 = v13;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "targetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDMDataDispatcher_dispatchSNLCData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  v17 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v17, v16, CFSTR("CDMDataDispatcher dispatched SNLC data for FeatureStore asynchronously."));

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchNLv4Data:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchNLv4Data:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch NLv4 data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__317;
  v26 = __Block_byref_object_dispose__318;
  v11 = v7;
  v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__317;
  v21[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__317;
  v19[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20 = v13;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "targetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDMDataDispatcher_dispatchNLv4Data_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  v17 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v17, v16, CFSTR("CDMDataDispatcher dispatched NLv4 data for FeatureStore asynchronously."));

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchPSCData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchPSCData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch PSC data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__317;
  v26 = __Block_byref_object_dispose__318;
  v11 = v7;
  v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__317;
  v21[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__317;
  v19[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20 = v13;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "targetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CDMDataDispatcher_dispatchPSCData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  v17 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v17, v16, CFSTR("CDMDataDispatcher dispatched PSC data for FeatureStore asynchronously."));

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchLVCData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchLVCData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch LVC data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__317;
  v26 = __Block_byref_object_dispose__318;
  v11 = v7;
  v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__317;
  v21[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__317;
  v19[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20 = v13;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "targetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CDMDataDispatcher_dispatchLVCData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  v17 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v17, v16, CFSTR("CDMDataDispatcher dispatched LVC data for FeatureStore asynchronously."));

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchMDData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchMDData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch mentionDetector data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__317;
  v26 = __Block_byref_object_dispose__318;
  v11 = v7;
  v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__317;
  v21[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__317;
  v19[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20 = v13;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "targetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CDMDataDispatcher_dispatchMDData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  v17 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v17, v16, CFSTR("CDMDataDispatcher dispatched mentionDetector data for FeatureStore asynchronously."));

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchMRData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchMRData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch mentionResolver data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__317;
  v26 = __Block_byref_object_dispose__318;
  v11 = v7;
  v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__317;
  v21[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__317;
  v19[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20 = v13;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "targetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CDMDataDispatcher_dispatchMRData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  v17 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v17, v16, CFSTR("CDMDataDispatcher dispatched mentionResolver data for FeatureStore asynchronously."));

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

+ (void)dispatchUaaPData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  dispatch_block_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[7];
  _QWORD v22[5];
  id v23;
  _QWORD block[6];
  _QWORD v25[5];
  id v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch UaaP data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__317;
  v30 = __Block_byref_object_dispose__318;
  v11 = v7;
  v31 = v11;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__317;
  v25[4] = __Block_byref_object_dispose__318;
  v12 = v8;
  v26 = v12;
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke;
  block[3] = &unk_24DCAC118;
  block[4] = &buf;
  block[5] = v25;
  v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v15, v14);

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__317;
  v22[4] = __Block_byref_object_dispose__318;
  if (v9)
  {
    objc_msgSend(v9, "idA");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v23 = v16;
  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "targetName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  aBlock[0] = v13;
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke_285;
  aBlock[3] = &unk_24DCAB7B8;
  aBlock[4] = &buf;
  aBlock[5] = v22;
  aBlock[6] = v25;
  v20 = _Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "insertFeatureStore:requester:debugLog:", v20, v19, CFSTR("CDMDataDispatcher dispatched UaaP data for FeatureStore asynchronously."));

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

void __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    CDMOSLoggerForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of UaaP data to disk", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "parserRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    +[CDMNluLogUtil writeUaaPRequestToDisk:error:](CDMNluLogUtil, "writeUaaPRequestToDisk:error:", v3, &v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;

    if (!v4)
    {
      CDMOSLoggerForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging UaaP request to file: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "parserResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    +[CDMNluLogUtil writeUaaPResponseToDisk:error:](CDMNluLogUtil, "writeUaaPResponseToDisk:error:", v7, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (!v8)
    {
      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
        v15 = 2112;
        v16 = v9;
        _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging UaaP response to file: %@", buf, 0x16u);
      }

    }
  }
}

void __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke_285(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of UaaP data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertUaaPDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "parserRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertUaaPParserRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertUaaPParserRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "parserResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertUaaPParserResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertUaaPParserResponseToFeatureStore:interactionId:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v10, 2u);
  }

}

void __59__CDMDataDispatcher_dispatchMRData_withResponse_requestId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = "+[CDMDataDispatcher dispatchMRData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of MR data to FeatureStore", (uint8_t *)&v11, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertMRDataToFeatureStore", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "mrRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertMRRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMRRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "response");
    v8 = objc_claimAutoreleasedReturnValue();
    +[CDMFeatureStoreUtils insertMRResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMRResponseToFeatureStore:interactionId:", v8, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = "+[CDMDataDispatcher dispatchMRData:withResponse:requestId:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s MR Service predicts nil response, no need to dispatch MRResponse", (uint8_t *)&v11, 0xCu);
    }
  }

  v9 = (id)CDMLogContext;
  v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v10, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v11, 2u);
  }

}

void __59__CDMDataDispatcher_dispatchMDData_withResponse_requestId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = "+[CDMDataDispatcher dispatchMDData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of MD data to FeatureStore", (uint8_t *)&v11, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertMDDataToFeatureStore", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "mdRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertMDRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMDRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "response");
    v8 = objc_claimAutoreleasedReturnValue();
    +[CDMFeatureStoreUtils insertMDResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMDResponseToFeatureStore:interactionId:", v8, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = "+[CDMDataDispatcher dispatchMDData:withResponse:requestId:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s MD Service predicts nil response, no need to dispatch MDResponse", (uint8_t *)&v11, 0xCu);
    }
  }

  v9 = (id)CDMLogContext;
  v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v10, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v11, 2u);
  }

}

void __60__CDMDataDispatcher_dispatchLVCData_withResponse_requestId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "+[CDMDataDispatcher dispatchLVCData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of LVC data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertLVCDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "parserRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertLVCRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertLVCRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "itfmResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertLVCResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertLVCResponseToFeatureStore:interactionId:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v10, 2u);
  }

}

void __60__CDMDataDispatcher_dispatchPSCData_withResponse_requestId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "+[CDMDataDispatcher dispatchPSCData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of PSC data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertPSCDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "parserRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertPSCRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "pscResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertPSCResponseToFeatureStore:interactionId:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v10, 2u);
  }

}

void __61__CDMDataDispatcher_dispatchNLv4Data_withResponse_requestId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "+[CDMDataDispatcher dispatchNLv4Data:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of NLv4 data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertNLv4DataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "parserRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertNLv4ParserRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "parserResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertNLv4ParserResponseToFeatureStore:interactionId:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v10, 2u);
  }

}

void __61__CDMDataDispatcher_dispatchSNLCData_withResponse_requestId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "+[CDMDataDispatcher dispatchSNLCData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of SNLC data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertSNLCDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "parserRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertSNLCRequestToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "snlcResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertSNLCResponseToFeatureStore:interactionId:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v10, 2u);
  }

}

void __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of Spanization data to SELF", buf, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchSpanizationData", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "spanMatchResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil matchingSpanEnded:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "matchingSpanEnded:metadata:logMessage:dataDispatcherContext:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("SELF MatchingSpan response message emitted"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cdm_span_match_response_%@.json"), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMNluLogUtil getLogBasePath](CDMNluLogUtil, "getLogBasePath");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "spanMatchResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    LOBYTE(v8) = +[CDMNluLogUtil saveSpanMatchResponseToProtobuf:protobufFile:error:](CDMNluLogUtil, "saveSpanMatchResponseToProtobuf:protobufFile:error:", v10, v9, &v15);
    v11 = v15;

    if ((v8 & 1) == 0)
    {
      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]_block_invoke";
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging span match result to file: %@", buf, 0x16u);
      }

    }
  }
  v13 = (id)CDMLogContext;
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v14, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", ", buf, 2u);
  }

}

void __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke_270(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of Spanization data to FeatureStore", (uint8_t *)&v9, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertSpanMatchResponseToFeatureStore", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "spanMatchResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertSpanMatchResponseToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v7 = (id)CDMLogContext;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v9, 2u);
  }

}

void __79__CDMDataDispatcher_dispatchContextUpdateData_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "+[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of ContextUpdate data to SELF", (uint8_t *)&v9, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchContextUpdateData", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "ctxUpdateResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil contextUpdateEnded:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "contextUpdateEnded:metadata:logMessage:dataDispatcherContext:", v6, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("SELF ContextUpdate response message emitted"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v7 = (id)CDMLogContext;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", ", (uint8_t *)&v9, 2u);
  }

}

void __96__CDMDataDispatcher_dispatchCorrectedUtteranceTokenizationData_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "+[CDMDataDispatcher dispatchCorrectedUtteranceTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of CorrectedUtteranceTokenization data to SELF", (uint8_t *)&v9, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchCorrectedUtteranceTokenizationData", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "responses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil tokenizationEndedWithMultiResponses:inputType:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "tokenizationEndedWithMultiResponses:inputType:metadata:logMessage:dataDispatcherContext:", v6, 3, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("SELF corrected user utterance Tokenization response message emitted"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v7 = (id)CDMLogContext;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", ", (uint8_t *)&v9, 2u);
  }

}

void __90__CDMDataDispatcher_dispatchPreviousTurnTokenizationData_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "+[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of PreviousTurnTokenization data to SELF", buf, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchPreviousTurnTokenizationData", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "previousSiriResponseTokenResponses");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "previousSiriResponseTokenResponses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "previousSiriResponseTokenResponses", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            +[CDMSELFLogUtil tokenizationEnded:inputType:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "tokenizationEnded:inputType:metadata:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), 2, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("SELF previous turn Siri response Tokenization response message emitted"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

    }
  }
  v16 = (id)CDMLogContext;
  v17 = v16;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", ", buf, 2u);
  }

}

void __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of CurrentTurnTokenization data to SELF", (uint8_t *)&v9, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchCurrentTurnTokenizationData", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "responses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil tokenizationEndedWithMultiResponses:inputType:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "tokenizationEndedWithMultiResponses:inputType:metadata:logMessage:dataDispatcherContext:", v6, 1, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("SELF current turn user utterance Tokenization response message emitted"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v7 = (id)CDMLogContext;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", ", (uint8_t *)&v9, 2u);
  }

}

void __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke_254(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of CurrentTurnTokenization data to FeatureStore", (uint8_t *)&v9, 0xCu);
  }

  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertTokenizerResponseToFeatureStore", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertTokenizerResponseToFeatureStore:interactionId:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v7 = (id)CDMLogContext;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", ", (uint8_t *)&v9, 2u);
  }

}

void __67__CDMDataDispatcher_dispatchCdmPreprocessingWrapperData_requestId___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertPreprocessingWrapperToFeatureStore", buf, 2u);
  }

  +[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertPreprocessingWrapperToFeatureStore:interactionId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", ", v7, 2u);
  }

}

void __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmResponseData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmEnded:metadata:logMessage:machAbsoluteTime:dataDispatcherContext:](CDMSELFLogUtil, "cdmEnded:metadata:logMessage:machAbsoluteTime:dataDispatcherContext:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("SELF CDM Request ended message emitted"), a1[7], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", v7, 2u);
  }

}

void __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke_247(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertResponseToFeatureStoreAsJson", buf, 2u);
  }

  +[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:](CDMFeatureStoreUtils, "insertResponseToFeatureStoreAsJson:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", ", v7, 2u);
  }

}

void __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmRequestData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:](CDMSELFLogUtil, "cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("SELF CDM Request started message emitted"), *(_QWORD *)(a1 + 64), -[objc_class getNLXSchemaCDMServiceGraphName](NSClassFromString(*(NSString **)(a1 + 32)), "getNLXSchemaCDMServiceGraphName"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", v7, 2u);
  }

}

void __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke_241(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertRequestToFeatureStoreAsJson", buf, 2u);
  }

  +[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:](CDMFeatureStoreUtils, "insertRequestToFeatureStoreAsJson:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", ", v7, 2u);
  }

}

void __67__CDMDataDispatcher_dispatchSELFRequestLink_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchSELFRequestLink", buf, 2u);
  }

  +[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:](CDMSELFLogUtil, "emitRequestLink:metadata:dataDispatcherContext:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", v7, 2u);
  }

}

void __43__CDMDataDispatcher_waitForQueueCompletion__block_invoke()
{
  NSLog(CFSTR("%s: all blocks in the background queue have been completed."), "+[CDMDataDispatcher waitForQueueCompletion]_block_invoke");
}

void __59__CDMDataDispatcher_insertFeatureStore_requester_debugLog___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
