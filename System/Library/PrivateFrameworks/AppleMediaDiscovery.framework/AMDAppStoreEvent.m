@implementation AMDAppStoreEvent

+ (signed)getEventType:(id)a3
{
  signed __int16 v4;
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventType__eventTypeMap_0)
    objc_storeStrong((id *)&getEventType__eventTypeMap_0, &unk_1EA4D0E70);
  v5 = (id)objc_msgSend((id)getEventType__eventTypeMap_0, "objectForKey:", location[0]);
  if (v5)
    v4 = objc_msgSend(v5, "unsignedIntValue");
  else
    v4 = 2;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (unsigned)saveEvent:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v13;
  os_log_type_t v14;
  os_log_t oslog;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[2];
  __int16 v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  os_log_type_t v39;
  id v40;
  id v41;
  __int16 v42;
  int v43;
  os_log_type_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id *v52;
  id v53;
  id location[2];
  id v55;
  unsigned int v56;
  uint8_t v57[16];
  uint8_t v58[16];
  uint8_t v59[24];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v55 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = 0;
  objc_storeStrong(&v53, a4);
  v52 = a5;
  v51 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("adamId"));
  v50 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("time"));
  v49 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("type"));
  v48 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("source"));
  v47 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("usecase"));
  if (v51 && v50 && v49 && v48 && v47 && v53)
  {
    v42 = objc_msgSend(v55, "getEventType:", v49);
    if (v42 == 2)
    {
      v41 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid appstore event type."));
      v40 = MEMORY[0x1E0C81028];
      v39 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v41);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v40, v39, "%@", v58, 0xCu);
      }
      objc_storeStrong(&v40, 0);
      v9 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v41);
      *v52 = v9;
      v56 = 0;
      v43 = 1;
      objc_storeStrong(&v41, 0);
    }
    else
    {
      v32 = 0;
      v33 = &v32;
      v34 = 838860800;
      v35 = 48;
      v36 = __Block_byref_object_copy__7;
      v37 = __Block_byref_object_dispose__7;
      v38 = 0;
      v31 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
      v30 = (id)objc_msgSend(v31, "getManagedObjectContext");
      v8 = v30;
      v16 = MEMORY[0x1E0C809B0];
      v17 = -1073741824;
      v18 = 0;
      v19 = __44__AMDAppStoreEvent_saveEvent_forUser_error___block_invoke;
      v20 = &unk_1EA4B5900;
      v21 = v30;
      v22 = v50;
      v23 = v51;
      v29 = v42;
      v24 = v48;
      v25 = v47;
      v26 = v53;
      v27 = v31;
      v28[1] = &v32;
      v28[0] = v49;
      objc_msgSend(v8, "performBlockAndWait:", &v16);
      if (v33[5])
      {
        v7 = objc_retainAutorelease((id)v33[5]);
        *v52 = v7;
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        v14 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v6 = (id)objc_msgSend(*v52, "localizedDescription");
          v13 = v6;
          __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v13);
          _os_log_error_impl(&dword_1DC678000, oslog, v14, "Error saving appstore event: %@", v57, 0xCu);

          objc_storeStrong(&v13, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        v56 = 0;
        v43 = 1;
      }
      else
      {
        v56 = 1;
        v43 = 1;
      }
      objc_storeStrong(v28, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      _Block_object_dispose(&v32, 8);
      objc_storeStrong(&v38, 0);
    }
  }
  else
  {
    v46 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incomplete AppStore event."));
    v45 = MEMORY[0x1E0C81028];
    v44 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v46);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v45, v44, "%@", v59, 0xCu);
    }
    objc_storeStrong(&v45, 0);
    v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v46);
    *v52 = v10;
    v56 = 0;
    v43 = 1;
    objc_storeStrong(&v46, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  return v56;
}

void __44__AMDAppStoreEvent_saveEvent_forUser_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id *location;
  id v7;
  int v8;
  id v9;
  id v10[3];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10[2] = (id)a1;
  v10[1] = (id)a1;
  v2 = (void *)MEMORY[0x1E0C97B20];
  v4 = (id)+[AMDAppStoreEvent entity](AMDAppStoreEvent, "entity");
  v3 = (id)objc_msgSend(v4, "name");
  v10[0] = (id)objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:");

  objc_msgSend(v10[0], "setEventTimeMillis:", objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));
  objc_msgSend(v10[0], "setAdamId:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v10[0], "setEventType:", *(__int16 *)(a1 + 104));
  objc_msgSend(v10[0], "setSourceSwoosh:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v10[0], "setUsecase:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v10[0], "setUserId:", *(_QWORD *)(a1 + 72));
  v1 = *(void **)(a1 + 80);
  location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v9 = *location;
  objc_msgSend(v1, "save:", &v9);
  objc_storeStrong(location, v9);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    v8 = 1;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, *(_QWORD *)(a1 + 88));
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v7, OS_LOG_TYPE_DEBUG, "Saved event of type %@", v11, 0xCu);
    }
    objc_storeStrong(&v7, 0);
    v8 = 0;
  }
  objc_storeStrong(v10, 0);
}

