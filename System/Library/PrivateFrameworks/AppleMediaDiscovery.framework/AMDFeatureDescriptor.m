@implementation AMDFeatureDescriptor

+ (id)getDataType:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v6;
  id *v7;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getDataType__typeDict)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D80]);
    v9 = 0x1E0CB3000uLL;
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100);
    v16 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 200);
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 300);
    v14 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 600);
    v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 500);
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 700);
    v11 = &v6;
    v3 = objc_msgSend(v10, "initWithObjectsAndKeys:", v17, CFSTR("int16"), v16, CFSTR("int32"), v15, CFSTR("int64"), v14, CFSTR("float32"), v13, CFSTR("double"), v12, CFSTR("string"), 0);
    v4 = (void *)getDataType__typeDict;
    getDataType__typeDict = v3;

  }
  v7 = location;
  v8 = (id)objc_msgSend((id)getDataType__typeDict, "valueForKey:", location[0]);
  objc_storeStrong(v7, 0);
  return v8;
}

- (AMDFeatureDescriptor)initWithDictionary:(id)a3 withUserId:(id)a4 featureName:(id)a5
{
  id v5;
  id v6;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  NSObject *v21;
  os_log_type_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  NSObject *v62;
  os_log_type_t v63;
  id v64;
  id v65;
  NSObject *log;
  os_log_type_t v67;
  id v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  id v76;
  uint8_t v77[7];
  os_log_type_t v78;
  os_log_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[8];
  uint64_t v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD v91[8];
  uint64_t v92;
  id v93;
  os_log_type_t v94;
  os_log_t v95;
  id v96;
  os_log_type_t v97;
  os_log_t v98;
  id v99;
  os_log_type_t v100;
  os_log_t v101;
  id v102;
  id v103;
  uint8_t v104[15];
  os_log_type_t v105;
  os_log_t v106;
  id v107;
  _QWORD __b[8];
  id v109;
  id v110;
  uint8_t v111[7];
  os_log_type_t v112;
  os_log_t v113;
  uint8_t v114[7];
  os_log_type_t v115;
  os_log_t v116;
  id v117;
  int v118;
  uint8_t v119[7];
  os_log_type_t type;
  os_log_t oslog;
  id v122;
  objc_super v123;
  id v124;
  id v125;
  id location[2];
  id v127;
  AMDFeatureDescriptor *v128;
  id v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint8_t v132[16];
  uint8_t v133[32];
  uint8_t v134[24];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v127 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v125 = 0;
  objc_storeStrong(&v125, a4);
  v124 = 0;
  objc_storeStrong(&v124, a5);
  v5 = v127;
  v127 = 0;
  v123.receiver = v5;
  v123.super_class = (Class)AMDFeatureDescriptor;
  v127 = -[AMDFeatureDescriptor init](&v123, sel_init);
  objc_storeStrong(&v127, v127);
  objc_msgSend(v127, "setFeatureName:", v124);
  objc_msgSend(v127, "setVersion:", CFSTR("v1"));
  v122 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("source_entity"));
  if (v122)
  {
    v64 = (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v122);
    objc_msgSend(v127, "setFetchRequest:");

    v65 = (id)objc_msgSend(v127, "fetchRequest");
    objc_msgSend(v65, "setResultType:", 2);

    v117 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("properties_to_fetch"));
    if (!v117 || !objc_msgSend(v117, "count"))
    {
      v116 = (os_log_t)MEMORY[0x1E0C81028];
      v115 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      {
        v62 = v116;
        v63 = v115;
        __os_log_helper_16_0_0(v114);
        _os_log_error_impl(&dword_1DC678000, v62, v63, "Missng property descriptors", v114, 2u);
      }
      objc_storeStrong((id *)&v116, 0);
      v128 = 0;
      v118 = 1;
LABEL_93:
      objc_storeStrong(&v117, 0);
      goto LABEL_94;
    }
    if ((unint64_t)objc_msgSend(v117, "count") > 2)
    {
      v113 = (os_log_t)MEMORY[0x1E0C81028];
      v112 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v60 = v113;
        v61 = v112;
        __os_log_helper_16_0_0(v111);
        _os_log_error_impl(&dword_1DC678000, v60, v61, "More than two property descriptors found", v111, 2u);
      }
      objc_storeStrong((id *)&v113, 0);
      v128 = 0;
      v118 = 1;
      goto LABEL_93;
    }
    v110 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v117, "count"));
    memset(__b, 0, sizeof(__b));
    v58 = v117;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", __b, v135, 16);
    if (!v59)
    {
LABEL_51:
      v118 = 0;
LABEL_52:

      if (!v118)
      {
        v36 = (id)objc_msgSend(v127, "fetchRequest");
        objc_msgSend(v36, "setPropertiesToFetch:", v110);

        v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v37 = (id)objc_msgSend(&unk_1EA4D19D8, "objectForKey:", v122);

        if (v37)
        {
          v87 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("userId == %@"), v125);
          v34 = v88;
          v35 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v87);
          objc_msgSend(v34, "addObject:");

          objc_storeStrong(&v87, 0);
        }
        v86 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("predicates"));
        if (v86)
        {
          memset(v84, 0, sizeof(v84));
          v32 = v86;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v84, v130, 16);
          if (v33)
          {
            v29 = *(_QWORD *)v84[2];
            v30 = 0;
            v31 = v33;
            while (1)
            {
              v28 = v30;
              if (*(_QWORD *)v84[2] != v29)
                objc_enumerationMutation(v32);
              v85 = *(_QWORD *)(v84[1] + 8 * v30);
              v26 = v88;
              v27 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v85);
              objc_msgSend(v26, "addObject:");

              ++v30;
              if (v28 + 1 >= v31)
              {
                v30 = 0;
                v31 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v84, v130, 16);
                if (!v31)
                  break;
              }
            }
          }

        }
        v83 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("only_local_data"));
        if (v83 && (objc_msgSend(v83, "BOOLValue") & 1) != 0)
        {
          v82 = 0;
          v80 = 0;
          v25 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", &v80);
          objc_storeStrong(&v82, v80);
          v81 = v25;
          if (v82 || !v81)
          {
            v79 = (os_log_t)MEMORY[0x1E0C81028];
            v78 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              v21 = v79;
              v22 = v78;
              __os_log_helper_16_0_0(v77);
              _os_log_error_impl(&dword_1DC678000, v21, v22, "Local device Id could not be fetched", v77, 2u);
            }
            objc_storeStrong((id *)&v79, 0);
          }
          else
          {
            v23 = v88;
            v24 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceId == %@"), v81);
            objc_msgSend(v23, "addObject:");

          }
          objc_storeStrong(&v81, 0);
          objc_storeStrong(&v82, 0);
        }
        v19 = (id)objc_msgSend(v127, "fetchRequest");
        v18 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v88);
        objc_msgSend(v19, "setPredicate:");

        v6 = (id)objc_msgSend(v127, "aggregatedProperty");
        v20 = v6 == 0;

        if (!v20)
        {
          v17 = (id)objc_msgSend(v127, "fetchRequest");
          v16 = (id)objc_msgSend(v127, "keyProperty");
          v129 = v16;
          v15 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
          objc_msgSend(v17, "setPropertiesToGroupBy:");

        }
        v76 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("sort_descriptors"));
        if (v76 && objc_msgSend(v76, "count"))
        {
          v14 = (id)objc_msgSend(v76, "firstObject");
          v13 = (id)objc_msgSend(v14, "objectForKey:", CFSTR("sort_order"));
          objc_msgSend(v127, "setSortOrder:");

        }
        v11 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("num_records"));
        objc_msgSend(v127, "setMaxRecords:");

        v12 = (id)objc_msgSend(v127, "maxRecords");
        v74 = 0;
        v72 = 0;
        if (v12
          && (v75 = (id)objc_msgSend(v127, "maxRecords"),
              v74 = 1,
              objc_msgSend(v75, "integerValue") > 0))
        {
          v73 = (id)objc_msgSend(v127, "maxRecords");
          v72 = 1;
          v10 = v73;
        }
        else
        {
          v10 = &unk_1EA4CF778;
        }
        objc_msgSend(v127, "setMaxRecords:", v10);
        if ((v72 & 1) != 0)

        if ((v74 & 1) != 0)
        v71 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("do_outer_join"));
        if (v71)
          v9 = objc_msgSend(v71, "intValue");
        else
          v9 = 1;
        objc_msgSend(v127, "setDoOuterJoin:", v9 != 0);
        v70 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("default_join_values"));
        if (v70)
          v8 = v70;
        else
          v8 = &unk_1EA4CF790;
        objc_msgSend(v127, "setDefaultJoinValue:", v8);
        v128 = (AMDFeatureDescriptor *)v127;
        v118 = 1;
        objc_storeStrong(&v70, 0);
        objc_storeStrong(&v71, 0);
        objc_storeStrong(&v76, 0);
        objc_storeStrong(&v83, 0);
        objc_storeStrong(&v86, 0);
        objc_storeStrong(&v88, 0);
      }
      objc_storeStrong(&v110, 0);
      goto LABEL_93;
    }
    v55 = *(_QWORD *)__b[2];
    v56 = 0;
    v57 = v59;
    while (1)
    {
      v54 = v56;
      if (*(_QWORD *)__b[2] != v55)
        objc_enumerationMutation(v58);
      v109 = *(id *)(__b[1] + 8 * v56);
      v107 = (id)objc_msgSend(v109, "valueForKey:", CFSTR("property_name"));
      if (!v107)
      {
        v106 = (os_log_t)MEMORY[0x1E0C81028];
        v105 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v52 = v106;
          v53 = v105;
          __os_log_helper_16_0_0(v104);
          _os_log_error_impl(&dword_1DC678000, v52, v53, "Missng property name", v104, 2u);
        }
        objc_storeStrong((id *)&v106, 0);
        v128 = 0;
        v118 = 1;
        goto LABEL_48;
      }
      v103 = (id)objc_msgSend(v109, "valueForKey:", CFSTR("aggregator_function"));
      if (v103)
      {
        v102 = (id)objc_msgSend(v109, "valueForKey:", CFSTR("aggregated_data_type"));
        if (v102)
        {
          v99 = +[AMDFeatureDescriptor getDataType:](AMDFeatureDescriptor, "getDataType:", v102);
          if (v99)
          {
            v96 = (id)objc_msgSend(v109, "valueForKey:", CFSTR("aggregator_keys"));
            if (objc_msgSend(v96, "count"))
            {
              v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              memset(v91, 0, sizeof(v91));
              v44 = v96;
              v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v91, v131, 16);
              if (v45)
              {
                v41 = *(_QWORD *)v91[2];
                v42 = 0;
                v43 = v45;
                while (1)
                {
                  v40 = v42;
                  if (*(_QWORD *)v91[2] != v41)
                    objc_enumerationMutation(v44);
                  v92 = *(_QWORD *)(v91[1] + 8 * v42);
                  v38 = v93;
                  v39 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v92);
                  objc_msgSend(v38, "addObject:");

                  ++v42;
                  if (v40 + 1 >= v43)
                  {
                    v42 = 0;
                    v43 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v91, v131, 16);
                    if (!v43)
                      break;
                  }
                }
              }

              v90 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:arguments:", v103, v93);
              v89 = objc_alloc_init(MEMORY[0x1E0C97B30]);
              objc_msgSend(v89, "setName:", v107);
              objc_msgSend(v89, "setExpressionResultType:", objc_msgSend(v99, "unsignedIntegerValue"));
              objc_msgSend(v89, "setExpression:", v90);
              objc_msgSend(v110, "addObject:", v89);
              objc_msgSend(v127, "setAggregatedProperty:", v107);
              objc_storeStrong(&v89, 0);
              objc_storeStrong(&v90, 0);
              objc_storeStrong(&v93, 0);
              v118 = 0;
            }
            else
            {
              v95 = (os_log_t)MEMORY[0x1E0C81028];
              v94 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                v46 = v95;
                v47 = v94;
                __os_log_helper_16_2_1_8_64((uint64_t)v132, (uint64_t)v107);
                _os_log_error_impl(&dword_1DC678000, v46, v47, "No aggregator keys for aggregated property %@", v132, 0xCu);
              }
              objc_storeStrong((id *)&v95, 0);
              v128 = 0;
              v118 = 1;
            }
            objc_storeStrong(&v96, 0);
          }
          else
          {
            v98 = (os_log_t)MEMORY[0x1E0C81028];
            v97 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              v48 = v98;
              v49 = v97;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v133, (uint64_t)v107, (uint64_t)v102);
              _os_log_error_impl(&dword_1DC678000, v48, v49, "Invalid data type for aggregated property %@: %@", v133, 0x16u);
            }
            objc_storeStrong((id *)&v98, 0);
            v128 = 0;
            v118 = 1;
          }
          objc_storeStrong(&v99, 0);
        }
        else
        {
          v101 = (os_log_t)MEMORY[0x1E0C81028];
          v100 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            v50 = v101;
            v51 = v100;
            __os_log_helper_16_2_1_8_64((uint64_t)v134, (uint64_t)v107);
            _os_log_error_impl(&dword_1DC678000, v50, v51, "Missng data type for aggregated property %@", v134, 0xCu);
          }
          objc_storeStrong((id *)&v101, 0);
          v128 = 0;
          v118 = 1;
        }
        objc_storeStrong(&v102, 0);
        if (v118)
          goto LABEL_47;
      }
      else
      {
        objc_msgSend(v110, "addObject:", v107);
        objc_msgSend(v127, "setKeyProperty:", v107);
      }
      v118 = 0;
