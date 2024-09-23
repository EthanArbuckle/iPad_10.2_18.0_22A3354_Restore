@implementation AMDAppTabInfo

+ (void)saveTabInfo:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13[2];
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id v21;
  id v22;
  id *v23;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v22 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v21 = (id)objc_msgSend(v22, "getManagedObjectContext");
  v14 = 0;
  v15 = &v14;
  v16 = 838860800;
  v17 = 48;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v5 = v21;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __35__AMDAppTabInfo_saveTabInfo_error___block_invoke;
  v10 = &unk_1EA4B5170;
  v11 = location[0];
  v12 = v21;
  v13[0] = v22;
  v13[1] = &v14;
  objc_msgSend(v5, "performBlockAndWait:", &v6);
  if (v15[5])
    *v23 = objc_retainAutorelease((id)v15[5]);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __35__AMDAppTabInfo_saveTabInfo_error___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[8];
  uint64_t v22;
  int v23;
  id v24;
  _QWORD __b[8];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = a1;
  v27 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v18)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v18;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      v26 = *(_QWORD *)(__b[1] + 8 * v14);
      v24 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v26);
      if (v24)
      {
        memset(v21, 0, sizeof(v21));
        v10 = v24;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v21, v29, 16);
        if (v11)
        {
          v7 = *(_QWORD *)v21[2];
          v8 = 0;
          v9 = v11;
          while (1)
          {
            v6 = v8;
            if (*(_QWORD *)v21[2] != v7)
              objc_enumerationMutation(v10);
            v22 = *(_QWORD *)(v21[1] + 8 * v8);
            v3 = (void *)MEMORY[0x1E0C97B20];
            v5 = (id)+[AMDAppTabInfo entity](AMDAppTabInfo, "entity");
            v4 = (id)objc_msgSend(v5, "name");
            v20 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

            objc_msgSend(v20, "setTabName:", v26);
            objc_msgSend(v20, "setUseCaseId:", v22);
            objc_storeStrong(&v20, 0);
            ++v8;
            if (v6 + 1 >= v9)
            {
              v8 = 0;
              v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v21, v29, 16);
              if (!v9)
                break;
            }
          }
        }

        v23 = 0;
      }
      else
      {
        v23 = 3;
      }
      objc_storeStrong(&v24, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v15)
          break;
      }
    }
  }

  v1 = *(void **)(a1 + 48);
  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v19 = *v2;
  objc_msgSend(v1, "save:", &v19);
  objc_storeStrong(v2, v19);
}

+ (id)refreshTabsForUseCase:(id)a3 tabs:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21[2];
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;
  id v30;
  id v31;
  int v32;
  id v33;
  id *v34;
  id v35;
  id location[2];
  id v37;
  id v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v37 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = a5;
  v33 = (id)objc_msgSend(v37, "deleteTabsForUseCase:error:", location[0], a5);
  if (*a5)
  {
    v38 = 0;
    v32 = 1;
  }
  else
  {
    if (v33)
      objc_storeStrong(&v33, v33);
    else
      objc_storeStrong(&v33, &unk_1EA4CEBD8);
    v10 = (void *)MEMORY[0x1E0C99E08];
    v39 = CFSTR("deletedForRefresh");
    v40[0] = v33;
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v31 = (id)objc_msgSend(v10, "dictionaryWithDictionary:");

    v30 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
    v29 = (id)objc_msgSend(v30, "getManagedObjectContext");
    v22 = 0;
    v23 = &v22;
    v24 = 838860800;
    v25 = 48;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v8 = v29;
    v13 = MEMORY[0x1E0C809B0];
    v14 = -1073741824;
    v15 = 0;
    v16 = __50__AMDAppTabInfo_refreshTabsForUseCase_tabs_error___block_invoke;
    v17 = &unk_1EA4B5198;
    v18 = v35;
    v19 = v29;
    v20 = location[0];
    v21[0] = v30;
    v21[1] = &v22;
    objc_msgSend(v8, "performBlockAndWait:", &v13);
    if (v23[5])
    {
      *v34 = objc_retainAutorelease((id)v23[5]);
      v38 = 0;
    }
    else
    {
      v7 = v31;
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      objc_msgSend(v7, "setObject:forKey:");

      v38 = v31;
    }
    v32 = 1;
    objc_storeStrong(v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    _Block_object_dispose(&v22, 8);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  return v38;
}

void __50__AMDAppTabInfo_refreshTabsForUseCase_tabs_error___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD __b[8];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = a1;
  v17 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
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
      v16 = *(_QWORD *)(__b[1] + 8 * v8);
      v3 = (void *)MEMORY[0x1E0C97B20];
      v5 = (id)+[AMDAppTabInfo entity](AMDAppTabInfo, "entity");
      v4 = (id)objc_msgSend(v5, "name");
      v14 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

      objc_msgSend(v14, "setTabName:", v16);
      objc_msgSend(v14, "setUseCaseId:", *(_QWORD *)(a1 + 48));
      objc_storeStrong(&v14, 0);
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v9)
          break;
      }
    }
  }

  v1 = *(void **)(a1 + 56);
  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v13 = *v2;
  objc_msgSend(v1, "save:", &v13);
  objc_storeStrong(v2, v13);
}

