@implementation AMDJSSync

+ (id)dailyDataUpdate:(id)a3 forStoreFrontId:(unsigned int)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id obj;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  os_log_t v42;
  id v43;
  os_log_type_t v44;
  os_log_t v45;
  id v46;
  os_log_type_t v47;
  os_log_t oslog;
  id v49;
  id v50;
  _QWORD __b[8];
  id v52;
  id v53;
  os_log_type_t v54;
  id v55;
  id v56;
  os_log_type_t v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  os_log_type_t type;
  id v63;
  int v64;
  id v65;
  id v66;
  id v67;
  uint64_t *v68;
  unsigned int v69;
  id location[2];
  id v71;
  id v72;
  const __CFString *v73;
  id v74;
  uint8_t v75[16];
  uint8_t v76[16];
  uint8_t v77[32];
  _BYTE v78[128];
  uint8_t v79[16];
  uint8_t v80[16];
  uint8_t v81[32];
  _QWORD v82[2];

  v82[1] = *MEMORY[0x1E0C80C00];
  v71 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = a4;
  v68 = (uint64_t *)a5;
  *a5 = 0;
  v67 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8948);
  v66 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("supportedDomains"));
  if (!v66)
  {
    v82[0] = v67;
    v66 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);

  }
  v65 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB448);
  if (v67 && v65)
  {
    v63 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_4_0_8_64((uint64_t)v81, v69, (uint64_t)v65);
      _os_log_impl(&dword_1DC678000, (os_log_t)v63, type, "Running daily data update for store: %u, dsId:%@", v81, 0x12u);
    }
    objc_storeStrong(&v63, 0);
    +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("dailyDataUpdate"));
    v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v60 = 365;
    v39 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2C68);

    if (v39)
    {
      v38 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2C68);
      v60 = objc_msgSend(v38, "unsignedLongLongValue");

    }
    v59 = +[AMDAppEvent deleteAppEventsOlderThan:forEventType:withPlatform:error:](AMDAppEvent, "deleteAppEventsOlderThan:forEventType:withPlatform:error:", v60, 0, 0, v68);
    if (*v68)
    {
      v58 = MEMORY[0x1E0C81028];
      v57 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v80, *v68);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v58, v57, "error deletig events: %@", v80, 0xCu);
      }
      objc_storeStrong(&v58, 0);
      v35 = v61;
      v34 = (void *)MEMORY[0x1E0CB3940];
      v37 = (id)objc_msgSend((id)*v68, "localizedDescription");
      v36 = (id)objc_msgSend(v34, "stringWithFormat:", CFSTR("error: %@"), v37);
      objc_msgSend(v35, "setObject:forKey:");

      *v68 = 0;
    }
    else
    {
      objc_msgSend(v61, "setObject:forKey:", v59, CFSTR("deletedOldEvents"));
    }
    v60 = 30;
    v33 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2F28);

    if (v33)
    {
      v32 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2F28);
      v60 = objc_msgSend(v32, "unsignedLongLongValue");

    }
    v56 = +[AMDAppStoreEvent deleteEventsOlderThan:error:](AMDAppStoreEvent, "deleteEventsOlderThan:error:", v60, v68);
    if (*v68)
    {
      v55 = MEMORY[0x1E0C81028];
      v54 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v79, *v68);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v55, v54, "error deleting appstore events: %@", v79, 0xCu);
      }
      objc_storeStrong(&v55, 0);
      v29 = v61;
      v28 = (void *)MEMORY[0x1E0CB3940];
      v31 = (id)objc_msgSend((id)*v68, "localizedDescription");
      v30 = (id)objc_msgSend(v28, "stringWithFormat:", CFSTR("error: %@"), v31);
      objc_msgSend(v29, "setObject:forKey:");

      *v68 = 0;
    }
    else
    {
      objc_msgSend(v61, "setObject:forKey:", v56, CFSTR("deletedOldAppStoreEvents"));
    }
    v53 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    memset(__b, 0, sizeof(__b));
    obj = v66;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v78, 16);
    if (v27)
    {
      v23 = *(_QWORD *)__b[2];
      v24 = 0;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(_QWORD *)__b[2] != v23)
          objc_enumerationMutation(obj);
        v52 = *(id *)(__b[1] + 8 * v24);
        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("apps")) & 1) != 0)
        {
          v50 = +[AMDTasteProfile refreshAppInformationTasteProfile:](AMDTasteProfile, "refreshAppInformationTasteProfile:", v68);
          if (*v68)
          {
            v19 = v53;
            v18 = (void *)MEMORY[0x1E0CB3940];
            v21 = (id)objc_msgSend((id)*v68, "localizedDescription");
            v20 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("error: %@"), v21);
            objc_msgSend(v19, "setObject:forKey:");

            *v68 = 0;
          }
          else
          {
            objc_msgSend(v53, "setObject:forKey:", v50, CFSTR("appInformationTPRefresh"));
          }
          objc_storeStrong(&v50, 0);
        }
        v49 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:](AMDTasteProfile, "refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:", v52, v65, v69, v68);
        if (*v68)
        {
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v47 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v17 = oslog;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, *v68, (uint64_t)v52);
            _os_log_error_impl(&dword_1DC678000, v17, v47, "error refreshing on-device taste profile: %@ for domain: %@", v77, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v14 = v53;
          v13 = (void *)MEMORY[0x1E0CB3940];
          v16 = (id)objc_msgSend((id)*v68, "localizedDescription");
          v15 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("error: %@"), v16);
          objc_msgSend(v14, "setObject:forKey:");

          *v68 = 0;
        }
        else
        {
          objc_msgSend(v53, "setObject:forKey:", v49, v52);
        }
        objc_storeStrong(&v49, 0);
        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v78, 16);
          if (!v25)
            break;
        }
      }
    }

    objc_msgSend(v61, "setObject:forKey:", v53, CFSTR("savedAggregatedTPFeatures"));
    v46 = +[AMDAppSegment refreshSegmentsForAllTreatmentsForUser:error:](AMDAppSegment, "refreshSegmentsForAllTreatmentsForUser:error:", v65, v68);
    if (*v68)
    {
      v45 = (os_log_t)MEMORY[0x1E0C81028];
      v44 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v12 = (id)objc_msgSend((id)*v68, "localizedDescription");
        __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v12);
        _os_log_error_impl(&dword_1DC678000, v45, v44, "error updating in-app segment data: %@", v76, 0xCu);

      }
      objc_storeStrong((id *)&v45, 0);
      v9 = v61;
      v8 = (void *)MEMORY[0x1E0CB3940];
      v11 = (id)objc_msgSend((id)*v68, "localizedDescription");
      v10 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("error: %@"), v11);
      objc_msgSend(v9, "setObject:forKey:");

      *v68 = 0;
    }
    else
    {
      if (v46)
        objc_storeStrong(&v46, v46);
      else
        objc_storeStrong(&v46, MEMORY[0x1E0C9AA70]);
      objc_msgSend(v61, "setObject:forKey:", v46, CFSTR("refreshSegments"));
    }
    objc_msgSend(v71, "updateArcadeUsageFeature:", v68);
    if (*v68)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (id)objc_msgSend((id)*v68, "localizedDescription");
      v43 = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Arcade Usage feature could not be updated. Error: %@"), v7);

      v42 = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v43);
        _os_log_error_impl(&dword_1DC678000, v42, OS_LOG_TYPE_ERROR, "%@", v75, 0xCu);
      }
      objc_storeStrong((id *)&v42, 0);
      objc_msgSend(v61, "setObject:forKey:", v43, CFSTR("arcadeUsageUpdateError"));
      objc_storeStrong(&v43, 0);
    }
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("dailyDataUpdate"));
    *v68 = 0;
    v73 = CFSTR("summary");
    v74 = v61;
    v72 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v64 = 1;
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v61, 0);
  }
  else
  {
    *v68 = (uint64_t)+[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("domain or userId missing"));
    v72 = 0;
    v64 = 1;
  }
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(location, 0);
  return v72;
}

