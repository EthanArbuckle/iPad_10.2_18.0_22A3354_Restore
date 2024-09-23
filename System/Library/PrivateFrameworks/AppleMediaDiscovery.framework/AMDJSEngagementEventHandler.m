@implementation AMDJSEngagementEventHandler

+ (id)handleAggregatedEngagementEvent:(id)a3 forEventType:(int64_t)a4 forUserId:(id)a5 andStoreFrontId:(unsigned int)a6 error:(id *)a7
{
  id v7;
  id v8;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *log;
  os_log_type_t v29;
  id v30;
  id v35;
  os_log_t v36;
  id v37;
  id v38;
  os_log_type_t v39;
  os_log_t v40;
  id v41;
  id v42;
  os_log_type_t v43;
  os_log_t oslog;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD __b[8];
  id v50;
  id v51;
  unsigned int v52;
  uint8_t v53[7];
  os_log_type_t type;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  id v60;
  id v61;
  id *v62;
  unsigned int v63;
  id v64;
  int64_t v65;
  id location[2];
  id v67;
  id v68;
  uint8_t v69[16];
  uint8_t v70[16];
  uint8_t v71[24];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v67 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v65 = a4;
  v64 = 0;
  objc_storeStrong(&v64, a5);
  v63 = a6;
  v62 = a7;
  v61 = 0;
  v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65);
  objc_msgSend(v60, "setObject:forKey:");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = 0;
    v56 = 0;
    v30 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", &v56);
    objc_storeStrong(&v58, v56);
    v57 = v30;
    if (v58)
    {
      v55 = MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
      {
        log = v55;
        v29 = type;
        __os_log_helper_16_0_0(v53);
        _os_log_error_impl(&dword_1DC678000, log, v29, "DeviceID fetch failed", v53, 2u);
      }
      objc_storeStrong(&v55, 0);
    }
    v52 = 0;
    v51 = location[0];
    memset(__b, 0, sizeof(__b));
    v26 = v51;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v72, 16);
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
        v50 = *(id *)(__b[1] + 8 * v24);
        v48 = (id)objc_msgSend(v50, "mutableCopy");
        objc_msgSend(v48, "setObject:forKey:", v64, 0x1EA4B9348);
        if (v57)
          objc_msgSend(v48, "setObject:forKey:", v57, 0x1EA4BCEE8);
        if (v65 == 27 || v65 == 23)
        {
          v52 += objc_msgSend(v67, "saveLaunchEvents:error:", v48, v62);
        }
        else if (v65 == 26 || v65 == 22)
        {
          v20 = v48;
          v21 = (id)objc_msgSend(v50, "objectForKey:", CFSTR("installType"));
          objc_msgSend(v20, "setValue:forKey:");

          v52 += +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:", v48, v62);
        }
        else
        {
          v52 += +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:", v48, v62);
        }
        if (*v62 && !v61)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = (id)objc_msgSend(*v62, "localizedDescription");
          v7 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("Error saving an event: %@"), v19);
          v8 = v61;
          v61 = v7;

        }
        *v62 = 0;
        objc_storeStrong(&v48, 0);
        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v72, 16);
          if (!v25)
            break;
        }
      }
    }

    v16 = v60;
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v52);
    objc_msgSend(v16, "setObject:forKey:");

    if (v61)
    {
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v61);
      objc_msgSend(v60, "setObject:forKey:", v61, CFSTR("eventSaveError"));
    }
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v60, CFSTR("saveEvents"), 0);
    if (v65 == 25 || v65 == 21)
    {
      v68 = v60;
      v59 = 1;
    }
    else
    {
      v47 = CFSTR("AppInfomationTPRefresh");
      if (v65 == 26 || v65 == 22 || v65 == 34)
      {
        v46 = +[AMDTasteProfile refreshAppInformationTasteProfile:](AMDTasteProfile, "refreshAppInformationTasteProfile:", v62);
        if (*v62)
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = (id)objc_msgSend(*v62, "localizedDescription");
          v45 = (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("Error generating app-information taste profile: %@"), v15);

          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v43 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v45);
            _os_log_error_impl(&dword_1DC678000, oslog, v43, "%@", v71, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          objc_msgSend(v60, "setObject:forKey:", v45, v47);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v45, v47, 0);
          *v62 = 0;
          objc_storeStrong(&v45, 0);
        }
        else
        {
          objc_msgSend(v60, "setObject:forKey:", v46, v47);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v46, v47, 0);
          if (v65 == 26 || v65 == 22)
            +[AMDTasteProfile refreshCToLMaps](AMDTasteProfile, "refreshCToLMaps");
        }
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v47, CFSTR("refreshedODTPs"));
      v42 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:](AMDTasteProfile, "refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:", CFSTR("apps"), v64, v63, v62);
      if (*v62)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = (id)objc_msgSend(*v62, "localizedDescription");
        v41 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("error refreshing od-tp: %@"), v13);

        v40 = (os_log_t)MEMORY[0x1E0C81028];
        v39 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v41);
          _os_log_error_impl(&dword_1DC678000, v40, v39, "%@", v70, 0xCu);
        }
        objc_storeStrong((id *)&v40, 0);
        objc_msgSend(v60, "setObject:forKey:", v41, v47);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v41, v47, 0);
        *v62 = 0;
        objc_storeStrong(&v41, 0);
      }
      else
      {
        if (v42)
          objc_storeStrong(&v42, v42);
        else
          objc_storeStrong(&v42, MEMORY[0x1E0C9AA70]);
        objc_msgSend(v60, "setObject:forKey:", v42, v47);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v42, v47, 0);
      }
      v38 = +[AMDAppSegment refreshSegmentsForAllTreatmentsForUser:error:](AMDAppSegment, "refreshSegmentsForAllTreatmentsForUser:error:", v64, v62);
      objc_storeStrong(&v47, CFSTR("refreshSegments"));
      if (*v62)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (id)objc_msgSend(*v62, "localizedDescription");
        v37 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("error updating in-app segment data: %@"), v11);

        v36 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v37);
          _os_log_error_impl(&dword_1DC678000, v36, OS_LOG_TYPE_ERROR, "%@", v69, 0xCu);
        }
        objc_storeStrong((id *)&v36, 0);
        objc_msgSend(v60, "setObject:forKey:", v37, v47);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v37, v47, 0);
        *v62 = 0;
        objc_storeStrong(&v37, 0);
      }
      else
      {
        if (v38)
          objc_storeStrong(&v38, v38);
        else
          objc_storeStrong(&v38, MEMORY[0x1E0C9AA70]);
        objc_msgSend(v60, "setObject:forKey:", v38, v47);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v38, v47, 0);
      }
      v68 = v60;
      v59 = 1;
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v47, 0);
    }
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v58, 0);
  }
  else
  {
    objc_storeStrong(&v61, CFSTR("Not a list of events"));
    *v62 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 0, v61);
    objc_msgSend(v60, "setObject:forKey:", v61, CFSTR("eventSaveError"));
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v60, CFSTR("saveEvents"), 0);
    v68 = 0;
    v59 = 1;
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  return v68;
}

