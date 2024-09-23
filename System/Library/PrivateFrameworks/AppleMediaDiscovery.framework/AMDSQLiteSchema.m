@implementation AMDSQLiteSchema

- (id)addTable:(id)a3 withSchema:(id)a4 error:(id *)a5
{
  AMDSQLiteTableSchema *v5;
  id v7;
  NSDictionary *v8;
  id v9;
  NSDictionary *v10;
  id v13;
  id v14;
  int v15;
  id v16[2];
  id v17;
  id location[2];
  AMDSQLiteSchema *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16[1] = a5;
  v5 = [AMDSQLiteTableSchema alloc];
  v16[0] = -[AMDSQLiteTableSchema initWithDict:withName:error:](v5, "initWithDict:withName:error:", v17, location[0], a5);
  if (*a5)
  {
    v20 = 0;
    v15 = 1;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    v8 = -[AMDSQLiteSchema tables](v19, "tables");
    v14 = (id)objc_msgSend(v7, "initWithDictionary:");

    objc_msgSend(v14, "setObject:forKey:", v16[0], location[0]);
    -[AMDSQLiteSchema setTables:](v19, "setTables:", v14);
    v9 = objc_alloc(MEMORY[0x1E0C99E08]);
    v10 = -[AMDSQLiteSchema streamToTableMap](v19, "streamToTableMap");
    v13 = (id)objc_msgSend(v9, "initWithDictionary:");

    objc_msgSend(v13, "setObject:forKey:", location[0], location[0]);
    -[AMDSQLiteSchema setStreamToTableMap:](v19, "setStreamToTableMap:", v13);
    v21 = CFSTR("added_table");
    v22[0] = location[0];
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (id)addIndices:(id)a3 error:(id *)a4
{
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
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id obj;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  NSDictionary *v29;
  NSObject *log;
  os_log_type_t v31;
  NSDictionary *v32;
  unint64_t v33;
  NSDictionary *v35;
  id v36;
  _QWORD __b[9];
  id v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  id v43;
  os_log_type_t type;
  os_log_t oslog;
  id v46;
  id v47;
  id v48;
  id v49;
  int v50;
  id v51;
  id v52;
  unsigned int i;
  unsigned int v54;
  id v55;
  id *v56;
  id location[2];
  AMDSQLiteSchema *v58;
  id v59;
  const __CFString *v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _BYTE v64[128];
  uint8_t v65[32];
  uint8_t v66[24];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = a4;
  v35 = -[AMDSQLiteSchema indices](v58, "indices");
  v55 = (id)-[NSDictionary mutableCopy](v35, "mutableCopy");

  v54 = 0;
  for (i = 0; ; ++i)
  {
    v33 = i;
    if (v33 >= objc_msgSend(location[0], "count"))
      break;
    v52 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = v52;
      v5 = (id)objc_msgSend(v49, "objectForKey:", CFSTR("indexName"));
      v6 = v52;
      v52 = v5;

      if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v47 = v52;
        v32 = -[AMDSQLiteSchema indices](v58, "indices");
        v46 = -[NSDictionary objectForKey:](v32, "objectForKey:", v47);

        if (v46)
        {
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          type = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            log = oslog;
            v31 = type;
            __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v47);
            _os_log_impl(&dword_1DC678000, log, v31, "SQLITE Index '%@' already exists", v66, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v50 = 4;
        }
        else
        {
          v8 = (id)objc_msgSend(v49, "objectForKey:", 0x1EA4BF808);
          v9 = v52;
          v52 = v8;

          if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v42 = v52;
            v29 = -[AMDSQLiteSchema tables](v58, "tables");
            v11 = -[NSDictionary objectForKey:](v29, "objectForKey:", v42);
            v12 = v46;
            v46 = v11;

            if (v46)
            {
              v13 = (id)objc_msgSend(v49, "objectForKey:", AMD_SQLITE_COLUMNS);
              v14 = v52;
              v52 = v13;

              if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v52, "count"))
              {
                v38 = v52;
                memset(__b, 0, 0x40uLL);
                obj = v38;
                v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
                if (v26)
                {
                  v22 = *(_QWORD *)__b[2];
                  v23 = 0;
                  v24 = v26;
                  while (1)
                  {
                    v21 = v23;
                    if (*(_QWORD *)__b[2] != v22)
                      objc_enumerationMutation(obj);
                    __b[8] = *(_QWORD *)(__b[1] + 8 * v23);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      break;
                    ++v23;
                    if (v21 + 1 >= v24)
                    {
                      v23 = 0;
                      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
                      if (!v24)
                        goto LABEL_31;
                    }
                  }
                  v36 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Column name not string in slot %u"), i);
                  v16 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v36);
                  *v56 = v16;
                  v59 = 0;
                  v50 = 1;
                  objc_storeStrong(&v36, 0);
                }
                else
                {
LABEL_31:
                  v50 = 0;
                }

                if (!v50)
                {
                  v19 = v55;
                  v62[0] = 0x1EA4BF808;
                  v63[0] = v42;
                  v62[1] = AMD_SQLITE_COLUMNS;
                  v63[1] = v38;
                  v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
                  objc_msgSend(v19, "setObject:forKey:");

                  ++v54;
                  v50 = 0;
                }
                objc_storeStrong(&v38, 0);
              }
              else
              {
                v39 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Bad or missing columns info in slot %u"), i);
                v15 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v39);
                *v56 = v15;
                v59 = 0;
                v50 = 1;
                objc_storeStrong(&v39, 0);
              }
            }
            else
            {
              v41 = (os_log_t)MEMORY[0x1E0C81028];
              v40 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                v27 = v41;
                v28 = v40;
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, (uint64_t)v42, (uint64_t)v47);
                _os_log_impl(&dword_1DC678000, v27, v28, "SQLITE No table '%@' for index '%@'", v65, 0x16u);
              }
              objc_storeStrong((id *)&v41, 0);
              v50 = 4;
            }
            objc_storeStrong(&v42, 0);
          }
          else
          {
            v43 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Bad or missing index table name in slot %u"), i);
            v10 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v43);
            *v56 = v10;
            v59 = 0;
            v50 = 1;
            objc_storeStrong(&v43, 0);
          }
        }
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
      }
      else
      {
        v48 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Bad or missing index name in slot %u"), i);
        v7 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v48);
        *v56 = v7;
        v59 = 0;
        v50 = 1;
        objc_storeStrong(&v48, 0);
      }
      objc_storeStrong(&v49, 0);
    }
    else
    {
      v51 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Bad index info in slot %u"), i);
      v4 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v51);
      *v56 = v4;
      v59 = 0;
      v50 = 1;
      objc_storeStrong(&v51, 0);
    }
    objc_storeStrong(&v52, 0);
    if (v50 && v50 != 4)
      goto LABEL_42;
  }
  -[AMDSQLiteSchema setIndices:](v58, "setIndices:", v55);
  v60 = CFSTR("added");
  v18 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v54);
  v61 = v18;
  v59 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);

  v50 = 1;
