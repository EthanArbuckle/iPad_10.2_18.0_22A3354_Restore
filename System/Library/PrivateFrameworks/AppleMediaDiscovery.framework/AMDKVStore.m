@implementation AMDKVStore

+ (id)fetchValueForKey:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *log;
  os_log_type_t v7;
  id v8;
  id v9;
  id v11;
  os_log_type_t type;
  os_log_t oslog;
  id v14;
  id v15;
  int v16;
  id v17;
  id *v18;
  id location[2];
  id v20;
  id v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = (id)objc_msgSend(v20, "fetchEntryForKey:error:", location[0], a4);
  if (*a4)
  {
    v21 = 0;
    v16 = 1;
  }
  else if (objc_msgSend(v17, "count"))
  {
    v9 = (id)objc_msgSend(v17, "firstObject");
    v15 = (id)objc_msgSend(v9, "objectForKey:", CFSTR("value"));

    v14 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 4, v18);
    if (*v18)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v7 = type;
        v5 = location[0];
        v8 = (id)objc_msgSend(*v18, "localizedDescription");
        v11 = v8;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)v5, (uint64_t)v11);
        _os_log_error_impl(&dword_1DC678000, log, v7, "Error deserializing value for key %@: %@", v22, 0x16u);

        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v21 = 0;
      v16 = 1;
    }
    else
    {
      v21 = (id)objc_msgSend(v14, "mutableCopy");
      v16 = 1;
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v21 = 0;
    v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

+ (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(_QWORD *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  int v29;
  id v30;
  os_log_type_t v31;
  id v32;
  id v33;
  id *v34;
  id v35;
  id location[3];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = a5;
  v33 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", location[0], 4, a5);
  if (*a5)
  {
    v32 = MEMORY[0x1E0C81028];
    v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      v8 = v35;
      v7 = (id)objc_msgSend(*v34, "localizedDescription");
      v30 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v8, (uint64_t)v30);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v32, v31, "Data could not be serialized for key: %@, with error: %@", v37, 0x16u);

      objc_storeStrong(&v30, 0);
    }
    objc_storeStrong(&v32, 0);
    v29 = 1;
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 838860800;
    v25 = 48;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    v28 = 0;
    v21 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
    v20 = (id)objc_msgSend(v21, "getManagedObjectContext");
    v6 = v20;
    v11 = MEMORY[0x1E0C809B0];
    v12 = -1073741824;
    v13 = 0;
    v14 = __36__AMDKVStore_setValue_forKey_error___block_invoke;
    v15 = &unk_1EA4B5198;
    v16 = v20;
    v17 = v35;
    v18 = v33;
    v19[0] = v21;
    v19[1] = &v22;
    objc_msgSend(v6, "performBlockAndWait:", &v11);
    if (v23[5])
    {
      v5 = objc_retainAutorelease((id)v23[5]);
      *v34 = v5;
    }
    objc_storeStrong(v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    _Block_object_dispose(&v22, 8);
    objc_storeStrong(&v28, 0);
    v29 = 0;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __36__AMDKVStore_setValue_forKey_error___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id *location;
  id v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  v2 = (void *)MEMORY[0x1E0C97B20];
  v4 = (id)+[AMDKVStore entity](AMDKVStore, "entity");
  v3 = (id)objc_msgSend(v4, "name");
  v8[0] = (id)objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:");

  objc_msgSend(v8[0], "setKey:", a1[5]);
  objc_msgSend(v8[0], "setValue:", a1[6]);
  v1 = (void *)a1[7];
  location = (id *)(*(_QWORD *)(a1[8] + 8) + 40);
  v7 = *location;
  objc_msgSend(v1, "save:", &v7);
  objc_storeStrong(location, v7);
  objc_storeStrong(v8, 0);
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
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __40__AMDKVStore_deleteWithPredicate_error___block_invoke;
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

void __40__AMDKVStore_deleteWithPredicate_error___block_invoke(_QWORD *a1)
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
  v11 = (id)+[AMDKVStore entity](AMDKVStore, "entity");
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

+ (id)fetchEntryForKey:(id)a3 error:(id *)a4
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
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v6, "getManagedObjectContext");

  v5 = v15;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __37__AMDKVStore_fetchEntryForKey_error___block_invoke;
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

void __37__AMDKVStore_fetchEntryForKey_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12[3];

  v12[2] = a1;
  v12[1] = a1;
  v6 = (void *)MEMORY[0x1E0C97B48];
  v8 = (id)+[AMDKVStore entity](AMDKVStore, "entity");
  v7 = (id)objc_msgSend(v8, "name");
  v12[0] = (id)objc_msgSend(v6, "fetchRequestWithEntityName:");

  if (a1[4])
  {
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("key == %@"), a1[4]);
    objc_msgSend(v12[0], "setPredicate:", v11);
    objc_storeStrong(&v11, 0);
  }
  objc_msgSend(v12[0], "setResultType:", 2);
  v1 = (void *)a1[5];
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v10 = *v4;
  v5 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v12[0], &v10);
  objc_storeStrong(v4, v10);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v5;

  objc_storeStrong(v12, 0);
}

+ (id)fetchAllKeyValues:(id *)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD __b[8];
  id v17;
  id v18;
  id v19;
  id *v20;
  SEL v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = a1;
  v21 = a2;
  v20 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = (id)objc_msgSend(v22, "fetchEntryForKey:error:", 0, v20);
  memset(__b, 0, sizeof(__b));
  obj = v18;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v17 = *(id *)(__b[1] + 8 * v10);
      v15 = (id)objc_msgSend(v17, "objectForKey:", CFSTR("value"));
      v14 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 4, v20);
      v6 = v19;
      v5 = v14;
      v7 = (id)objc_msgSend(v17, "objectForKey:", CFSTR("key"));
      objc_msgSend(v6, "setObject:forKey:", v5);

      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
        if (!v11)
          break;
      }
    }
  }

  v4 = v19;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  return v4;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDKVStore"), a2, a1);
}

@end
