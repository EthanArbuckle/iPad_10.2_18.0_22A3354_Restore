@implementation AMDJSRequestHandler

+ (int64_t)getActionCode:(id)a3
{
  id v3;
  void *v4;
  int64_t v6;
  id v7;
  id location[3];
  _QWORD v9[48];
  _QWORD v10[49];

  v10[48] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getActionCode__actionMap)
  {
    v9[0] = CFSTR("clear_user_data");
    v10[0] = &unk_1EA4CEFB0;
    v9[1] = CFSTR("data_replication");
    v10[1] = &unk_1EA4CEFC8;
    v9[2] = CFSTR("debug");
    v10[2] = &unk_1EA4CEFE0;
    v9[3] = CFSTR("fetch_biome_data");
    v10[3] = &unk_1EA4CEFF8;
    v9[4] = CFSTR("get_app_segment_data");
    v10[4] = &unk_1EA4CF010;
    v9[5] = CFSTR("get_app_tab_info");
    v10[5] = &unk_1EA4CF028;
    v9[6] = CFSTR("getModelPath");
    v10[6] = &unk_1EA4CF040;
    v9[7] = CFSTR("getVersion");
    v10[7] = &unk_1EA4CF058;
    v9[8] = CFSTR("log_metrics_data");
    v10[8] = &unk_1EA4CF070;
    v9[9] = CFSTR("coldstart_model_download");
    v10[9] = &unk_1EA4CF088;
    v9[10] = CFSTR("cms_download_status_handler");
    v10[10] = &unk_1EA4CF0A0;
    v9[11] = CFSTR("refresh_entity_table");
    v10[11] = &unk_1EA4CF0B8;
    v9[12] = CFSTR("refresh_odtp");
    v10[12] = &unk_1EA4CF0D0;
    v9[13] = CFSTR("refresh_on_device_taste_profile");
    v10[13] = &unk_1EA4CF0E8;
    v9[14] = CFSTR("run_inference");
    v10[14] = &unk_1EA4CF100;
    v9[15] = CFSTR("run_megadome_queries");
    v10[15] = &unk_1EA4CF118;
    v9[16] = CFSTR("run_pir_queries");
    v10[16] = &unk_1EA4CF130;
    v9[17] = CFSTR("run_pec_queries");
    v10[17] = &unk_1EA4CF148;
    v9[18] = CFSTR("sync");
    v10[18] = &unk_1EA4CF160;
    v9[19] = CFSTR("sync2");
    v10[19] = &unk_1EA4CF160;
    v9[20] = CFSTR("unsigned_sync");
    v10[20] = &unk_1EA4CF178;
    v9[21] = CFSTR("run_batched_sql_queries");
    v10[21] = &unk_1EA4CF190;
    v9[22] = CFSTR("run_custom_aggregator");
    v10[22] = &unk_1EA4CF1A8;
    v9[23] = CFSTR("aggregateCrashes");
    v10[23] = &unk_1EA4CF1C0;
    v9[24] = CFSTR("aggregateInstalls");
    v10[24] = &unk_1EA4CF1D8;
    v9[25] = CFSTR("save_appstore_events");
    v10[25] = &unk_1EA4CF1F0;
    v9[26] = CFSTR("aggregateLaunches");
    v10[26] = &unk_1EA4CF208;
    v9[27] = CFSTR("save_crash");
    v10[27] = &unk_1EA4CF220;
    v9[28] = CFSTR("save_install");
    v10[28] = &unk_1EA4CF238;
    v9[29] = CFSTR("save_launches");
    v10[29] = &unk_1EA4CF250;
    v9[30] = CFSTR("save_model_urls");
    v10[30] = &unk_1EA4CF268;
    v9[31] = CFSTR("savePIRData");
    v10[31] = &unk_1EA4CF280;
    v9[32] = CFSTR("saveStreamData");
    v10[32] = &unk_1EA4CF298;
    v9[33] = CFSTR("save_uninstall");
    v10[33] = &unk_1EA4CF2B0;
    v9[34] = CFSTR("sqliteDeleteRows");
    v10[34] = &unk_1EA4CF2C8;
    v9[35] = CFSTR("sqliteInsertRows");
    v10[35] = &unk_1EA4CF2E0;
    v9[36] = CFSTR("sqliteUpdateTables");
    v10[36] = &unk_1EA4CF2F8;
    v9[37] = CFSTR("test_inference");
    v10[37] = &unk_1EA4CF310;
    v9[38] = CFSTR("truncate_sqlite_tables");
    v10[38] = &unk_1EA4CF328;
    v9[39] = CFSTR("filter_fitcored_catalog");
    v10[39] = &unk_1EA4CF340;
    v9[40] = CFSTR("query_workout_references");
    v10[40] = &unk_1EA4CF358;
    v9[41] = CFSTR("fetch_fitness_catalog");
    v10[41] = &unk_1EA4CF370;
    v9[42] = CFSTR("fetch_bootstrap_fitness_catalog");
    v10[42] = &unk_1EA4CF388;
    v9[43] = CFSTR("insert_vectors");
    v10[43] = &unk_1EA4CF3A0;
    v9[44] = CFSTR("clear_vector_db");
    v10[44] = &unk_1EA4CF3B8;
    v9[45] = CFSTR("create_vector_db");
    v10[45] = &unk_1EA4CF3D0;
    v9[46] = CFSTR("search_vector_db");
    v10[46] = &unk_1EA4CF3E8;
    v9[47] = CFSTR("delete_vector_db");
    v10[47] = &unk_1EA4CF400;
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 48);
    v4 = (void *)getActionCode__actionMap;
    getActionCode__actionMap = (uint64_t)v3;

  }
  v7 = (id)objc_msgSend((id)getActionCode__actionMap, "objectForKey:", location[0]);
  if (v7)
    v6 = objc_msgSend(v7, "unsignedIntValue");
  else
    v6 = 0;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)getVersion
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18[3];
  _QWORD v19[7];
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  v18[2] = a1;
  v18[1] = (id)a2;
  v18[0] = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  v15 = 0;
  v13 = 0;
  v11 = 0;
  if ((objc_msgSend(v18[0], "isUsable") & 1) != 0)
  {
    v16 = (id)objc_msgSend(v18[0], "getDataSchema");
    v15 = 1;
    v14 = (id)objc_msgSend(v16, "getVersion");
    v13 = 1;
    v2 = v14;
  }
  else
  {
    v12 = (id)objc_msgSend(v18[0], "connectionState");
    v11 = 1;
    v2 = v12;
  }
  v17 = v2;
  if ((v11 & 1) != 0)

  if ((v13 & 1) != 0)
  if ((v15 & 1) != 0)

  v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (id)objc_msgSend(v4, "infoDictionary");

  v19[0] = CFSTR("AMDVersion");
  v20[0] = &unk_1EA4D1E38;
  v19[1] = CFSTR("Description");
  v20[1] = CFSTR("AMDVectorDBImplementation");
  v19[2] = CFSTR("SchemaVersion");
  v20[2] = v17;
  v19[3] = CFSTR("CFBundleInfoDictionaryVersion");
  v9 = (id)objc_msgSend(v10, "objectForKey:");
  v20[3] = v9;
  v19[4] = CFSTR("CFBundleNumericVersion");
  v8 = (id)objc_msgSend(v10, "objectForKey:");
  v20[4] = v8;
  v19[5] = CFSTR("DTPlatformBuild");
  v7 = (id)objc_msgSend(v10, "objectForKey:");
  v20[5] = v7;
  v19[6] = CFSTR("DTPlatformVersion");
  v5 = (id)objc_msgSend(v10, "objectForKey:");
  v20[6] = v5;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  return v6;
}

