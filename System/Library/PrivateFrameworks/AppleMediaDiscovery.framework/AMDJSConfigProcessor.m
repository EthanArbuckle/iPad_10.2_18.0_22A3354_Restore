@implementation AMDJSConfigProcessor

+ (id)processConfig:(id)a3 withCallUUID:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  os_log_type_t v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  NSObject *v36;
  os_log_type_t v37;
  NSObject *v38;
  os_log_type_t v39;
  NSObject *log;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  const __CFString *v48;
  id v51;
  id v52;
  os_log_type_t v53;
  os_log_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  os_log_type_t v65;
  os_log_t v66;
  __CFString *v67;
  id v68;
  id v69;
  os_log_type_t v70;
  os_log_t v71;
  __CFString *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  os_log_type_t v77;
  os_log_t v78;
  os_log_type_t v79;
  os_log_t v80;
  id v81;
  id v82;
  os_log_type_t v83;
  os_log_t v84;
  __CFString *v85;
  uint8_t v86[7];
  os_log_type_t v87;
  os_log_t v88;
  uint8_t v89[15];
  os_log_type_t v90;
  os_log_t v91;
  id v92;
  os_log_type_t v93;
  os_log_t v94;
  id v95;
  id v96;
  os_log_type_t v97;
  os_log_t v98;
  __CFString *v99;
  id v100;
  int v101;
  os_log_type_t v102;
  os_log_t v103;
  __CFString *v104;
  int64_t v105;
  id v106;
  id v107;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id *v116;
  id v117;
  id location[2];
  id v119;
  _QWORD v120[3];
  _QWORD v121[3];
  uint8_t v122[32];
  uint8_t v123[32];
  uint8_t v124[32];
  uint8_t v125[32];
  uint8_t v126[32];
  uint8_t v127[32];
  uint8_t v128[32];
  uint8_t v129[32];
  uint8_t v130[32];
  uint8_t v131[24];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v119 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v117 = 0;
  objc_storeStrong(&v117, a4);
  v116 = a5;
  v115 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v114 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v113 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v112 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("version"));
  if (v112)
    v48 = (const __CFString *)v112;
  else
    v48 = CFSTR("-1");
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v48, CFSTR("configVersion"));
  memset(__b, 0, sizeof(__b));
  v46 = location[0];
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", __b, v132, 16);
  if (v47)
  {
    v43 = *(_QWORD *)__b[2];
    v44 = 0;
    v45 = v47;
    while (1)
    {
      v42 = v44;
      if (*(_QWORD *)__b[2] != v43)
        objc_enumerationMutation(v46);
      v111 = *(_QWORD *)(__b[1] + 8 * v44);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        v41 = type;
        __os_log_helper_16_2_1_8_64((uint64_t)v131, v111);
        _os_log_impl(&dword_1DC678000, log, v41, "Processing config for domain '%@'", v131, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v107 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v106 = CFSTR("error");
      v105 = 0;
      v105 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v111);
      if (v105)
      {
        v100 = (id)objc_msgSend(location[0], "objectForKey:", v111);
        if (v100)
        {
          v96 = (id)objc_msgSend(v119, "validateConfig:forDomain:", v100, v111);
          if (v96)
          {
            v95 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad config: %@"), v96);
            v94 = (os_log_t)MEMORY[0x1E0C81028];
            v93 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            {
              v34 = v94;
              v35 = v93;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v128, v111, (uint64_t)v95);
              _os_log_error_impl(&dword_1DC678000, v34, v35, "%@: %@", v128, 0x16u);
            }
            objc_storeStrong((id *)&v94, 0);
            objc_msgSend(v107, "setObject:forKey:", v95, v106);
            v101 = 3;
            objc_storeStrong(&v95, 0);
          }
          else
          {
            v92 = (id)objc_msgSend(v100, "objectForKey:", 0x1EA4C2D48);
            if (!v92 || !objc_msgSend(v92, "count"))
            {
              v91 = (os_log_t)MEMORY[0x1E0C81028];
              v90 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                v32 = v91;
                v33 = v90;
                __os_log_helper_16_0_0(v89);
                _os_log_impl(&dword_1DC678000, v32, v33, "V3 model url bag not present or is empty", v89, 2u);
              }
              objc_storeStrong((id *)&v91, 0);
              v5 = (id)objc_msgSend(v100, "objectForKey:", 0x1EA4C2D28);
              v6 = v92;
              v92 = v5;

              if (!v92 || !objc_msgSend(v92, "count"))
              {
                v88 = (os_log_t)MEMORY[0x1E0C81028];
                v87 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                {
                  v30 = v88;
                  v31 = v87;
                  __os_log_helper_16_0_0(v86);
                  _os_log_impl(&dword_1DC678000, v30, v31, "V2 model url bag not present or is empty", v86, 2u);
                }
                objc_storeStrong((id *)&v88, 0);
                v7 = (id)objc_msgSend(v100, "objectForKey:", 0x1EA4C2D08);
                v8 = v92;
                v92 = v7;

              }
            }
            if (v92)
            {
              v82 = (id)objc_msgSend(v100, "objectForKey:", 0x1EA4C2C08);
              if (!v82)
              {
                v81 = CFSTR("No coldstart urls");
                v80 = (os_log_t)MEMORY[0x1E0C81028];
                v79 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  v26 = v80;
                  v27 = v79;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v126, v111, (uint64_t)v81);
                  _os_log_error_impl(&dword_1DC678000, v26, v27, "%@: %@", v126, 0x16u);
                }
                objc_storeStrong((id *)&v80, 0);
                objc_storeStrong(&v81, 0);
              }
              v78 = (os_log_t)MEMORY[0x1E0C81028];
              v77 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                v23 = v78;
                v24 = v77;
                v22 = objc_msgSend(v92, "count");
                v25 = (id)objc_msgSend(v92, "allKeys");
                v76 = v25;
                __os_log_helper_16_2_2_8_0_8_64((uint64_t)v125, v22, (uint64_t)v76);
                _os_log_debug_impl(&dword_1DC678000, v23, v24, "ModelIds in config (%lu): %@", v125, 0x16u);

                objc_storeStrong(&v76, 0);
              }
              objc_storeStrong((id *)&v78, 0);
              v75 = 0;
              v73 = 0;
              v21 = +[AMDWorkflow performWorkflowCleanupForDomain:error:](AMDWorkflow, "performWorkflowCleanupForDomain:error:", v105, &v73);
              objc_storeStrong(&v75, v73);
              v74 = v21;
              if (v75)
              {
                v72 = CFSTR("Error performing treatment workflow cleanup");
                v71 = (os_log_t)MEMORY[0x1E0C81028];
                v70 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  v19 = v71;
                  v20 = v70;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v124, v111, (uint64_t)v72);
                  _os_log_error_impl(&dword_1DC678000, v19, v20, "%@: %@", v124, 0x16u);
                }
                objc_storeStrong((id *)&v71, 0);
                objc_msgSend(v107, "setObject:forKey:", v72, CFSTR("treatmentWorkflowCleanupError"));
                objc_storeStrong((id *)&v72, 0);
              }
              if (v74)
                objc_msgSend(v107, "setObject:forKey:", v74, CFSTR("treatmentWorkflowsDeleted"));
              else
                objc_msgSend(v107, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("treatmentWorkflowsDeleted"));
              v17 = v107;
              v18 = (id)objc_msgSend(v119, "refreshDescriptors:forDomain:", v100, v111);
              objc_msgSend(v17, "setObject:forKey:");

              v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v68 = (id)objc_msgSend(v119, "saveInAppSegmentsWorkflow:inDomain:withCallUUID:andSummaryContainer:", v100, v111, v117, v69);
              objc_msgSend(v107, "setObject:forKey:", v69, 0x1EA4C3648);
              if (objc_msgSend(v68, "count"))
              {
                v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v62 = +[AMDModel getCurrentModelInfoByModelId](AMDModel, "getCurrentModelInfoByModelId");
                v61 = (id)objc_msgSend(v119, "getModelsToFetch:withCurrentModelInfo:andAMDModlsToDelete:andSummaryContainer:", v92, v62, v63, v64);
                v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v58 = +[AMDColdstartURL getCurrentURLInfoByModelId](AMDColdstartURL, "getCurrentURLInfoByModelId");
                v57 = (id)objc_msgSend(v119, "getBinariesToFetch:withCurrentColdstartInfo:andAMDColdstartBinariesToDelete:andSummaryContainer:", v82, v58, v59, v60);
                v56 = (id)objc_msgSend(v119, "saveInFlightWorkflows:forModels:inDomain:withCallUUID:error:", v68, v61, v111, v117, v116);
                if (*v116)
                {
                  v13 = (void *)MEMORY[0x1E0CB3940];
                  v14 = (id)objc_msgSend(*v116, "localizedDescription");
                  v55 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("Error saving in-flight workflows: %@"), v14);

                  v54 = (os_log_t)MEMORY[0x1E0C81028];
                  v53 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    v11 = v54;
                    v12 = v53;
                    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v122, v111, (uint64_t)v55);
                    _os_log_error_impl(&dword_1DC678000, v11, v12, "%@: %@", v122, 0x16u);
                  }
                  objc_storeStrong((id *)&v54, 0);
                  objc_msgSend(v107, "setObject:forKey:", v55, v106);
                  *v116 = 0;
                  v101 = 3;
                  objc_storeStrong(&v55, 0);
                }
                else
                {
                  v52 = +[AMDModelDownloader removeOldModels:](AMDModelDownloader, "removeOldModels:", v63);
                  v51 = +[AMDModelDownloader removeOldColdstartBinaries:](AMDModelDownloader, "removeOldColdstartBinaries:", v59);
                  objc_msgSend(v107, "setObject:forKey:", v52, 0x1EA4BE6C8);
                  objc_msgSend(v107, "setObject:forKey:", v51, 0x1EA4C35A8);
                  objc_msgSend(v107, "setObject:forKey:", v56, 0x1EA4C35E8);
                  objc_msgSend(v107, "setObject:forKey:", v64, 0x1EA4C3628);
                  objc_msgSend(v115, "setObject:forKey:", v107, 0x1EA4C3608);
                  objc_msgSend(v114, "setObject:forKey:", v61, v111);
                  objc_msgSend(v113, "setObject:forKey:", v57, v111);
                  objc_storeStrong(&v51, 0);
                  objc_storeStrong(&v52, 0);
                  v101 = 0;
                }
                objc_storeStrong(&v56, 0);
                objc_storeStrong(&v57, 0);
                objc_storeStrong(&v58, 0);
                objc_storeStrong(&v59, 0);
                objc_storeStrong(&v60, 0);
                objc_storeStrong(&v61, 0);
                objc_storeStrong(&v62, 0);
                objc_storeStrong(&v63, 0);
                objc_storeStrong(&v64, 0);
              }
              else
              {
                v67 = CFSTR("No inference workflows");
                v66 = (os_log_t)MEMORY[0x1E0C81028];
                v65 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  v15 = v66;
                  v16 = v65;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v123, v111, (uint64_t)v67);
                  _os_log_error_impl(&dword_1DC678000, v15, v16, "%@: %@", v123, 0x16u);
                }
                objc_storeStrong((id *)&v66, 0);
                objc_msgSend(v107, "setObject:forKey:", v67, v106);
                v101 = 3;
                objc_storeStrong((id *)&v67, 0);
              }
              objc_storeStrong(&v68, 0);
              objc_storeStrong(&v69, 0);
              objc_storeStrong(&v74, 0);
              objc_storeStrong(&v75, 0);
              objc_storeStrong(&v82, 0);
            }
            else
            {
              v85 = CFSTR("No model urls");
              v84 = (os_log_t)MEMORY[0x1E0C81028];
              v83 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                v28 = v84;
                v29 = v83;
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v127, v111, (uint64_t)v85);
                _os_log_error_impl(&dword_1DC678000, v28, v29, "%@: %@", v127, 0x16u);
              }
              objc_storeStrong((id *)&v84, 0);
              objc_msgSend(v107, "setObject:forKey:", v85, v106);
              v101 = 3;
              objc_storeStrong((id *)&v85, 0);
            }
            objc_storeStrong(&v92, 0);
          }
          objc_storeStrong(&v96, 0);
        }
        else
        {
          v99 = CFSTR("No config");
          v98 = (os_log_t)MEMORY[0x1E0C81028];
          v97 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            v36 = v98;
            v37 = v97;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v129, v111, (uint64_t)v99);
            _os_log_error_impl(&dword_1DC678000, v36, v37, "%@: %@", v129, 0x16u);
          }
          objc_storeStrong((id *)&v98, 0);
          objc_msgSend(v107, "setObject:forKey:", v99, v106);
          v101 = 3;
          objc_storeStrong((id *)&v99, 0);
        }
        objc_storeStrong(&v100, 0);
      }
      else
      {
        v104 = CFSTR("Invalid domain");
        v103 = (os_log_t)MEMORY[0x1E0C81028];
        v102 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          v38 = v103;
          v39 = v102;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v130, v111, (uint64_t)v104);
          _os_log_error_impl(&dword_1DC678000, v38, v39, "%@: %@", v130, 0x16u);
        }
        objc_storeStrong((id *)&v103, 0);
        objc_msgSend(v107, "setObject:forKey:", v104, v106);
        v101 = 3;
        objc_storeStrong((id *)&v104, 0);
      }
      objc_storeStrong(&v106, 0);
      objc_storeStrong(&v107, 0);
      ++v44;
      if (v42 + 1 >= v45)
      {
        v44 = 0;
        v45 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", __b, v132, 16);
        if (!v45)
          break;
      }
    }
  }

  v120[0] = CFSTR("summary");
  v121[0] = v115;
  v120[1] = CFSTR("modelDownloadInfo");
  v121[1] = v114;
  v120[2] = CFSTR("coldstartBinaryDownloadInfo");
  v121[2] = v113;
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 3);
  v101 = 1;
  objc_storeStrong(&v112, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)refreshDescriptors:(id)a3 forDomain:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  os_log_type_t v14;
  os_log_t v15;
  os_log_type_t v16;
  os_log_t oslog;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  os_log_type_t v23;
  id v24;
  id v25;
  id location[3];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t v29[16];
  const __CFString *v30;
  id v31;
  uint8_t v32[32];
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = MEMORY[0x1E0C81028];
  v23 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v25);
    _os_log_impl(&dword_1DC678000, (os_log_t)v24, v23, "Refreshing aggregation descriptors for domain '%@'", v33, 0xCu);
  }
  objc_storeStrong(&v24, 0);
  v22 = 0;
  v21 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2BA8);
  v20 = 0;
  if (v21)
  {
    v19 = v20;
    v10 = +[AMDDescriptor refreshDescriptors:forDomain:error:](AMDDescriptor, "refreshDescriptors:forDomain:error:", v21, +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v25), &v19);
    objc_storeStrong(&v20, v19);
    v4 = v22;
    v22 = v10;

    if (v20)
    {
      v18 = (id)objc_msgSend(v20, "localizedDescription");
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v16 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v32, (uint64_t)v25, (uint64_t)v18);
        _os_log_impl(&dword_1DC678000, oslog, v16, "Error saving descriptors for domain '%@': %@", v32, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v30 = CFSTR("error");
      v31 = v18;
      v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v6 = v22;
      v22 = v5;

      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    v15 = (os_log_t)MEMORY[0x1E0C81028];
    v14 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v25);
      _os_log_impl(&dword_1DC678000, v15, v14, "No descriptors for domain '%@'", v29, 0xCu);
    }
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v22, &unk_1EA4D0E48);
  }
  v12 = v20;
  v8 = +[AMDFetchDescriptor refreshAggregationDescriptors:forDomain:error:](AMDFetchDescriptor, "refreshAggregationDescriptors:forDomain:error:", location[0], v25, &v12);
  objc_storeStrong(&v20, v12);
  v13 = v8;
  v27[0] = CFSTR("coreData");
  v28[0] = v22;
  v27[1] = CFSTR("SQLite");
  v28[1] = v8;
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)validateConfig:(id)a3 forDomain:(id)a4
{
  os_log_t oslog;
  id v7;
  id location[3];
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v7);
    _os_log_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_INFO, "Validating config for domain '%@'", v9, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return 0;
}

