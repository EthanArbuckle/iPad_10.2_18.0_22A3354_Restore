@implementation FCCKPrivateDatabaseSchema

- (void)enumerateZoneSchemasWithBlock:(uint64_t)a1
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(_QWORD, _QWORD))v3;
  if (a1 && v3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

+ (FCCKPrivateDatabaseSchema)databaseSchemaWithZones:(void *)a3 records:(void *)a4 recordTypeVersionMapping:(void *)a5 recordNameVersionMapping:
{
  id v9;
  id v10;
  id v11;
  id v12;
  FCCKPrivateDatabaseSchema *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  FCCKPrivateDatabaseSchema *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  FCCKPrivateDatabaseVersionMapping *zoneNameVersionMapping;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  NSDictionary *zoneSchemasByName;
  void *v54;
  void *v55;
  NSDictionary *recordSchemasByType;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  FCCKPrivateDatabaseVersionMapping *recordNameVersionMapping;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  id v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  FCCKPrivateDatabaseSchema *v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  id obj;
  id obja;
  id *p_recordTypeVersionMapping;
  uint64_t v118;
  id v119;
  id v120;
  _QWORD v121[5];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[6];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[5];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  objc_super v148;
  uint8_t v149[4];
  const char *v150;
  __int16 v151;
  char *v152;
  __int16 v153;
  int v154;
  __int16 v155;
  void *v156;
  uint8_t v157[4];
  const char *v158;
  __int16 v159;
  char *v160;
  __int16 v161;
  int v162;
  __int16 v163;
  void *v164;
  uint8_t v165[128];
  uint8_t buf[4];
  const char *v167;
  __int16 v168;
  char *v169;
  __int16 v170;
  int v171;
  __int16 v172;
  void *v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  objc_opt_self();
  v13 = [FCCKPrivateDatabaseSchema alloc];
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  if (v13)
  {
    v148.receiver = v13;
    v148.super_class = (Class)FCCKPrivateDatabaseSchema;
    v18 = (FCCKPrivateDatabaseSchema *)objc_msgSendSuper2(&v148, sel_init);
    if (v18)
    {
      v19 = a5;
      v106 = v18;
      v107 = v16;
      v101 = v17;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v109 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v108 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v103 = v14;
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = 0u;
      v145 = 0u;
      v146 = 0u;
      v147 = 0u;
      obj = v14;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v176, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v145;
        v23 = *MEMORY[0x1E0C94A30];
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v145 != v22)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * v24);
            if (v25)
              v26 = *(void **)(v25 + 16);
            else
              v26 = 0;
            v27 = v26;
            v28 = objc_msgSend(v27, "isEqualToString:", v23);

            if (v28)
            {
              objc_msgSend(v108, "addObject:", v25);
            }
            else
            {
              if (v25)
                v29 = *(void **)(v25 + 16);
              else
                v29 = 0;
              v30 = v29;
              objc_msgSend(v109, "setObject:forKeyedSubscript:", v25, v30);

            }
            if (v25)
              v31 = *(void **)(v25 + 16);
            else
              v31 = 0;
            v32 = v31;
            objc_msgSend(v114, "addObject:", v32);

            ++v24;
          }
          while (v21 != v24);
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v176, 16);
          v21 = v33;
        }
        while (v33);
      }

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v111 = v15;
      v34 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v140, v175, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v141;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v141 != v36)
              objc_enumerationMutation(v111);
            v38 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v37);
            if (v38)
            {
              v39 = *(id *)(v38 + 16);
              objc_msgSend(v104, "setObject:forKeyedSubscript:", v38, v39);

              v40 = *(void **)(v38 + 16);
            }
            else
            {
              objc_msgSend(v104, "setObject:forKeyedSubscript:", 0, 0);
              v40 = 0;
            }
            v41 = v40;
            objc_msgSend(v105, "addObject:", v41);

            ++v37;
          }
          while (v35 != v37);
          v42 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v140, v175, 16);
          v35 = v42;
        }
        while (v42);
      }
      v102 = v15;

      objc_msgSend(v107, "mappingByTransformingValuesWithBlock:", &__block_literal_global_142);
      v43 = objc_claimAutoreleasedReturnValue();
      zoneNameVersionMapping = v106->_zoneNameVersionMapping;
      v106->_zoneNameVersionMapping = (FCCKPrivateDatabaseVersionMapping *)v43;

      p_recordTypeVersionMapping = (id *)&v106->_recordTypeVersionMapping;
      objc_storeStrong((id *)&v106->_recordTypeVersionMapping, a4);
      objc_storeStrong((id *)&v106->_recordNameVersionMapping, v19);
      objc_storeStrong((id *)&v106->_zoneSchemasByName, v109);
      objc_storeStrong((id *)&v106->_defaultZoneSchemas, v108);
      objc_storeStrong((id *)&v106->_recordSchemasByType, v104);
      v45 = 0;
      v46 = *MEMORY[0x1E0C94A30];
      do
      {
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v112 = v45;
        objc_msgSend(*p_recordTypeVersionMapping, "allValuesForVersion:");
        v119 = (id)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v136, v174, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v137;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v137 != v49)
                objc_enumerationMutation(v119);
              v51 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
              objc_msgSend(v51, "first");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v52, "isEqualToString:", v46))
              {

              }
              else
              {
                zoneSchemasByName = v106->_zoneSchemasByName;
                objc_msgSend(v51, "first");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKey:](zoneSchemasByName, "objectForKey:", v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v55 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  v62 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v51, "first");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = (void *)objc_msgSend(v62, "initWithFormat:", CFSTR("missing zone name in schema: %@"), v63);
                  *(_DWORD *)buf = 136315906;
                  v167 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordNa"
                         "meVersionMapping:]";
                  v168 = 2080;
                  v169 = "FCCKPrivateDatabaseSchema.m";
                  v170 = 1024;
                  v171 = 91;
                  v172 = 2114;
                  v173 = v64;
                  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

                }
              }
              recordSchemasByType = v106->_recordSchemasByType;
              objc_msgSend(v51, "second");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKey:](recordSchemasByType, "objectForKey:", v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v58 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v59 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v51, "second");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("missing record type in schema: %@"), v60);
                *(_DWORD *)buf = 136315906;
                v167 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordName"
                       "VersionMapping:]";
                v168 = 2080;
                v169 = "FCCKPrivateDatabaseSchema.m";
                v170 = 1024;
                v171 = 92;
                v172 = 2114;
                v173 = v61;
                _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
            }
            v48 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v136, v174, 16);
          }
          while (v48);
        }

        v45 = v112 + 1;
      }
      while (v112 != 3);
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v110 = obj;
      v65 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v132, buf, 16);
      v66 = MEMORY[0x1E0C809B0];
      obja = (id)v65;
      if (v65)
      {
        v113 = *(_QWORD *)v133;
        do
        {
          v67 = 0;
          do
          {
            if (*(_QWORD *)v133 != v113)
              objc_enumerationMutation(v110);
            v68 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * v67);
            v69 = *p_recordTypeVersionMapping;
            v131[0] = v66;
            v131[1] = 3221225472;
            v131[2] = __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_14;
            v131[3] = &unk_1E4648450;
            v131[4] = v68;
            if ((objc_msgSend(v69, "containsValuePassingTest:", v131) & 1) == 0
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v82 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v68)
                v83 = *(void **)(v68 + 16);
              else
                v83 = 0;
              v84 = v83;
              v85 = (void *)objc_msgSend(v82, "initWithFormat:", CFSTR("missing zone name in version mapping: %@"), v84);
              *(_DWORD *)v157 = 136315906;
              v158 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordNameVersionMapping:]";
              v159 = 2080;
              v160 = "FCCKPrivateDatabaseSchema.m";
              v161 = 1024;
              v162 = 99;
              v163 = 2114;
              v164 = v85;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v157, 0x26u);

              v66 = MEMORY[0x1E0C809B0];
            }
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v130 = 0u;
            v118 = v67;
            if (v68)
              v70 = *(void **)(v68 + 32);
            else
              v70 = 0;
            v71 = v70;
            v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v165, 16);
            if (v72)
            {
              v73 = v72;
              v74 = *(_QWORD *)v128;
              do
              {
                v75 = 0;
                do
                {
                  if (*(_QWORD *)v128 != v74)
                    objc_enumerationMutation(v71);
                  v76 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v75);
                  recordNameVersionMapping = v106->_recordNameVersionMapping;
                  v126[0] = v66;
                  v126[1] = 3221225472;
                  v126[2] = __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_18;
                  v126[3] = &unk_1E4648478;
                  v126[4] = v68;
                  v126[5] = v76;
                  if (!-[FCCKPrivateDatabaseVersionMapping containsValuePassingTest:](recordNameVersionMapping, "containsValuePassingTest:", v126)&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    v120 = objc_alloc(MEMORY[0x1E0CB3940]);
                    if (v68)
                      v78 = *(void **)(v68 + 16);
                    else
                      v78 = 0;
                    v79 = v78;
                    v80 = (void *)objc_msgSend(v120, "initWithFormat:", CFSTR("missing static record in name mapping: %@:%@"), v79, v76);
                    *(_DWORD *)v157 = 136315906;
                    v158 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:record"
                           "NameVersionMapping:]";
                    v159 = 2080;
                    v160 = "FCCKPrivateDatabaseSchema.m";
                    v161 = 1024;
                    v162 = 104;
                    v163 = 2114;
                    v164 = v80;
                    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v157, 0x26u);

                    v66 = MEMORY[0x1E0C809B0];
                  }
                  ++v75;
                }
                while (v73 != v75);
                v81 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v165, 16);
                v73 = v81;
              }
              while (v81);
            }

            v67 = v118 + 1;
          }
          while ((id)(v118 + 1) != obja);
          v86 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v132, buf, 16);
          obja = (id)v86;
        }
        while (v86);
      }

      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v87 = v111;
      v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v122, v157, 16);
      if (v88)
      {
        v89 = v88;
        v90 = *(_QWORD *)v123;
        v91 = MEMORY[0x1E0C81028];
        do
        {
          v92 = 0;
          do
          {
            if (*(_QWORD *)v123 != v90)
              objc_enumerationMutation(v87);
            v93 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * v92);
            v94 = *p_recordTypeVersionMapping;
            v121[0] = MEMORY[0x1E0C809B0];
            v121[1] = 3221225472;
            v121[2] = __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_21;
            v121[3] = &unk_1E4648450;
            v121[4] = v93;
            if ((objc_msgSend(v94, "containsValuePassingTest:", v121) & 1) == 0
              && os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              v95 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v93)
                v96 = *(void **)(v93 + 16);
              else
                v96 = 0;
              v97 = v96;
              v98 = (void *)objc_msgSend(v95, "initWithFormat:", CFSTR("missing record type in version mapping: %@"), v97);
              *(_DWORD *)v149 = 136315906;
              v150 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordNameVersionMapping:]";
              v151 = 2080;
              v152 = "FCCKPrivateDatabaseSchema.m";
              v153 = 1024;
              v154 = 111;
              v155 = 2114;
              v156 = v98;
              _os_log_error_impl(&dword_1A1B90000, v91, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v149, 0x26u);

            }
            ++v92;
          }
          while (v89 != v92);
          v99 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v122, v157, 16);
          v89 = v99;
        }
        while (v99);
      }

      v15 = v102;
      v14 = v103;
      v13 = v106;
      v16 = v107;
      v17 = v101;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (FCCKPrivateDatabaseSchema)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKPrivateDatabaseSchema init]";
    v9 = 2080;
    v10 = "FCCKPrivateDatabaseSchema.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKPrivateDatabaseSchema init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
    v4 = *(void **)(v2 + 16);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[2];
  v5 = v4;
  objc_msgSend(v3, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
    v4 = *(void **)(v2 + 16);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

- (FCCKRecordZoneIDMapping)mappingFromRecord:(uint64_t)a3 toVersion:
{
  FCCKRecordZoneIDMapping *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCCKRecordMapping *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v3, v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "recordType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneID:toVersion:](v3, v8, v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [FCCKRecordMapping alloc];
    objc_msgSend(v7, "fromZoneSchema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toZoneSchema");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fromRecordSchema");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toRecordSchema");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[FCCKRecordMapping initWithFromZoneSchema:toZoneSchema:fromRecordSchema:toRecordSchema:recordIDMapping:](v12, "initWithFromZoneSchema:toZoneSchema:fromRecordSchema:toRecordSchema:recordIDMapping:", v13, v14, v15, v16, v7);

  }
  return v3;
}

