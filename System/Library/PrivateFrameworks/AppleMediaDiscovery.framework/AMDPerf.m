@implementation AMDPerf

+ (void)provision
{
  id v2;
  id v3;
  id v4[3];

  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] = -[AMDPerfContainer initWithSwitch:atLevel:]([AMDPerfContainer alloc], "initWithSwitch:atLevel:", 1, 0);
  v3 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (id)objc_msgSend(v3, "threadDictionary");
  objc_msgSend(v2, "setObject:forKey:", v4[0], CFSTR("__AMDPerfContainer"));

  objc_storeStrong(v4, 0);
}

+ (id)getContainer
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  id v6;
  uint8_t v7[7];
  char v8;
  id location;
  id v10[3];
  id v11;

  v10[2] = a1;
  v10[1] = (id)a2;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (id)objc_msgSend(v6, "threadDictionary");
  v10[0] = (id)objc_msgSend(v5, "objectForKey:", CFSTR("__AMDPerfContainer"));

  if (v10[0])
  {
    if ((objc_msgSend(v10[0], "isEnabled") & 1) != 0)
      v11 = v10[0];
    else
      v11 = 0;
  }
  else
  {
    location = MEMORY[0x1E0C81028];
    v8 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_error_impl(&dword_1DC678000, log, type, "Programmer error: no perf container!", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    v11 = 0;
  }
  objc_storeStrong(v10, 0);
  return v11;
}

+ (void)enable:(BOOL)a3
{
  id location;
  BOOL v4;
  SEL v5;
  id v6;

  v6 = a1;
  v5 = a2;
  v4 = a3;
  location = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (location)
    objc_msgSend(location, "setIsEnabled:", v4);
  objc_storeStrong(&location, 0);
}

+ (void)setVerbosity:(char)a3
{
  id location;
  char v4;
  SEL v5;
  id v6;

  v6 = a1;
  v5 = a2;
  v4 = a3;
  location = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (location)
    objc_msgSend(location, "setLevel:", v4);
  objc_storeStrong(&location, 0);
}

+ (void)startMonitoringEvent:(id)a3
{
  double v3;
  int v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  double v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (v17)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v17, "getTime");
    v13 = v3;
    +[AMDPerfContainer getMemoryUsage:logType:timeDelta:](AMDPerfContainer, "getMemoryUsage:logType:timeDelta:", location[0], 0.0);
    v12 = v4;
    v6 = v15;
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    objc_msgSend(v6, "setObject:forKey:");

    v8 = v14;
    LODWORD(v5) = v12;
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    objc_msgSend(v8, "setObject:forKey:");

    v10 = (id)objc_msgSend(v17, "timeUsage");
    objc_msgSend(v10, "setObject:forKey:", v15, location[0]);

    v11 = (id)objc_msgSend(v17, "memoryUsage");
    objc_msgSend(v11, "setObject:forKey:", v14, location[0]);

    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (void)endMonitoringEvent:(id)a3
{
  double v3;
  double v4;
  int v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  double v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id location[3];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (v22)
  {
    v14 = (id)objc_msgSend(v22, "timeUsage");
    v20 = (id)objc_msgSend(v14, "objectForKey:", location[0]);

    v15 = (id)objc_msgSend(v22, "memoryUsage");
    v19 = (id)objc_msgSend(v15, "objectForKey:", location[0]);

    if (v20 && v19)
    {
      objc_msgSend(v22, "getTime");
      v17 = v3;
      v8 = v3;
      v7 = (id)objc_msgSend(v20, "objectForKey:", CFSTR("start"));
      objc_msgSend(v7, "doubleValue");
      v9 = v8 - v4;

      +[AMDPerfContainer getMemoryUsage:logType:timeDelta:](AMDPerfContainer, "getMemoryUsage:logType:timeDelta:", location[0], v9);
      v16 = v5;
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
      objc_msgSend(v20, "setObject:forKey:");

      LODWORD(v6) = v16;
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      objc_msgSend(v19, "setObject:forKey:");

      v12 = (id)objc_msgSend(v22, "timeUsage");
      objc_msgSend(v12, "setObject:forKey:", v20, location[0]);

      v13 = (id)objc_msgSend(v22, "memoryUsage");
      objc_msgSend(v13, "setObject:forKey:", v19, location[0]);

      v21 = 0;
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location[0]);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "Programmer error: Ending monitoring event '%@' without starting it", v24, 0xCu);
      }
      objc_storeStrong(&v18, 0);
      v21 = 1;
    }
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

