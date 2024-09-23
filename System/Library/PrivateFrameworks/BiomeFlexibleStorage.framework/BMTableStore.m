@implementation BMTableStore

- (BMTableStore)initWithURL:(id)a3
{
  id v5;
  BMTableStore *v6;
  uint64_t v7;
  _bmFMDatabase *db;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMTableStore;
  v6 = -[BMTableStore init](&v10, sel_init);
  if (v6)
  {
    +[_bmFMDatabase databaseWithURL:](_bmFMDatabase, "databaseWithURL:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    db = v6->_db;
    v6->_db = (_bmFMDatabase *)v7;

    objc_storeStrong((id *)&v6->_dbURL, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)openDB
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  char v6;
  NSObject *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BMTableStore db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BMTableStore db](self, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "open");

    if ((v6 & 1) != 0)
    {
      os_unfair_lock_unlock(p_lock);
      return 1;
    }
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMTableStore openDB].cold.1(self, v8);

  }
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)closeDB
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  char v6;
  NSArray *classArray;
  NSObject *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BMTableStore db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BMTableStore db](self, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "close");

    if ((v6 & 1) != 0)
    {
      os_unfair_lock_unlock(p_lock);
      classArray = self->_classArray;
      self->_classArray = 0;

      return 1;
    }
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMTableStore closeDB].cold.1(self, v9);

  }
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)addTable:(id)a3 named:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "rows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "columnCount"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v10, "valueAtIdx:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_opt_class();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      objc_msgSend(v11, "addObject:", v14);
      ++v12;
    }
    while (v12 < objc_msgSend(v10, "columnCount"));
  }
  v15 = -[BMTableStore setupClassArray:table:named:error:](self, "setupClassArray:table:named:error:", v11, v7, v8, a5);

  return v15;
}

- (BOOL)setupClassArray:(id)a3 table:(id)a4 named:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  os_unfair_lock_t lock;
  void *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v49 = v13;
  if (!v11 || (v14 = v13, !objc_msgSend(v11, "count")))
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0CB2D50];
    v58[0] = CFSTR("setupClassArray, classArray nil or 0 entries");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("BMFlexibleStorageTableErrorDomain"), -1, v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = objc_retainAutorelease(v18);
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BMTableStore setupClassArray:table:named:error:].cold.1();
    goto LABEL_28;
  }
  -[BMTableStore openDB](self, "openDB");
  os_unfair_lock_lock(&self->_lock);
  -[BMTableStore db](self, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    os_unfair_lock_unlock(&self->_lock);
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    v56 = CFSTR("setupClassArray, can not open database");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("BMFlexibleStorageTableErrorDomain"), -1, v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = objc_retainAutorelease(v18);
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BMTableStore setupClassArray:table:named:error:].cold.2();
LABEL_28:
    v32 = 0;
    goto LABEL_47;
  }
  lock = &self->_lock;
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\" ("), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("REPLACE INTO \"%@\" VALUES ("), v14);
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "schema");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "columnNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v11, "count");
  v50 = v21;
  if (v22 != objc_msgSend(v21, "count"))
  {
    os_unfair_lock_unlock(lock);
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v53 = *MEMORY[0x1E0CB2D50];
    v54 = CFSTR("classArray and columnNames sizes do not match");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("BMFlexibleStorageTableErrorDomain"), -1, v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = objc_retainAutorelease(v24);
    __biome_log_for_category();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BMTableStore setupClassArray:table:named:error:].cold.5();
    goto LABEL_44;
  }
  v47 = v12;
  if (!objc_msgSend(v11, "count"))
  {
    v28 = v19;
LABEL_38:
    v38 = v18;
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(");"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject stringByAppendingString:](v28, "stringByAppendingString:", CFSTR(");"));
    v19 = objc_claimAutoreleasedReturnValue();

    -[BMTableStore db](self, "db");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "executeUpdate:", v18);

    os_unfair_lock_unlock(lock);
    if ((v40 & 1) != 0)
    {
      objc_storeStrong((id *)&self->_sqlReplace, v19);
      objc_storeStrong((id *)&self->_classArray, a3);
      v32 = 1;
      v12 = v47;
      goto LABEL_46;
    }
    -[BMTableStore db](self, "db");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v47;
    if (a6)
      *a6 = objc_retainAutorelease(v24);
    __biome_log_for_category();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BMTableStore setupClassArray:table:named:error:].cold.3(self, (uint64_t)v24, v37);
