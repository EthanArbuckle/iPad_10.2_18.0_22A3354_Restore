@implementation AMDWorkflow

+ (void)saveWorkflow:(id)a3 forDomain:(int64_t)a4 withCallUUID:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  AMDUseCaseWorkflow *v14;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[3];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  os_log_type_t v38;
  id v39;
  id v40;
  id v41;
  int v42;
  os_log_type_t v43;
  id v44;
  id v45;
  id v46;
  id *v47;
  id v48;
  void *v49;
  id location[3];
  uint8_t v51[16];
  uint8_t v52[24];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = (void *)a4;
  v48 = 0;
  objc_storeStrong(&v48, a5);
  v47 = a6;
  v14 = [AMDUseCaseWorkflow alloc];
  v46 = -[AMDUseCaseWorkflow initWithDictionary:](v14, "initWithDictionary:", location[0]);
  if ((objc_msgSend(v46, "isValid") & 1) != 0)
  {
    v41 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", location[0], 6, v47);
    if (*v47)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v8 = (id)objc_msgSend(*v47, "localizedDescription");
      v40 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("Error serializing segment workflow: '%@'"), v8);

      v39 = MEMORY[0x1E0C81028];
      v38 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v40);
        _os_log_impl(&dword_1DC678000, (os_log_t)v39, v38, "%@", v51, 0xCu);
      }
      objc_storeStrong(&v39, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v40, CFSTR("SaveSegmentWorkflowFailure"), 0);
      v42 = 1;
      objc_storeStrong(&v40, 0);
    }
    else
    {
      v31 = 0;
      v32 = &v31;
      v33 = 838860800;
      v34 = 48;
      v35 = __Block_byref_object_copy__1;
      v36 = __Block_byref_object_dispose__1;
      v37 = 0;
      v30 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
      v29 = (id)objc_msgSend(v30, "getManagedObjectContext");
      v7 = v29;
      v18 = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __57__AMDWorkflow_saveWorkflow_forDomain_withCallUUID_error___block_invoke;
      v22 = &unk_1EA4B5460;
      v23 = v29;
      v28[2] = v49;
      v24 = v46;
      v25 = v48;
      v26 = v41;
      v27 = location[0];
      v28[0] = v30;
      v28[1] = &v31;
      objc_msgSend(v7, "performBlockAndWait:", &v18);
      if (v32[5])
      {
        v6 = objc_retainAutorelease((id)v32[5]);
        *v47 = v6;
      }
      objc_storeStrong(v28, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      _Block_object_dispose(&v31, 8);
      objc_storeStrong(&v37, 0);
      v42 = 0;
    }
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v12 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("use_case_id"));
    v11 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("model_id"));
    v45 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("Invalid segment workflow, useCaseId: '%@' modelId: '%@'"), v12, v11);

    v44 = MEMORY[0x1E0C81028];
    v43 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v45);
      _os_log_impl(&dword_1DC678000, (os_log_t)v44, v43, "%@", v52, 0xCu);
    }
    objc_storeStrong(&v44, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v45, CFSTR("SaveSegmentWorkflowFailure"), 0);
    v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 19, v45);
    *v47 = v10;
    v42 = 1;
    objc_storeStrong(&v45, 0);
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

void __57__AMDWorkflow_saveWorkflow_forDomain_withCallUUID_error___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  id *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id location;
  id v16[3];

  v16[2] = (id)a1;
  v16[1] = (id)a1;
  v6 = (void *)MEMORY[0x1E0C97B20];
  v8 = (id)+[AMDWorkflow entity](AMDWorkflow, "entity");
  v7 = (id)objc_msgSend(v8, "name");
  v16[0] = (id)objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:");

  objc_msgSend(v16[0], "setDomain:", (__int16)*(_QWORD *)(a1 + 88));
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "getUseCaseId");
  objc_msgSend(v16[0], "setUseCaseId:");

  objc_msgSend(v16[0], "setCallUUID:", *(_QWORD *)(a1 + 48));
  location = (id)objc_msgSend(*(id *)(a1 + 40), "getTreatmentId");
  if (location)
    objc_storeStrong(&location, location);
  else
    objc_storeStrong(&location, CFSTR("__defaultTreatment"));
  objc_msgSend(v16[0], "setTreatmentId:", location);
  objc_msgSend(v16[0], "setWorkflow:", *(_QWORD *)(a1 + 56));
  v4 = v16[0];
  v5 = (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", CFSTR("model_id"));
  objc_msgSend(v4, "setModelId:");

  v14 = (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", CFSTR("secondary_model_id"));
  if (v14)
    objc_msgSend(v16[0], "setSecondaryModelId:", v14);
  v13 = (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", CFSTR("startTime"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", CFSTR("endTime"));
  if (v13 && v12)
  {
    objc_msgSend(v16[0], "setStartTime:", objc_msgSend(v13, "unsignedLongLongValue"));
    objc_msgSend(v16[0], "setEndTime:", objc_msgSend(v12, "unsignedLongLongValue"));
  }
  v1 = *(void **)(a1 + 72);
  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v11 = *v2;
  objc_msgSend(v1, "save:", &v11, v2);
  objc_storeStrong(v3, v11);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v16, 0);
}