LABEL_42:
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v59;
}

- (id)getCreateTableStatementFor:(id)a3
{
  NSDictionary *v4;
  id v5;
  id location[2];
  AMDSQLiteSchema *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AMDSQLiteSchema tables](v7, "tables");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", location[0]);

  if (v5)
    v8 = (id)objc_msgSend(v5, "getCreateTableStatement");
  else
    v8 = 0;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)getIndices
{
  return -[AMDSQLiteSchema indices](self, "indices", a2, self);
}

- (id)getInsertStatementFor:(id)a3 hasColumns:(id)a4 requiresColumns:(id *)a5
{
  id v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  *a5 = (id)objc_msgSend(location[0], "getRequiredColumns");
  v8 = (id)objc_msgSend(location[0], "getInsertStatement:", v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)getName
{
  return -[AMDSQLiteSchema name](self, "name", a2, self);
}

- (id)getSchemaDict
{
  return -[AMDSQLiteSchema schemaDict](self, "schemaDict", a2, self);
}

- (id)getSchemaForTable:(id)a3
{
  NSDictionary *v4;
  id v5;
  id location[2];
  AMDSQLiteSchema *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AMDSQLiteSchema tables](v7, "tables");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (id)getTableForStream:(id)a3
{
  NSDictionary *v4;
  id v5;
  id location[2];
  AMDSQLiteSchema *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AMDSQLiteSchema streamToTableMap](v7, "streamToTableMap");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (id)getStreamToTableMap
{
  return -[AMDSQLiteSchema streamToTableMap](self, "streamToTableMap", a2, self);
}

- (id)getTables
{
  return -[AMDSQLiteSchema tables](self, "tables", a2, self);
}

- (id)getVersion
{
  return -[AMDSQLiteSchema version](self, "version", a2, self);
}

- (id)getVersionNumber
{
  return -[AMDSQLiteSchema versionNumber](self, "versionNumber", a2, self);
}

- (AMDSQLiteSchema)initWithDict:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
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
  id obj;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;
  id v38;
  BOOL v39;
  id v40;
  id v42;
  os_log_t v43;
  id v44;
  id v45;
  os_log_type_t v46;
  os_log_t v47;
  id v48;
  uint8_t v49[15];
  os_log_type_t v50;
  os_log_t oslog;
  _QWORD v52[8];
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD __b[8];
  id v64;
  id v65;
  id v66;
  id v67;
  int v68;
  os_log_type_t type;
  id v70;
  objc_super v71;
  id *v72;
  id location[2];
  id v74;
  AMDSQLiteSchema *v75;
  uint8_t v76[64];
  uint8_t v77[16];
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[24];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = a4;
  v4 = v74;
  v74 = 0;
  v71.receiver = v4;
  v71.super_class = (Class)AMDSQLiteSchema;
  v74 = -[AMDSQLiteSchema init](&v71, sel_init);
  objc_storeStrong(&v74, v74);
  objc_msgSend(v74, "setSchemaDict:", location[0]);
  v42 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_SCHEMA_NAME);
  objc_msgSend(v74, "setName:");

  v70 = MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEBUG))
  {
    v40 = (id)objc_msgSend(v74, "name");
    __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v40);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v70, type, "SQLITE Preparing schema '%@'", v80, 0xCu);

  }
  objc_storeStrong(&v70, 0);
  v38 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_SCHEMA_VERSION);
  objc_msgSend(v74, "setVersion:");

  v5 = (id)objc_msgSend(v74, "version");
  v39 = v5 != 0;

  if (v39)
  {
    v36 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v35 = (id)objc_msgSend(v74, "version");
    v34 = (id)objc_msgSend(v36, "numberFromString:");
    objc_msgSend(v74, "setVersionNumber:");

    v6 = (id)objc_msgSend(v74, "versionNumber");
    v37 = v6 != 0;

    if (!v37)
    {
      *v72 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Bad schema version"));
      v75 = 0;
      v68 = 1;
      goto LABEL_57;
    }
    objc_msgSend(v74, "setTables:", MEMORY[0x1E0C9AA70]);
    v67 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_SCHEMA_TABLES);
    if (!v67 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      *v72 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Bad or missing table specs"));
      v75 = 0;
      v68 = 1;
LABEL_56:
      objc_storeStrong(&v67, 0);
      goto LABEL_57;
    }
    v66 = v67;
    v65 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v66, "count"));
    v8 = v65;
    v65 = v7;

    memset(__b, 0, sizeof(__b));
    obj = v66;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v79, 16);
    if (v33)
    {
      v29 = *(_QWORD *)__b[2];
      v30 = 0;
      v31 = v33;
      while (1)
      {
        v28 = v30;
        if (*(_QWORD *)__b[2] != v29)
          objc_enumerationMutation(obj);
        v64 = *(id *)(__b[1] + 8 * v30);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v61 = v64;
        v60 = (id)objc_msgSend(v66, "objectForKey:", v61);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v58 = v60;
          v57 = -[AMDSQLiteTableSchema initWithDict:withName:error:]([AMDSQLiteTableSchema alloc], "initWithDict:withName:error:", v58, v61, v72);
          if (v57)
          {
            objc_msgSend(v65, "setObject:forKey:", v57, v61);
            v68 = 0;
          }
          else
          {
            v75 = 0;
            v68 = 1;
          }
          objc_storeStrong(&v57, 0);
          objc_storeStrong(&v58, 0);
        }
        else
        {
          v59 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Table data for '%@' not a dict"), v61);
          *v72 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v59);
          v75 = 0;
          v68 = 1;
          objc_storeStrong(&v59, 0);
        }
        objc_storeStrong(&v60, 0);
        objc_storeStrong(&v61, 0);
        if (v68)
          goto LABEL_26;
        ++v30;
        if (v28 + 1 >= v31)
        {
          v30 = 0;
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v79, 16);
          if (!v31)
            goto LABEL_25;
        }
      }
      v62 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad table data"));
      *v72 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v62);
      v75 = 0;
      v68 = 1;
      objc_storeStrong(&v62, 0);
    }
    else
    {
LABEL_25:
      v68 = 0;
    }