+ (id)saveInAppSegmentsWorkflow:(id)a3 inDomain:(id)a4 withCallUUID:(id)a5 andSummaryContainer:(id)a6
{
  int64_t v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  __CFString *v20;
  NSObject *v21;
  os_log_type_t v22;
  id v23;
  id v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  id v36;
  _QWORD v37[8];
  uint64_t v38;
  uint8_t v39[15];
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  uint8_t v43[15];
  os_log_type_t v44;
  os_log_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  os_log_type_t v50;
  os_log_t v51;
  id v52;
  id v53;
  id v54;
  _QWORD __b[8];
  id v56;
  id v57;
  int v58;
  os_log_type_t type;
  os_log_t oslog;
  id v61;
  id v62;
  id v63;
  id v64;
  id location[3];
  id v66;
  _BYTE v67[128];
  uint8_t v68[16];
  _BYTE v69[128];
  uint8_t v70[24];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = 0;
  objc_storeStrong(&v64, a4);
  v63 = 0;
  objc_storeStrong(&v63, a5);
  v62 = 0;
  objc_storeStrong(&v62, a6);
  v61 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2E88);
  if (v61 && objc_msgSend(v61, "count"))
  {
    v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v61, "count"));
    memset(__b, 0, sizeof(__b));
    v31 = v61;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v69, 16);
    if (v32)
    {
      v28 = *(_QWORD *)__b[2];
      v29 = 0;
      v30 = v32;
      while (1)
      {
        v27 = v29;
        if (*(_QWORD *)__b[2] != v28)
          objc_enumerationMutation(v31);
        v56 = *(id *)(__b[1] + 8 * v29);
        v54 = (id)objc_msgSend(v56, "mutableCopy");
        v25 = (id)objc_msgSend(v54, "objectForKey:", CFSTR("use_case_id"));
        v26 = objc_msgSend(CFSTR("__segmentAggregator"), "isEqualToString:");

        if ((v26 & 1) != 0)
        {
          objc_msgSend(v54, "setObject:forKey:", 0x1EA4BADA8, CFSTR("model_id"));
          v53 = 0;
          v24 = v54;
          v6 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v64);
          v52 = v53;
          +[AMDWorkflow saveWorkflow:forDomain:withCallUUID:error:](AMDWorkflow, "saveWorkflow:forDomain:withCallUUID:error:", v24, v6, v63, &v52);
          objc_storeStrong(&v53, v52);
          if (v53)
          {
            v51 = (os_log_t)MEMORY[0x1E0C81028];
            v50 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v21 = v51;
              v22 = v50;
              v23 = (id)objc_msgSend(v53, "localizedDescription");
              v49 = v23;
              __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v49);
              _os_log_error_impl(&dword_1DC678000, v21, v22, "Error saving workflow: %@", v68, 0xCu);

              objc_storeStrong(&v49, 0);
            }
            objc_storeStrong((id *)&v51, 0);
            v58 = 3;
          }
          else
          {
            v48 = (id)objc_msgSend(v54, "objectForKey:", CFSTR("treatment_id"));
            if (v48)
              v20 = (__CFString *)v48;
            else
              v20 = CFSTR("__defaultTreatment");
            objc_storeStrong(&v48, v20);
            objc_msgSend(v62, "addObject:", v48);
            v58 = 3;
            objc_storeStrong(&v48, 0);
          }
          objc_storeStrong(&v53, 0);
        }
        else
        {
          v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v46 = (id)objc_msgSend(v54, "objectForKey:", CFSTR("model_id"));
          if (v46)
          {
            objc_msgSend(v47, "addObject:", v46);
            v42 = (id)objc_msgSend(v54, "objectForKey:", CFSTR("secondary_model_id"));
            if (v42)
            {
              v41 = (os_log_t)MEMORY[0x1E0C81028];
              v40 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                v16 = v41;
                v17 = v40;
                __os_log_helper_16_0_0(v39);
                _os_log_impl(&dword_1DC678000, v16, v17, "Secondary model Id available for current workflow", v39, 2u);
              }
              objc_storeStrong((id *)&v41, 0);
              objc_msgSend(v47, "addObject:", v42);
            }
            memset(v37, 0, sizeof(v37));
            v14 = v47;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v37, v67, 16);
            if (v15)
            {
              v11 = *(_QWORD *)v37[2];
              v12 = 0;
              v13 = v15;
              while (1)
              {
                v10 = v12;
                if (*(_QWORD *)v37[2] != v11)
                  objc_enumerationMutation(v14);
                v38 = *(_QWORD *)(v37[1] + 8 * v12);
                v36 = (id)objc_msgSend(v57, "objectForKey:", v38);
                if (!v36)
                {
                  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v8 = v36;
                  v36 = v7;

                }
                objc_msgSend(v36, "addObject:", v54);
                objc_msgSend(v57, "setObject:forKey:", v36, v38);
                objc_storeStrong(&v36, 0);
                ++v12;
                if (v10 + 1 >= v13)
                {
                  v12 = 0;
                  v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v37, v67, 16);
                  if (!v13)
                    break;
                }
              }
            }

            objc_storeStrong(&v42, 0);
            v58 = 0;
          }
          else
          {
            v45 = (os_log_t)MEMORY[0x1E0C81028];
            v44 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v18 = v45;
              v19 = v44;
              __os_log_helper_16_0_0(v43);
              _os_log_error_impl(&dword_1DC678000, v18, v19, "Programmer error: no modelId for workflow", v43, 2u);
            }
            objc_storeStrong((id *)&v45, 0);
            v58 = 3;
          }
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v47, 0);
        }
        objc_storeStrong(&v54, 0);
        ++v29;
        if (v27 + 1 >= v30)
        {
          v29 = 0;
          v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v69, 16);
          if (!v30)
            break;
        }
      }
    }

    v66 = v57;
    v58 = 1;
    objc_storeStrong(&v57, 0);
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v64);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "No workflows for domain '%@'", v70, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v66 = MEMORY[0x1E0C9AA70];
    v58 = 1;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  return v66;
}

