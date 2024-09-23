@implementation AMDAppEvent

+ (id)getEventType:(id)a3
{
  id v3;
  void *v4;
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[3];
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventType__eventTypeMap)
  {
    v15[0] = CFSTR("installs");
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 1);
    v16[0] = v13;
    v15[1] = CFSTR("uninstalls");
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 2);
    v16[1] = v12;
    v15[2] = CFSTR("launches");
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 3);
    v16[2] = v11;
    v15[3] = CFSTR("crashes");
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 4);
    v16[3] = v10;
    v15[4] = CFSTR("subscribe");
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 5);
    v16[4] = v9;
    v15[5] = CFSTR("inAppPurchase");
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 6);
    v16[5] = v8;
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
    v4 = (void *)getEventType__eventTypeMap;
    getEventType__eventTypeMap = (uint64_t)v3;

  }
  v7 = (id)objc_msgSend((id)getEventType__eventTypeMap, "objectForKey:", location[0], location);
  objc_storeStrong(v6, 0);
  return v7;
}

+ (id)getEventSubType:(id)a3
{
  id v3;
  void *v4;
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[3];
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventSubType__eventSubTypeMap)
  {
    v15[0] = CFSTR("unknown");
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 0);
    v16[0] = v13;
    v15[1] = CFSTR("autodownload");
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 1);
    v16[1] = v12;
    v15[2] = CFSTR("buy");
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 2);
    v16[2] = v11;
    v15[3] = CFSTR("redownload");
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 3);
    v16[3] = v10;
    v15[4] = CFSTR("restore");
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 4);
    v16[4] = v9;
    v15[5] = CFSTR("update");
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 5);
    v16[5] = v8;
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
    v4 = (void *)getEventSubType__eventSubTypeMap;
    getEventSubType__eventSubTypeMap = (uint64_t)v3;

  }
  v7 = (id)objc_msgSend((id)getEventSubType__eventSubTypeMap, "objectForKey:", location[0], location);
  objc_storeStrong(v6, 0);
  return v7;
}

+ (id)getEventPlatform:(id)a3
{
  id v3;
  void *v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[3];
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventPlatform__platformMap)
  {
    v13[0] = CFSTR("iPhone");
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 1);
    v14[0] = v11;
    v13[1] = CFSTR("iPad");
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 2);
    v14[1] = v10;
    v13[2] = CFSTR("iPodTouch");
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 3);
    v14[2] = v9;
    v13[3] = CFSTR("AppleTV");
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 4);
    v14[3] = v8;
    v13[4] = CFSTR("watchOS");
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", 5);
    v14[4] = v7;
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
    v4 = (void *)getEventPlatform__platformMap;
    getEventPlatform__platformMap = (uint64_t)v3;

  }
  v6 = (id)objc_msgSend((id)getEventPlatform__platformMap, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)fetchEvents:(id *)a3
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
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v6 = location;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __27__AMDAppEvent_fetchEvents___block_invoke;
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

void __27__AMDAppEvent_fetchEvents___block_invoke(_QWORD *a1)
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
  v6 = (id)+[AMDAppEvent entity](AMDAppEvent, "entity");
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

