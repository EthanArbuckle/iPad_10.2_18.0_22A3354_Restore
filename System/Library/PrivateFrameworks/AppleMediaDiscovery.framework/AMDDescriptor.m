@implementation AMDDescriptor

+ (id)deleteAll:(id *)a3
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
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  v27 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 838860800;
  v17 = 48;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v13 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v12 = (id)objc_msgSend(v13, "getManagedObjectContext");
  v4 = v12;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __27__AMDDescriptor_deleteAll___block_invoke;
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

void __27__AMDDescriptor_deleteAll___block_invoke(_QWORD *a1)
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
  v9 = (id)+[AMDDescriptor entity](AMDDescriptor, "entity");
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

+ (id)refreshDescriptors:(id)a3 forDomain:(int64_t)a4 error:(id *)a5
{
  id v5;
  id v7;
  id v8;
  id v9;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  os_log_type_t v29;
  id v30;
  id v31;
  os_log_type_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int v36;
  int v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  id *v42;
  void *v43;
  id location[2];
  id v45;
  uint8_t v46[16];
  uint8_t v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = (void *)a4;
  v42 = a5;
  v41 = (id)objc_msgSend(v45, "deleteAll:", a5);
  v34 = 0;
  v35 = &v34;
  v36 = 838860800;
  v37 = 48;
  v38 = __Block_byref_object_copy__11;
  v39 = __Block_byref_object_dispose__11;
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (*v42)
  {
    v33 = MEMORY[0x1E0C81028];
    v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      v9 = (id)objc_msgSend(*v42, "localizedDescription");
      v31 = v9;
      __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v31);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v33, v32, "Error deleting descriptors: %@", v47, 0xCu);

      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v33, 0);
    *v42 = 0;
  }
  else
  {
    if (v41)
      objc_storeStrong(&v41, v41);
    else
      objc_storeStrong(&v41, &unk_1EA4CF5C8);
    v30 = MEMORY[0x1E0C81028];
    v29 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v46, objc_msgSend(v41, "unsignedIntValue"));
      _os_log_impl(&dword_1DC678000, (os_log_t)v30, v29, "Deleted %u descriptors", v46, 8u);
    }
    objc_storeStrong(&v30, 0);
    objc_msgSend((id)v35[5], "setObject:forKey:", v41, CFSTR("deletedForRefresh"));
  }
  v22 = 0;
  v23 = &v22;
  v24 = 838860800;
  v25 = 48;
  v26 = __Block_byref_object_copy__11;
  v27 = __Block_byref_object_dispose__11;
  v28 = 0;
  v21 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v20 = (id)objc_msgSend(v21, "getManagedObjectContext");
  v8 = v20;
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __52__AMDDescriptor_refreshDescriptors_forDomain_error___block_invoke;
  v16 = &unk_1EA4B5D98;
  v17 = location[0];
  v19[1] = &v22;
  v18 = v20;
  v19[3] = v43;
  v19[2] = &v34;
  v19[0] = v21;
  objc_msgSend(v8, "performBlockAndWait:", &v12);
  if (v23[5])
  {
    v5 = objc_retainAutorelease((id)v23[5]);
    *v42 = v5;
  }
  v7 = (id)v35[5];
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  _Block_object_dispose(&v34, 8);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __52__AMDDescriptor_refreshDescriptors_forDomain_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id *location;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id obj;
  uint64_t v31;
  id v32;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD v35[8];
  uint64_t v36;
  id v37;
  int v38;
  id v39;
  id v40;
  _QWORD __b[8];
  uint64_t v42;
  char v43;
  id v44[3];
  uint8_t v45[24];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v44[2] = (id)a1;
  v44[1] = (id)a1;
  v44[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
  if (v31)
  {
    v26 = *(_QWORD *)__b[2];
    v27 = 0;
    v28 = v31;
    while (1)
    {
      v25 = v27;
      if (*(_QWORD *)__b[2] != v26)
        objc_enumerationMutation(obj);
      v42 = *(_QWORD *)(__b[1] + 8 * v27);
      v21 = (void *)MEMORY[0x1E0CB36D8];
      v24 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v42);
      location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v39 = *location;
      v23 = (id)objc_msgSend(v21, "dataWithJSONObject:options:error:");
      objc_storeStrong(location, v39);
      v40 = v23;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        goto LABEL_29;
      if (v40)
      {
        v18 = (void *)MEMORY[0x1E0C97B20];
        v20 = (id)+[AMDDescriptor entity](AMDDescriptor, "entity");
        v19 = (id)objc_msgSend(v20, "name");
        v37 = (id)objc_msgSend(v18, "insertNewObjectForEntityForName:inManagedObjectContext:");

        objc_msgSend(v37, "setFeatureName:", v42);
        objc_msgSend(v37, "setDescriptor:", v40);
        objc_msgSend(v37, "setDomain:", (__int16)*(_QWORD *)(a1 + 72));
        objc_msgSend(v44[0], "addObject:", v37);
        objc_storeStrong(&v37, 0);
        v38 = 0;
      }
      else
      {
LABEL_29:
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v1 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 11, CFSTR("could not serialize descriptor data"));
          v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v3 = *(void **)(v2 + 40);
          *(_QWORD *)(v2 + 40) = v1;

        }
        v43 = 1;
        v38 = 2;
      }
      objc_storeStrong(&v40, 0);
      if (v38)
        break;
      ++v27;
      if (v25 + 1 >= v28)
      {
        v27 = 0;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
        if (!v28)
          goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v38 = 0;
  }

  if ((v43 & 1) != 0)
  {
    memset(v35, 0, sizeof(v35));
    v16 = v44[0];
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v35, v46, 16);
    if (v17)
    {
      v13 = *(_QWORD *)v35[2];
      v14 = 0;
      v15 = v17;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)v35[2] != v13)
          objc_enumerationMutation(v16);
        v36 = *(_QWORD *)(v35[1] + 8 * v14);
        objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v36);
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v35, v46, 16);
          if (!v15)
            break;
        }
      }
    }

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v8 = (void *)MEMORY[0x1E0CB3940];
    v11 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "localizedDescription");
    v10 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("error: %@"), v11);
    objc_msgSend(v9, "setObject:forKey:");

  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44[0], "count"));
    objc_msgSend(v6, "setObject:forKey:");

    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v45, objc_msgSend(v44[0], "count"));
      _os_log_impl(&dword_1DC678000, oslog, type, "Added %lu descriptors", v45, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v4 = *(void **)(a1 + 48);
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v32 = *v5;
  objc_msgSend(v4, "save:", &v32);
  objc_storeStrong(v5, v32);
  objc_storeStrong(v44, 0);
}