LABEL_47:
      objc_storeStrong(&v103, 0);
LABEL_48:
      objc_storeStrong(&v107, 0);
      if (v118)
        goto LABEL_52;
      ++v56;
      if (v54 + 1 >= v57)
      {
        v56 = 0;
        v57 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", __b, v135, 16);
        if (!v57)
          goto LABEL_51;
      }
    }
  }
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    v67 = type;
    __os_log_helper_16_0_0(v119);
    _os_log_error_impl(&dword_1DC678000, log, v67, "Missing entity name", v119, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v128 = 0;
  v118 = 1;
LABEL_94:
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v127, 0);
  return v128;
}

- (AMDFeatureDescriptor)initWithDictionaryV2:(id)a3 withUserId:(id)a4 featureName:(id)a5 withDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  NSObject *v68;
  os_log_type_t v69;
  NSObject *v70;
  os_log_type_t v71;
  id v72;
  BOOL v73;
  id v74;
  NSObject *v75;
  os_log_type_t v76;
  BOOL v77;
  NSObject *v78;
  os_log_type_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  id v91;
  id v92;
  NSObject *log;
  os_log_type_t v94;
  id v98;
  char v99;
  id v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  id v106;
  char v107;
  id v108;
  uint8_t v109[15];
  os_log_type_t v110;
  os_log_t v111;
  id v112;
  _QWORD v113[8];
  uint64_t v114;
  id v115;
  uint8_t v116[7];
  os_log_type_t v117;
  os_log_t v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  uint8_t v129[7];
  os_log_type_t v130;
  os_log_t v131;
  id v132;
  id v133;
  _QWORD v134[8];
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  _QWORD v140[8];
  uint64_t v141;
  id v142;
  os_log_type_t v143;
  os_log_t v144;
  id v145;
  os_log_type_t v146;
  os_log_t v147;
  id v148;
  os_log_type_t v149;
  os_log_t v150;
  id v151;
  uint8_t v152[7];
  os_log_type_t v153;
  os_log_t v154;
  uint8_t v155[7];
  os_log_type_t v156;
  os_log_t v157;
  id v158;
  id v159;
  uint8_t v160[7];
  os_log_type_t v161;
  os_log_t v162;
  id v163;
  _QWORD __b[8];
  id v165;
  char v166;
  id v167;
  uint8_t v168[7];
  os_log_type_t v169;
  os_log_t v170;
  id v171;
  int v172;
  uint8_t v173[7];
  os_log_type_t type;
  os_log_t oslog;
  id v176;
  objc_super v177;
  id v178;
  id v179;
  id v180;
  id location[2];
  id v182;
  AMDFeatureDescriptor *v183;
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  uint8_t v187[16];
  uint8_t v188[32];
  uint8_t v189[24];
  _BYTE v190[128];
  uint64_t v191;

  v191 = *MEMORY[0x1E0C80C00];
  v182 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v180 = 0;
  objc_storeStrong(&v180, a4);
  v179 = 0;
  objc_storeStrong(&v179, a5);
  v178 = 0;
  objc_storeStrong(&v178, a6);
  v6 = v182;
  v182 = 0;
  v177.receiver = v6;
  v177.super_class = (Class)AMDFeatureDescriptor;
  v182 = -[AMDFeatureDescriptor init](&v177, sel_init);
  objc_storeStrong(&v182, v182);
  objc_msgSend(v182, "setFeatureName:", v179);
  objc_msgSend(v182, "setVersion:", CFSTR("v2"));
  v176 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("source_entity"));
  if (v176)
  {
    v91 = (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v176);
    objc_msgSend(v182, "setFetchRequest:");

    v92 = (id)objc_msgSend(v182, "fetchRequest");
    objc_msgSend(v92, "setResultType:", 2);

    v171 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("properties_to_fetch"));
    if (!v171 || !objc_msgSend(v171, "count"))
    {
      v170 = (os_log_t)MEMORY[0x1E0C81028];
      v169 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
      {
        v89 = v170;
        v90 = v169;
        __os_log_helper_16_0_0(v168);
        _os_log_error_impl(&dword_1DC678000, v89, v90, "Missng property descriptors", v168, 2u);
      }
      objc_storeStrong((id *)&v170, 0);
      v183 = 0;
      v172 = 1;
LABEL_131:
      objc_storeStrong(&v171, 0);
      goto LABEL_132;
    }
    v167 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v171, "count"));
    v166 = 0;
    v86 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v182, "setPropertyDict:");

    memset(__b, 0, sizeof(__b));
    v87 = v171;
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", __b, v190, 16);
    if (!v88)
    {
LABEL_59:
      v172 = 0;
LABEL_60:

      if (!v172)
      {
        v55 = (id)objc_msgSend(v182, "fetchRequest");
        objc_msgSend(v55, "setPropertiesToFetch:", v167);

        v137 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("having_predicate"));
        if ((v166 & 1) != 0 && v137 && objc_msgSend(v137, "count"))
        {
          v136 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          memset(v134, 0, sizeof(v134));
          v53 = v137;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v134, v185, 16);
          if (v54)
          {
            v50 = *(_QWORD *)v134[2];
            v51 = 0;
            v52 = v54;
            while (1)
            {
              v49 = v51;
              if (*(_QWORD *)v134[2] != v50)
                objc_enumerationMutation(v53);
              v135 = *(id *)(v134[1] + 8 * v51);
              v133 = (id)objc_msgSend(v135, "objectForKey:", CFSTR("variable_name"));
              v132 = (id)objc_msgSend(v135, "objectForKey:", CFSTR("predicate"));
              if (v133 && v132)
              {
                v128 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", v133);
                v127 = (id)objc_msgSend(CFSTR("%@ "), "stringByAppendingString:", v132);
                v126 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v127, v128);
                objc_msgSend(v136, "addObject:", v126);
                objc_storeStrong(&v126, 0);
                objc_storeStrong(&v127, 0);
                objc_storeStrong(&v128, 0);
                v172 = 0;
              }
              else
              {
                v131 = (os_log_t)MEMORY[0x1E0C81028];
                v130 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                {
                  v47 = v131;
                  v48 = v130;
                  __os_log_helper_16_0_0(v129);
                  _os_log_error_impl(&dword_1DC678000, v47, v48, "Incomplete predicate dictionary within the having predicate", v129, 2u);
                }
                objc_storeStrong((id *)&v131, 0);
                v172 = 7;
              }
              objc_storeStrong(&v132, 0);
              objc_storeStrong(&v133, 0);
              ++v51;
              if (v49 + 1 >= v52)
              {
                v51 = 0;
                v52 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v134, v185, 16);
                if (!v52)
                  break;
              }
            }
          }

          v125 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v136);
          v46 = (id)objc_msgSend(v182, "fetchRequest");
          objc_msgSend(v46, "setHavingPredicate:", v125);

          objc_storeStrong(&v125, 0);
          objc_storeStrong(&v136, 0);
        }
        v124 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v45 = (id)objc_msgSend(&unk_1EA4D1A00, "objectForKey:", v176);

        if (v45)
        {
          v123 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("userId == %@"), v180);
          v43 = v124;
          v44 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v123);
          objc_msgSend(v43, "addObject:");

          objc_storeStrong(&v123, 0);
        }
        v122 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("only_local_data"));
        if (v122 && (objc_msgSend(v122, "BOOLValue") & 1) != 0)
        {
          v121 = 0;
          v119 = 0;
          v42 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", &v119);
          objc_storeStrong(&v121, v119);
          v120 = v42;
          if (v121 || !v120)
          {
            v118 = (os_log_t)MEMORY[0x1E0C81028];
            v117 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              v38 = v118;
              v39 = v117;
              __os_log_helper_16_0_0(v116);
              _os_log_error_impl(&dword_1DC678000, v38, v39, "Local device Id could not be fetched", v116, 2u);
            }
            objc_storeStrong((id *)&v118, 0);
          }
          else
          {
            v40 = v124;
            v41 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceId == %@"), v120);
            objc_msgSend(v40, "addObject:");

          }
          objc_storeStrong(&v120, 0);
          objc_storeStrong(&v121, 0);
        }
        v115 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("predicates"));
        if (v115)
        {
          memset(v113, 0, sizeof(v113));
          v36 = v115;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v113, v184, 16);
          if (v37)
          {
            v33 = *(_QWORD *)v113[2];
            v34 = 0;
            v35 = v37;
            while (1)
            {
              v32 = v34;
              if (*(_QWORD *)v113[2] != v33)
                objc_enumerationMutation(v36);
              v114 = *(_QWORD *)(v113[1] + 8 * v34);
              v30 = v124;
              v31 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v114);
              objc_msgSend(v30, "addObject:");

              ++v34;
              if (v32 + 1 >= v35)
              {
                v34 = 0;
                v35 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v113, v184, 16);
                if (!v35)
                  break;
              }
            }
          }

        }
        v29 = (id)objc_msgSend(v182, "fetchRequest");
        v28 = (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v124);
        objc_msgSend(v29, "setPredicate:");

        v112 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("group_by_descriptors"));
        if (v112)
        {
          v24 = (id)objc_msgSend(v182, "aggregatedPropertyList");
          v107 = 0;
          v25 = 0;
          if (v24)
          {
            v108 = (id)objc_msgSend(v182, "aggregatedPropertyList");
            v107 = 1;
            v25 = 0;
            if (objc_msgSend(v108, "count"))
              v25 = objc_msgSend(v112, "count") != 0;
          }
          if ((v107 & 1) != 0)

          if (v25)
          {
            v23 = (id)objc_msgSend(v182, "fetchRequest");
            objc_msgSend(v23, "setPropertiesToGroupBy:", v112);

          }
          v106 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("sort_descriptors"));
          if (v106 && objc_msgSend(v106, "count"))
          {
            v20 = (id)objc_msgSend(v106, "firstObject");
            v19 = (id)objc_msgSend(v20, "objectForKey:", CFSTR("sort_order"));
            objc_msgSend(v182, "setSortOrder:");

            v22 = (id)objc_msgSend(v106, "firstObject");
            v21 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("sort_key"));
            objc_msgSend(v182, "setSortKey:");

          }
          v17 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("num_records"));
          objc_msgSend(v182, "setMaxRecords:");

          v18 = (id)objc_msgSend(v182, "maxRecords");
          v104 = 0;
          v102 = 0;
          if (v18
            && (v105 = (id)objc_msgSend(v182, "maxRecords"),
                v104 = 1,
                objc_msgSend(v105, "integerValue") > 0))
          {
            v103 = (id)objc_msgSend(v182, "maxRecords");
            v102 = 1;
            v16 = v103;
          }
          else
          {
            v16 = &unk_1EA4CF778;
          }
          objc_msgSend(v182, "setMaxRecords:", v16);
          if ((v102 & 1) != 0)

          if ((v104 & 1) != 0)
          v101 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("join_descriptors"));
          v99 = 0;
          v15 = 0;
          if (v101)
          {
            v100 = (id)objc_msgSend(v101, "firstObject");
            v99 = 1;
            v15 = v100 != 0;
          }
          if ((v99 & 1) != 0)

          if (!v15)
            goto LABEL_127;
          v98 = (id)objc_msgSend(v101, "firstObject");
          v10 = (id)objc_msgSend(v98, "objectForKey:", CFSTR("key"));
          objc_msgSend(v182, "setKeyProperty:");

          v11 = (id)objc_msgSend(v98, "objectForKey:", CFSTR("type"));
          objc_msgSend(v182, "setJoinType:");

          v12 = (id)objc_msgSend(v98, "objectForKey:", CFSTR("table"));
          objc_msgSend(v182, "setJoinTable:");

          v13 = (id)objc_msgSend(v98, "objectForKey:", CFSTR("default_join_values"));
          objc_msgSend(v182, "setDefaultJoinValueDict:");

          v14 = (id)objc_msgSend(v98, "objectForKey:", CFSTR("columns_to_fetch"));
          objc_msgSend(v182, "setJoinRequiredColumns:");

          objc_msgSend(v182, "setJoinTableDomain:", v178);
          if ((objc_msgSend(v182, "checkJoinParameters") & 1) != 0)
          {
            v172 = 0;
          }
          else
          {
            v183 = 0;
            v172 = 1;
          }
          objc_storeStrong(&v98, 0);
          if (!v172)
          {
LABEL_127:
            v183 = (AMDFeatureDescriptor *)v182;
            v172 = 1;
          }
          objc_storeStrong(&v101, 0);
          objc_storeStrong(&v106, 0);
        }
        else
        {
          v111 = (os_log_t)MEMORY[0x1E0C81028];
          v110 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            v26 = v111;
            v27 = v110;
            __os_log_helper_16_0_0(v109);
            _os_log_error_impl(&dword_1DC678000, v26, v27, "Properties to group by array is absent", v109, 2u);
          }
          objc_storeStrong((id *)&v111, 0);
          v183 = 0;
          v172 = 1;
        }
        objc_storeStrong(&v112, 0);
        objc_storeStrong(&v115, 0);
        objc_storeStrong(&v122, 0);
        objc_storeStrong(&v124, 0);
        objc_storeStrong(&v137, 0);
      }
      objc_storeStrong(&v167, 0);
      goto LABEL_131;
    }
    v83 = *(_QWORD *)__b[2];
    v84 = 0;
    v85 = v88;
    while (1)
    {
      v82 = v84;
      if (*(_QWORD *)__b[2] != v83)
        objc_enumerationMutation(v87);
      v165 = *(id *)(__b[1] + 8 * v84);
      v163 = (id)objc_msgSend(v165, "valueForKey:", CFSTR("property_name"));
      if (!v163)
      {
        v162 = (os_log_t)MEMORY[0x1E0C81028];
        v161 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
        {
          v80 = v162;
          v81 = v161;
          __os_log_helper_16_0_0(v160);
          _os_log_error_impl(&dword_1DC678000, v80, v81, "Missng property name", v160, 2u);
        }
        objc_storeStrong((id *)&v162, 0);
        v183 = 0;
        v172 = 1;
        goto LABEL_56;
      }
      v159 = (id)objc_msgSend(v165, "valueForKey:", CFSTR("aggregator_function"));
      if (v159)
      {
        v166 = 1;
        v8 = (id)objc_msgSend(v182, "aggregatedPropertyList");
        v73 = v8 != 0;

        if (!v73)
        {
          v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v182, "setAggregatedPropertyList:");

        }
        v151 = (id)objc_msgSend(v165, "valueForKey:", CFSTR("aggregated_data_type"));
        if (v151)
        {
          v148 = +[AMDFeatureDescriptor getDataType:](AMDFeatureDescriptor, "getDataType:", v151);
          if (v148)
          {
            v145 = (id)objc_msgSend(v165, "valueForKey:", CFSTR("aggregator_keys"));
            if (objc_msgSend(v145, "count"))
            {
              v142 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              memset(v140, 0, sizeof(v140));
              v64 = v145;
              v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", v140, v186, 16);
              if (v65)
              {
                v61 = *(_QWORD *)v140[2];
                v62 = 0;
                v63 = v65;
                while (1)
                {
                  v60 = v62;
                  if (*(_QWORD *)v140[2] != v61)
                    objc_enumerationMutation(v64);
                  v141 = *(_QWORD *)(v140[1] + 8 * v62);
                  v58 = v142;
                  v59 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v141);
                  objc_msgSend(v58, "addObject:");

                  ++v62;
                  if (v60 + 1 >= v63)
                  {
                    v62 = 0;
                    v63 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", v140, v186, 16);
                    if (!v63)
                      break;
                  }
                }
              }

              v139 = (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:arguments:", v159, v142);
              v138 = objc_alloc_init(MEMORY[0x1E0C97B30]);
              objc_msgSend(v138, "setName:", v163);
              objc_msgSend(v138, "setExpressionResultType:", objc_msgSend(v148, "unsignedIntegerValue"));
              objc_msgSend(v138, "setExpression:", v139);
              objc_msgSend(v167, "addObject:", v138);
              objc_msgSend(v182, "setAggregatedProperty:", v163);
              v56 = (id)objc_msgSend(v182, "aggregatedPropertyList");
              objc_msgSend(v56, "addObject:", v163);

              v57 = (id)objc_msgSend(v182, "propertyDict");
              objc_msgSend(v57, "setObject:forKey:", v151, v163);

              objc_storeStrong(&v138, 0);
              objc_storeStrong(&v139, 0);
              objc_storeStrong(&v142, 0);
              v172 = 0;
            }
            else
            {
              v144 = (os_log_t)MEMORY[0x1E0C81028];
              v143 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
              {
                v66 = v144;
                v67 = v143;
                __os_log_helper_16_2_1_8_64((uint64_t)v187, (uint64_t)v163);
                _os_log_error_impl(&dword_1DC678000, v66, v67, "No aggregator keys for aggregated property %@", v187, 0xCu);
              }
              objc_storeStrong((id *)&v144, 0);
              v183 = 0;
              v172 = 1;
            }
            objc_storeStrong(&v145, 0);
          }
          else
          {
            v147 = (os_log_t)MEMORY[0x1E0C81028];
            v146 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              v68 = v147;
              v69 = v146;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v188, (uint64_t)v163, (uint64_t)v151);
              _os_log_error_impl(&dword_1DC678000, v68, v69, "Invalid data type for aggregated property %@: %@", v188, 0x16u);
            }
            objc_storeStrong((id *)&v147, 0);
            v183 = 0;
            v172 = 1;
          }
          objc_storeStrong(&v148, 0);
        }
        else
        {
          v150 = (os_log_t)MEMORY[0x1E0C81028];
          v149 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
          {
            v70 = v150;
            v71 = v149;
            __os_log_helper_16_2_1_8_64((uint64_t)v189, (uint64_t)v163);
            _os_log_error_impl(&dword_1DC678000, v70, v71, "Missng data type for aggregated property %@", v189, 0xCu);
          }
          objc_storeStrong((id *)&v150, 0);
          v183 = 0;
          v172 = 1;
        }
        objc_storeStrong(&v151, 0);
        if (v172)
          goto LABEL_55;
      }
      else
      {
        v158 = (id)objc_msgSend(v165, "objectForKey:", CFSTR("data_type"));
        if (v158)
        {
          v7 = +[AMDFeatureDescriptor getDataType:](AMDFeatureDescriptor, "getDataType:", v158);
          v77 = v7 != 0;

          if (v77)
          {
            objc_msgSend(v167, "addObject:", v163);
            v74 = (id)objc_msgSend(v182, "propertyDict");
            objc_msgSend(v74, "setObject:forKey:", v158, v163);

            v172 = 0;
          }
          else
          {
            v154 = (os_log_t)MEMORY[0x1E0C81028];
            v153 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
            {
              v75 = v154;
              v76 = v153;
              __os_log_helper_16_0_0(v152);
              _os_log_error_impl(&dword_1DC678000, v75, v76, "Invalid property data type provided", v152, 2u);
            }
            objc_storeStrong((id *)&v154, 0);
            v183 = 0;
            v172 = 1;
          }
        }
        else
        {
          v157 = (os_log_t)MEMORY[0x1E0C81028];
          v156 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            v78 = v157;
            v79 = v156;
            __os_log_helper_16_0_0(v155);
            _os_log_error_impl(&dword_1DC678000, v78, v79, "Missing property data type", v155, 2u);
          }
          objc_storeStrong((id *)&v157, 0);
          v183 = 0;
          v172 = 1;
        }
        objc_storeStrong(&v158, 0);
        if (v172)
          goto LABEL_55;
      }
      v172 = 0;