+ (id)handleSingleEngagementEvent:(id)a3 forEventType:(int64_t)a4 forUserId:(id)a5 andStoreFrontId:(unsigned int)a6 error:(id *)a7
{
  void *v10;
  id v11;
  id v12;
  id v13[2];
  id location[2];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = (id)a4;
  v13[0] = 0;
  objc_storeStrong(v13, a5);
  v10 = v15;
  v16[0] = location[0];
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (id)objc_msgSend(v10, "handleAggregatedEngagementEvent:forEventType:forUserId:andStoreFrontId:error:");

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return v12;
}

+ (unsigned)saveLaunchEvents:(id)a3 error:(id *)a4
{
  int v4;
  id v5;
  float v6;
  float v7;
  double v8;
  void *v10;
  float v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id obj;
  uint64_t v40;
  id v41;
  _QWORD v42[8];
  uint64_t v43;
  _QWORD v44[8];
  id v45;
  id v46;
  id v47;
  int v48;
  _QWORD v49[8];
  id v50;
  _QWORD __b[8];
  id v52;
  unsigned int v53;
  unsigned int v54;
  id *v55;
  id location[3];
  unsigned int v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = a4;
  *a4 = 0;
  v54 = 0;
  v53 = 0;
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2CA8);
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
  if (v40)
  {
    v35 = *(_QWORD *)__b[2];
    v36 = 0;
    v37 = v40;
    while (1)
    {
      v34 = v36;
      if (*(_QWORD *)__b[2] != v35)
        objc_enumerationMutation(obj);
      v52 = *(id *)(__b[1] + 8 * v36);
      memset(v49, 0, sizeof(v49));
      v32 = (id)objc_msgSend(v52, "allValues");
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v49, v60, 16);
      if (v33)
      {
        v29 = *(_QWORD *)v49[2];
        v30 = 0;
        v31 = v33;
        while (1)
        {
          v28 = v30;
          if (*(_QWORD *)v49[2] != v29)
            objc_enumerationMutation(v32);
          v50 = *(id *)(v49[1] + 8 * v30);
          v4 = objc_msgSend(v50, "unsignedIntValue");
          v53 += v4;
          ++v30;
          if (v28 + 1 >= v31)
          {
            v30 = 0;
            v31 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v49, v60, 16);
            if (!v31)
              break;
          }
        }
      }

      ++v36;
      if (v34 + 1 >= v37)
      {
        v36 = 0;
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
        if (!v37)
          break;
      }
    }
  }

  if (v53)
  {
    v47 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BCEC8);
    v46 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v46, "setNumberStyle:", 1);
    *v55 = 0;
    memset(v44, 0, sizeof(v44));
    v26 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2CA8);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v44, v59, 16);
    if (v27)
    {
      v23 = *(_QWORD *)v44[2];
      v24 = 0;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(_QWORD *)v44[2] != v23)
          objc_enumerationMutation(v26);
        v45 = *(id *)(v44[1] + 8 * v24);
        memset(v42, 0, sizeof(v42));
        v20 = v45;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v42, v58, 16);
        if (v21)
        {
          v17 = *(_QWORD *)v42[2];
          v18 = 0;
          v19 = v21;
          while (1)
          {
            v16 = v18;
            if (*(_QWORD *)v42[2] != v17)
              objc_enumerationMutation(v20);
            v43 = *(_QWORD *)(v42[1] + 8 * v18);
            v14 = location[0];
            v15 = (id)objc_msgSend(v46, "numberFromString:", v43);
            objc_msgSend(v14, "setValue:forKey:");

            v41 = (id)objc_msgSend(v45, "valueForKey:", v43);
            objc_msgSend(location[0], "setValue:forKey:", v41, 0x1EA4BCF08);
            if (v47)
            {
              v12 = location[0];
              v10 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v47, "floatValue");
              v11 = v6;
              objc_msgSend(v41, "floatValue");
              *(float *)&v8 = v11 * (float)(v7 / (float)v53);
              v13 = (id)objc_msgSend(v10, "numberWithFloat:", v8);
              objc_msgSend(v12, "setValue:forKey:");

            }
            +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:", location[0], v55);
            if (*v55)
            {
              v48 = 9;
            }
            else
            {
              ++v54;
              v48 = 0;
            }
            objc_storeStrong(&v41, 0);
            ++v18;
            if (v16 + 1 >= v19)
            {
              v18 = 0;
              v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v42, v58, 16);
              if (!v19)
                break;
            }
          }
        }

        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v44, v59, 16);
          if (!v25)
            break;
        }
      }
    }

    v57 = v54;
    v48 = 1;
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 0, CFSTR("total launch duration is zero"));
    *v55 = v5;
    v57 = 0;
    v48 = 1;
  }
  objc_storeStrong(location, 0);
  return v57;
}

@end