+ (id)getDescriptorsForDomain:(int64_t)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *);
  void *v11;
  id v12[4];
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
  void *v29;
  SEL v30;
  id v31;
  id v32;

  v31 = a1;
  v30 = a2;
  v29 = (void *)a3;
  v28 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 838860800;
  v24 = 48;
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  v27 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 838860800;
  v17 = 48;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v13 = (id)objc_msgSend(v6, "getManagedObjectContext");

  v5 = v13;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __47__AMDDescriptor_getDescriptorsForDomain_error___block_invoke;
  v11 = &unk_1EA4B5DC0;
  v12[3] = v29;
  v12[0] = v13;
  v12[1] = &v21;
  v12[2] = &v14;
  objc_msgSend(v5, "performBlockAndWait:", &v7);
  if (v22[5])
  {
    *v28 = objc_retainAutorelease((id)v22[5]);
    v32 = 0;
  }
  else
  {
    v32 = (id)v15[5];
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  return v32;
}

void __47__AMDDescriptor_getDescriptorsForDomain_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id obj;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id *location;
  id v23;
  id v25;
  id v26;
  _QWORD __b[8];
  id v28;
  int v29;
  id v30;
  id v31;
  id v32;
  id v33[3];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33[2] = a1;
  v33[1] = a1;
  v19 = (void *)MEMORY[0x1E0C97B48];
  v21 = (id)+[AMDDescriptor entity](AMDDescriptor, "entity");
  v20 = (id)objc_msgSend(v21, "name");
  v33[0] = (id)objc_msgSend(v19, "fetchRequestWithEntityName:");

  v32 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d"), a1[7]);
  objc_msgSend(v33[0], "setPredicate:", v32);
  v1 = (void *)a1[4];
  location = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v30 = *location;
  v23 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v33[0], &v30);
  objc_storeStrong(location, v30);
  v31 = v23;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v29 = 1;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    v2 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v31, "count"));
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    memset(__b, 0, sizeof(__b));
    obj = v31;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
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
        v28 = *(id *)(__b[1] + 8 * v14);
        v8 = (void *)MEMORY[0x1E0CB36D8];
        v11 = (id)objc_msgSend(v28, "descriptor");
        v9 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
        v25 = *v9;
        v10 = (id)objc_msgSend(v8, "JSONObjectWithData:options:error:");
        objc_storeStrong(v9, v25);
        v26 = v10;

        if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
        {
          v29 = 1;
        }
        else
        {
          v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          v5 = v26;
          v7 = (id)objc_msgSend(v28, "featureName");
          objc_msgSend(v6, "setValue:forKey:", v5);

          v29 = 0;
        }
        objc_storeStrong(&v26, 0);
        if (v29)
          break;
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
          if (!v15)
            goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v29 = 0;
    }

    if (!v29)
      v29 = 0;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v33, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDDescriptor"), a2, a1);
}

@end