LABEL_26:

    if (v68)
    {
LABEL_55:
      objc_storeStrong(&v65, 0);
      objc_storeStrong(&v66, 0);
      goto LABEL_56;
    }
    objc_msgSend(v74, "setTables:", v65);
    objc_msgSend(v74, "setStreamToTableMap:", MEMORY[0x1E0C9AA70]);
    v56 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_STREAM_TO_TABLE_MAP);
    if (v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v55 = v56;
      v54 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v55, "count"));
      v10 = v54;
      v54 = v9;

      memset(v52, 0, sizeof(v52));
      v26 = v55;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v52, v78, 16);
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
          v53 = *(_QWORD *)(v52[1] + 8 * v24);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = (id)objc_msgSend(v55, "objectForKey:", v53);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v54, "setObject:forKey:", v48, v53);
              v68 = 0;
            }
            else
            {
              v47 = (os_log_t)MEMORY[0x1E0C81028];
              v46 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                v19 = v47;
                __os_log_helper_16_2_1_8_64((uint64_t)v77, v53);
                _os_log_error_impl(&dword_1DC678000, v19, v46, "SQLITE Table name for stream '%@' not a string", v77, 0xCu);
              }
              objc_storeStrong((id *)&v47, 0);
              v68 = 5;
            }
            objc_storeStrong(&v48, 0);
          }
          else
          {
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v50 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v20 = oslog;
              v21 = v50;
              __os_log_helper_16_0_0(v49);
              _os_log_error_impl(&dword_1DC678000, v20, v21, "SQLITE Bad stream-to-table mapping data", v49, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          ++v24;
          if (v22 + 1 >= v25)
          {
            v24 = 0;
            v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v52, v78, 16);
            if (!v25)
              break;
          }
        }
      }

      objc_msgSend(v74, "setStreamToTableMap:", v54);
      objc_storeStrong(&v54, 0);
      objc_storeStrong(&v55, 0);
    }
    objc_msgSend(v74, "setIndices:", MEMORY[0x1E0C9AA70]);
    v45 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_SCHEMA_INDICES);
    v44 = 0;
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *v72 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Bad or missing table specs"));
        v75 = 0;
        v68 = 1;
