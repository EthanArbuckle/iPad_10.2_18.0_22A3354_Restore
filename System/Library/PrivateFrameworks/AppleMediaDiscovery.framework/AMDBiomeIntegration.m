@implementation AMDBiomeIntegration

+ (id)queryBiomeFor:(id)a3 withError:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  id v37;
  id v38;
  AMDFetchDescriptor *v39;
  AMDFetchDescriptor *v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_type_t v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  unint64_t v54;
  void *v55;
  id v56;
  NSObject *log;
  os_log_type_t v58;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  os_log_type_t v65;
  os_log_t v66;
  id v67;
  os_log_type_t v68;
  os_log_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint8_t v75[15];
  os_log_type_t v76;
  os_log_t v77;
  id v78;
  os_log_type_t v79;
  os_log_t v80;
  id v81;
  id v82;
  os_log_type_t v83;
  os_log_t v84;
  __CFString *v85;
  id v86;
  os_log_type_t v87;
  os_log_t v88;
  id v89;
  id v90;
  os_log_type_t v91;
  os_log_t v92;
  id v93;
  id v94;
  id v95;
  id v96;
  char v97;
  os_log_type_t v98;
  os_log_t v99;
  id v100;
  os_log_type_t v101;
  os_log_t v102;
  id v103;
  id v104;
  os_log_type_t v105;
  os_log_t v106;
  id v107;
  os_log_type_t v108;
  os_log_t v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  os_log_type_t v119;
  os_log_t v120;
  id v121;
  id v122;
  id v123;
  unsigned int i;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  __CFString *v130;
  int v131;
  __CFString *v132;
  id v133;
  uint8_t v134[15];
  os_log_type_t type;
  os_log_t oslog;
  id *v137;
  id location[2];
  id v139;
  id v140;
  uint8_t v141[16];
  uint8_t v142[16];
  uint8_t v143[16];
  uint8_t v144[16];
  uint8_t v145[16];
  uint8_t v146[16];
  uint8_t v147[16];
  uint8_t v148[16];
  uint8_t v149[32];
  uint8_t v150[16];
  uint8_t v151[24];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v139 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v137 = a4;
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    v58 = type;
    __os_log_helper_16_0_0(v134);
    _os_log_impl(&dword_1DC678000, log, v58, "Loading new Biome events", v134, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v133 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!location[0])
  {
    v132 = CFSTR("Nil config passed for Biome Data refresh");
    v4 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 3, v132);
    *v137 = v4;
    v140 = 0;
    v131 = 1;
    objc_storeStrong((id *)&v132, 0);
    goto LABEL_107;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v130 = CFSTR("Invalid payload type passed from the server for Biome Data refresh");
    v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 3, v130);
    *v137 = v5;
    v140 = 0;
    v131 = 1;
    objc_storeStrong((id *)&v130, 0);
    goto LABEL_107;
  }
  v129 = location[0];
  v128 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v127 = +[AMDKVStore fetchValueForKey:error:](AMDKVStore, "fetchValueForKey:error:", CFSTR("biome_timestamps_dict"), v137);
  if (*v137)
  {
    v55 = (void *)MEMORY[0x1E0CB3940];
    v56 = (id)objc_msgSend(*v137, "localizedDescription");
    v126 = (id)objc_msgSend(v55, "stringWithFormat:", CFSTR("Biome book-keeping dict could not be fetched: %@"), v56);

    v6 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 3, v126);
    *v137 = v6;
    v140 = 0;
    v131 = 1;
    objc_storeStrong(&v126, 0);
    goto LABEL_106;
  }
  if (!v127)
  {
    v127 = objc_alloc_init(MEMORY[0x1E0C99E08]);

  }
  v125 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 0; ; ++i)
  {
    v54 = (int)i;
    if (v54 >= objc_msgSend(v129, "count"))
      break;
    v123 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v122 = (id)objc_msgSend(v129, "objectAtIndex:", (int)i);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v118 = v122;
      v117 = (id)objc_msgSend(v118, "objectForKey:", CFSTR("streamName"));
      v116 = (id)objc_msgSend(v118, "objectForKey:", CFSTR("fieldsRequired"));
      v115 = (id)objc_msgSend(v118, "objectForKey:", CFSTR("type"));
      v114 = (id)objc_msgSend(v118, "objectForKey:", CFSTR("fetchDescriptor"));
      v113 = (id)objc_msgSend(v118, "objectForKey:", CFSTR("persistanceRequired"));
      v112 = (id)objc_msgSend(v118, "objectForKey:", CFSTR("featureTransformations"));
      v111 = 0;
      if (v115)
        objc_storeStrong(&v111, v115);
      else
        objc_storeStrong(&v111, CFSTR("RefreshDB"));
      if (!v117 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v110 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stream Name missing/incorrectly formatted in the stream dictionary at index:%d"), i);
        v109 = (os_log_t)MEMORY[0x1E0C81028];
        v108 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          v50 = v109;
          v51 = v108;
          __os_log_helper_16_2_1_8_64((uint64_t)v150, (uint64_t)v110);
          _os_log_error_impl(&dword_1DC678000, v50, v51, "%@", v150, 0xCu);
        }
        objc_storeStrong((id *)&v109, 0);
        objc_msgSend(v123, "setObject:forKey:", v110, CFSTR("biomeError"));
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
        objc_storeStrong(&v110, 0);
        goto LABEL_101;
      }
      v107 = v117;
      v106 = (os_log_t)MEMORY[0x1E0C81028];
      v105 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        v48 = v106;
        v49 = v105;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v149, (uint64_t)v111, (uint64_t)v107);
        _os_log_impl(&dword_1DC678000, v48, v49, "Running biome query operation: %@ for stream: %@", v149, 0x16u);
      }
      objc_storeStrong((id *)&v106, 0);
      v104 = 0;
      if ((objc_msgSend(v111, "isEqualToString:", CFSTR("Retrieve")) & 1) == 0)
      {
        if ((objc_msgSend(v111, "isEqualToString:", CFSTR("RefreshDB")) & 1) != 0)
        {
          if (!v116)
          {
            v70 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fields required parameter missing in the stream dictionary for the data fetch operation at index: %d"), i);
            v69 = (os_log_t)MEMORY[0x1E0C81028];
            v68 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v15 = v69;
              v16 = v68;
              __os_log_helper_16_2_1_8_64((uint64_t)v142, (uint64_t)v70);
              _os_log_error_impl(&dword_1DC678000, v15, v16, "%@", v142, 0xCu);
            }
            objc_storeStrong((id *)&v69, 0);
            objc_msgSend(v123, "setObject:forKey:", v70, CFSTR("biomeError"));
            objc_msgSend(v128, "addObject:", v123);
            v131 = 4;
            objc_storeStrong(&v70, 0);
            goto LABEL_100;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v67 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fields required parameter incorrectly formatted in the stream dictionary at index: %d"), i);
            v66 = (os_log_t)MEMORY[0x1E0C81028];
            v65 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              v13 = v66;
              v14 = v65;
              __os_log_helper_16_2_1_8_64((uint64_t)v141, (uint64_t)v67);
              _os_log_error_impl(&dword_1DC678000, v13, v14, "%@", v141, 0xCu);
            }
            objc_storeStrong((id *)&v66, 0);
            objc_msgSend(v123, "setObject:forKey:", v67, CFSTR("biomeError"));
            objc_msgSend(v128, "addObject:", v123);
            v131 = 4;
            objc_storeStrong(&v67, 0);
            goto LABEL_100;
          }
          v64 = v116;
          if (objc_msgSend(v64, "count"))
          {
            v62 = v104;
            v12 = (id)objc_msgSend(v139, "fetchLatestRowsFromStream:withFields:withBiomeTimestampDict:error:", v107, v64, v127, &v62);
            objc_storeStrong(&v104, v62);
            v63 = v12;
            if (v104)
            {
              v10 = v123;
              v11 = (id)objc_msgSend(v104, "localizedDescription");
              objc_msgSend(v10, "setObject:forKey:");

              objc_msgSend(v128, "addObject:", v123);
              v131 = 4;
            }
            else
            {
              if (v63)
                objc_msgSend(v123, "setObject:forKey:", v63, v107);
              v131 = 0;
            }
            objc_storeStrong(&v63, 0);
          }
          else
          {
            objc_msgSend(v123, "setObject:forKey:", CFSTR("No fields requested"), v107);
            v131 = 4;
          }
          objc_storeStrong(&v64, 0);
          if (v131)
            goto LABEL_100;
          goto LABEL_99;
        }
        objc_msgSend(v123, "setObject:forKey:", CFSTR("Invalid action"), v107);
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
LABEL_100:
        objc_storeStrong(&v104, 0);
        objc_storeStrong(&v107, 0);
