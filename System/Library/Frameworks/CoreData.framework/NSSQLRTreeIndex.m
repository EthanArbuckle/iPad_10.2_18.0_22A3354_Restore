@implementation NSSQLRTreeIndex

- (id)initForIndexDescription:(id)a3 sqlEntity:(id)a4
{
  _QWORD *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLRTreeIndex;
  v6 = -[NSSQLIndex initForIndexDescription:sqlEntity:](&v8, sel_initForIndexDescription_sqlEntity_);
  if (v6)
    v6[6] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_%@_%@"), objc_msgSend(a4, "name"), objc_msgSend(a3, "name"));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_tableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLRTreeIndex;
  -[NSSQLIndex dealloc](&v3, sel_dealloc);
}

- (void)generateSQLStrings
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSQLiteStatement *v18;
  NSSQLiteStatement *v19;
  uint64_t v20;
  NSSQLiteStatement *v21;
  NSSQLiteStatement *v22;
  NSSQLiteStatement *v23;
  uint64_t v24;
  NSSQLiteStatement *v25;
  NSSQLiteStatement *v26;
  NSSQLiteStatement *v27;
  uint64_t v28;
  NSSQLiteStatement *v29;
  NSSQLiteStatement *v30;
  NSSQLiteStatement *v31;
  uint64_t v32;
  NSSQLiteStatement *v33;
  NSSQLiteStatement *v34;
  SEL v35;
  SEL v36;
  SEL v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  void *context;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    context = (void *)MEMORY[0x18D76B4E4]();
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1EE23F0);
    v43 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1EE23F0);
    v45 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1EE23F0);
    v44 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1EE23F0);
    v38 = objc_msgSend((id)objc_msgSend(v1, "sqlEntity"), "tableName");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = (id)objc_msgSend((id)objc_msgSend(v1, "indexDescription"), "elements");
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (!v2)
      goto LABEL_20;
    v3 = v2;
    v4 = &stru_1E1EE23F0;
    v5 = *(_QWORD *)v49;
    v6 = &stru_1E1EE23F0;
    v7 = v1;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v49 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x18D76B4E4]();
        v11 = (void *)objc_msgSend(v9, "property");
        if ((objc_msgSend(v11, "_propertyType") & 0xFFFFFFFFFFFFFFFBLL) == 2)
        {
          if (v11 && objc_msgSend(v11, "superCompositeAttribute"))
          {
            v12 = objc_msgSend(v11, "_qualifiedName");
            v13 = (void *)objc_msgSend(v1, "sqlEntity");
            if (v13)
            {
              v14 = (uint64_t)v13;
              goto LABEL_14;
            }
          }
          else
          {
            v14 = objc_msgSend(v1, "sqlEntity");
            v15 = objc_msgSend(v11, "name");
            if (v14)
            {
              v12 = v15;
LABEL_14:
              v13 = (void *)objc_msgSend(*(id *)(v14 + 40), "objectForKey:", v12);
            }
            else
            {
              v13 = 0;
            }
          }
          v16 = objc_msgSend(v13, "columnName");
          objc_msgSend(v46, "appendFormat:", CFSTR("%@%@_MIN, %@_MAX"), v6, v16, v16);
          objc_msgSend(v43, "appendFormat:", CFSTR("%@NEW.%@, NEW.%@"), v6, v16, v16);
          objc_msgSend(v44, "appendFormat:", CFSTR("%@%@, %@"), v6, v16, v16);
          objc_msgSend(v45, "appendFormat:", CFSTR("%@%@ NOT NULL"), v4, v16);
          v1 = v7;
        }
        objc_autoreleasePoolPop(v10);
        ++v8;
        v4 = CFSTR(" AND ");
        v6 = CFSTR(", ");
      }
      while (v3 != v8);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      v3 = v17;
      v4 = CFSTR(" AND ");
      if (!v17)
      {
LABEL_20:
        v18 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", objc_msgSend(v1, "sqlEntity"), objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("CREATE VIRTUAL TABLE IF NOT EXISTS %@ USING RTREE (Z_PK INTEGER PRIMARY KEY, %@)"), v1[6], v46));
        objc_msgSend(v39, "addObject:", v18);

        v19 = [NSSQLiteStatement alloc];
        v20 = objc_msgSend(v1, "sqlEntity");
        v21 = -[NSSQLiteStatement initWithEntity:sqlString:](v19, "initWithEntity:sqlString:", v20, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), v1[6]));
        objc_msgSend(v40, "addObject:", v21);

        v22 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", objc_msgSend(v1, "sqlEntity"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW BEGIN INSERT OR REPLACE INTO %@ (Z_PK, %@) VALUES (NEW.Z_PK, %@) ; END"),
                  v1[6],
                  v38,
                  v1[6],
                  v46,
                  v43));
        objc_msgSend(v39, "addObject:", v22);

        v23 = [NSSQLiteStatement alloc];
        v24 = objc_msgSend(v1, "sqlEntity");
        v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v23, "initWithEntity:sqlString:", v24, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v1[6]));
        objc_msgSend(v40, "addObject:", v25);

        v26 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", objc_msgSend(v1, "sqlEntity"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = NEW.Z_PK ; INSERT INTO %@ (Z_PK, %@) VALUES (NEW.Z_PK, %@) ; END"),
                  v1[6],
                  v38,
                  v1[6],
                  v1[6],
                  v46,
                  v43));
        objc_msgSend(v39, "addObject:", v26);

        v27 = [NSSQLiteStatement alloc];
        v28 = objc_msgSend(v1, "sqlEntity");
        v29 = -[NSSQLiteStatement initWithEntity:sqlString:](v27, "initWithEntity:sqlString:", v28, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE"), v1[6]));
        objc_msgSend(v40, "addObject:", v29);

        v30 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", objc_msgSend(v1, "sqlEntity"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = OLD.Z_PK ; END"),
                  v1[6],
                  v38,
                  v1[6]));
        objc_msgSend(v39, "addObject:", v30);

        v31 = [NSSQLiteStatement alloc];
        v32 = objc_msgSend(v1, "sqlEntity");
        v33 = -[NSSQLiteStatement initWithEntity:sqlString:](v31, "initWithEntity:sqlString:", v32, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_DELETE"), v1[6]));
        objc_msgSend(v40, "addObject:", v33);

        v34 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", objc_msgSend(v1, "sqlEntity"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (Z_PK, %@) SELECT Z_PK, %@ from %@ where %@"), v1[6], v46, v44, v38, v45));
        objc_msgSend(v41, "addObject:", v34);

        objc_setProperty_nonatomic(v1, v35, v39, 24);
        objc_setProperty_nonatomic(v1, v36, v40, 32);

        objc_setProperty_nonatomic(v1, v37, v41, 40);
        objc_autoreleasePoolPop(context);
        return;
      }
    }
  }
}

- (id)generateStatementsForStore:(id)a3
{
  id result;

  if (self)
  {
    result = self->super._createStrings;
    if (!result)
    {
      -[NSSQLRTreeIndex generateSQLStrings](self);
      return self->super._createStrings;
    }
  }
  else
  {
    -[NSSQLRTreeIndex generateSQLStrings](0);
    return 0;
  }
  return result;
}

- (id)dropStatementsForStore:(id)a3
{
  id result;

  if (self)
  {
    result = self->super._dropStrings;
    if (!result)
    {
      -[NSSQLRTreeIndex generateSQLStrings](self);
      return self->super._dropStrings;
    }
  }
  else
  {
    -[NSSQLRTreeIndex generateSQLStrings](0);
    return 0;
  }
  return result;
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  id result;

  if (self)
  {
    result = self->super._updateStrings;
    if (!result)
    {
      -[NSSQLRTreeIndex generateSQLStrings](self);
      return self->super._updateStrings;
    }
  }
  else
  {
    -[NSSQLRTreeIndex generateSQLStrings](0);
    return 0;
  }
  return result;
}

@end
