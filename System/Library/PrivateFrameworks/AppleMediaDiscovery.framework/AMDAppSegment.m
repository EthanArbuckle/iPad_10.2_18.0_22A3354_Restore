@implementation AMDAppSegment

+ (id)deleteAllSegments:(id *)a3
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
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  v5 = location;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __35__AMDAppSegment_deleteAllSegments___block_invoke;
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

void __35__AMDAppSegment_deleteAllSegments___block_invoke(_QWORD *a1)
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
  v9 = (id)+[AMDAppSegment entity](AMDAppSegment, "entity");
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

+ (id)refreshSegmentsForAllTreatmentsForUser:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  AMDPair *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  id v29;
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  uint8_t v33[7];
  os_log_type_t v34;
  os_log_t v35;
  id v36;
  AMDPair *v37;
  id v38;
  os_log_type_t v39;
  os_log_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD __b[8];
  id v49;
  id v50;
  os_log_type_t type;
  os_log_t oslog;
  __CFString *v53;
  int v54;
  id v55;
  id *v56;
  id location[2];
  id v58;
  id v59;
  uint8_t v60[16];
  uint8_t v61[16];
  _BYTE v62[128];
  const __CFString *v63;
  __CFString *v64;
  uint8_t v65[24];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v58 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = a4;
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("RefreshSegments"));
  v55 = +[AMDWorkflow getAllActiveWorkflowsForDomain:andUseCaseId:error:](AMDWorkflow, "getAllActiveWorkflowsForDomain:andUseCaseId:error:", +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", CFSTR("apps")), 0x1EA4BADA8, a4);
  if (*a4)
  {
    v59 = 0;
    v54 = 1;
  }
  else if (v55)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    memset(__b, 0, sizeof(__b));
    v26 = v55;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
    if (v27)
    {
      v23 = *(_QWORD *)__b[2];
      v24 = 0;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(_QWORD *)__b[2] != v23)
          objc_enumerationMutation(v26);
        v49 = *(id *)(__b[1] + 8 * v24);
        v47 = (id)objc_msgSend(v49, "objectForKey:", CFSTR("rule_params"));
        if (v47)
        {
          v46 = (id)objc_msgSend(v49, "objectForKey:", 0x1EA4BACA8);
          if (!v46)
            objc_storeStrong(&v46, CFSTR("__defaultTreatment"));
          v45 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD68);
          v44 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD88);
          v43 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD48);
          v42 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD28);
          v41 = 0;
          if (v45 && (v44 || v43 || v42))
          {
            v21 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD68);
            v20 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD88);
            v19 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD48);
            v18 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD28);
            v5 = +[AMDAppEvent getSegmentsWithLookBack:andRecencyThreshold:andFrequencyThreshold:andDurationThreshold:withUserId:error:](AMDAppEvent, "getSegmentsWithLookBack:andRecencyThreshold:andFrequencyThreshold:andDurationThreshold:withUserId:error:", v21, v20, v19);
            v6 = v41;
            v41 = v5;

          }
          else
          {
            v7 = (id)objc_msgSend(v58, "assignSegmentsWithParameters:error:", v47, v56);
            v8 = v41;
            v41 = v7;

          }
          if (*v56)
          {
            v59 = 0;
            v54 = 1;
          }
          else if (v41)
          {
            v38 = (id)objc_msgSend(v47, "objectForKey:", 0x1EA4BAD08);
            v15 = [AMDPair alloc];
            v14 = v38 ? v38 : CFSTR("undefined");
            v37 = -[AMDPair initWith:and:](v15, "initWith:and:", v41, v14);
            objc_msgSend(v50, "setObject:forKey:", v37, v46);
            objc_storeStrong((id *)&v37, 0);
            objc_storeStrong(&v38, 0);
            v54 = 0;
          }
          else
          {
            v40 = (os_log_t)MEMORY[0x1E0C81028];
            v39 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v16 = v40;
              v17 = v39;
              __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v46);
              _os_log_error_impl(&dword_1DC678000, v16, v17, "Programmer error! Nil segment data for treatment '%@'", v61, 0xCu);
            }
            objc_storeStrong((id *)&v40, 0);
            v54 = 3;
          }
          objc_storeStrong(&v41, 0);
          objc_storeStrong(&v42, 0);
          objc_storeStrong(&v43, 0);
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
        }
        else
        {
          v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("no segment aggregation params"));
          *v56 = v4;
          v59 = 0;
          v54 = 1;
        }
        objc_storeStrong(&v47, 0);
        if (v54)
        {
          if (v54 != 3)
            break;
        }
        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
          if (!v25)
            goto LABEL_36;
        }
      }
    }
    else
    {
LABEL_36:
      v54 = 0;
    }

    if (!v54)
    {
      v36 = +[AMDAppSegment refreshSegments:error:](AMDAppSegment, "refreshSegments:error:", v50, v56);
      if (*v56)
      {
        v59 = 0;
        v54 = 1;
      }
      else
      {
        v35 = (os_log_t)MEMORY[0x1E0C81028];
        v34 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v12 = v35;
          v13 = v34;
          __os_log_helper_16_0_0(v33);
          _os_log_debug_impl(&dword_1DC678000, v12, v13, "Sending IAE segment notification", v33, 2u);
        }
        objc_storeStrong((id *)&v35, 0);
        v11 = +[AMDJSGetSegments getAppSegments:error:](AMDJSGetSegments, "getAppSegments:error:", MEMORY[0x1E0C9AA70], v56);
        v32 = (id)objc_msgSend(v11, "mutableCopy");

        if (*v56)
        {
          v31 = (os_log_t)MEMORY[0x1E0C81028];
          v30 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v10 = (id)objc_msgSend(*v56, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v10);
            _os_log_debug_impl(&dword_1DC678000, v31, v30, "Error retrieving segment data for notification: %@", v60, 0xCu);

          }
          objc_storeStrong((id *)&v31, 0);
          v59 = 0;
          v54 = 1;
        }
        else
        {
          objc_msgSend(v32, "setObject:forKey:", location[0], 0x1EA4B9328);
          v29 = (id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
          objc_msgSend(v29, "postNotificationName:object:userInfo:deliverImmediately:", 0x1EA4BBF08);
          +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("RefreshSegments"));
          v59 = v36;
          v54 = 1;
          objc_storeStrong(&v29, 0);
        }
        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong(&v50, 0);
  }
  else
  {
    v53 = CFSTR("Could not refresh segments: no workflow");
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v53);
      _os_log_impl(&dword_1DC678000, oslog, type, "%@", v65, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v63 = CFSTR("error");
    v64 = v53;
    v59 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v54 = 1;
    objc_storeStrong((id *)&v53, 0);
  }
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v59;
}

