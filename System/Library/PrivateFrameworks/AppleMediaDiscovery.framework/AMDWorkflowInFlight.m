@implementation AMDWorkflowInFlight

+ (id)getAllWorkflowsForDomain:(int64_t)a3 withModelId:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *);
  void *v13;
  id v14;
  id v15[4];
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
  id location;
  void *v33;
  SEL v34;
  id v35;
  id v36;

  v35 = a1;
  v34 = a2;
  v33 = (void *)a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v31 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  v7 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v16 = (id)objc_msgSend(v7, "getManagedObjectContext");

  v6 = v16;
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __66__AMDWorkflowInFlight_getAllWorkflowsForDomain_withModelId_error___block_invoke;
  v13 = &unk_1EA4B5B18;
  v15[3] = v33;
  v14 = location;
  v15[1] = &v17;
  v15[0] = v16;
  v15[2] = &v24;
  objc_msgSend(v6, "performBlockAndWait:", &v9);
  if (v25[5])
  {
    *v31 = objc_retainAutorelease((id)v25[5]);
    v36 = 0;
  }
  else
  {
    v36 = (id)v18[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&location, 0);
  return v36;
}

void __66__AMDWorkflowInFlight_getAllWorkflowsForDomain_withModelId_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id v15;
  id v16;
  id v17;
  id v18[3];

  v18[2] = a1;
  v18[1] = a1;
  v18[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v18[0];
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d"), a1[8]);
  objc_msgSend(v4, "addObject:");

  v6 = v18[0];
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %@ || secondaryModelId == %@"), a1[4], a1[4]);
  objc_msgSend(v6, "addObject:");

  v8 = (void *)MEMORY[0x1E0C97B48];
  v10 = (id)+[AMDWorkflowInFlight entity](AMDWorkflowInFlight, "entity");
  v9 = (id)objc_msgSend(v10, "name");
  v17 = (id)objc_msgSend(v8, "fetchRequestWithEntityName:");

  v11 = v17;
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18[0]);
  objc_msgSend(v11, "setPredicate:");

  objc_msgSend(v17, "setResultType:", 2);
  v1 = (void *)a1[5];
  v13 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v16 = *v13;
  v15 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v17, &v16);
  objc_storeStrong(v13, v16);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v15;

  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)getAllWorkflowsWithModelId:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
  id v14[3];
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
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v6, "getManagedObjectContext");

  v5 = v15;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __56__AMDWorkflowInFlight_getAllWorkflowsWithModelId_error___block_invoke;
  v12 = &unk_1EA4B5210;
  v13 = location[0];
  v14[1] = &v16;
  v14[0] = v15;
  v14[2] = &v23;
  objc_msgSend(v5, "performBlockAndWait:", &v8);
  if (v24[5])
  {
    *v30 = objc_retainAutorelease((id)v24[5]);
    v32 = 0;
  }
  else
  {
    v32 = (id)v17[5];
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32;
}

void __56__AMDWorkflowInFlight_getAllWorkflowsWithModelId_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id *location;
  id v13;
  id v14;
  id v15;
  id v16[3];

  v16[2] = a1;
  v16[1] = a1;
  v16[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v16[0];
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %@ || secondaryModelId == %@"), a1[4], a1[4]);
  objc_msgSend(v4, "addObject:");

  v6 = (void *)MEMORY[0x1E0C97B48];
  v8 = (id)+[AMDWorkflowInFlight entity](AMDWorkflowInFlight, "entity");
  v7 = (id)objc_msgSend(v8, "name");
  v15 = (id)objc_msgSend(v6, "fetchRequestWithEntityName:");

  v9 = v15;
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v16[0]);
  objc_msgSend(v9, "setPredicate:");

  objc_msgSend(v15, "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v14 = *location;
  v13 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v15, &v14);
  objc_storeStrong(location, v14);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v13;

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

+ (id)deleteWithPredicates:(id)a3 error:(id *)a4
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
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __50__AMDWorkflowInFlight_deleteWithPredicates_error___block_invoke;
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

