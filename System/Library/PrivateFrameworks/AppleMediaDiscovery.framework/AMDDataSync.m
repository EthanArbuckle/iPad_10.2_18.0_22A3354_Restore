@implementation AMDDataSync

- (AMDDataSync)initWithDataReplicationConfig:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  BOOL v18;
  id v19;
  BOOL v20;
  id v21;
  BOOL v22;
  id v23;
  BOOL v24;
  id v25;
  BOOL v26;
  id v28;
  id v29;
  id v30;
  os_log_type_t v31;
  id v32;
  __CFString *v33;
  int v34;
  os_log_type_t v35;
  id v36;
  __CFString *v37;
  objc_super v38;
  id *v39;
  id location[2];
  id v41;
  AMDDataSync *v42;
  const __CFString *v43;
  uint8_t v44[16];
  uint8_t v45[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = a4;
  v4 = v41;
  v41 = 0;
  v38.receiver = v4;
  v38.super_class = (Class)AMDDataSync;
  v41 = -[AMDDataSync init](&v38, sel_init);
  objc_storeStrong(&v41, v41);
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = location[0];
      v29 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("isEnabled"));
      if (v29 && (objc_msgSend(v29, "BOOLValue") & 1) != 0)
      {
        v25 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("eventsDeltaSize"));
        objc_msgSend(v41, "setEventsDeltaSize:");

        v7 = (id)objc_msgSend(v41, "eventsDeltaSize");
        v26 = v7 != 0;

        if (!v26)
          objc_msgSend(v41, "setEventsDeltaSize:", &unk_1EA4CEDE8);
        v23 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("eventLifetime"));
        objc_msgSend(v41, "setEventLifetimeDays:");

        v8 = (id)objc_msgSend(v41, "eventLifetimeDays");
        v24 = v8 != 0;

        if (!v24)
          objc_msgSend(v41, "setEventLifetimeDays:", &unk_1EA4CEE00);
        v21 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("deviceForgetThreshold"));
        objc_msgSend(v41, "setDeviceForgetThresholdDays:");

        v9 = (id)objc_msgSend(v41, "deviceForgetThresholdDays");
        v22 = v9 != 0;

        if (!v22)
          objc_msgSend(v41, "setDeviceForgetThresholdDays:", &unk_1EA4CEE18);
        v19 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("fullSyncEventsDeltaSize"));
        objc_msgSend(v41, "setFullSyncEventsDeltaSize:");

        v10 = (id)objc_msgSend(v41, "fullSyncEventsDeltaSize");
        v20 = v10 != 0;

        if (!v20)
          objc_msgSend(v41, "setFullSyncEventsDeltaSize:", &unk_1EA4CEE30);
        v17 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("fullSyncDeviceResetThreshold"));
        objc_msgSend(v41, "setFullSyncDeviceResetThresholdDays:");

        v11 = (id)objc_msgSend(v41, "fullSyncDeviceResetThresholdDays");
        v18 = v11 != 0;

        if (!v18)
          objc_msgSend(v41, "setFullSyncDeviceResetThresholdDays:", &unk_1EA4CEE48);
        v15 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("supportedStreams"));
        objc_msgSend(v41, "setStreamsToSync:");

        v12 = (id)objc_msgSend(v41, "streamsToSync");
        v16 = v12 != 0;

        if (!v16)
        {
          v43 = CFSTR("AppUsageDataCoreData");
          v14 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
          objc_msgSend(v41, "setStreamsToSync:");

        }
        v28 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", v39);
        if (*v39)
        {
          v42 = 0;
        }
        else
        {
          objc_msgSend(v41, "setLocalDeviceId:", v28);
          v42 = (AMDDataSync *)v41;
        }
        v34 = 1;
        objc_storeStrong(&v28, 0);
      }
      else
      {
        v42 = 0;
        v34 = 1;
      }
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
    }
    else
    {
      v33 = CFSTR("Data Replication Config is not a dictionary");
      v32 = MEMORY[0x1E0C81028];
      v31 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v33);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v32, v31, "%@", v44, 0xCu);
      }
      objc_storeStrong(&v32, 0);
      v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v33);
      *v39 = v6;
      v42 = 0;
      v34 = 1;
      objc_storeStrong((id *)&v33, 0);
    }
  }
  else
  {
    v37 = CFSTR("Missing Data Replication Config");
    v36 = MEMORY[0x1E0C81028];
    v35 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v37);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v36, v35, "%@", v45, 0xCu);
    }
    objc_storeStrong(&v36, 0);
    v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v37);
    *v39 = v5;
    v42 = 0;
    v34 = 1;
    objc_storeStrong((id *)&v37, 0);
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v41, 0);
  return v42;
}

+ (id)generateDeviceIDFileAtLocation:(id)a3 error:(id *)a4
{
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21[2];
  id v22;
  id *v23;
  id location[3];
  id v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v9 = (id)objc_msgSend(v10, "UUIDString");
  v22 = (id)objc_msgSend(CFSTR("__DR__"), "stringByAppendingString:");

  v11 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v12 = (void *)objc_msgSend(v11, "longLongValue");

  v21[1] = v12;
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v12);
  v21[0] = (id)objc_msgSend(v13, "stringValue");

  v14 = (id)objc_msgSend(v22, "stringByAppendingString:", CFSTR("_"));
  v20 = (id)objc_msgSend(v14, "stringByAppendingString:", v21[0]);

  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("deviceUUID"));
  v18 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v19, 1, a4);
  if (*a4)
  {
    v17 = MEMORY[0x1E0C81028];
    v16 = 16;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      log = v17;
      type = v16;
      v7 = (id)objc_msgSend(*v23, "localizedDescription");
      v15 = v7;
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v15);
      _os_log_error_impl(&dword_1DC678000, log, type, "DeviceId creation failed. Error: %@", v26, 0xCu);

      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong(&v17, 0);
    v25 = 0;
  }
  else
  {
    objc_msgSend(v18, "writeToURL:atomically:", location[0], 1);
    v25 = v22;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v25;
}

+ (id)fetchDeviceID:(id *)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_type_t type;
  os_log_t oslog;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id *v24;
  SEL v25;
  id v26;
  id v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = a1;
  v25 = a2;
  v24 = a3;
  v23 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (id)objc_msgSend(v23, "URLsForDirectory:inDomains:", 14, 1);
  v22 = (id)objc_msgSend(v11, "lastObject");

  v21 = (id)objc_msgSend(v22, "URLByAppendingPathComponent:", 0x1EA4BD648);
  v12 = (id)objc_msgSend(v21, "URLByAppendingPathComponent:", CFSTR("__deviceId"));
  v20 = (id)objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("json"));

  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v20);
  v18 = 0;
  if (!v19)
  {
    v3 = (id)objc_msgSend(v26, "generateDeviceIDFileAtLocation:error:", v20, v24);
    v4 = v18;
    v18 = v3;

    if (*v24)
    {
      v27 = 0;
      v17 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v27 = v18;
    v17 = 1;
    goto LABEL_12;
  }
  v16 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v19, 4, v24);
  if (*v24)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v9 = type;
      v10 = (id)objc_msgSend(*v24, "localizedDescription");
      v13 = v10;
      __os_log_helper_16_2_1_8_64((uint64_t)v28, (uint64_t)v13);
      _os_log_error_impl(&dword_1DC678000, log, v9, "DeviceId read failed. Error: %@", v28, 0xCu);

      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v27 = 0;
    v17 = 1;
  }
  else
  {
    v5 = (id)objc_msgSend(v16, "objectForKey:", CFSTR("deviceUUID"));
    v6 = v18;
    v18 = v5;

    v17 = 0;
  }
  objc_storeStrong(&v16, 0);
  if (!v17)
    goto LABEL_11;
LABEL_12:
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  return v27;
}

- (id)findAvailableDeviceForFullSyncIn:(id)a3
{
  unint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  int v14;
  id v15;
  _QWORD __b[8];
  id v17;
  unint64_t v18;
  id v19;
  id location[3];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = &stru_1EA4B7088;
  v18 = 0;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v17 = *(id *)(__b[1] + 8 * v9);
      v15 = (id)objc_msgSend(location[0], "objectForKey:", v17);
      v6 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("fullSyncResponse"));

      if (v6)
      {
        v14 = 3;
      }
      else
      {
        v13 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("lastUpdateTimeMilliSeconds"));
        v3 = objc_msgSend(v13, "longLongValue");
        if (v3 > v18)
        {
          v18 = objc_msgSend(v13, "longLongValue");
          objc_storeStrong(&v19, v17);
        }
        objc_storeStrong(&v13, 0);
        v14 = 0;
      }
      objc_storeStrong(&v15, 0);
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
        if (!v10)
          break;
      }
    }
  }

  v5 = v19;
  v14 = 1;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)generateFullSyncPayloadWithDevicesData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD __b[8];
  uint64_t v19;
  char v20;
  int v21;
  id *v22;
  id location[2];
  AMDDataSync *v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  if (objc_msgSend(location[0], "count"))
  {
    v20 = 1;
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(__b[1] + 8 * v9);
        v17 = (id)objc_msgSend(location[0], "objectForKey:", v19);
        if (objc_msgSend(v17, "count"))
          v20 = 0;
        objc_storeStrong(&v17, 0);
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

    if ((v20 & 1) != 0)
    {
      v25 = 0;
      v21 = 1;
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = -[AMDDataSync findAvailableDeviceForFullSyncIn:](v24, "findAvailableDeviceForFullSyncIn:", location[0]);
      objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("sourceUUID"));
      objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AA70], CFSTR("fsCheckpoint"));
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
      v14 = (id)objc_msgSend(v5, "numberWithLongLong:", 1000 * objc_msgSend(v6, "longLongValue"));

      objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("fsRequestTime"));
      v25 = v16;
      v21 = 1;
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
  }
  else
  {
    v25 = 0;
    v21 = 1;
  }
  objc_storeStrong(location, 0);
  return v25;
}

- (id)fetchLastReadTimestampFromPayload:(id)a3
{
  unint64_t v3;
  id v5;
  NSString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id obj;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  id v19;
  _QWORD __b[8];
  uint64_t v21;
  unint64_t v22;
  id location[2];
  AMDDataSync *v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v13 = 1000 * objc_msgSend(v12, "longLongValue");

  v22 = v13;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v15)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v15;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v21 = *(_QWORD *)(__b[1] + 8 * v10);
      v19 = (id)objc_msgSend(location[0], "objectForKey:", v21);
      v18 = (id)objc_msgSend(v19, "objectForKey:", CFSTR("checkpoints"));
      v5 = v18;
      v6 = -[AMDDataSync localDeviceId](v24, "localDeviceId");
      v17 = (id)objc_msgSend(v5, "objectForKey:");

      v7 = (id)objc_msgSend(v19, "objectForKey:", CFSTR("fullSyncRequest"));
      if (v7)
      {
        v16 = 3;
      }
      else if (v17)
      {
        v3 = objc_msgSend(v17, "unsignedLongLongValue");
        if (v3 < v22)
          v22 = objc_msgSend(v17, "unsignedLongLongValue");
        v16 = 0;
      }
      else
      {
        v25 = &unk_1EA4CEE60;
        v16 = 1;
      }
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
      if (v16)
      {
        if (v16 != 3)
          break;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v11)
          goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    v16 = 0;
  }

  if (!v16)
    v25 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
  objc_storeStrong(location, 0);
  return v25;
}