- (id)mappingFromRecordID:(uint64_t)a3 toVersion:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  FCCKRecordIDMapping *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  FCCKRecordIDMapping *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 24), "mapValue:toVersion:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v6, "recordName");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(v6, "zoneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "zoneName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C94A30]);

    if (v18)
    {
      v19 = *(void **)(a1 + 40);
      v20 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke;
      v44[3] = &unk_1E46484A0;
      v21 = v6;
      v45 = v21;
      objc_msgSend(v19, "fc_firstObjectPassingTest:", v44);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      v39 = v20;
      v40 = 3221225472;
      v41 = __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke_2;
      v42 = &unk_1E46484A0;
      v24 = v15;
      v43 = v24;
      objc_msgSend(v23, "fc_firstObjectPassingTest:", &v39);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = [FCCKRecordIDMapping alloc];
      objc_msgSend(v21, "recordName", v39, v40, v41, v42);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = -[FCCKRecordIDMapping initWithFromZoneSchema:toZoneSchema:fromRecordName:toRecordName:](v26, "initWithFromZoneSchema:toZoneSchema:fromRecordName:toRecordName:", v22, v25, v27, v24);

    }
    else
    {
      objc_msgSend(v6, "zoneID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "zoneName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)a1, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = *(void **)(a1 + 8);
      objc_msgSend(v6, "zoneID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "zoneName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "mapValue:toVersion:", v33, a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)a1, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = [FCCKRecordIDMapping alloc];
      objc_msgSend(v6, "recordName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = -[FCCKRecordIDMapping initWithFromZoneSchema:toZoneSchema:fromRecordName:toRecordName:](v36, "initWithFromZoneSchema:toZoneSchema:fromRecordName:toRecordName:", v30, v35, v37, v15);

    }
  }

  return (id)a1;
}

