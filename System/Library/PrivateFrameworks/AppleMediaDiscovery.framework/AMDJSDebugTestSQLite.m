@implementation AMDJSDebugTestSQLite

+ (id)getSchema:(id)a3
{
  id v3;
  id v4;
  id v6;
  AMDSQLiteSchema *v7;
  AMDSQLiteSchema *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  id v16;

  v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  v14 = (id)objc_msgSend(v10, "getDataSchema");

  v13 = 0;
  v11 = (id)objc_msgSend(location[0], "objectForKey:", TEST_USE_TEST_SCHEMA);

  if (v11)
  {
    v7 = [AMDSQLiteSchema alloc];
    v9 = (id)objc_msgSend(v16, "getTestSchemaDict");
    v12 = v13;
    v8 = -[AMDSQLiteSchema initWithDict:error:](v7, "initWithDict:error:");
    objc_storeStrong(&v13, v12);
    v3 = v14;
    v14 = v8;

  }
  if (v13)
    v4 = 0;
  else
    v4 = v14;
  v6 = v4;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)test:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  id v35;
  id v36;
  const __CFString *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _BOOL4 v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  AMDSQLiteSchema *v75;
  id v76;
  id v77;
  id v78;
  BOOL v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  AMDSQLite *v88;
  id v90;
  char v91;
  id v92;
  char v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  char v111;
  id v112;
  char v113;
  id v114;
  id v115;
  id v116;
  char v117;
  id v118;
  char v119;
  id v120;
  id v121;
  id v122;
  char v123;
  id v124;
  char v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  char v131;
  id v132;
  char v133;
  id v134;
  id v135;
  id v136;
  char v137;
  id v138;
  char v139;
  id v140;
  id v141;
  id v142;
  id v143;
  char v144;
  id v145;
  char v146;
  id v147;
  id v148;
  char v149;
  id v150;
  char v151;
  id v152;
  id v153;
  BOOL v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  int v164;
  id v165;
  BOOL v166;
  id v167;
  id v168;
  id v169;
  id *v170;
  id location[2];
  id v172;
  id v173;
  const __CFString *v174;
  id v175;
  const __CFString *v176;
  id v177;
  const __CFString *v178;
  id v179;
  const __CFString *v180;
  id v181;
  const __CFString *v182;
  id v183;
  const __CFString *v184;
  id v185;
  const __CFString *v186;
  id v187;
  const __CFString *v188;
  id v189;
  uint64_t v190;
  id v191;
  uint64_t v192;
  _QWORD v193[2];

  v193[1] = *MEMORY[0x1E0C80C00];
  v172 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v170 = a4;
  v169 = 0;
  v168 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v90 = (id)objc_msgSend(location[0], "objectForKey:", TEST_LOAD_DB);

  if (v90)
  {
    v88 = objc_alloc_init(AMDSQLite);
    v167 = -[AMDSQLite loadDb](v88, "loadDb");

    objc_msgSend(v168, "setObject:forKey:", v167, TEST_LOAD_DB);
    objc_storeStrong(&v167, 0);
  }
  v87 = (id)objc_msgSend(location[0], "objectForKey:", TEST_SHARED_INSTANCE);

  if (v87)
  {
    v4 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    v5 = v169;
    v169 = v4;

    v86 = v168;
    if (objc_msgSend(v169, "getDb"))
      v6 = MEMORY[0x1E0C9AAB0];
    else
      v6 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v86, "setObject:forKey:", v6, TEST_SHARED_INSTANCE);
  }
  v85 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_SCHEMA);

  if (v85)
  {
    v7 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    v8 = v169;
    v169 = v7;

    v82 = v168;
    v81 = v169;
    v84 = (id)objc_msgSend(v172, "getTestSchemaDict");
    v83 = (id)objc_msgSend(v81, "updateSchema:error:");
    objc_msgSend(v82, "setObject:forKey:");

  }
  v80 = (id)objc_msgSend(location[0], "objectForKey:", TEST_SET_ENABLE);

  if (v80)
  {
    v9 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    v10 = v169;
    v169 = v9;

    v78 = (id)objc_msgSend(location[0], "objectForKey:", TEST_SET_ENABLE);
    v79 = (int)objc_msgSend(v78, "intValue") > 0;

    v166 = v79;
    objc_msgSend(v169, "setEnable:", v79);
    if (v79)
      v11 = CFSTR("enabled");
    else
      v11 = CFSTR("diabled");
    objc_msgSend(v168, "setObject:forKey:", v11, TEST_SET_ENABLE);
  }
  v77 = (id)objc_msgSend(location[0], "objectForKey:", TEST_CREATE_TEST_TABLE);

  if (!v77)
    goto LABEL_20;
  v75 = [AMDSQLiteSchema alloc];
  v76 = (id)objc_msgSend(v172, "getTestSchemaDict");
  v165 = -[AMDSQLiteSchema initWithDict:error:](v75, "initWithDict:error:");

  if (*v170)
  {
    v192 = TEST_CREATE_TEST_TABLE;
    v74 = (id)objc_msgSend(*v170, "localizedDescription");
    v193[0] = v74;
    v173 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, &v192, 1);

    v164 = 1;
  }
  else
  {
    v12 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    v13 = v169;
    v169 = v12;

    v73 = (id)objc_msgSend(location[0], "objectForKey:", TEST_CREATE_TEST_TABLE);
    v163 = (id)objc_msgSend(v73, "objectForKey:", 0x1EA4BF808);

    v162 = (id)objc_msgSend(v169, "createTable:usingSchema:error:", v163, v165, v170);
    objc_msgSend(v168, "setObject:forKey:", v162, TEST_CREATE_TEST_TABLE);
    objc_storeStrong(&v162, 0);
    objc_storeStrong(&v163, 0);
    v164 = 0;
  }
  objc_storeStrong(&v165, 0);
  if (!v164)
  {
LABEL_20:
    v72 = (id)objc_msgSend(location[0], "objectForKey:", TEST_CREATE_TABLE);

    if (v72)
    {
      v14 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
      v15 = v169;
      v169 = v14;

      v68 = (id)objc_msgSend(location[0], "objectForKey:", TEST_CREATE_TABLE);
      v161 = (id)objc_msgSend(v68, "objectForKey:", 0x1EA4BF808);

      v70 = v169;
      v69 = v161;
      v71 = (id)objc_msgSend(v169, "getDataSchema");
      v160 = (id)objc_msgSend(v70, "createTable:usingSchema:error:", v69);

      objc_msgSend(v168, "setObject:forKey:", v160, TEST_CREATE_TABLE);
      objc_storeStrong(&v160, 0);
      objc_storeStrong(&v161, 0);
    }
    v67 = (id)objc_msgSend(location[0], "objectForKey:", TEST_SAVE_EVENTS);

    if (v67)
    {
      v66 = (id)objc_msgSend(location[0], "objectForKey:", TEST_SAVE_EVENTS);
      v159 = +[AMDSQLite saveEvents:error:](AMDSQLite, "saveEvents:error:");

      if (*v170)
      {
        v64 = v168;
        v65 = (id)objc_msgSend(*v170, "localizedDescription");
        objc_msgSend(v64, "setObject:forKey:");

      }
      else
      {
        objc_msgSend(v168, "setObject:forKey:", v159, TEST_SAVE_EVENTS);
      }
      objc_storeStrong(&v159, 0);
    }
    v63 = (id)objc_msgSend(location[0], "objectForKey:", TEST_FETCH_ROWS);

    if (!v63)
      goto LABEL_42;
    v16 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    v17 = v169;
    v169 = v16;

    v158 = (id)objc_msgSend(v172, "getSchema:", location[0]);
    v157 = (id)objc_msgSend(location[0], "objectForKey:", TEST_FETCH_ROWS);
    v156 = -[AMDFetchDescriptor initWithDict:usingSchema:error:]([AMDFetchDescriptor alloc], "initWithDict:usingSchema:error:", v157, v158, v170);
    if (*v170)
    {
      v190 = TEST_FETCH_ROWS;
      v62 = (id)objc_msgSend(*v170, "localizedDescription");
      v191 = v62;
      v173 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);

      v164 = 1;
    }
    else
    {
      v155 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("persist"));
      v154 = 0;
      if (v155)
        v61 = objc_msgSend(v155, "intValue") != 0;
      else
        v61 = 0;
      v154 = v61;
      v153 = (id)objc_msgSend(v169, "fetchRowsUsingSchema:andDescriptor:andPersist:error:", v158, v156, v61, v170);
      v60 = v168;
      v151 = 0;
      v149 = 0;
      if (v153)
      {
        v59 = v153;
      }
      else
      {
        v188 = CFSTR("failure");
        v152 = (id)objc_msgSend(*v170, "localizedDescription");
        v151 = 1;
        v189 = v152;
        v150 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
        v149 = 1;
        v59 = v150;
      }
      objc_msgSend(v60, "setObject:forKey:", v59, TEST_FETCH_ROWS);
      if ((v149 & 1) != 0)

      if ((v151 & 1) != 0)
      objc_storeStrong(&v153, 0);
      objc_storeStrong(&v155, 0);
      v164 = 0;
    }
    objc_storeStrong(&v156, 0);
    objc_storeStrong(&v157, 0);
    objc_storeStrong(&v158, 0);
    if (!v164)
    {
LABEL_42:
      v58 = (id)objc_msgSend(location[0], "objectForKey:", TEST_DELETE_ROWS);

      if (v58)
      {
        v18 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
        v19 = v169;
        v169 = v18;

        v55 = v169;
        v56 = (id)objc_msgSend(location[0], "objectForKey:", TEST_DELETE_ROWS);
        v148 = (id)objc_msgSend(v55, "deleteRows:error:");

        v57 = v168;
        v146 = 0;
        v144 = 0;
        if (v148)
        {
          v54 = v148;
        }
        else
        {
          v186 = CFSTR("failure");
          v147 = (id)objc_msgSend(*v170, "localizedDescription");
          v146 = 1;
          v187 = v147;
          v145 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
          v144 = 1;
          v54 = v145;
        }
        objc_msgSend(v57, "setObject:forKey:", v54, TEST_DELETE_ROWS);
        if ((v144 & 1) != 0)

        if ((v146 & 1) != 0)
        objc_storeStrong(&v148, 0);
      }
      v53 = (id)objc_msgSend(location[0], "objectForKey:", TEST_INSERT_JS);

      if (v53)
      {
        v143 = (id)objc_msgSend(v172, "getSchema:", location[0]);
        v142 = (id)objc_msgSend(location[0], "objectForKey:", TEST_INSERT_JS);
        v141 = +[AMDSQLite insertRowsInternal:usingSchema:error:](AMDSQLite, "insertRowsInternal:usingSchema:error:", v142, v143, v170);
        v52 = v168;
        v139 = 0;
        v137 = 0;
        if (v141)
        {
          v51 = v141;
        }
        else
        {
          v184 = CFSTR("failure");
          v140 = (id)objc_msgSend(*v170, "localizedDescription");
          v139 = 1;
          v185 = v140;
          v138 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
          v137 = 1;
          v51 = v138;
        }
        objc_msgSend(v52, "setObject:forKey:", v51, TEST_INSERT_JS);
        if ((v137 & 1) != 0)

        if ((v139 & 1) != 0)
        objc_storeStrong(&v141, 0);
        objc_storeStrong(&v142, 0);
        objc_storeStrong(&v143, 0);
      }
      v50 = (id)objc_msgSend(location[0], "objectForKey:", TEST_DELETE_JS);

      if (v50)
      {
        v136 = (id)objc_msgSend(location[0], "objectForKey:", TEST_DELETE_JS);
        v135 = +[AMDSQLite deleteRowsHandler:error:](AMDSQLite, "deleteRowsHandler:error:", v136, v170);
        v49 = v168;
        v133 = 0;
        v131 = 0;
        if (v135)
        {
          v48 = v135;
        }
        else
        {
          v182 = CFSTR("failure");
          v134 = (id)objc_msgSend(*v170, "localizedDescription");
          v133 = 1;
          v183 = v134;
          v132 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
          v131 = 1;
          v48 = v132;
        }
        objc_msgSend(v49, "setObject:forKey:", v48, TEST_DELETE_JS);
        if ((v131 & 1) != 0)

        if ((v133 & 1) != 0)
        objc_storeStrong(&v135, 0);
        objc_storeStrong(&v136, 0);
      }
      v47 = (id)objc_msgSend(location[0], "objectForKey:", TEST_ADD_DESCRIPTORS);

      if (v47)
      {
        v20 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
        v21 = v169;
        v169 = v20;

        v130 = (id)objc_msgSend(location[0], "objectForKey:", TEST_ADD_DESCRIPTORS);
        v129 = (id)objc_msgSend(v130, "objectForKey:", 0x1EA4B8948);
        v128 = (id)objc_msgSend(v130, "objectForKey:", CFSTR("fdConfig"));
        v127 = +[AMDFetchDescriptor refreshAggregationDescriptors:forDomain:error:](AMDFetchDescriptor, "refreshAggregationDescriptors:forDomain:error:", v128, v129, v170);
        v46 = v168;
        v125 = 0;
        v123 = 0;
        if (v127)
        {
          v45 = v127;
        }
        else
        {
          v180 = CFSTR("failure");
          v126 = (id)objc_msgSend(*v170, "localizedDescription");
          v125 = 1;
          v181 = v126;
          v124 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
          v123 = 1;
          v45 = v124;
        }
        objc_msgSend(v46, "setObject:forKey:", v45, TEST_ADD_DESCRIPTORS);
        if ((v123 & 1) != 0)

        if ((v125 & 1) != 0)
        objc_storeStrong(&v127, 0);
        objc_storeStrong(&v128, 0);
        objc_storeStrong(&v129, 0);
        objc_storeStrong(&v130, 0);
      }
      v44 = (id)objc_msgSend(location[0], "objectForKey:", TEST_REFRESH_ODTP);

      if (v44)
      {
        v122 = (id)objc_msgSend(location[0], "objectForKey:", TEST_REFRESH_ODTP);
        v121 = +[AMDSQLite refreshODTPForDomain:error:](AMDSQLite, "refreshODTPForDomain:error:", v122, v170);
        v43 = v168;
        v119 = 0;
        v117 = 0;
        if (v121)
        {
          v42 = v121;
        }
        else
        {
          v178 = CFSTR("failure");
          v120 = (id)objc_msgSend(*v170, "localizedDescription");
          v119 = 1;
          v179 = v120;
          v118 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
          v117 = 1;
          v42 = v118;
        }
        objc_msgSend(v43, "setObject:forKey:", v42, TEST_REFRESH_ODTP);
        if ((v117 & 1) != 0)

        if ((v119 & 1) != 0)
        objc_storeStrong(&v121, 0);
        objc_storeStrong(&v122, 0);
      }
      v41 = (id)objc_msgSend(location[0], "objectForKey:", TEST_REFRESH_ENTITY_TABLE);

      if (v41)
      {
        v116 = (id)objc_msgSend(location[0], "objectForKey:", TEST_REFRESH_ENTITY_TABLE);
        v115 = +[AMDSQLite refreshEntityTableForDomain:error:](AMDSQLite, "refreshEntityTableForDomain:error:", v116, v170);
        v40 = v168;
        v113 = 0;
        v111 = 0;
        if (v115)
        {
          v39 = v115;
        }
        else
        {
          v176 = CFSTR("failure");
          v114 = (id)objc_msgSend(*v170, "localizedDescription");
          v113 = 1;
          v177 = v114;
          v112 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
          v111 = 1;
          v39 = v112;
        }
        objc_msgSend(v40, "setObject:forKey:", v39, TEST_REFRESH_ENTITY_TABLE);
        if ((v111 & 1) != 0)

        if ((v113 & 1) != 0)
        objc_storeStrong(&v115, 0);
        objc_storeStrong(&v116, 0);
      }
      v38 = (id)objc_msgSend(location[0], "objectForKey:", TEST_FETCH_FEATURE);

      if (v38)
      {
        v22 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
        v23 = v169;
        v169 = v22;

        v110 = (id)objc_msgSend(location[0], "objectForKey:", TEST_FETCH_FEATURE);
        v109 = (id)objc_msgSend(v110, "objectForKey:", 0x1EA4B8948);
        v108 = (id)objc_msgSend(v110, "objectForKey:", CFSTR("featureName"));
        v107 = +[AMDSQLite getFeatureValueWithName:inDomain:withColumnName:skipRowset:error:](AMDSQLite, "getFeatureValueWithName:inDomain:withColumnName:skipRowset:error:", v108, v109, 0, 0, v170);
        if (v107)
          v37 = (const __CFString *)v107;
        else
          v37 = CFSTR("Not found");
        objc_msgSend(v168, "setObject:forKey:", v37, TEST_FETCH_FEATURE);
        objc_storeStrong(&v107, 0);
        objc_storeStrong(&v108, 0);
        objc_storeStrong(&v109, 0);
        objc_storeStrong(&v110, 0);
      }
      v36 = (id)objc_msgSend(location[0], "objectForKey:", TEST_FETCH_SCHEMA);

      if (v36)
      {
        v24 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
        v25 = v169;
        v169 = v24;

        v35 = (id)objc_msgSend(v169, "getDataSchema");
        v106 = (id)objc_msgSend(v35, "getSchemaDict");

        if (v106)
          v34 = (const __CFString *)v106;
        else
          v34 = CFSTR("No schema");
        objc_msgSend(v168, "setObject:forKey:", v34, TEST_FETCH_SCHEMA);
        objc_storeStrong(&v106, 0);
      }
      v33 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_DATA);

      if (v33)
      {
        v105 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_DATA);
        v104 = +[AMDSQLite updateData:](AMDSQLite, "updateData:", v105);
        objc_msgSend(v168, "setObject:forKey:", v104, TEST_UPDATE_DATA);
        objc_storeStrong(&v104, 0);
        objc_storeStrong(&v105, 0);
      }
      v32 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_BIOME_DATA);

      if (v32)
      {
        v103 = 0;
        v102 = &unk_1EA4D1B78;
        v100 = v103;
        v31 = +[AMDBiomeIntegration queryBiomeFor:withError:](AMDBiomeIntegration, "queryBiomeFor:withError:", v102, &v100);
        objc_storeStrong(&v103, v100);
        v101 = v31;
        objc_msgSend(v168, "setObject:forKey:", v31, TEST_UPDATE_DATA);
        objc_storeStrong(&v101, 0);
        objc_storeStrong(&v102, 0);
        objc_storeStrong(&v103, 0);
      }
      v30 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_STORAGE_DATA);

      if (v30)
      {
        v99 = &unk_1EA4D1230;
        v98 = +[AMDDeviceStorage performStorageUpdateWithPayload:](AMDDeviceStorage, "performStorageUpdateWithPayload:", v99);
        objc_msgSend(v168, "setObject:forKey:", v98, TEST_UPDATE_STORAGE_DATA);
        objc_storeStrong(&v98, 0);
        objc_storeStrong(&v99, 0);
      }
      v29 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_TABLES);

      if (v29)
      {
        v97 = (id)objc_msgSend(v172, "getSchema:", location[0]);
        v96 = (id)objc_msgSend(location[0], "objectForKey:", TEST_UPDATE_TABLES);
        v95 = +[AMDSQLite updateTablesInternal:usingSchema:error:](AMDSQLite, "updateTablesInternal:usingSchema:error:", v96, v97, v170);
        v28 = v168;
        v93 = 0;
        v91 = 0;
        if (v95)
        {
          v27 = v95;
        }
        else
        {
          v174 = CFSTR("failure");
          v94 = (id)objc_msgSend(*v170, "localizedDescription");
          v93 = 1;
          v175 = v94;
          v92 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
          v91 = 1;
          v27 = v92;
        }
        objc_msgSend(v28, "setObject:forKey:", v27, TEST_UPDATE_TABLES);
        if ((v91 & 1) != 0)

        if ((v93 & 1) != 0)
        objc_storeStrong(&v95, 0);
        objc_storeStrong(&v96, 0);
        objc_storeStrong(&v97, 0);
      }
      v173 = v168;
      v164 = 1;
    }
  }
  objc_storeStrong(&v168, 0);
  objc_storeStrong(&v169, 0);
  objc_storeStrong(location, 0);
  return v173;
}