LABEL_55:
      objc_storeStrong(&v159, 0);
LABEL_56:
      objc_storeStrong(&v163, 0);
      if (v172)
        goto LABEL_60;
      ++v84;
      if (v82 + 1 >= v85)
      {
        v84 = 0;
        v85 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", __b, v190, 16);
        if (!v85)
          goto LABEL_59;
      }
    }
  }
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    v94 = type;
    __os_log_helper_16_0_0(v173);
    _os_log_error_impl(&dword_1DC678000, log, v94, "Missing entity name", v173, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v183 = 0;
  v172 = 1;
LABEL_132:
  objc_storeStrong(&v176, 0);
  objc_storeStrong(&v178, 0);
  objc_storeStrong(&v179, 0);
  objc_storeStrong(&v180, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v182, 0);
  return v183;
}

- (id)getFeature:(id *)a3
{
  id location;
  id *v5;
  SEL v6;
  AMDFeatureDescriptor *v7;
  id v8;

  v7 = self;
  v6 = a2;
  v5 = a3;
  location = -[AMDFeatureDescriptor getFeatureData:](self, "getFeatureData:", a3);
  if (!*v5 && location)
    v8 = +[AMDFeature featureFromValue:](AMDFeature, "featureFromValue:", location);
  else
    v8 = 0;
  objc_storeStrong(&location, 0);
  return v8;
}