LABEL_101:
        objc_storeStrong(&v111, 0);
        objc_storeStrong(&v112, 0);
        objc_storeStrong(&v113, 0);
        objc_storeStrong(&v114, 0);
        objc_storeStrong(&v115, 0);
        objc_storeStrong(&v116, 0);
        objc_storeStrong(&v117, 0);
        objc_storeStrong(&v118, 0);
        goto LABEL_102;
      }
      if (!v114)
      {
        v103 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch descriptor missing in the stream dictionary for the data aggregation operation at index: %d"), i);
        v102 = (os_log_t)MEMORY[0x1E0C81028];
        v101 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          v46 = v102;
          v47 = v101;
          __os_log_helper_16_2_1_8_64((uint64_t)v148, (uint64_t)v103);
          _os_log_error_impl(&dword_1DC678000, v46, v47, "%@", v148, 0xCu);
        }
        objc_storeStrong((id *)&v102, 0);
        objc_msgSend(v123, "setObject:forKey:", v103, CFSTR("biomeError"));
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
        objc_storeStrong(&v103, 0);
        goto LABEL_100;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v100 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch descriptor dict parameter incorrectly formatted in the stream dictionary at index: %d"), i);
        v99 = (os_log_t)MEMORY[0x1E0C81028];
        v98 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          v44 = v99;
          v45 = v98;
          __os_log_helper_16_2_1_8_64((uint64_t)v147, (uint64_t)v100);
          _os_log_error_impl(&dword_1DC678000, v44, v45, "%@", v147, 0xCu);
        }
        objc_storeStrong((id *)&v99, 0);
        objc_msgSend(v123, "setObject:forKey:", v100, CFSTR("biomeError"));
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
        objc_storeStrong(&v100, 0);
        goto LABEL_100;
      }
      v97 = 0;
      if (v113)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v113, "BOOLValue") & 1) != 0)
          v97 = 1;
      }
      v96 = v114;
      v95 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
      if ((objc_msgSend(v95, "isUsable") & 1) == 0)
      {
        v94 = (id)objc_msgSend(v95, "connectionState");
        v93 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLite database is not usable: %@"), v94);
        v92 = (os_log_t)MEMORY[0x1E0C81028];
        v91 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          v42 = v92;
          v43 = v91;
          __os_log_helper_16_2_1_8_64((uint64_t)v146, (uint64_t)v93);
          _os_log_error_impl(&dword_1DC678000, v42, v43, "%@", v146, 0xCu);
        }
        objc_storeStrong((id *)&v92, 0);
        objc_msgSend(v123, "setObject:forKey:", v93, v107);
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
LABEL_77:
        objc_storeStrong(&v95, 0);
        objc_storeStrong(&v96, 0);
        if (!v131)