- (id)mappingFromRecordType:(void *)a3 inZoneID:(uint64_t)a4 toVersion:
{
  id v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v7 = a2;
    objc_msgSend(a3, "zoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](a1, v7, v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = objc_msgSend(v3[4], "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

uint64_t __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a2 + 32), "containsObject:", *(_QWORD *)(a1 + 32));
  else
    return 0;
}

- (id)schemaForZoneWithName:(id *)a1
{
  id v3;
  void *v4;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C94A30])
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("to get the schema for the default zone, use schemaForZoneContainingRecordID:"));
      v7 = 136315906;
      v8 = "-[FCCKPrivateDatabaseSchema schemaForZoneWithName:]";
      v9 = 2080;
      v10 = "FCCKPrivateDatabaseSchema.m";
      v11 = 1024;
      v12 = 218;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v7, 0x26u);

    }
    objc_msgSend(a1[4], "objectForKeyedSubscript:", v4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)mappingFromRecordZoneID:(uint64_t)a3 toVersion:
{
  void *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a2, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabaseSchema mappingFromRecordZoneName:toVersion:](a1, v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (FCCKRecordZoneIDMapping)mappingFromRecordZoneName:(uint64_t)a3 toVersion:
{
  FCCKRecordZoneIDMapping *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)&v3->super.isa, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKZoneSchema mapValue:toVersion:](v3->_fromZoneSchema, "mapValue:toVersion:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)&v3->super.isa, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[FCCKRecordZoneIDMapping initWithFromZoneSchema:toZoneSchema:]([FCCKRecordZoneIDMapping alloc], "initWithFromZoneSchema:toZoneSchema:", v6, v8);

  }
  return v3;
}