- (BOOL)checkJoinParameters
{
  NSString *v3;
  NSArray *v4;
  BOOL v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  NSObject *v10;
  os_log_type_t v11;
  NSString *v12;
  BOOL v13;
  NSObject *log;
  os_log_type_t type;
  NSString *v16;
  char v17;
  id v18;
  char v19;
  NSArray *v20;
  os_log_type_t v21;
  id v22;
  uint8_t v23[7];
  char v24;
  id v25;
  char v26;
  NSString *v27;
  uint8_t v28[15];
  char v29;
  id location;
  char v31;
  NSString *v32;
  SEL v33;
  AMDFeatureDescriptor *v34;
  char v35;
  uint8_t v36[16];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v34 = self;
  v33 = a2;
  v16 = -[AMDFeatureDescriptor joinType](self, "joinType");
  v31 = 0;
  v17 = 1;
  if (!-[NSString isEqualToString:](v16, "isEqualToString:", CFSTR("inner")))
  {
    v32 = -[AMDFeatureDescriptor joinType](v34, "joinType");
    v31 = 1;
    v17 = -[NSString isEqualToString:](v32, "isEqualToString:", CFSTR("outer"));
  }
  if ((v31 & 1) != 0)

  if ((v17 & 1) != 0)
  {
    v12 = -[AMDFeatureDescriptor joinTable](v34, "joinTable");
    v26 = 0;
    v13 = 1;
    if (v12)
    {
      v27 = -[AMDFeatureDescriptor joinTableDomain](v34, "joinTableDomain");
      v26 = 1;
      v13 = v27 == 0;
    }
    if ((v26 & 1) != 0)

    if (v13)
    {
      v25 = MEMORY[0x1E0C81028];
      v24 = 16;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        v10 = v25;
        v11 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1DC678000, v10, v11, "Both the feature name to be joined to the descriptor result, and the feature domain must be specified", v23, 2u);
      }
      objc_storeStrong(&v25, 0);
      v35 = 0;
    }
    else
    {
      v8 = -[AMDFeatureDescriptor joinTableDomain](v34, "joinTableDomain");
      v9 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:") != 0;

      if (v9)
      {
        v4 = -[AMDFeatureDescriptor joinRequiredColumns](v34, "joinRequiredColumns");
        v19 = 0;
        v5 = 1;
        if (v4)
        {
          v20 = -[AMDFeatureDescriptor joinRequiredColumns](v34, "joinRequiredColumns");
          v19 = 1;
          v5 = -[NSArray count](v20, "count") == 0;
        }
        if ((v19 & 1) != 0)

        if (v5)
        {
          v18 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            v3 = -[AMDFeatureDescriptor joinTable](v34, "joinTable");
            __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v3);
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "Required fields from feature: %@ have not been provided", v36, 0xCu);

          }
          objc_storeStrong(&v18, 0);
          v35 = 0;
        }
        else
        {
          v35 = 1;
        }
      }
      else
      {
        v22 = MEMORY[0x1E0C81028];
        v21 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          v7 = -[AMDFeatureDescriptor joinTableDomain](v34, "joinTableDomain");
          v6 = -[AMDFeatureDescriptor joinTable](v34, "joinTable");
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v7, (uint64_t)v6);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v22, v21, "Unsupported domain:%@ passed for feature: %@", v37, 0x16u);

        }
        objc_storeStrong(&v22, 0);
        v35 = 0;
      }
    }
  }
  else
  {
    location = MEMORY[0x1E0C81028];
    v29 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      type = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_error_impl(&dword_1DC678000, log, type, "Incorrect join type passed. Only inner and outer joins are supported", v28, 2u);
    }
    objc_storeStrong(&location, 0);
    v35 = 0;
  }
  return v35 & 1;
}

- (id)getFeatureData:(id *)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  AMDFeatureDescriptor *v9;
  id v10;
  AMDFeatureDescriptor *v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  NSString *v15;
  NSString *v16;
  BOOL v17;
  NSString *v18;
  BOOL v19;
  id v20;
  AMDFeatureDescriptor *v21;
  NSString *v22;
  BOOL v23;
  NSString *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t v30[7];
  os_log_type_t v31;
  os_log_t v32;
  char v33;
  id v34;
  id location;
  char v36;
  id v37;
  char v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  int v42;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v45;
  int v46;
  int v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id v51[3];
  id v52;
  uint64_t v53;
  uint64_t *v54;
  int v55;
  int v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  int v62;
  int v63;
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  id *v67;
  SEL v68;
  AMDFeatureDescriptor *v69;
  id v70;
  uint8_t v71[32];
  uint8_t v72[24];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v69 = self;
  v68 = a2;
  v67 = a3;
  v60 = 0;
  v61 = &v60;
  v62 = 838860800;
  v63 = 48;
  v64 = __Block_byref_object_copy__12;
  v65 = __Block_byref_object_dispose__12;
  v66 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 838860800;
  v56 = 48;
  v57 = __Block_byref_object_copy__12;
  v58 = __Block_byref_object_dispose__12;
  v59 = 0;
  v29 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  v52 = (id)objc_msgSend(v29, "getManagedObjectContext");

  v28 = v52;
  v45 = MEMORY[0x1E0C809B0];
  v46 = -1073741824;
  v47 = 0;
  v48 = __39__AMDFeatureDescriptor_getFeatureData___block_invoke;
  v49 = &unk_1EA4B51E8;
  v50 = v52;
  v51[0] = v69;
  v51[1] = &v60;
  v51[2] = &v53;
  objc_msgSend(v28, "performBlockAndWait:", &v45);
  if (v61[5])
  {
    v27 = objc_retainAutorelease((id)v61[5]);
    *v67 = v27;
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v26 = (id)objc_msgSend(*v67, "localizedDescription");
      __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v26);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "Error executing aggregation: %@", v72, 0xCu);

    }
    objc_storeStrong((id *)&oslog, 0);
    v70 = 0;
    v42 = 1;
  }
  else if (v54[5])
  {
    v41 = (os_log_t)MEMORY[0x1E0C81028];
    v40 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v25 = objc_msgSend((id)v54[5], "count");
      v24 = -[AMDFeatureDescriptor featureName](v69, "featureName");
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v71, v25, (uint64_t)v24);
      _os_log_debug_impl(&dword_1DC678000, v41, v40, "Got %lu records for feature %@", v71, 0x16u);

    }
    objc_storeStrong((id *)&v41, 0);
    v22 = -[AMDFeatureDescriptor version](v69, "version");
    v23 = -[NSString isEqualToString:](v22, "isEqualToString:", CFSTR("v1"));

    if (v23)
    {
      -[AMDFeatureDescriptor outerJoin:](v69, "outerJoin:", v54[5]);
      v21 = v69;
      v20 = -[AMDFeatureDescriptor sort:](v69, "sort:", v54[5]);
      v70 = -[AMDFeatureDescriptor prepareResult:](v21, "prepareResult:");

      v42 = 1;
    }
    else
    {
      v38 = 0;
      v36 = 0;
      v18 = -[AMDFeatureDescriptor joinType](v69, "joinType");
      v19 = 0;
      if (v18)
      {
        v39 = -[AMDFeatureDescriptor joinTable](v69, "joinTable");
        v38 = 1;
        v19 = 0;
        if (v39)
        {
          v37 = -[AMDFeatureDescriptor joinTableDomain](v69, "joinTableDomain");
          v36 = 1;
          v19 = v37 != 0;
        }
      }
      if ((v36 & 1) != 0)

      if ((v38 & 1) != 0)
      if (v19)
      {
        location = 0;
        v16 = -[AMDFeatureDescriptor joinType](v69, "joinType");
        v17 = -[NSString isEqualToString:](v16, "isEqualToString:", CFSTR("inner"));

        if (v17)
        {
          v3 = -[AMDFeatureDescriptor performInnerJoin:](v69, "performInnerJoin:", v54[5]);
          v4 = location;
          location = v3;

        }
        else
        {
          v33 = 0;
          v15 = -[AMDFeatureDescriptor joinType](v69, "joinType");
          v14 = 0;
          if (-[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("outer")))
          {
            v34 = -[AMDFeatureDescriptor defaultJoinValueDict](v69, "defaultJoinValueDict");
            v33 = 1;
            v14 = v34 != 0;
          }
          if ((v33 & 1) != 0)

          if (v14)
          {
            v5 = -[AMDFeatureDescriptor performOuterJoin:](v69, "performOuterJoin:", v54[5]);
            v6 = location;
            location = v5;

          }
          else
          {
            v32 = (os_log_t)MEMORY[0x1E0C81028];
            v31 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v12 = v32;
              v13 = v31;
              __os_log_helper_16_0_0(v30);
              _os_log_error_impl(&dword_1DC678000, v12, v13, "Invalid join parameters passed", v30, 2u);
            }
            objc_storeStrong((id *)&v32, 0);
          }
        }
        if (location)
        {
          v11 = v69;
          v10 = -[AMDFeatureDescriptor sort:](v69, "sort:", location);
          v70 = -[AMDFeatureDescriptor prepareArrayResult:](v11, "prepareArrayResult:");

        }
        else
        {
          v70 = 0;
        }
        v42 = 1;
        objc_storeStrong(&location, 0);
      }
      else
      {
        v9 = v69;
        v8 = -[AMDFeatureDescriptor sort:](v69, "sort:", v54[5]);
        v70 = -[AMDFeatureDescriptor prepareArrayResult:](v9, "prepareArrayResult:");

        v42 = 1;
      }
    }
  }
  else
  {
    v70 = 0;
    v42 = 1;
  }
  objc_storeStrong(v51, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v52, 0);
  _Block_object_dispose(&v53, 8);
  objc_storeStrong(&v59, 0);
  _Block_object_dispose(&v60, 8);
  objc_storeStrong(&v66, 0);
  return v70;
}