+ (id)runSyncForUnsignedUser:(id)a3 withCallUUID:(id)a4 error:(id *)a5
{
  int v8;
  id v9;
  id v10;
  id v11;
  id *v12;
  id v13;
  id location[2];
  id v15;
  id v16;

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AMDMiscHelpers setAppStoreDirAttributes](AMDMiscHelpers, "setAppStoreDirAttributes");
  v10 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C33C8);
  if (!v10)
  {
    objc_msgSend(v11, "setObject:forKey:", CFSTR("Missing schema"), CFSTR("applySchema"));
LABEL_7:
    v16 = v11;
    goto LABEL_8;
  }
  v9 = (id)objc_msgSend(v15, "updateAMDSQLSchema:error:", v10, v12);
  if (*v12)
  {
    v16 = 0;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("sqlSchemaUpdateSummary"));
    v8 = 0;
  }
  objc_storeStrong(&v9, 0);
  if (!v8)
    goto LABEL_7;
LABEL_8:
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)runSync:(id)a3 withCallUUID:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  os_log_t v45;
  id v46;
  id v47;
  id v48;
  os_log_type_t v49;
  os_log_t v50;
  __CFString *v51;
  os_log_type_t v52;
  os_log_t v53;
  __CFString *v54;
  os_log_type_t v55;
  os_log_t oslog;
  id v57;
  id v58;
  id v59;
  os_log_type_t v60;
  id v61;
  __CFString *v62;
  os_log_type_t v63;
  id v64;
  id v65;
  id v66;
  uint8_t v67[15];
  os_log_type_t v68;
  id v69;
  id v70;
  _QWORD __b[8];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  os_log_type_t type;
  id v78;
  id v79;
  id v80;
  int v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id *v88;
  id v89;
  id location[2];
  id v91;
  id v92;
  const __CFString *v93;
  id v94;
  uint8_t v95[16];
  uint8_t v96[16];
  const __CFString *v97;
  __CFString *v98;
  uint8_t v99[16];
  const __CFString *v100;
  id v101;
  uint8_t v102[16];
  const __CFString *v103;
  __CFString *v104;
  uint8_t v105[16];
  const __CFString *v106;
  id v107;
  uint8_t v108[16];
  _BYTE v109[128];
  const __CFString *v110;
  id v111;
  uint8_t v112[24];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v91 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v89 = 0;
  objc_storeStrong(&v89, a4);
  v88 = a5;
  v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AMDMiscHelpers setAppStoreDirAttributes](AMDMiscHelpers, "setAppStoreDirAttributes");
  v86 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C33C8);
  if (v86)
  {
    v85 = 0;
    v83 = 0;
    v42 = (id)objc_msgSend(v91, "updateAMDSQLSchema:error:", v86, &v83);
    objc_storeStrong(&v85, v83);
    v84 = v42;
    if (v85)
    {
      v40 = v87;
      v41 = (id)objc_msgSend(v85, "localizedDescription");
      objc_msgSend(v40, "setObject:forKey:");

    }
    else if (v84)
    {
      objc_msgSend(v87, "setObject:forKey:", v84, CFSTR("sqlSchemaUpdateSummary"));
    }
    objc_storeStrong(&v84, 0);
    objc_storeStrong(&v85, 0);
  }
  else
  {
    objc_msgSend(v87, "setObject:forKey:", CFSTR("No schema"), CFSTR("dailyDataUpdate"));
  }
  v39 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C3368);
  v82 = (id)objc_msgSend(v39, "mutableCopy");

  if (v82)
  {
    v80 = +[AMDJSConfigProcessor processConfig:withCallUUID:error:](AMDJSConfigProcessor, "processConfig:withCallUUID:error:", v82, v89, v88);
    if (*v88)
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = (id)objc_msgSend(*v88, "localizedDescription");
      v79 = (id)objc_msgSend(v37, "stringWithFormat:", CFSTR("Error processing config: %@"), v38);

      v78 = MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v112, (uint64_t)v79);
        _os_log_impl(&dword_1DC678000, (os_log_t)v78, type, "%@", v112, 0xCu);
      }
      objc_storeStrong(&v78, 0);
      v35 = v87;
      v110 = CFSTR("error");
      v111 = v79;
      v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
      objc_msgSend(v35, "setObject:forKey:");

      *v88 = 0;
      objc_storeStrong(&v79, 0);
    }
    else
    {
      objc_msgSend(v87, "setObject:forKey:", v80, CFSTR("processConfig"));
    }
    v76 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C33A8);
    v75 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C3388);
    if (v75)
    {
      v74 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = v75;
        memset(__b, 0, sizeof(__b));
        v33 = v73;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v109, 16);
        if (v34)
        {
          v30 = *(_QWORD *)__b[2];
          v31 = 0;
          v32 = v34;
          while (1)
          {
            v29 = v31;
            if (*(_QWORD *)__b[2] != v30)
              objc_enumerationMutation(v33);
            v72 = *(id *)(__b[1] + 8 * v31);
            v70 = (id)objc_msgSend(v72, "objectForKey:", 0x1EA4B8948);
            if (v70)
            {
              v66 = +[AMDTasteProfile refreshServerTasteProfile:error:](AMDTasteProfile, "refreshServerTasteProfile:error:", v72, v88);
              if (*v88)
              {
                v25 = (void *)MEMORY[0x1E0CB3940];
                v26 = (id)objc_msgSend(*v88, "localizedDescription");
                v65 = (id)objc_msgSend(v25, "stringWithFormat:", CFSTR("Error refreshing server TP: %@"), v26);

                v64 = MEMORY[0x1E0C81028];
                v63 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_INFO))
                {
                  v24 = v64;
                  __os_log_helper_16_2_1_8_64((uint64_t)v108, (uint64_t)v65);
                  _os_log_impl(&dword_1DC678000, v24, v63, "%@", v108, 0xCu);
                }
                objc_storeStrong(&v64, 0);
                v22 = v74;
                v106 = CFSTR("error");
                v107 = v65;
                v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
                objc_msgSend(v22, "setObject:forKey:");

                *v88 = 0;
                objc_storeStrong(&v65, 0);
              }
              else
              {
                objc_msgSend(v74, "setObject:forKey:", v66, v70);
              }
              objc_storeStrong(&v66, 0);
              v81 = 0;
            }
            else
            {
              v69 = MEMORY[0x1E0C81028];
              v68 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
              {
                v27 = v69;
                v28 = v68;
                __os_log_helper_16_0_0(v67);
                _os_log_error_impl(&dword_1DC678000, v27, v28, "Domain missing in Server TP payload", v67, 2u);
              }
              objc_storeStrong(&v69, 0);
              v81 = 3;
            }
            objc_storeStrong(&v70, 0);
            ++v31;
            if (v29 + 1 >= v32)
            {
              v31 = 0;
              v32 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v109, 16);
              if (!v32)
                break;
            }
          }
        }

        objc_msgSend(v87, "setObject:forKey:", v74, CFSTR("refreshServerTP"));
        objc_storeStrong(&v73, 0);
      }
      else
      {
        v62 = CFSTR("Server TP payload data is not an array");
        v61 = MEMORY[0x1E0C81028];
        v60 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v105, (uint64_t)v62);
          _os_log_impl(&dword_1DC678000, (os_log_t)v61, v60, "%@", v105, 0xCu);
        }
        objc_storeStrong(&v61, 0);
        v20 = v87;
        v103 = CFSTR("error");
        v104 = v62;
        v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        objc_msgSend(v20, "setObject:forKey:");

        objc_storeStrong((id *)&v62, 0);
      }
      objc_storeStrong(&v74, 0);
    }
    else if (v76)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = v76;
        v58 = +[AMDTasteProfile refreshServerTasteProfile:error:](AMDTasteProfile, "refreshServerTasteProfile:error:", v59, v88);
        if (*v88)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = (id)objc_msgSend(*v88, "localizedDescription");
          v57 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("Error refreshing server TP: %@"), v19);

          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v55 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v102, (uint64_t)v57);
            _os_log_impl(&dword_1DC678000, oslog, v55, "%@", v102, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v16 = v87;
          v100 = CFSTR("error");
          v101 = v57;
          v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
          objc_msgSend(v16, "setObject:forKey:");

          *v88 = 0;
          objc_storeStrong(&v57, 0);
        }
        else
        {
          objc_msgSend(v87, "setObject:forKey:", v58, CFSTR("refreshServerTP"));
        }
        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
      }
      else
      {
        v54 = CFSTR("Server TP payload is not a dictionary");
        v53 = (os_log_t)MEMORY[0x1E0C81028];
        v52 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v99, (uint64_t)v54);
          _os_log_impl(&dword_1DC678000, v53, v52, "%@", v99, 0xCu);
        }
        objc_storeStrong((id *)&v53, 0);
        v14 = v87;
        v97 = CFSTR("error");
        v98 = v54;
        v15 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        objc_msgSend(v14, "setObject:forKey:");

        objc_storeStrong((id *)&v54, 0);
      }
    }
    else
    {
      v51 = CFSTR("Server taste profile absent in Sync payload");
      v50 = (os_log_t)MEMORY[0x1E0C81028];
      v49 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v96, (uint64_t)v51);
        _os_log_error_impl(&dword_1DC678000, v50, v49, "%@", v96, 0xCu);
      }
      objc_storeStrong((id *)&v50, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v51, CFSTR("ServerTasteProfileStatus"), 0);
      objc_storeStrong((id *)&v51, 0);
    }
    v48 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2E28);
    if (v48)
    {
      v12 = v91;
      v13 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB468);
      v47 = (id)objc_msgSend(v12, "dailyDataUpdate:forStoreFrontId:error:", v48, objc_msgSend(v13, "intValue"), v88);

      if (*v88)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (id)objc_msgSend(*v88, "localizedDescription");
        v46 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("Error performing daily data update: %@"), v11);

        v45 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v95, (uint64_t)v46);
          _os_log_impl(&dword_1DC678000, v45, OS_LOG_TYPE_INFO, "%@", v95, 0xCu);
        }
        objc_storeStrong((id *)&v45, 0);
        v8 = v87;
        v93 = CFSTR("error");
        v94 = v46;
        v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        objc_msgSend(v8, "setObject:forKey:");

        *v88 = 0;
        objc_storeStrong(&v46, 0);
      }
      else
      {
        objc_msgSend(v87, "setObject:forKey:", v47, CFSTR("dailyDataUpdate"));
      }
      v6 = v87;
      v7 = +[AMDSQLite updateData:](AMDSQLite, "updateData:", location[0]);
      objc_msgSend(v6, "setObject:forKey:");

      objc_storeStrong(&v47, 0);
    }
    else
    {
      objc_msgSend(v87, "setObject:forKey:", &unk_1EA4D1960, CFSTR("dailyDataUpdate"));
    }
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v87, CFSTR("syncSummary"), 0);
    v92 = v87;
    v81 = 1;
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v75, 0);
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v80, 0);
  }
  else
  {
    objc_msgSend(v87, "setObject:forKey:", CFSTR("Missing config"), CFSTR("processConfig"));
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v87, CFSTR("syncSummary"), 0);
    v92 = v87;
    v81 = 1;
  }
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(location, 0);
  return v92;
}

