@implementation AMDFetchDescriptor

+ (id)extractPart:(id)a3 from:(id)a4 required:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id *v12;
  BOOL v13;
  id v14;
  id location[3];
  id v16;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = a5;
  v12 = a6;
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing or invalid %@"), location[0]);
  v10 = (id)objc_msgSend(v14, "objectForKey:", location[0]);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v10;
    }
    else
    {
      *v12 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v11);
      v16 = 0;
    }
  }
  else
  {
    if (v13)
      *v12 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v11);
    v16 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (char)getCodeForSaveAsType:(id)a3
{
  id v3;
  void *v4;
  char v6;
  id v7;
  int v8;
  id location[3];
  char v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (!getCodeForSaveAsType__typeMap)
    {
      v11[0] = CFSTR("dictionary");
      v12[0] = &unk_1EA4CEEA8;
      v11[1] = CFSTR("list");
      v12[1] = &unk_1EA4CEEC0;
      v11[2] = CFSTR("rowset");
      v12[2] = &unk_1EA4CEED8;
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
      v4 = (void *)getCodeForSaveAsType__typeMap;
      getCodeForSaveAsType__typeMap = (uint64_t)v3;

    }
    v7 = (id)objc_msgSend((id)getCodeForSaveAsType__typeMap, "objectForKey:", location[0]);
    if (v7)
      v6 = objc_msgSend(v7, "unsignedIntValue");
    else
      v6 = 0;
    v10 = v6;
    v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v10 = 0;
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)refreshAggregationDescriptors:(id)a3 forDomain:(id)a4 error:(id *)a5
{
  BOOL v5;
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
  id v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  unsigned int i;
  id v47;
  os_log_type_t v48;
  os_log_t v49;
  id v50;
  id v51;
  int v52;
  os_log_type_t type;
  os_log_t oslog;
  id v55;
  id v56;
  id v57;
  id v58;
  id *v59;
  id v60;
  id location[2];
  Class v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[4];
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t v78[16];
  id v79;
  id v80;
  uint8_t v81[24];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v62 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = 0;
  objc_storeStrong(&v60, a4);
  v59 = a5;
  v58 = CFSTR("SaveAggDescripors");
  v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v56 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2BC8);
  if (v56 && objc_msgSend(v56, "count"))
  {
    v51 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    if (objc_msgSend(v51, "getDb"))
    {
      v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v56, "count"));
      for (i = 0; ; ++i)
      {
        v29 = i;
        if (v29 >= objc_msgSend(v56, "count"))
          break;
        v25 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:", i);
        v45 = (id)objc_msgSend(v25, "mutableCopy");

        objc_msgSend(v45, "setObject:forKey:", v60, CFSTR("domain"));
        v27 = [v62 alloc];
        v26 = v45;
        v28 = (id)objc_msgSend(v51, "getDataSchema");
        v44 = (id)objc_msgSend(v27, "initWithDict:usingSchema:error:", v26);

        if (*v59)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v22 = i;
          v24 = (id)objc_msgSend(*v59, "localizedDescription");
          v43 = (id)objc_msgSend(v23, "stringWithFormat:", CFSTR("SQLITE bad aggregation descriptor %u: '%@'"), v22, v24);

          v74 = v58;
          v75 = v43;
          v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v52 = 1;
          objc_storeStrong(&v43, 0);
        }
        else
        {
          v42 = (id)objc_msgSend(v44, "getId");
          v41 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v45, 6, v59);
          if (*v59)
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            v21 = v42;
            v5 = *v59 == 0;
            v38 = 0;
            if (v5)
            {
              v19 = CFSTR("unknown reason");
            }
            else
            {
              v39 = (id)objc_msgSend(*v59, "localizedDescription");
              v38 = 1;
              v19 = (const __CFString *)v39;
            }
            v40 = (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("SQLITE agg descriptor '%@' serialization failure: %@"), v21, v19);
            if ((v38 & 1) != 0)

            v72 = v58;
            v73 = v40;
            v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
            v52 = 1;
            objc_storeStrong(&v40, 0);
          }
          else
          {
            v15 = v47;
            v70[0] = 0x1EA4B9448;
            v71[0] = v41;
            v70[1] = 0x1EA4B8948;
            v18 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v60));
            v71[1] = v18;
            v70[2] = 0x1EA4B7308;
            v71[2] = v42;
            v70[3] = 0x1EA4B9308;
            v17 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
            v71[3] = v17;
            v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
            objc_msgSend(v15, "addObject:");

            v52 = 0;
          }
          objc_storeStrong(&v41, 0);
          objc_storeStrong(&v42, 0);
        }
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        if (v52)
          goto LABEL_32;
      }
      v37 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %ld"), 0x1EA4B8948, +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v60));
      v68[0] = CFSTR("tableName");
      v69[0] = 0x1EA4B9428;
      v68[1] = 0x1EA4B92C8;
      v69[1] = v47;
      v68[2] = CFSTR("predicateExpression");
      v69[2] = v37;
      v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
      v35 = (id)objc_msgSend(v51, "deleteRows:error:", v36, v59);
      if (*v59)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v12 = v60;
        v14 = (id)objc_msgSend(*v59, "localizedDescription");
        v34 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("SQLITE could not delete descriptors for domain '%@': %@"), v12, v14);

        v66 = v58;
        v67 = v34;
        v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v52 = 1;
        objc_storeStrong(&v34, 0);
      }
      else
      {
        objc_msgSend(v57, "addEntriesFromDictionary:", v35);
        v10 = v51;
        v11 = (id)objc_msgSend(v51, "getBootSchema");
        v33 = (id)objc_msgSend(v10, "insertRows:usingSchema:error:", v36);

        if (*v59)
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v7 = v60;
          v9 = (id)objc_msgSend(*v59, "localizedDescription");
          v32 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("SQLITE could not insert descriptors for domain '%@': %@"), v7, v9);

          v64 = v58;
          v65 = v32;
          v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v52 = 1;
          objc_storeStrong(&v32, 0);
        }
        else
        {
          objc_msgSend(v57, "addEntriesFromDictionary:", v33);
          v63 = v57;
          v52 = 1;
        }
        objc_storeStrong(&v33, 0);
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v37, 0);
LABEL_32:
      objc_storeStrong(&v47, 0);
    }
    else
    {
      v50 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQL database pointer is nil"));
      *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v50);
      v49 = (os_log_t)MEMORY[0x1E0C81028];
      v48 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v50);
        _os_log_impl(&dword_1DC678000, v49, v48, "%@", v78, 0xCu);
      }
      objc_storeStrong((id *)&v49, 0);
      v76 = v58;
      v77 = v50;
      v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v52 = 1;
      objc_storeStrong(&v50, 0);
    }
    objc_storeStrong(&v51, 0);
  }
  else
  {
    v55 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No SQLite aggregators for domain '%@'"), v60);
    *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v55);
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v81, (uint64_t)v55);
      _os_log_impl(&dword_1DC678000, oslog, type, "%@", v81, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v79 = v58;
    v80 = v55;
    v63 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v52 = 1;
    objc_storeStrong(&v55, 0);
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
  return v63;
}