LABEL_54:
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v56, 0);
        goto LABEL_55;
      }
      v11 = (id)objc_msgSend(v74, "addIndices:error:", v45, v72);
      v12 = v44;
      v44 = v11;

      if (!v44)
      {
        v75 = 0;
        v68 = 1;
        goto LABEL_54;
      }
    }
    v43 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v18 = (id)objc_msgSend(v74, "name");
      v17 = (id)objc_msgSend(v74, "version");
      v16 = (id)objc_msgSend(v74, "tables");
      v14 = objc_msgSend(v16, "count");
      v15 = (id)objc_msgSend(v74, "streamToTableMap");
      __os_log_helper_16_2_5_8_64_8_64_8_0_8_0_8_64((uint64_t)v76, (uint64_t)v18, (uint64_t)v17, v14, objc_msgSend(v15, "count"), (uint64_t)v44);
      _os_log_debug_impl(&dword_1DC678000, v43, OS_LOG_TYPE_DEBUG, "SQLITE Prepared schema '%@', version '%@', table count: %lu, map count: %lu, indices: %@", v76, 0x34u);

    }
    objc_storeStrong((id *)&v43, 0);
    v75 = (AMDSQLiteSchema *)v74;
    v68 = 1;
    goto LABEL_54;
  }
  *v72 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("No version in schema"));
  v75 = 0;
  v68 = 1;
LABEL_57:
  objc_storeStrong(location, 0);
  objc_storeStrong(&v74, 0);
  return v75;
}

+ (id)fetchColumnSpecsForTable:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD __b[8];
  uint64_t v16;
  id v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id location[3];
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if (objc_msgSend(v20, "getDb"))
  {
    v12 = (id)objc_msgSend(v20, "getDataSchema");
    v18 = (id)objc_msgSend(v12, "getSchemaForTable:", location[0]);

    if (v18)
    {
      v17 = (id)objc_msgSend(v18, "getColumns");
      memset(__b, 0, sizeof(__b));
      obj = v17;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
      if (v11)
      {
        v7 = *(_QWORD *)__b[2];
        v8 = 0;
        v9 = v11;
        while (1)
        {
          v6 = v8;
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(__b[1] + 8 * v8);
          v14 = (id)objc_msgSend(v17, "objectForKey:", v16);
          v26 = v16;
          v24 = AMD_SQLITE_TYPE;
          v5 = (id)objc_msgSend(v14, "getTypeString");
          v25 = v5;
          v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24);
          v27 = v4;
          v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);

          objc_msgSend(v21, "addObject:", v13);
          objc_storeStrong(&v13, 0);
          objc_storeStrong(&v14, 0);
          ++v8;
          if (v6 + 1 >= v9)
          {
            v8 = 0;
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
            if (!v9)
              break;
          }
        }
      }

      v23 = v21;
      v19 = 1;
      objc_storeStrong(&v17, 0);
    }
    else
    {
      v23 = MEMORY[0x1E0C9AA60];
      v19 = 1;
    }
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v23 = MEMORY[0x1E0C9AA60];
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v23;
}

- (NSDictionary)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
  objc_storeStrong((id *)&self->_indices, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)schemaDict
{
  return self->_schemaDict;
}

- (void)setSchemaDict:(id)a3
{
  objc_storeStrong((id *)&self->_schemaDict, a3);
}

- (NSDictionary)streamToTableMap
{
  return self->_streamToTableMap;
}

- (void)setStreamToTableMap:(id)a3
{
  objc_storeStrong((id *)&self->_streamToTableMap, a3);
}

- (NSDictionary)tables
{
  return self->_tables;
}

- (void)setTables:(id)a3
{
  objc_storeStrong((id *)&self->_tables, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSNumber)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_versionNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_tables, 0);
  objc_storeStrong((id *)&self->_streamToTableMap, 0);
  objc_storeStrong((id *)&self->_schemaDict, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_indices, 0);
}

@end