+ (BOOL)validateInput:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  int v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  _QWORD __b[8];
  id v42;
  id location[2];
  id v44;
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
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
      v42 = *(id *)(__b[1] + 8 * v10);
      v7 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("itemId"));
      v39 = 0;
      v37 = 0;
      v35 = 0;
      v33 = 0;
      v31 = 0;
      v29 = 0;
      v27 = 0;
      v25 = 0;
      v23 = 0;
      v21 = 0;
      v19 = 0;
      v17 = 0;
      v15 = 0;
      if (v7
        || (v40 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("adamId")),
            v39 = 1,
            v6 = 1,
            v40))
      {
        v38 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("shortAppVersion"));
        v37 = 1;
        if (v38
          || (v36 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("appVersion")),
              v35 = 1,
              v6 = 1,
              v36))
        {
          v34 = (id)objc_msgSend(v42, "valueForKey:", CFSTR("eventTime"));
          v33 = 1;
          if (v34
            || (v32 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("time")),
                v31 = 1,
                v6 = 1,
                v32))
          {
            v5 = v44;
            v30 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("eventType"));
            v29 = 1;
            v28 = (id)objc_msgSend(v5, "getEventType:");
            v27 = 1;
            if (v28
              || (v26 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("type")),
                  v25 = 1,
                  v6 = 1,
                  v26))
            {
              v4 = v44;
              v24 = (id)objc_msgSend(v42, "valueForKey:", CFSTR("platform"));
              v23 = 1;
              v22 = (id)objc_msgSend(v4, "getEventPlatform:");
              v21 = 1;
              if (v22
                || (v20 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("platform")),
                    v19 = 1,
                    objc_opt_class(),
                    v6 = 1,
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                v18 = (id)objc_msgSend(v42, "valueForKey:", CFSTR("userId"));
                v17 = 1;
                v6 = 1;
                if (v18)
                {
                  v16 = (id)objc_msgSend(v42, "valueForKey:", CFSTR("userId"));
                  v15 = 1;
                  v6 = objc_msgSend(v16, "isEqualToString:", &stru_1EA4B7088);
                }
              }
            }
          }
        }
      }
      if ((v15 & 1) != 0)

      if ((v17 & 1) != 0)
      if ((v19 & 1) != 0)

      if ((v21 & 1) != 0)
      if ((v23 & 1) != 0)

      if ((v25 & 1) != 0)
      if ((v27 & 1) != 0)

      if ((v29 & 1) != 0)
      if ((v31 & 1) != 0)

      if ((v33 & 1) != 0)
      if ((v35 & 1) != 0)

      if ((v37 & 1) != 0)
      if ((v39 & 1) != 0)

      if ((v6 & 1) != 0)
        break;
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
        if (!v11)
          goto LABEL_47;
      }
    }
    v45 = 0;
    v14 = 1;
  }
  else
  {
LABEL_47:
    v14 = 0;
  }

  if (!v14)
    v45 = 1;
  objc_storeStrong(location, 0);
  return v45 & 1;
}

+ (unsigned)saveEvent:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v7;
  id v8;
  void *v10;
  id v11;
  char v12;
  os_log_t oslog;
  __CFString *v14;
  id v15;
  int v16;
  os_log_type_t v17;
  id v18;
  __CFString *v19;
  id *v20;
  id location[2];
  id v22;
  unsigned int v23;
  id v24;
  uint8_t v25[16];
  uint8_t v26[16];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v10 = v22;
  v27[0] = location[0];
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v12 = objc_msgSend(v10, "validateInput:");

  if ((v12 & 1) != 0)
  {
    v8 = (id)+[AMDAppEvent entity](AMDAppEvent, "entity");
    v15 = (id)objc_msgSend(v8, "name");

    if (v15)
    {
      v24 = location[0];
      v7 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v23 = +[AMDStorage saveRecords:inTable:error:](AMDStorage, "saveRecords:inTable:error:");

      v16 = 1;
    }
    else
    {
      v14 = CFSTR("AMDAppEvent: Internal error: Table name is nil! MOC not loaded?");
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v14);
        _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v25, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 29, v14);
      *v20 = v5;
      v23 = 0;
      v16 = 1;
      objc_storeStrong((id *)&v14, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v19 = CFSTR("One or more app events is invalid");
    v18 = MEMORY[0x1E0C81028];
    v17 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v19);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v18, v17, "%@", v26, 0xCu);
    }
    objc_storeStrong(&v18, 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v19);
    *v20 = v4;
    v23 = 0;
    v16 = 1;
    objc_storeStrong((id *)&v19, 0);
  }
  objc_storeStrong(location, 0);
  return v23;
}

+ (id)deleteAllEvents:(id *)a3
{
  return (id)objc_msgSend(a1, "deleteUsingPredicates:error:", MEMORY[0x1E0C9AA60], a3);
}