LABEL_99:
          v131 = 0;
        goto LABEL_100;
      }
      v39 = [AMDFetchDescriptor alloc];
      v38 = v96;
      v41 = (id)objc_msgSend(v95, "getDataSchema");
      v89 = v104;
      v40 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v39, "initWithDict:usingSchema:error:", v38);
      objc_storeStrong(&v104, v89);
      v90 = v40;

      if (v104)
      {
        v88 = (os_log_t)MEMORY[0x1E0C81028];
        v87 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          v35 = v88;
          v36 = v87;
          v37 = (id)objc_msgSend(v104, "localizedDescription");
          v86 = v37;
          __os_log_helper_16_2_1_8_64((uint64_t)v145, (uint64_t)v86);
          _os_log_error_impl(&dword_1DC678000, v35, v36, "%@", v145, 0xCu);

          objc_storeStrong(&v86, 0);
        }
        objc_storeStrong((id *)&v88, 0);
        v33 = v123;
        v34 = (id)objc_msgSend(v104, "localizedDescription");
        objc_msgSend(v33, "setObject:forKey:");

        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
        goto LABEL_76;
      }
      if (!v90)
      {
        v85 = CFSTR("Internal logic error: Nil Fetch descriptor object");
        v84 = (os_log_t)MEMORY[0x1E0C81028];
        v83 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          v31 = v84;
          v32 = v83;
          __os_log_helper_16_2_1_8_64((uint64_t)v144, (uint64_t)v85);
          _os_log_error_impl(&dword_1DC678000, v31, v32, "%@", v144, 0xCu);
        }
        objc_storeStrong((id *)&v84, 0);
        objc_msgSend(v123, "setObject:forKey:", v85, v107);
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
        objc_storeStrong((id *)&v85, 0);
        goto LABEL_76;
      }
      v81 = v104;
      v30 = (id)objc_msgSend(v139, "fetchDataFromStream:usingDescriptor:error:", v107, v90, &v81);
      objc_storeStrong(&v104, v81);
      v82 = v30;
      if (v104)
      {
        v80 = (os_log_t)MEMORY[0x1E0C81028];
        v79 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v27 = v80;
          v28 = v79;
          v29 = (id)objc_msgSend(v104, "localizedDescription");
          v78 = v29;
          __os_log_helper_16_2_1_8_64((uint64_t)v143, (uint64_t)v78);
          _os_log_error_impl(&dword_1DC678000, v27, v28, "%@", v143, 0xCu);

          objc_storeStrong(&v78, 0);
        }
        objc_storeStrong((id *)&v80, 0);
        v25 = v123;
        v26 = (id)objc_msgSend(v104, "localizedDescription");
        objc_msgSend(v25, "setObject:forKey:");

        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
      }
      else if (v82)
      {
        if ((v97 & 1) != 0)
        {
          v73 = v104;
          v22 = (id)objc_msgSend(v90, "persist:error:", v82, &v73);
          objc_storeStrong(&v104, v73);
          v74 = v22;
          if (v104)
          {
            v20 = v123;
            v21 = (id)objc_msgSend(v104, "localizedDescription");
            objc_msgSend(v20, "setObject:forKey:");

            objc_msgSend(v128, "addObject:", v123);
            v131 = 4;
          }
          else
          {
            if (v74)
              objc_msgSend(v123, "setObject:forKey:", v74, CFSTR("resultSetPersistSummary"));
            v131 = 0;
          }
          objc_storeStrong(&v74, 0);
          if (v131)
            goto LABEL_75;
        }
        else
        {
          v72 = 0;
          if (v112)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_storeStrong(&v72, v112);
          }
          v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v71, "setObject:forKey:", v82, CFSTR("featureData"));
          if (v72)
            objc_msgSend(v71, "setObject:forKey:", v72, CFSTR("featureTransformations"));
          v18 = v125;
          v17 = v71;
          v19 = (id)objc_msgSend(v90, "getId");
          objc_msgSend(v18, "setObject:forKey:", v17);

          objc_storeStrong(&v71, 0);
          objc_storeStrong(&v72, 0);
        }
        v131 = 0;
      }
      else
      {
        v77 = (os_log_t)MEMORY[0x1E0C81028];
        v76 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v23 = v77;
          v24 = v76;
          __os_log_helper_16_0_0(v75);
          _os_log_error_impl(&dword_1DC678000, v23, v24, "Nil rowset returned", v75, 2u);
        }
        objc_storeStrong((id *)&v77, 0);
        objc_msgSend(v123, "setObject:forKey:", CFSTR("Nil rowset for aggregation"), v107);
        objc_msgSend(v128, "addObject:", v123);
        v131 = 4;
      }