- (id)fetchLastReadTimestampFromPayload:(id)a3 forStream:(id)a4
{
  unint64_t v4;
  id v6;
  NSString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  _QWORD __b[8];
  uint64_t v24;
  unint64_t v25;
  id v26;
  id location[2];
  AMDDataSync *v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v14 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v15 = 1000 * objc_msgSend(v14, "longLongValue");

  v25 = v15;
  memset(__b, 0, sizeof(__b));
  v16 = location[0];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v17)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v17;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(v16);
      v24 = *(_QWORD *)(__b[1] + 8 * v11);
      v22 = (id)objc_msgSend(location[0], "objectForKey:", v24);
      v8 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("fullSyncRequest"));

      if (v8)
      {
        v21 = 3;
      }
      else
      {
        v20 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("checkpoints"));
        v19 = (id)objc_msgSend(v20, "objectForKey:", v26);
        if (v19)
        {
          v6 = v19;
          v7 = -[AMDDataSync localDeviceId](v28, "localDeviceId");
          v18 = (id)objc_msgSend(v6, "objectForKey:");

          if (v18)
          {
            v4 = objc_msgSend(v18, "unsignedLongLongValue");
            if (v4 < v25)
              v25 = objc_msgSend(v18, "unsignedLongLongValue");
            v21 = 0;
          }
          else
          {
            v29 = &unk_1EA4CEE60;
            v21 = 1;
          }
          objc_storeStrong(&v18, 0);
        }
        else
        {
          v21 = 3;
        }
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
      }
      objc_storeStrong(&v22, 0);
      if (v21)
      {
        if (v21 != 3)
          break;
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v12)
          goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    v21 = 0;
  }

  if (!v21)
  {
    v29 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
    v21 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v29;
}

- (id)pruneInactiveDevicesFrom:(id)a3
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSNumber *v11;
  id v12;
  uint64_t v13;
  id obj;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD __b[8];
  uint64_t v19;
  id v20;
  unint64_t v21;
  id location[2];
  AMDDataSync *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v10 = objc_msgSend(v12, "longLongValue");
  v11 = -[AMDDataSync deviceForgetThresholdDays](v23, "deviceForgetThresholdDays");
  v13 = 1000 * (v10 - 86400 * -[NSNumber longValue](v11, "longValue"));

  v21 = v13;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v15)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v15;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(__b[1] + 8 * v8);
      v17 = (id)objc_msgSend(location[0], "objectForKey:", v19);
      v16 = (id)objc_msgSend(v17, "objectForKey:", CFSTR("lastUpdateTimeMilliSeconds"));
      v3 = objc_msgSend(v16, "longLongValue");
      if (v3 < v21)
        objc_msgSend(v20, "addObject:", v19);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v9)
          break;
      }
    }
  }

  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v20, CFSTR("prunedDeviceIds"), 0);
  v5 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)filterEventsList:(id)a3 withLastReadTimestamp:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  NSNumber *v16;
  id v17;
  unint64_t v18;
  int i;
  id v20;
  int v21;
  id v22;
  _QWORD __b[8];
  id v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  id location[2];
  AMDDataSync *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v17 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v15 = objc_msgSend(v17, "longLongValue");
  v16 = -[AMDDataSync eventLifetimeDays](v32, "eventLifetimeDays");
  v18 = 1000 * (v15 - 86400 * -[NSNumber longValue](v16, "longValue"));

  v29 = v18;
  v28 = v18;
  v27 = objc_msgSend(v30, "unsignedLongLongValue");
  if (v18 >= v27)
    v13 = v28;
  else
    v13 = v27;
  v26 = v13;
  v29 = v13;
  v25 = 0;
  memset(__b, 0, sizeof(__b));
  v11 = location[0];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(v11);
      v24 = *(id *)(__b[1] + 8 * v9);
      v22 = (id)objc_msgSend(v24, "objectForKey:", CFSTR("time"));
      if (objc_msgSend(v22, "unsignedLongLongValue") <= v29)
      {
        ++v25;
        v21 = 0;
      }
      else
      {
        v21 = 2;
      }
      objc_storeStrong(&v22, 0);
      if (v21)
        break;
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
        if (!v10)
          goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v21 = 0;
  }

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = v25; i < (unint64_t)objc_msgSend(location[0], "count"); ++i)
  {
    v6 = (id)objc_msgSend(location[0], "objectAtIndex:", i);
    objc_msgSend(v20, "addObject:");

  }
  v5 = v20;
  v21 = 1;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)fetch:(id)a3 SortedEventListFromTimestamp:(id)a4 forCurrentDevice:(BOOL)a5 error:(id *)a6
{
  unint64_t v7;
  NSObject *log;
  os_log_type_t v9;
  id v10;
  id v11;
  NSString *v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  NSString *v24;
  int v28;
  unint64_t v29;
  id v30;
  id v31;
  int v32;
  id v33;
  os_log_type_t type;
  os_log_t oslog;
  id v36;
  _QWORD __b[8];
  id v38;
  id v39;
  id v40;
  id v41;
  id *v42;
  BOOL v43;
  id v44;
  id location[2];
  AMDDataSync *v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint8_t v52[24];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = 0;
  objc_storeStrong(&v44, a4);
  v43 = a5;
  v42 = a6;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5)
  {
    v22 = (void *)MEMORY[0x1E0CB3880];
    v24 = -[AMDDataSync localDeviceId](v46, "localDeviceId");
    v23 = (id)objc_msgSend(v22, "predicateWithFormat:", CFSTR("deviceId == %@ || deviceId == %@"), v24, CFSTR("undefined"));
    objc_msgSend(v41, "addObject:");

  }
  if (v44)
  {
    v21 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("time > %llu"), objc_msgSend(v44, "longLongValue"));
    objc_msgSend(v41, "addObject:");

  }
  v40 = +[AMDAppEvent fetchEventsWithPredicate:error:](AMDAppEvent, "fetchEventsWithPredicate:error:", v41, v42);
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  v19 = v40;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
  if (v20)
  {
    v16 = *(_QWORD *)__b[2];
    v17 = 0;
    v18 = v20;
    while (1)
    {
      v15 = v17;
      if (*(_QWORD *)__b[2] != v16)
        objc_enumerationMutation(v19);
      v38 = *(id *)(__b[1] + 8 * v17);
      v13 = (id)objc_msgSend(v38, "objectForKey:", 0x1EA4BCEE8);
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("undefined"));

      if ((v14 & 1) != 0)
      {
        v36 = (id)objc_msgSend(v38, "mutableCopy");
        v11 = v36;
        v12 = -[AMDDataSync localDeviceId](v46, "localDeviceId");
        objc_msgSend(v11, "setObject:forKey:");

        objc_msgSend(v39, "addObject:", v36);
        objc_storeStrong(&v36, 0);
      }
      else
      {
        objc_msgSend(v39, "addObject:", v38);
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        v17 = 0;
        v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
        if (!v18)
          break;
      }
    }
  }

  if (*v42)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v9 = type;
      v10 = (id)objc_msgSend(*v42, "localizedDescription");
      v33 = v10;
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v33);
      _os_log_error_impl(&dword_1DC678000, log, v9, "Event fetch failed during data sync with error: %@", v52, 0xCu);

      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v47 = 0;
    v32 = 1;
  }
  else
  {
    v31 = +[AMDMiscHelpers sortArrayElements:inDescendingOrder:withComparisonKey:isKeyString:](AMDMiscHelpers, "sortArrayElements:inDescendingOrder:withComparisonKey:isKeyString:", v39, 0, 0x1EA4BCB88, 0);
    v29 = objc_msgSend(v31, "count");
    v28 = objc_msgSend(location[0], "intValue");
    if (v29 >= v28)
      v7 = v28;
    else
      v7 = v29;
    v49 = 0;
    v48 = v7;
    v50 = 0;
    v51 = v7;
    v30 = (id)objc_msgSend(v31, "subarrayWithRange:", 0, v7);
    v47 = v30;
    v32 = 1;
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v47;
}

- (id)fetchEventsForStream:(id)a3 withPredicates:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  AMDFetchDescriptor *v15;
  id v16;
  id v19;
  id v20;
  int k;
  id v22;
  id v23;
  int j;
  int i;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int v39;
  id v40;
  id *v41;
  id v42;
  id location[3];
  id v44;
  _QWORD v45[5];
  _QWORD v46[6];

  v46[5] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  v41 = a5;
  v40 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v40, "isUsable") & 1) != 0)
  {
    v38 = (id)objc_msgSend(v40, "getDataSchema");
    v37 = (id)objc_msgSend(v38, "getTableForStream:", location[0]);
    if (v37)
    {
      v45[0] = 0x1EA4BF668;
      v46[0] = CFSTR("fetchEventsFromTable");
      v45[1] = 0x1EA4BF808;
      v46[1] = v37;
      v45[2] = 0x1EA4BF648;
      v14 = +[AMDSQLiteSchema fetchColumnSpecsForTable:](AMDSQLiteSchema, "fetchColumnSpecsForTable:", v37);
      v46[2] = v14;
      v45[3] = 0x1EA4BF788;
      v46[3] = v42;
      v45[4] = 0x1EA4BF7E8;
      v46[4] = CFSTR("time ASC");
      v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);

      v15 = [AMDFetchDescriptor alloc];
      v16 = (id)objc_msgSend(v40, "getDataSchema");
      v34 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v15, "initWithDict:usingSchema:error:", v35);

      if (*v41)
      {
        v44 = 0;
        v39 = 1;
      }
      else
      {
        v33 = (id)objc_msgSend(v40, "fetchRows:andPersist:error:", v34, 0, v41);
        v32 = (id)objc_msgSend(v33, "objectForKey:", 0x1EA4B7968);
        v31 = (id)objc_msgSend(v32, "objectForKey:", 0x1EA4B9508);
        v30 = (id)objc_msgSend(v32, "objectForKey:", 0x1EA4B94E8);
        v29 = objc_msgSend(v31, "count");
        if (v29)
        {
          v12 = (id)objc_msgSend(v31, "firstObject");
          v13 = objc_msgSend(v12, "count");

          v27 = v13;
          v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
          for (i = 0; i < v27; ++i)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v26, "addObject:");

          }
          for (j = 0; j < v29; ++j)
          {
            v23 = (id)objc_msgSend(v31, "objectAtIndex:", j);
            v22 = (id)objc_msgSend(v30, "objectAtIndex:", j);
            for (k = 0; k < v27; ++k)
            {
              v20 = (id)objc_msgSend(v26, "objectAtIndex:", k);
              v19 = (id)objc_msgSend(v23, "objectAtIndex:", k);
              v9 = v20;
              v8 = v19;
              v10 = (id)objc_msgSend(v22, "objectForKey:", 0x1EA4B7308);
              objc_msgSend(v9, "setObject:forKey:", v8);

              objc_storeStrong(&v19, 0);
              objc_storeStrong(&v20, 0);
            }
            objc_storeStrong(&v22, 0);
            objc_storeStrong(&v23, 0);
          }
          v44 = v26;
          v39 = 1;
          objc_storeStrong(&v26, 0);
        }
        else
        {
          v28 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No column info returned by descriptor"));
          v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v28);
          *v41 = v6;
          v44 = 0;
          v39 = 1;
          objc_storeStrong(&v28, 0);
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v36 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No table found for stream: %@"), location[0]);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v36);
      *v41 = v5;
      v44 = 0;
      v39 = 1;
      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    *v41 = (id)objc_msgSend(v40, "generateDBLoadError");
    v44 = 0;
    v39 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  return v44;
}