+ (id)refreshSegments:(id)a3 error:(id *)a4
{
  int v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  id v19;
  id v20;
  _QWORD __b[8];
  uint64_t v22;
  unsigned int v23;
  id v24;
  os_log_type_t v25;
  id v26;
  int v27;
  id v28;
  id *v29;
  id location[2];
  id v31;
  id v32;
  _BYTE v33[128];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v31 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  v28 = (id)objc_msgSend(v31, "deleteAllSegments:", a4);
  if (*a4)
  {
    v32 = 0;
    v27 = 1;
  }
  else
  {
    v26 = MEMORY[0x1E0C81028];
    v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v28);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v26, v25, "RefreshSegments: deleted %@ segment entries", v34, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v24, "setObject:forKey:", v28, CFSTR("segmentsDeletedForRefresh"));
    v23 = 0;
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
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
        v22 = *(_QWORD *)(__b[1] + 8 * v14);
        v20 = (id)objc_msgSend(location[0], "objectForKey:", v22);
        v19 = (id)objc_msgSend(v20, "first");
        v4 = objc_msgSend(v19, "count");
        v23 += v4;
        v10 = v31;
        v8 = v19;
        v9 = v22;
        v11 = (id)objc_msgSend(v20, "second");
        objc_msgSend(v10, "saveSegments:withTreatmentId:andAlgoId:error:", v8, v9);

        if (*v29)
        {
          v32 = 0;
          v27 = 1;
        }
        else
        {
          v27 = 0;
        }
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        if (v27)
          break;
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
          if (!v15)
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
      v6 = v24;
      v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
      objc_msgSend(v6, "setObject:forKey:");

      v32 = v24;
      v27 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v32;
}

