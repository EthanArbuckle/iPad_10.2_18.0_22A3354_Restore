@implementation NSSQLiteIndexTrackingModel

+ (unint64_t)ancillaryEntityOffset
{
  return 18000;
}

+ (unint64_t)ancillaryEntityCount
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_opt_self();
}

+ (void)_invalidateStaticCaches
{

  _MergedGlobals_90 = 0;
}

+ (id)newModelForFrameworkVersion:
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NSSQLiteIndexTrackingModel_newModelForFrameworkVersion___block_invoke;
  block[3] = &unk_1E1EDD520;
  block[4] = v0;
  if (qword_1ECD8DB80 != -1)
    dispatch_once(&qword_1ECD8DB80, block);
  return (id)_MergedGlobals_90;
}

uint64_t __58__NSSQLiteIndexTrackingModel_newModelForFrameworkVersion___block_invoke(uint64_t a1)
{
  NSEntityDescription *v2;
  objc_class *v3;
  uint64_t v4;
  NSEntityDescription *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(NSEntityDescription);
  v3 = (objc_class *)objc_opt_self();
  -[NSEntityDescription setName:](v2, "setName:", NSStringFromClass(v3));
  v7[0] = makeAttribute((uint64_t)CFSTR("indexName"), 700);
  v7[1] = makeAttribute((uint64_t)CFSTR("executionCount"), 300);
  v7[2] = makeAttribute((uint64_t)CFSTR("instructionCount"), 300);
  v7[3] = makeAttribute((uint64_t)CFSTR("rowCount"), 300);
  -[NSEntityDescription setProperties:](v2, "setProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4));
  _MergedGlobals_90 = objc_alloc_init(NSManagedObjectModel);
  objc_msgSend((id)_MergedGlobals_90, "_setModelsReferenceIDOffset:", objc_msgSend(*(id *)(a1 + 32), "ancillaryEntityOffset"));
  v6 = v2;
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  objc_msgSend((id)_MergedGlobals_90, "setEntities:", v4);
  return objc_msgSend((id)_MergedGlobals_90, "_setIsEditable:", 0);
}

+ (void)updateIndexStatistics:(uint64_t)a3 usingConnection:(_QWORD *)a4 model:
{
  objc_class *v6;
  id *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  NSSQLiteStatement *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a4)
    a4 = (_QWORD *)a4[4];
  v6 = (objc_class *)objc_opt_class();
  v7 = (id *)objc_msgSend(a4, "objectForKeyedSubscript:", NSStringFromClass(v6));
  v8 = v7;
  if (v7)
  {
    v28 = objc_msgSend(v7, "tableName");
    v9 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", CFSTR("executionCount")), "columnName");
    v10 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", CFSTR("rowCount")), "columnName");
    v11 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", CFSTR("instructionCount")), "columnName");
    v27 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", CFSTR("indexName")), "columnName");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = (void *)objc_msgSend(a2, "allValues");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v13)
    {
      obj = v12;
      v26 = *(_QWORD *)v32;
      do
      {
        v30 = v13;
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(obj);
          v15 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE OR IGNORE \"%@\" SET \"%@\" = \"%@\" + %lld, \"%@\" = \"%@\" + %lld, \"%@\" = \"%@\" + %lld WHERE \"%@\" = '%@'"), v28, v9, v9, objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "executionCount"), v10, v10, objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "rowCount"), v11, v11, objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "instructionCount"), v27, objc_msgSend(
                      (id)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "indexName"),
                      "uppercaseString")));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a3, v15);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Couldn't find NSSQLiteIndexStatistics entity");
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, v24);
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Couldn't find NSSQLiteIndexStatistics entity", buf, 2u);
    }
  }

}

+ (id)ancillaryModelNamespace
{
  return CFSTR("SQLiteIndexTracking");
}

@end