+ (void)addWorkflowsFromInflightTable:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14[2];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  id *v24;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __51__AMDWorkflow_addWorkflowsFromInflightTable_error___block_invoke;
  v11 = &unk_1EA4B5170;
  v12 = location[0];
  v13 = v15;
  v14[0] = v16;
  v14[1] = &v17;
  objc_msgSend(v5, "performBlockAndWait:", &v7);
  if (v18[5])
  {
    v4 = objc_retainAutorelease((id)v18[5]);
    *v24 = v4;
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __51__AMDWorkflow_addWorkflowsFromInflightTable_error___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id obj;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD __b[8];
  id v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = a1;
  v35 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
  if (v30)
  {
    v25 = *(_QWORD *)__b[2];
    v26 = 0;
    v27 = v30;
    while (1)
    {
      v24 = v26;
      if (*(_QWORD *)__b[2] != v25)
        objc_enumerationMutation(obj);
      v34 = *(id *)(__b[1] + 8 * v26);
      v3 = (void *)MEMORY[0x1E0C97B20];
      v5 = (id)+[AMDWorkflow entity](AMDWorkflow, "entity");
      v4 = (id)objc_msgSend(v5, "name");
      v32 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

      v6 = v32;
      v7 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("domain"));
      objc_msgSend(v6, "setDomain:", (__int16)objc_msgSend(v7, "shortValue"));

      v8 = v32;
      v9 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("useCaseId"));
      objc_msgSend(v8, "setUseCaseId:");

      v10 = v32;
      v11 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("treatmentId"));
      objc_msgSend(v10, "setTreatmentId:");

      v12 = v32;
      v13 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("workflow"));
      objc_msgSend(v12, "setWorkflow:");

      v14 = v32;
      v15 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("startTime"));
      objc_msgSend(v14, "setStartTime:", objc_msgSend(v15, "longLongValue"));

      v16 = v32;
      v17 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("endTime"));
      objc_msgSend(v16, "setEndTime:", objc_msgSend(v17, "longLongValue"));

      v18 = v32;
      v19 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("modelId"));
      objc_msgSend(v18, "setModelId:");

      v20 = v32;
      v21 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("callUUID"));
      objc_msgSend(v20, "setCallUUID:");

      v22 = v32;
      v23 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("secondaryModelId"));
      objc_msgSend(v22, "setSecondaryModelId:");

      objc_storeStrong(&v32, 0);
      ++v26;
      if (v24 + 1 >= v27)
      {
        v26 = 0;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
        if (!v27)
          break;
      }
    }
  }

  v1 = *(void **)(a1 + 48);
  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v31 = *v2;
  objc_msgSend(v1, "save:", &v31);
  objc_storeStrong(v2, v31);
}

+ (id)deleteWorkflowsForModelId:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %d"), location[0]);
  v7 = (id)objc_msgSend(v5, "deleteWithPredicate:error:");

  objc_storeStrong(location, 0);
  return v7;
}

+ (id)deleteWorkflowsForDomain:(int64_t)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d"), a3);
  v7 = (id)objc_msgSend(a1, "deleteWithPredicate:error:");

  return v7;
}