+ (void)saveSegments:(id)a3 withTreatmentId:(id)a4 andAlgoId:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id v27;
  id v28;
  id *v29;
  id v30;
  id v31;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = a6;
  v28 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v27 = (id)objc_msgSend(v28, "getManagedObjectContext");
  v20 = 0;
  v21 = &v20;
  v22 = 838860800;
  v23 = 48;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  v26 = 0;
  v9 = v27;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __62__AMDAppSegment_saveSegments_withTreatmentId_andAlgoId_error___block_invoke;
  v14 = &unk_1EA4B5E88;
  v15 = location[0];
  v16 = v27;
  v17 = v31;
  v18 = v30;
  v19[0] = v28;
  v19[1] = &v20;
  objc_msgSend(v9, "performBlockAndWait:", &v10);
  if (v21[5])
    *v29 = objc_retainAutorelease((id)v21[5]);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __62__AMDAppSegment_saveSegments_withTreatmentId_andAlgoId_error___block_invoke(uint64_t a1)
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
  id v23;
  _QWORD __b[8];
  id v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = a1;
  v26 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
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
      v25 = *(id *)(__b[1] + 8 * v14);
      v23 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v25);
      memset(v21, 0, sizeof(v21));
      v10 = v23;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v21, v28, 16);
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
          v5 = (id)+[AMDAppSegment entity](AMDAppSegment, "entity");
          v4 = (id)objc_msgSend(v5, "name");
          v20 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

          objc_msgSend(v20, "setAdamId:", objc_msgSend(v25, "longLongValue"));
          objc_msgSend(v20, "setSegment:", v22);
          objc_msgSend(v20, "setTreatmentId:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v20, "setAlgoId:", *(_QWORD *)(a1 + 56));
          objc_storeStrong(&v20, 0);
          ++v8;
          if (v6 + 1 >= v9)
          {
            v8 = 0;
            v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v21, v28, 16);
            if (!v9)
              break;
          }
        }
      }

      objc_storeStrong(&v23, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v15)
          break;
      }
    }
  }

  v1 = *(void **)(a1 + 64);
  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v19 = *v2;
  objc_msgSend(v1, "save:", &v19);
  objc_storeStrong(v2, v19);
}

+ (id)getSegmentsForTreatmentId:(id)a3 error:(id *)a4
{
  id v4;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
  id v14[3];
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;
  id v30;
  id *v31;
  id location[3];
  id v33;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = a4;
  v30 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v29 = (id)objc_msgSend(v30, "getManagedObjectContext");
  v22 = 0;
  v23 = &v22;
  v24 = 838860800;
  v25 = 48;
  v26 = __Block_byref_object_copy__13;
  v27 = __Block_byref_object_dispose__13;
  v28 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 838860800;
  v18 = 48;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  v21 = 0;
  v7 = v29;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __49__AMDAppSegment_getSegmentsForTreatmentId_error___block_invoke;
  v12 = &unk_1EA4B5210;
  v13 = location[0];
  v14[1] = &v15;
  v14[0] = v29;
  v14[2] = &v22;
  objc_msgSend(v7, "performBlockAndWait:", &v8);
  if (v23[5])
  {
    v4 = objc_retainAutorelease((id)v23[5]);
    *v31 = v4;
    v33 = 0;
  }
  else
  {
    v33 = (id)v16[5];
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v33;
}

void __49__AMDAppSegment_getSegmentsForTreatmentId_error___block_invoke(_QWORD *a1)
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
  v9 = (id)+[AMDAppSegment entity](AMDAppSegment, "entity");
  v8 = (id)objc_msgSend(v9, "name");
  v12[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  if (a1[4])
  {
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("treatmentId == %@"), a1[4]);
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

+ (id)getSegmentsInfoForTreatment:(id)a3 error:(id *)a4
{
  AMDPair *v4;
  id v5;
  AMDPair *v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  int v26;
  id v27[2];
  id location[2];
  id v29;
  AMDPair *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27[1] = a4;
  v27[0] = (id)objc_msgSend(v29, "getSegmentsForTreatmentId:error:", location[0], a4);
  if (*a4)
  {
    v30 = 0;
    v26 = 1;
  }
  else if (objc_msgSend(v27[0], "count"))
  {
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    memset(__b, 0, sizeof(__b));
    obj = v27[0];
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
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
        v24 = *(id *)(__b[1] + 8 * v13);
        v22 = (id)objc_msgSend(v24, "objectForKey:", CFSTR("adamId"));
        v21 = (id)objc_msgSend(v24, "objectForKey:", CFSTR("segment"));
        v20 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v22);
        v19 = (id)objc_msgSend(v25, "objectForKey:", v20);
        if (v19)
        {
          objc_msgSend(v19, "addObject:", v21);
        }
        else
        {
          v9 = v25;
          v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v10 = (id)objc_msgSend(v5, "initWithObjects:", v21, 0);
          objc_msgSend(v9, "setObject:forKey:");

        }
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v22, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
          if (!v14)
            break;
        }
      }
    }

    v8 = (id)objc_msgSend(v27[0], "firstObject");
    v18 = (id)objc_msgSend(v8, "objectForKey:", CFSTR("algoId"));

    v6 = [AMDPair alloc];
    v30 = -[AMDPair initWith:and:](v6, "initWith:and:", v25, v18);
    v26 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v4 = [AMDPair alloc];
    v30 = -[AMDPair initWith:and:](v4, "initWith:and:", MEMORY[0x1E0C9AA70], CFSTR("noApplicable"));
    v26 = 1;
  }
  objc_storeStrong(v27, 0);
  objc_storeStrong(location, 0);
  return v30;
}