- (id)fetch:(id)a3 SortedEventListFromTimestamp:(id)a4 onlyForCurrentDevice:(BOOL)a5 forStream:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v12;
  id v13;
  NSObject *log;
  os_log_type_t v15;
  id v16;
  id v17;
  NSString *v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSString *v28;
  id v29;
  void *v30;
  id v31;
  NSString *v32;
  int v37;
  unint64_t v38;
  id v39;
  id v40;
  os_log_type_t type;
  os_log_t oslog;
  id v43;
  _QWORD __b[8];
  id v45;
  id v46;
  int v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id *v55;
  id v56;
  BOOL v57;
  id v58;
  id location[2];
  AMDDataSync *v60;
  id v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint8_t v66[24];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = 0;
  objc_storeStrong(&v58, a4);
  v57 = a5;
  v56 = 0;
  objc_storeStrong(&v56, a6);
  v55 = a7;
  v54 = 0;
  if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AppUsageDataCoreData")) & 1) != 0)
  {
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v57)
    {
      v30 = (void *)MEMORY[0x1E0CB3880];
      v32 = -[AMDDataSync localDeviceId](v60, "localDeviceId");
      v31 = (id)objc_msgSend(v30, "predicateWithFormat:", CFSTR("deviceId == %@ || deviceId == %@"), v32, CFSTR("undefined"));
      objc_msgSend(v53, "addObject:");

    }
    if (v58)
    {
      v29 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("time > %llu"), objc_msgSend(v58, "longLongValue"));
      objc_msgSend(v53, "addObject:");

    }
    v52 = +[AMDAppEvent fetchEventsWithPredicate:error:](AMDAppEvent, "fetchEventsWithPredicate:error:", v53, v55);
    v7 = +[AMDMiscHelpers sortArrayElements:inDescendingOrder:withComparisonKey:isKeyString:](AMDMiscHelpers, "sortArrayElements:inDescendingOrder:withComparisonKey:isKeyString:", v52, 0, 0x1EA4BCB88, 0);
    v8 = v54;
    v54 = v7;

    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v53, 0);
LABEL_15:
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    v25 = v54;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v67, 16);
    if (v26)
    {
      v22 = *(_QWORD *)__b[2];
      v23 = 0;
      v24 = v26;
      while (1)
      {
        v21 = v23;
        if (*(_QWORD *)__b[2] != v22)
          objc_enumerationMutation(v25);
        v45 = *(id *)(__b[1] + 8 * v23);
        v19 = (id)objc_msgSend(v45, "objectForKey:", 0x1EA4BCEE8);
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("undefined"));

        if ((v20 & 1) != 0)
        {
          v43 = (id)objc_msgSend(v45, "mutableCopy");
          v17 = v43;
          v18 = -[AMDDataSync localDeviceId](v60, "localDeviceId");
          objc_msgSend(v17, "setObject:forKey:");

          objc_msgSend(v46, "addObject:", v43);
          objc_storeStrong(&v43, 0);
        }
        else
        {
          objc_msgSend(v46, "addObject:", v45);
        }
        ++v23;
        if (v21 + 1 >= v24)
        {
          v23 = 0;
          v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v67, 16);
          if (!v24)
            break;
        }
      }
    }

    if (*v55)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v15 = type;
        v16 = (id)objc_msgSend(*v55, "localizedDescription");
        v40 = v16;
        __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v40);
        _os_log_error_impl(&dword_1DC678000, log, v15, "Event fetch failed during data sync with error: %@", v66, 0xCu);

        objc_storeStrong(&v40, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v61 = 0;
      v47 = 1;
    }
    else
    {
      v13 = v54;
      v38 = objc_msgSend(v54, "count");
      v37 = objc_msgSend(location[0], "intValue");
      if (v38 >= v37)
        v12 = v37;
      else
        v12 = v38;
      v63 = 0;
      v62 = v12;
      v64 = 0;
      v65 = v12;
      v39 = (id)objc_msgSend(v13, "subarrayWithRange:", 0, v12);
      v61 = v39;
      v47 = 1;
      objc_storeStrong(&v39, 0);
    }
    objc_storeStrong(&v46, 0);
    goto LABEL_33;
  }
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v57)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = -[AMDDataSync localDeviceId](v60, "localDeviceId");
    v50 = (id)objc_msgSend(v27, "stringWithFormat:", CFSTR("deviceId = '%@' OR deviceId = '%@'"), v28, CFSTR("undefined"));

    objc_msgSend(v51, "addObject:", v50);
    objc_storeStrong(&v50, 0);
  }
  if (v58)
  {
    v49 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("time > %llu"), objc_msgSend(v58, "longLongValue"));
    objc_msgSend(v51, "addObject:", v49);
    objc_storeStrong(&v49, 0);
  }
  v48 = (id)objc_msgSend(v51, "componentsJoinedByString:", CFSTR(" AND "));
  v9 = -[AMDDataSync fetchEventsForStream:withPredicates:error:](v60, "fetchEventsForStream:withPredicates:error:", v56, v48, v55);
  v10 = v54;
  v54 = v9;

  if (*v55)
  {
    v61 = 0;
    v47 = 1;
  }
  else
  {
    v47 = 0;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v51, 0);
  if (!v47)
    goto LABEL_15;
LABEL_33:
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v61;
}

- (id)createDeviceEntryWithDevicesData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *log;
  os_log_type_t v22;
  id v23;
  AMDDataSync *v24;
  id v25;
  NSNumber *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSArray *obj;
  uint64_t v33;
  id v34;
  _QWORD v35[8];
  uint64_t v36;
  id v37[2];
  int v38;
  id v39;
  os_log_type_t type;
  os_log_t oslog;
  id v42;
  id v43;
  id v44;
  _QWORD __b[8];
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id *v50;
  id location[2];
  AMDDataSync *v52;
  _BYTE v53[128];
  uint8_t v54[24];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = a4;
  v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  obj = -[AMDDataSync streamsToSync](v52, "streamsToSync");
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
  if (v33)
  {
    v28 = *(_QWORD *)__b[2];
    v29 = 0;
    v30 = v33;
    while (1)
    {
      v27 = v29;
      if (*(_QWORD *)__b[2] != v28)
        objc_enumerationMutation(obj);
      v46 = *(_QWORD *)(__b[1] + 8 * v29);
      v44 = 0;
      v24 = v52;
      v26 = -[AMDDataSync eventsDeltaSize](v52, "eventsDeltaSize");
      v42 = v44;
      v25 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v24, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
      objc_storeStrong(&v44, v42);
      v43 = v25;

      if (v44)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v22 = type;
          v20 = v46;
          v23 = (id)objc_msgSend(v44, "localizedDescription");
          v39 = v23;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v54, v20, (uint64_t)v39);
          _os_log_error_impl(&dword_1DC678000, log, v22, "Data fetch failed for stream: %@ error: %@", v54, 0x16u);

          objc_storeStrong(&v39, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        v18 = v48;
        v19 = (id)objc_msgSend(v44, "localizedDescription");
        objc_msgSend(v18, "setObject:forKey:");

        v38 = 3;
      }
      else
      {
        objc_msgSend(v47, "setObject:forKey:", v43, v46);
        v16 = v48;
        v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
        objc_msgSend(v16, "setObject:forKey:");

        v38 = 0;
      }
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v44, 0);
      ++v29;
      if (v27 + 1 >= v30)
      {
        v29 = 0;
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
        if (!v30)
          break;
      }
    }
  }

  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v48, CFSTR("NewDevicePayloadDataFetchSummary"));
  objc_msgSend(v49, "setObject:forKey:", v47, CFSTR("eventsDict"));
  v10 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v11 = 1000 * objc_msgSend(v10, "longLongValue");

  v37[1] = (id)v11;
  v12 = v49;
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  objc_msgSend(v12, "setObject:forKey:");

  v37[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(v35, 0, sizeof(v35));
  v14 = -[AMDDataSync streamsToSync](v52, "streamsToSync");
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", v35, v53, 16);
  if (v15)
  {
    v7 = *(_QWORD *)v35[2];
    v8 = 0;
    v9 = v15;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)v35[2] != v7)
        objc_enumerationMutation(v14);
      v36 = *(_QWORD *)(v35[1] + 8 * v8);
      objc_msgSend(v37[0], "setObject:forKey:", MEMORY[0x1E0C9AA70], v36);
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", v35, v53, 16);
        if (!v9)
          break;
      }
    }
  }

  objc_msgSend(v49, "setObject:forKey:", v37[0], CFSTR("checkpoints"));
  objc_msgSend(v49, "setObject:forKey:", MEMORY[0x1E0C9AA70], CFSTR("bookmarks"));
  v34 = -[AMDDataSync generateFullSyncPayloadWithDevicesData:error:](v52, "generateFullSyncPayloadWithDevicesData:error:", location[0], v50);
  if (v34)
    objc_msgSend(v49, "setObject:forKey:", v34, CFSTR("fullSyncRequest"));
  v5 = v49;
  v38 = 1;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v37, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)ingestDataFromDevice:(id)a3 withDevicePayload:(id)a4 forStream:(id)a5 fromTimestamp:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  id v31;
  int v32;
  os_log_type_t type;
  os_log_t oslog;
  __CFString *v35;
  id v36;
  id v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  id location[2];
  AMDDataSync *v43;
  id v44;
  _BYTE v45[128];
  uint8_t v46[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = 0;
  objc_storeStrong(&v40, a5);
  v39 = 0;
  objc_storeStrong(&v39, a6);
  v38 = a7;
  v37 = (id)objc_msgSend(v41, "objectForKey:", CFSTR("eventsDict"));
  v36 = (id)objc_msgSend(v37, "objectForKey:", v40);
  if (v36)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    v17 = v36;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
    if (v18)
    {
      v14 = *(_QWORD *)__b[2];
      v15 = 0;
      v16 = v18;
      while (1)
      {
        v13 = v15;
        if (*(_QWORD *)__b[2] != v14)
          objc_enumerationMutation(v17);
        v29 = *(id *)(__b[1] + 8 * v15);
        v27 = (id)objc_msgSend(v29, "mutableCopy");
        objc_msgSend(v27, "setObject:forKey:", location[0], 0x1EA4BCEE8);
        objc_msgSend(v30, "addObject:", v27);
        objc_storeStrong(&v27, 0);
        ++v15;
        if (v13 + 1 >= v16)
        {
          v15 = 0;
          v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
          if (!v16)
            break;
        }
      }
    }

    v26 = 0;
    v25 = v39;
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("AppUsageDataCoreData")) & 1) != 0)
    {
      v24 = v25;
      v12 = -[AMDDataSync ingestEventsIntoCoreData:withPreviousCheckpoint:andStreamCheckpointDict:error:](v43, "ingestEventsIntoCoreData:withPreviousCheckpoint:andStreamCheckpointDict:error:", v30, &v24, 0, v38);
      objc_storeStrong(&v25, v24);
      v8 = v26;
      v26 = v12;

    }
    else
    {
      v23 = v25;
      v11 = -[AMDDataSync ingestEventsIntoSQLite:forStream:withPreviousCheckpoint:andStreamCheckpointDict:error:](v43, "ingestEventsIntoSQLite:forStream:withPreviousCheckpoint:andStreamCheckpointDict:error:", v30, v40, &v23, 0, v38);
      objc_storeStrong(&v25, v23);
      v9 = v26;
      v26 = v11;

    }
    if (*v38)
    {
      v44 = 0;
      v32 = 1;
    }
    else
    {
      objc_msgSend(v31, "setObject:forKey:", v26, CFSTR("eventsSaved"));
      if (v25)
        objc_msgSend(v31, "setObject:forKey:", v25, CFSTR("lastSavedEventTimestamp"));
      v44 = v31;
      v32 = 1;
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v35 = CFSTR("Missing events list");
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v46, (uint64_t)v35);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "%@", v46, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v35);
    *v38 = v7;
    v44 = 0;
    v32 = 1;
    objc_storeStrong((id *)&v35, 0);
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v44;
}