+ (id)getModelsToFetch:(id)a3 withCurrentModelInfo:(id)a4 andAMDModlsToDelete:(id)a5 andSummaryContainer:(id)a6
{
  id v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  id v31;
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  id v35;
  id v36;
  NSObject *log;
  os_log_type_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v48;
  uint64_t v49;
  os_log_t v50;
  id v51;
  os_log_type_t v52;
  os_log_t v53;
  os_log_type_t v54;
  os_log_t oslog;
  int v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[8];
  uint64_t v61;
  os_log_type_t v62;
  id v63;
  os_log_type_t v64;
  id v65;
  id v66;
  os_log_type_t v67;
  id v68;
  id v69;
  os_log_type_t type;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD __b[8];
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id location[2];
  id v85;
  uint8_t v86[32];
  uint8_t v87[32];
  uint8_t v88[16];
  _BYTE v89[128];
  uint8_t v90[32];
  _QWORD v91[2];
  _QWORD v92[2];
  uint8_t v93[32];
  uint8_t v94[32];
  _QWORD v95[2];
  _QWORD v96[2];
  uint8_t v97[24];
  _QWORD v98[2];
  _QWORD v99[2];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v85 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v83 = 0;
  objc_storeStrong(&v83, a4);
  v82 = 0;
  objc_storeStrong(&v82, a5);
  v81 = 0;
  objc_storeStrong(&v81, a6);
  v80 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v79 = (id)objc_msgSend(v85, "getUrlsWithVersion:", location[0]);
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  v48 = v79;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", __b, v100, 16);
  if (v49)
  {
    v42 = *(_QWORD *)__b[2];
    v43 = 0;
    v44 = v49;
    while (1)
    {
      v41 = v43;
      if (*(_QWORD *)__b[2] != v42)
        objc_enumerationMutation(v48);
      v77 = *(_QWORD *)(__b[1] + 8 * v43);
      v75 = (id)objc_msgSend(v79, "objectForKey:", v77);
      v74 = (id)objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
      v73 = (id)objc_msgSend(v75, "objectAtIndexedSubscript:", 1);
      v72 = (id)objc_msgSend(v83, "objectForKey:", v77);
      if (v72)
      {
        v69 = (id)objc_msgSend(v72, "objectForKey:", 0x1EA4B7368);
        if ((objc_msgSend(v69, "isEqualToString:", v73) & 1) != 0)
        {
          v66 = (id)objc_msgSend(v72, "objectForKey:", 0x1EA4BB0A8);
          v31 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v32 = objc_msgSend(v31, "fileExistsAtPath:", v66);

          if ((v32 & 1) != 0)
          {
            objc_msgSend(v78, "addObject:", v77);
            v63 = MEMORY[0x1E0C81028];
            v62 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEBUG))
            {
              v26 = v63;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v90, v77, (uint64_t)v73);
              _os_log_debug_impl(&dword_1DC678000, v26, v62, "Existing model found:%@, version:%@", v90, 0x16u);
            }
            objc_storeStrong(&v63, 0);
          }
          else
          {
            v65 = MEMORY[0x1E0C81028];
            v64 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_DEBUG))
            {
              v29 = v65;
              v30 = v64;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v93, v77, (uint64_t)v66);
              _os_log_debug_impl(&dword_1DC678000, v29, v30, "No model found:%@, at location:%@, downloading the model again", v93, 0x16u);
            }
            objc_storeStrong(&v65, 0);
            v27 = v80;
            v91[0] = 0x1EA4BB0A8;
            v92[0] = v74;
            v91[1] = 0x1EA4B7368;
            v92[1] = v73;
            v28 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
            objc_msgSend(v27, "setObject:forKey:");

            objc_msgSend(v82, "addObject:", v72);
          }
          objc_storeStrong(&v66, 0);
        }
        else
        {
          v35 = v80;
          v95[0] = 0x1EA4BB0A8;
          v96[0] = v74;
          v95[1] = 0x1EA4B7368;
          v96[1] = v73;
          v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
          objc_msgSend(v35, "setObject:forKey:");

          v68 = MEMORY[0x1E0C81028];
          v67 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEBUG))
          {
            v33 = v68;
            v34 = v67;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v94, v77, (uint64_t)v73);
            _os_log_debug_impl(&dword_1DC678000, v33, v34, "New model version to fetch:%@, version:%@", v94, 0x16u);
          }
          objc_storeStrong(&v68, 0);
        }
        objc_storeStrong(&v69, 0);
      }
      else
      {
        v39 = v80;
        v98[0] = 0x1EA4BB0A8;
        v99[0] = v74;
        v98[1] = 0x1EA4B7368;
        v99[1] = v73;
        v40 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
        objc_msgSend(v39, "setObject:forKey:");

        v71 = MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEBUG))
        {
          log = v71;
          v38 = type;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v97, v77, (uint64_t)v73);
          _os_log_debug_impl(&dword_1DC678000, log, v38, "New model to fetch:%@, version:%@", v97, 0x16u);
        }
        objc_storeStrong(&v71, 0);
      }
      objc_storeStrong(&v72, 0);
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      ++v43;
      if (v41 + 1 >= v44)
      {
        v43 = 0;
        v44 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", __b, v100, 16);
        if (!v44)
          break;
      }
    }
  }

  memset(v60, 0, sizeof(v60));
  v24 = v83;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v60, v89, 16);
  if (v25)
  {
    v21 = *(_QWORD *)v60[2];
    v22 = 0;
    v23 = v25;
    while (1)
    {
      v20 = v22;
      if (*(_QWORD *)v60[2] != v21)
        objc_enumerationMutation(v24);
      v61 = *(_QWORD *)(v60[1] + 8 * v22);
      v6 = (id)objc_msgSend(v79, "objectForKey:", v61);
      v19 = v6 != 0;

      if (!v19)
      {
        v59 = 0;
        v57 = 0;
        v18 = +[AMDWorkflow getWorkflowsForModelId:error:](AMDWorkflow, "getWorkflowsForModelId:error:", v61, &v57);
        objc_storeStrong(&v59, v57);
        v58 = v18;
        if (v59)
        {
          v56 = 5;
        }
        else
        {
          if (!v58 || !objc_msgSend(v58, "count"))
          {
            v16 = v82;
            v17 = (id)objc_msgSend(v83, "objectForKey:", v61);
            objc_msgSend(v16, "addObject:");

            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v54 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              v15 = oslog;
              __os_log_helper_16_2_1_8_64((uint64_t)v88, v61);
              _os_log_debug_impl(&dword_1DC678000, v15, v54, "Model to delete :%@", v88, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          v56 = 0;
        }
        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
      }
      ++v22;
      if (v20 + 1 >= v23)
      {
        v22 = 0;
        v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v60, v89, 16);
        if (!v23)
          break;
      }
    }
  }

  v53 = (os_log_t)MEMORY[0x1E0C81028];
  v52 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v12 = v53;
    v13 = v52;
    v11 = objc_msgSend(v80, "count");
    v14 = (id)objc_msgSend(v80, "allKeys");
    v51 = v14;
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v87, v11, (uint64_t)v51);
    _os_log_impl(&dword_1DC678000, v12, v13, "Models to fetch (%lu): %@", v87, 0x16u);

    objc_storeStrong(&v51, 0);
  }
  objc_storeStrong((id *)&v53, 0);
  v50 = (os_log_t)MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v86, objc_msgSend(v82, "count"), (uint64_t)v82);
    _os_log_impl(&dword_1DC678000, v50, OS_LOG_TYPE_INFO, "Models to delete (%lu): %@", v86, 0x16u);
  }
  objc_storeStrong((id *)&v50, 0);
  objc_msgSend(v81, "setObject:forKey:", v78, CFSTR("modelsExisting"));
  v8 = v81;
  v9 = (id)objc_msgSend(v80, "allKeys");
  objc_msgSend(v8, "setObject:forKey:");

  objc_msgSend(v81, "setObject:forKey:", v82, CFSTR("modelsToDelete"));
  v10 = v80;
  v56 = 1;
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(&v81, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)getBinariesToFetch:(id)a3 withCurrentColdstartInfo:(id)a4 andAMDColdstartBinariesToDelete:(id)a5 andSummaryContainer:(id)a6
{
  id v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  id v27;
  id v28;
  NSObject *log;
  os_log_type_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  os_log_t v42;
  id v43;
  os_log_type_t v44;
  os_log_t v45;
  os_log_type_t v46;
  os_log_t oslog;
  _QWORD v48[8];
  uint64_t v49;
  os_log_type_t v50;
  id v51;
  os_log_type_t v52;
  id v53;
  os_log_type_t type;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD __b[8];
  uint64_t v62;
  id v63;
  id v64;
  int v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id location[2];
  id v71;
  id v72;
  uint8_t v73[32];
  uint8_t v74[32];
  uint8_t v75[16];
  _BYTE v76[128];
  uint8_t v77[32];
  uint8_t v78[32];
  _QWORD v79[2];
  _QWORD v80[2];
  uint8_t v81[24];
  _QWORD v82[2];
  _QWORD v83[2];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v71 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  objc_storeStrong(&v69, a4);
  v68 = 0;
  objc_storeStrong(&v68, a5);
  v67 = 0;
  objc_storeStrong(&v67, a6);
  v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (location[0])
  {
    v64 = (id)objc_msgSend(v71, "getUrlsWithVersion:", location[0]);
    v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    v37 = v64;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v84, 16);
    if (v38)
    {
      v34 = *(_QWORD *)__b[2];
      v35 = 0;
      v36 = v38;
      while (1)
      {
        v33 = v35;
        if (*(_QWORD *)__b[2] != v34)
          objc_enumerationMutation(v37);
        v62 = *(_QWORD *)(__b[1] + 8 * v35);
        v60 = (id)objc_msgSend(v64, "objectForKey:", v62);
        v59 = (id)objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
        v58 = (id)objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
        v57 = (id)objc_msgSend(v69, "objectForKey:", v62);
        v56 = (id)objc_msgSend(v57, "objectForKey:", 0x1EA4B7368);
        if (v57)
        {
          if ((objc_msgSend(v56, "isEqualToString:", v58) & 1) != 0)
          {
            objc_msgSend(v63, "addObject:", v62);
            v51 = MEMORY[0x1E0C81028];
            v50 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEBUG))
            {
              v24 = v51;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, v62, (uint64_t)v58);
              _os_log_debug_impl(&dword_1DC678000, v24, v50, "Existing Coldstart Binary found:%@, version:%@", v77, 0x16u);
            }
            objc_storeStrong(&v51, 0);
          }
          else
          {
            v27 = v66;
            v79[0] = 0x1EA4BB0A8;
            v80[0] = v59;
            v79[1] = 0x1EA4B7368;
            v80[1] = v58;
            v28 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
            objc_msgSend(v27, "setObject:forKey:");

            v53 = MEMORY[0x1E0C81028];
            v52 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEBUG))
            {
              v25 = v53;
              v26 = v52;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, v62, (uint64_t)v58);
              _os_log_debug_impl(&dword_1DC678000, v25, v26, "New Coldstart Binary version to fetch:%@, version:%@", v78, 0x16u);
            }
            objc_storeStrong(&v53, 0);
          }
        }
        else
        {
          v31 = v66;
          v82[0] = 0x1EA4BB0A8;
          v83[0] = v59;
          v82[1] = 0x1EA4B7368;
          v83[1] = v58;
          v32 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
          objc_msgSend(v31, "setObject:forKey:");

          v55 = MEMORY[0x1E0C81028];
          type = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEBUG))
          {
            log = v55;
            v30 = type;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v81, v62, (uint64_t)v58);
            _os_log_debug_impl(&dword_1DC678000, log, v30, "New Coldstart Binary to fetch:%@, version:%@", v81, 0x16u);
          }
          objc_storeStrong(&v55, 0);
        }
        objc_storeStrong(&v56, 0);
        objc_storeStrong(&v57, 0);
        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
        objc_storeStrong(&v60, 0);
        ++v35;
        if (v33 + 1 >= v36)
        {
          v35 = 0;
          v36 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v84, 16);
          if (!v36)
            break;
        }
      }
    }

    memset(v48, 0, sizeof(v48));
    v22 = v69;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", v48, v76, 16);
    if (v23)
    {
      v19 = *(_QWORD *)v48[2];
      v20 = 0;
      v21 = v23;
      while (1)
      {
        v18 = v20;
        if (*(_QWORD *)v48[2] != v19)
          objc_enumerationMutation(v22);
        v49 = *(_QWORD *)(v48[1] + 8 * v20);
        v6 = (id)objc_msgSend(v64, "objectForKey:", v49);
        v17 = v6 != 0;

        if (!v17)
        {
          v15 = v68;
          v16 = (id)objc_msgSend(v69, "objectForKey:", v49);
          objc_msgSend(v15, "addObject:");

          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v46 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            v14 = oslog;
            __os_log_helper_16_2_1_8_64((uint64_t)v75, v49);
            _os_log_debug_impl(&dword_1DC678000, v14, v46, "Coldstart binary to delete for model :%@", v75, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        ++v20;
        if (v18 + 1 >= v21)
        {
          v20 = 0;
          v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", v48, v76, 16);
          if (!v21)
            break;
        }
      }
    }

    v45 = (os_log_t)MEMORY[0x1E0C81028];
    v44 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v11 = v45;
      v12 = v44;
      v10 = objc_msgSend(v66, "count");
      v13 = (id)objc_msgSend(v66, "allKeys");
      v43 = v13;
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v74, v10, (uint64_t)v43);
      _os_log_impl(&dword_1DC678000, v11, v12, "Coldstart binaries to fetch (%lu): %@", v74, 0x16u);

      objc_storeStrong(&v43, 0);
    }
    objc_storeStrong((id *)&v45, 0);
    v42 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v73, objc_msgSend(v68, "count"), (uint64_t)v68);
      _os_log_impl(&dword_1DC678000, v42, OS_LOG_TYPE_INFO, "Coldstart binaries to delete (%lu): %@", v73, 0x16u);
    }
    objc_storeStrong((id *)&v42, 0);
    objc_msgSend(v67, "setObject:forKey:", v63, CFSTR("binariesExisting"));
    v8 = v67;
    v9 = (id)objc_msgSend(v66, "allKeys");
    objc_msgSend(v8, "setObject:forKey:");

    objc_msgSend(v67, "setObject:forKey:", v68, CFSTR("binariesToDelete"));
    v72 = v66;
    v65 = 1;
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v64, 0);
  }
  else
  {
    v72 = v66;
    v65 = 1;
  }
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, 0);
  return v72;
}