void __39__AMDFeatureDescriptor_getFeatureData___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id *location;
  id v6;
  id v7;
  id v9;
  id v10[3];

  v10[2] = (id)a1;
  v10[1] = (id)a1;
  v4 = *(void **)(a1 + 32);
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "fetchRequest");
  location = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v9 = *location;
  v6 = (id)objc_msgSend(v4, "executeFetchRequest:error:");
  objc_storeStrong(location, v9);
  v10[0] = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && v10[0])
  {
    v1 = objc_msgSend(v10[0], "mutableCopy");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v1;

  }
  objc_storeStrong(v10, 0);
}

- (void)outerJoin:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  NSString *v14;
  NSMutableArray *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  BOOL v23;
  NSString *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  NSString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  int v48;
  _QWORD v49[9];
  id v50;
  char v51;
  id v52;
  _QWORD v53[8];
  uint64_t v54;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id obj;
  id v64;
  id v65;
  int v66;
  char v67;
  id v68;
  id location[2];
  AMDFeatureDescriptor *v70;
  NSString *v71;
  uint64_t v72;
  _BYTE v73[128];
  _QWORD v74[2];
  _QWORD v75[2];
  _BYTE v76[128];
  uint8_t v77[24];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v67 = 0;
  LOBYTE(v48) = 1;
  if (-[AMDFeatureDescriptor doOuterJoin](v70, "doOuterJoin"))
  {
    v68 = -[AMDFeatureDescriptor keyProperty](v70, "keyProperty");
    v67 = 1;
    v48 = objc_msgSend(v68, "isEqualToString:", 0x1EA4B91E8) ^ 1;
  }
  if ((v67 & 1) != 0)

  if ((v48 & 1) != 0)
  {
    v66 = 1;
  }
  else
  {
    v65 = 0;
    obj = 0;
    v47 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", 0x1EA4C2488, CFSTR("apps"), &obj);
    objc_storeStrong(&v65, obj);
    v64 = v47;
    if (!v65 && v64)
    {
      v61 = v65;
      v46 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", 0x1EA4C2568, CFSTR("apps"), &v61);
      objc_storeStrong(&v65, v61);
      v62 = v46;
      if (!v65 && v62)
      {
        v40 = (void *)MEMORY[0x1E0C99E20];
        v41 = (id)objc_msgSend(v64, "allKeys");
        v60 = (id)objc_msgSend(v40, "setWithArray:");

        v42 = (void *)MEMORY[0x1E0C99E60];
        v43 = (id)objc_msgSend(v62, "allKeys");
        v59 = (id)objc_msgSend(v42, "setWithArray:");

        objc_msgSend(v60, "unionSet:", v59);
        memset(__b, 0, sizeof(__b));
        v44 = location[0];
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", __b, v78, 16);
        if (v45)
        {
          v37 = *(_QWORD *)__b[2];
          v38 = 0;
          v39 = v45;
          while (1)
          {
            v36 = v38;
            if (*(_QWORD *)__b[2] != v37)
              objc_enumerationMutation(v44);
            v58 = *(void **)(__b[1] + 8 * v38);
            v33 = v60;
            v32 = v58;
            v35 = -[AMDFeatureDescriptor keyProperty](v70, "keyProperty");
            v34 = (id)objc_msgSend(v32, "objectForKey:");
            objc_msgSend(v33, "removeObject:");

            ++v38;
            if (v36 + 1 >= v39)
            {
              v38 = 0;
              v39 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", __b, v78, 16);
              if (!v39)
                break;
            }
          }
        }

        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v77, objc_msgSend(v60, "count"));
          _os_log_debug_impl(&dword_1DC678000, oslog, type, "Adding %lu records due to outer join", v77, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        memset(v53, 0, sizeof(v53));
        v30 = v60;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", v53, v76, 16);
        if (v31)
        {
          v27 = *(_QWORD *)v53[2];
          v28 = 0;
          v29 = v31;
          while (1)
          {
            v26 = v28;
            if (*(_QWORD *)v53[2] != v27)
              objc_enumerationMutation(v30);
            v54 = *(_QWORD *)(v53[1] + 8 * v28);
            v24 = -[AMDFeatureDescriptor aggregatedProperty](v70, "aggregatedProperty");
            v51 = 0;
            v25 = 1;
            if (!v24)
            {
              v52 = -[AMDFeatureDescriptor aggregatedPropertyList](v70, "aggregatedPropertyList");
              v51 = 1;
              v25 = v52 != 0;
            }
            if ((v51 & 1) != 0)

            if (v25)
            {
              v22 = -[AMDFeatureDescriptor version](v70, "version");
              v23 = -[NSString isEqualToString:](v22, "isEqualToString:", CFSTR("v1"));

              if (v23)
              {
                v17 = location[0];
                v21 = -[AMDFeatureDescriptor keyProperty](v70, "keyProperty");
                v74[0] = v21;
                v75[0] = v54;
                v20 = -[AMDFeatureDescriptor aggregatedProperty](v70, "aggregatedProperty");
                v74[1] = v20;
                v19 = -[AMDFeatureDescriptor defaultJoinValue](v70, "defaultJoinValue");
                v75[1] = v19;
                v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
                objc_msgSend(v17, "addObject:");

              }
              else
              {
                v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v13 = v50;
                v12 = v54;
                v14 = -[AMDFeatureDescriptor keyProperty](v70, "keyProperty");
                objc_msgSend(v13, "setObject:forKey:", v12);

                memset(v49, 0, 0x40uLL);
                v15 = -[AMDFeatureDescriptor aggregatedPropertyList](v70, "aggregatedPropertyList");
                v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", v49, v73, 16);
                if (v16)
                {
                  v9 = *(_QWORD *)v49[2];
                  v10 = 0;
                  v11 = v16;
                  while (1)
                  {
                    v8 = v10;
                    if (*(_QWORD *)v49[2] != v9)
                      objc_enumerationMutation(v15);
                    v49[8] = *(_QWORD *)(v49[1] + 8 * v10);
                    v6 = v50;
                    v7 = -[AMDFeatureDescriptor defaultJoinValue](v70, "defaultJoinValue");
                    objc_msgSend(v6, "setObject:forKey:");

                    ++v10;
                    if (v8 + 1 >= v11)
                    {
                      v10 = 0;
                      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", v49, v73, 16);
                      if (!v11)
                        break;
                    }
                  }
                }

                objc_msgSend(location[0], "addObject:", v50);
                objc_storeStrong(&v50, 0);
              }
            }
            else
            {
              v3 = location[0];
              v5 = -[AMDFeatureDescriptor keyProperty](v70, "keyProperty");
              v71 = v5;
              v72 = v54;
              v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
              objc_msgSend(v3, "addObject:");

            }
            ++v28;
            if (v26 + 1 >= v29)
            {
              v28 = 0;
              v29 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", v53, v76, 16);
              if (!v29)
                break;
            }
          }
        }

        objc_storeStrong(&v59, 0);
        objc_storeStrong(&v60, 0);
        v66 = 0;
      }
      else
      {
        v66 = 1;
      }
      objc_storeStrong(&v62, 0);
    }
    else
    {
      v66 = 1;
    }
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)transformTPDataForJoin:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSString *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  unint64_t v19;
  NSString *v20;
  id v21;
  NSString *v22;
  id v23;
  _QWORD __b[8];
  void *v25;
  id v26;
  id v27;
  int i;
  id v29;
  id v30;
  id v31;
  int v32;
  id v33;
  id v34;
  id v35;
  id location[2];
  AMDFeatureDescriptor *v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BBF28);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = -[AMDFeatureDescriptor keyProperty](v37, "keyProperty");
  v33 = (id)objc_msgSend(v35, "objectForKey:");

  if (v33)
  {
    v31 = (id)objc_msgSend(v33, "objectForKey:", CFSTR("featureValue"));
    v21 = (id)objc_msgSend(v33, "objectForKey:", CFSTR("featureFormat"));
    v20 = -[AMDFeatureDescriptor keyProperty](v37, "keyProperty");
    objc_msgSend(v34, "setObject:forKey:", v21);

    v30 = (id)objc_msgSend(v35, "allKeys");
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    for (i = 0; ; ++i)
    {
      v19 = i;
      if (v19 >= objc_msgSend(v31, "count"))
        break;
      v27 = (id)objc_msgSend(v31, "objectAtIndex:", i);
      v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      memset(__b, 0, sizeof(__b));
      obj = v30;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
      if (v18)
      {
        v14 = *(_QWORD *)__b[2];
        v15 = 0;
        v16 = v18;
        while (1)
        {
          v13 = v15;
          if (*(_QWORD *)__b[2] != v14)
            objc_enumerationMutation(obj);
          v25 = *(void **)(__b[1] + 8 * v15);
          v10 = v25;
          v11 = -[AMDFeatureDescriptor keyProperty](v37, "keyProperty");
          v12 = objc_msgSend(v10, "isEqualToString:");

          if ((v12 & 1) == 0)
          {
            if (!i)
            {
              v7 = v34;
              v9 = (id)objc_msgSend(v35, "objectForKey:", v25);
              v8 = (id)objc_msgSend(v9, "objectForKey:", CFSTR("featureFormat"));
              objc_msgSend(v7, "setObject:forKey:");

            }
            v4 = (id)objc_msgSend(v35, "objectForKey:", v25);
            v23 = (id)objc_msgSend(v4, "objectForKey:", CFSTR("featureValue"));

            v5 = v26;
            v6 = (id)objc_msgSend(v23, "objectAtIndex:", i);
            objc_msgSend(v5, "setObject:forKey:");

            objc_storeStrong(&v23, 0);
          }
          ++v15;
          if (v13 + 1 >= v16)
          {
            v15 = 0;
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
            if (!v16)
              break;
          }
        }
      }

      objc_msgSend(v29, "setObject:forKey:", v26, v27);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
    }
    v39[0] = CFSTR("featureValue");
    v40[0] = v29;
    v39[1] = CFSTR("featureFormat");
    v40[1] = v34;
    v38 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v32 = 1;
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v38 = 0;
    v32 = 1;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  return v38;
}