LABEL_44:

    -[BMTableStore closeDB](self, "closeDB");
    goto LABEL_45;
  }
  v23 = 0;
  while (1)
  {
    objc_msgSend(v11, "objectAtIndex:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqual:", objc_opt_class()))
    {
      objc_msgSend(v50, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("\"%@\" TEXT"), v25);
      goto LABEL_11;
    }
    if (!objc_msgSend(v24, "isEqual:", objc_opt_class()))
      break;
    objc_msgSend(v50, "objectAtIndexedSubscript:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("\"%@\" REAL"), v25);
LABEL_11:
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      if (v23 == objc_msgSend(v11, "count") - 1 || (unint64_t)objc_msgSend(v11, "count") < 2)
      {
        v18 = v26;
        goto LABEL_19;
      }
      objc_msgSend(v26, "stringByAppendingString:", CFSTR(", "));
      v27 = objc_claimAutoreleasedReturnValue();
      v18 = v26;
    }
    else
    {
      objc_msgSend(v26, "stringByAppendingString:", CFSTR(" UNIQUE PRIMARY KEY"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v11, "count") < 2)
        goto LABEL_19;
      objc_msgSend(v18, "stringByAppendingString:", CFSTR(" ,"));
      v27 = objc_claimAutoreleasedReturnValue();
    }

    v18 = (void *)v27;
LABEL_19:
    -[NSObject stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("?"));
    v28 = objc_claimAutoreleasedReturnValue();

    if (v23 < objc_msgSend(v11, "count") - 1 && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      -[NSObject stringByAppendingString:](v28, "stringByAppendingString:", CFSTR(", "));
      v29 = objc_claimAutoreleasedReturnValue();

      v28 = v29;
    }

    ++v23;
    v19 = v28;
    if (v23 >= objc_msgSend(v11, "count"))
      goto LABEL_38;
  }
  os_unfair_lock_unlock(lock);
  v43 = (void *)MEMORY[0x1E0CB35C8];
  v51 = *MEMORY[0x1E0CB2D50];
  v52 = CFSTR("classArray must contain NSString or NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("BMFlexibleStorageTableErrorDomain"), -1, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    *a6 = objc_retainAutorelease(v45);
  __biome_log_for_category();
  v46 = objc_claimAutoreleasedReturnValue();
  v12 = v47;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    -[BMTableStore setupClassArray:table:named:error:].cold.4();

  -[BMTableStore closeDB](self, "closeDB");
LABEL_45:

  v32 = 0;
LABEL_46:

LABEL_47:
  return v32;
}

- (BOOL)upsertRows:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSUInteger v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  NSString *sqlReplace;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (!v6)
  {
    v18 = 1;
    goto LABEL_23;
  }
  v7 = v6;
  v38 = *(_QWORD *)v41;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v41 != v38)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      v10 = -[NSArray count](self->_classArray, "count");
      if (v10 != objc_msgSend(v9, "columnCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMTableUpsertSubscriber: input array has %lu elements and must have %lu elements"), objc_msgSend(v9, "columnCount"), -[NSArray count](self->_classArray, "count"));
        v12 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2D50];
        v47 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BMFlexibleStorageTableErrorDomain"), -1, v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (a4)
          *a4 = objc_retainAutorelease(v23);
        __biome_log_for_category();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          -[BMTableStore upsertRows:error:].cold.3();

LABEL_20:
LABEL_21:

        v18 = 0;
        goto LABEL_23;
      }
      if (-[NSArray count](self->_classArray, "count"))
      {
        v11 = 0;
        while (1)
        {
          objc_msgSend(v9, "valueAtIdx:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_classArray, "objectAtIndex:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            break;

          if (++v11 >= -[NSArray count](self->_classArray, "count"))
            goto LABEL_11;
        }
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_classArray, "objectAtIndex:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("input classes must match (index=%ld) %@ vs. %@"), v11, v20, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2D50];
        v45 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("BMFlexibleStorageTableErrorDomain"), -1, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (a4)
          *a4 = objc_retainAutorelease(v26);
        __biome_log_for_category();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          -[BMTableStore upsertRows:error:].cold.2();

        goto LABEL_20;
      }
LABEL_11:
      os_unfair_lock_lock(&self->_lock);
      -[BMTableStore db](self, "db");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sqlReplace = self->_sqlReplace;
      objc_msgSend(v9, "values");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(sqlReplace) = objc_msgSend(v15, "executeUpdate:values:error:", sqlReplace, v17, a4);

      os_unfair_lock_unlock(&self->_lock);
      if ((sqlReplace & 1) == 0)
      {
        __biome_log_for_category();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[BMTableStore upsertRows:error:].cold.1((uint64_t)a4, v12, v32, v33, v34, v35, v36, v37);
        goto LABEL_21;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    v18 = 1;
    if (v7)
      continue;
    break;
  }
LABEL_23:

  return v18;
}