+ (id)getSegmentsDictForAllTreatments:(id *)a3
{
  AMDPair *v3;
  id v4;
  id v5;
  id v7;
  id v8;
  AMDPair *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  id location;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD __b[8];
  id v26;
  id v27;
  int v28;
  id v29;
  id *v30;
  SEL v31;
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32 = a1;
  v31 = a2;
  v30 = a3;
  v29 = (id)objc_msgSend(a1, "getSegmentsForTreatmentId:error:", 0, a3);
  if (*v30)
  {
    v33 = 0;
    v28 = 1;
  }
  else
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    memset(__b, 0, sizeof(__b));
    obj = v29;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
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
        v24 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("treatmentId"));
        v23 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("algoId"));
        v22 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("adamId"));
        v21 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("segment"));
        v20 = (id)objc_msgSend(v27, "objectForKey:", v24);
        if (!v20)
        {
          v9 = [AMDPair alloc];
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v3 = -[AMDPair initWith:and:](v9, "initWith:and:");
          v4 = v20;
          v20 = v3;

        }
        objc_msgSend(v27, "setObject:forKey:", v20, v24);
        v19 = (id)objc_msgSend(v20, "first");
        v18 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v22);
        location = (id)objc_msgSend(v19, "objectForKey:", v18);
        if (location)
        {
          objc_msgSend(location, "addObject:", v21);
        }
        else
        {
          v7 = v19;
          v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v8 = (id)objc_msgSend(v5, "initWithObjects:", v21, 0);
          objc_msgSend(v7, "setObject:forKey:");

        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
          if (!v14)
            break;
        }
      }
    }

    v33 = v27;
    v28 = 1;
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(&v29, 0);
  return v33;
}