LABEL_75:
      objc_storeStrong(&v82, 0);
LABEL_76:
      objc_storeStrong(&v90, 0);
      goto LABEL_77;
    }
    v121 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Biome stream object not a dictionary at index:%d"), i);
    v120 = (os_log_t)MEMORY[0x1E0C81028];
    v119 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      v52 = v120;
      v53 = v119;
      __os_log_helper_16_2_1_8_64((uint64_t)v151, (uint64_t)v121);
      _os_log_error_impl(&dword_1DC678000, v52, v53, "%@", v151, 0xCu);
    }
    objc_storeStrong((id *)&v120, 0);
    objc_msgSend(v123, "setObject:forKey:", v121, CFSTR("biomeError"));
    objc_msgSend(v128, "addObject:", v123);
    v131 = 4;
    objc_storeStrong(&v121, 0);
LABEL_102:
    objc_storeStrong(&v122, 0);
    objc_storeStrong(&v123, 0);
  }
  v61 = 0;
  v60 = 0;
  +[AMDKVStore setValue:forKey:error:](AMDKVStore, "setValue:forKey:error:", v127, CFSTR("biome_timestamps_dict"), &v60);
  objc_storeStrong(&v61, v60);
  if (v61)
  {
    v8 = v133;
    v9 = (id)objc_msgSend(v61, "localizedDescription");
    objc_msgSend(v8, "setObject:forKey:");

  }
  objc_msgSend(v133, "setObject:forKey:", v128, CFSTR("biomeUpdateSummaries"));
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v133, CFSTR("biomeQuerySummary"), 0);
  v140 = v125;
  v131 = 1;
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v125, 0);
LABEL_106:
  objc_storeStrong(&v127, 0);
  objc_storeStrong(&v128, 0);
  objc_storeStrong(&v129, 0);