void __50__AMDWorkflowInFlight_deleteWithPredicates_error___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id *location;
  id v12;
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19[3];

  v19[2] = a1;
  v19[1] = a1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v9 = (id)+[AMDWorkflowInFlight entity](AMDWorkflowInFlight, "entity");
  v8 = (id)objc_msgSend(v9, "name");
  v19[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  v10 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", a1[4]);
  objc_msgSend(v19[0], "setPredicate:");

  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v19[0]);
  objc_msgSend(v18, "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v16 = *location;
  v12 = (id)objc_msgSend(v1, "executeRequest:error:", v18, &v16);
  objc_storeStrong(location, v16);
  v17 = v12;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v15 = 1;
  }
  else
  {
    v2 = (void *)a1[6];
    v6 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
    v14 = *v6;
    objc_msgSend(v2, "save:", &v14);
    objc_storeStrong(v6, v14);
    v3 = (id)objc_msgSend(v17, "result");
    v4 = *(_QWORD *)(a1[8] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v15 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (id)deleteWorkflowForDomain:(int64_t)a3 withModelId:(id)a4 withSecondaryModelId:(id)a5 andUsecaseId:(id)a6 andTreatmentId:(id)a7 error:(id *)a8
{
  id v8;
  id v9;
  void *v11;
  id v12;
  id v13;
  id v18[2];
  id v19;
  id v20;
  id v21;
  id location;
  int64_t v23;
  SEL v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v24 = a2;
  v23 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  objc_storeStrong(&v19, a7);
  v18[1] = a8;
  v18[0] = 0;
  if (v21)
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d && modelId == %@ && secondaryModelId == %@ && useCaseId == %@ && treatmentId == %@"), v23, location, v21, v20, v19);
  else
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d && modelId == %@ && useCaseId == %@ && treatmentId == %@"), v23, location, v20, v19);
  v9 = v18[0];
  v18[0] = v8;

  v11 = v25;
  v26[0] = v18[0];
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v13 = (id)objc_msgSend(v11, "deleteWithPredicates:error:");

  objc_storeStrong(v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
  return v13;
}

+ (void)saveWorkflow:(id)a3 forDomain:(int64_t)a4 withCallUUID:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *log;
  os_log_type_t type;
  AMDUseCaseWorkflow *v12;
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
  id v26[3];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id v36;
  os_log_type_t v37;
  id v38;
  id v39;
  int v40;
  uint8_t v41[15];
  char v42;
  id v43;
  id v44;
  id *v45;
  id v46;
  void *v47;
  id location[3];
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = (void *)a4;
  v46 = 0;
  objc_storeStrong(&v46, a5);
  v45 = a6;
  v12 = [AMDUseCaseWorkflow alloc];
  v44 = -[AMDUseCaseWorkflow initWithDictionary:](v12, "initWithDictionary:", location[0]);
  if ((objc_msgSend(v44, "isValid") & 1) != 0)
  {
    v39 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", location[0], 6, v45);
    if (*v45)
    {
      v38 = MEMORY[0x1E0C81028];
      v37 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        v8 = (id)objc_msgSend(*v45, "localizedDescription");
        v36 = v8;
        __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v36);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v38, v37, "Error serializing in-flight workflow: %@", v49, 0xCu);

        objc_storeStrong(&v36, 0);
      }
      objc_storeStrong(&v38, 0);
      v40 = 1;
    }
    else
    {
      v29 = 0;
      v30 = &v29;
      v31 = 838860800;
      v32 = 48;
      v33 = __Block_byref_object_copy__10;
      v34 = __Block_byref_object_dispose__10;
      v35 = 0;
      v28 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
      v27 = (id)objc_msgSend(v28, "getManagedObjectContext");
      v7 = v27;
      v16 = MEMORY[0x1E0C809B0];
      v17 = -1073741824;
      v18 = 0;
      v19 = __65__AMDWorkflowInFlight_saveWorkflow_forDomain_withCallUUID_error___block_invoke;
      v20 = &unk_1EA4B5460;
      v21 = v27;
      v22 = v46;
      v26[2] = v47;
      v23 = location[0];
      v24 = v44;
      v25 = v39;
      v26[0] = v28;
      v26[1] = &v29;
      objc_msgSend(v7, "performBlockAndWait:", &v16);
      if (v30[5])
      {
        v6 = objc_retainAutorelease((id)v30[5]);
        *v45 = v6;
      }
      objc_storeStrong(v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      _Block_object_dispose(&v29, 8);
      objc_storeStrong(&v35, 0);
      v40 = 0;
    }
    objc_storeStrong(&v39, 0);
  }
  else
  {
    v43 = MEMORY[0x1E0C81028];
    v42 = 16;
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
    {
      log = v43;
      type = v42;
      __os_log_helper_16_0_0(v41);
      _os_log_error_impl(&dword_1DC678000, log, type, "Ignoring invalid in-flight workflow", v41, 2u);
    }
    objc_storeStrong(&v43, 0);
    v9 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 19, CFSTR("Invalid in-flight workflow"));
    *v45 = v9;
    v40 = 1;
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
}