+ (void)updateArcadeUsageFeature:(id *)a3
{
  id v3;
  id v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  __CFString *v14;
  int v15;
  id location;
  id v17;
  _QWORD __b[8];
  id v19;
  id v20;
  id v21;
  char v22;
  id *v23;
  SEL v24;
  id v25;
  const __CFString *v26;
  __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v24 = a2;
  v23 = a3;
  v22 = 0;
  v21 = 0;
  v20 = +[AMDTasteProfile getPurchasedArcadeGamesSet:](AMDTasteProfile, "getPurchasedArcadeGamesSet:", a3);
  if (!*v23)
  {
    v3 = +[AMDAppEvent fetchEvents:](AMDAppEvent, "fetchEvents:", v23);
    v4 = v21;
    v21 = v3;

  }
  if (!*v23 && v20 && objc_msgSend(v20, "count") && v21 && objc_msgSend(v21, "count"))
  {
    memset(__b, 0, sizeof(__b));
    obj = v21;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
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
        v19 = *(id *)(__b[1] + 8 * v9);
        v17 = (id)objc_msgSend(v19, "objectForKey:", CFSTR("type"));
        location = (id)objc_msgSend(v19, "objectForKey:", 0x1EA4B91E8);
        if (objc_msgSend(v17, "intValue") == 3
          && (objc_msgSend(v20, "containsObject:", location) & 1) != 0)
        {
          v22 = 1;
          v15 = 2;
        }
        else
        {
          v15 = 0;
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v17, 0);
        if (v15)
          break;
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v10)
            goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      v15 = 0;
    }

  }
  if ((v22 & 1) != 0)
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v14 = v5;
  v26 = CFSTR("contains_arcade_plays");
  v27 = v14;
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v6 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v13, CFSTR("apps"), 0x1EA4C2528, v23);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
}

+ (id)updateAMDSQLSchema:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  id v8;
  id *v9;
  id location[3];
  id v11;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if (objc_msgSend(v8, "getDb"))
  {
    v6 = (id)objc_msgSend(v8, "updateSchema:error:", location[0], v9);
    if (*v9)
      v11 = 0;
    else
      v11 = v6;
    v7 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    *v9 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, CFSTR("SQL Database is not usable"));
    v11 = 0;
    v7 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11;
}

@end