LABEL_107:
  objc_storeStrong(&v133, 0);
  objc_storeStrong(location, 0);
  return v140;
}

+ (id)queryBiomeStream:(id)a3 withEventFields:(id)a4 fromTimestamp:(id)a5 error:(id *)a6
{
  uint64_t v6;
  id v7;
  id v8;
  id *v10;
  id v11;
  id v12;
  os_log_t log;
  os_log_type_t type[4];
  uint8_t *buf;
  id v16;
  id v17;
  id v18;
  id obj;
  id v20;
  id *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  id v27;
  id v28;
  id location[2];
  id v30;
  _BYTE v31[24];
  uint64_t v32;

  obj = a4;
  v20 = a5;
  v21 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v30 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, obj);
  v27 = 0;
  objc_storeStrong(&v27, v20);
  v26 = v21;
  v25 = (id)objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
  v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), v25, location[0]);
  if (v27)
  {
    v17 = v24;
    v16 = (id)MEMORY[0x1E0CB3940];
    objc_msgSend(v27, "doubleValue");
    v18 = (id)objc_msgSend(v16, "stringWithFormat:", CFSTR(" WHERE eventTimestamp > %f"), v6);
    v7 = (id)objc_msgSend(v17, "stringByAppendingString:");
    v8 = v24;
    v24 = v7;

  }
  v23 = MEMORY[0x1E0C81028];
  v22 = 1;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
  {
    log = (os_log_t)v23;
    *(_DWORD *)type = v22;
    buf = v31;
    __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v24);
    _os_log_impl(&dword_1DC678000, log, type[0], "Query string for biome data fetch operation: %@", buf, 0xCu);
  }
  v12 = 0;
  objc_storeStrong(&v23, 0);
  v10 = &v24;
  v11 = (id)objc_msgSend(v30, "runBiomeQuery:error:", v24, v26);
  objc_storeStrong(v10, v12);
  objc_storeStrong(&v25, v12);
  objc_storeStrong(&v27, v12);
  objc_storeStrong(&v28, v12);
  objc_storeStrong(location, v12);
  return v11;
}

+ (id)fetchLatestEventTimestampFromEvents:(id)a3
{
  double v3;
  double v5;
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  double v14;
  _QWORD __b[8];
  id v16;
  double v17;
  id location[3];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = -1.0;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
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
      v16 = *(id *)(__b[1] + 8 * v10);
      v14 = v17;
      v6 = (id)objc_msgSend(v16, "objectForKey:", CFSTR("eventTimestamp"));
      objc_msgSend(v6, "doubleValue");
      v7 = v3;

      if (v14 >= v7)
        v5 = v14;
      else
        v5 = v7;
      v17 = v5;
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
        if (!v11)
          break;
      }
    }
  }

  if (v17 >= 0.0)
    v19 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  else
    v19 = 0;
  objc_storeStrong(location, 0);
  return v19;
}

+ (id)runBiomeQuery:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id location[3];
  id v20;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(MEMORY[0x1E0D02718]);
  v15 = (id)objc_msgSend(v16, "executeQuery:", CFSTR("%@"), location[0]);
  while ((objc_msgSend(v15, "next") & 1) != 0)
  {
    v4 = (id)objc_msgSend(v15, "row");
    v12 = v4 == 0;

    if (!v12)
    {
      v11 = (id)objc_msgSend(v15, "row");
      objc_msgSend(v17, "addObject:");

    }
  }
  v10 = (id)objc_msgSend(v15, "error");

  if (v10)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v9 = (id)objc_msgSend(v15, "error");
    v8 = (id)objc_msgSend(v9, "localizedDescription");
    v14 = (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("Biome query failure: %@"), v8);

    v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 3, v14);
    *v18 = v5;
    v20 = 0;
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v20 = v17;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

