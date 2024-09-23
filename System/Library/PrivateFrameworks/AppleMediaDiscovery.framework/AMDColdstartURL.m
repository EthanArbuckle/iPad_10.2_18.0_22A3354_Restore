@implementation AMDColdstartURL

+ (id)getColdstartURLForModel:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(_QWORD *);
  void *v17;
  id v18;
  id v19[3];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  int v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id *v35;
  id location[3];
  id v37;
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 838860800;
  v31 = 48;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 838860800;
  v24 = 48;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v8 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v20 = (id)objc_msgSend(v8, "getManagedObjectContext");

  v7 = v20;
  v13 = MEMORY[0x1E0C809B0];
  v14 = -1073741824;
  v15 = 0;
  v16 = __49__AMDColdstartURL_getColdstartURLForModel_error___block_invoke;
  v17 = &unk_1EA4B51E8;
  v18 = location[0];
  v19[0] = v20;
  v19[1] = &v28;
  v19[2] = &v21;
  objc_msgSend(v7, "performBlockAndWait:", &v13);
  if (v29[5])
  {
    *v35 = objc_retainAutorelease((id)v29[5]);
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v6 = location[0];
      v5 = (id)objc_msgSend(*v35, "localizedDescription");
      v10 = v5;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v38, (uint64_t)v6, (uint64_t)v10);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "Error fetching coldstart urls for model: %@ %@", v38, 0x16u);

      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v37 = 0;
  }
  else
  {
    v37 = (id)v22[5];
  }
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  _Block_object_dispose(&v28, 8);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v37;
}

void __49__AMDColdstartURL_getColdstartURLForModel_error___block_invoke(_QWORD *a1)
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
  int v12;
  id v13;
  id v14;
  id v15;
  id v16[3];

  v16[2] = a1;
  v16[1] = a1;
  v5 = (void *)MEMORY[0x1E0C97B48];
  v7 = (id)+[AMDColdstartURL entity](AMDColdstartURL, "entity");
  v6 = (id)objc_msgSend(v7, "name");
  v16[0] = (id)objc_msgSend(v5, "fetchRequestWithEntityName:");

  v15 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelId == %@"), a1[4]);
  objc_msgSend(v16[0], "setPredicate:", v15);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v13 = *location;
  v9 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v16[0], &v13);
  objc_storeStrong(location, v13);
  v14 = v9;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) && v14)
  {
    v11 = (id)objc_msgSend(v14, "firstObject");
    if (v11)
    {
      v2 = (id)objc_msgSend(v11, "url");
      v3 = *(_QWORD *)(a1[7] + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    objc_storeStrong(&v11, 0);
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

+ (id)getCurrentURLInfoByModelId
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
  id v13;
  _QWORD __b[8];
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20[3];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20[2] = a1;
  v20[1] = (id)a2;
  v20[0] = 0;
  v18 = 0;
  v13 = +[AMDColdstartURL fetchAll:](AMDColdstartURL, "fetchAll:", &v18);
  objc_storeStrong(v20, v18);
  v19 = v13;
  if (v20[0])
  {
    v21 = MEMORY[0x1E0C9AA70];
    v17 = 1;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v16 = (id)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v19, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v19;
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
        v15 = *(id *)(__b[1] + 8 * v8);
        v4 = v16;
        v3 = v15;
        v5 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("modelId"));
        objc_msgSend(v4, "setObject:forKey:", v3);

        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
          if (!v9)
            break;
        }
      }
    }

    v21 = v16;
    v17 = 1;
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
  return v21;
}

+ (id)fetchAll:(id *)a3
{
  id v4;
  id v5;
  id v6;
  id location;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *);
  void *v14;
  id v15[3];
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
  SEL v32;
  id v33;
  id v34;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = a1;
  v32 = a2;
  v31 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v16 = (id)objc_msgSend(v6, "getManagedObjectContext");

  v5 = v16;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __28__AMDColdstartURL_fetchAll___block_invoke;
  v14 = &unk_1EA4B5238;
  v15[1] = &v17;
  v15[0] = v16;
  v15[2] = &v24;
  objc_msgSend(v5, "performBlockAndWait:", &v10);
  if (v25[5])
  {
    *v31 = objc_retainAutorelease((id)v25[5]);
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v4 = (id)objc_msgSend(*v31, "localizedDescription");
      location = v4;
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)location);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "Error fetching all the coldstart urls. %@", v35, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v34 = 0;
  }
  else
  {
    v34 = (id)v18[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  return v34;
}

void __28__AMDColdstartURL_fetchAll___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDColdstartURL entity](AMDColdstartURL, "entity");
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

+ (void)deleteColdstartURLs:(id)a3 error:(id *)a4
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
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v15 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v14 = (id)objc_msgSend(v15, "getManagedObjectContext");
  v5 = v14;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __45__AMDColdstartURL_deleteColdstartURLs_error___block_invoke;
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

void __45__AMDColdstartURL_deleteColdstartURLs_error___block_invoke(uint64_t a1)
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

+ (void)saveColdstartURL:(id)a3 error:(id *)a4
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
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __42__AMDColdstartURL_saveColdstartURL_error___block_invoke;
  v11 = &unk_1EA4B5540;
  v12 = v15;
  v13 = location[0];
  v14[1] = &v17;
  v14[0] = v16;
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

void __42__AMDColdstartURL_saveColdstartURL_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  int v11;
  os_log_type_t v12;
  id location;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18[3];
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18[2] = (id)a1;
  v18[1] = (id)a1;
  v6 = (void *)MEMORY[0x1E0C97B20];
  v8 = (id)+[AMDColdstartURL entity](AMDColdstartURL, "entity");
  v7 = (id)objc_msgSend(v8, "name");
  v18[0] = (id)objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:");

  v17 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("modelId"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("url"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("version"));
  if (v17 && v16 && v15)
  {
    objc_msgSend(v18[0], "setModelId:", v17);
    objc_msgSend(v18[0], "setUrl:", v16);
    objc_msgSend(v18[0], "setVersion:", v15);
    v4 = *(void **)(a1 + 48);
    v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = *v5;
    objc_msgSend(v4, "save:", &v10);
    objc_storeStrong(v5, v10);
    v11 = 0;
  }
  else
  {
    v14 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incomplete coldstart info"));
    location = MEMORY[0x1E0C81028];
    v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v14);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)location, v12, "%@", v19, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v1 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v14);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v1;

    v11 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)deleteAllColdstartUrls:(id *)a3
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
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 838860800;
  v17 = 48;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v13 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v13, "getManagedObjectContext");
  v4 = v12;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __42__AMDColdstartURL_deleteAllColdstartUrls___block_invoke;
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

void __42__AMDColdstartURL_deleteAllColdstartUrls___block_invoke(_QWORD *a1)
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
  v9 = (id)+[AMDColdstartURL entity](AMDColdstartURL, "entity");
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
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __45__AMDColdstartURL_deleteWithPredicate_error___block_invoke;
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

void __45__AMDColdstartURL_deleteWithPredicate_error___block_invoke(_QWORD *a1)
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
  v11 = (id)+[AMDColdstartURL entity](AMDColdstartURL, "entity");
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

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDColdstartURL"), a2, a1);
}

@end