+ (void)validatePredicate:(id)a3 withFeatureList:(id)a4 error:(id *)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v14;
  _QWORD __b[8];
  uint64_t v16;
  id v17[2];
  id v18;
  id location[6];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17[1] = a5;
  v17[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  v10 = v18;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
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
      v16 = *(_QWORD *)(__b[1] + 8 * v8);
      objc_msgSend(v17[0], "setObject:forKey:", MEMORY[0x1E0C9AAB0], v16);
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
        if (!v9)
          break;
      }
    }
  }

  v5 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", location[0]);
  v14 = (id)objc_msgSend(v5, "predicateWithSubstitutionVariables:", v17[0]);

  objc_msgSend(v14, "evaluateWithObject:", 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)evaluatePredicate:(id)a3 withOperands:(id)a4
{
  id v6;
  char v7;
  id v8;
  id v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", location[0]);
  v8 = (id)objc_msgSend(v6, "predicateWithSubstitutionVariables:", v9);

  v7 = objc_msgSend(v8, "evaluateWithObject:", 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

+ (id)assignSegmentsToApps:(id)a3 withFeatureDictionary:(id)a4 predicate:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD v29[8];
  uint64_t v30;
  id v31;
  _QWORD __b[8];
  id v33;
  id v34;
  id v35;
  id v36;
  id location[2];
  id v38;
  const __CFString *v39;
  const __CFString *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = 0;
  objc_storeStrong(&v35, a5);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  v26 = location[0];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
  if (v27)
  {
    v21 = *(_QWORD *)__b[2];
    v22 = 0;
    v23 = v27;
    while (1)
    {
      v20 = v22;
      if (*(_QWORD *)__b[2] != v21)
        objc_enumerationMutation(v26);
      v33 = *(id *)(__b[1] + 8 * v22);
      v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      memset(v29, 0, sizeof(v29));
      v18 = v36;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v29, v41, 16);
      if (v19)
      {
        v15 = *(_QWORD *)v29[2];
        v16 = 0;
        v17 = v19;
        while (1)
        {
          v14 = v16;
          if (*(_QWORD *)v29[2] != v15)
            objc_enumerationMutation(v18);
          v30 = *(_QWORD *)(v29[1] + 8 * v16);
          v28 = (id)objc_msgSend(v36, "objectForKey:", v30);
          v13 = (id)objc_msgSend(v28, "objectForKey:", v33);

          if (v13)
            objc_msgSend(v31, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v30);
          else
            objc_msgSend(v31, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v30);
          objc_storeStrong(&v28, 0);
          ++v16;
          if (v14 + 1 >= v17)
          {
            v16 = 0;
            v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v29, v41, 16);
            if (!v17)
              break;
          }
        }
      }

      if ((objc_msgSend(v38, "evaluatePredicate:withOperands:", v35, v31) & 1) != 0)
      {
        v10 = v34;
        v40 = CFSTR("1");
        v12 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v33, "longLongValue"));
        objc_msgSend(v10, "setObject:forKey:", v12);

      }
      else
      {
        v7 = v34;
        v39 = CFSTR("2");
        v9 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v33, "longLongValue"));
        objc_msgSend(v7, "setObject:forKey:", v9);

      }
      objc_storeStrong(&v31, 0);
      ++v22;
      if (v20 + 1 >= v23)
      {
        v22 = 0;
        v23 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
        if (!v23)
          break;
      }
    }
  }

  v6 = v34;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)computeSegmentsForApps:(id)a3 withRules:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  _QWORD __b[8];
  uint64_t v21;
  id v22;
  id v23;
  int v24;
  os_log_type_t type;
  id v26;
  __CFString *v27;
  id v28;
  id v29;
  id *v30;
  id v31;
  id location[2];
  id v33;
  id v34;
  _BYTE v35[128];
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v33 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = a5;
  v29 = (id)objc_msgSend(v31, "objectForKey:", CFSTR("features"));
  v28 = (id)objc_msgSend(v31, "objectForKey:", CFSTR("predicate"));
  if (v29 && v28)
  {
    objc_msgSend(v33, "validatePredicate:withFeatureList:error:", v28, v29, v30);
    if (*v30)
    {
      v34 = 0;
      v24 = 1;
    }
    else
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      memset(__b, 0, sizeof(__b));
      v13 = v29;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
      if (v14)
      {
        v10 = *(_QWORD *)__b[2];
        v11 = 0;
        v12 = v14;
        while (1)
        {
          v9 = v11;
          if (*(_QWORD *)__b[2] != v10)
            objc_enumerationMutation(v13);
          v21 = *(_QWORD *)(__b[1] + 8 * v11);
          v19 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v21, CFSTR("apps"), v30);
          if (*v30)
          {
            v24 = 2;
          }
          else if (v19)
          {
            objc_msgSend(v23, "setObject:forKey:", v19, v21);
            v24 = 0;
          }
          else
          {
            objc_msgSend(v22, "addObject:", v21);
            v24 = 3;
          }
          objc_storeStrong(&v19, 0);
          if (v24)
          {
            if (v24 != 3)
              break;
          }
          ++v11;
          if (v9 + 1 >= v12)
          {
            v11 = 0;
            v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
            if (!v12)
              goto LABEL_21;
          }
        }
      }
      else
      {
LABEL_21:
        v24 = 0;
      }

      if (*v30)
      {
        v34 = 0;
        v24 = 1;
      }
      else
      {
        v8 = objc_msgSend(v29, "count");
        if (v8 == objc_msgSend(v23, "count"))
        {
          v17 = (id)objc_msgSend(v33, "assignSegmentsToApps:withFeatureDictionary:predicate:", location[0], v23, v28);
          v34 = v17;
          v24 = 1;
          objc_storeStrong(&v17, 0);
        }
        else
        {
          v18 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested features are absent: %@"), v22);
          v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 21, v18);
          *v30 = v6;
          v34 = 0;
          v24 = 1;
          objc_storeStrong(&v18, 0);
        }
      }
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
    }
  }
  else
  {
    v27 = CFSTR("Segmentation Error: Feature List or Predicate absent");
    v26 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v27);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v26, type, "%@", v36, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 21, v27);
    *v30 = v5;
    v34 = 0;
    v24 = 1;
    objc_storeStrong((id *)&v27, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v34;
}