+ (id)generatePerformanceDict
{
  double v2;
  double v3;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  id location;
  id v27;
  id v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD __b[8];
  uint64_t v35;
  id v36;
  int v37;
  id v38[3];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38[2] = a1;
  v38[1] = (id)a2;
  v38[0] = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (v38[0])
  {
    v22 = objc_alloc(MEMORY[0x1E0C99E08]);
    v23 = (id)objc_msgSend(v38[0], "timeUsage");
    v36 = (id)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v38[0], "timeUsage");
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
    if (v25)
    {
      v19 = *(_QWORD *)__b[2];
      v20 = 0;
      v21 = v25;
      while (1)
      {
        v18 = v20;
        if (*(_QWORD *)__b[2] != v19)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(__b[1] + 8 * v20);
        v16 = (id)objc_msgSend(v38[0], "memoryUsage");
        v33 = (id)objc_msgSend(v16, "objectForKey:", v35);

        v17 = (id)objc_msgSend(v38[0], "timeUsage");
        v32 = (id)objc_msgSend(v17, "objectForKey:", v35);

        v31 = (id)objc_msgSend(v32, "objectForKey:", CFSTR("end"));
        v30 = (id)objc_msgSend(v32, "objectForKey:", CFSTR("start"));
        v29 = -1.0;
        if (v31 && v30)
        {
          objc_msgSend(v31, "doubleValue");
          v15 = v2;
          objc_msgSend(v30, "doubleValue");
          v29 = v15 - v3;
        }
        v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v27 = (id)objc_msgSend(v33, "objectForKey:", CFSTR("start"));
        location = (id)objc_msgSend(v33, "objectForKey:", CFSTR("end"));
        if (v27)
        {
          v13 = v28;
          v12 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v27, "floatValue");
          v14 = (id)objc_msgSend(v12, "numberWithFloat:");
          objc_msgSend(v13, "setObject:forKey:");

        }
        if (location)
        {
          v10 = v28;
          v9 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(location, "floatValue");
          v11 = (id)objc_msgSend(v9, "numberWithFloat:");
          objc_msgSend(v10, "setObject:forKey:");

        }
        v7 = v28;
        v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
        objc_msgSend(v7, "setObject:forKey:");

        objc_msgSend(v36, "setObject:forKey:", v28, v35);
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        ++v20;
        if (v18 + 1 >= v21)
        {
          v20 = 0;
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
          if (!v21)
            break;
        }
      }
    }

    v5 = v36;
    v6 = (id)objc_msgSend(v38[0], "samples");
    objc_msgSend(v5, "setObject:forKey:");

    v39 = v36;
    v37 = 1;
    objc_storeStrong(&v36, 0);
  }
  else
  {
    v39 = MEMORY[0x1E0C9AA70];
    v37 = 1;
  }
  objc_storeStrong(v38, 0);
  return v39;
}

+ (void)sampleForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id location[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (v13)
  {
    v10 = (id)objc_msgSend(v13, "samples");
    v11 = (id)objc_msgSend(v10, "objectForKey:", location[0]);

    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    v5 = v11;
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "getTime");
    v8 = (id)objc_msgSend(v3, "numberWithDouble:");
    v15[0] = v8;
    v4 = (void *)MEMORY[0x1E0CB37E8];
    +[AMDPerfContainer getMemoryUsage:logType:timeDelta:](AMDPerfContainer, "getMemoryUsage:logType:timeDelta:", location[0], CFSTR("sample"), 0.0);
    v7 = (id)objc_msgSend(v4, "numberWithFloat:");
    v15[1] = v7;
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    objc_msgSend(v5, "addObject:");

    v9 = (id)objc_msgSend(v13, "samples");
    objc_msgSend(v9, "setObject:forKey:", v11, location[0]);

    objc_storeStrong(&v11, 0);
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

+ (void)log:(id)a3 atLevel:(int)a4
{
  os_log_t oslog;
  int v6;
  id v7;
  int v8;
  id location[3];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v7 = +[AMDPerf getContainer](AMDPerf, "getContainer");
  if (v7)
  {
    if (v8 <= (char)objc_msgSend(v7, "level"))
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
        _os_log_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_INFO, "%@", v10, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v6 = 0;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

@end
