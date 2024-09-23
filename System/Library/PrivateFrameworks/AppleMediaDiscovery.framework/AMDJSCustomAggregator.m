@implementation AMDJSCustomAggregator

+ (id)runCustomAggregation:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18;
  id *v19;
  id location[2];
  id v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  *a4 = 0;
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("runCustomAggregator"));
  v18 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8948);
  v17 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB448);
  if (v18 && v17)
  {
    v15 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B86A8);
    v14 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2C88);
    if (v15 || v14)
    {
      v13 = 0;
      if (v14)
      {
        v4 = (id)objc_msgSend(v21, "aggregateUsing:forUserId:andDomain:error:", v14, v17, v18, v19);
        v5 = v13;
        v13 = v4;

      }
      else
      {
        v6 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v15, v18, v19);
        v7 = v13;
        v13 = v6;

        if (*v19 || !v13)
        {
          v8 = +[AMDSQLite getFeatureValueWithName:inDomain:withColumnName:skipRowset:error:](AMDSQLite, "getFeatureValueWithName:inDomain:withColumnName:skipRowset:error:", v15, v18, 0, 0, v19);
          v9 = v13;
          v13 = v8;

        }
      }
      if (*v19)
      {
        v22 = 0;
        v16 = 1;
      }
      else
      {
        +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("runCustomAggregator"));
        v23 = CFSTR("featureData");
        if (v13)
          v11 = v13;
        else
          v11 = (id)MEMORY[0x1E0C9AA60];
        v24[0] = v11;
        v22 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v16 = 1;
      }
      objc_storeStrong(&v13, 0);
    }
    else
    {
      *v19 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("missing feature name and feature descriptor"));
      v22 = 0;
      v16 = 1;
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    *v19 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("domain or userId missing"));
    v22 = 0;
    v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v22;
}

+ (id)aggregateUsing:(id)a3 forUserId:(id)a4 andDomain:(id)a5 error:(id *)a6
{
  unint64_t v7;
  char v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  id location[3];
  id v17;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = a6;
  v12 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("version"));
  v11 = 0;
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v12, "isEqualToString:", AMD_CUSTOM_AGG_VERSION_1) & 1) == 0)
  {
    if ((objc_msgSend(v12, "isEqualToString:", AMD_CUSTOM_AGG_VERSION_2) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", AMD_CUSTOM_AGG_VERSION_SQLITE_0) & 1) != 0)
    {
      v11 = 3;
    }
  }
  else
  {
    v11 = 1;
  }
  v7 = v11;
  if (v7 <= 3)
    __asm { BR              X8 }
  *v13 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Invalid version"));
  v17 = 0;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

+ (id)runBatchedSQLDescriptorsUsing:(id)a3 error:(id *)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  AMDFetchDescriptor *v14;
  AMDFetchDescriptor *v15;
  id v16;
  NSObject *log;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id obj;
  uint64_t v24;
  BOOL v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  os_log_type_t type;
  os_log_t oslog;
  id v34;
  _QWORD __b[8];
  uint64_t v36;
  id v37;
  int v38;
  id v39;
  id v40;
  id *v41;
  id location[3];
  id v43;
  const __CFString *v44;
  id v45;
  const __CFString *v46;
  id v47;
  uint8_t v48[24];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = a4;
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = (id)objc_msgSend(location[0], "objectForKey:", AMD_BATCHED_CUSTOM_AGG_DICT);
  if (v39)
  {
    v37 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    if (objc_msgSend(v37, "getDb"))
    {
      v4 = (id)objc_msgSend(v37, "getDataSchema");
      v25 = v4 != 0;

      if (v25)
      {
        memset(__b, 0, sizeof(__b));
        obj = v39;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
        if (v24)
        {
          v20 = *(_QWORD *)__b[2];
          v21 = 0;
          v22 = v24;
          while (1)
          {
            v19 = v21;
            if (*(_QWORD *)__b[2] != v20)
              objc_enumerationMutation(obj);
            v36 = *(_QWORD *)(__b[1] + 8 * v21);
            v34 = 0;
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              v18 = type;
              __os_log_helper_16_2_1_8_64((uint64_t)v48, v36);
              _os_log_debug_impl(&dword_1DC678000, log, v18, "Running aggregation: %@", v48, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v31 = (id)objc_msgSend(v39, "objectForKey:", v36);
            v14 = [AMDFetchDescriptor alloc];
            v13 = v31;
            v16 = (id)objc_msgSend(v37, "getDataSchema");
            v29 = v34;
            v15 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v14, "initWithDict:usingSchema:error:", v13);
            objc_storeStrong(&v34, v29);
            v30 = v15;

            if (v34)
            {
              v10 = v40;
              v46 = CFSTR("error");
              v12 = (id)objc_msgSend(v34, "localizedDescription");
              v47 = v12;
              v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
              objc_msgSend(v10, "setValue:forKey:");

              v38 = 3;
            }
            else
            {
              v27 = 0;
              v9 = (id)objc_msgSend(v37, "fetchRows:andPersist:error:", v30, 0, &v27);
              objc_storeStrong(&v34, v27);
              v28 = v9;
              if (v34)
              {
                v6 = v40;
                v44 = CFSTR("error");
                v8 = (id)objc_msgSend(v34, "localizedDescription");
                v45 = v8;
                v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
                objc_msgSend(v6, "setValue:forKey:");

                v38 = 3;
              }
              else
              {
                objc_msgSend(v40, "setObject:forKey:", v28, v36);
                v38 = 0;
              }
              objc_storeStrong(&v28, 0);
            }
            objc_storeStrong(&v30, 0);
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v34, 0);
            ++v21;
            if (v19 + 1 >= v22)
            {
              v21 = 0;
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
              if (!v22)
                break;
            }
          }
        }

        v43 = v40;
        v38 = 1;
      }
      else
      {
        *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, CFSTR("SQL database does not have a schema available"));
        v43 = 0;
        v38 = 1;
      }
    }
    else
    {
      *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, CFSTR("SQL database pointer is nil"));
      v43 = 0;
      v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  else
  {
    *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, CFSTR("batchedAggregatorDict not passed in payload"));
    v43 = 0;
    v38 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  return v43;
}

@end
