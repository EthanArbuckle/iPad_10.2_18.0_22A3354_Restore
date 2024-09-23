@implementation HMBLocalSQLQueryTable

- (HMBLocalSQLQueryTable)initWithContext:(id)a3 queryModel:(Class)a4
{
  id v6;
  HMBLocalSQLQueryTable *v7;
  HMBLocalSQLQueryTable *v8;
  uint64_t v9;
  NSString *modelType;
  uint64_t v11;
  NSMutableSet *userQueries;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  NSArray *columnNames;
  uint64_t v25;
  NSArray *columnFields;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(id *, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  objc_super v37;

  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HMBLocalSQLQueryTable;
  v7 = -[HMBLocalSQLQueryTable init](&v37, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_context, v6);
    objc_storeStrong((id *)&v8->_modelClass, a4);
    NSStringFromClass(a4);
    v9 = objc_claimAutoreleasedReturnValue();
    modelType = v8->_modelType;
    v8->_modelType = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    userQueries = v8->_userQueries;
    v8->_userQueries = (NSMutableSet *)v11;

    v8->_finalized = 1;
    -[objc_class hmbProperties](a4, "hmbProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke;
    v35[3] = &unk_1E8931FF0;
    v36 = v14;
    v16 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v35);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    v29 = 3221225472;
    v30 = __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke_2;
    v31 = &unk_1E8931620;
    v32 = v13;
    v33 = v17;
    v34 = v18;
    v20 = v18;
    v21 = v17;
    v22 = v13;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", &v28);

    v23 = objc_msgSend(v20, "copy", v28, v29, v30, v31);
    columnNames = v8->_columnNames;
    v8->_columnNames = (NSArray *)v23;

    v25 = objc_msgSend(v21, "copy");
    columnFields = v8->_columnFields;
    v8->_columnFields = (NSArray *)v25;

  }
  return v8;
}

