@implementation AMDTasteProfile

+ (id)fetchTasteProfile:(id *)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id location;
  id v21;
  os_log_type_t type;
  os_log_t oslog;
  id v24;
  _QWORD __b[8];
  id v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(_QWORD *);
  void *v32;
  id v33[3];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  int v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  id *v49;
  SEL v50;
  id v51;
  id v52;
  uint8_t v53[24];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v51 = a1;
  v50 = a2;
  v49 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 838860800;
  v45 = 48;
  v46 = __Block_byref_object_copy__8;
  v47 = __Block_byref_object_dispose__8;
  v48 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 838860800;
  v38 = 48;
  v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  v41 = 0;
  v19 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v34 = (id)objc_msgSend(v19, "getManagedObjectContext");

  v18 = v34;
  v28 = MEMORY[0x1E0C809B0];
  v29 = -1073741824;
  v30 = 0;
  v31 = __37__AMDTasteProfile_fetchTasteProfile___block_invoke;
  v32 = &unk_1EA4B5238;
  v33[1] = &v35;
  v33[0] = v34;
  v33[2] = &v42;
  objc_msgSend(v18, "performBlockAndWait:", &v28);
  if (v43[5])
  {
    v17 = objc_retainAutorelease((id)v43[5]);
    *v49 = v17;
    v52 = 0;
    v27 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)v36[5];
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
    if (v16)
    {
      v12 = *(_QWORD *)__b[2];
      v13 = 0;
      v14 = v16;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(obj);
        v26 = *(id *)(__b[1] + 8 * v13);
        v10 = (void *)MEMORY[0x1E0CB36D8];
        v9 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("value"));
        v24 = (id)objc_msgSend(v10, "JSONObjectWithData:options:error:");

        if (*v49)
        {
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            v8 = type;
            v5 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("feeatureName"));
            v6 = v5;
            v21 = v6;
            v4 = (id)objc_msgSend(*v49, "localizedDescription");
            location = v4;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v53, (uint64_t)v6, (uint64_t)location);
            _os_log_error_impl(&dword_1DC678000, log, v8, "error deserializing value for feature %@: %@", v53, 0x16u);

            objc_storeStrong(&location, 0);
            objc_storeStrong(&v21, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
          v52 = 0;
          v27 = 1;
        }
        else
        {
          objc_msgSend(v26, "setValue:forKey:", v24, CFSTR("value"));
          v27 = 0;
        }
        objc_storeStrong(&v24, 0);
        if (v27)
          break;
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
          if (!v14)
            goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      v27 = 0;
    }

    if (!v27)
    {
      v52 = (id)v36[5];
      v27 = 1;
    }
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  _Block_object_dispose(&v35, 8);
  objc_storeStrong(&v41, 0);
  _Block_object_dispose(&v42, 8);
  objc_storeStrong(&v48, 0);
  return v52;
}

void __37__AMDTasteProfile_fetchTasteProfile___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDTasteProfile entity](AMDTasteProfile, "entity");
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

+ (id)getUserIdForDomain:(id)a3
{
  id v3;
  id v5;
  char v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  id v12;
  id v13;

  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  v8 = 0;
  v5 = (id)objc_msgSend(v12, "getFeatureWithName:inDomain:withColumnName:error:", CFSTR("OD_DSID"), location[0], 0, &v8);
  objc_storeStrong(&v10, v8);
  v9 = v5;
  v6 = 0;
  if (v5)
  {
    v7 = (id)objc_msgSend(v9, "getValue");
    v6 = 1;
    v3 = v7;
  }
  else
  {
    v3 = 0;
  }
  v13 = v3;
  if ((v6 & 1) != 0)

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)getStorefrontIdForDomain:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  id v15;
  id v16;

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  v11 = 0;
  v8 = (id)objc_msgSend(v15, "getFeatureWithName:inDomain:withColumnName:error:", CFSTR("OD_STOREFRONT_ID"), location[0], 0, &v11);
  objc_storeStrong(&v13, v11);
  v12 = v8;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v9, "setNumberStyle:", 1);
    v4 = v9;
    v7 = (id)objc_msgSend(v12, "getValue");
    v6 = (id)objc_msgSend(v7, "allKeys");
    v5 = (id)objc_msgSend(v6, "firstObject");
    v16 = (id)objc_msgSend(v4, "numberFromString:");

    v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v16 = 0;
    v10 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)getEntries:(id)a3 error:(id *)a4
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
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v6, "getManagedObjectContext");

  v5 = v15;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __36__AMDTasteProfile_getEntries_error___block_invoke;
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