- (id)getColumnSpecs
{
  return -[AMDFetchDescriptor _columnSpecs](self, "_columnSpecs", a2, self);
}

- (int64_t)getDomain
{
  return -[AMDFetchDescriptor _domain](self, "_domain", a2, self);
}

- (void)setDomain:(int64_t)a3
{
  -[AMDFetchDescriptor set_domain:](self, "set_domain:", a3);
}

- (id)getId
{
  return -[AMDFetchDescriptor _id](self, "_id", a2, self);
}

- (id)getStatement
{
  return -[AMDFetchDescriptor _statement](self, "_statement", a2, self);
}

- (AMDFetchDescriptor)initWithDict:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
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
  AMDSQLiteColumnSpec *v16;
  id v17;
  id v18;
  char v19;
  int64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  id v30;
  NSObject *log;
  os_log_type_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  BOOL v44;
  id v47;
  id v48;
  id v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  id v63;
  uint8_t v64[7];
  os_log_type_t type;
  os_log_t oslog;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD __b[8];
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  int v92;
  objc_super v93;
  id *v94;
  id v95;
  id location[2];
  id v97;
  AMDFetchDescriptor *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v95 = 0;
  objc_storeStrong(&v95, a4);
  v94 = a5;
  v5 = v97;
  v97 = 0;
  v93.receiver = v5;
  v93.super_class = (Class)AMDFetchDescriptor;
  v97 = -[AMDFetchDescriptor init](&v93, sel_init);
  objc_storeStrong(&v97, v97);
  v47 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("id"), location[0], 1, v94);
  objc_msgSend(v97, "set_id:");

  if (*v94)
  {
    v98 = 0;
    v92 = 1;
  }
  else
  {
    v91 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("tableName"), location[0], 1, v94);
    if (*v94)
    {
      v98 = 0;
      v92 = 1;
    }
    else
    {
      v90 = (id)objc_msgSend(v95, "getTables");
      v6 = (id)objc_msgSend(v90, "objectForKey:", v91);
      v44 = v6 != 0;

      if (v44)
      {
        v88 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FROM %@"), v91);
        v87 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("columnsToFetch"));
        if (v87 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v86 = v87;
          v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v86, "count"));
          v84 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v86, "count"));
          memset(__b, 0, sizeof(__b));
          v42 = v86;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", __b, v99, 16);
          if (v43)
          {
            v39 = *(_QWORD *)__b[2];
            v40 = 0;
            v41 = v43;
            while (1)
            {
              v38 = v40;
              if (*(_QWORD *)__b[2] != v39)
                objc_enumerationMutation(v42);
              v83 = *(id *)(__b[1] + 8 * v40);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              v81 = v83;
              v37 = (id)objc_msgSend(v81, "allKeys");
              v10 = (id)objc_msgSend(v37, "firstObject");
              v11 = v87;
              v87 = v10;

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v80 = v87;
                v13 = (id)objc_msgSend(v81, "objectForKey:", v80);
                v14 = v87;
                v87 = v13;

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v79 = v87;
                  v16 = [AMDSQLiteColumnSpec alloc];
                  v78 = -[AMDSQLiteColumnSpec initWithDict:withName:error:](v16, "initWithDict:withName:error:", v79, v80, v94);
                  if (*v94)
                  {
                    v98 = 0;
                    v92 = 1;
                  }
                  else
                  {
                    objc_msgSend(v85, "addObject:", v78);
                    v35 = v84;
                    v36 = (id)objc_msgSend(v78, "getSelectColumnExpression");
                    objc_msgSend(v35, "addObject:");

                    v92 = 0;
                  }
                  objc_storeStrong(&v78, 0);
                  objc_storeStrong(&v79, 0);
                }
                else
                {
                  v15 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Invalid column spec"));
                  *v94 = v15;
                  v98 = 0;
                  v92 = 1;
                }
                objc_storeStrong(&v80, 0);
              }
              else
              {
                v12 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Invalid column name"));
                *v94 = v12;
                v98 = 0;
                v92 = 1;
              }
              objc_storeStrong(&v81, 0);
              if (v92)
                goto LABEL_29;
              ++v40;
              if (v38 + 1 >= v41)
              {
                v40 = 0;
                v41 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", __b, v99, 16);
                if (!v41)
                  goto LABEL_28;
              }
            }
            v9 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Invalid columnspec"));
            *v94 = v9;
            v98 = 0;
            v92 = 1;
          }
          else
          {
LABEL_28:
            v92 = 0;
          }