+ (id)deleteAllEventsForUser:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10[2];
  id location[2];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10[1] = a4;
  v10[0] = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("userId == %@"), location[0]);
  v6 = v12;
  v13[0] = v10[0];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (id)objc_msgSend(v6, "deleteUsingPredicates:error:");

  v8 = v9;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)deleteAppEventsOlderThan:(unint64_t)a3 forEventType:(id)a4 withPlatform:(id)a5 error:(id *)a6
{
  double v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v17;
  unint64_t v18;
  id v19;
  id v20;
  id *v21;
  id v22;
  id location;
  unint64_t v24;
  SEL v25;
  id v26;

  v26 = a1;
  v25 = a2;
  v24 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v17, "timeIntervalSince1970");
  v18 = (unint64_t)((v6 - (double)(86400 * v24)) * 1000.0);

  v19 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("time < %llu"), v18);
  objc_msgSend(v20, "addObject:");

  if (location)
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    v14 = (id)objc_msgSend(v26, "getEventType:", location);
    v13 = (id)objc_msgSend(v12, "predicateWithFormat:", CFSTR("type == %d"), (__int16)objc_msgSend(v14, "shortValue"));
    objc_msgSend(v20, "addObject:");

  }
  if (v22)
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    v11 = (id)objc_msgSend(v26, "getEventType:", location);
    v10 = (id)objc_msgSend(v9, "predicateWithFormat:", CFSTR("platform == %d"), (__int16)objc_msgSend(v11, "shortValue"));
    objc_msgSend(v20, "addObject:");

  }
  v8 = (id)objc_msgSend(v26, "deleteUsingPredicates:error:", v20, v21);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

+ (id)deleteUsingPredicates:(id)a3 error:(id *)a4
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
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("DeleteEvents"));
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v16 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v15 = (id)objc_msgSend(v16, "getManagedObjectContext");
  v5 = v15;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __43__AMDAppEvent_deleteUsingPredicates_error___block_invoke;
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
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("DeleteEvents"));
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

void __43__AMDAppEvent_deleteUsingPredicates_error___block_invoke(_QWORD *a1)
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
  v9 = (id)+[AMDAppEvent entity](AMDAppEvent, "entity");
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