+ (id)getUrlsWithVersion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *log;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id obj;
  uint64_t v15;
  os_log_t oslog;
  id v17;
  id v18;
  _QWORD __b[8];
  uint64_t v20;
  id v21;
  id location[3];
  _QWORD v23[2];
  uint8_t v24[24];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = objc_alloc(MEMORY[0x1E0C99E08]);
  v21 = (id)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  if (v15)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v15;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v20 = *(_QWORD *)(__b[1] + 8 * v11);
      v18 = (id)objc_msgSend(location[0], "objectForKey:", v20);
      v17 = (id)objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("="));
      if ((unint64_t)objc_msgSend(v17, "count") >= 2)
      {
        v5 = v21;
        v23[0] = v18;
        v7 = (id)objc_msgSend(v17, "lastObject");
        v23[1] = v7;
        v6 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        objc_msgSend(v5, "setObject:forKey:");

      }
      else
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v18);
          _os_log_error_impl(&dword_1DC678000, log, OS_LOG_TYPE_ERROR, "No version in url: '%@'", v24, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
        if (!v12)
          break;
      }
    }
  }

  v4 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)saveInFlightWorkflows:(id)a3 forModels:(id)a4 inDomain:(id)a5 withCallUUID:(id)a6 error:(id *)a7
{
  int64_t v7;
  int64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *log;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v37;
  uint64_t v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  os_log_type_t v43;
  os_log_t v44;
  _QWORD v45[8];
  id v46;
  int v47;
  os_log_type_t type;
  os_log_t oslog;
  id v50;
  char v51;
  char v52;
  _QWORD __b[8];
  uint64_t v54;
  id v55;
  id *v56;
  id v57;
  id v58;
  id v59;
  id location[3];
  id v61;
  uint8_t v62[16];
  uint8_t v63[16];
  _BYTE v64[128];
  uint8_t v65[24];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v59 = 0;
  objc_storeStrong(&v59, a4);
  v58 = 0;
  objc_storeStrong(&v58, a5);
  v57 = 0;
  objc_storeStrong(&v57, a6);
  v56 = a7;
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  v37 = location[0];
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v66, 16);
  if (v38)
  {
    v30 = *(_QWORD *)__b[2];
    v31 = 0;
    v32 = v38;
    while (1)
    {
      v29 = v31;
      if (*(_QWORD *)__b[2] != v30)
        objc_enumerationMutation(v37);
      v54 = *(_QWORD *)(__b[1] + 8 * v31);
      v52 = 0;
      v51 = 0;
      v50 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", v54, v56);
      if (*v56)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v28 = type;
          __os_log_helper_16_2_1_8_64((uint64_t)v65, v54);
          _os_log_error_impl(&dword_1DC678000, log, v28, "Fetch error for modelId: %@", v65, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v61 = 0;
        v47 = 1;
      }
      else
      {
        if (v50)
          v52 = 1;
        v26 = (id)objc_msgSend(v59, "objectForKey:", v54);

        if (v26)
          v51 = 1;
        memset(v45, 0, sizeof(v45));
        v24 = (id)objc_msgSend(location[0], "objectForKey:", v54);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v45, v64, 16);
        if (v25)
        {
          v21 = *(_QWORD *)v45[2];
          v22 = 0;
          v23 = v25;
          while (1)
          {
            v20 = v22;
            if (*(_QWORD *)v45[2] != v21)
              objc_enumerationMutation(v24);
            v46 = *(id *)(v45[1] + 8 * v22);
            if ((v52 & 1) != 0)
            {
              v19 = v46;
              v7 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v58);
              +[AMDWorkflow saveWorkflow:forDomain:withCallUUID:error:](AMDWorkflow, "saveWorkflow:forDomain:withCallUUID:error:", v19, v7, v57, v56);
            }
            if (*v56)
            {
              v44 = (os_log_t)MEMORY[0x1E0C81028];
              v43 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                v16 = v44;
                v17 = v43;
                v18 = (id)objc_msgSend(*v56, "localizedDescription");
                v42 = v18;
                __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v42);
                _os_log_error_impl(&dword_1DC678000, v16, v17, "Workflow save failed with error: %@", v63, 0xCu);

                objc_storeStrong(&v42, 0);
              }
              objc_storeStrong((id *)&v44, 0);
              v61 = 0;
              v47 = 1;
              goto LABEL_32;
            }
            if ((v51 & 1) != 0)
            {
              v15 = v46;
              v8 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v58);
              +[AMDWorkflowInFlight saveWorkflow:forDomain:withCallUUID:error:](AMDWorkflowInFlight, "saveWorkflow:forDomain:withCallUUID:error:", v15, v8, v57, v56);
            }
            if (*v56)
              break;
            v10 = v55;
            v11 = (id)objc_msgSend(v46, "objectForKey:", 0x1EA4C2EA8);
            objc_msgSend(v10, "addObject:");

            ++v22;
            if (v20 + 1 >= v23)
            {
              v22 = 0;
              v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v45, v64, 16);
              if (!v23)
                goto LABEL_31;
            }
          }
          v41 = (os_log_t)MEMORY[0x1E0C81028];
          v40 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v12 = v41;
            v13 = v40;
            v14 = (id)objc_msgSend(*v56, "localizedDescription");
            v39 = v14;
            __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v39);
            _os_log_error_impl(&dword_1DC678000, v12, v13, "Inflight workflow save failed with error: %@", v62, 0xCu);

            objc_storeStrong(&v39, 0);
          }
          objc_storeStrong((id *)&v41, 0);
          v61 = 0;
          v47 = 1;
        }
        else
        {
LABEL_31:
          v47 = 0;
        }
LABEL_32:

        if (!v47)
          v47 = 0;
      }
      objc_storeStrong(&v50, 0);
      if (v47)
        break;
      ++v31;
      if (v29 + 1 >= v32)
      {
        v31 = 0;
        v32 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v66, 16);
        if (!v32)
          goto LABEL_37;
      }
    }
  }
  else
  {
LABEL_37:
    v47 = 0;
  }

  if (!v47)
  {
    v61 = v55;
    v47 = 1;
  }
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(location, 0);
  return v61;
}

@end