LABEL_29:

          if (!v92)
          {
            objc_msgSend(v97, "set_columnSpecs:", v85);
            v77 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("joinExpression"), location[0], 0, v94);
            if (*v94)
            {
              v98 = 0;
              v92 = 1;
            }
            else
            {
              v76 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("predicateExpression"), location[0], 0, v94);
              if (*v94)
              {
                v98 = 0;
                v92 = 1;
              }
              else
              {
                v75 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("groupByExpression"), location[0], 0, v94);
                if (*v94)
                {
                  v98 = 0;
                  v92 = 1;
                }
                else
                {
                  v74 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("havingExpression"), location[0], 0, v94);
                  if (*v94)
                  {
                    v98 = 0;
                    v92 = 1;
                  }
                  else
                  {
                    v73 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("sortExpression"), location[0], 0, v94);
                    if (*v94)
                    {
                      v98 = 0;
                      v92 = 1;
                    }
                    else
                    {
                      v72 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("limit"), location[0], 0, v94);
                      if (*v94)
                      {
                        v98 = 0;
                        v92 = 1;
                      }
                      else
                      {
                        v71 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("onlyLocalData"), location[0], 0, v94);
                        if (*v94)
                        {
                          v98 = 0;
                          v92 = 1;
                        }
                        else
                        {
                          if (v71 && (objc_msgSend(v71, "isEqualToString:", CFSTR("TRUE")) & 1) != 0)
                          {
                            v70 = 0;
                            v68 = 0;
                            v34 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", &v68);
                            objc_storeStrong(&v70, v68);
                            v69 = v34;
                            if (v70 || !v69)
                            {
                              oslog = (os_log_t)MEMORY[0x1E0C81028];
                              type = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                              {
                                log = oslog;
                                v32 = type;
                                __os_log_helper_16_0_0(v64);
                                _os_log_error_impl(&dword_1DC678000, log, v32, "Local device Id could not be fetched", v64, 2u);
                              }
                              objc_storeStrong((id *)&oslog, 0);
                            }
                            else
                            {
                              v67 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceId = '%@'"), v69);
                              if (v76)
                              {
                                v33 = (id)objc_msgSend(v76, "stringByAppendingString:", CFSTR(" AND "));
                                v17 = (id)objc_msgSend(v33, "stringByAppendingString:", v67);
                                v18 = v76;
                                v76 = v17;

                              }
                              else
                              {
                                objc_storeStrong(&v76, v67);
                              }
                              objc_storeStrong(&v67, 0);
                            }
                            objc_storeStrong(&v69, 0);
                            objc_storeStrong(&v70, 0);
                          }
                          v29 = (void *)MEMORY[0x1E0CB3940];
                          v30 = (id)objc_msgSend(v84, "componentsJoinedByString:", CFSTR(", "));
                          v63 = (id)objc_msgSend(v29, "stringWithFormat:", CFSTR("SELECT %@ %@"), v30, v88);

                          v61 = 0;
                          if (v77)
                          {
                            v62 = (id)objc_msgSend(v63, "stringByAppendingFormat:", CFSTR(" %@"), v77);
                            v61 = 1;
                            objc_storeStrong(&v63, v62);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if ((v61 & 1) != 0)

                          v59 = 0;
                          if (v76)
                          {
                            v60 = (id)objc_msgSend(v63, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v76);
                            v59 = 1;
                            objc_storeStrong(&v63, v60);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if ((v59 & 1) != 0)

                          v57 = 0;
                          if (v75)
                          {
                            v58 = (id)objc_msgSend(v63, "stringByAppendingFormat:", CFSTR(" GROUP BY %@"), v75);
                            v57 = 1;
                            objc_storeStrong(&v63, v58);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if ((v57 & 1) != 0)

                          v55 = 0;
                          if (v74)
                          {
                            v56 = (id)objc_msgSend(v63, "stringByAppendingFormat:", CFSTR(" HAVING %@"), v74);
                            v55 = 1;
                            objc_storeStrong(&v63, v56);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if ((v55 & 1) != 0)

                          v53 = 0;
                          if (v73)
                          {
                            v54 = (id)objc_msgSend(v63, "stringByAppendingFormat:", CFSTR(" ORDER BY %@"), v73);
                            v53 = 1;
                            objc_storeStrong(&v63, v54);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if ((v53 & 1) != 0)

                          v51 = 0;
                          if (v72)
                          {
                            v52 = (id)objc_msgSend(v63, "stringByAppendingFormat:", CFSTR(" LIMIT %@"), v72);
                            v51 = 1;
                            objc_storeStrong(&v63, v52);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if ((v51 & 1) != 0)

                          objc_msgSend(v97, "set_statement:", v63);
                          v50 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("saveAs"), location[0], 0, v94);
                          if (*v94)
                          {
                            v98 = 0;
                            v92 = 1;
                          }
                          else
                          {
                            v19 = +[AMDFetchDescriptor getCodeForSaveAsType:](AMDFetchDescriptor, "getCodeForSaveAsType:", v50);
                            objc_msgSend(v97, "set_saveAsType:", v19);
                            v49 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("domain"), location[0], 0, v94);
                            if (*v94)
                            {
                              v98 = 0;
                              v92 = 1;
                            }
                            else
                            {
                              v20 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v49);
                              objc_msgSend(v97, "set_domain:", v20);
                              v48 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("listColumn"), location[0], 0, v94);

                              if (*v94)
                              {
                                v98 = 0;
                                v92 = 1;
                              }
                              else
                              {
                                if (v48)
                                  v28 = objc_msgSend(v48, "intValue");
                                else
                                  v28 = -1;
                                objc_msgSend(v97, "set_listColumn:", v28);
                                v21 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("keyColumn"), location[0], 0, v94);
                                v22 = v48;
                                v48 = v21;

                                if (*v94)
                                {
                                  v98 = 0;
                                  v92 = 1;
                                }
                                else
                                {
                                  if (v48)
                                    v27 = objc_msgSend(v48, "intValue");
                                  else
                                    v27 = -1;
                                  objc_msgSend(v97, "set_keyColumn:", v27);
                                  v23 = +[AMDFetchDescriptor extractPart:from:required:error:](AMDFetchDescriptor, "extractPart:from:required:error:", CFSTR("valueColumn"), location[0], 0, v94);
                                  v24 = v48;
                                  v48 = v23;

                                  if (*v94)
                                  {
                                    v98 = 0;
                                    v92 = 1;
                                  }
                                  else
                                  {
                                    if (v48)
                                      v26 = objc_msgSend(v48, "intValue");
                                    else
                                      v26 = -1;
                                    objc_msgSend(v97, "set_valueColumn:", v26);
                                    v98 = (AMDFetchDescriptor *)v97;
                                    v92 = 1;
                                  }
                                }
                              }
                              objc_storeStrong(&v48, 0);
                            }
                            objc_storeStrong(&v49, 0);
                          }
                          objc_storeStrong(&v50, 0);
                          objc_storeStrong(&v63, 0);
                        }
                        objc_storeStrong(&v71, 0);
                      }
                      objc_storeStrong(&v72, 0);
                    }
                    objc_storeStrong(&v73, 0);
                  }
                  objc_storeStrong(&v74, 0);
                }
                objc_storeStrong(&v75, 0);
              }
              objc_storeStrong(&v76, 0);
            }
            objc_storeStrong(&v77, 0);
          }
          objc_storeStrong(&v84, 0);
          objc_storeStrong(&v85, 0);
          objc_storeStrong(&v86, 0);
        }
        else
        {
          v8 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("No or invalid columns"));
          *v94 = v8;
          v98 = 0;
          v92 = 1;
        }
        objc_storeStrong(&v87, 0);
        objc_storeStrong(&v88, 0);
      }
      else
      {
        v89 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE No table '%@'"), v91);
        v7 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v89);
        *v94 = v7;
        v98 = 0;
        v92 = 1;
        objc_storeStrong(&v89, 0);
      }
      objc_storeStrong(&v90, 0);
    }
    objc_storeStrong(&v91, 0);
  }
  objc_storeStrong(&v95, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v97, 0);
  return v98;
}