+ (id)retrieveEventsOfType:(id)a3 inPeriod:(id)a4 forUser:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id *v36;
  id v37;
  id v38;
  id location[2];
  id v40;
  id v41;

  v40 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = a6;
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("ImpressionEventsRetrieval"));
  v29 = 0;
  v30 = &v29;
  v31 = 838860800;
  v32 = 48;
  v33 = __Block_byref_object_copy__7;
  v34 = __Block_byref_object_dispose__7;
  v35 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 838860800;
  v25 = 48;
  v26 = __Block_byref_object_copy__7;
  v27 = __Block_byref_object_dispose__7;
  v28 = 0;
  v8 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v21 = (id)objc_msgSend(v8, "getManagedObjectContext");

  v7 = v21;
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __64__AMDAppStoreEvent_retrieveEventsOfType_inPeriod_forUser_error___block_invoke;
  v16 = &unk_1EA4B5928;
  v17 = v38;
  v18 = location[0];
  v20[3] = v40;
  v20[1] = &v29;
  v19 = v37;
  v20[2] = &v22;
  v20[0] = v21;
  objc_msgSend(v7, "performBlockAndWait:", &v12);
  if (v30[5])
  {
    *v36 = objc_retainAutorelease((id)v30[5]);
    v41 = 0;
  }
  else
  {
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("ImpressionEventsRetrieval"));
    v41 = (id)v23[5];
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  _Block_object_dispose(&v29, 8);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  return v41;
}

void __64__AMDAppStoreEvent_retrieveEventsOfType_inPeriod_forUser_error___block_invoke(uint64_t a1)
{
  double v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  id v22;
  uint8_t v23[7];
  char v24;
  id v25;
  int v26;
  os_log_type_t v27;
  id location;
  id v29;
  __int16 v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  id v34[3];
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v34[2] = (id)a1;
  v34[1] = (id)a1;
  v16 = (void *)MEMORY[0x1E0C97B48];
  v18 = (id)+[AMDAppStoreEvent entity](AMDAppStoreEvent, "entity");
  v17 = (id)objc_msgSend(v18, "name");
  v34[0] = (id)objc_msgSend(v16, "fetchRequestWithEntityName:");

  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v19, "timeIntervalSince1970");
  v20 = (unint64_t)v1;

  v33 = v20;
  v32 = 0;
  v32 = 1000 * (v20 - 86400 * (__int16)objc_msgSend(*(id *)(a1 + 32), "shortValue"));
  v31 = 0;
  if (!*(_QWORD *)(a1 + 40))
  {
    v25 = MEMORY[0x1E0C81028];
    v24 = 1;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
    {
      v14 = v25;
      v15 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1DC678000, v14, v15, "No appstore event type provided in request", v23, 2u);
    }
    objc_storeStrong(&v25, 0);
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("eventTimeMillis >= %ull && userId == %@"), v32, *(_QWORD *)(a1 + 48));
    v8 = v31;
    v31 = v7;

    goto LABEL_10;
  }
  v30 = 0;
  v30 = objc_msgSend(*(id *)(a1 + 80), "getEventType:", *(_QWORD *)(a1 + 40));
  if (v30 != 2)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("eventTimeMillis >= %ull && eventType == %d && userId == %@"), v32, v30, *(_QWORD *)(a1 + 48));
    v6 = v31;
    v31 = v5;

LABEL_10:
    objc_msgSend(v34[0], "setResultType:", 2);
    objc_msgSend(v34[0], "setPredicate:", v31);
    v9 = *(void **)(a1 + 56);
    v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v22 = *v12;
    v13 = (id)objc_msgSend(v9, "executeFetchRequest:error:", v34[0], &v22);
    objc_storeStrong(v12, v22);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v13;

    v26 = 0;
    goto LABEL_11;
  }
  v29 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown AppStore event type provided"));
  location = MEMORY[0x1E0C81028];
  v27 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v29);
    _os_log_error_impl(&dword_1DC678000, (os_log_t)location, v27, "%@", v35, 0xCu);
  }
  objc_storeStrong(&location, 0);
  v2 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v29);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v26 = 1;
  objc_storeStrong(&v29, 0);
LABEL_11:
  objc_storeStrong(&v31, 0);
  objc_storeStrong(v34, 0);
}