- (id)clearUserDataForDevice:(id)a3 fromTimestamp:(id)a4
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSArray *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  id v31;
  id location[2];
  AMDDataSync *v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  v20 = -[AMDDataSync streamsToSync](v33, "streamsToSync");
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
  if (v21)
  {
    v16 = *(_QWORD *)__b[2];
    v17 = 0;
    v18 = v21;
    while (1)
    {
      v15 = v17;
      if (*(_QWORD *)__b[2] != v16)
        objc_enumerationMutation(v20);
      v29 = *(id *)(__b[1] + 8 * v17);
      v27 = 0;
      if ((objc_msgSend(v29, "isEqualToString:", CFSTR("AppUsageDataCoreData")) & 1) != 0)
      {
        v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
        v10 = v26;
        v11 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("time < %llu"), objc_msgSend(v31, "longLongValue"));
        objc_msgSend(v10, "addObject:");

        v12 = v26;
        v13 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceId == %@"), location[0]);
        objc_msgSend(v12, "addObject:");

        v24 = v27;
        v14 = +[AMDAppEvent deleteUsingPredicates:error:](AMDAppEvent, "deleteUsingPredicates:error:", v26, &v24);
        objc_storeStrong(&v27, v24);
        v25 = v14;
        if (v27)
        {
          v8 = v30;
          v9 = (id)objc_msgSend(v27, "localizedDescription");
          objc_msgSend(v8, "setObject:forKey:");

        }
        else
        {
          objc_msgSend(v30, "setObject:forKey:", v25, v29);
        }
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v26, 0);
      }
      else
      {
        v23 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceId = '%@' AND time < %llu"), location[0], objc_msgSend(v31, "longLongValue"));
        v6 = v23;
        v34 = v29;
        v7 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v22 = +[AMDSQLite deleteEventsWithPredicate:forStreams:](AMDSQLite, "deleteEventsWithPredicate:forStreams:", v6);

        objc_msgSend(v30, "setObject:forKey:", v22, v29);
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
      }
      objc_storeStrong(&v27, 0);
      ++v17;
      if (v15 + 1 >= v18)
      {
        v17 = 0;
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
        if (!v18)
          break;
      }
    }
  }

  v5 = v30;
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)updateDataDeletionDict:(id)a3 withDevicesData:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v21;
  id v22;
  os_log_type_t type;
  os_log_t oslog;
  id v25;
  id v26;
  id v27;
  id v28;
  int v29;
  id v30;
  id v31;
  _QWORD __b[8];
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id *v38;
  id v39;
  id location[2];
  AMDDataSync *v41;
  id v42;
  uint8_t v43[24];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = 0;
  objc_storeStrong(&v39, a4);
  v38 = a5;
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = (id)objc_msgSend(location[0], "mutableCopy");
  v35 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("otherDevicesStatus"));
  v34 = 0;
  if (v35)
    v5 = (id)objc_msgSend(v35, "mutableCopy");
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v34;
  v34 = v5;

  memset(__b, 0, sizeof(__b));
  v17 = v39;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
  if (v18)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v18;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(v17);
      v33 = *(_QWORD *)(__b[1] + 8 * v15);
      v31 = (id)objc_msgSend(v39, "objectForKey:", v33);
      v30 = (id)objc_msgSend(v31, "objectForKey:", CFSTR("clearData"));
      if (v30)
      {
        v28 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("RequestTimeMilliSeconds"));
        if (v28)
        {
          v27 = (id)objc_msgSend(v34, "objectForKey:", v33);
          if (v27 && (v12 = objc_msgSend(v27, "longLongValue"), v12 >= objc_msgSend(v28, "longLongValue")))
          {
            v11 = objc_msgSend(v27, "longLongValue");
            if (v11 > objc_msgSend(v28, "longLongValue"))
              +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("LogicalError"), CFSTR("DataSyncDeletionError"), 0);
            v29 = 3;
          }
          else
          {
            v26 = -[AMDDataSync clearUserDataForDevice:fromTimestamp:](v41, "clearUserDataForDevice:fromTimestamp:", v33, v28);
            objc_msgSend(v37, "setObject:forKey:", v26, v33);
            objc_msgSend(v34, "setObject:forKey:", v28, v33);
            objc_storeStrong(&v26, 0);
            v29 = 0;
          }
          objc_storeStrong(&v27, 0);
        }
        else
        {
          v29 = 3;
        }
        objc_storeStrong(&v28, 0);
      }
      else
      {
        v29 = 3;
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
        if (!v16)
          break;
      }
    }
  }

  objc_msgSend(v36, "setObject:forKey:", v34, CFSTR("otherDevicesStatus"));
  v25 = +[AMDKVStore fetchValueForKey:error:](AMDKVStore, "fetchValueForKey:error:", 0x1EA4BB3A8, v38);
  if (*v38)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v9 = type;
      v10 = (id)objc_msgSend(*v38, "localizedDescription");
      v22 = v10;
      __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v22);
      _os_log_error_impl(&dword_1DC678000, log, v9, "Clear user data timestamp fetch failed: %@", v43, 0xCu);

      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v42 = 0;
    v29 = 1;
  }
  else
  {
    if (v25)
    {
      v21 = (id)objc_msgSend(v25, "objectForKey:", CFSTR("time"));
      objc_msgSend(v36, "setObject:forKey:", v21, CFSTR("RequestTimeMilliSeconds"));
      objc_storeStrong(&v21, 0);
    }
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v37, CFSTR("DataSyncDeletionSummary"), 0);
    v42 = v36;
    v29 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v42;
}

- (void)performEventDeltaUpdateFor:(id)a3 withDeviceData:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSNumber *v13;
  uint64_t v14;
  AMDDataSync *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AMDDataSync *v20;
  id v21;
  NSNumber *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v29;
  id v30;
  id v31;
  NSArray *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  int v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD __b[8];
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52[2];
  id v53;
  id location[2];
  AMDDataSync *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = 0;
  objc_storeStrong(&v53, a4);
  v52[1] = a5;
  v52[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("eventsDict"));
  v51 = (id)objc_msgSend(v29, "mutableCopy");

  v30 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("checkpoints"));
  v50 = (id)objc_msgSend(v30, "mutableCopy");

  v31 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("bookmarks"));
  v49 = (id)objc_msgSend(v31, "mutableCopy");

  memset(__b, 0, sizeof(__b));
  v32 = -[AMDDataSync streamsToSync](v55, "streamsToSync");
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
  if (v33)
  {
    v24 = *(_QWORD *)__b[2];
    v25 = 0;
    v26 = v33;
    while (1)
    {
      v23 = v25;
      if (*(_QWORD *)__b[2] != v24)
        objc_enumerationMutation(v32);
      v48 = *(_QWORD *)(__b[1] + 8 * v25);
      v46 = 0;
      v45 = (id)objc_msgSend(v51, "objectForKey:", v48);
      v44 = 0;
      if (v45)
      {
        v41 = -[AMDDataSync fetchLastReadTimestampFromPayload:forStream:](v55, "fetchLastReadTimestampFromPayload:forStream:", v53, v48);
        v40 = -[AMDDataSync filterEventsList:withLastReadTimestamp:](v55, "filterEventsList:withLastReadTimestamp:", v45, v41);
        v39 = 0;
        v13 = -[AMDDataSync eventsDeltaSize](v55, "eventsDeltaSize");
        v12 = -[NSNumber longValue](v13, "longValue");
        v14 = v12 - objc_msgSend(v40, "count");

        v39 = v14;
        v38 = (id)objc_msgSend(v49, "objectForKey:", v48);
        v15 = v55;
        v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v39);
        v36 = v46;
        v16 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v15, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
        objc_storeStrong(&v46, v36);
        v37 = v16;

        if (v46)
        {
          v10 = v52[0];
          v11 = (id)objc_msgSend(v46, "localizedDescription");
          objc_msgSend(v10, "setObject:forKey:");

          v42 = 3;
        }
        else
        {
          v6 = (id)objc_msgSend(v40, "arrayByAddingObjectsFromArray:", v37);
          v7 = v44;
          v44 = v6;

          v42 = 0;
        }
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v40, 0);
        objc_storeStrong(&v41, 0);
        if (!v42)
          goto LABEL_13;
      }
      else
      {
        v20 = v55;
        v22 = -[AMDDataSync eventsDeltaSize](v55, "eventsDeltaSize");
        v43 = v46;
        v21 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v20, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
        objc_storeStrong(&v46, v43);
        v5 = v44;
        v44 = v21;

        if (!v46)
        {
          objc_msgSend(v50, "setObject:forKey:", MEMORY[0x1E0C9AA70], v48);
LABEL_13:
          objc_msgSend(v51, "setObject:forKey:", v44, v48);
          if (objc_msgSend(v44, "count"))
          {
            v35 = (id)objc_msgSend(v44, "lastObject");
            v34 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("time"));
            objc_msgSend(v49, "setObject:forKey:", v34, v48);
            objc_storeStrong(&v34, 0);
            objc_storeStrong(&v35, 0);
          }
          v8 = v52[0];
          v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
          objc_msgSend(v8, "setObject:forKey:");

          v42 = 0;
          goto LABEL_16;
        }
        v18 = v52[0];
        v19 = (id)objc_msgSend(v46, "localizedDescription");
        objc_msgSend(v18, "setObject:forKey:");

        v42 = 3;
      }
