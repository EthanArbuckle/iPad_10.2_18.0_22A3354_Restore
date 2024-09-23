@implementation NSSQLBatchOperationRequestContext

- (void)dealloc
{
  objc_super v3;

  self->_tempTableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchOperationRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (uint64_t)createObjectIDCaptureStatementsForDrop:(uint64_t)a1
{
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSSQLiteStatement *v24;
  NSSQLiteStatement *v25;
  void *v26;
  NSSQLiteStatement *v27;
  uint64_t v28;
  uint8_t buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend((id)a1, "persistentStoreRequest");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((a2 & 1) == 0)
        objc_setProperty_nonatomic((id)a1, v10, CFSTR("TEMP_CDBATCHUPDATEOBJECTIDS"), 88);
      v11 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(v4, "entity"));
      v12 = objc_msgSend(v11, "model");
      if (!v12 || !*(_DWORD *)(v12 + 68) || objc_msgSend(*(id *)(a1 + 32), "_allowAncillaryEntities"))
      {
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
        if ((a2 & 1) != 0)
          v14 = -[NSSQLBatchOperationRequestContext createDropTemporaryTablesForBatchOperationTriggers]((_QWORD *)a1);
        else
          v14 = -[NSSQLBatchOperationRequestContext createTemporaryTablesForBatchOperationTriggers](a1);
        objc_msgSend(v13, "addObjectsFromArray:", v14);
        objc_msgSend(v13, "addObjectsFromArray:", -[NSSQLBatchOperationRequestContext createTriggerForUpdateOnEntity:onAttributes:forDrop:](a1, v11, (void *)objc_msgSend((id)objc_msgSend(v4, "propertiesToUpdate"), "allKeys"), a2));
        return (uint64_t)v13;
      }
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected batch operation: %@");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v4);
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v4;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Unexpected batch operation: %@", buf, 0xCu);
      }
    }
    return MEMORY[0x1E0C9AA60];
  }
  if ((a2 & 1) == 0)
    objc_setProperty_nonatomic((id)a1, v5, CFSTR("TEMP_CDBATCHINSERTOBJECTIDS"), 88);
  v6 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(v4, "entity"));
  v7 = objc_msgSend(v6, "model");
  if (v7 && *(_DWORD *)(v7 + 68) && !objc_msgSend(*(id *)(a1 + 32), "_allowAncillaryEntities"))
    return MEMORY[0x1E0C9AA60];
  if (!v6)
    return 0;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  if ((a2 & 1) != 0)
    v9 = -[NSSQLBatchOperationRequestContext createDropTemporaryTablesForBatchOperationTriggers]((_QWORD *)a1);
  else
    v9 = -[NSSQLBatchOperationRequestContext createTemporaryTablesForBatchOperationTriggers](a1);
  objc_msgSend(v8, "addObjectsFromArray:", v9);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ZQ_%@_%@_%@"), CFSTR("INSERT"), *(_QWORD *)(a1 + 88), objc_msgSend(v6, "name"));
  if ((a2 & 1) != 0)
  {
    v24 = [NSSQLiteStatement alloc];
    v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v24, "initWithEntity:sqlString:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v23));
  }
  else
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO %@ (ENTITYID, PRIMEKEY, TYPE) SELECT %@, %@, %ld;"),
                    *(_QWORD *)(a1 + 88),
                    CFSTR("NEW.Z_ENT"),
                    CFSTR("NEW.Z_PK"),
                    0);
    v27 = [NSSQLiteStatement alloc];
    v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v27, "initWithEntity:sqlString:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS %@ AFTER %@ ON %@ FOR EACH ROW BEGIN %@ END"), v23, CFSTR("INSERT"), objc_msgSend(v6, "tableName"), v26));

  }
  *(_QWORD *)buf = v25;
  v28 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);

  objc_msgSend(v8, "addObjectsFromArray:", v28);
  objc_msgSend(v8, "addObjectsFromArray:", -[NSSQLBatchOperationRequestContext createTriggerForUpdateOnEntity:onAttributes:forDrop:](a1, v6, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "entityDescription"), "attributesByName"), "allValues"), a2));
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
}

- (uint64_t)createTemporaryTablesForBatchOperationTriggers
{
  NSSQLiteStatement *v2;
  NSSQLiteStatement *v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = [NSSQLiteStatement alloc];
  v3 = -[NSSQLiteStatement initWithEntity:sqlString:](v2, "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMP TABLE IF NOT EXISTS %@ (ENTITYID INTEGER, PRIMEKEY INTEGER, TYPE INTEGER, ATTRIBUTENAME VARCHAR)"), *(_QWORD *)(a1 + 88)));
  v6[0] = v3;
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);

  return v4;
}

