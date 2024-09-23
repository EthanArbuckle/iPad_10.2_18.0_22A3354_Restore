@implementation AMDSplunkLogger

+ (void)flushEvents:(id)a3
{
  id v3;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB60]), "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), 0);
  objc_msgSend(v3, "enqueueEvents:", location[0]);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)checkSchemaValidity:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  int v10;
  id v11;
  _QWORD __b[8];
  uint64_t v13;
  id location[3];
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(__b[1] + 8 * v6);
      v11 = (id)objc_msgSend(location[0], "objectForKey:", v13);
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("string")) & 1) != 0
        || (objc_msgSend(v11, "isEqualToString:", CFSTR("number")) & 1) != 0
        || (objc_msgSend(v11, "isEqualToString:", CFSTR("dictionary")) & 1) != 0
        || (objc_msgSend(v11, "isEqualToString:", CFSTR("array")) & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v15 = 0;
        v10 = 1;
      }
      objc_storeStrong(&v11, 0);
      if (v10)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v10 = 0;
  }

  if (!v10)
    v15 = 1;
  objc_storeStrong(location, 0);
  return v15 & 1;
}

+ (id)logEvents:(id)a3 toTopic:(id)a4 withSchema:(id)a5
{
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v37;
  uint64_t v38;
  id v39;
  _QWORD v40[8];
  uint64_t v41;
  id v42;
  int v43;
  id v44;
  id v45;
  _QWORD v46[8];
  uint64_t v47;
  char v48;
  _QWORD __b[8];
  id v50;
  unsigned int v51;
  unsigned int v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id location[2];
  id v58;
  _BYTE v59[128];
  uint64_t v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v58 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = 0;
  objc_storeStrong(&v56, a4);
  v55 = 0;
  objc_storeStrong(&v55, a5);
  v54 = objc_msgSend(location[0], "count");
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0;
  v51 = 0;
  memset(__b, 0, sizeof(__b));
  v37 = location[0];
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v63, 16);
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
      v50 = *(id *)(__b[1] + 8 * v33);
      v48 = 0;
      memset(v46, 0, sizeof(v46));
      v29 = v55;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v46, v62, 16);
      if (v30)
      {
        v26 = *(_QWORD *)v46[2];
        v27 = 0;
        v28 = v30;
        while (1)
        {
          v25 = v27;
          if (*(_QWORD *)v46[2] != v26)
            objc_enumerationMutation(v29);
          v47 = *(_QWORD *)(v46[1] + 8 * v27);
          v45 = (id)objc_msgSend(v55, "objectForKey:", v47);
          v44 = (id)objc_msgSend(v50, "objectForKey:", v47);
          if (v44)
          {
            if ((objc_msgSend(v45, "isEqualToString:", CFSTR("string")) & 1) == 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if ((objc_msgSend(v45, "isEqualToString:", CFSTR("number")) & 1) == 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if ((objc_msgSend(v45, "isEqualToString:", CFSTR("dictionary")) & 1) == 0
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if ((objc_msgSend(v45, "isEqualToString:", CFSTR("array")) & 1) == 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v22 = (void *)MEMORY[0x1E0CB36D8];
                    v60 = v47;
                    v61 = v44;
                    v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
                    v24 = objc_msgSend(v22, "isValidJSONObject:");

                    if ((v24 & 1) != 0)
                    {
                      v43 = 0;
                    }
                    else
                    {
                      v48 = 1;
                      v43 = 4;
                    }
                  }
                  else
                  {
                    v48 = 1;
                    v43 = 4;
                  }
                }
                else
                {
                  v48 = 1;
                  v43 = 4;
                }
              }
              else
              {
                v48 = 1;
                v43 = 4;
              }
            }
            else
            {
              v48 = 1;
              v43 = 4;
            }
          }
          else
          {
            v48 = 1;
            v43 = 4;
          }
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          if (v43)
            break;
          ++v27;
          if (v25 + 1 >= v28)
          {
            v27 = 0;
            v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v46, v62, 16);
            if (!v28)
              goto LABEL_29;
          }
        }
      }
      else
      {
LABEL_29:
        v43 = 0;
      }

      if ((v48 & 1) != 0)
      {
        ++v52;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x1E0CFDB68]);
        v42 = (id)objc_msgSend(v5, "initWithTopic:", v56);
        memset(v40, 0, sizeof(v40));
        v20 = v55;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v40, v59, 16);
        if (v21)
        {
          v17 = *(_QWORD *)v40[2];
          v18 = 0;
          v19 = v21;
          while (1)
          {
            v16 = v18;
            if (*(_QWORD *)v40[2] != v17)
              objc_enumerationMutation(v20);
            v41 = *(_QWORD *)(v40[1] + 8 * v18);
            v14 = v42;
            v15 = (id)objc_msgSend(v50, "objectForKey:", v41);
            objc_msgSend(v14, "setProperty:forBodyKey:");

            ++v18;
            if (v16 + 1 >= v19)
            {
              v18 = 0;
              v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v40, v59, 16);
              if (!v19)
                break;
            }
          }
        }

        ++v51;
        objc_msgSend(v53, "addObject:", v42);
        objc_storeStrong(&v42, 0);
      }
      ++v33;
      if (v31 + 1 >= v34)
      {
        v33 = 0;
        v34 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v63, 16);
        if (!v34)
          break;
      }
    }
  }

  if (objc_msgSend(v53, "count"))
    objc_msgSend(v58, "flushEvents:", v53);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v39;
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v54);
  objc_msgSend(v7, "setObject:forKey:");

  v9 = v39;
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51);
  objc_msgSend(v9, "setObject:forKey:");

  v11 = v39;
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v52);
  objc_msgSend(v11, "setObject:forKey:");

  v13 = v39;
  v43 = 1;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)logPayload:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v10;
  os_log_type_t v11;
  os_log_t oslog;
  __CFString *v13;
  os_log_type_t v14;
  id v15;
  __CFString *v16;
  id v17;
  os_log_type_t v18;
  id v19;
  __CFString *v20;
  id v21;
  int v22;
  os_log_type_t v23;
  id v24;
  __CFString *v25;
  id v26;
  id *v27;
  id location[2];
  id v29;
  id v30;
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("topic"));
  if (v26)
  {
    v21 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("events"));
    if (v21)
    {
      v17 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("schema"));
      if (v17)
      {
        if ((objc_msgSend(v29, "checkSchemaValidity:", v17) & 1) != 0)
        {
          v10 = (id)objc_msgSend(v29, "logEvents:toTopic:withSchema:", v21, v26, v17);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v10, CFSTR("AMDSplunkLoggerSummary"), 0);
          v30 = v10;
          v22 = 1;
          objc_storeStrong(&v10, 0);
        }
        else
        {
          v13 = CFSTR("Invalid Schema provided. Type can only be number, string, dictionary or an array.");
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v11 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v13);
            _os_log_error_impl(&dword_1DC678000, oslog, v11, "%@", v31, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v13);
          *v27 = v7;
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v13, CFSTR("AMDSplunkLoggerError"), 0);
          v30 = 0;
          v22 = 1;
          objc_storeStrong((id *)&v13, 0);
        }
      }
      else
      {
        v16 = CFSTR("Missing schema dictionary in splunk logging payload");
        v15 = MEMORY[0x1E0C81028];
        v14 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v16);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v15, v14, "%@", v32, 0xCu);
        }
        objc_storeStrong(&v15, 0);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v16);
        *v27 = v6;
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v16, CFSTR("AMDSplunkLoggerError"), 0);
        v30 = 0;
        v22 = 1;
        objc_storeStrong((id *)&v16, 0);
      }
      objc_storeStrong(&v17, 0);
    }
    else
    {
      v20 = CFSTR("Missing events array in splunk logging payload");
      v19 = MEMORY[0x1E0C81028];
      v18 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v20);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v19, v18, "%@", v33, 0xCu);
      }
      objc_storeStrong(&v19, 0);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v20);
      *v27 = v5;
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v20, CFSTR("AMDSplunkLoggerError"), 0);
      v30 = 0;
      v22 = 1;
      objc_storeStrong((id *)&v20, 0);
    }
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v25 = CFSTR("Missing topic in splunk logging payload");
    v24 = MEMORY[0x1E0C81028];
    v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v25);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v24, v23, "%@", v34, 0xCu);
    }
    objc_storeStrong(&v24, 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v25);
    *v27 = v4;
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v25, CFSTR("AMDSplunkLoggerError"), 0);
    v30 = 0;
    v22 = 1;
    objc_storeStrong((id *)&v25, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v30;
}

@end