- (BOOL)prepareWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  HMBLocalSQLQueryTable *v14;
  void *v15;
  void *v16;
  void *v17;
  HMBLocalSQLQueryTable *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  HMBLocalSQLQueryTable *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  char v37;
  id v38;
  void *v39;
  HMBLocalSQLQueryTable *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  int v61;
  id v62;
  HMBLocalSQLQueryTable *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  HMBLocalSQLQueryTable *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  HMBLocalSQLQueryTable *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  HMBLocalSQLQueryTable *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  HMBLocalSQLQueryTable *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  HMBLocalSQLQueryTable *v104;
  NSObject *v105;
  void *v106;
  HMBLocalSQLQueryTable *v107;
  HMBLocalSQLQueryTable *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  HMBLocalSQLQueryTable *v116;
  NSObject *v117;
  void *v118;
  HMBLocalSQLQueryTable *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  NSString *dropTableSQL;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  HMBSQLStatement *v150;
  HMBSQLStatement *deleteAll;
  HMBSQLStatement *v152;
  HMBSQLStatement *deleteRecord;
  HMBSQLStatement *v154;
  HMBSQLStatement *updateRecord;
  HMBSQLQueryStatement *v156;
  HMBSQLQueryStatement *selectAll;
  HMBLocalSQLQueryTable *v158;
  BOOL v159;
  void *context;
  id v162;
  id v163;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  void *v173;
  _QWORD v174[5];
  id v175;
  id v176;
  id v177;
  id *v178;
  uint64_t v179;
  char v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  id v185;
  id v186;
  HMBLocalSQLQueryTable *v187;
  id v188;
  _BYTE v189[12];
  __int16 v190;
  void *v191;
  _BYTE buf[24];
  void *v193;
  HMBLocalSQLQueryTable *v194;
  HMBLocalSQLQueryTable *v195;
  id v196;
  id *v197;
  uint64_t v198;

  v198 = *MEMORY[0x1E0C80C00];
  -[HMBLocalSQLQueryTable context](self, "context");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "queryTables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), self->_modelType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  if (v173)
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    -[HMBLocalSQLQueryTable columnNames](self, "columnNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "count");
    objc_msgSend(v173, "columnNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 == v11)
    {
      objc_msgSend(v173, "columnNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minusSet:", v12);

      v13 = objc_msgSend(v8, "count") != 0;
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 1;
  }
  -[objc_class hmbQueries](-[HMBLocalSQLQueryTable modelClass](self, "modelClass"), "hmbQueries");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = MEMORY[0x1E0C809B0];
  v174[1] = 3221225472;
  v174[2] = __42__HMBLocalSQLQueryTable_prepareWithError___block_invoke;
  v174[3] = &unk_1E8931648;
  v174[4] = self;
  objc_msgSend(v172, "enumerateObjectsUsingBlock:", v174);
  if (!v13)
    goto LABEL_31;
  v14 = self;
  -[HMBLocalSQLQueryTable context](v14, "context");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E8947930);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLQueryTable columnNames](v14, "columnNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = MEMORY[0x1E0C809B0];
  v182 = 3221225472;
  v183 = ____buildTableForClass_block_invoke;
  v184 = &unk_1E89316F0;
  v166 = v15;
  v185 = v166;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v181);

  v17 = (void *)MEMORY[0x1D17B6230]();
  v18 = v14;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalSQLQueryTable modelType](v18, "modelType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    v193 = v22;
    _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Creating index table for %@ model (fields: %@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  v23 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalSQLQueryTable modelType](v18, "modelType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalSQLQueryTable modelType](v18, "modelType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("DELETE FROM index_sentinel WHERE type = '%@';"), v28);
  v29 = objc_claimAutoreleasedReturnValue();

  v163 = objc_retainAutorelease((id)v29);
  v30 = objc_msgSend(v163, "UTF8String");
  v177 = 0;
  LOBYTE(v29) = objc_msgSend(v169, "runSQLite3:error:", v30, &v177);
  v31 = v177;
  if ((v29 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1D17B6230]();
    v33 = v18;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to clean up sentinel table (not fatal): %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
  }
  v162 = objc_retainAutorelease(v26);
  v36 = objc_msgSend(v162, "UTF8String");
  *(_QWORD *)v189 = v31;
  v37 = objc_msgSend(v169, "runSQLite3:error:", v36, v189);
  v38 = *(id *)v189;

  if ((v37 & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1D17B6230]();
    v40 = v18;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v38;
      _os_log_impl(&dword_1CCD48000, v41, OS_LOG_TYPE_INFO, "%{public}@Failed to clean up sentinel index table (not fatal): %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
  }
  v43 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalSQLQueryTable modelType](v18, "modelType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v44);
  v45 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "componentsJoinedByString:", CFSTR(", "));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLQueryTable modelType](v18, "modelType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@, CONSTRAINT fk_%@ FOREIGN KEY (_record_id) REFERENCES record_v2 (id) ON DELETE CASCADE);"),
    v45,
    v46,
    v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_retainAutorelease(v49);
  v51 = objc_msgSend(v50, "UTF8String");
  v176 = v38;
  LOBYTE(v45) = objc_msgSend(v169, "runSQLite3:error:", v51, &v176);
  v52 = v176;

  if ((v45 & 1) != 0)
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v18, "modelType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("qu_%@"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalSQLQueryTable modelType](v18, "modelType");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS %@ ON %@ (_store_id, _record_id);"),
      v55,
      v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = objc_retainAutorelease(v58);
    v60 = objc_msgSend(v59, "UTF8String");
    v175 = v52;
    v61 = objc_msgSend(v169, "runSQLite3:error:", v60, &v175);
    v62 = v175;

    if ((v61 & 1) == 0)
    {
      context = (void *)MEMORY[0x1D17B6230]();
      v63 = v18;
      HMFGetOSLogHandle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLQueryTable modelType](v63, "modelType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v66;
        *(_WORD *)&buf[22] = 2112;
        v193 = v62;
        _os_log_impl(&dword_1CCD48000, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to create index for query table for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      if (a3)
        *a3 = objc_retainAutorelease(v62);
    }

    v52 = v62;
  }
  else
  {
    v67 = (void *)MEMORY[0x1D17B6230]();
    v68 = v18;
    HMFGetOSLogHandle();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLQueryTable modelType](v68, "modelType");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v71;
      *(_WORD *)&buf[22] = 2112;
      v193 = v52;
      _os_log_impl(&dword_1CCD48000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to create query table for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v67);
    if (a3)
    {
      v52 = objc_retainAutorelease(v52);
      v61 = 0;
      *a3 = v52;
    }
    else
    {
      v61 = 0;
    }
  }

  if (!v61)
  {
    v159 = 0;
  }
  else
  {
LABEL_31:
    v72 = self;
    v170 = v172;
    -[HMBLocalSQLQueryTable context](v72, "context");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "queryTables");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalSQLQueryTable modelType](v72, "modelType");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKey:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "indexes");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v78, "mutableCopy");

    if (!v79)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v80 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v170, "na_map:", &__block_literal_global_166);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setWithArray:", v81);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v72, "modelType");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "stringWithFormat:", CFSTR("qu_%@"), v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v79, "allKeys");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setWithArray:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "na_setByRemovingObjectsFromSet:", v167);
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    v181 = MEMORY[0x1E0C809B0];
    v182 = 3221225472;
    v183 = ____updateIndexesForClass_block_invoke_2;
    v184 = &unk_1E8931758;
    v88 = v84;
    v185 = v88;
    v89 = v73;
    v186 = v89;
    v90 = v72;
    v187 = v90;
    v91 = v79;
    v188 = v91;
    objc_msgSend(v165, "enumerateObjectsUsingBlock:", &v181);
    v177 = 0;
    v178 = &v177;
    v179 = 0x2020000000;
    v180 = 0;
    objc_msgSend(v91, "objectForKey:", v88);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = v92 == 0;

    if ((_DWORD)v84)
    {
      *((_BYTE *)v178 + 24) = 1;
      v93 = (void *)MEMORY[0x1E0CB3940];
      -[HMBLocalSQLQueryTable modelType](v90, "modelType");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (_store_id, _record_id)"), v88, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      v97 = objc_retainAutorelease(v96);
      objc_msgSend(v89, "runSQLite3:", objc_msgSend(v97, "UTF8String"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (void *)MEMORY[0x1D17B6230]();
      v100 = v90;
      HMFGetOSLogHandle();
      v101 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v102;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v97;
        _os_log_impl(&dword_1CCD48000, v101, OS_LOG_TYPE_INFO, "%{public}@Creating generic index: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v99);
      if (v98)
      {
        v103 = (void *)MEMORY[0x1D17B6230]();
        v104 = v100;
        HMFGetOSLogHandle();
        v105 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v106;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v97;
          *(_WORD *)&buf[22] = 2112;
          v193 = v98;
          _os_log_impl(&dword_1CCD48000, v105, OS_LOG_TYPE_ERROR, "%{public}@Unable to create generic index %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v103);
      }

    }
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____updateIndexesForClass_block_invoke_175;
    v193 = &unk_1E8931780;
    v107 = (HMBLocalSQLQueryTable *)v91;
    v194 = v107;
    v108 = v90;
    v195 = v108;
    v109 = v89;
    v196 = v109;
    v197 = &v177;
    objc_msgSend(v170, "enumerateObjectsUsingBlock:", buf);
    if (*((_BYTE *)v178 + 24))
    {
      v110 = (void *)MEMORY[0x1E0CB3940];
      -[HMBLocalSQLQueryTable modelType](v108, "modelType");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "stringWithFormat:", CFSTR("DELETE FROM index_sentinel WHERE type = '%@';"), v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = objc_retainAutorelease(v112);
      objc_msgSend(v109, "runSQLite3:", objc_msgSend(v113, "UTF8String"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      if (v114)
      {
        v115 = (void *)MEMORY[0x1D17B6230]();
        v116 = v108;
        HMFGetOSLogHandle();
        v117 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v189 = 138543618;
          *(_QWORD *)&v189[4] = v118;
          v190 = 2112;
          v191 = v114;
          _os_log_impl(&dword_1CCD48000, v117, OS_LOG_TYPE_INFO, "%{public}@Failed to remove sentinel table (not fatal): %@", v189, 0x16u);

        }
        objc_autoreleasePoolPop(v115);
      }

    }
    _Block_object_dispose(&v177, 8);

    v119 = v108;
    v120 = (void *)MEMORY[0x1E0C99DE8];
    v121 = v170;
    -[HMBLocalSQLQueryTable columnNames](v119, "columnNames");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "arrayWithCapacity:", objc_msgSend(v122, "count"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMBLocalSQLQueryTable columnNames](v119, "columnNames");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = MEMORY[0x1E0C809B0];
    v182 = 3221225472;
    v183 = ____prepareStatementsForClass_block_invoke;
    v184 = &unk_1E89316F0;
    v185 = v123;
    v171 = v123;
    objc_msgSend(v124, "enumerateObjectsUsingBlock:", &v181);

    -[HMBLocalSQLQueryTable columnNames](v119, "columnNames");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "componentsJoinedByString:", CFSTR(", "));
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v171, "componentsJoinedByString:", CFSTR(", "));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v119, "modelType");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE _store_id=?1"), v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    v132 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v119, "modelType");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "stringWithFormat:", CFSTR("DELETE FROM %@ where _record_id=?1"), v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    v136 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v119, "modelType");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v138);
    v139 = objc_claimAutoreleasedReturnValue();
    dropTableSQL = v119->_dropTableSQL;
    v119->_dropTableSQL = (NSString *)v139;

    v141 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v119, "modelType");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (_store_id, _record_id, %@) values(?1, ?2, %@)"), v143, v126, v127);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    v145 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLQueryTable modelType](v119, "modelType");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "stringWithFormat:", CFSTR("SELECT _record_id, %@ FROM %@ WHERE _store_id = :_store_id AND _record_id > :_sequence_offset ORDER BY _record_id LIMIT (%lu)"), v126, v147, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMBLocalSQLQueryTable context](v119, "context");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v119->_finalized = 0;
    v150 = -[HMBSQLStatement initWithContext:statement:]([HMBSQLStatement alloc], "initWithContext:statement:", v149, v131);
    deleteAll = v119->_deleteAll;
    v119->_deleteAll = v150;

    v152 = -[HMBSQLStatement initWithContext:statement:]([HMBSQLStatement alloc], "initWithContext:statement:", v149, v135);
    deleteRecord = v119->_deleteRecord;
    v119->_deleteRecord = v152;

    v154 = -[HMBSQLStatement initWithContext:statement:]([HMBSQLStatement alloc], "initWithContext:statement:", v149, v144);
    updateRecord = v119->_updateRecord;
    v119->_updateRecord = v154;

    v156 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", v149, v148);
    selectAll = v119->_selectAll;
    v119->_selectAll = v156;

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____prepareStatementsForClass_block_invoke_2;
    v193 = &unk_1E8931648;
    v194 = v119;
    v158 = v119;
    objc_msgSend(v121, "enumerateObjectsUsingBlock:", buf);

    v159 = 1;
  }

  return v159;
}