void __36__AMDTasteProfile_getEntries_error___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDTasteProfile entity](AMDTasteProfile, "entity");
  v5 = (id)objc_msgSend(v6, "name");
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  objc_msgSend(v11[0], "setPredicate:", a1[4]);
  objc_msgSend(v11[0], "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v10 = *location;
  v9 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v11[0], &v10);
  objc_storeStrong(location, v10);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (id)getFeatureValueWithName:(id)a3 inDomain:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  os_log_type_t type;
  id v16;
  id v19;
  os_log_type_t v20;
  os_log_t oslog;
  id v22;
  id v23;
  os_log_type_t v24;
  id v25;
  int v26;
  id v27;
  char v28;
  id v29;
  id v30;
  int64_t v31;
  id v32;
  id *v33;
  id v34;
  id location[3];
  id v36;
  uint8_t v37[32];
  uint8_t v38[32];
  uint8_t v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = a5;
  *a5 = 0;
  v32 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featureName == %@"), location[0]);
  if (v34 && (objc_msgSend(v34, "isEqualToString:", CFSTR("all")) & 1) == 0)
  {
    v31 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v34);
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %d AND featureName == %@"), v31, location[0]);
    v6 = v32;
    v32 = v5;

  }
  v30 = +[AMDTasteProfile getEntries:error:](AMDTasteProfile, "getEntries:error:", v32, v33);
  if (*v33)
  {
    v29 = MEMORY[0x1E0C81028];
    v28 = 16;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      log = v29;
      type = v28;
      v13 = location[0];
      v16 = (id)objc_msgSend(*v33, "localizedDescription");
      v27 = v16;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v39, (uint64_t)v13, (uint64_t)v27);
      _os_log_error_impl(&dword_1DC678000, log, type, "Error fetching feature %@: %@", v39, 0x16u);

      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(&v29, 0);
    v36 = 0;
    v26 = 1;
  }
  else if (v30 && objc_msgSend(v30, "count"))
  {
    v12 = (id)objc_msgSend(v30, "firstObject");
    v23 = (id)objc_msgSend(v12, "objectForKey:", CFSTR("value"));

    v22 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v23, 4, v33);
    if (*v33)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v9 = oslog;
        v10 = v20;
        v8 = location[0];
        v11 = (id)objc_msgSend(*v33, "localizedDescription");
        v19 = v11;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v8, (uint64_t)v19);
        _os_log_error_impl(&dword_1DC678000, v9, v10, "Error deserializing value for feature %@: %@", v37, 0x16u);

        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v36 = 0;
      v26 = 1;
    }
    else
    {
      v36 = v22;
      v26 = 1;
    }
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    v25 = MEMORY[0x1E0C81028];
    v24 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v38, (uint64_t)location[0], (uint64_t)v34);
      _os_log_impl(&dword_1DC678000, (os_log_t)v25, v24, "Feature '%@' not found, domain: %@", v38, 0x16u);
    }
    objc_storeStrong(&v25, 0);
    v36 = 0;
    v26 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v36;
}

+ (id)getFeatureWithName:(id)a3 inDomain:(id)a4 withColumnName:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v8;
  os_log_t oslog;
  id v14;
  int v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  id location[2];
  id v21;
  id v22;
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = a6;
  v16 = (id)objc_msgSend(v21, "getFeatureValueWithName:inDomain:error:", location[0], v19, a6);
  if (*a6 || !v16)
  {
    *v17 = 0;
    v6 = +[AMDSQLite getFeatureValueWithName:inDomain:withColumnName:skipRowset:error:](AMDSQLite, "getFeatureValueWithName:inDomain:withColumnName:skipRowset:error:", location[0], v19, v18, 1, v17);
    v7 = v16;
    v16 = v6;

  }
  if (*v17)
  {
    v22 = 0;
    v15 = 1;
  }
  else if (v16)
  {
    v22 = +[AMDFeature featureFromValue:](AMDFeature, "featureFromValue:", v16);
    v15 = 1;
  }
  else
  {
    v14 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No feature '%@' in domain '%@'"), location[0], v19);
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v14);
      _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v14);
    *v17 = v8;
    v22 = 0;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v22;
}

+ (id)refreshAggregationTasteProfileForDomain:(id)a3 forUser:(id)a4 andStoreFrontId:(unsigned int)a5 error:(id *)a6
{
  id v6;
  AMDFeatureDescriptor *v7;
  AMDFeatureDescriptor *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *log;
  os_log_type_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint8_t v36[7];
  os_log_type_t v37;
  os_log_t v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  os_log_type_t type;
  os_log_t oslog;
  id v45;
  id v46;
  BOOL v47;
  id v48;
  _QWORD __b[8];
  uint64_t v50;
  id v51;
  id v52;
  BOOL v53;
  id v54;
  id v55;
  int64_t v56;
  int v57;
  id v58;
  id *v59;
  unsigned int v60;
  id v61;
  id location[3];
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  uint8_t v68[16];
  uint8_t v69[24];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v61 = 0;
  objc_storeStrong(&v61, a4);
  v60 = a5;
  v59 = a6;
  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("RefreshODTP"));
  if (+[AMDMiscHelpers isValidDSID:](AMDMiscHelpers, "isValidDSID:", v61))
  {
    v56 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", location[0]);
    if (v56)
    {
      v55 = +[AMDDescriptor getDescriptorsForDomain:error:](AMDDescriptor, "getDescriptorsForDomain:error:", v56, v59);
      if (*v59)
      {
        v63 = 0;
        v57 = 1;
      }
      else
      {
        v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v55, "count"));
        v53 = 0;
        v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(__b, 0, sizeof(__b));
        v31 = v55;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
        if (v32)
        {
          v28 = *(_QWORD *)__b[2];
          v29 = 0;
          v30 = v32;
          while (1)
          {
            v27 = v29;
            if (*(_QWORD *)__b[2] != v28)
              objc_enumerationMutation(v31);
            v50 = *(_QWORD *)(__b[1] + 8 * v29);
            v48 = (id)objc_msgSend(v55, "objectForKey:", v50);
            v47 = 0;
            v6 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("required"));
            v25 = v6 != 0;

            v47 = v25;
            v46 = 0;
            v26 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("version"));

            v7 = [AMDFeatureDescriptor alloc];
            if (v26)
              v8 = -[AMDFeatureDescriptor initWithDictionaryV2:withUserId:featureName:withDomain:](v7, "initWithDictionaryV2:withUserId:featureName:withDomain:", v48, v61, v50, location[0]);
            else
              v8 = -[AMDFeatureDescriptor initWithDictionary:withUserId:featureName:](v7, "initWithDictionary:withUserId:featureName:", v48, v61, v50);
            v9 = v46;
            v46 = v8;

            if (v46)
            {
              v42 = (id)objc_msgSend(v46, "getFeatureData:", v59);
              if (*v59)
              {
                objc_msgSend(v51, "addObject:", v50);
                v53 = v53 || v47;
                v57 = 3;
              }
              else
              {
                if (v42)
                {
                  objc_msgSend(v52, "addObject:", v50);
                  objc_msgSend(v54, "setObject:forKey:", v42, v50);
                }
                else
                {
                  objc_msgSend(v51, "addObject:", v50);
                  v41 = (os_log_t)MEMORY[0x1E0C81028];
                  v40 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    v22 = v41;
                    __os_log_helper_16_2_1_8_64((uint64_t)v68, v50);
                    _os_log_error_impl(&dword_1DC678000, v22, v40, "Nil response obtained after running descriptor for feature: %@", v68, 0xCu);
                  }
                  objc_storeStrong((id *)&v41, 0);
                }
                v57 = 0;
              }
              objc_storeStrong(&v42, 0);
            }
            else
            {
              v45 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not build descriptor for feature '%@'"), v50);
              oslog = (os_log_t)MEMORY[0x1E0C81028];
              type = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                log = oslog;
                v24 = type;
                __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v45);
                _os_log_error_impl(&dword_1DC678000, log, v24, "%@", v69, 0xCu);
              }
              objc_storeStrong((id *)&oslog, 0);
              v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v45);
              *v59 = v10;
              v53 = v53 || v47;
              objc_msgSend(v51, "addObject:", v50);
              v57 = 3;
              objc_storeStrong(&v45, 0);
            }
            objc_storeStrong(&v46, 0);
            objc_storeStrong(&v48, 0);
            ++v29;
            if (v27 + 1 >= v30)
            {
              v29 = 0;
              v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
              if (!v30)
                break;
            }
          }
        }

        objc_msgSend(v58, "setObject:forKey:", v52, CFSTR("computedFeatures"));
        objc_msgSend(v58, "setObject:forKey:", v51, CFSTR("aggregationFailures"));
        v39 = 0;
        if (v53)
        {
          objc_msgSend(v58, "setObject:forKey:", CFSTR("Required descriptor failed. TP Save skipped"), CFSTR("tpSaveSummary"));
          v38 = (os_log_t)MEMORY[0x1E0C81028];
          v37 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v14 = v38;
            v15 = v37;
            __os_log_helper_16_0_0(v36);
            _os_log_error_impl(&dword_1DC678000, v14, v15, "at least one required descriptor failed, not updating OD-TP", v36, 2u);
          }
          objc_storeStrong((id *)&v38, 0);
        }
        else
        {
          v16 = v54;
          v18 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v60);
          v66 = v18;
          v67 = &unk_1EA4CEF80;
          v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66);
          objc_msgSend(v16, "setObject:forKey:");

          v19 = v54;
          v21 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v60 - 143440);
          v64 = v21;
          v65 = &unk_1EA4CEF80;
          v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          objc_msgSend(v19, "setObject:forKey:");

          objc_msgSend(v54, "setObject:forKey:", v61, CFSTR("OD_DSID"));
          v11 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v54, location[0], CFSTR("device"), v59);
          v12 = v39;
          v39 = v11;

          if (!*v59)
            objc_msgSend(v58, "setObject:forKey:", v39, CFSTR("tpSaveSummary"));
        }
        +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("RefreshODTP"));
        v63 = v58;
        v57 = 1;
        objc_storeStrong(&v39, 0);
        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v54, 0);
      }
      objc_storeStrong(&v55, 0);
    }
    else
    {
      *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("unknown domain"));
      v63 = 0;
      v57 = 1;
    }
  }
  else
  {
    *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Invalid dsid"));
    v63 = 0;
    v57 = 1;
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
  return v63;
}

