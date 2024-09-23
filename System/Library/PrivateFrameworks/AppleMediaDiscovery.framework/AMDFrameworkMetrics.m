@implementation AMDFrameworkMetrics

+ (void)provisionInstanceAtVerbosity:(char)a3 andAction:(id)a4 andVersion:(id)a5 andBuild:(id)a6 andStorefrontId:(id)a7 withLoggingProbability:(id)a8
{
  AMDMetricsContainer *v8;
  id v13;
  id v14;
  AMDMetricsContainer *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  char v21;
  SEL v22;
  id v23;

  v23 = a1;
  v22 = a2;
  v21 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v17 = 0;
  objc_storeStrong(&v17, a7);
  v16 = 0;
  objc_storeStrong(&v16, a8);
  v8 = [AMDMetricsContainer alloc];
  v15 = -[AMDMetricsContainer initWithLevel:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:](v8, "initWithLevel:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:", v21, location, v19, v18, v17, v16);
  v14 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v13 = (id)objc_msgSend(v14, "threadDictionary");
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("__AMDMetricsContainer"));

  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
}

+ (void)log:(id)a3 withKey:(id)a4 atVerbosity:(char)a5
{
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  NSObject *log;
  os_log_type_t type;
  uint8_t v19[7];
  char v20;
  id v21;
  id v22;
  os_log_type_t v23;
  id v24;
  char v25;
  os_log_type_t v26;
  id v27;
  os_log_type_t v28;
  id v29;
  int v30;
  uint8_t v31[15];
  char v32;
  id v33;
  char v34;
  id v35;
  id location[3];
  uint8_t v37[16];
  id v38;
  id v39;
  uint8_t v40[16];
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = a5;
  if (v35)
  {
    if (location[0])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = 1;
        v12 = (void *)MEMORY[0x1E0CB36D8];
        v38 = v35;
        v39 = location[0];
        v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v14 = objc_msgSend(v12, "isValidJSONObject:");

        if ((v14 & 1) == 0)
        {
          v24 = MEMORY[0x1E0C81028];
          v23 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v35);
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v24, v23, "Unserializable info passed to Figaro logger for key: %@", v37, 0xCu);
          }
          objc_storeStrong(&v24, 0);
          v25 = 0;
        }
        v11 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
        v10 = (id)objc_msgSend(v11, "threadDictionary");
        v22 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("__AMDMetricsContainer"));

        if (v22)
        {
          v5 = objc_msgSend(v22, "verbosity");
          if (v34 <= v5)
          {
            if ((v25 & 1) != 0)
            {
              v6 = (id)objc_msgSend(v22, "logData");
              objc_msgSend(v6, "setObject:forKey:", location[0], v35);

              v30 = 0;
            }
            else
            {
              v7 = (id)objc_msgSend(v22, "logData");
              objc_msgSend(v7, "setObject:forKey:", CFSTR("Unserializable info passed"), v35);

              v30 = 1;
            }
          }
          else
          {
            v30 = 1;
          }
        }
        else
        {
          v21 = MEMORY[0x1E0C81028];
          v20 = 16;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
          {
            v8 = v21;
            v9 = v20;
            __os_log_helper_16_0_0(v19);
            _os_log_error_impl(&dword_1DC678000, v8, v9, "Programmer error: no metrics container!", v19, 2u);
          }
          objc_storeStrong(&v21, 0);
          v30 = 1;
        }
        objc_storeStrong(&v22, 0);
      }
      else
      {
        v27 = MEMORY[0x1E0C81028];
        v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v35);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v27, v26, "Unsupported data type being logged for key : %@", v40, 0xCu);
        }
        objc_storeStrong(&v27, 0);
        v30 = 1;
      }
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v28 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v35);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v29, v28, "Attempting to log nil info to Figaro logger for key : %@", v41, 0xCu);
      }
      objc_storeStrong(&v29, 0);
      v30 = 1;
    }
  }
  else
  {
    v33 = MEMORY[0x1E0C81028];
    v32 = 16;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      log = v33;
      type = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_error_impl(&dword_1DC678000, log, type, "Attempting to log nil key to Figaro logger", v31, 2u);
    }
    objc_storeStrong(&v33, 0);
    v30 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