+ (id)deleteTabsForUseCase:(id)a3 error:(id *)a4
{
  id v4;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
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
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v7 = v30;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __44__AMDAppTabInfo_deleteTabsForUseCase_error___block_invoke;
  v12 = &unk_1EA4B51C0;
  v13 = location[0];
  v14 = v30;
  v15[1] = &v23;
  v15[0] = v31;
  v15[2] = &v16;
  objc_msgSend(v7, "performBlockAndWait:", &v8);
  if (v24[5])
  {
    v4 = objc_retainAutorelease((id)v24[5]);
    *v32 = v4;
    v34 = 0;
  }
  else
  {
    v34 = (id)v17[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v34;
}

void __44__AMDAppTabInfo_deleteTabsForUseCase_error___block_invoke(_QWORD *a1)
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
  id v18;
  id v19[3];

  v19[2] = a1;
  v19[1] = a1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v9 = (id)+[AMDAppTabInfo entity](AMDAppTabInfo, "entity");
  v8 = (id)objc_msgSend(v9, "name");
  v19[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  v18 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("useCaseId == %@"), a1[4]);
  objc_msgSend(v19[0], "setPredicate:", v18);
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v19[0]);
  objc_msgSend(v17, "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v15 = *location;
  v11 = (id)objc_msgSend(v1, "executeRequest:error:", v17, &v15);
  objc_storeStrong(location, v15);
  v16 = v11;
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
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (id)getInfoForTab:(id)a3 error:(id *)a4
{
  id v4;
  id v6;
  id v7;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *);
  void *v13;
  id v14;
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
  int v31;
  id *v32;
  id location[3];
  id v34;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = a4;
  if (location[0])
  {
    v24 = 0;
    v25 = &v24;
    v26 = 838860800;
    v27 = 48;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 838860800;
    v20 = 48;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v7 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
    v16 = (id)objc_msgSend(v7, "getManagedObjectContext");

    v6 = v16;
    v9 = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __37__AMDAppTabInfo_getInfoForTab_error___block_invoke;
    v13 = &unk_1EA4B51E8;
    v14 = location[0];
    v15[0] = v16;
    v15[1] = &v24;
    v15[2] = &v17;
    objc_msgSend(v6, "performBlockAndWait:", &v9);
    if (v25[5])
    {
      v4 = objc_retainAutorelease((id)v25[5]);
      *v32 = v4;
      v34 = 0;
    }
    else
    {
      v34 = (id)v18[5];
    }
    v31 = 1;
    objc_storeStrong(v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v16, 0);
    _Block_object_dispose(&v17, 8);
    objc_storeStrong(&v23, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("no tab name"));
    v34 = 0;
    v31 = 1;
  }
  objc_storeStrong(location, 0);
  return v34;
}

void __37__AMDAppTabInfo_getInfoForTab_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;
  id *location;
  id v15;
  id v16;
  id obj;
  uint64_t v19;
  _QWORD __b[8];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[3];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25[2] = a1;
  v25[1] = a1;
  v11 = (void *)MEMORY[0x1E0C97B48];
  v13 = (id)+[AMDAppTabInfo entity](AMDAppTabInfo, "entity");
  v12 = (id)objc_msgSend(v13, "name");
  v25[0] = (id)objc_msgSend(v11, "fetchRequestWithEntityName:");

  v24 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("tabName == %@"), a1[4]);
  objc_msgSend(v25[0], "setPredicate:", v24);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v22 = *location;
  v15 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v25[0], &v22);
  objc_storeStrong(location, v22);
  v23 = v15;
  v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v2 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v23, "count"));
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  memset(__b, 0, sizeof(__b));
  obj = v23;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v19)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v19;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v21 = *(id *)(__b[1] + 8 * v9);
      v5 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      v6 = (id)objc_msgSend(v21, "useCaseId");
      objc_msgSend(v5, "addObject:");

      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v10)
          break;
      }
    }
  }

  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
}

