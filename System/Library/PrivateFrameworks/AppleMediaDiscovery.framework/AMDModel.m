@implementation AMDModel

+ (id)fetchAll:(id *)a3
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
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__9;
  v18 = __Block_byref_object_dispose__9;
  v19 = 0;
  v5 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v5, "getManagedObjectContext");

  v4 = v12;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __21__AMDModel_fetchAll___block_invoke;
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

void __21__AMDModel_fetchAll___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDModel entity](AMDModel, "entity");
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

+ (void)deleteModels:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
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
  id *v23;
  id location[2];
  id v25;

  v25 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  v15 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v14 = (id)objc_msgSend(v15, "getManagedObjectContext");
  v5 = v14;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __31__AMDModel_deleteModels_error___block_invoke;
  v11 = &unk_1EA4B5518;
  v12 = location[0];
  v13[2] = v25;
  v13[1] = &v16;
  v13[0] = v15;
  objc_msgSend(v5, "performBlockAndWait:", &v7);
  if (v17[5])
  {
    v4 = objc_retainAutorelease((id)v17[5]);
    *v23 = v4;
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __31__AMDModel_deleteModels_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id *v4;
  id *location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v12;
  id v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  _QWORD __b[8];
  id v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = a1;
  v20 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
  if (v12)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v12;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v8);
      v17 = (id)objc_msgSend(v19, "objectForKey:", CFSTR("modelId"));
      v16 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %@"), v17);
      v1 = *(void **)(a1 + 56);
      location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v15 = *location;
      v2 = (id)objc_msgSend(v1, "deleteWithPredicate:error:", v16, &v15);
      objc_storeStrong(location, v15);
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      if (v14)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
        if (!v9)
          goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    v14 = 0;
  }

  if (!v14)
  {
    v3 = *(void **)(a1 + 40);
    v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v13 = *v4;
    objc_msgSend(v3, "save:", &v13);
    objc_storeStrong(v4, v13);
  }
}

+ (id)deleteAllModelUrls:(id *)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *);
  void *v9;
  id v10;
  id v11[3];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id *v28;
  SEL v29;
  id v30;
  id v31;

  v30 = a1;
  v29 = a2;
  v28 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 838860800;
  v24 = 48;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 838860800;
  v17 = 48;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v13 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v13, "getManagedObjectContext");
  v4 = v12;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __31__AMDModel_deleteAllModelUrls___block_invoke;
  v9 = &unk_1EA4B5210;
  v10 = v12;
  v11[1] = &v21;
  v11[0] = v13;
  v11[2] = &v14;
  objc_msgSend(v4, "performBlockAndWait:", &v5);
  if (v22[5])
  {
    *v28 = objc_retainAutorelease((id)v22[5]);
    v31 = 0;
  }
  else
  {
    v31 = (id)v15[5];
  }
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  return v31;
}

void __31__AMDModel_deleteAllModelUrls___block_invoke(_QWORD *a1)
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
  id *location;
  id v11;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18[3];

  v18[2] = a1;
  v18[1] = a1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v9 = (id)+[AMDModel entity](AMDModel, "entity");
  v8 = (id)objc_msgSend(v9, "name");
  v18[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v18[0]);
  objc_msgSend(v17, "setResultType:", 2);
  v1 = (void *)a1[4];
  location = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v15 = *location;
  v11 = (id)objc_msgSend(v1, "executeRequest:error:", v17, &v15);
  objc_storeStrong(location, v15);
  v16 = v11;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v14 = 1;
  }
  else
  {
    v2 = (void *)a1[5];
    v6 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v13 = *v6;
    objc_msgSend(v2, "save:", &v13);
    objc_storeStrong(v6, v13);
    v3 = (id)objc_msgSend(v16, "result");
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v14 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (void)saveModels:(id)a3 error:(id *)a4
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
  v21 = __Block_byref_object_copy__9;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __29__AMDModel_saveModels_error___block_invoke;
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

void __29__AMDModel_saveModels_error___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id *v3;
  void *v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id obj;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD __b[8];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = a1;
  v29 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
  if (v23)
  {
    v18 = *(_QWORD *)__b[2];
    v19 = 0;
    v20 = v23;
    while (1)
    {
      v17 = v19;
      if (*(_QWORD *)__b[2] != v18)
        objc_enumerationMutation(obj);
      v28 = *(_QWORD *)(__b[1] + 8 * v19);
      v26 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v28);
      v4 = (void *)MEMORY[0x1E0C97B20];
      v6 = (id)+[AMDModel entity](AMDModel, "entity");
      v5 = (id)objc_msgSend(v6, "name");
      v25 = (id)objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:");

      v7 = v25;
      v8 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("modelId"));
      objc_msgSend(v7, "setModelId:");

      v9 = v25;
      v10 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("url"));
      objc_msgSend(v9, "setUrl:");

      v11 = v25;
      v12 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("compiledModelDir"));
      objc_msgSend(v11, "setCompiledModelDir:");

      v13 = v25;
      v14 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("version"));
      objc_msgSend(v13, "setVersion:");

      v15 = v25;
      v16 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      objc_msgSend(v16, "timeIntervalSince1970");
      objc_msgSend(v15, "setCreationTimeSeconds:", (unint64_t)v1);

      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
      ++v19;
      if (v17 + 1 >= v20)
      {
        v19 = 0;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
        if (!v20)
          break;
      }
    }
  }

  v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v24 = *v3;
  objc_msgSend(v2, "save:", &v24);
  objc_storeStrong(v3, v24);
}