+ (id)saveTasteProfileEntriesFromDict:(id)a3 inDomain:(id)a4 forSource:(id)a5 error:(id *)a6
{
  BOOL v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  os_log_t v26;
  id v27;
  os_log_type_t v28;
  os_log_t oslog;
  id v30;
  uint64_t v31;
  int v32;
  int v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39[3];
  id v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  int v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  os_log_type_t v49;
  id v50;
  char v51;
  __CFString *v52;
  id v53;
  id v54;
  _QWORD __b[8];
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  int v61;
  os_log_type_t type;
  id v63;
  id v64;
  id *v65;
  id v66;
  id v67;
  id location[3];
  id v69;
  const __CFString *v70;
  id v71;
  uint8_t v72[32];
  const __CFString *v73;
  id v74;
  uint8_t v75[16];
  uint8_t v76[16];
  _BYTE v77[128];
  const __CFString *v78;
  id v79;
  uint8_t v80[24];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v67 = 0;
  objc_storeStrong(&v67, a4);
  v66 = 0;
  objc_storeStrong(&v66, a5);
  v65 = a6;
  if (objc_msgSend(location[0], "count"))
  {
    v60 = 0;
    v60 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v67);
    v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(location[0], "count"));
    memset(__b, 0, sizeof(__b));
    v21 = location[0];
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v77, 16);
    if (v22)
    {
      v18 = *(_QWORD *)__b[2];
      v19 = 0;
      v20 = v22;
      while (1)
      {
        v17 = v19;
        if (*(_QWORD *)__b[2] != v18)
          objc_enumerationMutation(v21);
        v56 = *(_QWORD *)(__b[1] + 8 * v19);
        v16 = (void *)MEMORY[0x1E0CB36D8];
        v15 = (id)objc_msgSend(location[0], "valueForKey:", v56);
        v54 = (id)objc_msgSend(v16, "dataWithJSONObject:options:error:");

        if (*v65 || !v54)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          v14 = v56;
          v6 = *v65 == 0;
          v51 = 0;
          if (v6)
          {
            v12 = CFSTR("No data");
          }
          else
          {
            v52 = (__CFString *)(id)objc_msgSend(*v65, "localizedDescription");
            v51 = 1;
            v12 = v52;
          }
          v53 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("Could not retrieve TP data for feature '%@': %@"), v14, v12);
          if ((v51 & 1) != 0)

          v50 = MEMORY[0x1E0C81028];
          v49 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
          {
            v11 = v50;
            __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v53);
            _os_log_error_impl(&dword_1DC678000, v11, v49, "%@", v76, 0xCu);
          }
          objc_storeStrong(&v50, 0);
          objc_msgSend(v58, "addObject:", v56);
          *v65 = 0;
          objc_storeStrong(&v53, 0);
        }
        objc_msgSend(v57, "setObject:forKey:", v54, v56);
        objc_storeStrong(&v54, 0);
        ++v19;
        if (v17 + 1 >= v20)
        {
          v19 = 0;
          v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v77, 16);
          if (!v20)
            break;
        }
      }
    }

    if (objc_msgSend(v58, "count"))
      objc_msgSend(v59, "setObject:forKey:", v58, CFSTR("badFeatures"));
    v42 = 0;
    v43 = &v42;
    v44 = 838860800;
    v45 = 48;
    v46 = __Block_byref_object_copy__8;
    v47 = __Block_byref_object_dispose__8;
    v48 = 0;
    v41 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
    v40 = (id)objc_msgSend(v41, "getManagedObjectContext");
    v10 = v40;
    v31 = MEMORY[0x1E0C809B0];
    v32 = -1073741824;
    v33 = 0;
    v34 = __76__AMDTasteProfile_saveTasteProfileEntriesFromDict_inDomain_forSource_error___block_invoke;
    v35 = &unk_1EA4B5AC8;
    v36 = v57;
    v37 = v40;
    v38 = v66;
    v39[2] = v60;
    v39[0] = v41;
    v39[1] = &v42;
    objc_msgSend(v10, "performBlockAndWait:", &v31);
    if (v43[5])
    {
      *v65 = objc_retainAutorelease((id)v43[5]);
      v9 = (void *)MEMORY[0x1E0CB3940];
      v8 = (id)objc_msgSend((id)v43[5], "localizedDescription");
      v30 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("Error saving TP entries: %@"), v8);

      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v28 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v30);
        _os_log_error_impl(&dword_1DC678000, oslog, v28, "%@", v75, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v73 = CFSTR("error");
      v74 = v30;
      v69 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v61 = 1;
      objc_storeStrong(&v30, 0);
    }
    else
    {
      v27 = (id)objc_msgSend(v57, "allKeys");
      v26 = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_64_8_0_8_64((uint64_t)v72, (uint64_t)v66, objc_msgSend(v27, "count"), (uint64_t)v27);
        _os_log_debug_impl(&dword_1DC678000, v26, OS_LOG_TYPE_DEBUG, "Saved %@ TP features (%lu): %@", v72, 0x20u);
      }
      objc_storeStrong((id *)&v26, 0);
      v70 = CFSTR("savedFeatures");
      v71 = v27;
      v69 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v61 = 1;
      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(v39, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    _Block_object_dispose(&v42, 8);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
  }
  else
  {
    v64 = CFSTR("Empty taste profile");
    v63 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v64);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v63, type, "%@", v80, 0xCu);
    }
    objc_storeStrong(&v63, 0);

    v78 = CFSTR("error");
    v79 = v64;
    v69 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v61 = 1;
    objc_storeStrong(&v64, 0);
  }
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(location, 0);
  return v69;
}