- (uint64_t)createDropTemporaryTablesForBatchOperationTriggers
{
  _QWORD *v1;
  _QWORD v3[2];

  v1 = a1;
  v3[1] = *MEMORY[0x1E0C80C00];
  if (a1)
    a1 = (_QWORD *)a1[1];
  v3[0] = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter"), v1[11]);
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void)createTriggerForUpdateOnEntity:(void *)a3 onAttributes:(char)a4 forDrop:
{
  void *v8;
  NSSQLiteStatement *v9;
  id *v10;
  NSSQLiteStatement *v11;
  void *v12;
  NSSQLiteStatement *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id *v31;
  void *v32;
  NSSQLiteStatement *v33;
  NSSQLiteStatement *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSSQLiteStatement *v44;
  void *v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  char v50;
  void *v51;
  uint64_t v52;
  id obj;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v51 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count") + 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ZQ_UPDATE_%@_%@"), *(_QWORD *)(a1 + 88), objc_msgSend(a2, "name"));
  v50 = a4;
  v49 = a1;
  if ((a4 & 1) != 0)
  {
    v9 = [NSSQLiteStatement alloc];
    v48 = (uint64_t)v8;
    v10 = (id *)a2;
    v11 = -[NSSQLiteStatement initWithEntity:sqlString:](v9, "initWithEntity:sqlString:", a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@")));
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO %@ (ENTITYID, PRIMEKEY, TYPE) SELECT OLD.Z_ENT, OLD.Z_PK, %ld;"),
                    *(_QWORD *)(a1 + 88),
                    1);
    v13 = [NSSQLiteStatement alloc];
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "tableName");
    v48 = (uint64_t)v8;
    v15 = objc_msgSend(v14, "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS %@ AFTER UPDATE ON %@ FOR EACH ROW BEGIN %@ END"));
    v10 = (id *)a2;
    v11 = -[NSSQLiteStatement initWithEntity:sqlString:](v13, "initWithEntity:sqlString:", a2, v15);

  }
  objc_msgSend(v51, "addObject:", v11);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  v18 = &OBJC_IVAR___NSCloudKitMirroringDelegate__exportActivityIdentifier;
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v60 != v20)
          objc_enumerationMutation(a3);
        v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v16, "addObjectsFromArray:", objc_msgSend(v22, "_flattenElements:", objc_msgSend(v22, "elements")));
        else
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v19);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v23)
  {
    v24 = v23;
    v25 = v10;
    v26 = *(_QWORD *)v56;
    obj = v16;
    do
    {
      v27 = 0;
      v52 = v24;
      do
      {
        if (*(_QWORD *)v56 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v27);
        if ((objc_msgSend(v28, "isTransient") & 1) == 0)
        {
          v29 = objc_msgSend(v28, "_qualifiedName");
          if (v25)
            v30 = (void *)objc_msgSend(v25[5], "objectForKey:", v29);
          else
            v30 = 0;
          if (objc_msgSend(v30, "columnName"))
          {
            v31 = v25;
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ZQ_UPDATE_%@_%@_%@"), *(_QWORD *)(v49 + v18[421]), objc_msgSend(v25, "name"), objc_msgSend(v28, "name"));
            if ((v50 & 1) != 0)
            {
              v33 = [NSSQLiteStatement alloc];
              v48 = (uint64_t)v32;
              v34 = -[NSSQLiteStatement initWithEntity:sqlString:](v33, "initWithEntity:sqlString:", v31, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@")));
            }
            else
            {
              v18 = &OBJC_IVAR___NSCloudKitMirroringDelegate__exportActivityIdentifier;
              v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO %@ (ENTITYID, PRIMEKEY, TYPE, ATTRIBUTENAME) SELECT OLD.Z_ENT, OLD.Z_PK, %ld, '%@';"),
                              *(_QWORD *)(v49 + 88),
                              1,
                              objc_msgSend(v28, "name"));
              v44 = [NSSQLiteStatement alloc];
              v45 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v31, "tableName");
              v48 = (uint64_t)v32;
              v34 = -[NSSQLiteStatement initWithEntity:sqlString:](v44, "initWithEntity:sqlString:", v31, objc_msgSend(v45, "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS %@ AFTER UPDATE ON %@ FOR EACH ROW WHEN OLD.%@ IS NOT NEW.%@ BEGIN %@ END")));

            }
            v25 = v31;
            v24 = v52;
            objc_msgSend(v51, "addObject:", v34);

          }
          else
          {
            v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Expected an attribute for the entity");
            _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, v48);
            v42 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18A253000, v42, OS_LOG_TYPE_FAULT, "CoreData: Expected an attribute for the entity", buf, 2u);
            }
          }
        }
        ++v27;
      }
      while (v24 != v27);
      v16 = obj;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      v24 = v46;
    }
    while (v46);
  }

  return v51;
}

@end