+ (id)getValueForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;
  char v8;
  id v9;
  id v10;
  id location[3];
  id v12;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (id)objc_msgSend(v6, "threadDictionary");
  v10 = (id)objc_msgSend(v5, "objectForKey:", CFSTR("__AMDMetricsContainer"));

  v8 = 0;
  v7 = 1;
  if (v10)
  {
    v9 = (id)objc_msgSend(v10, "logData");
    v8 = 1;
    v7 = v9 == 0;
  }
  if ((v8 & 1) != 0)

  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v4 = (id)objc_msgSend(v10, "logData");
    v12 = (id)objc_msgSend(v4, "objectForKey:", location[0]);

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v12;
}

+ (void)flush
{
  double v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  id v12;
  char v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  BOOL v17;
  NSObject *log;
  os_log_type_t type;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  os_log_type_t v24;
  id v25;
  uint8_t v26[7];
  char v27;
  id v28;
  uint8_t v29[7];
  char v30;
  id v31;
  double v32;
  int v33;
  uint8_t v34[15];
  char v35;
  id location;
  id v37[3];
  uint8_t v38[16];
  uint8_t v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v37[2] = a1;
  v37[1] = (id)a2;
  v21 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v20 = (id)objc_msgSend(v21, "threadDictionary");
  v37[0] = (id)objc_msgSend(v20, "objectForKey:", CFSTR("__AMDMetricsContainer"));

  if (v37[0])
  {
    v32 = (double)arc4random() / 4294967300.0;
    v16 = (id)objc_msgSend(v37[0], "loggingProbability");
    objc_msgSend(v16, "doubleValue");
    v17 = v32 <= v2;

    if (v17)
    {
      v11 = (void *)MEMORY[0x1E0CB36D8];
      v12 = (id)objc_msgSend(v37[0], "logData");
      v13 = objc_msgSend(v11, "isValidJSONObject:");

      if ((v13 & 1) != 0)
      {
        v28 = MEMORY[0x1E0C81028];
        v27 = 1;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_INFO))
        {
          v9 = v28;
          v10 = v27;
          __os_log_helper_16_0_0(v26);
          _os_log_impl(&dword_1DC678000, v9, v10, "Flushing logs", v26, 2u);
        }
        objc_storeStrong(&v28, 0);
        v25 = MEMORY[0x1E0C81028];
        v24 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
        {
          v8 = (id)objc_msgSend(v37[0], "logData");
          __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)v8);
          _os_log_debug_impl(&dword_1DC678000, (os_log_t)v25, v24, "Log data: %@", v39, 0xCu);

        }
        objc_storeStrong(&v25, 0);
        v5 = (id)objc_msgSend(v37[0], "metricEvent");
        v4 = (id)objc_msgSend(v37[0], "logData");
        objc_msgSend(v5, "setProperty:forBodyKey:");

        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB60]), "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), 0);
        v6 = (id)v23;
        v7 = (id)objc_msgSend(v37[0], "metricEvent");
        objc_msgSend(v6, "enqueueEvent:");

        objc_storeStrong((id *)&v23, 0);
      }
      else
      {
        v22 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          v3 = (id)objc_msgSend(v37[0], "logData");
          __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v3);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Cannot flush unserializable log data: %@", v38, 0xCu);

        }
        objc_storeStrong(&v22, 0);
      }
      v33 = 0;
    }
    else
    {
      v31 = MEMORY[0x1E0C81028];
      v30 = 1;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_INFO))
      {
        v14 = v31;
        v15 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_impl(&dword_1DC678000, v14, v15, "Skipping logging for this event invocation", v29, 2u);
      }
      objc_storeStrong(&v31, 0);
      v33 = 1;
    }
  }
  else
  {
    location = MEMORY[0x1E0C81028];
    v35 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      type = v35;
      __os_log_helper_16_0_0(v34);
      _os_log_error_impl(&dword_1DC678000, log, type, "Programmer error: no metrics container!", v34, 2u);
    }
    objc_storeStrong(&location, 0);
    v33 = 1;
  }
  objc_storeStrong(v37, 0);
}

@end