LABEL_16:
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
      objc_storeStrong(&v46, 0);
      ++v25;
      if (v23 + 1 >= v26)
      {
        v25 = 0;
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
        if (!v26)
          break;
      }
    }
  }

  objc_msgSend(location[0], "setObject:forKey:", v51, CFSTR("eventsDict"));
  objc_msgSend(location[0], "setObject:forKey:", v50, CFSTR("checkpoints"));
  objc_msgSend(location[0], "setObject:forKey:", v49, CFSTR("bookmarks"));
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v52[0], CFSTR("EventDeltaPushStatus"), 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFullSyncDataFrom:(id)a3 withDeviceData:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  AMDDataSync *v12;
  id v13;
  NSNumber *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSArray *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  id v27;
  NSString *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[8];
  uint64_t v44;
  id v45;
  os_log_type_t v46;
  os_log_t v47;
  id v48;
  id v49;
  id v50;
  os_log_type_t v51;
  os_log_t v52;
  uint8_t v53[15];
  os_log_type_t v54;
  os_log_t v55;
  char v56;
  id v57;
  char v58;
  id v59;
  id v60;
  os_log_type_t type;
  os_log_t oslog;
  id v63;
  id v64;
  int v65;
  id v66;
  id v67;
  _QWORD __b[8];
  id v69;
  id v70;
  id v71;
  id v72;
  id *v73;
  id v74;
  id location[2];
  AMDDataSync *v76;
  _BYTE v77[128];
  uint8_t v78[16];
  uint8_t v79[16];
  uint8_t v80[24];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v76 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v74 = 0;
  objc_storeStrong(&v74, a4);
  v73 = a5;
  v72 = 0;
  v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("fullSyncResponse"));
  if (v70)
  {
    v5 = (id)objc_msgSend(v70, "objectForKey:", CFSTR("targetUUID"));
    v6 = v72;
    v72 = v5;

  }
  else
  {
    memset(__b, 0, sizeof(__b));
    v34 = v74;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", __b, v81, 16);
    if (v35)
    {
      v31 = *(_QWORD *)__b[2];
      v32 = 0;
      v33 = v35;
      while (1)
      {
        v30 = v32;
        if (*(_QWORD *)__b[2] != v31)
          objc_enumerationMutation(v34);
        v69 = *(id *)(__b[1] + 8 * v32);
        v67 = (id)objc_msgSend(v74, "objectForKey:", v69);
        v66 = (id)objc_msgSend(v67, "objectForKey:", CFSTR("fullSyncRequest"));
        if (v66)
        {
          v64 = (id)objc_msgSend(v66, "objectForKey:", CFSTR("sourceUUID"));
          v27 = v64;
          v28 = -[AMDDataSync localDeviceId](v76, "localDeviceId");
          v29 = objc_msgSend(v27, "isEqualToString:");

          if ((v29 & 1) != 0)
          {
            objc_storeStrong(&v72, v69);
            v65 = 2;
          }
          else
          {
            v65 = 0;
          }
          objc_storeStrong(&v64, 0);
        }
        else
        {
          v65 = 3;
        }
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
        if (v65)
        {
          if (v65 != 3)
            break;
        }
        ++v32;
        if (v30 + 1 >= v33)
        {
          v32 = 0;
          v33 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", __b, v81, 16);
          if (!v33)
            goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:
      v65 = 0;
    }

  }
  if (v72)
  {
    v63 = (id)objc_msgSend(v74, "objectForKey:", v72);
    if (v63)
    {
      v60 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("fullSyncRequest"));
      v58 = 0;
      v56 = 0;
      LOBYTE(v26) = 1;
      if (v60)
      {
        v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("sourceUUID"));
        v58 = 1;
        v57 = -[AMDDataSync localDeviceId](v76, "localDeviceId");
        v56 = 1;
        v26 = objc_msgSend(v59, "isEqualToString:") ^ 1;
      }
      if ((v56 & 1) != 0)

      if ((v58 & 1) != 0)
      if ((v26 & 1) != 0)
      {
        if (v60)
        {
          v52 = (os_log_t)MEMORY[0x1E0C81028];
          v51 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v21 = v52;
            v22 = v51;
            v23 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("sourceUUID"));
            v50 = v23;
            __os_log_helper_16_2_1_8_64((uint64_t)v79, (uint64_t)v50);
            _os_log_impl(&dword_1DC678000, v21, v22, "Full Sync target device changed source: %@", v79, 0xCu);

            objc_storeStrong(&v50, 0);
          }
          objc_storeStrong((id *)&v52, 0);
          objc_msgSend(v71, "setObject:forKey:", CFSTR("FullSyncTargetDeviceChangedSource"), CFSTR("Status"));
        }
        else
        {
          v55 = (os_log_t)MEMORY[0x1E0C81028];
          v54 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v24 = v55;
            v25 = v54;
            __os_log_helper_16_0_0(v53);
            _os_log_impl(&dword_1DC678000, v24, v25, "Full Sync request completed", v53, 2u);
          }
          objc_storeStrong((id *)&v55, 0);
          objc_msgSend(v71, "setObject:forKey:", CFSTR("TargetDeviceFullSyncRequestCompleted"), CFSTR("Status"));
        }
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v71, CFSTR("FullSyncDataPushStatus"), 2);
        objc_msgSend(location[0], "removeObjectForKey:", CFSTR("fullSyncResponse"));
        v65 = 1;
      }
      else
      {
        v49 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("fsCheckpoint"));
        if (v49)
        {
          v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          memset(v43, 0, sizeof(v43));
          v19 = -[AMDDataSync streamsToSync](v76, "streamsToSync");
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", v43, v77, 16);
          if (v20)
          {
            v16 = *(_QWORD *)v43[2];
            v17 = 0;
            v18 = v20;
            while (1)
            {
              v15 = v17;
              if (*(_QWORD *)v43[2] != v16)
                objc_enumerationMutation(v19);
              v44 = *(_QWORD *)(v43[1] + 8 * v17);
              v42 = 0;
              v41 = (id)objc_msgSend(v49, "objectForKey:", v44);
              v12 = v76;
              v14 = -[AMDDataSync fullSyncEventsDeltaSize](v76, "fullSyncEventsDeltaSize");
              v39 = v42;
              v13 = -[AMDDataSync fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:](v12, "fetch:SortedEventListFromTimestamp:onlyForCurrentDevice:forStream:error:");
              objc_storeStrong(&v42, v39);
              v40 = v13;

              if (v42)
              {
                v10 = v71;
                v11 = (id)objc_msgSend(v42, "localizedDescription");
                objc_msgSend(v10, "setObject:forKey:");

                v65 = 5;
              }
              else
              {
                objc_msgSend(v45, "setObject:forKey:", v40, v44);
                v8 = v71;
                v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v40, "count"));
                objc_msgSend(v8, "setObject:forKey:");

                v65 = 0;
              }
              objc_storeStrong(&v40, 0);
              objc_storeStrong(&v41, 0);
              objc_storeStrong(&v42, 0);
              ++v17;
              if (v15 + 1 >= v18)
              {
                v17 = 0;
                v18 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", v43, v77, 16);
                if (!v18)
                  break;
              }
            }
          }

          v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v38, "setObject:forKey:", v72, CFSTR("targetUUID"));
          objc_msgSend(v38, "setObject:forKey:", v45, CFSTR("events"));
          objc_msgSend(location[0], "setObject:forKey:", v38, CFSTR("fullSyncResponse"));
          objc_msgSend(v71, "setObject:forKey:", CFSTR("Ongoing"), CFSTR("Status"));
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v71, CFSTR("FullSyncDataPushStatus"), 2);
          objc_storeStrong(&v38, 0);
          objc_storeStrong(&v45, 0);
          v65 = 0;
        }
        else
        {
          v48 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Full Sync Request payload missing checkpoint dict for device %@"), v72);
          v47 = (os_log_t)MEMORY[0x1E0C81028];
          v46 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v48);
            _os_log_error_impl(&dword_1DC678000, v47, v46, "%@", v78, 0xCu);
          }
          objc_storeStrong((id *)&v47, 0);
          v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v48);
          *v73 = v7;
          v65 = 1;
          objc_storeStrong(&v48, 0);
        }
        objc_storeStrong(&v49, 0);
      }
      objc_storeStrong(&v60, 0);
    }
    else
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v72);
        _os_log_impl(&dword_1DC678000, oslog, type, "Target device payload absent for devId: %@", v80, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_msgSend(v71, "setObject:forKey:", CFSTR("TargetDevicePayloadNil"), CFSTR("Status"));
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v71, CFSTR("FullSyncDataPushStatus"), 2);
      objc_msgSend(location[0], "removeObjectForKey:", CFSTR("fullSyncResponse"));
      v65 = 1;
    }
    objc_storeStrong(&v63, 0);
  }
  else
  {
    v65 = 1;
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(location, 0);
}