- (id)performQueryOn:(id)a3 properties:(id)a4 filter:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HMBLocalZoneQueryResultFilter *v16;
  void *v17;
  HMBLocalZoneQueryResultFilter *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  HMBLocalSQLQueryTable *v23;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLQueryTable columnNames](self, "columnNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__HMBLocalSQLQueryTable_performQueryOn_properties_filter___block_invoke;
  v20[3] = &unk_1E8931620;
  v21 = v8;
  v22 = v12;
  v23 = self;
  v14 = v12;
  v15 = v8;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);

  v16 = [HMBLocalZoneQueryResultFilter alloc];
  -[HMBLocalSQLQueryTable selectAll](self, "selectAll");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMBLocalZoneQueryResultFilter initWithLocalZone:statement:columns:filter:](v16, "initWithLocalZone:statement:columns:filter:", v11, v17, v14, v10);

  return v18;
}

- (unint64_t)_deleteQueryForRecordRow:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  sqlite3_stmt *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  -[HMBLocalSQLQueryTable deleteRecord](self, "deleteRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (sqlite3_stmt *)objc_msgSend(v7, "statement");

  hmbBindIntSQLite3(v8, 1, a3, a4);
  -[HMBLocalSQLQueryTable context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLQueryTable deleteRecord](self, "deleteRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "execSQLite3:error:", objc_msgSend(v10, "statement"), a4);

  return v11;
}

- (unint64_t)_deleteAllQueriesForZoneRow:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  sqlite3_stmt *v8;
  void *v9;
  unint64_t v10;

  -[HMBLocalSQLQueryTable deleteAll](self, "deleteAll");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (sqlite3_stmt *)objc_msgSend(v7, "statement");

  hmbBindIntSQLite3(v8, 1, a3, a4);
  -[HMBLocalSQLQueryTable context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "execSQLite3:error:", v8, a4);

  return v10;
}