void __76__AMDTasteProfile_saveTasteProfileEntriesFromDict_inDomain_forSource_error___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  id obj;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD __b[8];
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24 = a1;
  v23 = a1;
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v13, "timeIntervalSince1970");
  v14 = (unint64_t)v1;

  v22 = v14;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  if (v17)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v17;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v21 = *(_QWORD *)(__b[1] + 8 * v11);
      v4 = (void *)MEMORY[0x1E0C97B20];
      v6 = (id)+[AMDTasteProfile entity](AMDTasteProfile, "entity");
      v5 = (id)objc_msgSend(v6, "name");
      v19 = (id)objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:");

      objc_msgSend(v19, "setSource:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v19, "setDomain:", (__int16)*(_QWORD *)(a1 + 72));
      objc_msgSend(v19, "setFeatureName:", v21);
      v7 = v19;
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v21);
      objc_msgSend(v7, "setValue:");

      objc_msgSend(v19, "setLastUpdated:", v22);
      objc_storeStrong(&v19, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
        if (!v12)
          break;
      }
    }
  }

  v2 = *(void **)(a1 + 56);
  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v18 = *v3;
  objc_msgSend(v2, "save:", &v18);
  objc_storeStrong(v3, v18);
}

+ (id)deleteWithPredicates:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
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
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __46__AMDTasteProfile_deleteWithPredicates_error___block_invoke;
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

void __46__AMDTasteProfile_deleteWithPredicates_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id *location;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19[3];

  v19[2] = (id)a1;
  v19[1] = (id)a1;
  v10 = (void *)MEMORY[0x1E0C97B48];
  v12 = (id)+[AMDTasteProfile entity](AMDTasteProfile, "entity");
  v11 = (id)objc_msgSend(v12, "name");
  v19[0] = (id)objc_msgSend(v10, "fetchRequestWithEntityName:");

  if (*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v19[0], "setPredicate:");

  }
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v19[0]);
  objc_msgSend(v18, "setResultType:", 2);
  v1 = *(void **)(a1 + 40);
  location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v16 = *location;
  v8 = (id)objc_msgSend(v1, "executeRequest:error:", v18, &v16);
  objc_storeStrong(location, v16);
  v17 = v8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v15 = 1;
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = *v6;
    objc_msgSend(v2, "save:", &v14);
    objc_storeStrong(v6, v14);
    v3 = (id)objc_msgSend(v17, "result");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v15 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (id)deleteAll:(id *)a3
{
  return (id)objc_msgSend(a1, "deleteWithPredicates:error:", 0, a3);
}

+ (id)deleteAppInfoEntries:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  id v7[3];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v7[2] = (id)a2;
  v7[1] = a3;
  v7[0] = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featureName == %@ || featureName == %@ || featureName == %@ || featureName == %@"), CFSTR("APPS_IS_ARCADE"), CFSTR("APPS_PURCHASED"), CFSTR("APPS_GENRE"), CFSTR("APPS_RATINGS_RANK"));
  v4 = v8;
  v9[0] = v7[0];
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (id)objc_msgSend(v4, "deleteWithPredicates:error:");

  objc_storeStrong(v7, 0);
  return v6;
}