+ (id)deleteWorkflowForDomain:(int64_t)a3 withModelId:(id)a4 withSecondaryModelId:(id)a5 andUsecaseId:(id)a6 andTreatmentId:(id)a7 error:(id *)a8
{
  id v8;
  id v9;
  id v11;
  id v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  id location;
  int64_t v22;
  SEL v23;
  id v24;

  v24 = a1;
  v23 = a2;
  v22 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19 = 0;
  objc_storeStrong(&v19, a6);
  v18 = 0;
  objc_storeStrong(&v18, a7);
  v17 = a8;
  v16 = 0;
  if (v20)
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d && modelId == %@ && secondaryModelId == %@ && useCaseId == %@ && treatmentId == %@"), v22, location, v20, v19, v18);
  else
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d && modelId == %@ && useCaseId == %@ && treatmentId == %@"), v22, location, v19, v18);
  v9 = v16;
  v16 = v8;

  v11 = (id)objc_msgSend(v24, "deleteWithPredicate:error:", v16, v17);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

+ (id)deleteWorkflowsForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6
{
  id v9;
  id v10[2];
  id v11;
  id location;
  int64_t v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v10[1] = a6;
  v10[0] = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d && treatmentId == %@ && useCaseId == %@"), v13, location, v11);
  v9 = (id)objc_msgSend(v15, "deleteWithPredicate:error:", v10[0], a6);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

+ (id)deleteAllWorkflows:(id *)a3
{
  return (id)objc_msgSend(a1, "deleteWithPredicate:error:", 0, a3);
}

+ (id)deleteWithPredicate:(id)a3 error:(id *)a4
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
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __41__AMDWorkflow_deleteWithPredicate_error___block_invoke;
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

void __41__AMDWorkflow_deleteWithPredicate_error___block_invoke(_QWORD *a1)
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
  v11 = (id)+[AMDWorkflow entity](AMDWorkflow, "entity");
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
    v3 = (id)objc_msgSend(v16, "result");
    v4 = *(_QWORD *)(a1[8] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v14 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)fetchWithPredicates:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *);
  void *v11;
  id v12;
  id v13[3];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id *v30;
  id location[3];
  id v32;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 838860800;
  v26 = 48;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v15 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v14 = (id)objc_msgSend(v15, "getManagedObjectContext");
  v5 = v14;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __41__AMDWorkflow_fetchWithPredicates_error___block_invoke;
  v11 = &unk_1EA4B5210;
  v12 = location[0];
  v13[1] = &v16;
  v13[0] = v14;
  v13[2] = &v23;
  objc_msgSend(v5, "performBlockAndWait:", &v7);
  if (v24[5])
  {
    *v30 = objc_retainAutorelease((id)v24[5]);
    v32 = 0;
  }
  else
  {
    v32 = (id)v17[5];
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32;
}

void __41__AMDWorkflow_fetchWithPredicates_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id *location;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  id v12[3];

  v12[2] = a1;
  v12[1] = a1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v9 = (id)+[AMDWorkflow entity](AMDWorkflow, "entity");
  v8 = (id)objc_msgSend(v9, "name");
  v12[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  if (a1[4])
  {
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", a1[4]);
    objc_msgSend(v12[0], "setPredicate:");

  }
  objc_msgSend(v12[0], "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v11 = *location;
  v5 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v12[0], &v11);
  objc_storeStrong(location, v11);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v5;

  objc_storeStrong(v12, 0);
}

+ (id)getWorkflowsForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  id v11;
  id v12;
  id v13;
  id *v14;
  id v15;
  id location;
  int64_t v17;
  SEL v18;
  id v19;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d"), v17);
  objc_msgSend(v13, "addObject:");

  v12 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("useCaseId == %@"), v15);
  objc_msgSend(v13, "addObject:");

  if (location)
  {
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("treatmentId == %@ || treatmentId == %@"), CFSTR("__defaultTreatment"), location);
    objc_msgSend(v13, "addObject:");

  }
  v7 = (id)objc_msgSend(v19, "fetchWithPredicates:error:", v13, v14);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

+ (id)getWorkflowsForDomain:(int64_t)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id *v9;
  int64_t v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  v9 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v8;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d"), v10);
  objc_msgSend(v5, "addObject:");

  v7 = (id)objc_msgSend(v12, "fetchWithPredicates:error:", v8, v9);
  objc_storeStrong(&v8, 0);
  return v7;
}