- (id)ingestEventsIntoCoreData:(id)a3 withPreviousCheckpoint:(id *)a4 andStreamCheckpointDict:(id)a5 error:(id *)a6
{
  id v6;
  uint64_t v8;
  NSObject *log;
  os_log_type_t v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  id v23;
  id v24;
  os_log_type_t type;
  os_log_t oslog;
  id v27;
  unsigned int v28;
  id v29;
  id v30;
  _QWORD __b[8];
  id v32;
  int v33;
  id v34;
  unsigned int v35;
  id *v36;
  id v37;
  id *v38;
  id location[3];
  id v40;
  uint8_t v41[24];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = a4;
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = a6;
  v35 = 0;
  v34 = 0;
  if (objc_msgSend(location[0], "count"))
  {
    memset(__b, 0, sizeof(__b));
    v18 = location[0];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v19)
    {
      v15 = *(_QWORD *)__b[2];
      v16 = 0;
      v17 = v19;
      while (1)
      {
        v14 = v16;
        if (*(_QWORD *)__b[2] != v15)
          objc_enumerationMutation(v18);
        v32 = *(id *)(__b[1] + 8 * v16);
        v30 = (id)objc_msgSend(v32, "objectForKey:", CFSTR("time"));
        if (*v38 && (v13 = objc_msgSend(v30, "longLongValue"), v13 <= objc_msgSend(*v38, "longLongValue")))
        {
          v33 = 3;
        }
        else
        {
          v29 = 0;
          v28 = 0;
          v27 = 0;
          v12 = +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:", v32, &v27);
          objc_storeStrong(&v29, v27);
          v28 = v12;
          if (!v29 && v28)
          {
            ++v35;
            objc_storeStrong(&v34, v30);
            if (v37)
            {
              v23 = (id)objc_msgSend(v32, "objectForKey:", CFSTR("deviceId"));
              objc_msgSend(v37, "setObject:forKey:", v30, v23);
              objc_storeStrong(&v23, 0);
            }
            v33 = 0;
          }
          else
          {
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              v10 = type;
              v8 = (uint64_t)v32;
              v11 = (id)objc_msgSend(v29, "localizedDescription");
              v24 = v11;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v41, v8, (uint64_t)v24);
              _os_log_error_impl(&dword_1DC678000, log, v10, "Event save operation failed for dictionary: %@ with error: %@", v41, 0x16u);

              objc_storeStrong(&v24, 0);
            }
            objc_storeStrong((id *)&oslog, 0);
            v33 = 3;
          }
          objc_storeStrong(&v29, 0);
        }
        objc_storeStrong(&v30, 0);
        ++v16;
        if (v14 + 1 >= v17)
        {
          v16 = 0;
          v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
          if (!v17)
            break;
        }
      }
    }

    v6 = objc_retainAutorelease(v34);
    *v38 = v6;
    v40 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
    v33 = 1;
  }
  else
  {
    v40 = &unk_1EA4CEE60;
    v33 = 1;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (id)ingestEventsIntoSQLite:(id)a3 forStream:(id)a4 withPreviousCheckpoint:(id *)a5 andStreamCheckpointDict:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *log;
  os_log_type_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[8];
  id v34;
  id v35;
  os_log_type_t type;
  os_log_t oslog;
  id v38;
  int v39;
  id v40;
  _QWORD __b[8];
  id v42;
  id v43;
  unsigned int v44;
  id *v45;
  id v46;
  id *v47;
  id v48;
  id location[3];
  id v50;
  _BYTE v51[128];
  uint8_t v52[24];
  _QWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = 0;
  objc_storeStrong(&v48, a4);
  v47 = a5;
  v46 = 0;
  objc_storeStrong(&v46, a6);
  v45 = a7;
  v44 = 0;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  v29 = location[0];
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
  if (v30)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v30;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(v29);
      v42 = *(id *)(__b[1] + 8 * v23);
      v40 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("time"));
      if (*v47 && (v20 = objc_msgSend(v40, "longLongValue"), v20 <= objc_msgSend(*v47, "longLongValue")))
      {
        v39 = 3;
      }
      else
      {
        objc_msgSend(v43, "addObject:", v42);
        v39 = 0;
      }
      objc_storeStrong(&v40, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
        if (!v24)
          break;
      }
    }
  }

  if (objc_msgSend(v43, "count"))
  {
    v53[0] = 0x1EA4B92E8;
    v54[0] = v48;
    v53[1] = 0x1EA4B92C8;
    v54[1] = v43;
    v38 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v7 = +[AMDSQLite saveEvents:error:](AMDSQLite, "saveEvents:error:", v38, v45);
    if (*v45)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v18 = type;
        v19 = (id)objc_msgSend(*v45, "localizedDescription");
        v35 = v19;
        __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v35);
        _os_log_error_impl(&dword_1DC678000, log, v18, "Event save operation failed with error: %@", v52, 0xCu);

        objc_storeStrong(&v35, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v50 = 0;
      v39 = 1;
    }
    else
    {
      v16 = (id)objc_msgSend(v43, "lastObject");
      v8 = (id)objc_msgSend(v16, "objectForKey:", CFSTR("time"));
      *v47 = v8;

      v44 = objc_msgSend(v43, "count");
      if (v46)
      {
        memset(v33, 0, sizeof(v33));
        v14 = v43;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v33, v51, 16);
        if (v15)
        {
          v11 = *(_QWORD *)v33[2];
          v12 = 0;
          v13 = v15;
          while (1)
          {
            v10 = v12;
            if (*(_QWORD *)v33[2] != v11)
              objc_enumerationMutation(v14);
            v34 = *(id *)(v33[1] + 8 * v12);
            v32 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("time"));
            v31 = (id)objc_msgSend(v34, "objectForKey:", CFSTR("deviceId"));
            objc_msgSend(v46, "setObject:forKey:", v32, v31);
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v32, 0);
            ++v12;
            if (v10 + 1 >= v13)
            {
              v12 = 0;
              v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v33, v51, 16);
              if (!v13)
                break;
            }
          }
        }

        v50 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
        v39 = 1;
      }
      else
      {
        v50 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
        v39 = 1;
      }
    }
    objc_storeStrong(&v38, 0);
  }
  else
  {
    v50 = &unk_1EA4CEE60;
    v39 = 1;
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v50;
}

