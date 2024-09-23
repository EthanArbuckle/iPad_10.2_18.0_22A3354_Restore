@implementation AMDStorage

+ (unsigned)saveRecords:(id)a3 inTable:(id)a4 error:(id *)a5
{
  uint64_t v5;
  unsigned int v7;
  id v10;
  id *v11;
  id v12;
  id location[2];
  id v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(location[0], "count");
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v15, v5, (uint64_t)v12);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "Saving %lu events to table %@", v15, 0x16u);
  }
  objc_storeStrong(&v10, 0);
  v7 = objc_msgSend(v14, "saveRecordsToCoreData:inTable:error:", location[0], v12, v11);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)fetchRecordsFrom:(id)a3 error:(id *)a4
{
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(v8, "fetchCoreDataRecordsFrom:error:", location[0], a4);
  objc_storeStrong(location, 0);
  return v6;
}

+ (unsigned)deleteRecordsFrom:(id)a3 usingPredicates:(id)a4 error:(id *)a5
{
  unsigned int v8;
  id v9;
  id location[2];
  id v11;

  v11 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = objc_msgSend(v11, "deleteCoreDataRecordsFrom:usingPredicates:error:", location[0], v9, a5);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (unsigned)saveRecordsToCoreData:(id)a3 inTable:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  id v8;
  os_log_t oslog;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20[3];
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  SEL v28;
  id v29;
  id v30;
  id *v31;
  id v32;
  id location[3];
  unsigned int v34;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = a5;
  v30 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v29 = (id)objc_msgSend(v30, "getManagedObjectContext");
  v28 = NSSelectorFromString(CFSTR("populateRecord:"));
  v21 = 0;
  v22 = &v21;
  v23 = 838860800;
  v24 = 48;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v8 = v29;
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __50__AMDStorage_saveRecordsToCoreData_inTable_error___block_invoke;
  v16 = &unk_1EA4B54B0;
  v17 = location[0];
  v18 = v32;
  v19 = v29;
  v20[2] = (id)v28;
  v20[1] = &v21;
  v20[0] = v30;
  objc_msgSend(v8, "performBlockAndWait:", &v12);
  if (v22[5])
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(location[0], "count");
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v35, v7, (uint64_t)v32);
      _os_log_debug_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEBUG, "Failed to save %lu events to table %@", v35, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v6 = objc_retainAutorelease((id)v22[5]);
    *v31 = v6;
    v34 = 0;
  }
  else
  {
    v34 = objc_msgSend(location[0], "count");
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v34;
}

void __50__AMDStorage_saveRecordsToCoreData_inTable_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id *v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v13;
  id v14[2];
  void *v15;
  int v16;
  os_log_type_t type;
  os_log_t oslog;
  id v19;
  id v20;
  _QWORD __b[8];
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[24];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v24 = a1;
  v23 = 0;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v13)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v13;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v22 = *(_QWORD *)(__b[1] + 8 * v9);
      v20 = (id)objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      if ((v23 & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      {
        v23 = 1;
        v15 = 0;
        v15 = (void *)objc_msgSend(v20, "methodForSelector:", *(_QWORD *)(a1 + 72));
        v14[1] = v15;
        ((void (*)(id, _QWORD, uint64_t))v15)(v20, *(_QWORD *)(a1 + 72), v22);
        v16 = 0;
      }
      else
      {
        v19 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MO for table '%@' missing selector 'populateRecord'"), *(_QWORD *)(a1 + 40));
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v19);
          _os_log_error_impl(&dword_1DC678000, log, type, "%@", v26, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v1 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v19);
        v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v3 = *(void **)(v2 + 40);
        *(_QWORD *)(v2 + 40) = v1;

        v16 = 2;
        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong(&v20, 0);
      if (v16)
        break;
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v10)
          goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v16 = 0;
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v4 = *(void **)(a1 + 56);
    v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v14[0] = *v5;
    objc_msgSend(v4, "save:", v14);
    objc_storeStrong(v5, v14[0]);
  }
}

+ (id)fetchCoreDataRecordsFrom:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *);
  void *v13;
  id v14;
  id v15[3];
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
  id v30;
  id v31;
  id *v32;
  id location[3];
  id v34;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = a4;
  v31 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v30 = (id)objc_msgSend(v31, "getManagedObjectContext");
  v23 = 0;
  v24 = &v23;
  v25 = 838860800;
  v26 = 48;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v8 = v30;
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __45__AMDStorage_fetchCoreDataRecordsFrom_error___block_invoke;
  v13 = &unk_1EA4B5210;
  v14 = location[0];
  v15[1] = &v16;
  v15[0] = v30;
  v15[2] = &v23;
  objc_msgSend(v8, "performBlockAndWait:", &v9);
  if (v24[5])
  {
    v4 = objc_retainAutorelease((id)v24[5]);
    *v32 = v4;
    v34 = 0;
  }
  else
  {
    if (v17[5])
      v5 = (id)v17[5];
    else
      v5 = MEMORY[0x1E0C9AA60];
    v34 = v5;
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v34;
}