- (FCCKRecordTypeMapping)mappingFromRecordType:(void *)a3 inZoneName:(uint64_t)a4 toVersion:
{
  id v7;
  Class isa;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  Class v13;
  void *v14;
  void *v15;
  FCCKRecordZoneIDMapping *v16;
  void *v17;
  void *v18;
  FCCKRecordZoneIDMapping *v19;
  FCCKRecordTypeMapping *v20;
  void *v21;
  void *v22;
  FCCKRecordTypeMapping *v23;

  v7 = a3;
  if (a1)
  {
    isa = a1[2].super.isa;
    v9 = a2;
    -[objc_class objectForKeyedSubscript:](isa, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKZoneSchema mapValue:toVersion:](a1->_toZoneSchema, "mapValue:toVersion:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[2].super.isa;
    objc_msgSend(v12, "second");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94A30]))
    {
      v16 = [FCCKRecordZoneIDMapping alloc];
      -[FCCKZoneSchema firstObject](a1[1]._toZoneSchema, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKZoneSchema firstObject](a1[1]._toZoneSchema, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FCCKRecordZoneIDMapping initWithFromZoneSchema:toZoneSchema:](v16, "initWithFromZoneSchema:toZoneSchema:", v17, v18);

    }
    else
    {
      -[FCCKPrivateDatabaseSchema mappingFromRecordZoneName:toVersion:](a1, v7, a4);
      v19 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
    }
    v20 = [FCCKRecordTypeMapping alloc];
    -[FCCKRecordZoneIDMapping fromZoneSchema](v19, "fromZoneSchema");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKRecordZoneIDMapping toZoneSchema](v19, "toZoneSchema");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FCCKRecordTypeMapping initWithFromZoneSchema:toZoneSchema:fromRecordSchema:toRecordSchema:](v20, "initWithFromZoneSchema:toZoneSchema:fromRecordSchema:toRecordSchema:", v21, v22, v10, v15);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (_QWORD)schemaForZoneContainingRecordID:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't resolve the default zone without a record ID"));
      *(_DWORD *)buf = 136315906;
      v17 = "-[FCCKPrivateDatabaseSchema schemaForZoneContainingRecordID:]";
      v18 = 2080;
      v19 = "FCCKPrivateDatabaseSchema.m";
      v20 = 1024;
      v21 = 231;
      v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94A30]);

    if (v7)
    {
      v8 = (void *)a1[5];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __61__FCCKPrivateDatabaseSchema_schemaForZoneContainingRecordID___block_invoke;
      v14[3] = &unk_1E46484A0;
      v15 = v4;
      objc_msgSend(v8, "fc_firstObjectPassingTest:", v14);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
    }
    else
    {
      v10 = (void *)a1[4];
      objc_msgSend(v4, "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    }
  }

  return a1;
}