- (id)performInnerJoin:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSArray *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSArray *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
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
  void *v32;
  id v33;
  id v34;
  NSArray *v35;
  uint64_t v36;
  NSString *v37;
  NSObject *log;
  os_log_type_t v39;
  id v40;
  NSString *v41;
  id v42;
  NSString *v43;
  NSString *v44;
  _QWORD v45[8];
  uint64_t v46;
  _QWORD v47[8];
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[8];
  void *v53;
  id v54;
  os_log_type_t v55;
  os_log_t v56;
  _QWORD __b[8];
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  os_log_type_t v62;
  os_log_t v63;
  id v64;
  int v65;
  id v66;
  os_log_type_t type;
  os_log_t oslog;
  id obj;
  id v70;
  id v71;
  id location[2];
  AMDFeatureDescriptor *v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[16];
  _BYTE v79[128];
  uint8_t v80[16];
  uint8_t v81[24];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = 0;
  v44 = -[AMDFeatureDescriptor joinTable](v73, "joinTable");
  v43 = -[AMDFeatureDescriptor joinTableDomain](v73, "joinTableDomain");
  obj = v71;
  v42 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v44);
  objc_storeStrong(&v71, obj);
  v70 = v42;

  if (!v71 && v70)
  {
    v64 = -[AMDFeatureDescriptor transformTPDataForJoin:](v73, "transformTPDataForJoin:", v70);
    if (v64)
    {
      v61 = (id)objc_msgSend(v64, "objectForKey:", CFSTR("featureValue"));
      v60 = (id)objc_msgSend(v64, "objectForKey:", CFSTR("featureFormat"));
      v32 = (void *)MEMORY[0x1E0C99E60];
      v34 = (id)objc_msgSend(v70, "objectForKey:", 0x1EA4BBF28);
      v33 = (id)objc_msgSend(v34, "allKeys");
      v59 = (id)objc_msgSend(v32, "setWithArray:");

      memset(__b, 0, sizeof(__b));
      v35 = -[AMDFeatureDescriptor joinRequiredColumns](v73, "joinRequiredColumns");
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", __b, v79, 16);
      if (v36)
      {
        v29 = *(_QWORD *)__b[2];
        v30 = 0;
        v31 = v36;
        while (1)
        {
          v28 = v30;
          if (*(_QWORD *)__b[2] != v29)
            objc_enumerationMutation(v35);
          v58 = *(_QWORD *)(__b[1] + 8 * v30);
          if ((objc_msgSend(v59, "containsObject:", v58) & 1) == 0)
            break;
          ++v30;
          if (v28 + 1 >= v31)
          {
            v30 = 0;
            v31 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", __b, v79, 16);
            if (!v31)
              goto LABEL_20;
          }
        }
        v56 = (os_log_t)MEMORY[0x1E0C81028];
        v55 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v78, v58);
          _os_log_error_impl(&dword_1DC678000, v56, v55, "Inner join failed:Requested property %@ not found in feature", v78, 0xCu);
        }
        objc_storeStrong((id *)&v56, 0);
        v74 = 0;
        v65 = 1;
      }
      else
      {
LABEL_20:
        v65 = 0;
      }

      if (!v65)
      {
        v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(v52, 0, sizeof(v52));
        v26 = location[0];
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v52, v77, 16);
        if (v27)
        {
          v23 = *(_QWORD *)v52[2];
          v24 = 0;
          v25 = v27;
          while (1)
          {
            v22 = v24;
            if (*(_QWORD *)v52[2] != v23)
              objc_enumerationMutation(v26);
            v53 = *(void **)(v52[1] + 8 * v24);
            v20 = v53;
            v21 = -[AMDFeatureDescriptor keyProperty](v73, "keyProperty");
            v51 = (id)objc_msgSend(v20, "objectForKey:");

            v50 = (id)objc_msgSend(v61, "objectForKey:", v51);
            if (v50)
            {
              v49 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v53);
              memset(v47, 0, sizeof(v47));
              v18 = -[AMDFeatureDescriptor joinRequiredColumns](v73, "joinRequiredColumns");
              v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", v47, v76, 16);
              if (v19)
              {
                v15 = *(_QWORD *)v47[2];
                v16 = 0;
                v17 = v19;
                while (1)
                {
                  v14 = v16;
                  if (*(_QWORD *)v47[2] != v15)
                    objc_enumerationMutation(v18);
                  v48 = *(_QWORD *)(v47[1] + 8 * v16);
                  v12 = v49;
                  v13 = (id)objc_msgSend(v50, "objectForKey:", v48);
                  objc_msgSend(v12, "setObject:forKey:");

                  ++v16;
                  if (v14 + 1 >= v17)
                  {
                    v16 = 0;
                    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", v47, v76, 16);
                    if (!v17)
                      break;
                  }
                }
              }

              objc_msgSend(v54, "addObject:", v49);
              objc_storeStrong(&v49, 0);
              v65 = 0;
            }
            else
            {
              v65 = 5;
            }
            objc_storeStrong(&v50, 0);
            objc_storeStrong(&v51, 0);
            ++v24;
            if (v22 + 1 >= v25)
            {
              v24 = 0;
              v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v52, v77, 16);
              if (!v25)
                break;
            }
          }
        }

        if (objc_msgSend(v54, "count"))
        {
          memset(v45, 0, sizeof(v45));
          v10 = -[AMDFeatureDescriptor joinRequiredColumns](v73, "joinRequiredColumns");
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", v45, v75, 16);
          if (v11)
          {
            v7 = *(_QWORD *)v45[2];
            v8 = 0;
            v9 = v11;
            while (1)
            {
              v6 = v8;
              if (*(_QWORD *)v45[2] != v7)
                objc_enumerationMutation(v10);
              v46 = *(_QWORD *)(v45[1] + 8 * v8);
              v5 = -[AMDFeatureDescriptor propertyDict](v73, "propertyDict");
              v4 = (id)objc_msgSend(v60, "objectForKey:", v46);
              -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:");

              ++v8;
              if (v6 + 1 >= v9)
              {
                v8 = 0;
                v9 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", v45, v75, 16);
                if (!v9)
                  break;
              }
            }
          }

        }
        v74 = v54;
        v65 = 1;
        objc_storeStrong(&v54, 0);
      }
      objc_storeStrong(&v59, 0);
      objc_storeStrong(&v60, 0);
      objc_storeStrong(&v61, 0);
    }
    else
    {
      v63 = (os_log_t)MEMORY[0x1E0C81028];
      v62 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v37 = -[AMDFeatureDescriptor keyProperty](v73, "keyProperty");
        __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v37);
        _os_log_error_impl(&dword_1DC678000, v63, v62, "Inner join failed:Key property %@ not found in feature", v80, 0xCu);

      }
      objc_storeStrong((id *)&v63, 0);
      v74 = 0;
      v65 = 1;
    }
    objc_storeStrong(&v64, 0);
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v39 = type;
      v41 = -[AMDFeatureDescriptor joinTable](v73, "joinTable");
      v40 = (id)objc_msgSend(v71, "localizedDescription");
      v66 = v40;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v81, (uint64_t)v41, (uint64_t)v66);
      _os_log_error_impl(&dword_1DC678000, log, v39, "Inner join failed: Feature %@ could not be fetched. Error: %@", v81, 0x16u);

      objc_storeStrong(&v66, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v74 = 0;
    v65 = 1;
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
  return v74;
}