- (BOOL)isPersistable
{
  int v3;
  int v4;
  BOOL v5;
  NSArray *v6;
  unint64_t v7;
  BOOL v8;

  v6 = -[AMDFetchDescriptor _columnSpecs](self, "_columnSpecs");
  v7 = -[NSArray count](v6, "count");

  v8 = 0;
  if (-[AMDFetchDescriptor _domain](self, "_domain"))
  {
    v8 = 0;
    if (-[AMDFetchDescriptor _saveAsType](self, "_saveAsType"))
    {
      if (-[AMDFetchDescriptor _saveAsType](self, "_saveAsType") != 2
        || (v8 = 0, -[AMDFetchDescriptor _listColumn](self, "_listColumn") >= 0)
        && (v8 = 0, -[AMDFetchDescriptor _listColumn](self, "_listColumn") < v7))
      {
        if (-[AMDFetchDescriptor _saveAsType](self, "_saveAsType") == 1)
        {
          v5 = 0;
          if (-[AMDFetchDescriptor _keyColumn](self, "_keyColumn") >= 0)
          {
            v5 = 0;
            if (-[AMDFetchDescriptor _keyColumn](self, "_keyColumn") < v7)
            {
              v5 = 0;
              if (-[AMDFetchDescriptor _valueColumn](self, "_valueColumn") >= 0)
              {
                v5 = 0;
                if (-[AMDFetchDescriptor _valueColumn](self, "_valueColumn") < v7)
                {
                  v4 = -[AMDFetchDescriptor _keyColumn](self, "_keyColumn");
                  v5 = v4 != -[AMDFetchDescriptor _valueColumn](self, "_valueColumn");
                }
              }
            }
          }
          v3 = v5;
        }
        else
        {
          v3 = 1;
        }
        return v3 != 0;
      }
    }
  }
  return v8;
}