+ (id)getModelInfo:(id)a3 error:(id *)a4
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
  v27 = __Block_byref_object_copy__9;
  v28 = __Block_byref_object_dispose__9;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v6, "getManagedObjectContext");

  v5 = v15;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __31__AMDModel_getModelInfo_error___block_invoke;
  v12 = &unk_1EA4B51E8;
  v13 = location[0];
  v14[0] = v15;
  v14[1] = &v23;
  v14[2] = &v16;
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

void __31__AMDModel_getModelInfo_error___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id *location;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14[3];

  v14[2] = a1;
  v14[1] = a1;
  v5 = (void *)MEMORY[0x1E0C97B48];
  v7 = (id)+[AMDModel entity](AMDModel, "entity");
  v6 = (id)objc_msgSend(v7, "name");
  v14[0] = (id)objc_msgSend(v5, "fetchRequestWithEntityName:");

  v13 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %@"), a1[4]);
  objc_msgSend(v14[0], "setPredicate:", v13);
  objc_msgSend(v14[0], "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v11 = *location;
  v9 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v14[0], &v11);
  objc_storeStrong(location, v11);
  v12 = v9;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) && v12)
  {
    v2 = (id)objc_msgSend(v12, "firstObject");
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
}

+ (id)getModelPath:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *log;
  os_log_type_t type;
  id v15;
  id v17;
  os_log_type_t v18;
  id v19;
  int v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id *v25;
  id location[2];
  id v27;
  id v28;
  const __CFString *v29;
  id v30;
  uint8_t v31[16];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = a4;
  v24 = (id)objc_msgSend(v27, "getModelInfo:error:", location[0], a4);
  if (*a4)
  {
    v23 = MEMORY[0x1E0C81028];
    v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      type = v22;
      v12 = location[0];
      v15 = (id)objc_msgSend(*v25, "localizedDescription");
      v21 = v15;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v32, (uint64_t)v12, (uint64_t)v21);
      _os_log_error_impl(&dword_1DC678000, log, type, "Model: %@ could not be fetched. Error: %@", v32, 0x16u);

      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
    v28 = 0;
    v20 = 1;
  }
  else if (v24)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v9 = (id)objc_msgSend(v24, "objectForKey:", CFSTR("url"));
    v8 = (id)objc_msgSend(v24, "objectForKey:", CFSTR("compiledModelDir"));
    v17 = (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v9, v8);

    v10 = v17;
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v4 = (id)objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:");
    v5 = v17;
    v17 = v4;

    v29 = CFSTR("path");
    v30 = v17;
    v28 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v20 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v19, v18, "Model: %@ not available", v31, 0xCu);
    }
    objc_storeStrong(&v19, 0);
    v28 = 0;
    v20 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v28;
}