+ (id)deleteAllTabs:(id *)a3
{
  id v3;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *);
  void *v10;
  id v11;
  id v12[3];
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
  id location;
  id v28;
  id *v29;
  SEL v30;
  id v31;
  id v32;

  v31 = a1;
  v30 = a2;
  v29 = a3;
  v28 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  location = (id)objc_msgSend(v28, "getManagedObjectContext");
  v20 = 0;
  v21 = &v20;
  v22 = 838860800;
  v23 = 48;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = location;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __31__AMDAppTabInfo_deleteAllTabs___block_invoke;
  v10 = &unk_1EA4B5210;
  v11 = location;
  v12[1] = &v20;
  v12[0] = v28;
  v12[2] = &v13;
  objc_msgSend(v5, "performBlockAndWait:", &v6);
  if (v21[5])
  {
    v3 = objc_retainAutorelease((id)v21[5]);
    *v29 = v3;
    v32 = 0;
  }
  else
  {
    v32 = (id)v14[5];
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v28, 0);
  return v32;
}

void __31__AMDAppTabInfo_deleteAllTabs___block_invoke(_QWORD *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id *location;
  id v11;
  id *v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18[3];

  v18[2] = a1;
  v18[1] = a1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v9 = (id)+[AMDAppTabInfo entity](AMDAppTabInfo, "entity");
  v8 = (id)objc_msgSend(v9, "name");
  v18[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  v1 = objc_alloc(MEMORY[0x1E0C97A90]);
  v17 = (id)objc_msgSend(v1, "initWithFetchRequest:", v18[0]);
  objc_msgSend(v17, "setResultType:", 2);
  v2 = (void *)a1[4];
  location = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v15 = *location;
  v11 = (id)objc_msgSend(v2, "executeRequest:error:", v17, &v15);
  objc_storeStrong(location, v15);
  v16 = v11;
  v3 = (void *)a1[5];
  v12 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v14 = *v12;
  objc_msgSend(v3, "save:", &v14);
  objc_storeStrong(v12, v14);
  v4 = (id)objc_msgSend(v16, "result");
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)fetchAllTabInfo:(id *)a3
{
  id v3;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *);
  void *v11;
  id v12[3];
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
  id location;
  id *v28;
  SEL v29;
  id v30;
  id v31;

  v30 = a1;
  v29 = a2;
  v28 = a3;
  v5 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  location = (id)objc_msgSend(v5, "getManagedObjectContext");

  v20 = 0;
  v21 = &v20;
  v22 = 838860800;
  v23 = 48;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = location;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __33__AMDAppTabInfo_fetchAllTabInfo___block_invoke;
  v11 = &unk_1EA4B5238;
  v12[1] = &v13;
  v12[0] = location;
  v12[2] = &v20;
  objc_msgSend(v6, "performBlockAndWait:", &v7);
  if (v21[5])
  {
    v3 = objc_retainAutorelease((id)v21[5]);
    *v28 = v3;
    v31 = 0;
  }
  else
  {
    v31 = (id)v14[5];
  }
  objc_storeStrong(v12, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  return v31;
}

void __33__AMDAppTabInfo_fetchAllTabInfo___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDAppTabInfo entity](AMDAppTabInfo, "entity");
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

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDAppTabInfo"), a2, a1);
}

@end