+ (id)deleteEventsOlderThan:(unint64_t)a3 error:(id *)a4
{
  double v4;
  id v6;
  void *v7;
  id location;
  id v9[2];
  id *v10;
  unint64_t v11;
  SEL v12;
  id v13;
  id v14;

  v13 = a1;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("ImpressionEventsScrub"));
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v6, "timeIntervalSince1970");
  v7 = (void *)((v4 - (double)(86400 * v11)) * 1000.0);

  v9[1] = v7;
  v9[0] = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("eventTimeMillis < %llu"), v7);
  location = (id)objc_msgSend(v13, "deleteEventsForPredicate:error:", v9[0], v10);
  if (*v10)
  {
    v14 = 0;
  }
  else
  {
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("ImpressionEventsScrub"));
    v14 = location;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);
  return v14;
}

+ (id)deleteEventsForPredicate:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *);
  void *v11;
  id v12;
  id v13;
  id v14[3];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id *v31;
  id location[3];
  id v33;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = __Block_byref_object_copy__7;
  v29 = __Block_byref_object_dispose__7;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __51__AMDAppStoreEvent_deleteEventsForPredicate_error___block_invoke;
  v11 = &unk_1EA4B51C0;
  v12 = location[0];
  v13 = v15;
  v14[1] = &v24;
  v14[0] = v16;
  v14[2] = &v17;
  objc_msgSend(v5, "performBlockAndWait:", &v7);
  if (v25[5])
  {
    *v31 = objc_retainAutorelease((id)v25[5]);
    v33 = 0;
  }
  else
  {
    v33 = (id)v18[5];
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v33;
}

void __51__AMDAppStoreEvent_deleteEventsForPredicate_error___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id *location;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18[3];

  v18[2] = a1;
  v18[1] = a1;
  v9 = (void *)MEMORY[0x1E0C97B48];
  v11 = (id)+[AMDAppStoreEvent entity](AMDAppStoreEvent, "entity");
  v10 = (id)objc_msgSend(v11, "name");
  v18[0] = (id)objc_msgSend(v9, "fetchRequestWithEntityName:");

  if (a1[4])
    objc_msgSend(v18[0], "setPredicate:", a1[4]);
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v18[0]);
  objc_msgSend(v17, "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v15 = *location;
  v8 = (id)objc_msgSend(v1, "executeRequest:error:", v17, &v15);
  objc_storeStrong(location, v15);
  v16 = v8;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v14 = 1;
  }
  else
  {
    v2 = (void *)a1[6];
    v6 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
    v13 = *v6;
    objc_msgSend(v2, "save:", &v13);
    objc_storeStrong(v6, v13);
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      v14 = 1;
    }
    else
    {
      v3 = (id)objc_msgSend(v16, "result");
      v4 = *(_QWORD *)(a1[8] + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      v14 = 0;
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)deleteEventsForUser:(id)a3 error:(id *)a4
{
  id v6;
  id v7[2];
  id location[2];
  id v9;
  id v10;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("userId == %@"), location[0]);
  v6 = (id)objc_msgSend(v9, "deleteEventsForPredicate:error:", v7[0], a4);
  if (*a4)
    v10 = 0;
  else
    v10 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)fetchEvents:(id *)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *);
  void *v10;
  id v11[3];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id *v27;
  SEL v28;
  id v29;
  id v30;

  v29 = a1;
  v28 = a2;
  v27 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 838860800;
  v23 = 48;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  v5 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v5, "getManagedObjectContext");

  v4 = v12;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __32__AMDAppStoreEvent_fetchEvents___block_invoke;
  v10 = &unk_1EA4B5238;
  v11[1] = &v13;
  v11[0] = v12;
  v11[2] = &v20;
  objc_msgSend(v4, "performBlockAndWait:", &v6);
  if (v21[5])
  {
    *v27 = objc_retainAutorelease((id)v21[5]);
    v30 = 0;
  }
  else
  {
    v30 = (id)v14[5];
  }
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v12, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  return v30;
}

void __32__AMDAppStoreEvent_fetchEvents___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id *location;
  id v9;
  id v10;
  id v11[3];

  v11[2] = a1;
  v11[1] = a1;
  v4 = (void *)MEMORY[0x1E0C97B48];
  v6 = (id)+[AMDAppStoreEvent entity](AMDAppStoreEvent, "entity");
  v5 = (id)objc_msgSend(v6, "name");
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  objc_msgSend(v11[0], "setResultType:", 2);
  v1 = (void *)a1[4];
  location = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v10 = *location;
  v9 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v11[0], &v10);
  objc_storeStrong(location, v10);
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (id)deleteAllEvents:(id *)a3
{
  id location;
  id *v5;
  SEL v6;
  id v7;
  id v8;

  v7 = a1;
  v6 = a2;
  v5 = a3;
  location = (id)objc_msgSend(a1, "deleteEventsForPredicate:error:", 0, a3);
  if (*v5)
    v8 = 0;
  else
    v8 = location;
  objc_storeStrong(&location, 0);
  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDAppStoreEvent"), a2, a1);
}

@end