+ (id)getAllWorkflowsForDomain:(int64_t)a3 withUseCaseId:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id location;
  int64_t v15;
  SEL v16;
  id v17;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v13 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v12;
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d"), v15);
  objc_msgSend(v7, "addObject:");

  v9 = v12;
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("useCaseId == %@"), location);
  objc_msgSend(v9, "addObject:");

  v11 = (id)objc_msgSend(v17, "fetchWithPredicates:error:", v12, v13);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

+ (id)getWorkflowsForModelId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id *v10;
  id location[2];
  id v12;

  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v9;
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %@ || secondaryModelId == %@"), location[0], location[0]);
  objc_msgSend(v6, "addObject:");

  v8 = (id)objc_msgSend(v12, "fetchWithPredicates:error:", v9, v10);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)getAllActiveWorkflowsForDomain:(int64_t)a3 andUseCaseId:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v13;
  id v14;
  _QWORD __b[8];
  id v16;
  id v17;
  os_log_type_t type;
  id v19;
  id v20;
  int v21;
  id v22;
  id *v23;
  id location;
  int64_t v25;
  SEL v26;
  id v27;
  id v28;
  _BYTE v29[128];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27 = a1;
  v26 = a2;
  v25 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v23 = a5;
  v22 = +[AMDWorkflow getAllWorkflowsForDomain:withUseCaseId:error:](AMDWorkflow, "getAllWorkflowsForDomain:withUseCaseId:error:", v25, location, a5);
  if (*a5)
  {
    v28 = 0;
    v21 = 1;
  }
  else if (v22 && objc_msgSend(v22, "count"))
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    v10 = v22;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v11)
    {
      v7 = *(_QWORD *)__b[2];
      v8 = 0;
      v9 = v11;
      while (1)
      {
        v6 = v8;
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(v10);
        v16 = *(id *)(__b[1] + 8 * v8);
        v14 = (id)objc_msgSend(v16, "objectForKey:", CFSTR("workflow"));
        v13 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 4, v23);
        if (*v23)
        {
          v28 = 0;
          v21 = 1;
        }
        else
        {
          objc_msgSend(v17, "addObject:", v13);
          v21 = 0;
        }
        objc_storeStrong(&v13, 0);
        objc_storeStrong(&v14, 0);
        if (v21)
          break;
        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
          if (!v9)
            goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:
      v21 = 0;
    }

    if (!v21)
    {
      v28 = v17;
      v21 = 1;
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v20 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No workflows for useCase '%@'"), location);
    v19 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v20);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v19, type, "%@", v30, 0xCu);
    }
    objc_storeStrong(&v19, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v20, CFSTR("getWorkflowFailure"), 0);
    v28 = 0;
    v21 = 1;
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  return v28;
}

+ (id)fetchAllWorkflows:(id *)a3
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
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v5, "getManagedObjectContext");

  v4 = v12;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __33__AMDWorkflow_fetchAllWorkflows___block_invoke;
  v10 = &unk_1EA4B5488;
  v11[0] = v12;
  v11[1] = &v20;
  v11[2] = &v13;
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

void __33__AMDWorkflow_fetchAllWorkflows___block_invoke(_QWORD *a1)
{
  void *v1;
  NSObject *log;
  os_log_type_t v3;
  void *v4;
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id *location;
  id v17;
  id obj;
  uint64_t v19;
  int v20;
  uint8_t v21[15];
  os_log_type_t type;
  os_log_t oslog;
  id v24;
  id v25;
  _QWORD __b[8];
  id v27;
  id v28;
  id v29;
  id v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30[2] = a1;
  v30[1] = a1;
  v12 = (void *)MEMORY[0x1E0C97B48];
  v14 = (id)+[AMDWorkflow entity](AMDWorkflow, "entity");
  v13 = (id)objc_msgSend(v14, "name");
  v30[0] = (id)objc_msgSend(v12, "fetchRequestWithEntityName:");

  v1 = (void *)a1[4];
  location = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v28 = *location;
  v17 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v30[0], &v28);
  objc_storeStrong(location, v28);
  v29 = v17;
  memset(__b, 0, sizeof(__b));
  obj = v17;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
  if (v19)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v19;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v27 = *(id *)(__b[1] + 8 * v10);
      v4 = (void *)MEMORY[0x1E0CB36D8];
      v7 = (id)objc_msgSend(v27, "workflow");
      v5 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
      v24 = *v5;
      v6 = (id)objc_msgSend(v4, "JSONObjectWithData:options:error:");
      objc_storeStrong(v5, v24);
      v25 = v6;

      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v3 = type;
          __os_log_helper_16_0_0(v21);
          _os_log_error_impl(&dword_1DC678000, log, v3, "Workflow could not be deserialized", v21, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v20 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v25);
        v20 = 0;
      }
      objc_storeStrong(&v25, 0);
      if (v20)
        break;
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
        if (!v11)
          break;
      }
    }
  }

  objc_storeStrong(&v29, 0);
  objc_storeStrong(v30, 0);
}