- (void)ingestFullSyncEventsFor:(id)a3 withDeviceData:(id)a4 error:(id *)a5
{
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSArray *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  NSNumber *v40;
  id v41;
  uint64_t v42;
  id v45;
  os_log_type_t v46;
  os_log_t v47[2];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[8];
  uint64_t v55;
  id v56;
  _QWORD v57[8];
  uint64_t v58;
  char v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  char v66;
  id v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  id v75;
  id v76;
  _QWORD __b[8];
  id v78;
  id v79;
  id v80;
  os_log_type_t v81;
  os_log_t v82;
  __CFString *v83;
  id v84;
  id v85;
  id v86;
  os_log_type_t v87;
  os_log_t v88;
  id v89;
  id v90;
  os_log_type_t type;
  os_log_t oslog;
  unint64_t v93;
  id v94;
  id v95;
  id v96;
  int v97;
  id v98;
  id v99;
  id v100[2];
  id v101;
  id location[2];
  AMDDataSync *v103;
  uint8_t v104[16];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint8_t v108[16];
  uint8_t v109[16];
  uint8_t v110[24];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v103 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v101 = 0;
  objc_storeStrong(&v101, a4);
  v100[1] = a5;
  v100[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v99 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("fullSyncRequest"));
  v98 = (id)objc_msgSend(v99, "objectForKey:", CFSTR("sourceUUID"));
  if (v98)
  {
    if ((objc_msgSend(v98, "isEqualToString:", &stru_1EA4B7088) & 1) != 0)
    {
      v96 = -[AMDDataSync findAvailableDeviceForFullSyncIn:](v103, "findAvailableDeviceForFullSyncIn:", v101);
      v95 = (id)objc_msgSend(v99, "mutableCopy");
      objc_msgSend(v95, "setObject:forKey:", v96, CFSTR("sourceUUID"));
      objc_msgSend(location[0], "setObject:forKey:", v95, CFSTR("fullSyncRequest"));
      objc_msgSend(v100[0], "setObject:forKey:", CFSTR("SourceDeviceNotAssigned"), CFSTR("Status"));
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v100[0], CFSTR("FullSyncDataIngestionStatus"), 2);
      v97 = 1;
      objc_storeStrong(&v95, 0);
      objc_storeStrong(&v96, 0);
    }
    else
    {
      v94 = (id)objc_msgSend(v101, "objectForKey:", v98);
      v41 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
      v39 = objc_msgSend(v41, "longLongValue");
      v40 = -[AMDDataSync fullSyncDeviceResetThresholdDays](v103, "fullSyncDeviceResetThresholdDays");
      v42 = 1000 * (v39 - 86400 * -[NSNumber intValue](v40, "intValue"));

      v93 = v42;
      if (v94)
      {
        v89 = (id)objc_msgSend(v94, "objectForKey:", CFSTR("fullSyncResponse"));
        if (v89)
        {
          v84 = (id)objc_msgSend(v89, "objectForKey:", CFSTR("events"));
          if (v84)
          {
            v35 = (id)objc_msgSend(v99, "objectForKey:", CFSTR("fsCheckpoint"));
            v80 = (id)objc_msgSend(v35, "mutableCopy");

            v36 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("checkpoints"));
            v79 = (id)objc_msgSend(v36, "mutableCopy");

            memset(__b, 0, sizeof(__b));
            v37 = -[AMDDataSync streamsToSync](v103, "streamsToSync");
            v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", __b, v107, 16);
            if (v38)
            {
              v32 = *(_QWORD *)__b[2];
              v33 = 0;
              v34 = v38;
              while (1)
              {
                v31 = v33;
                if (*(_QWORD *)__b[2] != v32)
                  objc_enumerationMutation(v37);
                v78 = *(id *)(__b[1] + 8 * v33);
                v76 = (id)objc_msgSend(v84, "objectForKey:", v78);
                v30 = (id)objc_msgSend(v79, "objectForKey:", v78);
                v73 = 0;
                v71 = 0;
                v69 = 0;
                if (v30)
                {
                  v74 = (id)objc_msgSend(v79, "objectForKey:", v78);
                  v73 = 1;
                  v72 = (id)objc_msgSend(v74, "mutableCopy");
                  v71 = 1;
                  v6 = v72;
                }
                else
                {
                  v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v69 = 1;
                  v6 = v70;
                }
                v75 = v6;
                if ((v69 & 1) != 0)

                if ((v71 & 1) != 0)
                if ((v73 & 1) != 0)

                v29 = (id)objc_msgSend(v80, "objectForKey:", v78);
                v66 = 0;
                if (v29)
                {
                  v67 = (id)objc_msgSend(v80, "objectForKey:", v78);
                  v66 = 1;
                  v7 = v67;
                }
                else
                {
                  v7 = &unk_1EA4CEE60;
                }
                v68 = v7;
                if ((v66 & 1) != 0)

                if (v76)
                {
                  v65 = 0;
                  v64 = 0;
                  if ((objc_msgSend(v78, "isEqualToString:", CFSTR("AppUsageDataCoreData")) & 1) != 0)
                  {
                    v63 = v68;
                    v62 = v64;
                    v28 = -[AMDDataSync ingestEventsIntoCoreData:withPreviousCheckpoint:andStreamCheckpointDict:error:](v103, "ingestEventsIntoCoreData:withPreviousCheckpoint:andStreamCheckpointDict:error:", v76, &v63, v75, &v62);
                    objc_storeStrong(&v68, v63);
                    objc_storeStrong(&v64, v62);
                    v8 = v65;
                    v65 = v28;
                  }
                  else
                  {
                    v61 = v68;
                    v60 = v64;
                    v27 = -[AMDDataSync ingestEventsIntoSQLite:forStream:withPreviousCheckpoint:andStreamCheckpointDict:error:](v103, "ingestEventsIntoSQLite:forStream:withPreviousCheckpoint:andStreamCheckpointDict:error:", v76, v78, &v61, v75, &v60);
                    objc_storeStrong(&v68, v61);
                    objc_storeStrong(&v64, v60);
                    v8 = v65;
                    v65 = v27;
                  }

                  if (v64)
                  {
                    v97 = 3;
                  }
                  else
                  {
                    objc_msgSend(v79, "setObject:forKey:", v75, v78);
                    objc_msgSend(v80, "setObject:forKey:", v68, v78);
                    objc_msgSend(v100[0], "setObject:forKey:", v65, v78);
                    v97 = 0;
                  }
                  objc_storeStrong(&v64, 0);
                  objc_storeStrong(&v65, 0);
                }
                else
                {
                  objc_msgSend(v100[0], "setObject:forKey:", CFSTR("New stream added"), v78);
                  v97 = 3;
                }
                objc_storeStrong(&v68, 0);
                objc_storeStrong(&v75, 0);
                objc_storeStrong(&v76, 0);
                ++v33;
                if (v31 + 1 >= v34)
                {
                  v33 = 0;
                  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", __b, v107, 16);
                  if (!v34)
                    break;
                }
              }
            }

            v59 = 1;
            memset(v57, 0, sizeof(v57));
            v25 = -[AMDDataSync streamsToSync](v103, "streamsToSync");
            v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", v57, v106, 16);
            if (v26)
            {
              v22 = *(_QWORD *)v57[2];
              v23 = 0;
              v24 = v26;
              while (1)
              {
                v21 = v23;
                if (*(_QWORD *)v57[2] != v22)
                  objc_enumerationMutation(v25);
                v58 = *(_QWORD *)(v57[1] + 8 * v23);
                v56 = (id)objc_msgSend(v80, "objectForKey:", v58);
                memset(v54, 0, sizeof(v54));
                v19 = v101;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v54, v105, 16);
                if (v20)
                {
                  v16 = *(_QWORD *)v54[2];
                  v17 = 0;
                  v18 = v20;
                  while (1)
                  {
                    v15 = v17;
                    if (*(_QWORD *)v54[2] != v16)
                      objc_enumerationMutation(v19);
                    v55 = *(_QWORD *)(v54[1] + 8 * v17);
                    v53 = (id)objc_msgSend(v101, "objectForKey:", v55);
                    v52 = (id)objc_msgSend(v53, "objectForKey:", CFSTR("eventsDict"));
                    v51 = (id)objc_msgSend(v52, "objectForKey:", v58);
                    if (v51)
                    {
                      v50 = (id)objc_msgSend(v51, "firstObject");
                      if (v50)
                      {
                        v49 = (id)objc_msgSend(v50, "objectForKey:", 0x1EA4BB4A8);
                        v14 = objc_msgSend(v56, "longLongValue");
                        if (v14 >= objc_msgSend(v49, "longLongValue"))
                        {
                          v97 = 0;
                        }
                        else
                        {
                          v59 = 0;
                          v97 = 6;
                        }
                        objc_storeStrong(&v49, 0);
                      }
                      else
                      {
                        v97 = 7;
                      }
                      objc_storeStrong(&v50, 0);
                    }
                    else
                    {
                      v97 = 7;
                    }
                    objc_storeStrong(&v51, 0);
                    objc_storeStrong(&v52, 0);
                    objc_storeStrong(&v53, 0);
                    if (v97)
                    {
                      if (v97 != 7)
                        break;
                    }
                    ++v17;
                    if (v15 + 1 >= v18)
                    {
                      v17 = 0;
                      v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v54, v105, 16);
                      if (!v18)
                        goto LABEL_70;
                    }
                  }
                }
                else
                {
LABEL_70:
                  v97 = 0;
                }

                v97 = (v59 & 1) != 0 ? 0 : 4;
                objc_storeStrong(&v56, 0);
                if (v97)
                  break;
                ++v23;
                if (v21 + 1 >= v24)
                {
                  v23 = 0;
                  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", v57, v106, 16);
                  if (!v24)
                    goto LABEL_77;
                }
              }
            }
            else
            {
LABEL_77:
              v97 = 0;
            }

            if ((v59 & 1) != 0)
            {
              v47[0] = (os_log_t)MEMORY[0x1E0C81028];
              v46 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v47[0], OS_LOG_TYPE_DEBUG))
              {
                v9 = v47[0];
                v10 = v46;
                v11 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
                v45 = v11;
                __os_log_helper_16_2_1_8_64((uint64_t)v104, (uint64_t)v45);
                _os_log_debug_impl(&dword_1DC678000, v9, v10, "Full sync done at time: %@", v104, 0xCu);

                objc_storeStrong(&v45, 0);
              }
              objc_storeStrong((id *)v47, 0);
              objc_msgSend(location[0], "removeObjectForKey:", CFSTR("fullSyncRequest"));
              objc_msgSend(v100[0], "setObject:forKey:", CFSTR("Complete"), CFSTR("Status"));
            }
            else
            {
              v48 = (id)objc_msgSend(v99, "mutableCopy");
              v12 = (id)objc_msgSend(v94, "objectForKey:", CFSTR("lastUpdateTimeMilliSeconds"));
              v13 = objc_msgSend(v12, "longLongValue");

              v47[1] = v13;
              if ((unint64_t)v13 < v93)
                objc_msgSend(v48, "setObject:forKey:", &stru_1EA4B7088, CFSTR("sourceUUID"));
              objc_msgSend(v48, "setObject:forKey:", v80, CFSTR("fsCheckpoint"));
              objc_msgSend(location[0], "setObject:forKey:", v48, CFSTR("fullSyncRequest"));
              objc_msgSend(v100[0], "setObject:forKey:", CFSTR("Incomplete"), CFSTR("Status"));
              objc_storeStrong(&v48, 0);
            }
            objc_msgSend(location[0], "setObject:forKey:", v79, CFSTR("checkpoints"));
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v100[0], CFSTR("FullSyncDataIngestionStatus"), 2);
            objc_storeStrong(&v79, 0);
            objc_storeStrong(&v80, 0);
            v97 = 0;
          }
          else
          {
            v83 = CFSTR("Events dict is absent for source device");
            v82 = (os_log_t)MEMORY[0x1E0C81028];
            v81 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v108, (uint64_t)v83);
              _os_log_error_impl(&dword_1DC678000, v82, v81, "%@", v108, 0xCu);
            }
            objc_storeStrong((id *)&v82, 0);
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v83, CFSTR("FullSyncInternalErrorNoEvents"), 2);
            v97 = 1;
            objc_storeStrong((id *)&v83, 0);
          }
          objc_storeStrong(&v84, 0);
        }
        else
        {
          v88 = (os_log_t)MEMORY[0x1E0C81028];
          v87 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v109, (uint64_t)v98);
            _os_log_impl(&dword_1DC678000, v88, v87, "The source device %@ has not responded to the full sync request", v109, 0xCu);
          }
          objc_storeStrong((id *)&v88, 0);
          v86 = (id)objc_msgSend(v99, "objectForKey:", CFSTR("fsRequestTime"));
          v5 = objc_msgSend(v86, "longLongValue");
          if (v5 >= v93)
          {
            objc_msgSend(v100[0], "setObject:forKey:", CFSTR("FullSyncRequestContinue"), CFSTR("Status"));
          }
          else
          {
            v85 = (id)objc_msgSend(v99, "mutableCopy");
            objc_msgSend(v85, "setObject:forKey:", &stru_1EA4B7088, CFSTR("sourceUUID"));
            objc_msgSend(location[0], "setObject:forKey:", v85, CFSTR("fullSyncRequest"));
            objc_msgSend(v100[0], "setObject:forKey:", CFSTR("FullSyncRequestResetTimeout"), CFSTR("Status"));
            objc_storeStrong(&v85, 0);
          }
          objc_msgSend(v100[0], "setObject:forKey:", v86, CFSTR("FullSyncRequestTime"));
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v100[0], CFSTR("FullSyncDataIngestionStatus"), 2);
          v97 = 1;
          objc_storeStrong(&v86, 0);
        }
        objc_storeStrong(&v89, 0);
      }
      else
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v110, (uint64_t)v98);
          _os_log_impl(&dword_1DC678000, oslog, type, "Source device payload is absent for devId: %@", v110, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v90 = (id)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v90, "setObject:forKey:", &stru_1EA4B7088, CFSTR("sourceUUID"));
        objc_msgSend(location[0], "setObject:forKey:", v90, CFSTR("fullSyncRequest"));
        objc_msgSend(v100[0], "setObject:forKey:", CFSTR("SourceDevicePayloadUnavailable"), CFSTR("Status"));
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v100[0], CFSTR("FullSyncDataIngestionStatus"), 2);
        v97 = 1;
        objc_storeStrong(&v90, 0);
      }
      objc_storeStrong(&v94, 0);
    }
  }
  else
  {
    objc_msgSend(v100[0], "setObject:forKey:", CFSTR("SourceDeviceUndefined"), CFSTR("Status"));
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v100[0], CFSTR("FullSyncDataIngestionStatus"), 2);
    v97 = 1;
  }
  objc_storeStrong(&v98, 0);
  objc_storeStrong(&v99, 0);
  objc_storeStrong(v100, 0);
  objc_storeStrong(&v101, 0);
  objc_storeStrong(location, 0);
}