void __65__AMDWorkflowInFlight_saveWorkflow_forDomain_withCallUUID_error___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id v14;
  id v15;
  id location;
  id v17[3];

  v17[2] = (id)a1;
  v17[1] = (id)a1;
  v6 = (void *)MEMORY[0x1E0C97B20];
  v8 = (id)+[AMDWorkflowInFlight entity](AMDWorkflowInFlight, "entity");
  v7 = (id)objc_msgSend(v8, "name");
  v17[0] = (id)objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:");

  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v17[0], "setCreationTime:", v1);

  objc_msgSend(v17[0], "setCallUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v17[0], "setDomain:", (__int16)*(_QWORD *)(a1 + 88));
  v10 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("model_id"));
  objc_msgSend(v17[0], "setModelId:");

  v11 = (id)objc_msgSend(*(id *)(a1 + 56), "getUseCaseId");
  objc_msgSend(v17[0], "setUseCaseId:");

  location = (id)objc_msgSend(*(id *)(a1 + 56), "getTreatmentId");
  if (location)
    objc_storeStrong(&location, location);
  else
    objc_storeStrong(&location, CFSTR("__defaultTreatment"));
  objc_msgSend(v17[0], "setTreatmentId:", location);
  objc_msgSend(v17[0], "setWorkflow:", *(_QWORD *)(a1 + 64));
  v15 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("start_timestamp"));
  v14 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("end_timestamp"));
  if (v15 && v14)
  {
    objc_msgSend(v17[0], "setStartTime:", objc_msgSend(v15, "unsignedLongLongValue"));
    objc_msgSend(v17[0], "setEndTime:", objc_msgSend(v14, "unsignedLongLongValue"));
  }
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("secondary_model_id"), v17[0]);
  objc_msgSend(v3, "setSecondaryModelId:");

  v2 = *(void **)(a1 + 72);
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v13 = *v5;
  objc_msgSend(v2, "save:", &v13);
  objc_storeStrong(v5, v13);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v17, 0);
}

+ (id)deleteAllInflightWorkflows:(id *)a3
{
  return (id)objc_msgSend(a1, "deleteWithPredicates:error:", MEMORY[0x1E0C9AA60], a3);
}

