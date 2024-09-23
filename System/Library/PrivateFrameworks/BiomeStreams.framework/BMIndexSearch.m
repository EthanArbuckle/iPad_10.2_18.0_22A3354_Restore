@implementation BMIndexSearch

- (BMIndexSearch)initWithIndex:(id)a3 startFields:(id)a4 endFields:(id)a5 database:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  BMIndexSearch *v16;
  BMIndexSearch *v17;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v12, "count");
  if (v15 != objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMIndexSearch.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startFields.count == endFields.count"));

  }
  v21.receiver = self;
  v21.super_class = (Class)BMIndexSearch;
  v16 = -[BMIndexSearch init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_index, a3);
    objc_storeStrong((id *)&v17->_startFields, a4);
    objc_storeStrong((id *)&v17->_endFields, a5);
    objc_storeStrong((id *)&v17->_database, a6);
  }

  return v17;
}

- (id)_buildSearchQueryWithStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 reversed:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  __CFString *v71;
  BMIndexSearch *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v6 = a6;
  v85 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_opt_new();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v73 = self;
  -[BMIndex schema](self->_index, "schema");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "columns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v80 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("\"%@\"), v19);
        objc_msgSend(v10, "addObject:", v20);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    }
    while (v14);
  }

  v74 = (void *)objc_opt_new();
  if (-[NSArray count](v73->_startFields, "count"))
  {
    v21 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v73->_startFields, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        -[BMIndex schema](v73->_index, "schema");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "columns");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("\"%@\" >= ?"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v29);

      }
      -[NSArray objectAtIndexedSubscript:](v73->_endFields, "objectAtIndexedSubscript:", v21);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 != v31)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        -[BMIndex schema](v73->_index, "schema");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "columns");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", v21);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("\"%@\" <= ?"), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v37);

      }
      ++v21;
    }
    while (-[NSArray count](v73->_startFields, "count") > v21);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "timeIntervalSinceReferenceDate");
  v40 = v39;

  if (v40 != a3)
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    BMEventTimestampSQLColumn();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("\"%@\" >= ?"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObject:", v44);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "timeIntervalSinceReferenceDate");
  v47 = v46;

  if (v47 != a4)
  {
    v48 = (void *)MEMORY[0x1E0CB3940];
    BMEventTimestampSQLColumn();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", CFSTR("\"%@\" <= ?"), v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObject:", v51);

  }
  if (objc_msgSend(v74, "count"))
  {
    v52 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v74, "componentsJoinedByString:", CFSTR(" AND "));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringWithFormat:", CFSTR("WHERE %@"), v53);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v71 = &stru_1E2672FA8;
  }
  v54 = (void *)objc_opt_new();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[BMIndex fields](v73->_index, "fields");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v57; ++j)
      {
        if (*(_QWORD *)v76 != v58)
          objc_enumerationMutation(v55);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "name");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v6)
        {
          objc_msgSend(v60, "stringByAppendingString:", CFSTR(" DESC"));
          v62 = objc_claimAutoreleasedReturnValue();

          v61 = (void *)v62;
        }
        objc_msgSend(v54, "addObject:", v61);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    }
    while (v57);
  }

  v63 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIndex schema](v73->_index, "schema");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "tableName");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "componentsJoinedByString:", CFSTR(","));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ %@ ORDER BY %@"), v64, v66, v71, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 != -1)
  {
    objc_msgSend(v68, "stringByAppendingString:", CFSTR(" LIMIT ?"));
    v69 = objc_claimAutoreleasedReturnValue();

    v68 = (void *)v69;
  }

  return v68;
}