+ (id)getSegmentsWithLookBack:(id)a3 andRecencyThreshold:(id)a4 andFrequencyThreshold:(id)a5 andDurationThreshold:(id)a6 withUserId:(id)a7 error:(id *)a8
{
  double v8;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  BOOL v14;
  unsigned int v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  char v34;
  id v35;
  char v36;
  id v37;
  char v38;
  id v39;
  id v40;
  _QWORD __b[8];
  id v42;
  id v43;
  unint64_t v44;
  os_log_type_t type;
  id v46;
  id v47;
  uint64_t v48;
  int v49;
  int v50;
  void (*v51)(uint64_t);
  void *v52;
  id v53;
  id v54;
  id v55[5];
  id v56;
  uint64_t v57;
  uint64_t *v58;
  int v59;
  int v60;
  void (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  int v66;
  int v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  int v71;
  id *v72;
  id v73;
  id v74;
  __int128 v75;
  id location[3];
  id v77;
  id v78;
  _BYTE v79[128];
  uint8_t v80[24];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *((_QWORD *)&v75 + 1) = 0;
  objc_storeStrong((id *)&v75 + 1, a4);
  *(_QWORD *)&v75 = 0;
  objc_storeStrong((id *)&v75, a5);
  v74 = 0;
  objc_storeStrong(&v74, a6);
  v73 = 0;
  objc_storeStrong(&v73, a7);
  v72 = a8;
  if (v75 != 0 || v74)
  {
    v64 = 0;
    v65 = &v64;
    v66 = 838860800;
    v67 = 48;
    v68 = __Block_byref_object_copy__5;
    v69 = __Block_byref_object_dispose__5;
    v70 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 838860800;
    v60 = 48;
    v61 = __Block_byref_object_copy__5;
    v62 = __Block_byref_object_dispose__5;
    v63 = 0;
    v28 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
    v56 = (id)objc_msgSend(v28, "getManagedObjectContext");

    v27 = v56;
    v48 = MEMORY[0x1E0C809B0];
    v49 = -1073741824;
    v50 = 0;
    v51 = __119__AMDAppEvent_getSegmentsWithLookBack_andRecencyThreshold_andFrequencyThreshold_andDurationThreshold_withUserId_error___block_invoke;
    v52 = &unk_1EA4B51C0;
    v53 = location[0];
    v54 = v73;
    v55[1] = &v57;
    v55[0] = v56;
    v55[2] = &v64;
    objc_msgSend(v27, "performBlockAndWait:", &v48);
    if (v65[5])
    {
      *v72 = objc_retainAutorelease((id)v65[5]);
      v77 = 0;
      v71 = 1;
    }
    else if (v58[5])
    {
      v44 = 0;
      v26 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      objc_msgSend(v26, "timeIntervalSince1970");
      v25 = (unint64_t)v8;

      v44 = v25;
      v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      memset(__b, 0, sizeof(__b));
      v23 = (id)v58[5];
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", __b, v79, 16);
      if (v24)
      {
        v20 = *(_QWORD *)__b[2];
        v21 = 0;
        v22 = v24;
        while (1)
        {
          v19 = v21;
          if (*(_QWORD *)__b[2] != v20)
            objc_enumerationMutation(v23);
          v42 = *(id *)(__b[1] + 8 * v21);
          v40 = CFSTR("1");
          v38 = 0;
          v36 = 0;
          v34 = 0;
          if (!*((_QWORD *)&v75 + 1)
            || (v39 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("mostRecentLaunchTimeMillis")), v38 = 1, v17 = objc_msgSend(v39, "unsignedLongLongValue") / 0x3E8uLL, v18 = v44, v16 = 1, v17 >= v18 - objc_msgSend(*((id *)&v75 + 1), "unsignedLongLongValue")))
          {
            if (!(_QWORD)v75
              || (v37 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("launchCount")),
                  v36 = 1,
                  v15 = objc_msgSend(v37, "unsignedIntValue"),
                  v16 = 1,
                  v15 >= objc_msgSend((id)v75, "unsignedIntValue")))
            {
              v14 = 0;
              if (v74)
              {
                v35 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("totalForegroundDuration"));
                v34 = 1;
                v13 = objc_msgSend(v35, "unsignedIntValue");
                v14 = v13 < objc_msgSend(v74, "unsignedIntValue");
              }
              v16 = v14;
            }
          }
          if ((v34 & 1) != 0)

          if ((v36 & 1) != 0)
          if ((v38 & 1) != 0)

          if ((v16 & 1) != 0)
            objc_storeStrong(&v40, CFSTR("2"));
          v12 = v43;
          v78 = v40;
          v11 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
          v10 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("adamId"));
          objc_msgSend(v12, "setObject:forKey:", v11);

          objc_storeStrong(&v40, 0);
          ++v21;
          if (v19 + 1 >= v22)
          {
            v21 = 0;
            v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", __b, v79, 16);
            if (!v22)
              break;
          }
        }
      }

      v77 = v43;
      v71 = 1;
      objc_storeStrong(&v43, 0);
    }
    else
    {
      v47 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nil Response from CoreData request during segment computation."));
      v46 = MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v47);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v46, type, "%@", v80, 0xCu);
      }
      objc_storeStrong(&v46, 0);
      *v72 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v47);
      v77 = 0;
      v71 = 1;
      objc_storeStrong(&v47, 0);
    }
    objc_storeStrong(v55, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v56, 0);
    _Block_object_dispose(&v57, 8);
    objc_storeStrong(&v63, 0);
    _Block_object_dispose(&v64, 8);
    objc_storeStrong(&v70, 0);
  }
  else
  {
    *v72 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("programmer error!"));
    v77 = 0;
    v71 = 1;
  }
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong((id *)&v75, 0);
  objc_storeStrong((id *)&v75 + 1, 0);
  objc_storeStrong(location, 0);
  return v77;
}