+ (id)moveInflightWorkflowsToWorkflows:(id)a3 withDomain:(int64_t)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *log;
  os_log_type_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id obj;
  uint64_t v49;
  id v50;
  os_log_type_t v51;
  os_log_t v52;
  id v53;
  id v54;
  uint8_t v55[15];
  os_log_type_t v56;
  os_log_t v57;
  id v58;
  os_log_type_t v59;
  os_log_t v60;
  id v61;
  id v62;
  os_log_type_t type;
  os_log_t oslog;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  int v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD __b[8];
  id v81;
  id v82;
  id v83;
  id v84[2];
  int64_t v85;
  id location[3];
  uint8_t v87[32];
  uint8_t v88[40];
  id v89;
  uint8_t v90[56];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v85 = a4;
  v84[1] = a5;
  v84[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v83 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v91, 16);
  if (v49)
  {
    v43 = *(_QWORD *)__b[2];
    v44 = 0;
    v45 = v49;
    while (1)
    {
      v42 = v44;
      if (*(_QWORD *)__b[2] != v43)
        objc_enumerationMutation(obj);
      v81 = *(id *)(__b[1] + 8 * v44);
      v79 = 0;
      v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v77 = (id)objc_msgSend(v81, "objectForKey:", 0x1EA4B9148);
      v76 = (id)objc_msgSend(v81, "objectForKey:", 0x1EA4B8F88);
      v75 = (id)objc_msgSend(v81, "objectForKey:", 0x1EA4BAC68);
      v74 = (id)objc_msgSend(v81, "objectForKey:", 0x1EA4BACA8);
      if (!v74)
        objc_storeStrong(&v74, CFSTR("__defaultTreatment"));
      v72 = v79;
      v41 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", v76, &v72);
      objc_storeStrong(&v79, v72);
      v73 = v41;
      if (v79)
      {
        v39 = v83;
        v40 = (id)objc_msgSend(v79, "localizedDescription");
        objc_msgSend(v39, "setObject:forKey:");

        v71 = 3;
        goto LABEL_39;
      }
      if (!v73)
      {
        v70 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Primary model unavailable: %@"), v76);
        objc_msgSend(v83, "setObject:forKey:", v70, v77);
        v71 = 3;
        objc_storeStrong(&v70, 0);
        goto LABEL_39;
      }
      if (v75)
      {
        v68 = v79;
        v38 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", v75, &v68);
        objc_storeStrong(&v79, v68);
        v69 = v38;
        if (v79)
        {
          v36 = v83;
          v37 = (id)objc_msgSend(v79, "localizedDescription");
          objc_msgSend(v36, "setObject:forKey:");

          v71 = 3;
        }
        else if (v69)
        {
          v71 = 0;
        }
        else
        {
          v67 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Secondary model unavailable: %@"), v75);
          objc_msgSend(v83, "setObject:forKey:", v67, v77);
          v71 = 3;
          objc_storeStrong(&v67, 0);
        }
        objc_storeStrong(&v69, 0);
        if (v71)
          goto LABEL_39;
      }
      v65 = v79;
      v35 = +[AMDWorkflow deleteWorkflowForDomain:withModelId:withSecondaryModelId:andUsecaseId:andTreatmentId:error:](AMDWorkflow, "deleteWorkflowForDomain:withModelId:withSecondaryModelId:andUsecaseId:andTreatmentId:error:", v85, v76, v75, v77, v74, &v65);
      objc_storeStrong(&v79, v65);
      v66 = v35;
      if (v79)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v33 = type;
          v29 = v76;
          v30 = v75;
          v31 = v77;
          v34 = (id)objc_msgSend(v79, "localizedDescription");
          v62 = v34;
          __os_log_helper_16_2_4_8_64_8_64_8_64_8_64((uint64_t)v90, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v62);
          _os_log_error_impl(&dword_1DC678000, log, v33, "Entry deletion from workflow table failed for modelId: %@ and secondaryModelId: %@ and usecaseId: %@ with error: %@", v90, 0x2Au);

          objc_storeStrong(&v62, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        v27 = v84[0];
        v28 = (id)objc_msgSend(v79, "localizedDescription");
        objc_msgSend(v27, "setObject:forKey:");

        v71 = 3;
      }
      else
      {
        v89 = v81;
        v26 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
        v61 = v79;
        +[AMDWorkflow addWorkflowsFromInflightTable:error:](AMDWorkflow, "addWorkflowsFromInflightTable:error:");
        objc_storeStrong(&v79, v61);

        if (v79)
        {
          v60 = (os_log_t)MEMORY[0x1E0C81028];
          v59 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v23 = v60;
            v24 = v59;
            v21 = v76;
            v22 = v75;
            v25 = (id)objc_msgSend(v79, "localizedDescription");
            v58 = v25;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v88, (uint64_t)v21, (uint64_t)v22, (uint64_t)v58);
            _os_log_error_impl(&dword_1DC678000, v23, v24, "Entry addition to workflow table from inflight table failed for modelId: %@ and secondaryModelId: %@ with error: %@", v88, 0x20u);

            objc_storeStrong(&v58, 0);
          }
          objc_storeStrong((id *)&v60, 0);
          v19 = v83;
          v20 = (id)objc_msgSend(v79, "localizedDescription");
          objc_msgSend(v19, "setObject:forKey:");

          v71 = 3;
        }
        else
        {
          if (v76 && v75)
          {
            v57 = (os_log_t)MEMORY[0x1E0C81028];
            v56 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              v17 = v57;
              v18 = v56;
              __os_log_helper_16_0_0(v55);
              _os_log_impl(&dword_1DC678000, v17, v18, "Both primary and secondary model are defined. Skipping inflight cleanup", v55, 2u);
            }
            objc_storeStrong((id *)&v57, 0);
          }
          else
          {
            v53 = v79;
            v16 = +[AMDWorkflowInFlight deleteWorkflowForDomain:withModelId:withSecondaryModelId:andUsecaseId:andTreatmentId:error:](AMDWorkflowInFlight, "deleteWorkflowForDomain:withModelId:withSecondaryModelId:andUsecaseId:andTreatmentId:error:", v85, v76, v75, v77, v74, &v53);
            objc_storeStrong(&v79, v53);
            v54 = v16;
            if (v79)
            {
              v52 = (os_log_t)MEMORY[0x1E0C81028];
              v51 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                v13 = v52;
                v14 = v51;
                v11 = v76;
                v12 = v75;
                v15 = (id)objc_msgSend(v79, "localizedDescription");
                v50 = v15;
                __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v87, (uint64_t)v11, (uint64_t)v12, (uint64_t)v50);
                _os_log_error_impl(&dword_1DC678000, v13, v14, "Entry deletion from inflight table failed for modelId: %@ and secondaryModelId: %@ with error: %@", v87, 0x20u);

                objc_storeStrong(&v50, 0);
              }
              objc_storeStrong((id *)&v52, 0);
              v9 = v83;
              v10 = (id)objc_msgSend(v79, "localizedDescription");
              objc_msgSend(v9, "setObject:forKey:");

              v71 = 3;
            }
            else
            {
              objc_msgSend(v78, "setObject:forKey:", v54, CFSTR("oldRemovedInflightTable"));
              v71 = 0;
            }
            objc_storeStrong(&v54, 0);
            if (v71)
              goto LABEL_38;
          }
          objc_msgSend(v78, "setObject:forKey:", v66, CFSTR("oldRemovedFromWorkflowTable"));
          objc_msgSend(v82, "addObject:", v81);
          objc_msgSend(v83, "setObject:forKey:", v78, v77);
          v71 = 0;
        }
      }