uint64_t __61__FCCKPrivateDatabaseSchema_schemaForZoneContainingRecordID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = objc_msgSend(v3[4], "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)enumerateZoneSchemasForVersion:(void *)a3 withBlock:
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (a1 && v5)
  {
    objc_msgSend(a1[1], "allValuesForVersion:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1[4], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            ((void (**)(_QWORD, void *))v6)[2](v6, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = a1[5];
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
}

- (id)zoneNamesWithChangesFromVersion:(uint64_t)a3 toVersion:
{
  _QWORD v4[7];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__FCCKPrivateDatabaseSchema_zoneNamesWithChangesFromVersion_toVersion___block_invoke;
    v4[3] = &unk_1E46484C8;
    v4[4] = a1;
    v4[5] = a2;
    v4[6] = a3;
    objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __71__FCCKPrivateDatabaseSchema_zoneNamesWithChangesFromVersion_toVersion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1[4] + 16), "allValuesModifiedFromVersion:toVersion:", a1[5], a1[6], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "first");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)recordNamesInDefaultZoneChangedFromVersion:(uint64_t)a3 toVersion:
{
  _QWORD v4[7];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __82__FCCKPrivateDatabaseSchema_recordNamesInDefaultZoneChangedFromVersion_toVersion___block_invoke;
    v4[3] = &unk_1E46484C8;
    v4[4] = a1;
    v4[5] = a2;
    v4[6] = a3;
    objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __82__FCCKPrivateDatabaseSchema_recordNamesInDefaultZoneChangedFromVersion_toVersion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1[4] + 24), "allValuesModifiedFromVersion:toVersion:", a1[5], a1[6], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0C94A30];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "first");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if (v12)
        {
          objc_msgSend(v10, "second");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSchemasByType, 0);
  objc_storeStrong((id *)&self->_defaultZoneSchemas, 0);
  objc_storeStrong((id *)&self->_zoneSchemasByName, 0);
  objc_storeStrong((id *)&self->_recordNameVersionMapping, 0);
  objc_storeStrong((id *)&self->_recordTypeVersionMapping, 0);
  objc_storeStrong((id *)&self->_zoneNameVersionMapping, 0);
}

@end