void __119__AMDAppEvent_getSegmentsWithLookBack_andRecencyThreshold_andFrequencyThreshold_andDurationThreshold_withUserId_error___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  id *location;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33[3];
  id v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v33[2] = (id)a1;
  v33[1] = (id)a1;
  v5 = (void *)MEMORY[0x1E0C97B48];
  v7 = (id)+[AMDAppEvent entity](AMDAppEvent, "entity");
  v6 = (id)objc_msgSend(v7, "name");
  v33[0] = (id)objc_msgSend(v5, "fetchRequestWithEntityName:");

  objc_msgSend(v33[0], "setResultType:", 2);
  v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  objc_msgSend(v32, "addObject:", CFSTR("adamId"));
  v8 = (void *)MEMORY[0x1E0CB35D0];
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("time"));
  v36[0] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36);
  v31 = (id)objc_msgSend(v8, "expressionForFunction:arguments:", CFSTR("max:"));

  v30 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v30, "setName:", CFSTR("mostRecentLaunchTimeMillis"));
  objc_msgSend(v30, "setExpression:", v31);
  objc_msgSend(v30, "setExpressionResultType:");
  objc_msgSend(v32, "addObject:", v30);
  v11 = (void *)MEMORY[0x1E0CB35D0];
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:");
  v35 = v13;
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v29 = (id)objc_msgSend(v11, "expressionForFunction:arguments:", CFSTR("count:"));

  v28 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v28, "setName:", CFSTR("launchCount"));
  objc_msgSend(v28, "setExpression:", v29);
  objc_msgSend(v28, "setExpressionResultType:", 200);
  objc_msgSend(v32, "addObject:", v28);
  v14 = (void *)MEMORY[0x1E0CB35D0];
  v16 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("foregroundDuration"));
  v34 = v16;
  v15 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v27 = (id)objc_msgSend(v14, "expressionForFunction:arguments:", CFSTR("sum:"));

  v26 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v26, "setName:", CFSTR("totalForegroundDuration"));
  objc_msgSend(v26, "setExpression:", v27);
  objc_msgSend(v26, "setExpressionResultType:", 300);
  objc_msgSend(v32, "addObject:", v26);
  objc_msgSend(v33[0], "setPropertiesToFetch:", v32);
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v17, "timeIntervalSince1970");
  v18 = (unint64_t)v1;

  v25 = v18;
  v24 = 0;
  v24 = 1000 * (v18 - 86400 * objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue"));
  v23 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("time >= %ull && type == %d && userId == %@"), v24, 3, *(_QWORD *)(a1 + 40));
  objc_msgSend(v33[0], "setPredicate:", v23);
  objc_msgSend(v33[0], "setPropertiesToGroupBy:", &unk_1EA4D1B00);
  v2 = *(void **)(a1 + 48);
  location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v22 = *location;
  v21 = (id)objc_msgSend(v2, "executeFetchRequest:error:", v33[0], &v22);
  objc_storeStrong(location, v22);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v21;

  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v33, 0);
}