- (id)performDataReplicationPayloadUpdates:(id)a3 withDeviceRegistry:(id)a4 error:(id *)a5
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  NSArray *v37;
  uint64_t v38;
  id v39;
  id v40;
  NSString *v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  id v48;
  NSString *v49;
  id v50;
  id v51;
  id v52;
  os_log_type_t v53;
  os_log_t v54;
  id v55;
  os_log_type_t v56;
  os_log_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[8];
  uint64_t v65;
  id v66;
  id v67;
  _QWORD __b[8];
  uint64_t v69;
  id v70;
  id v71;
  int v72;
  id v73;
  os_log_type_t type;
  os_log_t oslog;
  id v76;
  id v77;
  id v78;
  id v79;
  id *v80;
  id v81;
  id location[2];
  AMDDataSync *v83;
  id v84;
  _QWORD v85[4];
  _QWORD v86[4];
  uint8_t v87[16];
  uint8_t v88[16];
  _BYTE v89[128];
  _BYTE v90[128];
  uint8_t v91[24];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v83 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v81 = 0;
  objc_storeStrong(&v81, a4);
  v80 = a5;
  v79 = (id)objc_msgSend(location[0], "mutableCopy");
  v78 = 0;
  v48 = v81;
  v49 = -[AMDDataSync localDeviceId](v83, "localDeviceId");
  v50 = (id)objc_msgSend(v48, "objectForKey:");

  if (v50)
  {
    v45 = -[AMDDataSync localDeviceId](v83, "localDeviceId");
    v77 = (id)objc_msgSend(v79, "objectForKey:");

    if (v77 && objc_msgSend(v77, "count"))
    {
      v5 = (void *)objc_msgSend(v77, "mutableCopy");
      v6 = v78;
      v78 = v5;

      v44 = -[AMDDataSync localDeviceId](v83, "localDeviceId");
      objc_msgSend(v79, "removeObjectForKey:");

    }
    else if (objc_msgSend(v77, "count"))
    {
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = -[AMDDataSync localDeviceId](v83, "localDeviceId");
      v76 = (id)objc_msgSend(v42, "stringWithFormat:", CFSTR("DeviceId present in the registry but payload absent for: %@"), v43);

      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v91, (uint64_t)v76);
        _os_log_error_impl(&dword_1DC678000, oslog, type, "%@", v91, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v76, CFSTR("DataReplicationError"), 0);
      objc_storeStrong(&v76, 0);
    }
    else
    {
      objc_storeStrong(&v78, 0);
    }
    objc_storeStrong(&v77, 0);
  }
  v73 = -[AMDDataSync pruneInactiveDevicesFrom:](v83, "pruneInactiveDevicesFrom:", v79);
  if (v78)
  {
    -[AMDDataSync performEventDeltaUpdateFor:withDeviceData:error:](v83, "performEventDeltaUpdateFor:withDeviceData:error:", v78, v79, v80);
    if (*v80)
    {
      v84 = 0;
      v72 = 1;
      goto LABEL_55;
    }
    -[AMDDataSync pushFullSyncDataFrom:withDeviceData:error:](v83, "pushFullSyncDataFrom:withDeviceData:error:", v78, v79, v80);
    if (*v80)
    {
      v84 = 0;
      v72 = 1;
      goto LABEL_55;
    }
  }
  else
  {
    v7 = -[AMDDataSync createDeviceEntryWithDevicesData:error:](v83, "createDeviceEntryWithDevicesData:error:", v79, v80);
    v8 = v78;
    v78 = v7;

    if (*v80)
    {
      v84 = 0;
      v72 = 1;
      goto LABEL_55;
    }
    v40 = v81;
    v41 = -[AMDDataSync localDeviceId](v83, "localDeviceId");
    objc_msgSend(v40, "setObject:forKey:", MEMORY[0x1E0C9AA70]);

  }
  v39 = (id)objc_msgSend(v78, "objectForKey:", CFSTR("fullSyncRequest"));

  if (v39)
  {
    -[AMDDataSync ingestFullSyncEventsFor:withDeviceData:error:](v83, "ingestFullSyncEventsFor:withDeviceData:error:", v78, v79, v80);
  }
  else
  {
    v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = (id)objc_msgSend(v78, "objectForKey:", CFSTR("checkpoints"));
    v70 = (id)objc_msgSend(v36, "mutableCopy");

    memset(__b, 0, sizeof(__b));
    v37 = -[AMDDataSync streamsToSync](v83, "streamsToSync");
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", __b, v90, 16);
    if (v38)
    {
      v33 = *(_QWORD *)__b[2];
      v34 = 0;
      v35 = v38;
      while (1)
      {
        v32 = v34;
        if (*(_QWORD *)__b[2] != v33)
          objc_enumerationMutation(v37);
        v69 = *(_QWORD *)(__b[1] + 8 * v34);
        v67 = 0;
        v31 = (id)objc_msgSend(v70, "objectForKey:", v69);

        if (v31)
        {
          v30 = (id)objc_msgSend(v70, "objectForKey:", v69);
          v9 = (void *)objc_msgSend(v30, "mutableCopy");
          v10 = v67;
          v67 = v9;

        }
        else
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v12 = v67;
          v67 = v11;

        }
        v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (!v67)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v14 = v67;
          v67 = v13;

        }
        memset(v64, 0, sizeof(v64));
        v28 = v79;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", v64, v89, 16);
        if (v29)
        {
          v25 = *(_QWORD *)v64[2];
          v26 = 0;
          v27 = v29;
          while (1)
          {
            v24 = v26;
            if (*(_QWORD *)v64[2] != v25)
              objc_enumerationMutation(v28);
            v65 = *(_QWORD *)(v64[1] + 8 * v26);
            v63 = (id)objc_msgSend(v79, "objectForKey:", v65);
            v62 = (id)objc_msgSend(v67, "objectForKey:", v65);
            v61 = 0;
            v59 = 0;
            v23 = -[AMDDataSync ingestDataFromDevice:withDevicePayload:forStream:fromTimestamp:error:](v83, "ingestDataFromDevice:withDevicePayload:forStream:fromTimestamp:error:", v65, v63, v69, v62, &v59);
            objc_storeStrong(&v61, v59);
            v60 = v23;
            if (v61)
            {
              v21 = (void *)MEMORY[0x1E0CB3940];
              v20 = v65;
              v22 = (id)objc_msgSend(v61, "localizedDescription");
              v58 = (id)objc_msgSend(v21, "stringWithFormat:", CFSTR("Data ingestion failed for device: %@ with error: %@"), v20, v22);

              v57 = (os_log_t)MEMORY[0x1E0C81028];
              v56 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                v18 = v57;
                v19 = v56;
                __os_log_helper_16_2_1_8_64((uint64_t)v88, (uint64_t)v58);
                _os_log_error_impl(&dword_1DC678000, v18, v19, "%@", v88, 0xCu);
              }
              objc_storeStrong((id *)&v57, 0);
              objc_msgSend(v71, "setObject:forKey:", v58, v65);
              v72 = 5;
              objc_storeStrong(&v58, 0);
            }
            else
            {
              v55 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("lastSavedEventTimestamp"));
              if (v55)
              {
                objc_msgSend(v67, "setObject:forKey:", v55, v65);
                objc_msgSend(v66, "setObject:forKey:", v60, v65);
                v72 = 0;
              }
              else
              {
                v54 = (os_log_t)MEMORY[0x1E0C81028];
                v53 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  v17 = v54;
                  __os_log_helper_16_2_1_8_64((uint64_t)v87, v65);
                  _os_log_impl(&dword_1DC678000, v17, v53, "No data was ingested for deviceId: %@", v87, 0xCu);
                }
                objc_storeStrong((id *)&v54, 0);
                v72 = 5;
              }
              objc_storeStrong(&v55, 0);
            }
            objc_storeStrong(&v60, 0);
            objc_storeStrong(&v61, 0);
            objc_storeStrong(&v62, 0);
            objc_storeStrong(&v63, 0);
            ++v26;
            if (v24 + 1 >= v27)
            {
              v26 = 0;
              v27 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", v64, v89, 16);
              if (!v27)
                break;
            }
          }
        }

        objc_msgSend(v70, "setObject:forKey:", v67, v69);
        objc_msgSend(v71, "setObject:forKey:", v66, v69);
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
        ++v34;
        if (v32 + 1 >= v35)
        {
          v34 = 0;
          v35 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", __b, v90, 16);
          if (!v35)
            break;
        }
      }
    }

    objc_msgSend(v78, "setObject:forKey:", v70, CFSTR("checkpoints"));
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v71, CFSTR("EventDeltaIngestionStatus"), 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  v52 = (id)objc_msgSend(v78, "objectForKey:", CFSTR("clearData"));
  if (!v52)
    objc_storeStrong(&v52, MEMORY[0x1E0C9AA70]);
  v51 = -[AMDDataSync updateDataDeletionDict:withDevicesData:error:](v83, "updateDataDeletionDict:withDevicesData:error:", v52, v79, v80);
  if (*v80)
  {
    v84 = 0;
  }
  else
  {
    objc_msgSend(v78, "setObject:forKey:", v51, CFSTR("clearData"));
    v85[0] = CFSTR("myUUID");
    v16 = -[AMDDataSync localDeviceId](v83, "localDeviceId");
    v86[0] = v16;
    v85[1] = CFSTR("localDeviceData");
    v86[1] = v78;
    v85[2] = CFSTR("expiredDeviceIds");
    v86[2] = v73;
    v85[3] = CFSTR("deviceRegistry");
    v86[3] = v81;
    v84 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 4);

  }
  v72 = 1;
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
LABEL_55:
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, 0);
  return v84;
}

+ (id)processDataReplicationPayload:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  os_log_t oslog;
  __CFString *v15;
  os_log_type_t v16;
  id v17;
  __CFString *v18;
  os_log_type_t v19;
  id v20;
  __CFString *v21;
  os_log_type_t v22;
  id v23;
  __CFString *v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id *v30;
  id location[3];
  id v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = a4;
  v29 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("drConfig"));
  v28 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("drData"));
  v27 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("deviceRegistry"));
  v26 = -[AMDDataSync initWithDataReplicationConfig:error:]([AMDDataSync alloc], "initWithDataReplicationConfig:error:", v29, a4);
  if (*a4)
  {
    v32 = 0;
    v25 = 1;
  }
  else if (v28)
  {
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v28;
          v11 = (id)objc_msgSend(v27, "mutableCopy");
          v10 = (id)objc_msgSend(v26, "performDataReplicationPayloadUpdates:withDeviceRegistry:error:", v12, v11, v30);
          if (*v30)
            v32 = 0;
          else
            v32 = v10;
          v25 = 1;
          objc_storeStrong(&v10, 0);
          objc_storeStrong(&v11, 0);
          objc_storeStrong(&v12, 0);
        }
        else
        {
          v15 = CFSTR("Device registry is not a dictionary");
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v13 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v15);
            _os_log_error_impl(&dword_1DC678000, oslog, v13, "%@", v33, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v15);
          *v30 = v7;
          v32 = 0;
          v25 = 1;
          objc_storeStrong((id *)&v15, 0);
        }
      }
      else
      {
        v18 = CFSTR("Data Replication data is not a dictionary");
        v17 = MEMORY[0x1E0C81028];
        v16 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v18);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v17, v16, "%@", v34, 0xCu);
        }
        objc_storeStrong(&v17, 0);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v18);
        *v30 = v6;
        v32 = 0;
        v25 = 1;
        objc_storeStrong((id *)&v18, 0);
      }
    }
    else
    {
      v21 = CFSTR("Missing Device registry dict");
      v20 = MEMORY[0x1E0C81028];
      v19 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v21);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v20, v19, "%@", v35, 0xCu);
      }
      objc_storeStrong(&v20, 0);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v21);
      *v30 = v5;
      v32 = 0;
      v25 = 1;
      objc_storeStrong((id *)&v21, 0);
    }
  }
  else
  {
    v24 = CFSTR("Missing DR Data payload");
    v23 = MEMORY[0x1E0C81028];
    v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v24);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v23, v22, "%@", v36, 0xCu);
    }
    objc_storeStrong(&v23, 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 10, v24);
    *v30 = v4;
    v32 = 0;
    v25 = 1;
    objc_storeStrong((id *)&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32;
}

- (NSNumber)deviceForgetThresholdDays
{
  return self->_deviceForgetThresholdDays;
}

- (void)setDeviceForgetThresholdDays:(id)a3
{
  objc_storeStrong((id *)&self->_deviceForgetThresholdDays, a3);
}

- (NSNumber)eventsDeltaSize
{
  return self->_eventsDeltaSize;
}

- (void)setEventsDeltaSize:(id)a3
{
  objc_storeStrong((id *)&self->_eventsDeltaSize, a3);
}

- (NSNumber)eventLifetimeDays
{
  return self->_eventLifetimeDays;
}

- (void)setEventLifetimeDays:(id)a3
{
  objc_storeStrong((id *)&self->_eventLifetimeDays, a3);
}

- (NSNumber)fullSyncDeviceResetThresholdDays
{
  return self->_fullSyncDeviceResetThresholdDays;
}

- (void)setFullSyncDeviceResetThresholdDays:(id)a3
{
  objc_storeStrong((id *)&self->_fullSyncDeviceResetThresholdDays, a3);
}

- (NSNumber)fullSyncEventsDeltaSize
{
  return self->_fullSyncEventsDeltaSize;
}

- (void)setFullSyncEventsDeltaSize:(id)a3
{
  objc_storeStrong((id *)&self->_fullSyncEventsDeltaSize, a3);
}

- (NSString)localDeviceId
{
  return self->_localDeviceId;
}

- (void)setLocalDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceId, a3);
}

- (NSArray)streamsToSync
{
  return self->_streamsToSync;
}

- (void)setStreamsToSync:(id)a3
{
  objc_storeStrong((id *)&self->_streamsToSync, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamsToSync, 0);
  objc_storeStrong((id *)&self->_localDeviceId, 0);
  objc_storeStrong((id *)&self->_fullSyncEventsDeltaSize, 0);
  objc_storeStrong((id *)&self->_fullSyncDeviceResetThresholdDays, 0);
  objc_storeStrong((id *)&self->_eventLifetimeDays, 0);
  objc_storeStrong((id *)&self->_eventsDeltaSize, 0);
  objc_storeStrong((id *)&self->_deviceForgetThresholdDays, 0);
}

@end