- (id)buildQueriableFieldsForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[HMBLocalSQLQueryTable columnNames](self, "columnNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBLocalSQLQueryTable columnNames](self, "columnNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__HMBLocalSQLQueryTable_buildQueriableFieldsForModel___block_invoke;
  v13[3] = &unk_1E8931620;
  v13[4] = self;
  v14 = v4;
  v15 = v7;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v11 = (void *)objc_msgSend(v9, "copy");
  return v11;
}

- (unint64_t)_updateQueryForZoneRow:(unint64_t)a3 recordRow:(unint64_t)a4 encodedColumns:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  sqlite3_stmt *v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[5];

  v10 = a5;
  -[HMBLocalSQLQueryTable updateRecord](self, "updateRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (sqlite3_stmt *)objc_msgSend(v11, "statement");

  hmbBindIntSQLite3(v12, 1, a3, a6);
  hmbBindIntSQLite3(v12, 2, a4, a6);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__HMBLocalSQLQueryTable__updateQueryForZoneRow_recordRow_encodedColumns_error___block_invoke;
  v16[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v16[4] = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  -[HMBLocalSQLQueryTable context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "insertSQLite3:error:", v12, a6);

  return v14;
}

- (void)dealloc
{
  HMBLocalSQLQueryTable *v3;
  SEL v4;
  objc_super v5;

  if (-[HMBLocalSQLQueryTable finalized](self, "finalized"))
  {
    v5.receiver = self;
    v5.super_class = (Class)HMBLocalSQLQueryTable;
    -[HMBLocalSQLQueryTable dealloc](&v5, sel_dealloc);
  }
  else
  {
    v3 = (HMBLocalSQLQueryTable *)_HMFPreconditionFailure();
    -[HMBLocalSQLQueryTable finalize](v3, v4);
  }
}

- (void)finalize
{
  void *v3;
  HMBLocalSQLQueryTable *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[HMBLocalSQLQueryTable finalized](self, "finalized"))
    _HMFPreconditionFailure();
  v3 = (void *)MEMORY[0x1D17B6230]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_INFO, "%{public}@Finalizing table", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMBLocalSQLQueryTable deleteAll](v4, "deleteAll");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finalize");

  -[HMBLocalSQLQueryTable deleteRecord](v4, "deleteRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finalize");

  -[HMBLocalSQLQueryTable updateRecord](v4, "updateRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finalize");

  -[HMBLocalSQLQueryTable selectAll](v4, "selectAll");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finalize");

  -[HMBLocalSQLQueryTable userQueries](v4, "userQueries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_1050);

  -[HMBLocalSQLQueryTable userQueries](v4, "userQueries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[HMBLocalSQLQueryTable setFinalized:](v4, "setFinalized:", 1);
}

- (HMBLocalSQLContext)context
{
  return (HMBLocalSQLContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSArray)columnFields
{
  return self->_columnFields;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (HMBSQLQueryStatement)selectAll
{
  return self->_selectAll;
}

- (NSString)dropTableSQL
{
  return self->_dropTableSQL;
}

- (HMBSQLStatement)deleteAll
{
  return self->_deleteAll;
}

- (HMBSQLStatement)updateRecord
{
  return self->_updateRecord;
}

- (HMBSQLStatement)deleteRecord
{
  return self->_deleteRecord;
}

- (NSMutableSet)userQueries
{
  return self->_userQueries;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueries, 0);
  objc_storeStrong((id *)&self->_deleteRecord, 0);
  objc_storeStrong((id *)&self->_updateRecord, 0);
  objc_storeStrong((id *)&self->_deleteAll, 0);
  objc_storeStrong((id *)&self->_dropTableSQL, 0);
  objc_storeStrong((id *)&self->_selectAll, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_columnFields, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_destroyWeak((id *)&self->_context);
}

uint64_t __33__HMBLocalSQLQueryTable_finalize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finalize");
}

void __79__HMBLocalSQLQueryTable__updateQueryForZoneRow_recordRow_encodedColumns_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  sqlite3_stmt *v7;
  int v8;
  id *v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v11 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  v7 = *(sqlite3_stmt **)(a1 + 32);
  v8 = a3 + 3;
  if (v5 == v11)
  {
    v13 = 0;
    v9 = (id *)&v13;
    v10 = &v13;
    v6 = 0;
  }
  else
  {
    v12 = 0;
    v9 = (id *)&v12;
    v10 = &v12;
  }
  hmbBindDataSQLite3(v7, v8, v6, v10);

}

void __54__HMBLocalSQLQueryTable_buildQueriableFieldsForModel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "columnFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "hmbPropertyNamed:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 48);
  if (v8)
  {
    objc_msgSend(v12, "encodeBlock");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);
  }

}