- (void)populateRecord:(id)a3
{
  id v3;
  id v4;
  id v5;
  AMDAppEvent *v6;
  id v7;
  id v8;
  AMDAppEvent *v9;
  id v10;
  id v11;
  AMDAppEvent *v12;
  id v13;
  id v14;
  AMDAppEvent *v15;
  id v16;
  id v17;
  AMDAppEvent *v18;
  id v19;
  id v20;
  AMDAppEvent *v21;
  id v22;
  id v23;
  AMDAppEvent *v24;
  id v25;
  id v26;
  AMDAppEvent *v27;
  id v28;
  AMDAppEvent *v29;
  id v30;
  id v31;
  AMDAppEvent *v32;
  id v33;
  AMDAppEvent *v34;
  id v35;
  id v36;
  id v37;
  char v38;
  id v39;
  AMDAppEvent *v40;
  id v41;
  id v42;
  AMDAppEvent *v43;
  id v44;
  id v45;
  char isKindOfClass;
  AMDAppEvent *v47;
  id v48;
  AMDAppEvent *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char v56;
  id v57;
  char v58;
  id v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  id v70;
  id location[2];
  AMDAppEvent *v72;

  v72 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("itemId"));
  v68 = 0;
  v66 = 0;
  if (v55)
  {
    v69 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("itemId"));
    v68 = 1;
    v3 = v69;
  }
  else
  {
    v67 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("adamId"));
    v66 = 1;
    v3 = v67;
  }
  v70 = v3;
  if ((v66 & 1) != 0)

  if ((v68 & 1) != 0)
  v54 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("shortAppVersion"));
  v63 = 0;
  v61 = 0;
  if (v54)
  {
    v64 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("shortAppVersion"));
    v63 = 1;
    v4 = v64;
  }
  else
  {
    v62 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("appVersion"));
    v61 = 1;
    v4 = v62;
  }
  v65 = v4;
  if ((v61 & 1) != 0)

  if ((v63 & 1) != 0)
  v53 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventTime"));
  v58 = 0;
  v56 = 0;
  if (v53)
  {
    v59 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventTime"));
    v58 = 1;
    v5 = v59;
  }
  else
  {
    v57 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("time"));
    v56 = 1;
    v5 = v57;
  }
  v60 = v5;
  if ((v56 & 1) != 0)

  if ((v58 & 1) != 0)
  -[AMDAppEvent setAdamId:](v72, "setAdamId:", objc_msgSend(v70, "unsignedLongLongValue"));
  -[AMDAppEvent setAppVersion:](v72, "setAppVersion:", v65);
  -[AMDAppEvent setTime:](v72, "setTime:", objc_msgSend(v60, "unsignedLongLongValue"));
  v52 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("eventType"));

  if (v52)
  {
    v49 = v72;
    v51 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("eventType"));
    v50 = +[AMDAppEvent getEventType:](AMDAppEvent, "getEventType:");
    -[AMDAppEvent setType:](v49, "setType:", (__int16)objc_msgSend(v50, "unsignedShortValue"));

  }
  else
  {
    v47 = v72;
    v48 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("type"));
    -[AMDAppEvent setType:](v47, "setType:", (__int16)objc_msgSend(v48, "unsignedShortValue"));

  }
  v45 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("platform"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v43 = v72;
    v44 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("platform"));
    -[AMDAppEvent setPlatform:](v43, "setPlatform:", (__int16)objc_msgSend(v44, "unsignedShortValue"));

  }
  else
  {
    v40 = v72;
    v42 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("platform"));
    v41 = +[AMDAppEvent getEventPlatform:](AMDAppEvent, "getEventPlatform:");
    -[AMDAppEvent setPlatform:](v40, "setPlatform:", (__int16)objc_msgSend(v41, "unsignedShortValue"));

  }
  v39 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventSubtype"));

  if (v39)
  {
    v37 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventSubtype"));
    objc_opt_class();
    v38 = objc_opt_isKindOfClass();

    if ((v38 & 1) != 0)
    {
      v34 = v72;
      v36 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventSubtype"));
      v35 = +[AMDAppEvent getEventSubType:](AMDAppEvent, "getEventSubType:");
      -[AMDAppEvent setEventSubType:](v34, "setEventSubType:", (__int16)objc_msgSend(v35, "intValue"));

    }
    else
    {
      v32 = v72;
      v33 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("eventSubtype"));
      -[AMDAppEvent setEventSubType:](v32, "setEventSubType:", (__int16)objc_msgSend(v33, "intValue"));

    }
  }
  v29 = v72;
  v30 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("userId"));
  -[AMDAppEvent setUserId:](v29, "setUserId:");

  v31 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("batteryUsage"));
  if (v31)
  {
    v27 = v72;
    v28 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("batteryUsage"));
    objc_msgSend(v28, "floatValue");
    -[AMDAppEvent setBatteryUsage:](v27, "setBatteryUsage:");

  }
  v26 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("foregroundDuration"));

  if (v26)
  {
    v24 = v72;
    v25 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("foregroundDuration"));
    -[AMDAppEvent setForegroundDuration:](v24, "setForegroundDuration:", objc_msgSend(v25, "unsignedLongLongValue"));

  }
  v23 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("latitude"));

  if (v23)
  {
    v21 = v72;
    v22 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("latitude"));
    objc_msgSend(v22, "floatValue");
    -[AMDAppEvent setLatitude:](v21, "setLatitude:");

  }
  v20 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("locationAccuracy"));

  if (v20)
  {
    v18 = v72;
    v19 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("locationAccuracy"));
    objc_msgSend(v19, "floatValue");
    -[AMDAppEvent setLocationAccuracy:](v18, "setLocationAccuracy:");

  }
  v17 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("longitude"));

  if (v17)
  {
    v15 = v72;
    v16 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("longitude"));
    objc_msgSend(v16, "floatValue");
    -[AMDAppEvent setLongitude:](v15, "setLongitude:");

  }
  v14 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("storageUsed"));

  if (v14)
  {
    v12 = v72;
    v13 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("storageUsed"));
    -[AMDAppEvent setStorageUsed:](v12, "setStorageUsed:", (int)objc_msgSend(v13, "intValue"));

  }
  v11 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("timezoneOffset"));

  if (v11)
  {
    v9 = v72;
    v10 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("timezoneOffset"));
    -[AMDAppEvent setTimeZoneOffset:](v9, "setTimeZoneOffset:", objc_msgSend(v10, "unsignedLongLongValue"));

  }
  v8 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("deviceId"));

  if (v8)
  {
    v6 = v72;
    v7 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("deviceId"));
    -[AMDAppEvent setDeviceId:](v6, "setDeviceId:");

  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(location, 0);
}