void __45__AMDStorage_fetchCoreDataRecordsFrom_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id *location;
  id v6;
  id v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  v8[0] = (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", a1[4]);
  objc_msgSend(v8[0], "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v7 = *location;
  v6 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v8[0], &v7);
  objc_storeStrong(location, v7);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v6;

  objc_storeStrong(v8, 0);
}

+ (unsigned)deleteCoreDataRecordsFrom:(id)a3 usingPredicates:(id)a4 error:(id *)a5
{
  id v5;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18[3];
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;
  id v32;
  id *v33;
  id v34;
  id location[3];
  unsigned int v36;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = a5;
  v32 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v31 = (id)objc_msgSend(v32, "getManagedObjectContext");
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x20000000;
  v22 = 32;
  v23 = 0;
  v9 = v31;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __62__AMDStorage_deleteCoreDataRecordsFrom_usingPredicates_error___block_invoke;
  v14 = &unk_1EA4B54D8;
  v15 = location[0];
  v16 = v34;
  v17 = v31;
  v18[1] = &v24;
  v18[0] = v32;
  v18[2] = &v19;
  objc_msgSend(v9, "performBlockAndWait:", &v10);
  if (v25[5])
  {
    v5 = objc_retainAutorelease((id)v25[5]);
    *v33 = v5;
    v36 = 0;
  }
  else
  {
    v36 = *((_DWORD *)v20 + 6);
  }
  objc_storeStrong(v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v36;
}

void __62__AMDStorage_deleteCoreDataRecordsFrom_usingPredicates_error___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id *location;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  id v19;
  int v20;
  id v21;
  id v22;
  id v23;
  _QWORD __b[8];
  uint64_t v25;
  id v26;
  id v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27[2] = (id)a1;
  v27[1] = (id)a1;
  v27[0] = (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_QWORD *)(a1 + 40))
  {
    memset(__b, 0, sizeof(__b));
    obj = *(id *)(a1 + 40);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    if (v17)
    {
      v13 = *(_QWORD *)__b[2];
      v14 = 0;
      v15 = v17;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)__b[2] != v13)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(__b[1] + 8 * v14);
        v10 = v26;
        v11 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v25);
        objc_msgSend(v10, "addObject:");

        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v15)
            break;
        }
      }
    }

  }
  v6 = v27[0];
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v26);
  objc_msgSend(v6, "setPredicate:");

  v1 = objc_alloc(MEMORY[0x1E0C97A90]);
  v23 = (id)objc_msgSend(v1, "initWithFetchRequest:", v27[0]);
  objc_msgSend(v23, "setResultType:", 2);
  v2 = *(void **)(a1 + 48);
  location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v21 = *location;
  v9 = (id)objc_msgSend(v2, "executeRequest:error:", v23, &v21);
  objc_storeStrong(location, v21);
  v22 = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v20 = 1;
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v19 = *v4;
    objc_msgSend(v3, "save:", &v19);
    objc_storeStrong(v4, v19);
    v5 = (id)objc_msgSend(v22, "result");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v5, "unsignedIntValue");

    v20 = 0;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
}

+ (id)persistFitnessData:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id obj;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD __b[8];
  uint64_t v22;
  id v23;
  id location[3];
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = (id)objc_msgSend(location[0], "allKeys");
  v3 = +[AMDSQLite deleteEventsWithPredicate:forStreams:](AMDSQLite, "deleteEventsWithPredicate:forStreams:", 0);

  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v16)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v16;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v22 = *(_QWORD *)(__b[1] + 8 * v12);
      v20 = 0;
      v25[0] = 0x1EA4B92E8;
      v26[0] = v22;
      v25[1] = 0x1EA4B92C8;
      v8 = (id)objc_msgSend(location[0], "objectForKey:", v22);
      v26[1] = v8;
      v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);

      v17 = v20;
      v9 = +[AMDSQLite saveEvents:error:](AMDSQLite, "saveEvents:error:", v19, &v17);
      objc_storeStrong(&v20, v17);
      v18 = v9;
      if (v20)
      {
        v6 = v23;
        v7 = (id)objc_msgSend(v20, "localizedDescription");
        objc_msgSend(v6, "setObject:forKey:");

      }
      if (v18)
        objc_msgSend(v23, "setObject:forKey:", v18, v22);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v20, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v13)
          break;
      }
    }
  }

  v5 = v23;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