- (id)selectTableNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BMSQLRow *v19;
  BMTable *v20;
  void *v21;
  NSObject *v22;
  BMTableSchema *v24;
  id v25;

  v6 = a3;
  if (-[BMTableStore openDB](self, "openDB"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[BMTableStore db](self, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getTableSchema:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    if (objc_msgSend(v8, "next"))
    {
      do
      {
        objc_msgSend(v8, "objectForColumnIndex:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
      while ((objc_msgSend(v8, "next") & 1) != 0);
    }
    if (objc_msgSend(v9, "count"))
    {
      v11 = (void *)objc_opt_new();
      v25 = v6;
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("SELECT * FROM \"%@\"), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[BMTableStore db](self, "db");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "executeQuery:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = -[BMTableSchema initWithColumnNames:]([BMTableSchema alloc], "initWithColumnNames:", v9);
      v15 = (void *)objc_opt_new();
      if (objc_msgSend(v14, "next"))
      {
        do
        {
          v16 = (void *)objc_opt_new();
          if ((int)objc_msgSend(v14, "columnCount") >= 1)
          {
            v17 = 0;
            do
            {
              objc_msgSend(v14, "objectForColumnIndex:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v18);

              v17 = (v17 + 1);
            }
            while ((int)v17 < (int)objc_msgSend(v14, "columnCount"));
          }
          v19 = -[BMSQLRow initWithValues:]([BMSQLRow alloc], "initWithValues:", v16);
          objc_msgSend(v15, "addObject:", v19);

        }
        while ((objc_msgSend(v14, "next") & 1) != 0);
      }
      v20 = -[BMTable initWithRows:schema:]([BMTable alloc], "initWithRows:schema:", v15, v24);
      os_unfair_lock_unlock(&self->_lock);
      -[BMTableStore closeDB](self, "closeDB");

      v6 = v25;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    if (a4)
    {
      -[BMTableStore db](self, "db");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BMTableStore selectTableNamed:error:].cold.1(self, v22);

    v20 = 0;
  }

  return v20;
}

- (_bmFMDatabase)db
{
  return self->_db;
}

- (NSURL)dbURL
{
  return self->_dbURL;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSArray)classArray
{
  return self->_classArray;
}

- (NSString)sqlReplace
{
  return self->_sqlReplace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlReplace, 0);
  objc_storeStrong((id *)&self->_classArray, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)openDB
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_4(&dword_1B399A000, a2, v8, "BMTableStore: Could not open database: %@ err:%@.", (uint8_t *)&v9);

}

- (void)closeDB
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_4(&dword_1B399A000, a2, v7, "BMTableUpsertSubscriber: Could not close database: %@ err:%@.", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1();
}

- (void)setupClassArray:table:named:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B399A000, v0, v1, "Invalid table setup data %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setupClassArray:table:named:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B399A000, v0, v1, "Invalid db %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setupClassArray:(NSObject *)a3 table:named:error:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dbURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_1B399A000, a3, OS_LOG_TYPE_FAULT, "Could not create table: %@ err:%@.", v6, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)setupClassArray:table:named:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B399A000, v0, v1, "classArray must contain NSString or NSNumber %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setupClassArray:table:named:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B399A000, v0, v1, "Count Mismatch Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)upsertRows:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B399A000, a2, a3, "Table Row insert error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)upsertRows:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B399A000, v0, v1, "Element Mismatch %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)upsertRows:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B399A000, v0, v1, "Count Mismatch %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)selectTableNamed:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1B399A000, a2, OS_LOG_TYPE_FAULT, "BMBiomeTableStore: unable to open database: %@", v6, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