- (id)performOuterJoin:(id)a3
{
  id v3;
  id v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSArray *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSArray *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSDictionary *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSArray *v28;
  uint64_t v29;
  void *v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  NSDictionary *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  NSArray *v47;
  uint64_t v48;
  NSString *v49;
  NSObject *log;
  os_log_type_t v51;
  id v52;
  NSString *v53;
  id v54;
  NSString *v55;
  NSString *v56;
  _QWORD v57[8];
  uint64_t v58;
  _QWORD v59[8];
  uint64_t v60;
  _QWORD v61[8];
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[8];
  void *v67;
  id v68;
  os_log_type_t v69;
  os_log_t v70;
  os_log_type_t v71;
  os_log_t v72;
  _QWORD __b[8];
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  os_log_type_t v79;
  os_log_t v80;
  id v81;
  int v82;
  id v83;
  os_log_type_t type;
  os_log_t oslog;
  id obj;
  id v87;
  id v88;
  id location[2];
  AMDFeatureDescriptor *v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[32];
  uint8_t v97[16];
  _BYTE v98[128];
  uint8_t v99[16];
  uint8_t v100[24];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v90 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v88 = 0;
  v56 = -[AMDFeatureDescriptor joinTable](v90, "joinTable");
  v55 = -[AMDFeatureDescriptor joinTableDomain](v90, "joinTableDomain");
  obj = v88;
  v54 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v56);
  objc_storeStrong(&v88, obj);
  v87 = v54;

  if (!v88 && v87)
  {
    v81 = -[AMDFeatureDescriptor transformTPDataForJoin:](v90, "transformTPDataForJoin:", v87);
    if (v81)
    {
      v78 = (id)objc_msgSend(v81, "objectForKey:", CFSTR("featureValue"));
      v77 = (id)objc_msgSend(v81, "objectForKey:", CFSTR("featureFormat"));
      v46 = (id)objc_msgSend(v87, "objectForKey:", 0x1EA4BBF28);
      v76 = (id)objc_msgSend(v46, "allKeys");

      v75 = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v76);
      memset(__b, 0, sizeof(__b));
      v47 = -[AMDFeatureDescriptor joinRequiredColumns](v90, "joinRequiredColumns");
      v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", __b, v98, 16);
      if (v48)
      {
        v43 = *(_QWORD *)__b[2];
        v44 = 0;
        v45 = v48;
        while (1)
        {
          v42 = v44;
          if (*(_QWORD *)__b[2] != v43)
            objc_enumerationMutation(v47);
          v74 = *(_QWORD *)(__b[1] + 8 * v44);
          if ((objc_msgSend(v75, "containsObject:", v74) & 1) == 0)
          {
            v72 = (os_log_t)MEMORY[0x1E0C81028];
            v71 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v97, v74);
              _os_log_error_impl(&dword_1DC678000, v72, v71, "Outer join failed:Requested property %@ not found in feature", v97, 0xCu);
            }
            objc_storeStrong((id *)&v72, 0);
            v91 = 0;
            v82 = 1;
            goto LABEL_25;
          }
          v40 = -[AMDFeatureDescriptor defaultJoinValueDict](v90, "defaultJoinValueDict");
          v3 = -[NSDictionary objectForKey:](v40, "objectForKey:", v74);
          v41 = v3 != 0;

          if (!v41)
            break;
          ++v44;
          if (v42 + 1 >= v45)
          {
            v44 = 0;
            v45 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", __b, v98, 16);
            if (!v45)
              goto LABEL_24;
          }
        }
        v70 = (os_log_t)MEMORY[0x1E0C81028];
        v69 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v38 = v74;
          v39 = -[AMDFeatureDescriptor joinTable](v90, "joinTable");
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v96, v38, (uint64_t)v39);
          _os_log_error_impl(&dword_1DC678000, v70, v69, "Outer join failed:Default value not provided for column: %@ while performing join with feature: %@", v96, 0x16u);

        }
        objc_storeStrong((id *)&v70, 0);
        v91 = 0;
        v82 = 1;
      }
      else
      {
LABEL_24:
        v82 = 0;
      }
LABEL_25:

      if (!v82)
      {
        v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(v66, 0, sizeof(v66));
        v36 = location[0];
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v66, v95, 16);
        if (v37)
        {
          v33 = *(_QWORD *)v66[2];
          v34 = 0;
          v35 = v37;
          while (1)
          {
            v32 = v34;
            if (*(_QWORD *)v66[2] != v33)
              objc_enumerationMutation(v36);
            v67 = *(void **)(v66[1] + 8 * v34);
            v30 = v67;
            v31 = -[AMDFeatureDescriptor keyProperty](v90, "keyProperty");
            v65 = (id)objc_msgSend(v30, "objectForKey:");

            v64 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v67);
            v63 = (id)objc_msgSend(v78, "objectForKey:", v65);
            if (v63)
            {
              memset(v59, 0, sizeof(v59));
              v19 = -[AMDFeatureDescriptor joinRequiredColumns](v90, "joinRequiredColumns");
              v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", v59, v93, 16);
              if (v20)
              {
                v16 = *(_QWORD *)v59[2];
                v17 = 0;
                v18 = v20;
                while (1)
                {
                  v15 = v17;
                  if (*(_QWORD *)v59[2] != v16)
                    objc_enumerationMutation(v19);
                  v60 = *(_QWORD *)(v59[1] + 8 * v17);
                  v13 = v64;
                  v14 = (id)objc_msgSend(v63, "objectForKey:", v60);
                  objc_msgSend(v13, "setObject:forKey:");

                  ++v17;
                  if (v15 + 1 >= v18)
                  {
                    v17 = 0;
                    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", v59, v93, 16);
                    if (!v18)
                      break;
                  }
                }
              }

            }
            else
            {
              memset(v61, 0, sizeof(v61));
              v28 = -[AMDFeatureDescriptor joinRequiredColumns](v90, "joinRequiredColumns");
              v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", v61, v94, 16);
              if (v29)
              {
                v25 = *(_QWORD *)v61[2];
                v26 = 0;
                v27 = v29;
                while (1)
                {
                  v24 = v26;
                  if (*(_QWORD *)v61[2] != v25)
                    objc_enumerationMutation(v28);
                  v62 = *(_QWORD *)(v61[1] + 8 * v26);
                  v21 = v64;
                  v23 = -[AMDFeatureDescriptor defaultJoinValueDict](v90, "defaultJoinValueDict");
                  v22 = -[NSDictionary objectForKey:](v23, "objectForKey:", v62);
                  objc_msgSend(v21, "setObject:forKey:");

                  ++v26;
                  if (v24 + 1 >= v27)
                  {
                    v26 = 0;
                    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", v61, v94, 16);
                    if (!v27)
                      break;
                  }
                }
              }

            }
            objc_msgSend(v68, "addObject:", v64);
            objc_storeStrong(&v63, 0);
            objc_storeStrong(&v64, 0);
            objc_storeStrong(&v65, 0);
            ++v34;
            if (v32 + 1 >= v35)
            {
              v34 = 0;
              v35 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", v66, v95, 16);
              if (!v35)
                break;
            }
          }
        }

        if (objc_msgSend(v68, "count"))
        {
          memset(v57, 0, sizeof(v57));
          v11 = -[AMDFeatureDescriptor joinRequiredColumns](v90, "joinRequiredColumns");
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", v57, v92, 16);
          if (v12)
          {
            v8 = *(_QWORD *)v57[2];
            v9 = 0;
            v10 = v12;
            while (1)
            {
              v7 = v9;
              if (*(_QWORD *)v57[2] != v8)
                objc_enumerationMutation(v11);
              v58 = *(_QWORD *)(v57[1] + 8 * v9);
              v6 = -[AMDFeatureDescriptor propertyDict](v90, "propertyDict");
              v5 = (id)objc_msgSend(v77, "objectForKey:", v58);
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:");

              ++v9;
              if (v7 + 1 >= v10)
              {
                v9 = 0;
                v10 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", v57, v92, 16);
                if (!v10)
                  break;
              }
            }
          }

        }
        v91 = v68;
        v82 = 1;
        objc_storeStrong(&v68, 0);
      }
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
      objc_storeStrong(&v77, 0);
      objc_storeStrong(&v78, 0);
    }
    else
    {
      v80 = (os_log_t)MEMORY[0x1E0C81028];
      v79 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v49 = -[AMDFeatureDescriptor keyProperty](v90, "keyProperty");
        __os_log_helper_16_2_1_8_64((uint64_t)v99, (uint64_t)v49);
        _os_log_error_impl(&dword_1DC678000, v80, v79, "Outer join failed:Key property %@ not found in feature", v99, 0xCu);

      }
      objc_storeStrong((id *)&v80, 0);
      v91 = 0;
      v82 = 1;
    }
    objc_storeStrong(&v81, 0);
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v51 = type;
      v53 = -[AMDFeatureDescriptor joinTable](v90, "joinTable");
      v52 = (id)objc_msgSend(v88, "localizedDescription");
      v83 = v52;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v100, (uint64_t)v53, (uint64_t)v83);
      _os_log_error_impl(&dword_1DC678000, log, v51, "Outer join failed: Feature %@ could not be fetched. Error: %@", v100, 0x16u);

      objc_storeStrong(&v83, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v91 = 0;
    v82 = 1;
  }
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(location, 0);
  return v91;
}