- (id)persist:(id)a3 error:(id *)a4
{
  unint64_t v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  id v10;
  os_log_type_t v11;
  id v12;
  int v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17[2];
  id location[2];
  AMDFetchDescriptor *v19;
  id v20;
  id v21;
  id v22;
  uint8_t v23[32];
  id v24;
  id v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17[1] = a4;
  v17[0] = CFSTR("SQlitePersist");
  if (-[AMDFetchDescriptor isPersistable](v19, "isPersistable"))
  {
    v12 = MEMORY[0x1E0C81028];
    v11 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    {
      v6 = -[AMDFetchDescriptor _id](v19, "_id");
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v23, (uint64_t)v6, -[AMDFetchDescriptor _saveAsType](v19, "_saveAsType"));
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v12, v11, "SQLITE Saving agg results for '%@', type: %d", v23, 0x12u);

    }
    objc_storeStrong(&v12, 0);
    v10 = 0;
    v5 = -[AMDFetchDescriptor _saveAsType](v19, "_saveAsType");
    if (v5 <= 3)
      __asm { BR              X8 }
    v21 = v17[0];
    v22 = v10;
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = -[AMDFetchDescriptor _id](v19, "_id");
    v16 = (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("Cannot persist '%@', check descriptor"), v8);

    v15 = MEMORY[0x1E0C81028];
    v14 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v16);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v15, v14, "SQLITE %@", v26, 0xCu);
    }
    objc_storeStrong(&v15, 0);
    v24 = v17[0];
    v25 = v16;
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v13 = 1;
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (id)persistObject:(id)a3 error:(id *)a4
{
  BOOL v4;
  NSString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSString *v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  id v19;
  id v20;
  id v21;
  NSString *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  NSString *v26;
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
  int v38;
  char v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  id location[2];
  AMDFetchDescriptor *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[6];
  _QWORD v57[6];
  id v58;
  id v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = a4;
  v43 = CFSTR("persistFDOutput");
  v42 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", location[0], 6, a4);
  if (*a4)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = -[AMDFetchDescriptor _id](v46, "_id");
    v4 = *v44 == 0;
    v39 = 0;
    if (v4)
    {
      v24 = CFSTR("unknown reason");
    }
    else
    {
      v40 = (id)objc_msgSend(*v44, "localizedDescription");
      v39 = 1;
      v24 = (const __CFString *)v40;
    }
    v41 = (id)objc_msgSend(v25, "stringWithFormat:", CFSTR("SQLITE tp data '%@' serialization failure: %@"), v26, v24);
    if ((v39 & 1) != 0)

    v59 = v43;
    v60[0] = v41;
    v47 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v38 = 1;
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v16 = -[AMDFetchDescriptor _domain](v46, "_domain");
    v18 = -[AMDFetchDescriptor _id](v46, "_id");
    v37 = (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ = %ld AND %@ = '%@'"), 0x1EA4B8948, v16, 0x1EA4B86A8, v18);

    v56[0] = 0x1EA4B8948;
    v23 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMDFetchDescriptor _domain](v46, "_domain"));
    v57[0] = v23;
    v56[1] = 0x1EA4B86A8;
    v22 = -[AMDFetchDescriptor _id](v46, "_id");
    v57[1] = v22;
    v56[2] = 0x1EA4B93C8;
    v57[2] = 0x1EA4C2528;
    v56[3] = 0x1EA4B93E8;
    v21 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", -[AMDFetchDescriptor _saveAsType](v46, "_saveAsType"));
    v57[3] = v21;
    v56[4] = 0x1EA4B9408;
    v57[4] = v42;
    v56[5] = 0x1EA4B9308;
    v20 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
    v57[5] = v20;
    v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 6);
    v58 = v19;
    v36 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);

    v54[0] = CFSTR("tableName");
    v55[0] = 0x1EA4B93A8;
    v54[1] = 0x1EA4B92C8;
    v55[1] = v36;
    v54[2] = CFSTR("predicateExpression");
    v55[2] = v37;
    v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v33 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    if (objc_msgSend(v33, "getDb"))
    {
      v31 = (id)objc_msgSend(v33, "deleteRows:error:", v35, v44);
      if (*v44)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v15 = -[AMDFetchDescriptor _id](v46, "_id");
        v12 = -[AMDFetchDescriptor _domain](v46, "_domain");
        v14 = (id)objc_msgSend(*v44, "localizedDescription");
        v30 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("SQLITE error deleting old TP entry '%@', domain %lu: %@"), v15, v12, v14);

        v50 = v43;
        v51 = v30;
        v47 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v38 = 1;
        objc_storeStrong(&v30, 0);
      }
      else
      {
        objc_msgSend(v34, "addEntriesFromDictionary:", v31);
        v11 = (id)objc_msgSend(v33, "getBootSchema");
        v29 = (id)objc_msgSend(v33, "insertRows:usingSchema:error:", v35);

        if (*v44)
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v10 = -[AMDFetchDescriptor _id](v46, "_id");
          v7 = -[AMDFetchDescriptor _domain](v46, "_domain");
          v9 = (id)objc_msgSend(*v44, "localizedDescription");
          v28 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("SQLITE error inserting new TP entry '%@', domain %lu: %@"), v10, v7, v9);

          v48 = v43;
          v49 = v28;
          v47 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v38 = 1;
          objc_storeStrong(&v28, 0);
        }
        else
        {
          objc_msgSend(v34, "addEntriesFromDictionary:", v29);
          v6 = -[AMDFetchDescriptor _id](v46, "_id");
          objc_msgSend(v34, "setObject:forKey:");

          v47 = v34;
          v38 = 1;
        }
        objc_storeStrong(&v29, 0);
      }
      objc_storeStrong(&v31, 0);
    }
    else
    {
      v32 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQL database pointer is nil"));
      v52 = v43;
      v53 = v32;
      v47 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v38 = 1;
      objc_storeStrong(&v32, 0);
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v47;
}