+ (id)fetchLatestRowsFromStream:(id)a3 withFields:(id)a4 withBiomeTimestampDict:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD __b[8];
  id v23;
  id v24;
  int v25;
  id v26;
  id v27;
  id *v28;
  id v29;
  id v30;
  id location[2];
  id v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = a6;
  v27 = (id)objc_msgSend(v29, "objectForKey:", location[0]);
  v26 = (id)objc_msgSend(v32, "queryBiomeStream:withEventFields:fromTimestamp:error:", location[0], v30, v27, a6);
  if (*a6)
  {
    v33 = 0;
    v25 = 1;
  }
  else
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    v13 = v26;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v13);
        v23 = *(id *)(__b[1] + 8 * v11);
        v21 = (id)objc_msgSend(v23, "mutableCopy");
        v7 = v21;
        v8 = (id)objc_msgSend(v21, "objectForKey:", CFSTR("eventTimestamp"));
        objc_msgSend(v7, "setObject:forKey:");

        objc_msgSend(v24, "addObject:", v21);
        objc_storeStrong(&v21, 0);
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
          if (!v12)
            break;
        }
      }
    }

    v34[0] = 0x1EA4B92E8;
    v35[0] = location[0];
    v34[1] = 0x1EA4B92C8;
    v35[1] = v24;
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v19 = +[AMDSQLite saveEvents:error:](AMDSQLite, "saveEvents:error:", v20, v28);
    if (*v28)
    {
      v33 = 0;
      v25 = 1;
    }
    else
    {
      v18 = (id)objc_msgSend(v32, "fetchLatestEventTimestampFromEvents:", v26);
      if (v18)
        objc_msgSend(v29, "setObject:forKey:", v18, location[0]);
      v33 = v19;
      v25 = 1;
      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v33;
}

+ (id)fetchDataFromStream:(id)a3 usingDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  int v9;
  id v10;
  os_log_type_t v11;
  id v12;
  id v13;
  id *v14;
  id v15;
  id location[2];
  id v17;
  id v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a5;
  v13 = (id)objc_msgSend(v15, "getStatement");
  v12 = MEMORY[0x1E0C81028];
  v11 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v13);
    _os_log_impl(&dword_1DC678000, (os_log_t)v12, v11, "Biome SQL Query statement: %@", v19, 0xCu);
  }
  objc_storeStrong(&v12, 0);
  v10 = (id)objc_msgSend(v17, "runBiomeQuery:error:", v13, v14);
  if (*v14)
  {
    v18 = 0;
    v9 = 1;
  }
  else if (v10)
  {
    v8 = (id)objc_msgSend(v17, "createRowSetFrom:withFetchDescriptor:", v10, v15);
    v18 = v8;
    v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v18 = 0;
    v9 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18;
}

+ (id)createRowSetFrom:(id)a3 withFetchDescriptor:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  id v21;
  id v22;
  id v23;
  id v24;
  unsigned int j;
  _QWORD __b[8];
  id v27;
  id v28;
  id v29;
  id v30;
  unsigned int i;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id location[3];
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = (id)objc_msgSend(v35, "getColumnSpecs");
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
  for (i = 0; ; ++i)
  {
    v19 = i;
    if (v19 >= objc_msgSend(v34, "count"))
      break;
    v30 = (id)objc_msgSend(v34, "objectAtIndex:", i);
    v29 = (id)objc_msgSend(v30, "getSelectColumnName");
    v28 = (id)objc_msgSend(v30, "getTypeString");
    v14 = (id)v32;
    v40[0] = CFSTR("name");
    v41[0] = v29;
    v40[1] = AMD_SQLITE_TYPE;
    v41[1] = v28;
    v15 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    objc_msgSend(v14, "addObject:");

    v17 = v33;
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(location[0], "count"));
    objc_msgSend(v17, "addObject:");

    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  memset(__b, 0, sizeof(__b));
  v12 = location[0];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(v12);
      v27 = *(id *)(__b[1] + 8 * v10);
      for (j = 0; ; ++j)
      {
        v7 = j;
        if (v7 >= objc_msgSend(v34, "count"))
          break;
        v24 = (id)objc_msgSend(v34, "objectAtIndex:", j);
        v23 = (id)objc_msgSend(v24, "getSelectColumnName");
        v22 = (id)objc_msgSend(v27, "objectForKey:", v23);
        v6 = (id)objc_msgSend(v33, "objectAtIndex:", j);
        objc_msgSend(v6, "addObject:", v22);

        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
        if (!v11)
          break;
      }
    }
  }

  v37[0] = 0x1EA4B94E8;
  v38[0] = v32;
  v37[1] = 0x1EA4B9508;
  v38[1] = v33;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v5 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