+ (id)getCurrentWorkflowForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6
{
  double v6;
  id v7;
  AMDPair *v8;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v26;
  os_log_type_t v27;
  os_log_t v28;
  id v29;
  id v30;
  id v31;
  os_log_type_t type;
  os_log_t oslog;
  id v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  _QWORD __b[8];
  id v40;
  id v41;
  int v42;
  id v43;
  id *v44;
  id v45;
  id location;
  int64_t v47;
  SEL v48;
  id v49;
  AMDPair *v50;
  uint8_t v51[16];
  uint8_t v52[24];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = a1;
  v48 = a2;
  v47 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v45 = 0;
  objc_storeStrong(&v45, a5);
  v44 = a6;
  v43 = (id)objc_msgSend(v49, "getWorkflowsForDomain:andTreatmentId:andUseCaseId:error:", v47, location, v45, a6);
  if (!*a6 && v43 && objc_msgSend(v43, "count"))
  {
    v41 = 0;
    memset(__b, 0, sizeof(__b));
    v22 = v43;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
    if (v23)
    {
      v19 = *(_QWORD *)__b[2];
      v20 = 0;
      v21 = v23;
      while (1)
      {
        v18 = v20;
        if (*(_QWORD *)__b[2] != v19)
          objc_enumerationMutation(v22);
        v40 = *(id *)(__b[1] + 8 * v20);
        v38 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("treatmentId"));
        v14 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("startTime"));
        v15 = objc_msgSend(v14, "longLongValue");

        v37 = v15;
        v16 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("endTime"));
        v17 = objc_msgSend(v16, "longLongValue");

        v36 = v17;
        if ((objc_msgSend(v38, "isEqual:", CFSTR("__defaultTreatment")) & 1) != 0)
        {
          if (!v41)
            objc_storeStrong(&v41, v40);
        }
        else
        {
          v12 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
          objc_msgSend(v12, "timeIntervalSince1970");
          v13 = (unint64_t)v6;

          v35 = v13;
          if (v13 >= v37 && v35 <= v36)
            objc_storeStrong(&v41, v40);
        }
        objc_storeStrong(&v38, 0);
        ++v20;
        if (v18 + 1 >= v21)
        {
          v20 = 0;
          v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
          if (!v21)
            break;
        }
      }
    }

    if (v41)
    {
      v31 = (id)objc_msgSend(v41, "objectForKey:", CFSTR("treatmentId"));
      v30 = (id)objc_msgSend(v41, "objectForKey:", CFSTR("callUUID"));
      v29 = (id)objc_msgSend(v41, "objectForKey:", CFSTR("workflow"));
      v28 = (os_log_t)MEMORY[0x1E0C81028];
      v27 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v31);
        _os_log_impl(&dword_1DC678000, v28, v27, "Treatment chosen: %@", v51, 0xCu);
      }
      objc_storeStrong((id *)&v28, 0);
      v26 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v29, 4, v44);
      v10 = v30;
      v11 = (id)objc_msgSend(v45, "stringByAppendingString:", CFSTR("UUID"));
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v10);

      if (*v44)
      {
        v50 = 0;
      }
      else
      {
        v8 = [AMDPair alloc];
        v50 = -[AMDPair initWith:and:](v8, "initWith:and:", v31, v26);
      }
      v42 = 1;
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
    }
    else
    {
      v34 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No workflow could be found for the provided usecase: %@"), v45);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v34);
        _os_log_error_impl(&dword_1DC678000, oslog, type, "%@", v52, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v34);
      *v44 = v7;
      v50 = 0;
      v42 = 1;
      objc_storeStrong(&v34, 0);
    }
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v50 = 0;
    v42 = 1;
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&location, 0);
  return v50;
}