- (NSArray)_columnSpecs
{
  return self->__columnSpecs;
}

- (void)set_columnSpecs:(id)a3
{
  objc_storeStrong((id *)&self->__columnSpecs, a3);
}

- (int64_t)_domain
{
  return self->__domain;
}

- (void)set_domain:(int64_t)a3
{
  self->__domain = a3;
}

- (NSString)_id
{
  return self->__id;
}

- (void)set_id:(id)a3
{
  objc_storeStrong((id *)&self->__id, a3);
}

- (int)_keyColumn
{
  return self->__keyColumn;
}

- (void)set_keyColumn:(int)a3
{
  self->__keyColumn = a3;
}

- (int)_listColumn
{
  return self->__listColumn;
}

- (void)set_listColumn:(int)a3
{
  self->__listColumn = a3;
}

- (char)_saveAsType
{
  return self->__saveAsType;
}

- (void)set_saveAsType:(char)a3
{
  self->__saveAsType = a3;
}

- (NSString)_statement
{
  return self->__statement;
}

- (void)set_statement:(id)a3
{
  objc_storeStrong((id *)&self->__statement, a3);
}

- (int)_valueColumn
{
  return self->__valueColumn;
}

- (void)set_valueColumn:(int)a3
{
  self->__valueColumn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__statement, 0);
  objc_storeStrong((id *)&self->__id, 0);
  objc_storeStrong((id *)&self->__columnSpecs, 0);
}

@end