+ (id)deleteEntriesOfFeature:(id)a3 withDomain:(int64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  id v11[3];
  id location[2];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11[2] = (id)a4;
  v11[1] = a5;
  v11[0] = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featureName == %@ && domain == %d"), location[0], a4);
  v8 = v13;
  v14[0] = v11[0];
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (id)objc_msgSend(v8, "deleteWithPredicates:error:");

  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)refreshAppInformationTasteProfile:(id *)a3
{
  __int16 v3;
  NSObject *v5;
  os_log_type_t v6;
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
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  NSObject *log;
  os_log_type_t v42;
  id v43;
  id v44;
  uint8_t v45[15];
  os_log_type_t v46;
  os_log_t v47;
  os_log_type_t v48;
  os_log_t v49;
  id v50;
  os_log_type_t v51;
  os_log_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  _QWORD __b[8];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  unsigned __int16 v76;
  __int16 v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  os_log_type_t v84;
  os_log_t v85;
  int v86;
  id v87;
  os_log_type_t type;
  os_log_t oslog;
  id v90;
  id *v91;
  SEL v92;
  id v93;
  id v94;
  _QWORD v95[2];
  _QWORD v96[2];
  uint8_t v97[32];
  _QWORD v98[8];
  _QWORD v99[8];
  uint8_t v100[16];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _BYTE v113[128];
  uint8_t v114[16];
  uint8_t v115[24];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v93 = a1;
  v92 = a2;
  v91 = a3;
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("RefreshAppInfo"));
  v90 = (id)objc_msgSend(v93, "deleteAppInfoEntries:", v91);
  if (*v91)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v42 = type;
      v43 = (id)objc_msgSend(*v91, "localizedDescription");
      v87 = v43;
      __os_log_helper_16_2_1_8_64((uint64_t)v115, (uint64_t)v87);
      _os_log_error_impl(&dword_1DC678000, log, v42, "Previous App Information Taste Profiles could not be deleted. %@", v115, 0xCu);

      objc_storeStrong(&v87, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v94 = 0;
    v86 = 1;
  }
  else
  {
    if (v90)
      objc_storeStrong(&v90, v90);
    else
      objc_storeStrong(&v90, &unk_1EA4CEF98);
    v85 = (os_log_t)MEMORY[0x1E0C81028];
    v84 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v114, (uint64_t)v90);
      _os_log_impl(&dword_1DC678000, v85, v84, "Number of App Information Taste Profiles Deleted: %@", v114, 0xCu);
    }
    objc_storeStrong((id *)&v85, 0);
    v83 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v82 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v81 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v80 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v78 = (id)objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    objc_msgSend(v78, "setFilter:", &__block_literal_global_6);
    v77 = 0;
    v76 = 0;
    v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    v39 = v78;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
    if (v40)
    {
      v36 = *(_QWORD *)__b[2];
      v37 = 0;
      v38 = v40;
      while (1)
      {
        v35 = v37;
        if (*(_QWORD *)__b[2] != v36)
          objc_enumerationMutation(v39);
        v69 = *(id *)(__b[1] + 8 * v37);
        ++v77;
        v67 = (id)objc_msgSend(v69, "iTunesMetadata");
        v66 = 0;
        v66 = objc_msgSend(v67, "storeItemIdentifier");
        v65 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v66);
        v64 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v69, "isArcadeApp") & 1);
        v63 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v67, "isPurchasedRedownload") & 1);
        v62 = 0;
        v62 = objc_msgSend(v67, "genreIdentifier");
        v61 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v62);
        v60 = 0;
        v60 = objc_msgSend(v67, "ratingRank");
        objc_msgSend(v83, "setObject:forKey:", v64, v65);
        objc_msgSend(v82, "setObject:forKey:", v63, v65);
        v24 = v81;
        v25 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v62);
        objc_msgSend(v24, "setObject:forKey:");

        v26 = v80;
        v27 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v60);
        objc_msgSend(v26, "setObject:forKey:");

        v28 = v74;
        v29 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v66);
        objc_msgSend(v28, "addObject:");

        objc_msgSend(v73, "addObject:", v64);
        objc_msgSend(v72, "addObject:", v63);
        v30 = v71;
        v31 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v62);
        objc_msgSend(v30, "addObject:");

        v32 = v70;
        v33 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v60);
        objc_msgSend(v32, "addObject:");

        v34 = (id)objc_msgSend(v79, "objectForKey:", v61);
        if (v34)
        {
          v59 = (id)objc_msgSend(v79, "objectForKey:", v61);
          objc_msgSend(v59, "addObject:", v65);
          objc_storeStrong(&v59, 0);
        }
        else
        {
          v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v58, "addObject:", v65);
          objc_msgSend(v79, "setObject:forKey:", v58, v61);
          objc_storeStrong(&v58, 0);
        }
        v3 = (objc_msgSend(v69, "isArcadeApp") & 1) != 0;
        v76 += v3;
        objc_storeStrong(&v61, 0);
        objc_storeStrong(&v63, 0);
        objc_storeStrong(&v64, 0);
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v67, 0);
        ++v37;
        if (v35 + 1 >= v38)
        {
          v37 = 0;
          v38 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
          if (!v38)
            break;
        }
      }
    }

    v11 = v75;
    v111[0] = 0x1EA4B86C8;
    v112[0] = v74;
    v111[1] = 0x1EA4BC168;
    v112[1] = 0x1EA4C4BA8;
    v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111);
    objc_msgSend(v11, "setObject:forKey:");

    v13 = v75;
    v109[0] = 0x1EA4B86C8;
    v110[0] = v73;
    v109[1] = 0x1EA4BC168;
    v110[1] = 0x1EA4C4B88;
    v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
    objc_msgSend(v13, "setObject:forKey:");

    v15 = v75;
    v107[0] = 0x1EA4B86C8;
    v108[0] = v71;
    v107[1] = 0x1EA4BC168;
    v108[1] = 0x1EA4C4BA8;
    v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
    objc_msgSend(v15, "setObject:forKey:");

    v17 = v75;
    v105[0] = 0x1EA4B86C8;
    v106[0] = v72;
    v105[1] = 0x1EA4BC168;
    v106[1] = 0x1EA4C4B88;
    v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
    objc_msgSend(v17, "setObject:forKey:");

    v19 = v75;
    v103[0] = 0x1EA4B86C8;
    v104[0] = v70;
    v103[1] = 0x1EA4BC168;
    v104[1] = 0x1EA4C4BA8;
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
    objc_msgSend(v19, "setObject:forKey:");

    v101[0] = CFSTR("data");
    v102[0] = v75;
    v101[1] = CFSTR("tpContentType");
    v102[1] = CFSTR("v2FeatureDescriptor");
    v57 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
    v21 = (void *)MEMORY[0x1E0C99E20];
    v22 = (id)objc_msgSend(v82, "allKeys");
    v56 = (id)objc_msgSend(v21, "setWithArray:");

    v55 = 0;
    v53 = 0;
    v23 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", CFSTR("PURCHASED_ITEM_AFFINITY"), CFSTR("apps"), &v53);
    objc_storeStrong(&v55, v53);
    v54 = v23;
    if (!v55 && v54)
    {
      v9 = v56;
      v10 = (id)objc_msgSend(v54, "allKeys");
      objc_msgSend(v9, "addObjectsFromArray:");

      v52 = (os_log_t)MEMORY[0x1E0C81028];
      v51 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v100, objc_msgSend(v54, "count"));
        _os_log_impl(&dword_1DC678000, v52, v51, "Found %lu apps from server TP", v100, 0xCu);
      }
      objc_storeStrong((id *)&v52, 0);
    }
    v98[0] = CFSTR("APPS_TP");
    v99[0] = v57;
    v98[1] = CFSTR("APPS_GENRE");
    v99[1] = v81;
    v98[2] = CFSTR("APPS_HAS_ARCADE");
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v76);
    v99[2] = v8;
    v98[3] = CFSTR("APPS_IS_ARCADE");
    v99[3] = v83;
    v98[4] = CFSTR("APPS_PURCHASED");
    v99[4] = v82;
    v98[5] = CFSTR("APPS_PURCHASED_ALL");
    v7 = (id)objc_msgSend(v56, "allObjects");
    v99[5] = v7;
    v98[6] = CFSTR("APPS_RATINGS_RANK");
    v99[6] = v80;
    v98[7] = CFSTR("APPS_LIST_BY_GENRE");
    v99[7] = v79;
    v50 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 8);

    if (v77)
    {
      v49 = (os_log_t)MEMORY[0x1E0C81028];
      v48 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_0_8_64((uint64_t)v97, objc_msgSend(v50, "count"), (uint64_t)v50);
        _os_log_debug_impl(&dword_1DC678000, v49, v48, "App info TP (%lu): %@", v97, 0x16u);
      }
      objc_storeStrong((id *)&v49, 0);
    }
    else
    {
      v47 = (os_log_t)MEMORY[0x1E0C81028];
      v46 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v5 = v47;
        v6 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_impl(&dword_1DC678000, v5, v6, "No third party apps found", v45, 2u);
      }
      objc_storeStrong((id *)&v47, 0);
    }
    v44 = (id)objc_msgSend(v93, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v50, CFSTR("apps"), CFSTR("device"), v91);
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("RefreshAppInfo"));
    v95[0] = CFSTR("deletedForRefresh");
    v96[0] = v90;
    v95[1] = CFSTR("saved");
    v96[1] = v44;
    v94 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
    v86 = 1;
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, 0);
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v75, 0);
    objc_storeStrong(&v78, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v81, 0);
    objc_storeStrong(&v82, 0);
    objc_storeStrong(&v83, 0);
  }
  objc_storeStrong(&v90, 0);
  return v94;
}