+ (id)performWorkflowCleanupForDomain:(int64_t)a3 error:(id *)a4
{
  double v4;
  id v5;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *log;
  os_log_type_t v22;
  id v23;
  id v24;
  os_log_type_t v25;
  os_log_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD __b[8];
  id v34;
  id v35;
  unint64_t v36;
  uint8_t v37[7];
  os_log_type_t v38;
  os_log_t v39;
  int v40;
  id v41;
  os_log_type_t type;
  os_log_t oslog;
  id v44;
  id *v45;
  int64_t v46;
  SEL v47;
  id v48;
  id v49;
  _QWORD v50[3];
  _QWORD v51[3];
  uint8_t v52[16];
  _BYTE v53[128];
  uint8_t v54[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v48 = a1;
  v47 = a2;
  v46 = a3;
  v45 = a4;
  v44 = (id)objc_msgSend(a1, "getWorkflowsForDomain:error:", a3, a4);
  if (*v45)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v22 = type;
      v23 = (id)objc_msgSend(*v45, "localizedDescription");
      v41 = v23;
      __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v41);
      _os_log_error_impl(&dword_1DC678000, log, v22, "Workflow fetch error: %@", v54, 0xCu);

      objc_storeStrong(&v41, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v49 = 0;
    v40 = 1;
  }
  else if (v44)
  {
    v15 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    objc_msgSend(v15, "timeIntervalSince1970");
    v16 = (unint64_t)v4;

    v36 = v16;
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    obj = v44;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
    if (v18)
    {
      v12 = *(_QWORD *)__b[2];
      v13 = 0;
      v14 = v18;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(obj);
        v34 = *(id *)(__b[1] + 8 * v13);
        v32 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("treatmentId"));
        v31 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("endTime"));
        if ((objc_msgSend(v32, "isEqualToString:", CFSTR("__defaultTreatment")) & 1) != 0)
        {
          v40 = 3;
        }
        else
        {
          v10 = v36;
          if (v10 <= objc_msgSend(v31, "longLongValue"))
            goto LABEL_22;
          v30 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("useCaseId"));
          v29 = 0;
          v28 = 0;
          v5 = (id)objc_msgSend(v48, "deleteWorkflowsForDomain:andTreatmentId:andUseCaseId:error:", v46, v32, v30, &v28);
          objc_storeStrong(&v29, v28);
          if (v29)
          {
            v27 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error deleting workflow with domain: %ld, usecase: %@, treatmentId: %@"), v46, v30, v32);
            v26 = (os_log_t)MEMORY[0x1E0C81028];
            v25 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v8 = v26;
              v9 = v25;
              __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v27);
              _os_log_error_impl(&dword_1DC678000, v8, v9, "%@", v52, 0xCu);
            }
            objc_storeStrong((id *)&v26, 0);
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v27, CFSTR("treatmentWorkflowDeletionError"), 0);
            v40 = 3;
            objc_storeStrong(&v27, 0);
          }
          else
          {
            v50[0] = CFSTR("usecase");
            v51[0] = v30;
            v50[1] = CFSTR("treatmentId");
            v51[1] = v32;
            v50[2] = CFSTR("domain");
            v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
            v51[2] = v7;
            v24 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);

            objc_msgSend(v35, "addObject:", v24);
            objc_storeStrong(&v24, 0);
            v40 = 0;
          }
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
          if (!v40)
LABEL_22:
            v40 = 0;
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
          if (!v14)
            break;
        }
      }
    }

    v49 = v35;
    v40 = 1;
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v39 = (os_log_t)MEMORY[0x1E0C81028];
    v38 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v19 = v39;
      v20 = v38;
      __os_log_helper_16_0_0(v37);
      _os_log_impl(&dword_1DC678000, v19, v20, "No workflows to cleanup", v37, 2u);
    }
    objc_storeStrong((id *)&v39, 0);
    v49 = 0;
    v40 = 1;
  }
  objc_storeStrong(&v44, 0);
  return v49;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDWorkflow"), a2, a1);
}

@end