- (id)performSearchWithError:(id *)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  -[BMIndexSearch performSearchWithStartTime:endTime:maxEvents:reversed:error:](self, "performSearchWithStartTime:endTime:maxEvents:reversed:error:", -1, 0, a3, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performSearchWithStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 reversed:(BOOL)a6 error:(id *)a7
{
  void *v12;
  NSObject *v13;
  sqlite3 *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  sqlite3 *v19;
  id v20;
  BMIndexRowEnumerator *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  sqlite3_stmt *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  id *v49;
  id v50;
  int v51;
  int v52;
  sqlite3_stmt *v53;
  _QWORD *v54;
  int v55;
  void *v56;
  sqlite3 *v57;
  id v58;
  BMIndexRowEnumerator *v59;
  sqlite3 *v60;
  void *v62;
  uint64_t v63;
  objc_class *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  sqlite3_stmt *v69;
  sqlite3_stmt *ppStmt;
  uint64_t v71;
  void *v72;
  _QWORD v73[3];

  v73[2] = *MEMORY[0x1E0C80C00];
  -[BMIndexSearch _buildSearchQueryWithStartTime:endTime:maxEvents:reversed:](self, "_buildSearchQueryWithStartTime:endTime:maxEvents:reversed:", a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BMIndexSearch performSearchWithStartTime:endTime:maxEvents:reversed:error:].cold.1((uint64_t)v12, v13);

  ppStmt = 0;
  v14 = -[BMSQLDatabase db](self->_database, "db");
  v15 = objc_retainAutorelease(v12);
  v16 = sqlite3_prepare_v2(v14, (const char *)objc_msgSend(v15, "UTF8String"), -1, &ppStmt, 0);
  if ((_DWORD)v16)
  {
    if (a7)
    {
      v17 = v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to prepare statement for index search query: %@"), v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BMSQLDatabase db](self->_database, "db");
      v20 = objc_retainAutorelease(v18);
      BMSQLDatabaseError(v17, v19, (const char *)objc_msgSend(v20, "UTF8String"));
      v21 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    v21 = 0;
    goto LABEL_43;
  }
  v20 = (id)objc_opt_new();
  if (-[NSArray count](self->_startFields, "count"))
  {
    v22 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_startFields, "objectAtIndexedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 != v24)
      {
        -[NSArray objectAtIndexedSubscript:](self->_startFields, "objectAtIndexedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v25);

      }
      -[NSArray objectAtIndexedSubscript:](self->_endFields, "objectAtIndexedSubscript:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26 != v27)
      {
        -[NSArray objectAtIndexedSubscript:](self->_endFields, "objectAtIndexedSubscript:", v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v28);

      }
      ++v22;
    }
    while (-[NSArray count](self->_startFields, "count") > v22);
  }
  v29 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  v32 = v31;

  if (v32 != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v33);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSinceReferenceDate");
  v36 = v35;

  if (v36 != a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v37);

  }
  if (a5 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v38);

  }
  if (!objc_msgSend(v20, "count"))
  {
LABEL_40:
    v59 = [BMIndexRowEnumerator alloc];
    v60 = -[BMSQLDatabase db](self->_database, "db");
    v21 = -[BMIndexRowEnumerator initWithDatabase:statement:index:](v59, "initWithDatabase:statement:index:", v60, ppStmt, self->_index);
    goto LABEL_41;
  }
  v39 = 0;
  v40 = 0x1E0CB3000uLL;
  while (1)
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = ppStmt;
      objc_msgSend(v41, "doubleValue");
LABEL_25:
      v44 = sqlite3_bind_double(v42, v39 + 1, v43);
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = ppStmt;
      objc_msgSend(v41, "timeIntervalSince1970");
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = sqlite3_bind_text(ppStmt, v39 + 1, (const char *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_26:
      v45 = v44;
      if ((_DWORD)v44)
        goto LABEL_36;
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = ppStmt;
      v46 = objc_retainAutorelease(v41);
      v47 = objc_msgSend(v46, "bytes");
      v48 = v29;
      v49 = a7;
      v50 = v15;
      v51 = objc_msgSend(v46, "length");

      v52 = v39 + 1;
      v53 = v69;
      v54 = (_QWORD *)v47;
      v40 = 0x1E0CB3000;
      v55 = v51;
      v15 = v50;
      a7 = v49;
      v29 = v48;
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v73[0] = 0;
    v73[1] = 0;
    objc_msgSend(v41, "getUUIDBytes:", v73);
    v53 = ppStmt;
    v52 = v39 + 1;
    v54 = v73;
    v55 = 16;
LABEL_35:
    v45 = sqlite3_bind_blob(v53, v52, v54, v55, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((_DWORD)v45)
    {
LABEL_36:
      if (!a7)
        goto LABEL_39;
      objc_msgSend(*(id *)(v40 + 2368), "stringWithFormat:", CFSTR("Failed to bind value %@ at index: %d"), v41, v39 + 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[BMSQLDatabase db](self->_database, "db");
      v58 = objc_retainAutorelease(v56);
      BMSQLDatabaseError(v45, v57, (const char *)objc_msgSend(v58, "UTF8String"));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_27:

    if (objc_msgSend(v20, "count") <= (unint64_t)++v39)
      goto LABEL_40;
  }
  if (a7)
  {
    v62 = *(void **)(v40 + 2368);
    v63 = v39 + 1;
    v64 = (objc_class *)objc_opt_class();
    NSStringFromClass(v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stringWithFormat:", CFSTR("Failed to bind value %@ at index: %d; %@ is not a valid sqlite type"),
      v41,
      v63,
      v65);
    v58 = (id)objc_claimAutoreleasedReturnValue();

    v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v71 = *MEMORY[0x1E0CB2D50];
    v67 = (void *)objc_msgSend(v58, "copy");
    v72 = v67;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *a7 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), -1, v68);

LABEL_38:
  }
LABEL_39:

  v21 = 0;
LABEL_41:

LABEL_43:
  return v21;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> index: %@, startFields: %@, endFields: %@"), objc_opt_class(), self, self->_index, self->_startFields, self->_endFields);
}

- (BMIndex)index
{
  return self->_index;
}

- (NSArray)startFields
{
  return self->_startFields;
}

- (NSArray)endFields
{
  return self->_endFields;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_endFields, 0);
  objc_storeStrong((id *)&self->_startFields, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

- (void)performSearchWithStartTime:(uint64_t)a1 endTime:(NSObject *)a2 maxEvents:reversed:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "Performing index search with query: %@", (uint8_t *)&v2, 0xCu);
}

@end