+ (id)assignSegmentsWithParameters:(id)a3 error:(id *)a4
{
  id v4;
  int v5;
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
  id v21;
  uint64_t v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD __b[8];
  uint64_t v34;
  unsigned int v35;
  id v36;
  id v37;
  id v38;
  os_log_type_t v39;
  id v40;
  __CFString *v41;
  int v42;
  id v43;
  id *v44;
  id location[2];
  id v46;
  id v47;
  _BYTE v48[128];
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v46 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = a4;
  v43 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", 0x1EA4C2468, CFSTR("apps"), a4);
  if (*a4)
  {
    v47 = 0;
    v42 = 1;
  }
  else if (v43)
  {
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = 0;
    memset(__b, 0, sizeof(__b));
    v21 = v43;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v48, 16);
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
        v34 = *(_QWORD *)(__b[1] + 8 * v19);
        v32 = (id)objc_msgSend(location[0], "objectForKey:", v34);
        v31 = (id)objc_msgSend(v43, "objectForKey:", v34);
        if (v32)
        {
          v30 = 0;
          v28 = 0;
          v16 = (id)objc_msgSend(v46, "computeSegmentsForApps:withRules:error:", v31, v32, &v28);
          objc_storeStrong(&v30, v28);
          v29 = v16;
          if (v30)
          {
            v14 = v36;
            v15 = (id)objc_msgSend(v30, "localizedDescription");
            objc_msgSend(v14, "setObject:forKey:");

            objc_msgSend(v38, "addObject:", v31);
            v42 = 3;
          }
          else
          {
            v5 = objc_msgSend(v29, "count");
            v35 += v5;
            objc_msgSend(v37, "addEntriesFromDictionary:", v29);
            v42 = 0;
          }
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
        }
        else
        {
          objc_msgSend(v38, "addObjectsFromArray:", v31);
          v42 = 3;
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        ++v19;
        if (v17 + 1 >= v20)
        {
          v19 = 0;
          v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v48, 16);
          if (!v20)
            break;
        }
      }
    }

    v12 = v36;
    v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
    objc_msgSend(v12, "setObject:forKey:");

    v27 = 0;
    v26 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("default"));
    if (v26)
    {
      v24 = v27;
      v11 = (id)objc_msgSend(v46, "computeSegmentsForApps:withRules:error:", v38, v26, &v24);
      objc_storeStrong(&v27, v24);
      v25 = v11;
      if (v27)
      {
        v9 = v36;
        v10 = (id)objc_msgSend(v27, "localizedDescription");
        objc_msgSend(v9, "setObject:forKey:");

      }
      else
      {
        objc_msgSend(v37, "addEntriesFromDictionary:", v25);
        v7 = v36;
        v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        objc_msgSend(v7, "setObject:forKey:");

      }
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v36, CFSTR("segmentationSummary"), 0);
      v47 = v37;
      v42 = 1;
      objc_storeStrong(&v25, 0);
    }
    else
    {
      objc_msgSend(v36, "setObject:forKey:", CFSTR("Default segmentation rules absent"), CFSTR("default"));
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v36, CFSTR("segmentationSummary"), 0);
      v47 = v37;
      v42 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    v41 = CFSTR("AMD_TP_APP_LIST_BY_GENRE feature unavailable on the device");
    v40 = MEMORY[0x1E0C81028];
    v39 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v41);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v40, v39, "%@", v49, 0xCu);
    }
    objc_storeStrong(&v40, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v41, CFSTR("SegmentComputationFailed"), 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 21, v41);
    *v44 = v4;
    v47 = 0;
    v42 = 1;
    objc_storeStrong((id *)&v41, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v47;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDAppSegment"), a2, a1);
}

@end