BOOL __53__AMDTasteProfile_refreshAppInformationTasteProfile___block_invoke(void *a1, void *a2)
{
  id v3;
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "iTunesMetadata");
  v4 = objc_msgSend(v3, "storeItemIdentifier") != 0;

  objc_storeStrong(location, 0);
  return v4;
}

+ (BOOL)hasArcade:(id *)a3
{
  BOOL v4;
  char v5;
  id v6;
  id location;
  id *v8;
  SEL v9;
  id v10;
  BOOL v11;

  v10 = a1;
  v9 = a2;
  v8 = a3;
  location = (id)objc_msgSend(a1, "getFeatureWithName:inDomain:withColumnName:error:", CFSTR("APPS_HAS_ARCADE"), CFSTR("apps"), 0, a3);
  v5 = 0;
  v4 = 0;
  if (!*v8)
  {
    v4 = 0;
    if (location)
    {
      v6 = (id)objc_msgSend(location, "getValue");
      v5 = 1;
      v4 = objc_msgSend(v6, "longValue") != 0;
    }
  }
  v11 = v4;
  if ((v5 & 1) != 0)

  objc_storeStrong(&location, 0);
  return v11;
}

+ (id)refreshServerTasteProfile:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  int v13;
  __CFString *v14;
  id v15;
  id *v16;
  id location[3];
  id v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  __CFString *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8948);
  if (v15)
  {
    v12 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B84A8);
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v12;
        *v16 = 0;
        v18 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v9, v15, CFSTR("server"), v16);
        v13 = 1;
        objc_storeStrong(&v9, 0);
      }
      else
      {
        v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Server TP data not a dictionary for domain: %@"), v15);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 23, v10);
        *v16 = v6;
        v19 = CFSTR("error");
        v20 = v10;
        v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v13 = 1;
        objc_storeStrong(&v10, 0);
      }
    }
    else
    {
      v11 = CFSTR("Missing TP data");
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 23, v11);
      *v16 = v5;
      v21 = CFSTR("error");
      v22 = v11;
      v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v13 = 1;
      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v14 = CFSTR("Missing domian");
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 23, v14);
    *v16 = v4;
    v23 = CFSTR("error");
    v24[0] = v14;
    v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v13 = 1;
    objc_storeStrong((id *)&v14, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18;
}

