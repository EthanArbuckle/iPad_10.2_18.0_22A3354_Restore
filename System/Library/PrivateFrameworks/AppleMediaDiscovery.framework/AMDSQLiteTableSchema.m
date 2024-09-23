@implementation AMDSQLiteTableSchema

- (id)getColumns
{
  return -[AMDSQLiteTableSchema columns](self, "columns", a2, self);
}

- (id)getCreateTableStatement
{
  void *v3;
  id v4;
  id v5;
  NSString *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSArray *obj;
  uint64_t v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  id v26[2];
  AMDSQLiteTableSchema *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26[1] = (id)a2;
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = -[AMDSQLiteTableSchema columns](v27, "columns");
  v26[0] = (id)objc_msgSend(v17, "initWithCapacity:", -[NSDictionary count](v18, "count"));

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  v19 = -[AMDSQLiteTableSchema columns](v27, "columns");
  obj = -[NSDictionary allValues](v19, "allValues");

  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
  if (v21)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v21;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(obj);
      v24 = *(id *)(__b[1] + 8 * v15);
      v11 = v26[0];
      v12 = (id)objc_msgSend(v24, "getCreateStatementPart");
      objc_msgSend(v11, "addObject:");

      if ((objc_msgSend(v24, "unique") & 1) != 0)
      {
        v9 = v25;
        v10 = (id)objc_msgSend(v24, "name");
        objc_msgSend(v9, "addObject:");

      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (!v16)
          break;
      }
    }
  }

  if (objc_msgSend(v25, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (id)objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
    v22 = (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("UNIQUE(%@)"), v8);

    objc_msgSend(v26[0], "addObject:", v22);
    objc_storeStrong(&v22, 0);
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[AMDSQLiteTableSchema name](v27, "name");
  v4 = (id)objc_msgSend(v26[0], "componentsJoinedByString:", CFSTR(", "));
  v5 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@)"), v6, v4);

  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  return v5;
}

- (id)getInsertStatement:(id)a3
{
  const __CFString *v3;
  const __CFString *v5;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  NSString *v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSDictionary *v16;
  NSArray *obj;
  uint64_t v18;
  id v19;
  _QWORD __b[8];
  uint64_t v21;
  char v22;
  id v23;
  NSArray *v24;
  id location[2];
  AMDSQLiteTableSchema *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = -[AMDSQLiteTableSchema columns](v26, "columns");
  v24 = -[NSDictionary allKeys](v16, "allKeys");

  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v24, "count"));
  v22 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v24;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
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
      v21 = *(_QWORD *)(__b[1] + 8 * v14);
      v11 = -[AMDSQLiteTableSchema columns](v26, "columns");
      v19 = -[NSDictionary objectForKey:](v11, "objectForKey:", v21);

      objc_msgSend(location[0], "addObject:", v19);
      if ((objc_msgSend(v19, "unique") & 1) != 0)
        v22 = 1;
      objc_msgSend(v23, "addObject:", CFSTR("?"));
      objc_storeStrong(&v19, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v15)
          break;
      }
    }
  }

  v6 = (void *)MEMORY[0x1E0CB3940];
  v3 = CFSTR("INSERT OR REPLACE INTO %@(%@) VALUES(%@)");
  if ((v22 & 1) == 0)
    v3 = CFSTR("INSERT INTO %@(%@) VALUES(%@)");
  v5 = v3;
  v10 = -[AMDSQLiteTableSchema name](v26, "name");
  v9 = -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:");
  v7 = (id)objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
  v8 = (id)objc_msgSend(v6, "stringWithFormat:", v5, v10, v9, v7);

  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)getRequiredColumns
{
  return -[AMDSQLiteTableSchema requiredColumns](self, "requiredColumns", a2, self);
}

- (id)getSpecForColumn:(id)a3
{
  NSDictionary *v4;
  id v5;
  id location[2];
  AMDSQLiteTableSchema *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AMDSQLiteTableSchema columns](v7, "columns");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (AMDSQLiteTableSchema)initWithDict:(id)a3 withName:(id)a4 error:(id *)a5
{
  id v5;
  AMDSQLiteColumnSpec *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  os_log_t oslog;
  id v17;
  id v18;
  id v19;
  _QWORD __b[8];
  id v21;
  id v22;
  id v23;
  int v24;
  unsigned int v25;
  os_log_type_t type;
  id v27;
  objc_super v28;
  id *v29;
  id v30;
  id location[2];
  id v32;
  AMDSQLiteTableSchema *v33;
  uint8_t v34[32];
  _BYTE v35[128];
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = a5;
  v5 = v32;
  v32 = 0;
  v28.receiver = v5;
  v28.super_class = (Class)AMDSQLiteTableSchema;
  v32 = -[AMDSQLiteTableSchema init](&v28, sel_init);
  objc_storeStrong(&v32, v32);
  v27 = MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v30);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v27, type, "SQLITE Loading schema for table '%@'", v36, 0xCu);
  }
  objc_storeStrong(&v27, 0);
  objc_msgSend(v32, "setName:", v30);
  v25 = objc_msgSend(location[0], "count");
  if (v25)
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v25);
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(location[0], "count"));
    memset(__b, 0, sizeof(__b));
    v12 = location[0];
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
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
        v21 = *(id *)(__b[1] + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v19 = v21;
        v18 = (id)objc_msgSend(location[0], "objectForKey:", v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = [AMDSQLiteColumnSpec alloc];
          v17 = -[AMDSQLiteColumnSpec initWithDict:withName:error:](v6, "initWithDict:withName:error:", v18, v19, v29);
          if (v17)
          {
            if ((objc_msgSend(v17, "isRequired") & 1) != 0)
              objc_msgSend(v22, "addObject:", v19);
            objc_msgSend(v23, "setObject:forKey:", v17, v19);
            v24 = 0;
          }
          else
          {
            v33 = 0;
            v24 = 1;
          }
          objc_storeStrong(&v17, 0);
        }
        else
        {
          *v29 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Column spec not a dict"));
          v33 = 0;
          v24 = 1;
        }
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        if (v24)
          goto LABEL_23;
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
          if (!v11)
            goto LABEL_22;
        }
      }
      *v29 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Column name not string"));
      v33 = 0;
      v24 = 1;
    }
    else
    {
LABEL_22:
      v24 = 0;
    }
LABEL_23:

    if (!v24)
    {
      objc_msgSend(v32, "setColumns:", v23);
      objc_msgSend(v32, "setRequiredColumns:", v22);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_64_4_0_4_0((uint64_t)v34, (uint64_t)v30, v25, objc_msgSend(v22, "count"));
        _os_log_debug_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Loaded schema for table '%@' (%u columns, %u required)", v34, 0x18u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v33 = (AMDSQLiteTableSchema *)v32;
      v24 = 1;
    }
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    *v29 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("No columns in table"));
    v33 = 0;
    v24 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v32, 0);
  return v33;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (NSSet)requiredColumns
{
  return self->_requiredColumns;
}

- (void)setRequiredColumns:(id)a3
{
  objc_storeStrong((id *)&self->_requiredColumns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredColumns, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
