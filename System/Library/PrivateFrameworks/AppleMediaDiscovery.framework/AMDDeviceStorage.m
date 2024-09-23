@implementation AMDDeviceStorage

+ (id)queryDeviceStorageWithError:(id *)a3
{
  id v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  os_log_type_t type;
  os_log_t oslog;
  __CFString *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  SEL v17;
  id v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = a1;
  v17 = a2;
  v16 = a3;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  GetDeviceSpace(&v15, &v14, &v13);
  if (v13)
  {
    v12 = CFSTR("Device storage query failed");
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v12);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "%@", v22, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 29, v12);
    *v16 = v3;
    v19 = 0;
    objc_storeStrong((id *)&v12, 0);
  }
  else
  {
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v15 / 1000000000.0);
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v14 / 1000000000.0);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
    v7 = (id)objc_msgSend(v5, "numberWithLongLong:", 1000 * objc_msgSend(v6, "longLongValue"));

    v20[0] = CFSTR("time");
    v21[0] = v7;
    v20[1] = CFSTR("totalDeviceCapacityGB");
    v21[1] = v9;
    v20[2] = CFSTR("availableDeviceCapacityGB");
    v21[2] = v8;
    v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  return v19;
}

+ (id)performStorageUpdateWithPayload:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *log;
  os_log_type_t type;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id obj;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t v29[7];
  char v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37[2];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  int v45;
  id v46;
  id location[2];
  id v48;
  id v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v48 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = location[0];
      v43 = (id)objc_msgSend(v44, "objectForKey:", CFSTR("isEnabled"));
      if (v43 && (objc_msgSend(v43, "BOOLValue") & 1) != 0)
      {
        v42 = (id)objc_msgSend(v44, "objectForKey:", CFSTR("storageUpdateCadence"));
        if (v42)
        {
          v41 = 0;
          v39 = 0;
          v20 = +[AMDKVStore fetchValueForKey:error:](AMDKVStore, "fetchValueForKey:error:", CFSTR("device_storage_query_time_dict"), &v39);
          objc_storeStrong(&v41, v39);
          v40 = v20;
          v38 = (id)objc_msgSend(v20, "objectForKey:", CFSTR("queryTimeMs"));
          if (v41)
          {
            v18 = v46;
            v19 = (id)objc_msgSend(v41, "localizedDescription");
            objc_msgSend(v18, "setObject:forKey:");

            v49 = v46;
            v45 = 1;
          }
          else
          {
            if (!v38)
              objc_storeStrong(&v38, &unk_1EA4CEDD0);
            v16 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
            v15 = objc_msgSend(v16, "longLongValue");
            v17 = 1000 * (v15 - (int)(86400 * objc_msgSend(v42, "intValue")));

            v37[1] = (id)v17;
            if (objc_msgSend(v38, "longLongValue") <= v17)
            {
              v37[0] = 0;
              v35 = 0;
              v14 = (id)objc_msgSend(v48, "queryDeviceStorageWithError:", &v35);
              objc_storeStrong(v37, v35);
              v36 = v14;
              if (v37[0])
              {
                v12 = v46;
                v13 = (id)objc_msgSend(v37[0], "localizedDescription");
                objc_msgSend(v12, "setObject:forKey:");

                v49 = v46;
                v45 = 1;
              }
              else
              {
                v34 = 0;
                v32 = 0;
                v11 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", &v32);
                objc_storeStrong(&v34, v32);
                v33 = v11;
                if (v34 || !v33)
                {
                  v31 = MEMORY[0x1E0C81028];
                  v30 = 16;
                  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
                  {
                    log = v31;
                    type = v30;
                    __os_log_helper_16_0_0(v29);
                    _os_log_error_impl(&dword_1DC678000, log, type, "DeviceId could not be retrieved", v29, 2u);
                  }
                  objc_storeStrong(&v31, 0);
                  objc_storeStrong(&v33, CFSTR("undefined"));
                }
                v28 = (id)objc_msgSend(v36, "mutableCopy");
                objc_msgSend(v28, "setObject:forKey:", v33, 0x1EA4BCEE8);
                v27 = (id)objc_msgSend(v44, "objectForKey:", CFSTR("deviceStorageDataStreamName"));
                if (v27)
                {
                  v51[0] = 0x1EA4B92E8;
                  v52[0] = v27;
                  v51[1] = 0x1EA4B92C8;
                  v50 = v28;
                  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                  v52[1] = v7;
                  v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);

                  v25 = 0;
                  obj = 0;
                  v8 = +[AMDSQLite saveEvents:error:](AMDSQLite, "saveEvents:error:", v26, &obj);
                  objc_storeStrong(&v25, obj);
                  v24 = v8;
                  if (v25)
                  {
                    v5 = v46;
                    v6 = (id)objc_msgSend(v25, "localizedDescription");
                    objc_msgSend(v5, "setObject:forKey:");

                    v49 = v46;
                    v45 = 1;
                  }
                  else
                  {
                    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                    v4 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("time"));
                    objc_msgSend(v22, "setObject:forKey:");

                    v21 = v41;
                    +[AMDKVStore setValue:forKey:error:](AMDKVStore, "setValue:forKey:error:", v22, CFSTR("device_storage_query_time_dict"), &v21);
                    objc_storeStrong(&v41, v21);
                    if (v41)
                      objc_msgSend(v46, "setObject:forKey:", CFSTR("Storage query time not updated"), CFSTR("deviceStorageUpdateError"));
                    objc_msgSend(v46, "setObject:forKey:", v24, CFSTR("storageUpdateStatus"));
                    v49 = v46;
                    v45 = 1;
                    objc_storeStrong(&v22, 0);
                  }
                  objc_storeStrong(&v24, 0);
                  objc_storeStrong(&v25, 0);
                  objc_storeStrong(&v26, 0);
                }
                else
                {
                  objc_msgSend(v46, "setObject:forKey:", CFSTR("Device Storage stream name missing"), CFSTR("deviceStorageUpdateError"));
                  v49 = v46;
                  v45 = 1;
                }
                objc_storeStrong(&v27, 0);
                objc_storeStrong(&v28, 0);
                objc_storeStrong(&v33, 0);
                objc_storeStrong(&v34, 0);
              }
              objc_storeStrong(&v36, 0);
              objc_storeStrong(v37, 0);
            }
            else
            {
              objc_msgSend(v46, "setObject:forKey:", CFSTR("Storage data is current"), CFSTR("storageUpdateStatus"));
              v49 = v46;
              v45 = 1;
            }
          }
          objc_storeStrong(&v38, 0);
          objc_storeStrong(&v40, 0);
          objc_storeStrong(&v41, 0);
        }
        else
        {
          objc_msgSend(v46, "setObject:forKey:", CFSTR("Storage update cadence is missing"), CFSTR("deviceStorageUpdateError"));
          v49 = v46;
          v45 = 1;
        }
        objc_storeStrong(&v42, 0);
      }
      else
      {
        objc_msgSend(v46, "setObject:forKey:", CFSTR("Storage update is disabled"), CFSTR("deviceStorageUpdateError"));
        v49 = v46;
        v45 = 1;
      }
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v44, 0);
    }
    else
    {
      objc_msgSend(v46, "setObject:forKey:", CFSTR("Storage update payload is not a dictionary"), CFSTR("deviceStorageUpdateError"));
      v49 = v46;
      v45 = 1;
    }
  }
  else
  {
    objc_msgSend(v46, "setObject:forKey:", CFSTR("Storage update payload is nil"), CFSTR("deviceStorageUpdateError"));
    v49 = v46;
    v45 = 1;
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  return v49;
}

@end