- (id)sort:(id)a3
{
  id v4;
  id v5;
  char isKindOfClass;
  NSNumber *v7;
  BOOL v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  BOOL v12;
  NSNumber *v13;
  BOOL v14;
  char v15;
  NSString *v16;
  char v17;
  NSString *v18;
  char v19;
  NSString *v20;
  char v21;
  NSString *v22;
  id v23;
  int v24;
  id location[2];
  AMDFeatureDescriptor *v26;
  id v27;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = -[AMDFeatureDescriptor sortOrder](v26, "sortOrder");
  v14 = 1;
  if (v13)
    v14 = objc_msgSend(location[0], "count") == 0;

  if (v14)
  {
    v27 = location[0];
    v24 = 1;
  }
  else
  {
    v23 = 0;
    v11 = -[AMDFeatureDescriptor version](v26, "version");
    v12 = -[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("v1"));

    if (v12)
    {
      v10 = -[AMDFeatureDescriptor aggregatedProperty](v26, "aggregatedProperty");
      v21 = 0;
      v19 = 0;
      if (v10)
      {
        v22 = -[AMDFeatureDescriptor aggregatedProperty](v26, "aggregatedProperty");
        v21 = 1;
        objc_storeStrong(&v23, v22);
      }
      else
      {
        v20 = -[AMDFeatureDescriptor keyProperty](v26, "keyProperty");
        v19 = 1;
        objc_storeStrong(&v23, v20);
      }
      if ((v19 & 1) != 0)

      if ((v21 & 1) != 0)
    }
    else
    {
      v9 = -[AMDFeatureDescriptor sortKey](v26, "sortKey");
      v17 = 0;
      v15 = 0;
      if (v9)
      {
        v18 = -[AMDFeatureDescriptor sortKey](v26, "sortKey");
        v17 = 1;
        objc_storeStrong(&v23, v18);
      }
      else
      {
        v16 = -[AMDFeatureDescriptor keyProperty](v26, "keyProperty");
        v15 = 1;
        objc_storeStrong(&v23, v16);
      }
      if ((v15 & 1) != 0)

      if ((v17 & 1) != 0)
    }
    v5 = (id)objc_msgSend(location[0], "firstObject");
    v4 = (id)objc_msgSend(v5, "objectForKey:", v23);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = -[AMDFeatureDescriptor sortOrder](v26, "sortOrder");
    v8 = -[NSNumber intValue](v7, "intValue") == 0;

    v27 = +[AMDMiscHelpers sortArrayElements:inDescendingOrder:withComparisonKey:isKeyString:](AMDMiscHelpers, "sortArrayElements:inDescendingOrder:withComparisonKey:isKeyString:", location[0], v8, v23, isKindOfClass & 1);
    v24 = 1;
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (id)prepareDictionaryResult:(id)a3
{
  id v3;
  id v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSString *v10;
  uint64_t v11;
  NSNumber *v12;
  BOOL v13;
  void *v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id obj;
  uint64_t v22;
  int v23;
  id v24;
  _QWORD __b[8];
  void *v26;
  id v27;
  id location[2];
  AMDFeatureDescriptor *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = objc_alloc(MEMORY[0x1E0C99E08]);
  v27 = (id)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v22)
  {
    v17 = *(_QWORD *)__b[2];
    v18 = 0;
    v19 = v22;
    while (1)
    {
      v16 = v18;
      if (*(_QWORD *)__b[2] != v17)
        objc_enumerationMutation(obj);
      v26 = *(void **)(__b[1] + 8 * v18);
      v14 = v26;
      v15 = -[AMDFeatureDescriptor keyProperty](v29, "keyProperty");
      v24 = (id)objc_msgSend(v14, "objectForKey:");

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v3 = (id)objc_msgSend(v24, "stringValue");
        v4 = v24;
        v24 = v3;

      }
      v8 = v27;
      v7 = v26;
      v10 = -[AMDFeatureDescriptor aggregatedProperty](v29, "aggregatedProperty");
      v9 = (id)objc_msgSend(v7, "objectForKey:");
      objc_msgSend(v8, "setObject:forKey:");

      v11 = objc_msgSend(v27, "count");
      v12 = -[AMDFeatureDescriptor maxRecords](v29, "maxRecords");
      v13 = v11 != -[NSNumber integerValue](v12, "integerValue");

      if (v13)
        v23 = 0;
      else
        v23 = 2;
      objc_storeStrong(&v24, 0);
      if (v23)
        break;
      ++v18;
      if (v16 + 1 >= v19)
      {
        v18 = 0;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v19)
          break;
      }
    }
  }

  v6 = v27;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)prepareArrayResult:(id)a3
{
  id v3;
  id *v5;
  id v6;
  uint64_t v7;
  NSNumber *v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  BOOL v15;
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
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[8];
  uint64_t v34;
  _QWORD __b[8];
  id v36;
  int v37;
  id v38;
  id location[2];
  AMDFeatureDescriptor *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
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
      v36 = *(id *)(__b[1] + 8 * v24);
      memset(v33, 0, sizeof(v33));
      v20 = v36;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v33, v43, 16);
      if (v21)
      {
        v17 = *(_QWORD *)v33[2];
        v18 = 0;
        v19 = v21;
        while (1)
        {
          v16 = v18;
          if (*(_QWORD *)v33[2] != v17)
            objc_enumerationMutation(v20);
          v34 = *(_QWORD *)(v33[1] + 8 * v18);
          v3 = (id)objc_msgSend(v38, "objectForKey:", v34);
          v15 = v3 != 0;

          if (v15)
          {
            v29 = (id)objc_msgSend(v38, "objectForKey:", v34);
            v28 = (id)objc_msgSend(v29, "objectForKey:", CFSTR("featureValue"));
            v10 = v28;
            v11 = (id)objc_msgSend(v36, "objectForKey:", v34);
            objc_msgSend(v10, "addObject:");

            objc_storeStrong(&v28, 0);
            objc_storeStrong(&v29, 0);
          }
          else
          {
            v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v12 = v31;
            v13 = (id)objc_msgSend(v36, "objectForKey:", v34);
            objc_msgSend(v12, "addObject:");

            v14 = -[AMDFeatureDescriptor propertyDict](v40, "propertyDict");
            v30 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:", v34);

            objc_msgSend(v32, "setObject:forKey:", v31, CFSTR("featureValue"));
            objc_msgSend(v32, "setObject:forKey:", v30, CFSTR("featureFormat"));
            objc_msgSend(v38, "setObject:forKey:", v32, v34);
            objc_storeStrong(&v30, 0);
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v32, 0);
          }
          ++v18;
          if (v16 + 1 >= v19)
          {
            v18 = 0;
            v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v33, v43, 16);
            if (!v19)
              break;
          }
        }
      }

      v7 = ++v37;
      v8 = -[AMDFeatureDescriptor maxRecords](v40, "maxRecords");
      v9 = v7 != -[NSNumber integerValue](v8, "integerValue");

      if (!v9)
        break;
      ++v24;
      if (v22 + 1 >= v25)
      {
        v24 = 0;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
        if (!v25)
          break;
      }
    }
  }

  v41[0] = 0x1EA4BBF28;
  v42[0] = v38;
  v41[1] = 0x1EA4C24E8;
  v42[1] = 0x1EA4C2508;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2, &v38);
  objc_storeStrong(v5, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)prepareResult:(id)a3
{
  NSString *v3;
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  uint64_t v9;
  NSNumber *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id obj;
  uint64_t v18;
  BOOL v19;
  _QWORD __b[8];
  void *v21;
  id v22;
  id location[2];
  AMDFeatureDescriptor *v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[AMDFeatureDescriptor aggregatedProperty](v24, "aggregatedProperty");
  v19 = v3 != 0;

  if (v19)
  {
    v25 = -[AMDFeatureDescriptor prepareDictionaryResult:](v24, "prepareDictionaryResult:", location[0]);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v22 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(location[0], "count"));
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
    if (v18)
    {
      v13 = *(_QWORD *)__b[2];
      v14 = 0;
      v15 = v18;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)__b[2] != v13)
          objc_enumerationMutation(obj);
        v21 = *(void **)(__b[1] + 8 * v14);
        v6 = v22;
        v5 = v21;
        v8 = -[AMDFeatureDescriptor keyProperty](v24, "keyProperty");
        v7 = (id)objc_msgSend(v5, "objectForKey:");
        objc_msgSend(v6, "addObject:");

        v9 = objc_msgSend(v22, "count");
        v10 = -[AMDFeatureDescriptor maxRecords](v24, "maxRecords");
        v11 = v9 != -[NSNumber integerValue](v10, "integerValue");

        if (!v11)
          break;
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
          if (!v15)
            break;
        }
      }
    }

    v25 = v22;
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(location, 0);
  return v25;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_featureName, a3);
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (NSString)joinTable
{
  return self->_joinTable;
}

- (void)setJoinTable:(id)a3
{
  objc_storeStrong((id *)&self->_joinTable, a3);
}

- (NSString)joinTableDomain
{
  return self->_joinTableDomain;
}

- (void)setJoinTableDomain:(id)a3
{
  objc_storeStrong((id *)&self->_joinTableDomain, a3);
}

- (NSArray)joinRequiredColumns
{
  return self->_joinRequiredColumns;
}

- (void)setJoinRequiredColumns:(id)a3
{
  objc_storeStrong((id *)&self->_joinRequiredColumns, a3);
}

- (NSString)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(id)a3
{
  self->_joinType = (NSString *)a3;
}

- (NSString)keyProperty
{
  return self->_keyProperty;
}

- (void)setKeyProperty:(id)a3
{
  objc_storeStrong((id *)&self->_keyProperty, a3);
}

- (NSString)aggregatedProperty
{
  return self->_aggregatedProperty;
}

- (void)setAggregatedProperty:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedProperty, a3);
}

- (NSNumber)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(id)a3
{
  objc_storeStrong((id *)&self->_sortOrder, a3);
}

- (NSNumber)maxRecords
{
  return self->_maxRecords;
}

- (void)setMaxRecords:(id)a3
{
  objc_storeStrong((id *)&self->_maxRecords, a3);
}

- (BOOL)doOuterJoin
{
  return self->_doOuterJoin;
}

- (void)setDoOuterJoin:(BOOL)a3
{
  self->_doOuterJoin = a3;
}

- (NSObject)defaultJoinValue
{
  return self->_defaultJoinValue;
}

- (void)setDefaultJoinValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultJoinValue, a3);
}

- (NSDictionary)defaultJoinValueDict
{
  return self->_defaultJoinValueDict;
}

- (void)setDefaultJoinValueDict:(id)a3
{
  objc_storeStrong((id *)&self->_defaultJoinValueDict, a3);
}

- (NSMutableDictionary)propertyDict
{
  return self->_propertyDict;
}

- (void)setPropertyDict:(id)a3
{
  objc_storeStrong((id *)&self->_propertyDict, a3);
}

- (NSMutableArray)aggregatedPropertyList
{
  return self->_aggregatedPropertyList;
}

- (void)setAggregatedPropertyList:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedPropertyList, a3);
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (void)setSortKey:(id)a3
{
  objc_storeStrong((id *)&self->_sortKey, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_aggregatedPropertyList, 0);
  objc_storeStrong((id *)&self->_propertyDict, 0);
  objc_storeStrong((id *)&self->_defaultJoinValueDict, 0);
  objc_storeStrong((id *)&self->_defaultJoinValue, 0);
  objc_storeStrong((id *)&self->_maxRecords, 0);
  objc_storeStrong((id *)&self->_sortOrder, 0);
  objc_storeStrong((id *)&self->_aggregatedProperty, 0);
  objc_storeStrong((id *)&self->_keyProperty, 0);
  objc_storeStrong((id *)&self->_joinRequiredColumns, 0);
  objc_storeStrong((id *)&self->_joinTableDomain, 0);
  objc_storeStrong((id *)&self->_joinTable, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