+ (id)getModelPathForUsecase:(id)a3 inDomain:(id)a4 forModelId:(id)a5 withTreatmentId:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *log;
  os_log_type_t type;
  os_log_t oslog;
  id v28;
  id v29;
  os_log_type_t v30;
  id v31;
  id v32;
  uint8_t v33[7];
  char v34;
  id v35;
  uint8_t v36[15];
  char v37;
  id v38;
  int64_t v39;
  uint8_t v40[15];
  char v41;
  id v42;
  int v43;
  uint8_t v44[7];
  char v45;
  id v46;
  id *v47;
  id v48;
  id v49;
  id v50;
  id location[2];
  id v52;
  id v53;
  uint8_t v54[16];
  uint8_t v55[40];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v52 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = 0;
  objc_storeStrong(&v50, a4);
  v49 = 0;
  objc_storeStrong(&v49, a5);
  v48 = 0;
  objc_storeStrong(&v48, a6);
  v47 = a7;
  if (location[0] || v49)
  {
    if (v50)
    {
      v39 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v50);
      if (v39)
      {
        if (v49)
        {
          v53 = (id)objc_msgSend(v52, "getModelPath:error:", v49, v47);
          v43 = 1;
        }
        else if (location[0])
        {
          v32 = +[AMDWorkflow getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:](AMDWorkflow, "getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:", v39, v48, location[0], v47);
          if (*v47)
          {
            v31 = MEMORY[0x1E0C81028];
            v30 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
            {
              v12 = v31;
              v13 = v30;
              v10 = v50;
              v11 = location[0];
              v14 = (id)objc_msgSend(*v47, "localizedDescription");
              v29 = v14;
              __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v55, (uint64_t)v10, (uint64_t)v11, (uint64_t)v29);
              _os_log_error_impl(&dword_1DC678000, v12, v13, "Workflow fetch failed for domain: %@, usecase: %@ error: %@", v55, 0x20u);

              objc_storeStrong(&v29, 0);
            }
            objc_storeStrong(&v31, 0);
            v53 = 0;
            v43 = 1;
          }
          else
          {
            v28 = (id)objc_msgSend(v32, "second");
            v7 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("model_id"));
            v8 = v49;
            v49 = v7;

            if (!v49)
            {
              oslog = (os_log_t)MEMORY[0x1E0C81028];
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)location[0]);
                _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "ModelId not present in workflow for usecase: %@", v54, 0xCu);
              }
              objc_storeStrong((id *)&oslog, 0);
            }
            v53 = (id)objc_msgSend(v52, "getModelPath:error:", v49, v47);
            v43 = 1;
            objc_storeStrong(&v28, 0);
          }
          objc_storeStrong(&v32, 0);
        }
        else
        {
          v35 = MEMORY[0x1E0C81028];
          v34 = 16;
          if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
          {
            v15 = v35;
            v16 = v34;
            __os_log_helper_16_0_0(v33);
            _os_log_error_impl(&dword_1DC678000, v15, v16, "UsecaseId missing while querying for model path", v33, 2u);
          }
          objc_storeStrong(&v35, 0);
          v53 = 0;
          v43 = 1;
        }
      }
      else
      {
        v38 = MEMORY[0x1E0C81028];
        v37 = 16;
        if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
        {
          v17 = v38;
          v18 = v37;
          __os_log_helper_16_0_0(v36);
          _os_log_error_impl(&dword_1DC678000, v17, v18, "Unsupported domain passed while querying for model path", v36, 2u);
        }
        objc_storeStrong(&v38, 0);
        v53 = 0;
        v43 = 1;
      }
    }
    else
    {
      v42 = MEMORY[0x1E0C81028];
      v41 = 16;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
      {
        v19 = v42;
        v20 = v41;
        __os_log_helper_16_0_0(v40);
        _os_log_error_impl(&dword_1DC678000, v19, v20, "Domain missing while querying for model path. Defaulting to apps", v40, 2u);
      }
      objc_storeStrong(&v42, 0);
      v53 = 0;
      v43 = 1;
    }
  }
  else
  {
    v46 = MEMORY[0x1E0C81028];
    v45 = 16;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
    {
      log = v46;
      type = v45;
      __os_log_helper_16_0_0(v44);
      _os_log_error_impl(&dword_1DC678000, log, type, "UsecaseId and modelId missing while querying for model path", v44, 2u);
    }
    objc_storeStrong(&v46, 0);
    v53 = 0;
    v43 = 1;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  return v53;
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
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__9;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __38__AMDModel_deleteWithPredicate_error___block_invoke;
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

void __38__AMDModel_deleteWithPredicate_error___block_invoke(_QWORD *a1)
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
  v11 = (id)+[AMDModel entity](AMDModel, "entity");
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

+ (id)getCurrentModelInfoByModelId
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id obj;
  uint64_t v12;
  NSObject *log;
  os_log_type_t type;
  id v15;
  id v16;
  _QWORD __b[8];
  id v18;
  id v19;
  int v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26[3];
  id v27;
  _BYTE v28[128];
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26[2] = a1;
  v26[1] = (id)a2;
  v26[0] = 0;
  v24 = 0;
  v16 = (id)objc_msgSend(a1, "fetchAll:", &v24);
  objc_storeStrong(v26, v24);
  v25 = v16;
  if (v26[0])
  {
    v23 = MEMORY[0x1E0C81028];
    v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      type = v22;
      v15 = (id)objc_msgSend(v26[0], "localizedDescription");
      v21 = v15;
      __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v21);
      _os_log_error_impl(&dword_1DC678000, log, type, "Error fetching all model urls: '%@'", v29, 0xCu);

      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
    v27 = MEMORY[0x1E0C9AA70];
    v20 = 1;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v19 = (id)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v25, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v25;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    if (v12)
    {
      v7 = *(_QWORD *)__b[2];
      v8 = 0;
      v9 = v12;
      while (1)
      {
        v6 = v8;
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(obj);
        v18 = *(id *)(__b[1] + 8 * v8);
        v4 = v19;
        v3 = v18;
        v5 = (id)objc_msgSend(v18, "objectForKey:", CFSTR("modelId"));
        objc_msgSend(v4, "setObject:forKey:", v3);

        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v9)
            break;
        }
      }
    }

    v27 = v19;
    v20 = 1;
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  return v27;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDModel"), a2, a1);
}

@end