void __58__HMBLocalSQLQueryTable_performQueryOn_properties_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  HMBLocalZoneQueryResultColumnTuple *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMBLocalZoneQueryResultColumnTuple *v11;
  id v12;

  v12 = a2;
  v5 = *(void **)(a1 + 32);
  if (!v5 || objc_msgSend(v5, "containsObject:", v12))
  {
    v6 = *(void **)(a1 + 40);
    v7 = [HMBLocalZoneQueryResultColumnTuple alloc];
    v8 = (a3 + 1);
    objc_msgSend(*(id *)(a1 + 48), "columnFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMBLocalZoneQueryResultColumnTuple initWithName:offset:modelField:](v7, "initWithName:offset:modelField:", v12, v8, v10);
    objc_msgSend(v6, "addObject:", v11);

  }
}

void __42__HMBLocalSQLQueryTable_prepareWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setModelClass:", objc_msgSend(v2, "modelClass"));

}

void __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "encodeBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke_2(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  SEL v6;
  id v7;

  v7 = a2;
  objc_msgSend(a1[4], "objectForKey:");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(a1[5], "addObject:", v3);
    objc_msgSend(a1[6], "addObject:", v7);

  }
  else
  {
    v5 = (void *)_HMFPreconditionFailure();
    +[HMBLocalSQLQueryTable logCategory](v5, v6);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1)
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_17);
  return (id)logCategory__hmf_once_v19;
}

void __36__HMBLocalSQLQueryTable_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19;
  logCategory__hmf_once_v19 = v0;

}

@end