+ (id)getPurchasedAppsSet:(id *)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD __b[8];
  id v15;
  id v16;
  int v17;
  os_log_type_t v18;
  id location;
  id v20;
  id v21;
  id *v22;
  SEL v23;
  id v24;
  id v25;
  _BYTE v26[128];
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = a1;
  v23 = a2;
  v22 = a3;
  v21 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", CFSTR("APPS_PURCHASED_ALL"), CFSTR("apps"), a3);
  if (!*v22 && v21)
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v21, "count"));
    memset(__b, 0, sizeof(__b));
    v10 = v21;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
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
        v15 = *(id *)(__b[1] + 8 * v8);
        v4 = v16;
        v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "longLongValue"));
        objc_msgSend(v4, "addObject:");

        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
          if (!v9)
            break;
        }
      }
    }

    v25 = v16;
    v17 = 1;
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (id)objc_msgSend(*v22, "localizedDescription");
    v20 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("Error fetching all purchases: %@"), v13);

    location = MEMORY[0x1E0C81028];
    v18 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v20);
      _os_log_impl(&dword_1DC678000, (os_log_t)location, v18, "%@", v27, 0xCu);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v20, CFSTR("fetchAppPurchasesFailure"), 0);
    v25 = 0;
    v17 = 1;
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v21, 0);
  return v25;
}

+ (id)getPurchasedArcadeGamesSet:(id *)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD __b[8];
  id v16;
  id v17;
  int v18;
  os_log_type_t v19;
  id location;
  id v21;
  id v22;
  id *v23;
  SEL v24;
  id v25;
  id v26;
  _BYTE v27[128];
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v24 = a2;
  v23 = a3;
  v22 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", CFSTR("APPS_IS_ARCADE"), CFSTR("apps"), a3);
  if (!*v23 && v22)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v22, "count"));
    memset(__b, 0, sizeof(__b));
    v10 = v22;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
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
        v14 = (id)objc_msgSend(v22, "objectForKey:", v16);
        if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
        {
          v4 = v17;
          v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v16, "longLongValue"));
          objc_msgSend(v4, "addObject:");

        }
        objc_storeStrong(&v14, 0);
        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
          if (!v9)
            break;
        }
      }
    }

    v26 = v17;
    v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (id)objc_msgSend(*v23, "localizedDescription");
    v21 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("Error fetching arcade purchases: %@"), v13);

    location = MEMORY[0x1E0C81028];
    v19 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v28, (uint64_t)v21);
      _os_log_impl(&dword_1DC678000, (os_log_t)location, v19, "%@", v28, 0xCu);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v21, CFSTR("fetchArcadePurchasesFailure"), 0);
    v26 = 0;
    v18 = 1;
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v22, 0);
  return v26;
}

+ (void)saveMinimalCToLMapForModelId:(id)a3 usingMapData:(id)a4 andPurchases:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *log;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v19;
  AMDSimpleHash *v20;
  id v21;
  uint64_t v22;
  os_log_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unsigned int i;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  os_log_t v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int *v35;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id location[3];
  uint8_t v45[16];
  id v46;
  id v47;
  uint8_t v48[32];
  uint8_t v49[24];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  objc_storeStrong(&v42, a5);
  v19 = objc_alloc(MEMORY[0x1E0C99E08]);
  v41 = (id)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v42, "count"));
  v20 = [AMDSimpleHash alloc];
  v40 = -[AMDSimpleHash initWithCapacity:](v20, "initWithCapacity:", objc_msgSend(v42, "count"));
  memset(__b, 0, sizeof(__b));
  v21 = v42;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
  if (v22)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v22;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(v21);
      v39 = *(id *)(__b[1] + 8 * v15);
      if ((objc_msgSend(v40, "addForKey:theValue:", objc_msgSend(v39, "longLongValue"), 1) & 1) == 0)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v39);
          _os_log_error_impl(&dword_1DC678000, log, type, "FastHash: could not save addamId %@", v49, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
        if (!v16)
          break;
      }
    }
  }

  v35 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v43), "bytes");
  v34 = 0;
  v33 = 0;
  v33 = *v35;
  v32 = (os_log_t)MEMORY[0x1E0C81028];
  v31 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v48, objc_msgSend(v42, "count"), v33);
    _os_log_debug_impl(&dword_1DC678000, v32, v31, "SaveMinimalMap: mapping %lu values, remap from binary data (%d entries)", v48, 0x12u);
  }
  objc_storeStrong((id *)&v32, 0);
  ++v35;
  v30 = 0;
  v29 = 0;
  for (i = 0; i < v33; ++i)
  {
    v34 = v35++;
    v29 = *(_QWORD *)v35;
    v35 += 2;
    if ((objc_msgSend(v40, "getValueForKey:into:", v29, &v30) & 1) != 0)
    {
      v8 = v41;
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v34);
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v29);
      v9 = (id)objc_msgSend(v10, "stringValue");
      objc_msgSend(v8, "setObject:forKey:", v11);

    }
  }
  v27 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("__AAPS_CONTENT_TOLOGICAL_ID_MAP_"), location[0]);
  v26 = 0;
  v46 = v27;
  v47 = v41;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v25 = v26;
  v5 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:");
  objc_storeStrong(&v26, v25);

  if (v26)
  {
    v6 = (id)objc_msgSend(v26, "localizedDescription");
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

  }
  else
  {
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saved minimal map for modelId '%@': %lu of %lu values"), location[0], objc_msgSend(v41, "count"), objc_msgSend(v42, "count"));
    v23 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v24);
      _os_log_impl(&dword_1DC678000, v23, OS_LOG_TYPE_INFO, "%@", v45, 0xCu);
    }
    objc_storeStrong((id *)&v23, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v24, CFSTR("logicalMapSave"), 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
}