+ (void)handlePayload:(id)a3 ForAsyncOperation:(id)a4
{
  id v4;
  id v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  os_log_type_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[2];
  id v33;
  uint8_t v34[48];
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  +[AMDPerf provision](AMDPerf, "provision");
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("JSHandlerAsync"));
  v29 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("data"));
  v28 = 0;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v29);
  v26 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("action"));
  if (!v26)
  {
    objc_storeStrong(&v28, CFSTR("No action"));
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v28);
    v5 = v30;
    v30 = v4;

    v25 = MEMORY[0x1E0C81028];
    v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v28);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v25, v24, "%@", v35, 0xCu);
    }
    objc_storeStrong(&v25, 0);
    objc_msgSend(v33, "logMetrics:", v30);
    (*((void (**)(id, _QWORD, id))v31 + 2))(v31, 0, v30);
  }
  v23 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("osBuildNumber"));
  v22 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("storefrontId"));
  v21 = 0;
  v20 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("verbosityLevel"));
  if (v20)
    v21 = objc_msgSend(v20, "intValue");
  else
    v21 = 0;
  v19 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("loggingProbability"));
  if (v19)
  {
    objc_msgSend(v19, "doubleValue");
    if (v6 > 1.0 || (objc_msgSend(v19, "doubleValue"), v7 < 0.0))
      objc_storeStrong(&v19, 0);
  }
  +[AMDFrameworkMetrics provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:](AMDFrameworkMetrics, "provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:", (char)v21, v26, &unk_1EA4D1E38, v23, v22, v19);
  objc_msgSend(v33, "getActionCode:", v26);
  v18 = objc_msgSend(v33, "getActionCode:", v26);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v17 = (id)objc_msgSend(v10, "UUIDString");

  v16 = 0;
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v17, CFSTR("callUUID"), 0);
  v15 = MEMORY[0x1E0C81028];
  v14 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_4_8_64_8_64_4_0_8_64((uint64_t)v34, (uint64_t)v17, (uint64_t)v26, v18, (uint64_t)CFSTR("__defaultTreatment"));
    _os_log_impl(&dword_1DC678000, (os_log_t)v15, v14, "Async JS handler call %@: action: %@, code:%d, treatment: %@", v34, 0x26u);
  }
  objc_storeStrong(&v15, 0);
  +[AMDMiscHelpers AMDInitialize:](AMDMiscHelpers, "AMDInitialize:", v27);
  v13 = MEMORY[0x1E0C9AA70];
  if ((unint64_t)(v18 - 37) <= 5)
    __asm { BR              X8 }
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid action: %@"), v26);
  v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v12);
  v9 = v30;
  v30 = v8;

  (*((void (**)(id, id, id))v31 + 2))(v31, v13, v30);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("JSHandlerAsync"));
  objc_msgSend(*(id *)(a1 + 48), "logMetrics:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("JSHandlerAsync"));
  objc_msgSend(*(id *)(a1 + 48), "logMetrics:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  id v8;
  char v9;
  id v10[2];
  id v11;
  id location[2];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = (id)a1;
  if (v11)
  {
    v10[0] = MEMORY[0x1E0C81028];
    v9 = 16;
    if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_ERROR))
    {
      log = v10[0];
      type = v9;
      v5 = (id)objc_msgSend(v11, "localizedDescription");
      v8 = v5;
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v8);
      _os_log_error_impl(&dword_1DC678000, log, type, "Data fetch from fitcored failed with error: %@", v13, 0xCu);

      objc_storeStrong(&v8, 0);
    }
    objc_storeStrong(v10, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("JSHandlerAsync"));
  objc_msgSend(*(id *)(a1 + 40), "logMetrics:", v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_300(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("JSHandlerAsync"));
  objc_msgSend(*(id *)(a1 + 40), "logMetrics:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (void)handlePayload:(id)a3 withCompletionHandler:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *log;
  os_log_type_t type;
  id v15;
  id v16;
  uint8_t v17[7];
  char v18;
  id v19;
  uint8_t v20[15];
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t v28[7];
  char v29;
  id v30;
  id v31;
  id location[2];
  id v33;

  v33 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = MEMORY[0x1E0C81028];
  v29 = 1;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
  {
    log = v30;
    type = v29;
    __os_log_helper_16_0_0(v28);
    _os_log_impl(&dword_1DC678000, log, type, "Entered top-level event handler", v28, 2u);
  }
  objc_storeStrong(&v30, 0);
  v27 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("data"));
  v26 = 0;
  v25 = 0;
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_storeStrong(&v25, CFSTR("Missing or invalid payload data"));
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v25);
    v5 = v26;
    v26 = v4;

    (*((void (**)(id, _QWORD, id))v31 + 2))(v31, 0, v26);
  }
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v24 = (id)objc_msgSend(v6, "initWithDictionary:", v27);
  v23 = (id)objc_msgSend(v24, "objectForKey:", CFSTR("jsHandlerType"));
  if (v23 && (objc_msgSend(v23, "isEqualToString:", CFSTR("async")) & 1) != 0)
  {
    v22 = MEMORY[0x1E0C81028];
    v21 = 2;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      v10 = v22;
      v11 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_debug_impl(&dword_1DC678000, v10, v11, "Async handler invoked", v20, 2u);
    }
    objc_storeStrong(&v22, 0);
    objc_msgSend(v33, "handlePayload:ForAsyncOperation:", location[0], v31);
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v18 = 2;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      v8 = v19;
      v9 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_debug_impl(&dword_1DC678000, v8, v9, "Synchronous handler invoked", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    v15 = v26;
    v7 = (id)objc_msgSend(v33, "handlePayload:error:", location[0], &v15);
    objc_storeStrong(&v26, v15);
    v16 = v7;
    (*((void (**)(id, id, id))v31 + 2))(v31, v7, v26);
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

+ (id)handlePayload:(id)a3 error:(id *)a4
{
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  id v21;
  const __CFString *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  os_log_type_t v33;
  os_log_t v34;
  id v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  id v39;
  id v40;
  char v41;
  os_log_type_t v42;
  os_log_t v43;
  os_log_type_t v44;
  os_log_t v45;
  int v46;
  id v47;
  id v48;
  int v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  os_log_type_t type;
  os_log_t oslog;
  id v62;
  id v63;
  char v64;
  uint64_t v65;
  id *v66;
  id location[2];
  id v68;
  id v69;
  _QWORD v70[2];
  _QWORD v71[2];
  const __CFString *v72;
  id v73;
  uint8_t v74[16];
  uint8_t v75[48];
  uint8_t v76[16];
  uint8_t v77[16];
  uint8_t v78[24];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v68 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v66 = a4;
  +[AMDPerf provision](AMDPerf, "provision");
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("JSHandler"));
  v65 = 0;
  v64 = 0;
  v63 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("data"));
  v62 = 0;
  if (v63)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v63);
      v57 = (id)objc_msgSend(v58, "objectForKey:", CFSTR("storefrontId"));
      v56 = (id)objc_msgSend(v58, "objectForKey:", CFSTR("dsid"));
      v55 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("action"));
      v54 = (id)objc_msgSend(v58, "objectForKey:", CFSTR("treatmentId"));
      v53 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("osBuildNumber"));
      v52 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("bypassUserChecks"));
      v51 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("populatePerformanceDict"));
      v50 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("returnOutputAsString"));
      v49 = 0;
      v48 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("verbosityLevel"));
      if (v48)
        v49 = objc_msgSend(v48, "intValue");
      else
        v49 = 0;
      v47 = (id)objc_msgSend(v58, "objectForKey:", CFSTR("loggingProbability"));
      if (v47)
      {
        objc_msgSend(v47, "doubleValue");
        if (v4 > 1.0 || (objc_msgSend(v47, "doubleValue", v4), v5 < 0.0))
          objc_storeStrong(&v47, 0);
      }
      +[AMDFrameworkMetrics provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:](AMDFrameworkMetrics, "provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:", (char)v49, v55, &unk_1EA4D1E38, v53, v57, v47);
      v46 = 0;
      if (!v52 || (objc_msgSend(v52, "BOOLValue") & 1) == 0)
      {
        if (!v56 || !v57)
        {
          v6 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing storefrontId (%@)or userId (%@)"), v57, v56);
          v7 = v62;
          v62 = v6;

          v26 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v62);
          *v66 = v26;
          v45 = (os_log_t)MEMORY[0x1E0C81028];
          v44 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)v62);
            _os_log_error_impl(&dword_1DC678000, v45, v44, "%@", v77, 0xCu);
          }
          objc_storeStrong((id *)&v45, 0);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v62, CFSTR("frameworkError"), 0);
          v69 = 0;
          v59 = 1;