+ (id)fetchEventsWithPredicate:(id)a3 error:(id *)a4
{
  id v4;
  id v7;
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
  id *v31;
  id location[3];
  id v33;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = a4;
  v7 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v30 = (id)objc_msgSend(v7, "getManagedObjectContext");

  v23 = 0;
  v24 = &v23;
  v25 = 838860800;
  v26 = 48;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v8 = v30;
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __46__AMDAppEvent_fetchEventsWithPredicate_error___block_invoke;
  v13 = &unk_1EA4B5210;
  v14 = location[0];
  v15[1] = &v16;
  v15[0] = v30;
  v15[2] = &v23;
  objc_msgSend(v8, "performBlockAndWait:", &v9);
  if (v24[5])
  {
    v4 = objc_retainAutorelease((id)v24[5]);
    *v31 = v4;
    v33 = 0;
  }
  else
  {
    v33 = (id)v17[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v33;
}

void __46__AMDAppEvent_fetchEventsWithPredicate_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id *location;
  id v11;
  id v12;
  id v13[3];

  v13[2] = a1;
  v13[1] = a1;
  v4 = (void *)MEMORY[0x1E0C97B48];
  v6 = (id)+[AMDAppEvent entity](AMDAppEvent, "entity");
  v5 = (id)objc_msgSend(v6, "name");
  v13[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  v7 = v13[0];
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", a1[4]);
  objc_msgSend(v7, "setPredicate:");

  objc_msgSend(v13[0], "setResultType:", 2);
  v1 = (void *)a1[5];
  location = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v12 = *location;
  v11 = (id)objc_msgSend(v1, "executeFetchRequest:error:", v13[0], &v12);
  objc_storeStrong(location, v12);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v11;

  objc_storeStrong(v13, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AMDAppEvent"), a2, a1);
}

@end