+ (void)refreshCToLMaps
{
  AMDModelMetadata *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  AMDModelAssets *v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  AMDModelMetadata *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id obj;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *log;
  os_log_type_t v30;
  id v31;
  os_log_t v32;
  id v33;
  id v34;
  uint8_t v35[7];
  os_log_type_t v36;
  os_log_t v37;
  id v38;
  id v39;
  os_log_type_t v40;
  os_log_t oslog;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD __b[8];
  id v49;
  os_log_type_t v50;
  id v51;
  id v52;
  id v53;
  int v54;
  uint8_t v55[15];
  os_log_type_t type;
  id v57;
  id v58;
  id v59;
  id v60[2];
  id v61;
  uint8_t v62[32];
  uint8_t v63[16];
  _BYTE v64[128];
  uint8_t v65[24];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v61 = a1;
  v60[1] = (id)a2;
  v60[0] = 0;
  v58 = 0;
  v31 = +[AMDTasteProfile getPurchasedAppsSet:](AMDTasteProfile, "getPurchasedAppsSet:", &v58);
  objc_storeStrong(v60, v58);
  v59 = v31;
  if (objc_msgSend(v31, "count"))
  {
    v52 = v60[0];
    v28 = +[AMDModel fetchAll:](AMDModel, "fetchAll:", &v52);
    objc_storeStrong(v60, v52);
    v53 = v28;
    if (v60[0])
    {
      v51 = MEMORY[0x1E0C81028];
      v50 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
      {
        v27 = (id)objc_msgSend(v60[0], "localizedDescription");
        __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v27);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v51, v50, "Error fetching models' info: '%@'", v65, 0xCu);

      }
      objc_storeStrong(&v51, 0);
      v54 = 1;
    }
    else
    {
      memset(__b, 0, sizeof(__b));
      obj = v53;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
      if (v26)
      {
        v22 = *(_QWORD *)__b[2];
        v23 = 0;
        v24 = v26;
        while (1)
        {
          v21 = v23;
          if (*(_QWORD *)__b[2] != v22)
            objc_enumerationMutation(obj);
          v49 = *(id *)(__b[1] + 8 * v23);
          v47 = (id)objc_msgSend(v49, "objectForKey:", 0x1EA4B8F88);
          v46 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RefreshCToL__%@"), v47);
          +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", v46);
          v45 = (id)objc_msgSend(v49, "objectForKey:", 0x1EA4BB0A8);
          v20 = (id)objc_msgSend(v45, "stringByAppendingPathComponent:", CFSTR("model_metadata"));
          v44 = (id)objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("json"));

          v43 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v44);
          if (v43)
          {
            v2 = [AMDModelMetadata alloc];
            v38 = v60[0];
            v17 = -[AMDModelMetadata initWithMetadataJSON:error:](v2, "initWithMetadataJSON:error:", v43, &v38);
            objc_storeStrong(v60, v38);
            v39 = v17;
            if (!v60[0] && v39)
            {
              v12 = [AMDModelAssets alloc];
              v11 = v45;
              v14 = (id)objc_msgSend(v39, "getAssetsMetadata");
              v33 = v60[0];
              v13 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v12, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", v11, &v33);
              objc_storeStrong(v60, v33);
              v34 = v13;

              if (v60[0])
              {
                v32 = (os_log_t)MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  v9 = v32;
                  v8 = v45;
                  v10 = (id)objc_msgSend(v60[0], "localizedDescription");
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v62, (uint64_t)v8, (uint64_t)v10);
                  _os_log_error_impl(&dword_1DC678000, v9, OS_LOG_TYPE_ERROR, "Error loading assets from %@: %@", v62, 0x16u);

                }
                objc_storeStrong((id *)&v32, 0);
                objc_storeStrong(v60, 0);
                v54 = 3;
              }
              else
              {
                v3 = (id)objc_msgSend(v34, "getContentToLogicalMap");
                v7 = v3 != 0;

                if (v7)
                {
                  v5 = v61;
                  v4 = v47;
                  v6 = (id)objc_msgSend(v34, "getContentToLogicalMap");
                  objc_msgSend(v5, "saveMinimalCToLMapForModelId:usingMapData:andPurchases:", v4);

                  +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", v46);
                  v54 = 0;
                }
                else
                {
                  v54 = 3;
                }
              }
              objc_storeStrong(&v34, 0);
            }
            else
            {
              v37 = (os_log_t)MEMORY[0x1E0C81028];
              v36 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                v15 = v37;
                v16 = v36;
                __os_log_helper_16_0_0(v35);
                _os_log_error_impl(&dword_1DC678000, v15, v16, "Error initializing modelMetadata", v35, 2u);
              }
              objc_storeStrong((id *)&v37, 0);
              objc_storeStrong(v60, 0);
              v54 = 3;
            }
            objc_storeStrong(&v39, 0);
          }
          else
          {
            v42 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No metadata for modelId '%@'!"), v47);
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v40 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v18 = oslog;
              v19 = v40;
              __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v42);
              _os_log_error_impl(&dword_1DC678000, v18, v19, "%@", v63, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v54 = 3;
            objc_storeStrong(&v42, 0);
          }
          objc_storeStrong(&v43, 0);
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v47, 0);
          ++v23;
          if (v21 + 1 >= v24)
          {
            v23 = 0;
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
            if (!v24)
              break;
          }
        }
      }

      v54 = 0;
    }
    objc_storeStrong(&v53, 0);
  }
  else
  {
    v57 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_INFO))
    {
      log = v57;
      v30 = type;
      __os_log_helper_16_0_0(v55);
      _os_log_impl(&dword_1DC678000, log, v30, "No purchases to map to logicalIds", v55, 2u);
    }
    objc_storeStrong(&v57, 0);
    v54 = 1;
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDTasteProfile"), a2, a1);
}

@end