LABEL_61:
          objc_storeStrong(&v47, 0);
          objc_storeStrong(&v48, 0);
          objc_storeStrong(&v50, 0);
          objc_storeStrong(&v51, 0);
          objc_storeStrong(&v52, 0);
          objc_storeStrong(&v53, 0);
          objc_storeStrong(&v54, 0);
          objc_storeStrong(&v55, 0);
          objc_storeStrong(&v56, 0);
          objc_storeStrong(&v57, 0);
          objc_storeStrong(&v58, 0);
          goto LABEL_62;
        }
        objc_msgSend(v58, "setObject:forKey:", v56, CFSTR("userId"));
        v46 = objc_msgSend(v57, "intValue");
      }
      if (v55)
      {
        v41 = 0;
        v24 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("enablePerformance"));

        if (v24)
        {
          v23 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("enablePerformance"));
          v41 = objc_msgSend(v23, "BOOLValue") & 1;

        }
        else
        {
          v41 = 1;
        }
        +[AMDPerf enable:](AMDPerf, "enable:", v41 & 1);
        +[AMDPerf setVerbosity:](AMDPerf, "setVerbosity:", (char)v49);
        if (!v54
          && (objc_msgSend(v55, "isEqualToString:", CFSTR("run_inference")) & 1) == 0
          && (objc_msgSend(v55, "isEqualToString:", CFSTR("get_app_segment_data")) & 1) == 0)
        {
          objc_storeStrong(&v54, CFSTR("__defaultTreatment"));
          objc_msgSend(v58, "setObject:forKey:", v54, CFSTR("treatmentId"));
        }
        if (v54)
          v22 = (const __CFString *)v54;
        else
          v22 = CFSTR("__defaultTreatment");
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v22, CFSTR("treatmentId"), 0);
        v21 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
        v40 = (id)objc_msgSend(v21, "UUIDString");

        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v40, CFSTR("callUUID"), 0);
        v39 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("bridgeAppVersion"));
        if (v39)
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v39, CFSTR("bridgeAppVersion"), 0);
        v65 = objc_msgSend(v68, "getActionCode:", v55);
        v38 = (os_log_t)MEMORY[0x1E0C81028];
        v37 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          if (v54)
            v20 = (const __CFString *)v54;
          else
            v20 = CFSTR("__defaultTreatment");
          __os_log_helper_16_2_4_8_64_8_64_4_0_8_64((uint64_t)v75, (uint64_t)v40, (uint64_t)v55, v65, (uint64_t)v20);
          _os_log_impl(&dword_1DC678000, v38, v37, "Synchronous JS handler call %@: action: %@, code:%d, treatment: %@", v75, 0x26u);
        }
        objc_storeStrong((id *)&v38, 0);
        +[AMDMiscHelpers AMDInitialize:](AMDMiscHelpers, "AMDInitialize:", v58);
        v36 = MEMORY[0x1E0C9AA70];
        if ((unint64_t)(v65 - 1) <= 0x2E)
          __asm { BR              X8 }
        v35 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid action: %@"), v55);
        v19 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v35);
        *v66 = v19;
        objc_storeStrong(&v35, 0);
        +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("JSHandler"));
        if (*v66)
        {
          v34 = (os_log_t)MEMORY[0x1E0C81028];
          v33 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v18 = (id)objc_msgSend(*v66, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v18);
            _os_log_error_impl(&dword_1DC678000, v34, v33, "JS handler error: %@", v74, 0xCu);

          }
          objc_storeStrong((id *)&v34, 0);
          v72 = CFSTR("JSHandlerError");
          v17 = (id)objc_msgSend(*v66, "localizedDescription");
          v73 = v17;
          v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
          v9 = v36;
          v36 = v8;

          v16 = (id)objc_msgSend(*v66, "localizedDescription");
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

          *v66 = 0;
        }
        v32 = 0;
        if (v51)
        {
          v10 = +[AMDPerf generatePerformanceDict](AMDPerf, "generatePerformanceDict");
          v11 = v32;
          v32 = v10;

        }
        v70[0] = CFSTR("response");
        if (v36)
          v15 = v36;
        else
          v15 = (id)MEMORY[0x1E0C9AA70];
        v71[0] = v15;
        v70[1] = CFSTR("perfDict");
        if (v32)
          v14 = v32;
        else
          v14 = (id)MEMORY[0x1E0C9AA70];
        v71[1] = v14;
        v31 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
        if (v50 && (objc_msgSend(v50, "BOOLValue") & 1) == 1)
        {
          v30 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v31, 0, v66);
          v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v30, 4);
          v69 = v29;
          v59 = 1;
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
        }
        else
        {
          v69 = v31;
          v59 = 1;
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v36, 0);
        objc_storeStrong(&v39, 0);
        objc_storeStrong(&v40, 0);
      }
      else
      {
        objc_storeStrong(&v62, CFSTR("No action"));
        v25 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v62);
        *v66 = v25;
        v43 = (os_log_t)MEMORY[0x1E0C81028];
        v42 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v62);
          _os_log_error_impl(&dword_1DC678000, v43, v42, "%@", v76, 0xCu);
        }
        objc_storeStrong((id *)&v43, 0);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v62, CFSTR("frameworkError"), 0);
        v69 = 0;
        v59 = 1;
      }
      goto LABEL_61;
    }
  }
  objc_storeStrong(&v62, CFSTR("Missing or invalid payload data"));
  v27 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v62);
  *v66 = v27;
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v62);
    _os_log_error_impl(&dword_1DC678000, oslog, type, "%@", v78, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  +[AMDFrameworkMetrics provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:](AMDFrameworkMetrics, "provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:", 0, 0, 0, 0, 0);
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v62, CFSTR("frameworkError"), 0);
  v69 = 0;
  v59 = 1;