LABEL_38:
      objc_storeStrong(&v66, 0);
LABEL_39:
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
      objc_storeStrong(&v77, 0);
      objc_storeStrong(&v78, 0);
      objc_storeStrong(&v79, 0);
      ++v44;
      if (v42 + 1 >= v45)
      {
        v44 = 0;
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v91, 16);
        if (!v45)
          break;
      }
    }
  }

  v6 = v83;
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v82, "count"));
  objc_msgSend(v6, "setObject:forKey:");

  objc_msgSend(v84[0], "setObject:forKey:", v82, CFSTR("savedWorkflows"));
  objc_msgSend(v84[0], "setObject:forKey:", v83, CFSTR("deletionSummary"));
  v8 = v84[0];
  v71 = 1;
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(v84, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)fetchAllWorkflowEntries:(id *)a3
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
  v24 = __Block_byref_object_copy__10;
  v25 = __Block_byref_object_dispose__10;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  v5 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v5, "getManagedObjectContext");

  v4 = v12;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __47__AMDWorkflowInFlight_fetchAllWorkflowEntries___block_invoke;
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

void __47__AMDWorkflowInFlight_fetchAllWorkflowEntries___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDWorkflowInFlight entity](AMDWorkflowInFlight, "entity");
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

+ (id)fetchAllWorkflows:(id *)a3
{
  NSObject *log;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  int v12;
  uint8_t v13[7];
  os_log_type_t type;
  os_log_t oslog;
  id location;
  id v17;
  _QWORD __b[8];
  id v19;
  id v20;
  id v21;
  id *v22;
  SEL v23;
  id v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = a1;
  v23 = a2;
  v22 = a3;
  v21 = (id)objc_msgSend(a1, "fetchAllWorkflowEntries:", a3);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = v21;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v8);
      v17 = (id)objc_msgSend(v19, "objectForKey:", 0x1EA4BACC8);
      location = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 4, v22);
      if (*v22)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v5 = type;
          __os_log_helper_16_0_0(v13);
          _os_log_error_impl(&dword_1DC678000, log, v5, "Workflow could not be deserialized", v13, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v25 = 0;
        v12 = 1;
      }
      else
      {
        objc_msgSend(v20, "addObject:", location);
        v12 = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v17, 0);
      if (v12)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v9)
          goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v12 = 0;
  }

  if (!v12)
    v25 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  return v25;
}

+ (id)fetchAllModelIds:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD __b[8];
  id v13;
  id v14;
  int v15;
  id v16;
  id *v17;
  SEL v18;
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = a1;
  v18 = a2;
  v17 = a3;
  v16 = (id)objc_msgSend(a1, "fetchAllWorkflowEntries:", a3);
  if (!*v17 && v16)
  {
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v16;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v13 = *(id *)(__b[1] + 8 * v6);
        v11 = (id)objc_msgSend(v13, "objectForKey:", 0x1EA4B9308);
        v10 = (id)objc_msgSend(v13, "objectForKey:", 0x1EA4B8F88);
        objc_msgSend(v14, "setObject:forKey:", v11, v10);
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
          if (!v7)
            break;
        }
      }
    }

    v20 = v14;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v20 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  return v20;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDWorkflowInFlight"), a2, a1);
}

@end