+ (id)getTestFetchDescriptors
{
  id v3;
  id v4;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0x1EA4BF668;
  v6[0] = CFSTR("fetch_from_t1");
  v5[1] = 0x1EA4BF808;
  v6[1] = CFSTR("testTable1");
  v5[2] = 0x1EA4BF688;
  v6[2] = CFSTR("adamId");
  v5[3] = 0x1EA4BF648;
  v6[3] = &unk_1EA4D1B90;
  v5[4] = 0x1EA4BF7A8;
  v6[4] = CFSTR("rowset");
  v5[5] = 0x1EA4B8948;
  v6[5] = CFSTR("apps");
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v7[0] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);

  return v4;
}

+ (id)getTestSchemaDict
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
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
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
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
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[3];
  _QWORD v76[3];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[4];
  _QWORD v94[4];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[3];
  _QWORD v112[3];
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[2];
  _QWORD v116[2];
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[3];
  _QWORD v126[3];
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  uint64_t v137;
  uint64_t v138;
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[17];
  _QWORD v144[17];
  _QWORD v145[3];
  _QWORD v146[3];
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[3];
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[3];
  uint64_t v155;
  uint64_t v156;
  _QWORD v157[3];
  _QWORD v158[3];
  _QWORD v159[7];
  _QWORD v160[7];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[3];
  _QWORD v164[3];
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[5];
  _QWORD v172[5];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[6];
  _QWORD v186[6];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[3];
  _QWORD v190[3];
  _QWORD v191[3];
  _QWORD v192[3];
  _QWORD v193[3];
  _QWORD v194[3];
  _QWORD v195[10];
  _QWORD v196[10];
  _QWORD v197[4];
  _QWORD v198[5];

  v198[4] = *MEMORY[0x1E0C80C00];
  v197[0] = AMD_SQLITE_SCHEMA_NAME;
  v198[0] = CFSTR("testSchema");
  v197[1] = AMD_SQLITE_SCHEMA_VERSION;
  v198[1] = CFSTR("17");
  v197[2] = AMD_SQLITE_SCHEMA_TABLES;
  v195[0] = CFSTR("testUniqueColumns");
  v193[0] = CFSTR("c1");
  v191[0] = AMD_SQLITE_TYPE;
  v192[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v191[1] = AMD_SQLITE_NOT_NULL;
  v3 = MEMORY[0x1E0C9AAB0];
  v192[1] = MEMORY[0x1E0C9AAB0];
  v191[2] = AMD_SQLITE_UNIQUE;
  v192[2] = MEMORY[0x1E0C9AAB0];
  v68 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v192, v191);
  v194[0] = v68;
  v193[1] = CFSTR("c2");
  v189[0] = AMD_SQLITE_TYPE;
  v190[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v189[1] = AMD_SQLITE_NOT_NULL;
  v190[1] = v3;
  v189[2] = AMD_SQLITE_UNIQUE;
  v190[2] = v3;
  v67 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, v189, 3);
  v194[1] = v67;
  v193[2] = CFSTR("c3");
  v187[0] = AMD_SQLITE_TYPE;
  v188[0] = AMD_SQLITE_DATA_TYPE_FLOAT;
  v187[1] = AMD_SQLITE_NOT_NULL;
  v188[1] = v3;
  v66 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, v187);
  v194[2] = v66;
  v65 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v194, v193, 3);
  v196[0] = v65;
  v195[1] = 0x1EA4B7F08;
  v185[0] = 0x1EA4B91E8;
  v183[0] = AMD_SQLITE_TYPE;
  v184[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v183[1] = AMD_SQLITE_NOT_NULL;
  v184[1] = v3;
  v64 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v184, v183, 2);
  v186[0] = v64;
  v185[1] = 0x1EA4BAAA8;
  v181[0] = AMD_SQLITE_TYPE;
  v182[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v181[1] = AMD_SQLITE_NOT_NULL;
  v182[1] = v3;
  v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v181, 2);
  v186[1] = v63;
  v185[2] = 0x1EA4BAAC8;
  v179[0] = AMD_SQLITE_TYPE;
  v180[0] = AMD_SQLITE_DATA_TYPE_INT;
  v179[1] = AMD_SQLITE_NOT_NULL;
  v180[1] = v3;
  v62 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
  v186[2] = v62;
  v185[3] = 0x1EA4BAAE8;
  v177[0] = AMD_SQLITE_TYPE;
  v178[0] = AMD_SQLITE_DATA_TYPE_INT;
  v177[1] = AMD_SQLITE_NOT_NULL;
  v178[1] = v3;
  v61 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v178, v177, 2);
  v186[3] = v61;
  v185[4] = 0x1EA4BAB08;
  v175[0] = AMD_SQLITE_TYPE;
  v176[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v175[1] = AMD_SQLITE_NOT_NULL;
  v176[1] = v3;
  v60 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, v175, 2);
  v186[4] = v60;
  v185[5] = 0x1EA4B9308;
  v173[0] = AMD_SQLITE_TYPE;
  v174[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v173[1] = AMD_SQLITE_NOT_NULL;
  v174[1] = v3;
  v59 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 2);
  v186[5] = v59;
  v58 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v186, v185, 6);
  v196[1] = v58;
  v195[2] = CFSTR("testTable1");
  v171[0] = CFSTR("eventTime");
  v169[0] = AMD_SQLITE_TYPE;
  v170[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v169[1] = AMD_SQLITE_NOT_NULL;
  v170[1] = v3;
  v57 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, v169, 2);
  v172[0] = v57;
  v171[1] = CFSTR("eventType");
  v167[0] = AMD_SQLITE_TYPE;
  v168[0] = AMD_SQLITE_DATA_TYPE_INT;
  v167[1] = AMD_SQLITE_NOT_NULL;
  v168[1] = v3;
  v56 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
  v172[1] = v56;
  v171[2] = CFSTR("adamId");
  v165[0] = AMD_SQLITE_TYPE;
  v166[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v165[1] = AMD_SQLITE_NOT_NULL;
  v166[1] = v3;
  v55 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
  v172[2] = v55;
  v171[3] = CFSTR("duration");
  v163[0] = AMD_SQLITE_TYPE;
  v164[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v163[1] = AMD_SQLITE_NOT_NULL;
  v164[1] = v3;
  v163[2] = AMD_SQLITE_DEFAULT_VALUE;
  v164[2] = &unk_1EA4CEF08;
  v54 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 3);
  v172[3] = v54;
  v171[4] = 0x1EA4B9308;
  v161[0] = AMD_SQLITE_TYPE;
  v162[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v161[1] = AMD_SQLITE_NOT_NULL;
  v162[1] = v3;
  v53 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, v161, 2);
  v172[4] = v53;
  v52 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, v171, 5);
  v196[2] = v52;
  v195[3] = CFSTR("testTable2");
  v159[0] = CFSTR("c1");
  v157[0] = AMD_SQLITE_TYPE;
  v158[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v157[1] = AMD_SQLITE_NOT_NULL;
  v158[1] = v3;
  v157[2] = AMD_SQLITE_DEFAULT_VALUE;
  v158[2] = CFSTR("foo_bar");
  v51 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, v157, 3);
  v160[0] = v51;
  v159[1] = CFSTR("c2");
  v155 = AMD_SQLITE_TYPE;
  v156 = AMD_SQLITE_DATA_TYPE_INT;
  v50 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155);
  v160[1] = v50;
  v159[2] = CFSTR("c22");
  v153[0] = AMD_SQLITE_TYPE;
  v154[0] = AMD_SQLITE_DATA_TYPE_INT;
  v153[1] = AMD_SQLITE_NOT_NULL;
  v154[1] = v3;
  v153[2] = AMD_SQLITE_DEFAULT_VALUE;
  v154[2] = &unk_1EA4CEF20;
  v49 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 3);
  v160[2] = v49;
  v159[3] = CFSTR("c3");
  v151[0] = AMD_SQLITE_TYPE;
  v152[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v151[1] = AMD_SQLITE_NOT_NULL;
  v152[1] = v3;
  v151[2] = AMD_SQLITE_DEFAULT_VALUE;
  v152[2] = &unk_1EA4CEF38;
  v48 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 3);
  v160[3] = v48;
  v159[4] = CFSTR("c4");
  v149[0] = AMD_SQLITE_TYPE;
  v150[0] = AMD_SQLITE_DATA_TYPE_FLOAT;
  v149[1] = AMD_SQLITE_NOT_NULL;
  v150[1] = v3;
  v47 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v149, 2);
  v160[4] = v47;
  v159[5] = CFSTR("c5");
  v147 = AMD_SQLITE_TYPE;
  v148 = AMD_SQLITE_DATA_TYPE_BLOB;
  v46 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
  v160[5] = v46;
  v159[6] = CFSTR("c6");
  v145[0] = AMD_SQLITE_TYPE;
  v146[0] = AMD_SQLITE_DATA_TYPE_BLOB;
  v145[1] = AMD_SQLITE_NOT_NULL;
  v146[1] = v3;
  v145[2] = AMD_SQLITE_DEFAULT_VALUE;
  v146[2] = &unk_1EA4D1E18;
  v45 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 3);
  v160[6] = v45;
  v44 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, v159, 7);
  v196[3] = v44;
  v195[4] = CFSTR("AMDAppStoreUsageEvents");
  v143[0] = CFSTR("adamId");
  v141[0] = AMD_SQLITE_TYPE;
  v142[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v141[1] = AMD_SQLITE_NOT_NULL;
  v142[1] = v3;
  v43 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
  v144[0] = v43;
  v143[1] = CFSTR("shortAppVersion");
  v139[0] = AMD_SQLITE_TYPE;
  v140[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v139[1] = AMD_SQLITE_NOT_NULL;
  v140[1] = v3;
  v139[2] = AMD_SQLITE_DEFAULT_VALUE;
  v140[2] = &stru_1EA4B7088;
  v42 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 3);
  v144[1] = v42;
  v143[2] = CFSTR("batteryUsage");
  v137 = AMD_SQLITE_TYPE;
  v138 = AMD_SQLITE_DATA_TYPE_FLOAT;
  v41 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
  v144[2] = v41;
  v143[3] = CFSTR("dsId");
  v135[0] = AMD_SQLITE_TYPE;
  v136[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v135[1] = AMD_SQLITE_NOT_NULL;
  v136[1] = v3;
  v40 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
  v144[3] = v40;
  v143[4] = CFSTR("eventTime");
  v133[0] = AMD_SQLITE_TYPE;
  v134[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v133[1] = AMD_SQLITE_NOT_NULL;
  v134[1] = v3;
  v39 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 2);
  v144[4] = v39;
  v143[5] = CFSTR("eventType");
  v131[0] = AMD_SQLITE_TYPE;
  v132[0] = AMD_SQLITE_DATA_TYPE_INT;
  v131[1] = AMD_SQLITE_NOT_NULL;
  v132[1] = v3;
  v38 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
  v144[5] = v38;
  v143[6] = CFSTR("eventSubType");
  v129 = AMD_SQLITE_TYPE;
  v130 = AMD_SQLITE_DATA_TYPE_INT;
  v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
  v144[6] = v37;
  v143[7] = CFSTR("eventVersion");
  v127 = AMD_SQLITE_TYPE;
  v128 = AMD_SQLITE_DATA_TYPE_TEXT;
  v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
  v144[7] = v36;
  v143[8] = CFSTR("foregroundDuration");
  v125[0] = AMD_SQLITE_TYPE;
  v126[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v125[1] = AMD_SQLITE_NOT_NULL;
  v126[1] = v3;
  v125[2] = AMD_SQLITE_DEFAULT_VALUE;
  v126[2] = &unk_1EA4CEF08;
  v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 3);
  v144[8] = v35;
  v143[9] = CFSTR("latitude");
  v123 = AMD_SQLITE_TYPE;
  v124 = AMD_SQLITE_DATA_TYPE_FLOAT;
  v34 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
  v144[9] = v34;
  v143[10] = CFSTR("locationAccuracy");
  v121 = AMD_SQLITE_TYPE;
  v122 = AMD_SQLITE_DATA_TYPE_FLOAT;
  v33 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
  v144[10] = v33;
  v143[11] = CFSTR("longitude");
  v119 = AMD_SQLITE_TYPE;
  v120 = AMD_SQLITE_DATA_TYPE_FLOAT;
  v32 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
  v144[11] = v32;
  v143[12] = CFSTR("networkType");
  v117 = AMD_SQLITE_TYPE;
  v118 = AMD_SQLITE_DATA_TYPE_INT;
  v31 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
  v144[12] = v31;
  v143[13] = CFSTR("platform");
  v115[0] = AMD_SQLITE_TYPE;
  v116[0] = AMD_SQLITE_DATA_TYPE_INT;
  v115[1] = AMD_SQLITE_NOT_NULL;
  v116[1] = v3;
  v30 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
  v144[13] = v30;
  v143[14] = CFSTR("storageUsed");
  v113 = AMD_SQLITE_TYPE;
  v114 = AMD_SQLITE_DATA_TYPE_INT64;
  v29 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
  v144[14] = v29;
  v143[15] = CFSTR("timeZoneOffset");
  v111[0] = AMD_SQLITE_TYPE;
  v112[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v111[1] = AMD_SQLITE_NOT_NULL;
  v112[1] = v3;
  v111[2] = AMD_SQLITE_DEFAULT_VALUE;
  v112[2] = &unk_1EA4CEF08;
  v28 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
  v144[15] = v28;
  v143[16] = 0x1EA4B9308;
  v109[0] = AMD_SQLITE_TYPE;
  v110[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v109[1] = AMD_SQLITE_NOT_NULL;
  v110[1] = v3;
  v27 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
  v144[16] = v27;
  v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 17);
  v196[4] = v26;
  v195[5] = CFSTR("BiomeAppActivity");
  v107[0] = CFSTR("bundleId");
  v105[0] = AMD_SQLITE_TYPE;
  v106[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v105[1] = AMD_SQLITE_NOT_NULL;
  v106[1] = v3;
  v105[2] = AMD_SQLITE_DEFAULT_VALUE;
  v106[2] = CFSTR("nil_bundle_ID");
  v25 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
  v108[0] = v25;
  v107[1] = CFSTR("activityType");
  v103[0] = AMD_SQLITE_TYPE;
  v104[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v103[1] = AMD_SQLITE_NOT_NULL;
  v104[1] = v3;
  v103[2] = AMD_SQLITE_DEFAULT_VALUE;
  v104[2] = CFSTR("nil_activity_type");
  v24 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
  v108[1] = v24;
  v107[2] = CFSTR("eventTimestamp");
  v101[0] = AMD_SQLITE_TYPE;
  v102[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v101[1] = AMD_SQLITE_NOT_NULL;
  v102[1] = v3;
  v101[2] = AMD_SQLITE_DEFAULT_VALUE;
  v102[2] = &unk_1EA4CEF08;
  v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
  v108[2] = v23;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
  v196[5] = v22;
  v195[6] = CFSTR("BiomeWifiActivity");
  v99[0] = CFSTR("SSID");
  v97[0] = AMD_SQLITE_TYPE;
  v98[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v97[1] = AMD_SQLITE_NOT_NULL;
  v98[1] = v3;
  v97[2] = AMD_SQLITE_DEFAULT_VALUE;
  v98[2] = CFSTR("nil_SSID");
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
  v100[0] = v21;
  v99[1] = CFSTR("eventTimestamp");
  v95[0] = AMD_SQLITE_TYPE;
  v96[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v95[1] = AMD_SQLITE_NOT_NULL;
  v96[1] = v3;
  v95[2] = AMD_SQLITE_DEFAULT_VALUE;
  v96[2] = &unk_1EA4CEF08;
  v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
  v100[1] = v20;
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
  v196[6] = v19;
  v195[7] = CFSTR("DeviceStorageUsage");
  v93[0] = CFSTR("deviceId");
  v91[0] = AMD_SQLITE_TYPE;
  v92[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v91[1] = AMD_SQLITE_NOT_NULL;
  v92[1] = v3;
  v91[2] = AMD_SQLITE_DEFAULT_VALUE;
  v92[2] = CFSTR("undefined");
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
  v94[0] = v18;
  v93[1] = CFSTR("time");
  v89[0] = AMD_SQLITE_TYPE;
  v90[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v89[1] = AMD_SQLITE_NOT_NULL;
  v90[1] = v3;
  v89[2] = AMD_SQLITE_DEFAULT_VALUE;
  v90[2] = &unk_1EA4CEF08;
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
  v94[1] = v17;
  v93[2] = CFSTR("totalDeviceCapacityGB");
  v87[0] = AMD_SQLITE_TYPE;
  v88[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v87[1] = AMD_SQLITE_NOT_NULL;
  v88[1] = v3;
  v87[2] = AMD_SQLITE_DEFAULT_VALUE;
  v88[2] = &unk_1EA4CEF08;
  v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
  v94[2] = v16;
  v93[3] = CFSTR("availableDeviceCapacityGB");
  v85[0] = AMD_SQLITE_TYPE;
  v86[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v85[1] = AMD_SQLITE_NOT_NULL;
  v86[1] = v3;
  v85[2] = AMD_SQLITE_DEFAULT_VALUE;
  v86[2] = &unk_1EA4CEF08;
  v15 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v94[3] = v15;
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93);
  v196[7] = v14;
  v195[8] = CFSTR("topics");
  v83[0] = CFSTR("topicId");
  v81 = AMD_SQLITE_TYPE;
  v82 = AMD_SQLITE_DATA_TYPE_TEXT;
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v84[0] = v13;
  v83[1] = CFSTR("score");
  v79 = AMD_SQLITE_TYPE;
  v80 = AMD_SQLITE_DATA_TYPE_FLOAT;
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
  v84[1] = v12;
  v83[2] = CFSTR("most_recent_documentId");
  v77 = AMD_SQLITE_TYPE;
  v78 = AMD_SQLITE_DATA_TYPE_TEXT;
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v84[2] = v11;
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v196[8] = v10;
  v195[9] = CFSTR("megadome_topics");
  v75[0] = CFSTR("topicId");
  v73 = AMD_SQLITE_TYPE;
  v74 = AMD_SQLITE_DATA_TYPE_TEXT;
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
  v76[0] = v9;
  v75[1] = CFSTR("score");
  v71 = AMD_SQLITE_TYPE;
  v72 = AMD_SQLITE_DATA_TYPE_FLOAT;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v76[1] = v8;
  v75[2] = CFSTR("most_recent_documentId");
  v69 = AMD_SQLITE_TYPE;
  v70 = AMD_SQLITE_DATA_TYPE_TEXT;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
  v76[2] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v196[9] = v6;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v196, v195, 10);
  v198[2] = v4;
  v197[3] = AMD_SQLITE_STREAM_TO_TABLE_MAP;
  v198[3] = &unk_1EA4D12F8;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v198, v197, 4);

  return v5;
}

@end