LABEL_62:
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  v13 = v59;
  objc_msgSend(v68, "logMetrics:", *v66);
  if ((v64 & 1) != 0)
    objc_exception_rethrow();
  v59 = v13;
  if (v13 == 3)
  {
    __break(1u);
    JUMPOUT(0x1DC72A6B8);
  }
  objc_storeStrong(location, 0);
  return v69;
}

+ (void)wrapUp
{
  NSObject *log;
  os_log_type_t type;
  os_log_t oslog;
  uint8_t v5[15];
  char v6;
  id location;
  int v8;
  sqlite3 *v9;
  id v10[3];
  uint8_t v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10[2] = a1;
  v10[1] = (id)a2;
  v10[0] = +[AMDSQLite getSharedInstanceWithOption:](AMDSQLite, "getSharedInstanceWithOption:", 0);
  if (v10[0])
  {
    v9 = (sqlite3 *)objc_msgSend(v10[0], "getDb");
    if (v9)
    {
      v8 = sqlite3_close_v2(v9);
      if (v8)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v11, v8);
          _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "SQLITE: Error closing db: %d", v11, 8u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      else
      {
        location = MEMORY[0x1E0C81028];
        v6 = 16;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
        {
          log = location;
          type = v6;
          __os_log_helper_16_0_0(v5);
          _os_log_error_impl(&dword_1DC678000, log, type, "SQLITE: DB closed", v5, 2u);
        }
        objc_storeStrong(&location, 0);
      }
    }
  }
  objc_storeStrong(v10, 0);
}

+ (void)logMetrics:(id)a3
{
  id v3;
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v4 = (id)objc_msgSend(location[0], "localizedDescription");
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

  }
  v3 = +[AMDPerf generatePerformanceDict](AMDPerf, "generatePerformanceDict");
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

  +[AMDFrameworkMetrics flush](AMDFrameworkMetrics, "flush");
  objc_storeStrong(location, 0);
}

@end
