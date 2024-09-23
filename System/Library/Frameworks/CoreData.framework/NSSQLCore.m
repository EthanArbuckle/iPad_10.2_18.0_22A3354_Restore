@implementation NSSQLCore

- (uint64_t)newForeignKeyID:(void *)a1 entity:(uint64_t)a2
{
  if (a1 && a2)
    return objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "objectIDFactoryForSQLEntity:")), "initWithPK64:", a2);
  else
    return 0;
}

- (Class)objectIDFactoryForSQLEntity:(id)a3
{
  return -[NSSQLCore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:", *((_QWORD *)a3 + 3));
}

- (Class)objectIDFactoryForEntity:(id)a3
{
  id v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLCore;
  v5 = -[NSPersistentStore objectIDFactoryForEntity:](&v8, sel_objectIDFactoryForEntity_);
  if (!objc_msgSend(v5, "_storeInfo1"))
  {
    v6 = 0;
    if (self && a3)
      v6 = _sqlCoreLookupSQLEntityForEntityDescription(self, a3);
    objc_msgSend(v5, "_setStoreInfo1:", v6);
  }
  return (Class)v5;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return (id)_sqlCoreLookupSQLEntityForEntityDescription(self, a3);
}

- (NSSQLModel)model
{
  return self->_model;
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (id)adapter
{
  return self->_adapter;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  NSError *v6;
  id v7;

  v6 = -[NSSQLCore _newValuesForRelationship:forObjectWithID:withContext:error:](self, a3, a4, a5, (NSError **)a6);
  v7 = (id)-[NSError firstObject](v6, "firstObject");

  return v7;
}

- (NSError)_newValuesForRelationship:(void *)a3 forObjectWithID:(void *)a4 withContext:(NSError *)a5 error:
{
  double v10;
  double v11;
  double v12;
  double v13;
  os_unfair_lock_s *v14;
  NSError *v15;
  NSError *error;
  uint64_t v17;
  NSSQLRelationshipFaultRequestContext *v18;
  NSException *exception;
  NSError *v20;
  NSException *v22;

  if (!a1 || !objc_msgSend(a1, "_persistentStoreCoordinator"))
    return 0;
  if (objc_msgSend(a3, "isTemporaryID"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot find data for a temporary oid: %@"), a3), 0));
  objc_msgSend(a4, "stalenessInterval");
  v11 = v10;
  v12 = CFAbsoluteTimeGetCurrent() - v10;
  if (v11 <= 0.0)
    v12 = *(double *)&NSSQLDistantPastTimeInterval;
  if (v11 == 0.0)
    v13 = *(double *)&NSSQLDistantFutureTimeInterval;
  else
    v13 = v12;
  v14 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:](a1, (void *)objc_msgSend(a4, "_queryGenerationToken", v12));
  if ((objc_msgSend(a2, "isToMany") & 1) != 0)
  {
    v15 = (NSError *)(id)-[NSPersistentStoreCache toManyInformationForSourceObjectID:forProperty:afterTimestamp:]((uint64_t)v14, a3, a2, v13);
  }
  else
  {
    v17 = -[os_unfair_lock_s valueForKey:](-[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v14, a3, v13), "valueForKey:", objc_msgSend(a2, "name"));
    if (!v17)
      goto LABEL_15;
    v15 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v17, 0);
  }
  error = v15;
  if (!v15)
  {
LABEL_15:
    v18 = -[NSSQLRelationshipFaultRequestContext initWithObjectID:relationship:context:sqlCore:]([NSSQLRelationshipFaultRequestContext alloc], "initWithObjectID:relationship:context:sqlCore:", a3, a2, a4, a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v18, 0);
    error = (NSError *)-[NSSQLStoreRequestContext result](v18, "result");
    if (error)
    {
LABEL_25:

      return error;
    }
    if (v18)
    {
      exception = v18->super._exception;
      if (exception)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v22 = exception;
          objc_exception_throw(exception);
        }
        if (a5)
        {
          v20 = (NSError *)-[NSException errorObjectWithUserInfo:](exception, "errorObjectWithUserInfo:", 0);
LABEL_24:
          error = 0;
          *a5 = v20;
          goto LABEL_25;
        }
LABEL_27:
        error = 0;
        goto LABEL_25;
      }
      if (!a5)
        goto LABEL_27;
      error = v18->super._error;
    }
    else
    {
      error = 0;
      if (!a5)
        goto LABEL_25;
    }
    v20 = error;
    goto LABEL_24;
  }
  return error;
}

- (BOOL)supportsGenerationalQuerying
{
  unsigned int v3;

  v3 = -[NSSQLCore supportsComplexFeatures](self);
  if (v3)
  {
    if (self)
      LOBYTE(v3) = (*(_DWORD *)&self->_sqlCoreFlags & 0x4000) == 0;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)supportsComplexFeatures
{
  void *v1;

  if (result)
  {
    v1 = result;
    result = (void *)objc_msgSend(result, "_persistentStoreCoordinator");
    if (result)
    {
      if (objc_msgSend((id)objc_msgSend(v1, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
      {
        return 0;
      }
      else
      {
        return (void *)(objc_msgSend((id)objc_msgSend(v1, "options"), "objectForKey:", CFSTR("NSXPCStoreDelegate")) == 0);
      }
    }
  }
  return result;
}

- (id)externalDataReferencesDirectory
{
  unint64_t *p_externalDataReferencesDirectory;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  id v11;
  unint64_t *p_externalDataLinksDirectory;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  char v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_externalDataReferencesDirectory = (unint64_t *)&self->_externalDataReferencesDirectory;
  if (!self->_externalDataReferencesDirectory)
  {
    if ((*(_BYTE *)&self->_sqlCoreFlags & 2) == 0)
    {
      v4 = &stru_1E1EE23F0;
      goto LABEL_8;
    }
    v4 = (__CFString *)(id)objc_msgSend(-[NSSQLCore _supportDirectoryPath](self), "stringByAppendingPathComponent:", CFSTR("_EXTERNAL_DATA"));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = 0;
    if ((objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v29) & 1) != 0)
    {
      if (v29)
        goto LABEL_8;
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99768];
      v8 = CFSTR("Can't create external reference directory (file exists)");
      v9 = 0;
LABEL_31:
      objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, v9));
    }
    v28 = 0;
    if ((objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v28) & 1) == 0)
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fatal error creating external data directory: %@ at path %@ with ui %@");
      v16 = CFSTR("null");
      if (v28)
        v17 = v28;
      else
        v17 = CFSTR("null");
      -[__CFString userInfo](v28, "userInfo");
      _NSCoreDataLog(17, v15, v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        if (v28)
          v16 = v28;
        v25 = -[__CFString userInfo](v28, "userInfo");
        *(_DWORD *)buf = 138412802;
        v31 = v16;
        v32 = 2112;
        v33 = v4;
        v34 = 2112;
        v35 = v25;
        _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Fatal error creating external data directory: %@ at path %@ with ui %@", buf, 0x20u);
      }
      v26 = (void *)MEMORY[0x1E0C99DA0];
      v27 = *MEMORY[0x1E0C99768];
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v28, *MEMORY[0x1E0CB3388]);
      v8 = CFSTR("Can't create support directory (can't create directory)");
      v6 = v26;
      v7 = v27;
      goto LABEL_31;
    }
LABEL_8:
    while (!__ldaxr(p_externalDataReferencesDirectory))
    {
      if (!__stlxr((unint64_t)v4, p_externalDataReferencesDirectory))
        goto LABEL_12;
    }
    __clrex();

LABEL_12:
    if ((*(_BYTE *)&self->_sqlCoreFlags & 0x80) != 0
      && (objc_msgSend(&stru_1E1EE23F0, "isEqual:", *p_externalDataReferencesDirectory) & 1) == 0)
    {
      v11 = (id)objc_msgSend(-[_PFGarbageManager temporaryLinksDirectoryForStore:]((id *)+[_PFGarbageManager defaultInstance](_PFGarbageManager, "defaultInstance"), self), "path");
      p_externalDataLinksDirectory = (unint64_t *)&self->_externalDataLinksDirectory;
      while (!__ldaxr(p_externalDataLinksDirectory))
      {
        if (!__stlxr((unint64_t)v11, p_externalDataLinksDirectory))
          goto LABEL_19;
      }
      __clrex();

    }
  }
LABEL_19:
  if ((objc_msgSend(&stru_1E1EE23F0, "isEqual:", *p_externalDataReferencesDirectory) & 1) != 0)
    return 0;
  else
    return (id)*p_externalDataReferencesDirectory;
}

- (id)fileBackedFuturesDirectory
{
  unint64_t *p_fileBackedFuturesPath;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  char v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  p_fileBackedFuturesPath = (unint64_t *)&self->_fileBackedFuturesPath;
  if (!self->_fileBackedFuturesPath)
  {
    if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 0x20) == 0)
    {
      v3 = &stru_1E1EE23F0;
      goto LABEL_8;
    }
    v3 = (__CFString *)(id)objc_msgSend(-[NSSQLCore _supportDirectoryPath](self), "stringByAppendingPathComponent:", CFSTR("_FBF"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = 0;
    if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v25) & 1) != 0)
    {
      if (v25)
        goto LABEL_8;
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99768];
      v7 = CFSTR("Can't create fbf directory (file exists)");
      v8 = 0;
LABEL_24:
      objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, v8));
    }
    v24 = 0;
    if ((objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v24) & 1) == 0)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fatal error creating file backed futures directory: %@ at path %@ with ui %@");
      v12 = CFSTR("null");
      if (v24)
        v13 = v24;
      else
        v13 = CFSTR("null");
      -[__CFString userInfo](v24, "userInfo");
      _NSCoreDataLog(17, v11, v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        if (v24)
          v12 = v24;
        v21 = -[__CFString userInfo](v24, "userInfo");
        *(_DWORD *)buf = 138412802;
        v27 = v12;
        v28 = 2112;
        v29 = v3;
        v30 = 2112;
        v31 = v21;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Fatal error creating file backed futures directory: %@ at path %@ with ui %@", buf, 0x20u);
      }
      v22 = (void *)MEMORY[0x1E0C99DA0];
      v23 = *MEMORY[0x1E0C99768];
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v24, *MEMORY[0x1E0CB3388]);
      v7 = CFSTR("Can't create support directory (can't create directory)");
      v5 = v22;
      v6 = v23;
      goto LABEL_24;
    }
LABEL_8:
    while (!__ldaxr(p_fileBackedFuturesPath))
    {
      if (!__stlxr((unint64_t)v3, p_fileBackedFuturesPath))
        goto LABEL_12;
    }
    __clrex();

  }
LABEL_12:
  if ((objc_msgSend(&stru_1E1EE23F0, "isEqual:", *p_fileBackedFuturesPath) & 1) != 0)
    return 0;
  else
    return (id)*p_fileBackedFuturesPath;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  double v9;
  double v10;
  double v11;
  os_unfair_lock_s *v12;
  double v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  NSSQLObjectFaultRequestContext *v17;
  NSException *exception;
  NSError *v19;
  NSError *error;
  void *v21;
  uint64_t v22;
  NSException *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"))
  {
    if (objc_msgSend(a3, "isTemporaryID"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot find data for a temporary oid: %@"), a3), 0));
    objc_msgSend(a4, "stalenessInterval");
    v10 = v9;
    if (v9 <= 0.0)
      v11 = *(double *)&NSSQLDistantPastTimeInterval;
    else
      v11 = CFAbsoluteTimeGetCurrent() - v9;
    if (v10 == 0.0)
      v13 = *(double *)&NSSQLDistantFutureTimeInterval;
    else
      v13 = v11;
    if (self)
      v14 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:](self, (void *)objc_msgSend(a4, "_queryGenerationToken", v11));
    else
      v14 = 0;
    v15 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v14, a3, v13);
    if (v15)
    {
      v12 = v15;
      v16 = v15;
      return v12;
    }
    v17 = -[NSSQLObjectFaultRequestContext initWithObjectID:context:sqlCore:]([NSSQLObjectFaultRequestContext alloc], "initWithObjectID:context:sqlCore:", a3, a4, self);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v17, 0);
    v12 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v17, "result");
    if (v12)
    {
LABEL_28:

      return v12;
    }
    if (v17)
    {
      exception = v17->super._exception;
      if (exception)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = exception;
          objc_exception_throw(exception);
        }
        if (a5)
        {
          v19 = (NSError *)-[NSException errorObjectWithUserInfo:](exception, "errorObjectWithUserInfo:", 0);
LABEL_27:
          v12 = 0;
          *a5 = v19;
          goto LABEL_28;
        }
LABEL_30:
        v12 = 0;
        goto LABEL_28;
      }
      if (!a5)
        goto LABEL_30;
      error = v17->super._error;
      if (error)
      {
        v19 = error;
        goto LABEL_27;
      }
    }
    else if (!a5)
    {
      goto LABEL_30;
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v25 = CFSTR("objectID");
    v26[0] = a3;
    v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v19 = (NSError *)objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 133000, v22);
    goto LABEL_27;
  }
  return 0;
}

- (_QWORD)rowCacheForGeneration:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    result = (_QWORD *)result[16];
    if (result)
    {
      result = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)result, a2);
      if (!result)
      {
        v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "generational row cache %p failed to return a value for store '%@' with token %@");
        v5 = v2[16];
        objc_msgSend(v2, "identifier");
        _NSCoreDataLog(17, v4, v6, v7, v8, v9, v10, v11, v5);
        v12 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v13 = v2[16];
          *(_DWORD *)buf = 134218498;
          v15 = v13;
          v16 = 2112;
          v17 = objc_msgSend(v2, "identifier");
          v18 = 2112;
          v19 = a2;
          _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: generational row cache %p failed to return a value for store '%@' with token %@", buf, 0x20u);
        }
        return 0;
      }
    }
  }
  return result;
}

+ (BOOL)coloredLoggingDefault
{
  return _CoreData_SyntaxColoredLogging;
}

+ (BOOL)useConcurrentFetching
{
  return dword_1ECD8D778 != 0;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[NSSQLCore rowCacheForGeneration:](self, a4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        -[NSPersistentStoreCache incrementRefCountForObjectID:]((uint64_t)v5, *(const void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

+ (int)debugDefault
{
  return dword_1ECD8D774;
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_generationalRowCache, a4);
    if (v5)
    {
      v6 = (uint64_t)v5;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(a3);
            -[NSPersistentStoreCache decrementRefCountForObjectID:](v6, *(const void **)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }
    }
  }
}

- (void)dispatchRequest:(uint64_t)a3 withRetries:
{
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a1)
  {
    objc_msgSend(a2, "executePrologue");
    if (a2)
    {
      if (a2[6])
        return;
      v6 = a2[5] != 0;
      if (a3 < 0)
        return;
    }
    else
    {
      v6 = 0;
      if (a3 < 0)
        return;
    }
    if (!v6)
    {
      v7 = 0;
      v8 = a3 + 1;
      do
      {
        if ((-[NSSQLCoreDispatchManager routeStoreRequest:](*(_QWORD *)(a1 + 120), (uint64_t)a2) & 1) != 0
          || objc_msgSend(a2, "result"))
        {
          objc_msgSend(a2, "executeEpilogue");
          return;
        }
        if (a2)
          v9 = (void *)a2[6];
        else
          v9 = 0;
        v10 = v9;
        if (v10)
        {
          v12 = v10;
          if (!v7)
            v7 = v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "userInfo");
            _NSCoreDataLog(1, (uint64_t)CFSTR("SQLCore dispatchRequest: exception handling request: %@ , %@ with userInfo of %@"), v13, v14, v15, v16, v17, v18, (uint64_t)a2);
          }
        }
        --v8;
      }
      while (v8 > 0);
      if (a2)
      {
        if (v7)
          objc_setProperty_nonatomic(a2, v11, v7, 48);
      }
    }
  }
}

- (id)identifier
{
  os_unfair_lock_s *p_sqlCoreStateLock;
  id v4;

  p_sqlCoreStateLock = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  v4 = (id)-[NSMutableDictionary objectForKey:](self->_storeMetadata, "objectForKey:", CFSTR("NSStoreUUID"));
  os_unfair_lock_unlock(p_sqlCoreStateLock);
  return v4;
}

- (uint64_t)entityForObjectID:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  _QWORD *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v3 = (void *)result;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        result = objc_msgSend(a2, "_storeInfo1");
        if (result)
          return result;
        v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "entityForObjectID failed to retrieve an NSSQLEntity for objectID %@");
        _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
        v11 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = a2;
          _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: entityForObjectID failed to retrieve an NSSQLEntity for objectID %@", buf, 0xCu);
        }
      }
      v12 = (_QWORD *)objc_msgSend(a2, "entity");
      if (v12)
      {
        v13 = v12;
        result = _sqlCoreLookupSQLEntityForEntityDescription(v3, v12);
        if (result)
          return result;
        v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_sqlCoreLookupSQLEntityForEntityDescription failed to return a result for objectID %@ with entity %@");
        _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)a2);
        v21 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          return 0;
        *(_DWORD *)buf = 138412546;
        v43 = a2;
        v44 = 2112;
        v45 = v13;
        v22 = "CoreData: _sqlCoreLookupSQLEntityForEntityDescription failed to return a result for objectID %@ with entity %@";
        v23 = v21;
        v24 = 22;
        goto LABEL_17;
      }
      v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "entityForObjectID passed a nil entity description from %@");
      _NSCoreDataLog(17, v33, v34, v35, v36, v37, v38, v39, (uint64_t)a2);
      v40 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        return 0;
      *(_DWORD *)buf = 138412290;
      v43 = a2;
      v22 = "CoreData: entityForObjectID passed a nil entity description from %@";
      v23 = v40;
      v24 = 12;
    }
    else
    {
      v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "entityForObjectID was passed a nil objectID");
      _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, v41);
      v32 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        return 0;
      *(_WORD *)buf = 0;
      v22 = "CoreData: entityForObjectID was passed a nil objectID";
      v23 = v32;
      v24 = 2;
    }
LABEL_17:
    _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, v22, buf, v24);
    return 0;
  }
  return result;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v6;
  int v7;
  BOOL v8;
  void *v9;
  NSSQLCountRequestContext *v10;
  id v11;
  NSException *v12;
  NSException *v13;
  NSPersistentCloudKitContainerEventResult *v14;
  NSSQLBatchInsertRequestContext *v15;
  id v16;
  NSException *v17;
  NSException *v18;
  NSError *v19;
  NSError *v20;
  NSError *v21;
  NSSQLiteIndexStatisticsResult *v22;
  NSSQLSaveChangesRequestContext *v23;
  id *p_isa;
  NSSQLSavePlan *savePlan;
  BOOL v26;
  NSSQLSavePlan *v27;
  id v28;
  NSPersistentCloudKitContainerEventResult *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSSQLBatchUpdateRequestContext *v37;
  id v38;
  NSException *v39;
  NSException *v40;
  NSError *v41;
  NSError *v42;
  NSSQLBatchDeleteRequestContext *v43;
  id v44;
  NSException *v45;
  NSException *v46;
  NSError *v47;
  NSError *v48;
  NSPersistentStoreResult *v49;
  NSPersistentStoreResult *v50;
  NSPersistentStoreResult *v51;
  uint64_t v52;
  _BYTE *v53;
  void *v54;
  objc_class *v55;
  uint64_t v56;
  void *v57;
  __objc2_class **v58;
  id v59;
  uint64_t v60;
  _QWORD *v61;
  id v62;
  void *v63;
  id v64;
  NSPersistentCloudKitContainerEventResult *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t transactionInMemorySequence;
  uint64_t v72;
  NSPersistentCloudKitContainerEventResult *v73;
  NSPersistentCloudKitContainerEventResult *v74;
  void *v75;
  objc_class *v76;
  uint64_t v77;
  NSFetchRequest *v78;
  NSSQLFetchRequestContext *v79;
  id v80;
  NSException *v81;
  NSException *v82;
  NSPersistentHistoryChangeRequest *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  NSSQLPersistentHistoryChangeRequestContext *v87;
  id v88;
  NSException *v89;
  NSException *v90;
  NSError *v91;
  NSError *v92;
  NSSQLFetchRequestContext *v93;
  id v94;
  id v95;
  NSException *v96;
  NSError *error;
  NSSQLiteStatement *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSError *v102;
  NSError *v103;
  NSError *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  NSSQLiteIndexStatisticsResult *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  NSError *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  NSObject *v157;
  NSSQLiteIndexStatisticsResult *v158;
  NSPersistentCloudKitContainerEventResult *v159;
  NSError *v160;
  BOOL v161;
  NSException *v162;
  NSException *v163;
  NSException *v164;
  NSException *v165;
  _Unwind_Exception *exception_object;
  id exceptiona;
  NSException *exception;
  uint64_t v171;
  NSError *v174;
  NSError *v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _QWORD v180[5];
  id v181;
  const __CFString *v182;
  uint64_t v183;
  uint8_t v184[128];
  uint8_t buf[4];
  const char *v186;
  __int16 v187;
  int v188;
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "requestType");
  v174 = 0;
  v171 = *MEMORY[0x1E0CB28A8];
  v7 = 4;
  while (1)
  {
    v8 = __OFSUB__(v7--, 1);
    if (v7 < 0 != v8)
      break;
    switch(v6)
    {
      case 1:
        if (objc_msgSend(a3, "resultType") == 4)
          goto LABEL_5;
        if (self)
        {
          v93 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLFetchRequestContext alloc], "initWithRequest:context:sqlCore:", a3, a4, self);
          v94 = (id)objc_msgSend(a4, "_delegate");
          if (v94 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v94, "managedObjectContext:willExecuteFetchRequest:", a4, a3);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v93, 0);
          v95 = -[NSSQLStoreRequestContext result](v93, "result");
          if (v93)
            v96 = v93->super._exception;
          else
            v96 = 0;
          exception = v96;
          if (v93)
            error = v93->super._error;
          else
            error = 0;
          v21 = error;
          if (v94 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v98 = -[NSSQLFetchRequestContext fetchStatement](v93, "fetchStatement");
            v99 = -[NSSQLiteStatement sqlString](v98, "sqlString");
            v100 = -[NSSQLiteStatement bindVariables](v98, "bindVariables");
            if (v95)
              v101 = objc_msgSend(v95, "count");
            else
              v101 = -1;
            objc_msgSend(v94, "managedObjectContext:didExecuteFetchRequest:withSQLString:bindVariables:rowCount:", a4, a3, v99, v100, v101);
          }

          if (v95)
          {
LABEL_171:
            v21 = 0;
          }
          else
          {
            if (exception)
              objc_exception_throw(exception);
            if (!v21)
            {
              v150 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
              _NSCoreDataLog(17, v150, v151, v152, v153, v154, v155, v156, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
              v157 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v186 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
                v187 = 1024;
                v188 = 2644;
                _os_log_fault_impl(&dword_18A253000, v157, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
              }
              goto LABEL_171;
            }
          }
          v29 = (NSPersistentCloudKitContainerEventResult *)v95;
          goto LABEL_175;
        }
        v21 = 0;
        v29 = 0;
LABEL_175:
        v149 = (void *)objc_msgSend(a3, "_asyncResultHandle");
        if (v149 && objc_msgSend(v149, "_isCancelled"))
        {
          v21 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v171, 3072, 0);
          v29 = 0;
          v7 = 0;
        }
        v6 = 1;
        goto LABEL_197;
      case 2:
        if (!self)
        {
          v21 = 0;
          v29 = 0;
          goto LABEL_82;
        }
        v23 = -[NSSQLSaveChangesRequestContext initWithRequest:context:sqlCore:]([NSSQLSaveChangesRequestContext alloc], "initWithRequest:context:sqlCore:", a3, a4, self);
        p_isa = (id *)&v23->super.super.isa;
        if (!v23)
        {
          savePlan = 0;
          ++self->_transactionInMemorySequence;
          v26 = 1;
LABEL_31:
          v28 = (id)NSArray_EmptyArray;
          goto LABEL_79;
        }
        savePlan = v23->_savePlan;
        ++self->_transactionInMemorySequence;
        v26 = savePlan == 0;
        if (savePlan)
          savePlan->_transactionInMemorySequence = self->_transactionInMemorySequence;
        if (!v23->_metadataToWrite)
        {
          v27 = v23->_savePlan;
          if (!v27 || (*(_BYTE *)&v27->_flags & 2) == 0)
            goto LABEL_31;
        }
        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v23, 0);
        v66 = (id)objc_msgSend(p_isa, "result");
        v67 = p_isa[6];
        if (!v66 && v67)
          objc_exception_throw(v67);
        self->_metadataIsClean = 1;
        -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 0);
        v28 = v66;
LABEL_79:
        -[NSPersistentStore doFilesystemCleanupOnRemove:](self, "doFilesystemCleanupOnRemove:", 0);
        v68 = (void *)MEMORY[0x1E0CB37C0];
        v69 = (void *)MEMORY[0x1E0C99D80];
        v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
        if (v26)
          transactionInMemorySequence = 0;
        else
          transactionInMemorySequence = savePlan->_transactionInMemorySequence;
        v72 = objc_msgSend(v68, "notificationWithName:object:userInfo:", CFSTR("_NSSQLCoreTransactionStateChangeNotification"), self, objc_msgSend(v69, "dictionaryWithObjectsAndKeys:", v70, CFSTR("_NSSQLCoreTransactionType"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", transactionInMemorySequence), CFSTR("_NSSQLCoreTransientSequenceNumber"), a4, CFSTR("_NSSQLCoreActiveSavingContext"), 0));
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v72);

        v29 = (NSPersistentCloudKitContainerEventResult *)v28;
        v21 = 0;
LABEL_82:
        v6 = 2;
        goto LABEL_197;
      case 3:
LABEL_5:
        if (self)
        {
          if (_sqlCoreLookupSQLEntityForEntityDescription(self, (_QWORD *)objc_msgSend(a3, "entity")))
          {
            v9 = (void *)objc_msgSend(a3, "predicate");
            if (v9)
              objc_msgSend(v9, "minimalFormInContext:", 0);
            v10 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLCountRequestContext alloc], "initWithRequest:context:sqlCore:", a3, a4, self);
            -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v10, 0);
            v11 = -[NSSQLStoreRequestContext result](v10, "result");
            if (v10)
              v12 = v10->super.super._exception;
            else
              v12 = 0;
            v13 = v12;

            if (!v11 && v13)
              objc_exception_throw(v13);
            v14 = (NSPersistentCloudKitContainerEventResult *)v11;
          }
          else
          {
            v14 = (NSPersistentCloudKitContainerEventResult *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0));
          }
          v29 = v14;
          v21 = 0;
        }
        else
        {
          v21 = 0;
          v29 = 0;
        }
        v6 = 3;
        goto LABEL_197;
      case 4:
        v21 = 0;
        if (self)
          v29 = (NSPersistentCloudKitContainerEventResult *)NSArray_EmptyArray;
        else
          v29 = 0;
        v6 = 4;
        goto LABEL_197;
      case 5:
        if (self)
        {
          v15 = -[NSSQLBatchInsertRequestContext initWithRequest:context:sqlCore:]([NSSQLBatchInsertRequestContext alloc], "initWithRequest:context:sqlCore:", a3, a4, self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v15, 0);
          v16 = -[NSSQLStoreRequestContext result](v15, "result");
          if (v15)
            v17 = v15->super.super._exception;
          else
            v17 = 0;
          v18 = v17;
          if (v15)
            v19 = v15->super.super._error;
          else
            v19 = 0;
          v20 = v19;

          if (v16)
          {
            v21 = 0;
          }
          else
          {
            if (v18)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v162 = v18;
                objc_exception_throw(v18);
              }
              v102 = (NSError *)-[NSException errorObjectWithUserInfo:](v18, "errorObjectWithUserInfo:", 0);
            }
            else
            {
              v102 = v20;
            }
            v21 = v102;
          }
          v29 = (NSPersistentCloudKitContainerEventResult *)v16;
          if (v21 && a3 && (*((_QWORD *)a3 + 4) || *((_QWORD *)a3 + 5)))
            v7 = 0;
        }
        else
        {
          v21 = 0;
          v29 = 0;
        }
        v6 = 5;
        goto LABEL_197;
      case 6:
        if (self)
        {
          v37 = -[NSSQLBatchUpdateRequestContext initWithRequest:context:sqlCore:]([NSSQLBatchUpdateRequestContext alloc], "initWithRequest:context:sqlCore:", a3, a4, self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v37, 0);
          v38 = -[NSSQLStoreRequestContext result](v37, "result");
          if (v37)
            v39 = v37->super.super._exception;
          else
            v39 = 0;
          v40 = v39;
          if (v37)
            v41 = v37->super.super._error;
          else
            v41 = 0;
          v42 = v41;

          if (v38)
          {
            v21 = 0;
          }
          else
          {
            if (v40)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v163 = v40;
                objc_exception_throw(v40);
              }
              v103 = (NSError *)-[NSException errorObjectWithUserInfo:](v40, "errorObjectWithUserInfo:", 0);
            }
            else
            {
              v103 = v42;
            }
            v21 = v103;
          }
          v29 = (NSPersistentCloudKitContainerEventResult *)v38;
        }
        else
        {
          v21 = 0;
          v29 = 0;
        }
        v6 = 6;
        goto LABEL_197;
      case 7:
        if (self)
        {
          v43 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]([NSSQLBatchDeleteRequestContext alloc], "initWithRequest:context:sqlCore:", a3, a4, self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v43, 0);
          v44 = -[NSSQLStoreRequestContext result](v43, "result");
          if (v43)
            v45 = v43->super.super._exception;
          else
            v45 = 0;
          v46 = v45;
          if (v43)
            v47 = v43->super.super._error;
          else
            v47 = 0;
          v48 = v47;

          if (v44)
          {
            v21 = 0;
          }
          else
          {
            if (v46)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v164 = v46;
                objc_exception_throw(v46);
              }
              v104 = (NSError *)-[NSException errorObjectWithUserInfo:](v46, "errorObjectWithUserInfo:", 0);
            }
            else
            {
              v104 = v48;
            }
            v21 = v104;
          }
          v29 = (NSPersistentCloudKitContainerEventResult *)v44;
        }
        else
        {
          v21 = 0;
          v29 = 0;
        }
        v6 = 7;
        goto LABEL_197;
      case 8:
        if (!self)
          goto LABEL_128;
        if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 4) == 0)
        {
          v30 = -[NSSQLCore identifier](self, "identifier");
          -[NSPersistentStore URL](self, "URL");
          _NSCoreDataLog(1, (uint64_t)CFSTR("History Change Request failed as no history tracking option detected on store %@ at %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v30);
          v21 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v171, 134091, &unk_1E1F4AEF8);
          if (v21)
            goto LABEL_39;
          v105 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v105, v106, v107, v108, v109, v110, v111, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
          v112 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            goto LABEL_128;
          *(_DWORD *)buf = 136315394;
          v186 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
          v187 = 1024;
          v188 = 2449;
          v146 = v112;
LABEL_205:
          _os_log_fault_impl(&dword_18A253000, v146, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_128:
          v21 = 0;
          v29 = 0;
          goto LABEL_191;
        }
        v83 = (NSPersistentHistoryChangeRequest *)a3;
        if (objc_msgSend(a3, "token"))
        {
          v84 = (void *)objc_msgSend((id)objc_msgSend(a3, "token"), "storeTokens");
          if (!objc_msgSend(v84, "objectForKey:", -[NSSQLCore identifier](self, "identifier")))
          {
            v135 = (void *)MEMORY[0x1E0CB35C8];
            v182 = CFSTR("Reason");
            v136 = (void *)MEMORY[0x1E0CB3940];
            v137 = objc_msgSend(a3, "token");
            v181 = -[NSSQLCore identifier](self, "identifier");
            v183 = objc_msgSend(v136, "stringWithFormat:", CFSTR("Unable to find stores referenced in History Token (%@) - %@"), v137, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v181, 1));
            v21 = (NSError *)objc_msgSend(v135, "errorWithDomain:code:userInfo:", v171, 134501, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
            if (v21)
            {
LABEL_39:
              v22 = 0;
              goto LABEL_185;
            }
            v138 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v138, v139, v140, v141, v142, v143, v144, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            v145 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              goto LABEL_128;
            *(_DWORD *)buf = 136315394;
            v186 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
            v187 = 1024;
            v188 = 2456;
            v146 = v145;
            goto LABEL_205;
          }
          exceptiona = (id)objc_msgSend(a3, "resultType");
          v85 = objc_msgSend(v84, "objectForKey:", -[NSSQLCore identifier](self, "identifier"));
          v86 = objc_msgSend(a3, "fetchLimit");
          exception_object = (_Unwind_Exception *)objc_msgSend(a3, "fetchBatchSize");
          v83 = -[NSPersistentHistoryChangeRequest initWithTransactionID:delete:transactionOnly:percentageOfDB:]([NSPersistentHistoryChangeRequest alloc], "initWithTransactionID:delete:transactionOnly:percentageOfDB:", v85, objc_msgSend(a3, "isDelete"), objc_msgSend(a3, "isFetchTransactionForToken"), objc_msgSend(a3, "percentageOfDB"));
          -[NSPersistentHistoryChangeRequest setResultType:](v83, "setResultType:", exceptiona);
          -[NSPersistentHistoryChangeRequest setFetchLimit:](v83, "setFetchLimit:", v86);
          -[NSPersistentHistoryChangeRequest setFetchBatchSize:](v83, "setFetchBatchSize:", exception_object);
          -[NSPersistentStoreRequest setAffectedStores:](v83, "setAffectedStores:", objc_msgSend(a3, "affectedStores"));
          -[NSPersistentHistoryChangeRequest setFetchRequest:](v83, "setFetchRequest:", objc_msgSend(a3, "fetchRequest"));
        }
        v87 = -[NSSQLPersistentHistoryChangeRequestContext initWithRequest:context:sqlCore:]([NSSQLPersistentHistoryChangeRequestContext alloc], "initWithRequest:context:sqlCore:", v83, a4, self);
        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v87, 0);
        v88 = -[NSSQLStoreRequestContext result](v87, "result");
        if (v87)
          v89 = v87->super._exception;
        else
          v89 = 0;
        v90 = v89;
        if (v87)
          v91 = v87->super._error;
        else
          v91 = 0;
        v92 = v91;

        if (v88)
        {
          v21 = 0;
        }
        else
        {
          if (v90)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v165 = v90;
              objc_exception_throw(v90);
            }
            v126 = (NSError *)-[NSException errorObjectWithUserInfo:](v90, "errorObjectWithUserInfo:", 0);
          }
          else
          {
            v126 = v92;
          }
          v21 = v126;
        }
        v158 = (NSSQLiteIndexStatisticsResult *)v88;
        v29 = (NSPersistentCloudKitContainerEventResult *)v158;
        if (v21)
        {
          v22 = v158;
LABEL_185:
          if (-[NSError code](v21, "code") == 134091
            || -[NSError code](v21, "code") == 134501
            || -[NSError code](v21, "code") == 134301)
          {
            v7 = 0;
          }
          v6 = 8;
          goto LABEL_190;
        }
LABEL_191:
        v6 = 8;
        goto LABEL_197;
      case 9:
        if (self)
        {
          v175 = 0;
          v49 = (NSPersistentStoreResult *)-[NSPersistentStore mirroringDelegate](self, "mirroringDelegate");
          v50 = v49;
          if (v49)
            v51 = -[NSCloudKitMirroringDelegate executeMirroringRequest:error:](v49, a3, (uint64_t *)&v175);
          else
            v51 = objc_alloc_init(NSPersistentStoreResult);
          v29 = (NSPersistentCloudKitContainerEventResult *)v51;

          if (v29)
            goto LABEL_115;
          v21 = v175;
          if (!v175)
          {
            v127 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v127, v128, v129, v130, v131, v132, v133, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            v134 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v186 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
              v187 = 1024;
              v188 = 5031;
              _os_log_fault_impl(&dword_18A253000, v134, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
LABEL_115:
            v21 = 0;
          }
        }
        else
        {
          v21 = 0;
          v29 = 0;
        }
        v7 = 0;
        v6 = 9;
        goto LABEL_197;
      case 10:
        if (self)
        {
          if ((*((_BYTE *)&self->_sqlCoreFlags + 2) & 1) == 0)
          {
            v22 = 0;
            v21 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v171, 134091, &unk_1E1F4AF20);
            goto LABEL_138;
          }
          v75 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_ancillaryModels, "objectForKeyedSubscript:", CFSTR("NSPersistentStoreTrackIndexUseOptionKey")), "entitiesByName");
          v76 = (objc_class *)objc_opt_class();
          v77 = objc_msgSend(v75, "objectForKeyedSubscript:", NSStringFromClass(v76));
          v78 = objc_alloc_init(NSFetchRequest);
          -[NSFetchRequest setEntity:](v78, "setEntity:", v77);
          -[NSFetchRequest setResultType:](v78, "setResultType:", 2);
          v79 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLFetchRequestContext alloc], "initWithRequest:context:sqlCore:", v78, a4, self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v79, 0);
          v80 = -[NSSQLStoreRequestContext result](v79, "result");
          if (v79)
            v81 = v79->super._exception;
          else
            v81 = 0;
          v82 = v81;

          if (v80)
          {
            if (!objc_msgSend(v80, "count"))
            {
              v21 = 0;
              v22 = (NSSQLiteIndexStatisticsResult *)NSArray_EmptyArray;
              goto LABEL_138;
            }
          }
          else if (v82)
          {
            objc_exception_throw(v82);
          }
          v113 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v178 = 0u;
          v179 = 0u;
          v176 = 0u;
          v177 = 0u;
          v114 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v176, v184, 16);
          if (v114)
          {
            v115 = *(_QWORD *)v177;
            do
            {
              for (i = 0; i != v114; ++i)
              {
                if (*(_QWORD *)v177 != v115)
                  objc_enumerationMutation(v80);
                objc_msgSend(v113, "addObject:", -[NSSQLiteIndexStatistics initWithResultDictionary:storeID:]([NSSQLiteIndexStatistics alloc], "initWithResultDictionary:storeID:", *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * i), -[NSSQLCore identifier](self, "identifier")));
              }
              v114 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v176, v184, 16);
            }
            while (v114);
          }

          v117 = -[NSSQLiteIndexStatisticsResult initWithResult:]([NSSQLiteIndexStatisticsResult alloc], "initWithResult:", v113);
          v21 = 0;
          v22 = v117;
        }
        else
        {
          v21 = 0;
          v22 = 0;
        }
LABEL_138:
        v6 = 10;
LABEL_190:
        v29 = (NSPersistentCloudKitContainerEventResult *)v22;
        goto LABEL_197;
      case 11:
        if (self)
        {
          v52 = objc_msgSend(a3, "resultType");
          v53 = -[NSPersistentStore mirroringDelegate](self, "mirroringDelegate");
          if (v53
            && v53[144]
            && (v54 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_ancillaryModels, "objectForKeyedSubscript:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey")), "entitiesByName"), v55 = (objc_class *)objc_opt_class(), (v56 = objc_msgSend(v54, "objectForKeyedSubscript:", NSStringFromClass(v55))) != 0))
          {
            if (a3)
            {
              objc_msgSend(*((id *)a3 + 3), "setEntity:", v56);
              objc_msgSend(*((id *)a3 + 3), "setReturnsObjectsAsFaults:", 0);
              v57 = (void *)*((_QWORD *)a3 + 3);
            }
            else
            {
              objc_msgSend(0, "setEntity:", v56);
              objc_msgSend(0, "setReturnsObjectsAsFaults:", 0);
              v57 = 0;
            }
            objc_msgSend(v57, "setResultType:", 4 * (v52 == 1));
            v58 = off_1E1EDACF0;
            if (v52 != 1)
              v58 = off_1E1EDAD10;
            v59 = objc_alloc(*v58);
            if (a3)
              v60 = *((_QWORD *)a3 + 3);
            else
              v60 = 0;
            v61 = (_QWORD *)objc_msgSend(v59, "initWithRequest:context:sqlCore:", v60, a4, self);
            -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v61, 0);
            v62 = (id)objc_msgSend(v61, "result");
            if (v61)
              v63 = (void *)v61[6];
            else
              v63 = 0;
            v64 = v63;

            if (!v62 && v64)
              objc_exception_throw(v64);
            if (!v62)
            {
              v118 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
              _NSCoreDataLog(17, v118, v119, v120, v121, v122, v123, v124, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
              v125 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v186 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
                v187 = 1024;
                v188 = 5087;
                _os_log_fault_impl(&dword_18A253000, v125, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
              }
              goto LABEL_141;
            }
            if (v52)
            {
              if (v52 == 1)
              {
                v65 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:]([NSPersistentCloudKitContainerEventResult alloc], "initWithResult:ofType:", v62, 1);
                goto LABEL_193;
              }
LABEL_141:
              v74 = 0;
            }
            else if (objc_msgSend(v62, "count"))
            {
              v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v62, "count"));
              v180[0] = MEMORY[0x1E0C809B0];
              v180[1] = 3221225472;
              v180[2] = __66__NSSQLCore_processCloudKitContainerEventRequest_inContext_error___block_invoke;
              v180[3] = &unk_1E1EDF720;
              v180[4] = v147;
              objc_msgSend(v62, "enumerateObjectsUsingBlock:", v180);
              v148 = (void *)objc_msgSend(v147, "copy");
              v74 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:]([NSPersistentCloudKitContainerEventResult alloc], "initWithResult:ofType:", v148, 0);

            }
            else
            {
              v159 = [NSPersistentCloudKitContainerEventResult alloc];
              v65 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:](v159, "initWithResult:ofType:", NSArray_EmptyArray, 0);
LABEL_193:
              v74 = v65;
            }

          }
          else
          {
            v73 = [NSPersistentCloudKitContainerEventResult alloc];
            v74 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:](v73, "initWithResult:ofType:", NSArray_EmptyArray, v52);
          }
          v29 = v74;
          goto LABEL_196;
        }
        v29 = 0;
LABEL_196:
        v21 = 0;
        v6 = 11;
LABEL_197:
        v160 = v174;
        if (v21)
          v161 = v174 == 0;
        else
          v161 = 0;
        if (v161)
          v160 = v21;
        v174 = v160;
        if (v29)
          return v29;
        break;
      default:
        v21 = 0;
        v29 = 0;
        goto LABEL_197;
    }
  }
  v29 = 0;
  if (a5 && v174)
  {
    v29 = 0;
    *a5 = v174;
  }
  return v29;
}

uint64_t __32__NSSQLCore__loadAndSetMetadata__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __40__NSSQLCore__ensureDatabaseMatchesModel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  char v19;
  char v20;
  int v21;
  const char *v22;
  NSSQLColumn *v23;
  id v24;
  NSSQLiteStatement *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSSQLiteStatement *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  id *v68;
  uint64_t v69;
  unint64_t v70;
  const __CFArray *v71;
  const __CFArray *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  NSSQLLocationAttributeRTreeExtension *v106;
  NSSQLLocationAttributeRTreeExtension *v107;
  NSArray *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t k;
  NSSQLiteStatement *v112;
  NSArray *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t m;
  NSSQLiteStatement *v117;
  NSArray *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t n;
  NSSQLiteStatement *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t ii;
  uint64_t v127;
  uint64_t v128;
  uint64_t jj;
  char v130;
  const char *v131;
  int v132;
  off_t st_size;
  CFMutableArrayRef v134;
  CFMutableArrayRef v135;
  id v136;
  id v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id *v155;
  void *v156;
  uint64_t v157;
  unint64_t v158;
  void *v159;
  char v160;
  int v161;
  int hasPersistentHistory;
  int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSObject *v172;
  int v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  id *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  id *v186;
  uint64_t v187;
  unint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  void *v200;
  unint64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t mm;
  _QWORD *v208;
  NSSQLiteStatement *v209;
  char v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  CFMutableArrayRef v217;
  BOOL v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t kk;
  _QWORD *v224;
  NSSQLiteStatement *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  __CFString *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  const __CFString *v242;
  id v243;
  id obj;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char v249;
  NSSQLLocationAttributeRTreeExtension *v250;
  uint64_t v251;
  id v252;
  uint64_t v253;
  uint64_t v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  id v283;
  stat v284;
  statfs v285;
  _BYTE v286[128];
  _BYTE v287[128];
  _QWORD v288[16];
  _QWORD v289[16];
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  uint8_t buf[16];
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  uint64_t v302;

  v302 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!v1 || !-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, (uint64_t)CFSTR("Z_METADATA"), 0))
    return;
  v2 = *(id **)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "model");
    if (v4)
      v5 = *(void **)(v4 + 40);
    else
      v5 = 0;
    v6 = objc_msgSend(v2[19], "objectForKey:", CFSTR("NSStoreModelVersionHashes"));
    if (v6)
    {
      v7 = (void *)v6;
      v297 = 0u;
      v296 = 0u;
      v295 = 0u;
      *(_OWORD *)buf = 0u;
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", buf, &v285, 16);
      if (!v8)
        goto LABEL_26;
      v9 = *(_QWORD *)v295;
LABEL_9:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v295 != v9)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(v7, "objectForKey:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&buf[8] + 8 * v10) + 24), "name")))break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", buf, &v285, 16);
          if (v8)
            goto LABEL_9;
          goto LABEL_26;
        }
      }
    }
    -[NSSQLiteConnection connect]((uint64_t)v3);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSSQLiteConnection fetchTableNames](v3));
    v293 = 0u;
    v292 = 0u;
    v291 = 0u;
    v290 = 0u;
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v290, &v284, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v291;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v291 != v13)
            objc_enumerationMutation(v5);
          v15 = *(_QWORD **)(*((_QWORD *)&v290 + 1) + 8 * i);
          if (v15
            && !v15[20]
            && (objc_msgSend(v11, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v290 + 1) + 8 * i), "tableName")) & 1) == 0)
          {
            v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find table for entity '%@' in database at URL '%@'"), objc_msgSend((id)objc_msgSend(v15, "entityDescription"), "name"), objc_msgSend(v2, "URL"));
            v289[0] = v64;
            v65 = *MEMORY[0x1E0CB2AA0];
            v288[0] = CFSTR("message");
            v288[1] = v65;
            v289[1] = objc_msgSend((id)objc_msgSend(v2, "URL"), "path");
            v66 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v289, v288, 2);
            v67 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134020, v64, v66);
            objc_exception_throw(v67);
          }
        }
        v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v290, &v284, 16);
      }
      while (v12);
    }
  }
LABEL_26:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
  {
    v17 = *(_QWORD **)(a1 + 32);
    v18 = (void *)objc_msgSend(*(id *)(v16 + 152), "objectForKey:", 0x1E1EF14B0);
    objc_msgSend(v18, "unsignedIntegerValue");
    if ((int)objc_msgSend(v18, "intValue") >= 901
      && (int)objc_msgSend(v18, "intValue") <= 966
      && (objc_msgSend((id)v16, "isReadOnly") & 1) == 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v16, "URL"), "path"), "hasSuffix:", CFSTR("com.apple.security.keychain-defaultContext.TrustedPeersHelper.db")))
    {
      v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v16, "metadata"), "objectForKey:", CFSTR("NSStoreModelVersionHashes")), "allKeys"), "containsObject:", CFSTR("Machine"));
      v20 = v17 ? v19 : 1;
      if ((v20 & 1) == 0
        && -[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v17, (uint64_t)CFSTR("ZMACHINE"), 0))
      {
        -[NSSQLiteConnection _dropTableWithName:]((uint64_t)v17, (uint64_t)CFSTR("ZMACHINE"));
      }
    }
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v16, "options"), "allKeys"), "containsObject:", CFSTR("NSXPCStoreListener")) & 1) != 0|| !objc_msgSend((id)v16, "_persistentStoreCoordinator")|| (objc_msgSend((id)v16, "isReadOnly") & 1) != 0|| (int)objc_msgSend(v18, "intValue") >= 619&& ((int)objc_msgSend(v18, "intValue") < 960 || (int)objc_msgSend(v18, "intValue") > 971))
    {
      v21 = 0;
    }
    else
    {
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(v16 + 152), "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreRebuildIndicies"));
      *(_BYTE *)(v16 + 188) = 0;
      objc_msgSend((id)v16, "_setMetadataDirty:", 1);
      os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 144));
      v57 = objc_msgSend((id)v16, "identifier");
      _NSCoreDataLog(2, (uint64_t)CFSTR("Rebuilding indicies for store - %@"), v58, v59, v60, v61, v62, v63, v57);
      v21 = 1;
    }
    if ((int)objc_msgSend(v18, "intValue") >= 1002
      && (int)objc_msgSend(v18, "intValue") <= 1004
      && (objc_msgSend((id)v16, "isReadOnly") & 1) == 0
      && objc_msgSend((id)v16, "model"))
    {
      v22 = getprogname();
      if (v22
        && (!strncmp("assetsd", v22, 7uLL) || !strncmp("photolibraryd", v22, 0xDuLL))
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v16, "URL"), "lastPathComponent"), "isEqualToString:", CFSTR("Photos.sqlite")))
      {
        v23 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("COUNT(*)"), 1);
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v23, 0);

        v242 = CFSTR("ZSHAREPARTICIPANT");
        v25 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM (SELECT * FROM %@ WHERE Z_ENT = 0 LIMIT 1)")));
        LODWORD(v23) = -[NSSQLiteConnection selectCountWithStatement:]((uint64_t)v17, v25);

        -[NSSQLiteConnection setColumnsToFetch:](v17, v24);
        if ((_DWORD)v23)
        {
          v26 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v17);
          if (objc_msgSend(v26, "count"))
          {
            v27 = objc_msgSend((id)objc_msgSend(v26, "objectAtIndex:", 0), "unsignedIntValue");

            if (v27)
            {
              _NSCoreDataLog(2, (uint64_t)CFSTR("Corruption encountered during a past migration - DB integrity has been compromised."), v28, v29, v30, v31, v32, v33, (uint64_t)CFSTR("ZSHAREPARTICIPANT"));
              v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              memset(&v284, 0, 64);
              v35 = objc_msgSend((id)v16, "model");
              if (v35)
                v36 = *(void **)(v35 + 40);
              else
                v36 = 0;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v284, &v285, 16);
              if (v37)
              {
                v38 = **(_QWORD **)&v284.st_uid;
                do
                {
                  for (j = 0; j != v37; ++j)
                  {
                    if (**(_QWORD **)&v284.st_uid != v38)
                      objc_enumerationMutation(v36);
                    v40 = *(void **)(v284.st_ino + 8 * j);
                    if (objc_msgSend((id)objc_msgSend(v40, "tableName"), "isEqualToString:", CFSTR("ZSHAREPARTICIPANT")))objc_msgSend(v34, "addObject:", v40);
                  }
                  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v284, &v285, 16);
                }
                while (v37);
              }
              if (objc_msgSend(v34, "count") == 1)
              {
                objc_msgSend(v34, "firstObject");
                _NSCoreDataLog(2, (uint64_t)CFSTR("Attempting Repair - One entity found for table - %@ setting Z_ENT = %u"), v47, v48, v49, v50, v51, v52, (uint64_t)CFSTR("ZSHAREPARTICIPANT"));
                -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v17, 0);
                v53 = (void *)MEMORY[0x1E0CB3940];
                v54 = objc_msgSend(v34, "firstObject");
                if (v54)
                  v55 = *(unsigned int *)(v54 + 184);
                else
                  v55 = 0;
                v56 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", objc_msgSend(v34, "firstObject"), objc_msgSend(v53, "stringWithFormat:", CFSTR("UPDATE OR FAIL %@ SET Z_ENT = %u"), CFSTR("ZSHAREPARTICIPANT"), v55));
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v17, v56);

              }
              else
              {
                _NSCoreDataLog(2, (uint64_t)CFSTR("Unable to Repair - More than one entity found for table - %@ Entites - %@"), v41, v42, v43, v44, v45, v46, (uint64_t)CFSTR("ZSHAREPARTICIPANT"));
              }
            }
          }
        }
        -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v17, 0);
      }
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v17, 0);
    }
    if (v21)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v68 = *(id **)(a1 + 40);
  if (!v68)
    goto LABEL_245;
  v69 = *(_QWORD *)(a1 + 32);
  v70 = objc_msgSend((id)objc_msgSend(v68[19], "objectForKey:"), "unsignedIntegerValue");
  if (objc_msgSend(v68, "_persistentStoreCoordinator"))
  {
    if (v70 <= 0xB9 && (objc_msgSend(v68, "isReadOnly") & 1) == 0)
    {
      v71 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v69, CFSTR("pragma auto_vacuum"));
      v72 = v71;
      if (v71)
      {
        if (*(uint64_t *)CFArrayGetValueAtIndex(v71, 0) < 1 || *(_QWORD *)CFArrayGetValueAtIndex(v72, 1))
        {
          CFRelease(v72);
        }
        else
        {
          CFRelease(v72);
          v131 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "URL"), "path"), "fileSystemRepresentation");
          memset(&v285, 0, 512);
          memset(&v284, 0, sizeof(v284));
          v132 = access(v131, 6);
          if (stat(v131, &v284) || (st_size = v284.st_size) == 0 || statfs(v131, &v285))
          {
            if (v132)
              goto LABEL_89;
          }
          else if (v132 || (int64_t)(v285.f_bavail * v285.f_bsize) <= st_size)
          {
            goto LABEL_89;
          }
          v134 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v69, CFSTR("pragma auto_vacuum=1"));
          if (v134)
            CFRelease(v134);
          v135 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v69, CFSTR("vacuum"));
          if (v135)
            CFRelease(v135);
          -[NSSQLiteConnection disconnect](v69);
          -[NSSQLiteConnection connect](v69);
        }
      }
    }
  }
LABEL_89:
  v73 = *(void **)(a1 + 40);
  if (v73)
  {
    v74 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(*(id *)(a1 + 40), "_persistentStoreCoordinator"))
    {
      if ((objc_msgSend(v73, "isReadOnly") & 1) == 0)
      {
        -[NSSQLiteConnection connect](v74);
        if (!v74 || (-[NSSQLiteConnection _hasTableWithName:isTemp:](v74, (uint64_t)CFSTR("Z_MODELCACHE"), 0) & 1) == 0)
          -[NSSQLiteConnection saveCachedModel:](v74, objc_msgSend((id)objc_msgSend(v73, "model"), "managedObjectModel"));
      }
    }
    v75 = *(_QWORD *)(a1 + 40);
    if (v75)
    {
      v76 = *(_QWORD *)(a1 + 32);
      v77 = objc_msgSend((id)objc_msgSend(*(id *)(v75 + 152), "objectForKey:", 0x1E1EF14B0), "unsignedIntegerValue");
      v78 = objc_msgSend((id)v75, "_persistentStoreCoordinator");
      v79 = (void *)v78;
      if (v78 && v77 >= 0x2BD && v77 <= 0x2EA)
      {
        if ((objc_msgSend((id)v75, "isReadOnly") & 1) == 0)
        {
          -[NSSQLiteConnection connect](v76);
          *(_QWORD *)&v285.f_bsize = 0;
          if ((-[NSSQLCore _rebuildTriggerSchemaUsingConnection:recomputeValues:error:](v75, v76, (id *)&v285) & 1) == 0)
          {
            v80 = *(_QWORD *)&v285.f_bsize;
            objc_msgSend(*(id *)&v285.f_bsize, "userInfo");
            _NSCoreDataLog(1, (uint64_t)CFSTR("Repairing old triggers failed with error = %@ and userInfo = %@"), v81, v82, v83, v84, v85, v86, v80);
          }
          goto LABEL_202;
        }
      }
      else if (!v78)
      {
LABEL_171:
        if ((objc_msgSend((id)v75, "isReadOnly")
           || v77 < 0x3BE
           || v77 > 0x44B
           || !-[NSManagedObjectModel _hasEntityWithDerivedAttribute](objc_msgSend(v79, "managedObjectModel")))
          && ((objc_msgSend((id)v75, "isReadOnly") & 1) != 0
           || v77 > 0x4BC
           || !-[NSManagedObjectModel _hasEntityWithDerivedAttribute](objc_msgSend(v79, "managedObjectModel"))))
        {
LABEL_203:
          v154 = *(_QWORD *)(a1 + 40);
          if (!v154)
            goto LABEL_245;
          v155 = *(id **)(a1 + 32);
          v156 = (void *)objc_msgSend(*(id *)(v154 + 152), "objectForKey:", 0x1E1EF14B0);
          v157 = objc_msgSend((id)v154, "_persistentStoreCoordinator");
          v158 = objc_msgSend(v156, "unsignedIntegerValue");
          v159 = (void *)objc_msgSend(*(id *)(v154 + 224), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
          v160 = objc_msgSend((id)v154, "isReadOnly");
          if (!v157 || (v160 & 1) != 0)
            goto LABEL_242;
          v161 = *(_DWORD *)(v154 + 192);
          hasPersistentHistory = -[NSSQLiteConnection _hasPersistentHistoryTables]((uint64_t)v155);
          v163 = hasPersistentHistory;
          if ((v161 & 0x400) == 0)
          {
            if (hasPersistentHistory && -[NSSQLiteConnection hasHistoryRows]((_BOOL8)v155))
            {
              v164 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Store opened without NSPersistentHistoryTrackingKey but previously had been opened with NSPersistentHistoryTrackingKey - Forcing into Read Only mode store at '%@'");
              v165 = objc_msgSend((id)v154, "URL");
              _NSCoreDataLog(17, v164, v166, v167, v168, v169, v170, v171, v165);
              v172 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                v233 = objc_msgSend((id)v154, "URL");
                v285.f_bsize = 138412290;
                *(_QWORD *)&v285.f_iosize = v233;
                _os_log_fault_impl(&dword_18A253000, v172, OS_LOG_TYPE_FAULT, "CoreData: Store opened without NSPersistentHistoryTrackingKey but previously had been opened with NSPersistentHistoryTrackingKey - Forcing into Read Only mode store at '%@'", (uint8_t *)&v285, 0xCu);
              }
              objc_msgSend((id)v154, "setReadOnly:", 1);
            }
            goto LABEL_242;
          }
          if (v158 - 801 <= 0x16 && -[NSSQLiteConnection _hasOldHistoryTrackingTables]((uint64_t)v155))
          {
            -[NSSQLiteConnection connect]((uint64_t)v155);
            -[NSSQLiteConnection _dropOldHistoryTrackingTables]((uint64_t)v155);
          }
          if (v163)
          {
            if (v158 < 0x334)
            {
LABEL_217:
              -[NSSQLiteConnection connect]((uint64_t)v155);
              -[NSSQLiteConnection dropHistoryTrackingTables](v155);
              LOBYTE(v163) = 0;
              LOBYTE(v173) = 1;
              goto LABEL_231;
            }
            if (v158 <= 0x34C)
            {
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("coreduetd")))goto LABEL_217;
              if (v158 <= 0x345)
              {
                v174 = -[NSSQLiteConnection numberOfTombstones]((uint64_t)v155);
                if (v174 < +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, *(_QWORD **)(v154 + 96)))
                {
                  -[NSSQLiteConnection connect]((uint64_t)v155);
                  v175 = -[NSSQLiteConnection numberOfTombstones]((uint64_t)v155);
                  v176 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, *(_QWORD **)(v154 + 96));
                  -[NSSQLiteConnection addTombstoneColumnsForRange:](v155, v175, v176);
                }
              }
            }
            if (v158 == 914 || v158 == 863)
            {
              -[NSSQLiteConnection connect]((uint64_t)v155);
              v177 = -[NSSQLiteConnection hasAncillaryEntitiesInHistory](v155);
              v184 = (uint64_t)v177;
              if (v177)
              {
                _NSCoreDataLog(1, (uint64_t)CFSTR("found Ancillary Entities in Persistent History - %@"), v178, v179, v180, v181, v182, v183, (uint64_t)v177);
                -[NSSQLiteConnection dropHistoryBeforeTransactionID:](v155, v184);
              }
            }
          }
          v173 = v163 ^ 1;
          if (v158 >= 0x35E && v158 - 900 > 0xC)
          {
            if (!v173)
            {
LABEL_242:
              v186 = *(id **)(a1 + 40);
              if (v186)
              {
                v187 = *(_QWORD *)(a1 + 32);
                v188 = objc_msgSend((id)objc_msgSend(v186[19], "objectForKey:", 0x1E1EF14B0), "unsignedIntegerValue");
                v189 = (void *)objc_msgSend(v186[19], "objectForKey:", 0x1E1EF0E90);
                v190 = getprogname();
                if (v190)
                {
                  if (!strncmp("homed", v190, 5uLL))
                  {
                    if (objc_msgSend(v186, "_persistentStoreCoordinator"))
                    {
                      if (v188 >= 0x4BA)
                      {
                        v210 = objc_msgSend(v186, "isReadOnly");
                        if (v187)
                        {
                          if ((v210 & 1) == 0
                            && -[NSSQLiteConnection _hasTableWithName:isTemp:](v187, (uint64_t)CFSTR("Z_47ACTIONMEDIAPLAYBACKS_"), 0)&& -[NSSQLiteConnection _hasTableWithName:isTemp:](v187, (uint64_t)CFSTR("Z_48ACTIONMEDIAPLAYBACKS_"), 0))
                          {
                            if ((objc_msgSend(v189, "isEqualToString:", CFSTR("7G8C8LDyGsq8nWlygb+W8X+/Cib0xLur8J7eDoPpDg+r21Lp9FSS3Lxq6BtPoouvaSJ1rZ7uYvGBCtGwtaU/IA==")) & 1) != 0|| (objc_msgSend(v189, "isEqualToString:", CFSTR("NdSMhI64y0fcuGTkPpTBUTgUCmv1yHtrblyXGtAcfUtTWLUB/DyCki93Ps2ZydhpvOlS/5cUaUueM7chxR4pWg==")) & 1) != 0|| objc_msgSend(v189, "isEqualToString:", CFSTR("GrkWfiJ5F085geZxp8His1GEvGdt1zwn0jZ+8FYWsccb6+KEIWdCVcNcaa7RAU+X37QwU+10nMCuBCnuT0/zQg==")))
                            {
                              _NSCoreDataLog(1, (uint64_t)CFSTR("Executing schema repair operations for HomeKitModel-882 Z_48ACTIONMEDIAPLAYBACKS_ table"), v211, v212, v213, v214, v215, v216, (uint64_t)v242);
                              v217 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v187, CFSTR("DROP TABLE Z_48ACTIONMEDIAPLAYBACKS_"));
                              if (v217)
                                CFRelease(v217);
                            }
                            else
                            {
                              v234 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown schema hash presents conflicting ACTIONMEDIAPLAYBACKS_ tables: %@");
                              _NSCoreDataLog(17, v234, v235, v236, v237, v238, v239, v240, (uint64_t)v189);
                              v241 = __pflogFaultLog;
                              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                              {
                                v285.f_bsize = 138412290;
                                *(_QWORD *)&v285.f_iosize = v189;
                                _os_log_fault_impl(&dword_18A253000, v241, OS_LOG_TYPE_FAULT, "CoreData: Unknown schema hash presents conflicting ACTIONMEDIAPLAYBACKS_ tables: %@", (uint8_t *)&v285, 0xCu);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              goto LABEL_245;
            }
LABEL_239:
            -[NSSQLiteConnection connect]((uint64_t)v155);
            -[NSSQLiteConnection beginTransaction]((uint64_t)v155);
            if ((-[NSSQLiteConnection _hasPersistentHistoryTables]((uint64_t)v155) & 1) == 0)
              -[NSSQLiteConnection createMissingHistoryTables]((uint64_t)v155);
            -[NSSQLiteConnection commitTransaction]((uint64_t)v155);
            -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v155, 0);
            goto LABEL_242;
          }
LABEL_231:
          -[NSSQLiteConnection connect]((uint64_t)v155);
          if ((v163 & 1) != 0)
          {
            if ((-[NSSQLiteConnection _hasHistoryTransactionStringTable]((uint64_t)v155) & 1) == 0)
            {
              v185 = objc_msgSend(v159, "entityNamed:", CFSTR("TRANSACTIONSTRING"));
              if (v185)
              {
                *(_QWORD *)&v298 = v185;
                -[NSSQLiteConnection createTablesForEntities:]((uint64_t)v155, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v298, 1));
              }
            }
          }
          else
          {
            -[NSSQLiteConnection createMissingHistoryTables]((uint64_t)v155);
            LOBYTE(v173) = 0;
          }
          if ((-[NSSQLiteConnection hasTransactionStringColumnsInTransactionTable]((uint64_t)v155) & 1) == 0)
            -[NSSQLiteConnection addTransactionStringColumnsToTransactionTable](v155);
          if ((v173 & 1) == 0)
            goto LABEL_242;
          goto LABEL_239;
        }
        -[NSSQLiteConnection connect](v76);
        -[NSSQLiteConnection _dropAllDATriggers](v76);
        -[NSSQLCore _rebuildDerivedAttributeTriggerSchemaUsingConnection:recomputeValues:error:](v75, v76);
LABEL_202:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_203;
      }
      if (!objc_msgSend((id)v75, "isReadOnly") && v77 >= 0x385 && v77 <= 0x3BF)
      {
        v254 = v75;
        *(_QWORD *)&v298 = 0;
        v251 = v76;
        -[NSSQLiteConnection connect](v76);
        -[NSSQLiteConnection _dropAllTriggers](v76);
        if ((-[NSSQLCore _rebuildTriggerSchemaUsingConnection:recomputeValues:error:](v75, v76, (id *)&v298) & 1) == 0)
        {
          v87 = v298;
          objc_msgSend((id)v298, "userInfo");
          _NSCoreDataLog(1, (uint64_t)CFSTR("Repairing triggers failed with error = %@ and userInfo = %@"), v88, v89, v90, v91, v92, v93, v87);
        }
        v283 = 0;
        v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v243 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        v281 = 0u;
        v282 = 0u;
        v279 = 0u;
        v280 = 0u;
        v95 = *(_QWORD *)(v75 + 96);
        if (v95)
          v96 = *(void **)(v95 + 32);
        else
          v96 = 0;
        v97 = (void *)objc_msgSend(v96, "allValues");
        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v279, &v284, 16);
        obj = v97;
        if (v98)
        {
          v246 = *(_QWORD *)v280;
          v249 = 1;
          while (2)
          {
            v99 = 0;
            v245 = v98;
            do
            {
              if (*(_QWORD *)v280 != v246)
                objc_enumerationMutation(obj);
              v247 = v99;
              v100 = *(_QWORD **)(*((_QWORD *)&v279 + 1) + 8 * v99);
              v275 = 0u;
              v276 = 0u;
              v277 = 0u;
              v278 = 0u;
              v101 = (void *)objc_msgSend((id)objc_msgSend(v100, "entityDescription"), "properties");
              v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v275, buf, 16);
              v252 = v101;
              if (v102)
              {
                v253 = *(_QWORD *)v276;
LABEL_117:
                v103 = 0;
                while (1)
                {
                  if (*(_QWORD *)v276 != v253)
                    objc_enumerationMutation(v252);
                  v104 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * v103);
                  if (objc_msgSend(v104, "_propertyType") == 2 && !objc_msgSend(v104, "attributeType"))
                  {
                    if (objc_msgSend(v104, "isTransient"))
                    {
                      v105 = objc_msgSend((id)objc_msgSend(-[NSEntityDescription _attributeNamed:](objc_msgSend(v100, "entityDescription"), objc_msgSend(v104, "name")), "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents"));
                      if (v105)
                      {
                        v106 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v105, objc_msgSend(v104, "name"), v100);
                        v107 = v106;
                        if (v106)
                        {
                          if (-[NSSQLLocationAttributeRTreeExtension validate:](v106, "validate:", &v283))
                          {
                            v273 = 0u;
                            v274 = 0u;
                            v271 = 0u;
                            v272 = 0u;
                            v250 = v107;
                            v108 = -[NSSQLLocationAttributeRTreeExtension dropSQLStrings](v107, "dropSQLStrings");
                            v109 = -[NSArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v271, &v290, 16);
                            if (v109)
                            {
                              v110 = *(_QWORD *)v272;
                              do
                              {
                                for (k = 0; k != v109; ++k)
                                {
                                  if (*(_QWORD *)v272 != v110)
                                    objc_enumerationMutation(v108);
                                  v112 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v100, *(_QWORD *)(*((_QWORD *)&v271 + 1) + 8 * k));
                                  objc_msgSend(v94, "addObject:", v112);

                                }
                                v109 = -[NSArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v271, &v290, 16);
                              }
                              while (v109);
                            }
                            v269 = 0u;
                            v270 = 0u;
                            v267 = 0u;
                            v268 = 0u;
                            v113 = -[NSSQLLocationAttributeRTreeExtension insertSQLStrings](v250, "insertSQLStrings");
                            v114 = -[NSArray countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", &v267, v289, 16);
                            if (v114)
                            {
                              v115 = *(_QWORD *)v268;
                              do
                              {
                                for (m = 0; m != v114; ++m)
                                {
                                  if (*(_QWORD *)v268 != v115)
                                    objc_enumerationMutation(v113);
                                  v117 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v100, *(_QWORD *)(*((_QWORD *)&v267 + 1) + 8 * m));
                                  objc_msgSend(v94, "addObject:", v117);

                                }
                                v114 = -[NSArray countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", &v267, v289, 16);
                              }
                              while (v114);
                            }
                            v265 = 0u;
                            v266 = 0u;
                            v263 = 0u;
                            v264 = 0u;
                            v107 = v250;
                            v118 = -[NSSQLLocationAttributeRTreeExtension bulkUpdateSQLStrings](v250, "bulkUpdateSQLStrings");
                            v119 = -[NSArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v263, v288, 16);
                            if (v119)
                            {
                              v120 = *(_QWORD *)v264;
                              do
                              {
                                for (n = 0; n != v119; ++n)
                                {
                                  if (*(_QWORD *)v264 != v120)
                                    objc_enumerationMutation(v118);
                                  v122 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v100, *(_QWORD *)(*((_QWORD *)&v263 + 1) + 8 * n));
                                  objc_msgSend(v94, "addObject:", v122);

                                }
                                v119 = -[NSArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v263, v288, 16);
                              }
                              while (v119);
                              v107 = v250;
                            }
                          }
                          else
                          {
                            v249 = 0;
                          }

                          if ((v249 & 1) == 0)
                            break;
                        }
                      }
                    }
                  }
                  if (++v103 == v102)
                  {
                    v102 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v275, buf, 16);
                    if (v102)
                      goto LABEL_117;
                    break;
                  }
                }
              }
              if ((v249 & 1) == 0)
              {
                v130 = 0;
                goto LABEL_195;
              }
              v261 = 0u;
              v262 = 0u;
              v259 = 0u;
              v260 = 0u;
              v123 = (void *)objc_msgSend(-[NSSQLEntity rtreeIndexes](v100), "allValues");
              v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v259, v287, 16);
              if (v124)
              {
                v125 = *(_QWORD *)v260;
                do
                {
                  for (ii = 0; ii != v124; ++ii)
                  {
                    if (*(_QWORD *)v260 != v125)
                      objc_enumerationMutation(v123);
                    objc_msgSend(v94, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v259 + 1) + 8 * ii), "generateStatementsForStore:", v254));
                  }
                  v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v259, v287, 16);
                }
                while (v124);
              }
              v99 = v247 + 1;
            }
            while (v247 + 1 != v245);
            v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v279, &v284, 16);
            if (v98)
              continue;
            break;
          }
        }
        if (objc_msgSend(v94, "count"))
        {
          -[NSSQLiteConnection beginTransaction](v251);
          v257 = 0u;
          v258 = 0u;
          v255 = 0u;
          v256 = 0u;
          v127 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v255, v286, 16);
          if (v127)
          {
            v128 = *(_QWORD *)v256;
            do
            {
              for (jj = 0; jj != v127; ++jj)
              {
                if (*(_QWORD *)v256 != v128)
                  objc_enumerationMutation(v94);
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v251, *(_QWORD **)(*((_QWORD *)&v255 + 1) + 8 * jj));
              }
              v127 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v255, v286, 16);
            }
            while (v127);
          }
          v130 = 1;
          -[NSSQLiteConnection commitTransaction](v251);
        }
        else
        {
          v130 = 1;
        }
LABEL_195:
        -[NSSQLiteConnection endFetchAndRecycleStatement:](v251, 0);
        v136 = v283;

        v137 = 0;
        v138 = v283;
        if ((v130 & 1) == 0)
        {
          if (v283)
          {
            *(_QWORD *)&v298 = v283;
          }
          else
          {
            v139 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v139, v140, v141, v142, v143, v144, v145, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            v146 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v285.f_bsize = 136315394;
              *(_QWORD *)&v285.f_iosize = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
              WORD2(v285.f_blocks) = 1024;
              *(_DWORD *)((char *)&v285.f_blocks + 6) = 5523;
              _os_log_fault_impl(&dword_18A253000, v146, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", (uint8_t *)&v285, 0x12u);
            }
          }
          v147 = v298;
          objc_msgSend((id)v298, "userInfo");
          _NSCoreDataLog(1, (uint64_t)CFSTR("Repairing RTree triggers failed with error = %@ and userInfo = %@"), v148, v149, v150, v151, v152, v153, v147);
        }
        -[NSSQLCore _rebuildDerivedAttributeTriggerSchemaUsingConnection:recomputeValues:error:](v254, v251);
        goto LABEL_202;
      }
      goto LABEL_171;
    }
  }
LABEL_245:
  v191 = a1;
  if (objc_msgSend(*(id *)(a1 + 40), "_persistentStoreCoordinator")
    && (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 194) & 1) != 0
    && (-[NSSQLiteConnection setUpIndexTracking](*(id **)(a1 + 32)) & 1) == 0)
  {
    _NSCoreDataLog(2, (uint64_t)CFSTR("failed to set up index tracking, disabling"), v192, v193, v194, v195, v196, v197, (uint64_t)v242);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 192) &= ~0x10000u;
  }
  v198 = *(_QWORD *)(a1 + 40);
  if (!v198)
    goto LABEL_292;
  v199 = *(_QWORD **)(a1 + 32);
  v200 = (void *)objc_msgSend(*(id *)(v198 + 152), "objectForKey:", 0x1E1EF14B0);
  v201 = objc_msgSend(v200, "unsignedIntegerValue");
  if (objc_msgSend((id)v198, "_persistentStoreCoordinator")
    && (int)objc_msgSend(v200, "intValue") <= 639
    && (objc_msgSend((id)v198, "isReadOnly") & 1) == 0)
  {
    if (v201 - 496 > 0x8F)
    {
      v218 = v201 > 0x27F;
      v191 = a1;
      if (v218)
      {
LABEL_292:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v191 + 48) + 8) + 24) = 0;
        goto LABEL_293;
      }
      v202 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v298 = 0u;
      v299 = 0u;
      v300 = 0u;
      v301 = 0u;
      v219 = *(_QWORD *)(v198 + 96);
      if (v219)
        v220 = *(void **)(v219 + 40);
      else
        v220 = 0;
      v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v298, &v285, 16);
      if (v221)
      {
        v222 = *(_QWORD *)v299;
        do
        {
          for (kk = 0; kk != v221; ++kk)
          {
            if (*(_QWORD *)v299 != v222)
              objc_enumerationMutation(v220);
            v224 = *(_QWORD **)(*((_QWORD *)&v298 + 1) + 8 * kk);
            if (v224 && !v224[20])
            {
              v225 = -[NSSQLiteAdapter newSimplePrimaryKeyUpdateStatementForEntity:](*(NSSQLiteStatement **)(v198 + 104), v224);
              objc_msgSend(v202, "addObject:", v225);

            }
          }
          v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v298, &v285, 16);
        }
        while (v221);
      }
    }
    else
    {
      v202 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v298 = 0u;
      v299 = 0u;
      v300 = 0u;
      v301 = 0u;
      v203 = *(_QWORD *)(v198 + 96);
      if (v203)
        v204 = *(void **)(v203 + 40);
      else
        v204 = 0;
      v205 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v298, &v285, 16);
      if (v205)
      {
        v206 = *(_QWORD *)v299;
        do
        {
          for (mm = 0; mm != v205; ++mm)
          {
            if (*(_QWORD *)v299 != v206)
              objc_enumerationMutation(v204);
            v208 = *(_QWORD **)(*((_QWORD *)&v298 + 1) + 8 * mm);
            if (v208 && !v208[20])
            {
              v209 = -[NSSQLiteAdapter newComplexPrimaryKeyUpdateStatementForEntity:](*(_QWORD *)(v198 + 104), v208);
              objc_msgSend(v202, "addObject:", v209);

            }
          }
          v205 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v298, &v285, 16);
        }
        while (v205);
      }
    }
    -[NSSQLCore _updateToVersion640PrimaryKeyTableUsingStatements:connection:](v198, v202, v199);
    v191 = a1;
    goto LABEL_292;
  }
LABEL_293:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
      _NSCoreDataLog(4, (uint64_t)CFSTR("finished upgrade checks, bumping metadata"), v226, v227, v228, v229, v230, v231, (uint64_t)v242);
    -[NSSQLiteConnection beginTransaction](*(_QWORD *)(a1 + 32));
    v232 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "metadata"), "mutableCopy");
    -[__CFString setObject:forKey:](v232, "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
    -[NSSQLiteConnection saveMetadata:](*(_QWORD **)(a1 + 32), v232);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
    -[NSSQLiteConnection commitTransaction](*(_QWORD *)(a1 + 32));
    -[NSSQLiteConnection endFetchAndRecycleStatement:](*(_QWORD *)(a1 + 32), 0);
  }
}

uint64_t __47__NSSQLCore_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1)
{
  return -[NSSQLiteConnection freeQueryGenerationWithIdentifier:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), *(_QWORD *)(a1 + 40));
}

void __38__NSSQLCore__disconnectAllConnections__block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

void __20__NSSQLCore_dealloc__block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

- (id)type
{
  return CFSTR("SQLite");
}

- (BOOL)_hasActiveGenerations
{
  NSSQLiteConnection *queryGenerationTrackingConnection;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (self && (queryGenerationTrackingConnection = self->_queryGenerationTrackingConnection) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__NSSQLCore__hasActiveGenerations__block_invoke;
    v5[3] = &unk_1E1EDD618;
    v5[4] = self;
    v5[5] = &v6;
    -[NSSQLiteConnection performAndWait:]((uint64_t)queryGenerationTrackingConnection, (uint64_t)v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count"))
    return 1;
  v20 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_msgSend(a3, "insertedObjects", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v13, "objectID"), "isTemporaryID"))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }
  v14 = -[NSSQLCore _obtainPermanentIDsForObjects:withNotification:error:]((uint64_t)self, v7, &v20) != 0;
  if (v20)
  {
    -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)a3, (uint64_t)v20);

  }
  return v14;
}

- (id)harvestIndexStatisticsFromConnections
{
  id v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  if (!a1 || (*(_BYTE *)(a1 + 194) & 1) == 0)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__23;
  v9 = __Block_byref_object_dispose__23;
  v2 = *(_QWORD *)(a1 + 120);
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke;
  v4[3] = &unk_1E1EDF810;
  v4[4] = &v5;
  -[NSSQLCoreDispatchManager enumerateAvailableConnectionsWithBlock:](v2, (uint64_t)v4);
  v1 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v1;
}

- (Class)objectIDFactoryForPersistentHistoryEntity:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLCore;
  v4 = -[NSPersistentStore objectIDFactoryForEntity:](&v6, sel_objectIDFactoryForEntity_, objc_msgSend(a3, "entityDescription"));
  if (!objc_msgSend(v4, "_storeInfo1"))
    objc_msgSend(v4, "_setStoreInfo1:", a3);
  return (Class)v4;
}

- (void)_postChangeNotificationWithTransactionID:(uint64_t)a1
{
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  int out_token;

  if (a1)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    if ((*(_BYTE *)(a1 + 193) & 0x10) != 0)
      v5 = (void *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)_PFRoutines, (void *)a1);
    else
      v5 = 0;
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    if (v6)
    {
      v7 = v6;
      v8 = *(_DWORD *)(a1 + 260);
      out_token = v8;
      if (v8 == -1)
      {
        if (notify_register_check(v6, &out_token))
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("unable to check registration for posting store changed notification"), v15, v16, v17, v18, v19, v20, v23);
          if (out_token != -1)
            notify_cancel(out_token);
          goto LABEL_13;
        }
        v8 = out_token;
        v21 = (unsigned int *)(a1 + 260);
        while (1)
        {
          v22 = __ldxr(v21);
          if (v22 != -1)
            break;
          if (!__stxr(v8, v21))
            goto LABEL_7;
        }
        __clrex();
        notify_cancel(v8);
        v8 = *(_DWORD *)(a1 + 260);
        out_token = v8;
      }
LABEL_7:
      if (a2 && v8 != -1)
        notify_set_state(v8, objc_msgSend(a2, "unsignedLongLongValue"));
      if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
        _NSCoreDataLog(9, (uint64_t)CFSTR("Remote Change Notification - Posting for %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v5);
      notify_post(v7);
    }
LABEL_13:
    objc_autoreleasePoolPop(v4);
  }
}

- (void)_updateAutoVacuumMetadataWithValues:(unsigned __int8 *)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "metadata"), "mutableCopy");
    v5 = a1[188];
    if (v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(a2);
            objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a2, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          }
          v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }
      v10 = v5 != 0;
      v11 = (uint64_t)a1;
      v12 = v4;
    }
    else
    {
      v10 = v5 != 0;
      v11 = (uint64_t)a1;
      v12 = a2;
    }
    -[NSSQLCore _setMetadata:clean:](v11, v12, v10);

  }
}

+ (BOOL)trackSQLiteDatabaseStatistics
{
  return _MergedGlobals_176;
}

- (void)freeQueryGenerationWithIdentifier:(id)a3
{
  NSSQLiteConnection *queryGenerationTrackingConnection;
  _QWORD v4[6];

  if (a3)
  {
    queryGenerationTrackingConnection = self->_queryGenerationTrackingConnection;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__NSSQLCore_freeQueryGenerationWithIdentifier___block_invoke;
    v4[3] = &unk_1E1EDD430;
    v4[4] = self;
    v4[5] = a3;
    -[NSSQLiteConnection performAndWait:]((uint64_t)queryGenerationTrackingConnection, (uint64_t)v4);
  }
}

- (void)willRemoveFromPersistentStoreCoordinator:(id)a3
{
  _NSSQLCoreConnectionObserver *observer;
  id v6;
  void *v7;
  NSSQLBlockRequestContext *v8;
  objc_super v9;
  _QWORD v10[6];
  uint64_t v11;

  observer = self->_observer;
  if (observer)
  {
    objc_storeWeak((id *)&observer->_core, 0);

    self->_observer = 0;
  }
  v6 = -[NSSQLCore harvestIndexStatisticsFromConnections]((uint64_t)self);
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    v7 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Saving index statistics"), &v11);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__NSSQLCore_willRemoveFromPersistentStoreCoordinator___block_invoke;
    v10[3] = &unk_1E1EDF6A8;
    v10[4] = v6;
    v10[5] = self;
    v8 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v10, 0, self);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v8, 0);

    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v11, v7);
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)NSSQLCore;
  -[NSPersistentStore willRemoveFromPersistentStoreCoordinator:](&v9, sel_willRemoveFromPersistentStoreCoordinator_, a3);
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v5 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return v5;
  if (!objc_msgSend(a3, "isFileURL"))
    return 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "path")) & 1) == 0)
  {
    if (a5)
    {
      v17 = objc_alloc(MEMORY[0x1E0C99D80]);
      v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E0CB3308], 0);
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v18);

    }
    return 0;
  }
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 240.0);
  v21 = CFSTR("journal_mode");
  v22[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSPersistentStoreTimeoutOption"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1), CFSTR("NSSQLitePragmasOption"), 0);
  v12 = v11;
  if (a4)
  {
    objc_msgSend(v11, "addEntriesFromDictionary:", a4);
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
    v13 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
    if (objc_msgSend(v13, "objectForKey:", CFSTR("journal_mode")))
    {
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"));
      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("NSSQLitePragmasOption"));

    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, v5, a4, (uint64_t *)a5))return 0;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, v5, v12);
  if ((objc_msgSend(v15, "loadMetadata:", a5) & 1) != 0)
  {
    v5 = (id)objc_msgSend((id)objc_msgSend(v15, "metadata"), "copy");
    v16 = 0;
  }
  else
  {
    v5 = 0;
    v16 = 1;
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v15);

  if ((v16 | 2) != 2)
    return 0;
  v19 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("NSStoreType"));
  if (v19 && !objc_msgSend(v19, "isEqualToString:", CFSTR("SQLite")))
    return 0;
  return v5;
}

- (void)dealloc
{
  _NSSQLCoreConnectionObserver *observer;
  NSObject *cache_event_source;
  NSSQLiteConnection *schemaValidationConnection;
  uint64_t v6;
  int remoteNotificationToken;
  NSSQLiteConnection *queryGenerationTrackingConnection;
  NSData *dbKey;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[5];

  observer = self->_observer;
  if (observer)
  {
    objc_storeWeak((id *)&observer->_core, 0);

    self->_observer = 0;
  }
  cache_event_source = self->_cache_event_source;
  if (cache_event_source)
  {
    dispatch_source_cancel(cache_event_source);
    if ((*((_BYTE *)&self->_sqlCoreFlags + 2) & 2) != 0)
    {
      dispatch_resume((dispatch_object_t)self->_cache_event_source);
      *(_DWORD *)&self->_sqlCoreFlags &= ~0x20000u;
    }
    dispatch_release((dispatch_object_t)self->_cache_event_source);
    self->_cache_event_source = 0;
  }
  schemaValidationConnection = self->_schemaValidationConnection;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __20__NSSQLCore_dealloc__block_invoke;
  v12[3] = &unk_1E1EDD520;
  v12[4] = self;
  -[NSSQLiteConnection performAndWait:]((uint64_t)schemaValidationConnection, (uint64_t)v12);

  self->_schemaValidationConnection = 0;
  self->_adapter = 0;

  self->_generationalRowCache = 0;
  self->_storeMetadata = 0;

  self->_usedIndexes = 0;
  self->_historyTrackingOptions = 0;

  self->_externalDataReferencesDirectory = 0;
  self->_externalDataLinksDirectory = 0;

  self->_fileBackedFuturesPath = 0;
  -[NSSQLCoreDispatchManager disconnectAllConnections]((uint64_t)self->_dispatchManager);

  self->_dispatchManager = 0;
  remoteNotificationToken = self->_remoteNotificationToken;
  if (remoteNotificationToken != -1)
  {
    notify_cancel(remoteNotificationToken);
    self->_remoteNotificationToken = -1;
  }
  queryGenerationTrackingConnection = self->_queryGenerationTrackingConnection;
  if (queryGenerationTrackingConnection)
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __20__NSSQLCore_dealloc__block_invoke_2;
    v11[3] = &unk_1E1EDD520;
    v11[4] = self;
    -[NSSQLiteConnection performAndWait:]((uint64_t)queryGenerationTrackingConnection, (uint64_t)v11);

    self->_queryGenerationTrackingConnection = 0;
  }
  dbKey = self->_dbKey;
  if (dbKey)
  {
    CFRelease(dbKey);
    self->_dbKey = 0;
  }

  self->_writerSerializationMutex = 0;
  self->_ancillaryModels = 0;

  self->_ancillarySQLModels = 0;
  self->_model = 0;
  v10.receiver = self;
  v10.super_class = (Class)NSSQLCore;
  -[NSPersistentStore dealloc](&v10, sel_dealloc);
}

- (uint64_t)_disconnectAllConnections
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (result)
  {
    v1 = result;
    -[NSSQLCoreDispatchManager disconnectAllConnections](*(_QWORD *)(result + 120));
    v2 = *(_QWORD *)(v1 + 112);
    v3 = MEMORY[0x1E0C809B0];
    if (v2)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __38__NSSQLCore__disconnectAllConnections__block_invoke;
      v6[3] = &unk_1E1EDD520;
      v6[4] = v1;
      -[NSSQLiteConnection performAndWait:](v2, (uint64_t)v6);
    }
    v4 = *(_QWORD *)(v1 + 200);
    if (v4)
    {
      v5[0] = v3;
      v5[1] = 3221225472;
      v5[2] = __38__NSSQLCore__disconnectAllConnections__block_invoke_2;
      v5[3] = &unk_1E1EDD520;
      v5[4] = v1;
      -[NSSQLiteConnection performAndWait:](v4, (uint64_t)v5);
    }
    result = *(unsigned int *)(v1 + 260);
    if ((_DWORD)result != -1)
    {
      result = notify_cancel(result);
      *(_DWORD *)(v1 + 260) = -1;
    }
  }
  return result;
}

+ (uint64_t)sanityCheckFileAtURL:(void *)a3 options:(uint64_t *)a4 error:
{
  const char *v7;
  const char *v8;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;

  objc_opt_self();
  v7 = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
  if (v7)
  {
    v8 = v7;
    if (*v7)
    {
      if (objc_msgSend(a3, "objectForKey:", CFSTR("_NSSQLiteSEEKeychainItemOption")))
        return 1;
      v19 = +[NSSQLiteConnection readMagicWordFromPath:options:]((uint64_t)NSSQLiteConnection, v8, a3);
      v20 = v19;
      if (v19 > 12)
      {
        if (v19 == 92)
        {
          if (!a4)
            return 1;
          v26 = objc_alloc(MEMORY[0x1E0C99D80]);
          v11 = (void *)objc_msgSend(v26, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB3308], 0);
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v23 = *MEMORY[0x1E0CB28A8];
          v24 = 259;
LABEL_19:
          v12 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, v11);
          goto LABEL_6;
        }
        if (v19 != 13)
        {
LABEL_11:
          if (!a4)
            return 1;
          v21 = objc_alloc(MEMORY[0x1E0C99D80]);
          v11 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB3308], 0);
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v23 = *MEMORY[0x1E0CB2FE0];
          v24 = v20;
          goto LABEL_19;
        }
      }
      else
      {
        if (!v19)
          return 1;
        if (v19 != 1)
          goto LABEL_11;
      }
      if (!a4)
        return 1;
      v25 = objc_alloc(MEMORY[0x1E0C99D80]);
      v11 = (void *)objc_msgSend(v25, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB3308], 0);
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB28A8];
      v24 = 257;
      goto LABEL_19;
    }
  }
  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB3308], CFSTR("path's fileSystemRepresentation returned NULL"), CFSTR("reason"), 0);
  v12 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 258, v11);
  _NSCoreDataLog(1, (uint64_t)CFSTR(" failed to open file due to illegal URL encoding.  error = %@ with userInfo %@"), v13, v14, v15, v16, v17, v18, v12);
  if (a4)
LABEL_6:
    *a4 = v12;

  return 0;
}

+ (id)databaseKeyFromOptionsDictionary:(uint64_t)a1
{
  objc_opt_self();
  return +[NSSQLCore _databaseKeyFromValue:]((uint64_t)NSSQLCore, (void *)objc_msgSend(a2, "objectForKey:", CFSTR("_NSSQLiteSEEKeychainItemOption")));
}

- (BOOL)_unload:(id *)a3
{
  objc_super v6;

  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)NSSQLCore;
  return -[NSPersistentStore _unload:](&v6, sel__unload_, a3);
}

- (id)currentChangeToken
{
  NSSQLCore *v2;
  NSSQLBlockRequestContext *v3;
  _NSPersistentHistoryToken *v4;
  _NSPersistentHistoryToken *v5;
  uint64_t v7;
  uint64_t v8;
  sqlite3_int64 (*v9)(uint64_t, uint64_t);
  void *v10;
  NSSQLCore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = self;
  if (self)
  {
    if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 4) != 0)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = -1;
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __31__NSSQLCore_currentChangeToken__block_invoke;
      v10 = &unk_1E1EDF798;
      v11 = self;
      v12 = &v13;
      v3 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &v7, 0, self);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v3, 0);

      if (v14[3] == -1)
      {
        v5 = 0;
      }
      else
      {
        v4 = [_NSPersistentHistoryToken alloc];
        v5 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v4, "initWithTransactionNumber:andStoreID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14[3], v7, v8, v9, v10, v11, v12), -[NSSQLCore identifier](v2, "identifier"));
      }
      v2 = v5;
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void __32__NSSQLCore__loadAndSetMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;

  if (-[NSSQLiteConnection canConnect](a2))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "metadata"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSSQLCore _setMetadata:clean:](*(_QWORD *)(a1 + 32), v4, 1);

    }
    -[NSSQLiteConnection connect](a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLiteConnection fetchMetadata](a2);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
      -[NSSQLCore _setMetadata:clean:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(*(id *)(a1 + 32), "_updatedMetadataWithSeed:includeVersioning:", v5, 0), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKey:", 0x1E1EF1490) != 0);
  }
}

- (void)_setMetadata:(int)a3 clean:
{
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "mutableCopy");
    os_unfair_lock_lock_with_options();
    v7 = *(void **)(a1 + 152);
    if (v7)
    {
      if ((objc_msgSend(v7, "isEqual:", a2) & 1) != 0)
      {

LABEL_8:
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
        return;
      }
      v8 = *(void **)(a1 + 152);
    }
    else
    {
      v8 = 0;
    }

    *(_QWORD *)(a1 + 152) = v6;
    *(_BYTE *)(a1 + 188) = a3;
    objc_msgSend((id)a1, "_setMetadataDirty:", a3 ^ 1u);
    goto LABEL_8;
  }
}

- (NSSQLCore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSSQLCore *v20;
  uint64_t v21;
  NSSQLModel *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  id v38;
  NSSQLModel *v39;
  void *PFBundleVersion;
  NSManagedObjectModel *v41;
  NSSQLModel *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  uint64_t v57;
  uint64_t v58;
  NSGenerationalRowCache *v59;
  void *v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  NSObject *global_queue;
  NSObject *v71;
  void *v73;
  uint64_t v74;
  const __CFString *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v88;
  _QWORD handler[4];
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  objc_super v111;
  __int16 v112;
  id v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  id location[6];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a5)
  {

    v73 = (void *)MEMORY[0x1E0C99DA0];
    v74 = *MEMORY[0x1E0C99778];
    v75 = CFSTR("Cannot create an SQL store with a nil URL.");
    goto LABEL_146;
  }
  if ((objc_msgSend(a5, "isFileURL") & 1) == 0)
  {
    v76 = (void *)MEMORY[0x1E0C99DA0];
    v77 = *MEMORY[0x1E0C99778];
    v75 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData SQL stores only support file URLs (got %@)."), a5);
    v73 = v76;
    v74 = v77;
LABEL_146:
    objc_exception_throw((id)objc_msgSend(v73, "exceptionWithName:reason:userInfo:", v74, v75, 0));
  }
  v113 = 0;
  v10 = +[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a5);
  if (v10)
    v11 = 0x4000;
  else
    v11 = 0;
  self->_sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&self->_sqlCoreFlags & 0xFFFFBFFF | v11);
  if (v10)
  {
    if (!strcmp((const char *)objc_msgSend(a5, "fileSystemRepresentation"), "/dev/null"))
    {
      if ((int)objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("NSPersistentStoreConnectionPoolMaxSize")), "intValue") >= 2)
      {

        v81 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134060, (uint64_t)CFSTR("Error - In Memory store at /dev/null can only have NSPersistentStoreConnectionPoolMaxSizeKey equal to 1"), 0);
        objc_exception_throw(v81);
      }
      if (a6)
      {
        a6 = (id)objc_msgSend(a6, "mutableCopy");
        objc_msgSend(a6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1), CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
      }
      else
      {
        a6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1), CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
      }
    }
    v112 = 0;
  }
  else
  {
    v112 = 0;
    if (!+[NSPersistentStore doURLStuff:createdStubFile:readOnly:error:options:](NSPersistentStore, "doURLStuff:createdStubFile:readOnly:error:options:", a5, (char *)&v112 + 1, &v112, &v113, a6))
    {

      v78 = objc_msgSend(v113, "code");
      v79 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v113, CFSTR("NSCoreDataPrimaryError"), 0);
      v80 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], v78, (uint64_t)CFSTR("Error validating url for store"), v79);
      objc_exception_throw(v80);
    }
    if ((_BYTE)v112)
    {
      if (a3)
      {
        if ((objc_msgSend((id)objc_msgSend(a6, "valueForKey:", CFSTR("NSReadOnlyPersistentStoreOption")), "BOOLValue") & 1) == 0)
        {
          if (objc_msgSend(a6, "valueForKey:", CFSTR("NSReadOnlyPersistentStoreOption"))
            && BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88))
          {
            if (v113)
              v82 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v113, *MEMORY[0x1E0CB3388]);
            else
              v82 = 0;
            v83 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 513, (uint64_t)CFSTR("Attempt to add read-only store read-write"), v82);
            objc_exception_throw(v83);
          }
          if (a6)
          {
            a6 = (id)objc_msgSend(a6, "mutableCopy");
            objc_msgSend(a6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
          }
          else
          {
            a6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
          }
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption.");
          _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a5);
          v19 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = a5;
            _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption.",
              (uint8_t *)location,
              0xCu);
          }
        }
      }
      else if (a6)
      {
        a6 = (id)objc_msgSend(a6, "mutableCopy");
        objc_msgSend(a6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
      }
      else
      {
        a6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
      }
    }
  }
  v111.receiver = self;
  v111.super_class = (Class)NSSQLCore;
  v20 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v111, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, a3, a4, a5, a6);
  v21 = (uint64_t)v20;
  if (v20)
  {
    v20->_remoteNotificationToken = -1;
    if (HIBYTE(v112)
      && objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("NSPersistentStoreRemoveStoreOnCleanup")), "BOOLValue"))
    {
      objc_msgSend((id)v21, "doFilesystemCleanupOnRemove:", 1);
    }
    v88 = v21;
    if (a3)
    {
      v86 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v84 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v22 = -[NSSQLModel initWithManagedObjectModel:configurationName:brokenHashVersion:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:brokenHashVersion:", objc_msgSend(a3, "managedObjectModel"), a4, 0);
      *(_QWORD *)(v21 + 96) = v22;
      if (!v22)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Got a nil sqlmodel"), 0));
    }
    else
    {
      v84 = 0;
      v85 = 0;
      v86 = 0;
    }
    *(_DWORD *)(v21 + 192) = *(_DWORD *)(v21 + 192) & 0xFFFFFFFE | +[NSSQLCore coloredLoggingDefault](NSSQLCore, "coloredLoggingDefault");
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v23 = *(_QWORD *)(v21 + 96);
    if (v23)
      v24 = *(void **)(v23 + 40);
    else
      v24 = 0;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v108;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v108 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
          if (v28 && (*(_BYTE *)(v28 + 280) & 2) != 0)
          {
            *(_DWORD *)(v21 + 192) |= 0x2000u;
            goto LABEL_48;
          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
        if (v25)
          continue;
        break;
      }
    }
LABEL_48:
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v29 = *(_QWORD *)(v21 + 96);
    if (v29)
      v30 = *(void **)(v29 + 40);
    else
      v30 = 0;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v104;
      while (2)
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v104 != v32)
            objc_enumerationMutation(v30);
          v34 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j);
          if (v34 && (*(_BYTE *)(v34 + 280) & 1) != 0)
          {
            *(_DWORD *)(v21 + 192) |= 2u;
            goto LABEL_61;
          }
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
        if (v31)
          continue;
        break;
      }
    }
LABEL_61:
    v35 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("NSPersistentStoreTrackIndexUseOptionKey")), "BOOLValue");
    if (v35)
      v36 = 0x10000;
    else
      v36 = 0;
    *(_DWORD *)(v21 + 192) = *(_DWORD *)(v21 + 192) & 0xFFFEFFFF | v36;
    if (a3)
      v37 = v35;
    else
      v37 = 0;
    if (v37 == 1)
    {
      +[_PFRoutines _getPFBundleVersionNumber]();
      v38 = +[NSSQLiteIndexTrackingModel newModelForFrameworkVersion:]();
      -[_PFModelMap addManagedObjectModel:](*((_QWORD *)a3 + 12), v38);
      v39 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", v38, 0);
      objc_msgSend(v84, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v38, "entitiesByName"), "allKeys"));
      objc_msgSend(v86, "setObject:forKey:", v38, CFSTR("NSPersistentStoreTrackIndexUseOptionKey"));
      objc_msgSend(v85, "setObject:forKey:", v39, CFSTR("NSPersistentStoreTrackIndexUseOptionKey"));

    }
    else if (!a3)
    {
      goto LABEL_73;
    }
    if (objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("NSPersistentStoreMirroringOptionsKey")), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey"))|| objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey")), "BOOLValue"))
    {
      PFBundleVersion = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
      v41 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]((uint64_t)PFCloudKitMetadataModel, PFBundleVersion);
      -[_PFModelMap addManagedObjectModel:](*((_QWORD *)a3 + 12), v41);
      objc_msgSend(v84, "addObjectsFromArray:", -[NSDictionary allKeys](-[NSManagedObjectModel entitiesByName](v41, "entitiesByName"), "allKeys"));
      objc_msgSend(v86, "setObject:forKey:", v41, CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));
      v42 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", v41, 0);
      objc_msgSend(v85, "setObject:forKey:", v42, CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));

    }
LABEL_73:

    *(_QWORD *)(v21 + 216) = 0;
    *(_QWORD *)(v21 + 216) = v86;

    *(_QWORD *)(v21 + 224) = 0;
    *(_QWORD *)(v21 + 224) = v85;
    if (a3)
      -[NSSQLCore _setupHistoryModelForPSC:withExcludedEntityNames:](v21, (uint64_t)a3, v84);
    if (objc_msgSend(*(id *)(v21 + 216), "count"))
    {
      *(_DWORD *)(v21 + 192) |= 0x800u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v43 = (void *)objc_msgSend(*(id *)(v21 + 224), "allValues");
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v100;
        do
        {
          v46 = 0;
          do
          {
            if (*(_QWORD *)v100 != v45)
              objc_enumerationMutation(v43);
            v47 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v46);
            if ((*(_BYTE *)(v21 + 193) & 0x20) == 0)
            {
              v97 = 0u;
              v98 = 0u;
              v95 = 0u;
              v96 = 0u;
              v48 = v47 ? *(void **)(v47 + 40) : 0;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
              if (v49)
              {
                v50 = *(_QWORD *)v96;
                while (2)
                {
                  for (k = 0; k != v49; ++k)
                  {
                    if (*(_QWORD *)v96 != v50)
                      objc_enumerationMutation(v48);
                    v52 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k);
                    if (v52 && (*(_BYTE *)(v52 + 280) & 2) != 0)
                    {
                      *(_DWORD *)(v88 + 192) |= 0x2000u;
                      goto LABEL_95;
                    }
                  }
                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
                  if (v49)
                    continue;
                  break;
                }
              }
            }
LABEL_95:
            v21 = v88;
            if ((*(_BYTE *)(v88 + 192) & 2) == 0)
            {
              v93 = 0u;
              v94 = 0u;
              v91 = 0u;
              v92 = 0u;
              v53 = v47 ? *(void **)(v47 + 40) : 0;
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
              if (v54)
              {
                v55 = *(_QWORD *)v92;
                while (2)
                {
                  for (m = 0; m != v54; ++m)
                  {
                    if (*(_QWORD *)v92 != v55)
                      objc_enumerationMutation(v53);
                    v57 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * m);
                    if (v57 && (*(_BYTE *)(v57 + 280) & 1) != 0)
                    {
                      *(_DWORD *)(v88 + 192) |= 2u;
                      goto LABEL_109;
                    }
                  }
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
                  if (v54)
                    continue;
                  break;
                }
              }
            }
LABEL_109:
            ++v46;
          }
          while (v46 != v44);
          v58 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
          v44 = v58;
        }
        while (v58);
      }
    }
    objc_opt_self();
    *(_QWORD *)(v21 + 240) = +[NSSQLCore _databaseKeyFromValue:]((uint64_t)NSSQLCore, (void *)objc_msgSend(a6, "objectForKey:", CFSTR("_NSSQLiteSEEKeychainItemOption")));

    if (a3)
      v59 = -[NSGenerationalRowCache initWithStore:]([NSGenerationalRowCache alloc], "initWithStore:", v21);
    else
      v59 = 0;
    *(_QWORD *)(v21 + 128) = v59;
    *(_QWORD *)(v21 + 104) = -[NSSQLiteAdapter initWithSQLCore:]([NSSQLiteAdapter alloc], "initWithSQLCore:", v21);
    v60 = (void *)objc_msgSend(a6, "valueForKey:", CFSTR("NSXPCStoreDelegate"));
    if (objc_msgSend(v60, "isEqual:", MEMORY[0x1E0C9AAB0]))
      *(_DWORD *)(v21 + 192) |= 0x100u;
    *(_DWORD *)(v21 + 144) = 0;
    *(_QWORD *)(v21 + 208) = objc_alloc_init(_PFMutex);
    if (objc_msgSend((id)objc_msgSend(a6, "valueForKey:", CFSTR("NSPersistentStoreOrderKeyUpdateNotification")), "BOOLValue"))*(_DWORD *)(v21 + 192) |= 0x20u;
    v61 = objc_msgSend(a6, "valueForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
    if (v61)
    {
      if (objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v61))
      {
        v62 = *(_DWORD *)(v21 + 192) & 0xFFFFFFE3 | 0x10;
      }
      else if (objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v61))
      {
        v62 = *(_DWORD *)(v21 + 192) & 0xFFFFFFE3 | 0xC;
      }
      else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v61))
      {
        v62 = *(_DWORD *)(v21 + 192) & 0xFFFFFFE3 | 8;
      }
      else if (objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v61))
      {
        v62 = *(_DWORD *)(v21 + 192) & 0xFFFFFFE3 | 4;
      }
      else
      {
        if (!objc_msgSend((id)*MEMORY[0x1E0CB2AD0], "isEqualToString:", v61))
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v63, v64, v65, v66, v67, v68, v61);
          goto LABEL_134;
        }
        v62 = *(_DWORD *)(v21 + 192) | 0x1C;
      }
    }
    else
    {
      v62 = *(_DWORD *)(v21 + 192) & 0xFFFFFFE3;
    }
    *(_DWORD *)(v21 + 192) = v62;
LABEL_134:
    if (a3)
    {
      v69 = getprogname();
      if (v69)
      {
        if (!strncmp("assetsd", v69, 7uLL)
          || !strncmp("homed", v69, 5uLL)
          || !strncmp("mapssyncd", v69, 9uLL)
          || !strncmp("financed", v69, 8uLL)
          || !strncmp("xctest", v69, 6uLL))
        {
          objc_initWeak(location, (id)v21);
          global_queue = dispatch_get_global_queue(0, 0);
          v71 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 0x30uLL, global_queue);
          *(_QWORD *)(v21 + 264) = v71;
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke;
          handler[3] = &unk_1E1EDE1A0;
          objc_copyWeak(&v90, location);
          dispatch_source_set_event_handler(v71, handler);
          dispatch_resume(*(dispatch_object_t *)(v21 + 264));
          *(_DWORD *)(v21 + 192) &= ~0x20000u;
          objc_destroyWeak(&v90);
          objc_destroyWeak(location);
        }
      }
    }
  }
  return (NSSQLCore *)v21;
}

+ (id)_databaseKeyFromValue:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFStringRef v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  CFStringRef v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeRef result;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return 0;
  if (!byte_1ECD8DE24)
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to use SPI outside of entitled process");
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v24);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(result) = 0;
      _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to use SPI outside of entitled process", (uint8_t *)&result, 2u);
    }
    return 0;
  }
  result = 0;
  if (!objc_msgSend(a2, "isNSData"))
  {
    v13 = *MEMORY[0x1E0CD70E8];
    v26[0] = *MEMORY[0x1E0CD6C98];
    v26[1] = v13;
    v27[0] = *MEMORY[0x1E0CD6CA8];
    v27[1] = a2;
    v26[2] = *MEMORY[0x1E0CD7018];
    v27[2] = *MEMORY[0x1E0C9AE50];
    v14 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3), &result);
    if ((_DWORD)v14)
    {
      v15 = v14;
      v16 = SecCopyErrorMessageString(v14, 0);
      if (v16)
      {
        v22 = v16;
        v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keychain failed to return key for database encryption (error %d): %@"), v15, v16);
        CFRelease(v22);
        v20 = (void *)MEMORY[0x1E0C99DA0];
        v21 = *MEMORY[0x1E0C99778];
        v19 = (const __CFString *)v23;
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99778];
        v19 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keychain failed to return key for database encryption (error %d)"), v15);
        v20 = v17;
        v21 = v18;
      }
    }
    else
    {
      v3 = (void *)result;
      if (result)
        return v3;
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99778];
      v19 = CFSTR("Keychain did not return a key for database encryption");
    }
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v19, 0));
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
  result = v3;
  return v3;
}

+ (Class)rowCacheClass
{
  return (Class)objc_opt_class();
}

- (void)_setupHistoryModelForPSC:(void *)a3 withExcludedEntityNames:
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const __CFString *v62;
  const __CFString *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)a1, "options"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
  {
    return;
  }
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "options"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isNSDictionary") & 1) == 0 && (objc_msgSend(v7, "isNSNumber") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersistentHistoryTrackingKey must be a NSNumber"), 0));
  if ((objc_msgSend(v7, "isNSDictionary") & 1) == 0
    && (!objc_msgSend(v7, "isNSNumber") || !objc_msgSend(v7, "BOOLValue")))
  {
    _NSCoreDataLog(9, (uint64_t)CFSTR("Persistent History is disabled - %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    return;
  }
  if (objc_msgSend((id)a1, "ancillaryModels"))
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", objc_msgSend((id)a1, "ancillaryModels"));
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v67 = v8;
  v65 = a3;
  if (objc_msgSend((id)a1, "ancillarySQLModels"))
    v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", objc_msgSend((id)a1, "ancillarySQLModels"));
  else
    v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_DWORD *)(a1 + 192) |= 0x400u;
  v15 = *(_QWORD **)(a1 + 96);
  objc_msgSend((id)a1, "options");
  v16 = +[_PFPersistentHistoryModel newPersistentHistoryManagedObjectModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v15);
  objc_msgSend(v67, "setObject:forKey:", v16, CFSTR("NSPersistentHistoryTrackingKey"));
  v17 = *(_QWORD **)(a1 + 96);
  objc_msgSend((id)a1, "options");
  v18 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v17);
  objc_msgSend(v66, "setObject:forKey:", v18, CFSTR("NSPersistentHistoryTrackingKey"));
  if (a2)
  {
    -[_PFModelMap addManagedObjectModel:](*(_QWORD *)(a2 + 96), v16);
    v19 = +[_PFPersistentHistoryFetchModel newFetchHistoryModelForCoordinator:andOptions:]();
    -[_PFModelMap addManagedObjectModel:](*(_QWORD *)(a2 + 96), v19);

  }
  if (!objc_msgSend(v7, "isNSDictionary") || !objc_msgSend(v7, "count"))
  {
    v28 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend((id)objc_msgSend(v7, "valueForKey:", CFSTR("NSPersistentHistoryTrackingExcludeUnmodifiedPropertiesForBatchUpdate")), "BOOLValue"))
  {
    _NSCoreDataLog(9, (uint64_t)CFSTR("Persistent History Tracking Option - Batch Update Only Tracks Modified Properties"), v20, v21, v22, v23, v24, v25, v64);
    *(_DWORD *)(a1 + 192) |= 0x8000u;
  }
  v26 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToInclude"));
  v27 = v26;
  if (v26 && (objc_msgSend(v26, "isNSArray") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersistentHistoryTrackingEntitiesToInclude must be an NSArray of NSString"), 0));
  if (objc_msgSend(v27, "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v81 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          if ((objc_msgSend(v32, "isNSString") & 1) == 0)
          {
            v62 = CFSTR("NSPersistentHistoryTrackingEntitiesToInclude must be an NSArray of NSString");
            goto LABEL_88;
          }
          if (!objc_msgSend(*(id *)(a1 + 96), "entityNamed:", v32))
          {
            v62 = CFSTR("NSPersistentHistoryTrackingEntitiesToInclude has entities not included in the Managed Object Model");
LABEL_88:
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v62, 0));
          }
          objc_msgSend(v28, "addObject:", v32);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      }
      while (v29);
    }
  }
  else
  {
    v28 = 0;
  }
  v49 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToExclude"));
  v50 = v49;
  if (v49 && (objc_msgSend(v49, "isNSArray") & 1) == 0)
  {
    v63 = CFSTR("NSPersistentHistoryTrackingEntitiesToExclude must be an NSArray");
    goto LABEL_95;
  }
  if (objc_msgSend(v28, "count") && objc_msgSend(v50, "count"))
  {
    v63 = CFSTR("NSPersistentHistoryTrackingEntitiesToExclude & NSPersistentHistoryTrackingEntitiesToInclude are mutually exclusive, you cannot set both options");
LABEL_95:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v63, 0));
  }
  if (objc_msgSend(v50, "count"))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v50, "count"));
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v77 != v52)
            objc_enumerationMutation(v50);
          v54 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          if ((objc_msgSend(v54, "isNSString") & 1) == 0)
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersistentHistoryTrackingEntitiesToExclude must be an NSArray of NSString"), 0));
          if (objc_msgSend(*(id *)(a1 + 96), "entityNamed:", v54))
          {
            objc_msgSend(v33, "addObject:", v54);
          }
          else
          {
            v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity (%@) was not found in model."));
            _NSCoreDataLog(2, v55, v56, v57, v58, v59, v60, v61, (uint64_t)v54);
          }
        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
      }
      while (v51);
    }
    goto LABEL_37;
  }
LABEL_36:
  v33 = 0;
LABEL_37:
  v34 = *(_QWORD *)(a1 + 96);
  if (v34)
    v35 = *(void **)(v34 + 32);
  else
    v35 = 0;
  v36 = (void *)objc_msgSend(v35, "allKeys");
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v28, "count"))
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v73 != v40)
            objc_enumerationMutation(v36);
          v42 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k);
          if (objc_msgSend(v28, "containsObject:", v42))
            v43 = v37;
          else
            v43 = v38;
          objc_msgSend(v43, "addObject:", v42);
        }
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v39);
    }
  }
  else if (objc_msgSend(v33, "count"))
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v44 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v69 != v45)
            objc_enumerationMutation(v36);
          v47 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m);
          if (objc_msgSend(v33, "containsObject:", v47))
            v48 = v38;
          else
            v48 = v37;
          objc_msgSend(v48, "addObject:", v47);
        }
        v44 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v44);
    }
  }
  else
  {
    objc_msgSend(v37, "addObjectsFromArray:", v36);
  }
  if (objc_msgSend(v65, "count"))
    objc_msgSend(v38, "addObjectsFromArray:", objc_msgSend(v65, "allObjects"));
  v84[0] = CFSTR("NSPersistentHistoryTrackingEntitiesToInclude");
  v85[0] = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v37);
  v84[1] = CFSTR("NSPersistentHistoryTrackingEntitiesToExclude");
  v85[1] = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v38);
  *(_QWORD *)(a1 + 232) = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);

  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 216) = v67;

  *(_QWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 224) = v66;

}

- (NSDictionary)ancillaryModels
{
  return self->_ancillaryModels;
}

- (uint64_t)_obtainPermanentIDsForObjects:(uint64_t)result withNotification:(void *)a2 error:(_QWORD *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  size_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _DWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __CFDictionary *Mutable;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  const void *v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  _QWORD *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  _QWORD *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  int v65;
  unint64_t k;
  id *v67;
  uint64_t v68;
  id *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  size_t v75;
  char *v76;
  _QWORD *v77;
  BOOL v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v86;
  id v87;
  void *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  _QWORD *v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v84 = a3;
  v110 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = (void *)result;
    if (objc_msgSend(a2, "count"))
    {
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v94 = (uint64_t)a2;
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v104;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v104 != v6)
              objc_enumerationMutation((id)v94);
            v85 = (_QWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i), "managedObjectContext");
            if (v85)
            {
              v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", objc_msgSend(v4, "model"), 0);
              objc_msgSend(v87, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "ancillarySQLModels"), "allValues"));
              v92 = (char *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              v9 = objc_msgSend(v87, "count");
              v86 = malloc_type_calloc(8uLL, v9, 0x5A913AB2uLL);
              v93 = malloc_type_calloc(8uLL, v9, 0xA717397uLL);
              if (objc_msgSend(v87, "count"))
              {
                v10 = 0;
                v91 = 0;
                do
                {
                  v11 = objc_msgSend(v87, "objectAtIndexedSubscript:", v10);
                  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
                  if (v11)
                  {
                    objc_msgSend(v92, "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v11 + 68)));
                    v13 = *(void **)(v11 + 40);
                  }
                  else
                  {
                    objc_msgSend(v92, "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0));
                    v13 = 0;
                  }
                  v14 = objc_msgSend(v13, "count");
                  v15 = v14;
                  v86[v10] = v14;
                  v93[v10] = malloc_type_calloc(0x18uLL, v14 + 1, 0x45563B10uLL);
                  v91 = (v91 + v15);
                  ++v10;
                }
                while (objc_msgSend(v87, "count") > v10);
              }
              else
              {
                v91 = 0;
              }
              v101 = 0u;
              v102 = 0u;
              v99 = 0u;
              v100 = 0u;
              v16 = objc_msgSend((id)v94, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v100;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v100 != v17)
                      objc_enumerationMutation((id)v94);
                    v19 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v18);
                    if (objc_msgSend((id)objc_msgSend(v19, "objectID"), "isTemporaryID"))
                    {
                      v20 = (_QWORD *)objc_msgSend(v19, "entity");
                      if (v20)
                        v21 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v4, v20);
                      else
                        v21 = 0;
                      v22 = (_DWORD *)objc_msgSend(v21, "rootEntity");
                      v23 = (void *)MEMORY[0x1E0CB37E8];
                      v24 = objc_msgSend(v22, "model");
                      if (v24)
                        v25 = *(unsigned int *)(v24 + 68);
                      else
                        v25 = 0;
                      v26 = objc_msgSend((id)objc_msgSend(v92, "objectForKeyedSubscript:", objc_msgSend(v23, "numberWithUnsignedInt:", v25)), "intValue");
                      if (v22)
                        v27 = v22[46];
                      else
                        v27 = 0;
                      v28 = v93[v26];
                      v29 = objc_msgSend(v22, "model");
                      if (v29)
                        v30 = *(_DWORD *)(v29 + 68);
                      else
                        v30 = 0;
                      v31 = 24 * (v27 - v30);
                      ++*(_QWORD *)(v28 + v31);
                      v32 = *(void **)(v28 + v31 + 16);
                      if (v32)
                        objc_msgSend(v32, "addObject:", v19);
                      else
                        *(_QWORD *)(v28 + v31 + 16) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v19, 0);
                    }
                    ++v18;
                  }
                  while (v16 != v18);
                  v33 = objc_msgSend((id)v94, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
                  v16 = v33;
                }
                while (v33);
              }

              Mutable = CFDictionaryCreateMutable(0, (int)v91, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              if (objc_msgSend(v87, "count"))
              {
                v35 = 0;
                do
                {
                  v36 = objc_msgSend(v87, "objectAtIndexedSubscript:", v35);
                  v37 = v86[v35];
                  if (v37 >= 1)
                  {
                    v38 = v36;
                    v39 = 0;
                    v40 = (_QWORD *)(v93[v35] + 24);
                    do
                    {
                      if (v38)
                        v41 = *(unsigned int *)(v38 + 68);
                      else
                        v41 = 0;
                      v42 = _sqlEntityForEntityID(v38, v39 + v41 + 1);
                      if (*v40)
                        CFDictionarySetValue(Mutable, v42, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"));
                      ++v39;
                      v40 += 3;
                    }
                    while (v37 != v39);
                  }
                  ++v35;
                }
                while (objc_msgSend(v87, "count") > v35);
              }
              v43 = -[NSSQLGenerateObjectIDRequestContext initForEntitiesAndCounts:context:sqlCore:]([NSSQLGenerateObjectIDRequestContext alloc], "initForEntitiesAndCounts:context:sqlCore:", Mutable, v85, v4);
              CFRelease(Mutable);
              v83 = v43;
              -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v4, v43, 1);
              v44 = objc_msgSend(v43, "result");
              v45 = (void *)v44;
              if (v44)
              {
                v46 = 0;
                v88 = (void *)v44;
                while (objc_msgSend(v87, "count", v83) > v46)
                {
                  v47 = objc_msgSend(v87, "objectAtIndexedSubscript:", v46);
                  v91 = v86[v46];
                  if (v91 >= 1)
                  {
                    v48 = v47;
                    v92 = (char *)v93[v46];
                    v49 = 1;
                    v89 = v47;
                    v90 = v46;
                    do
                    {
                      if (v48)
                        v50 = *(unsigned int *)(v48 + 68);
                      else
                        v50 = 0;
                      v51 = objc_msgSend((id)objc_msgSend(v45, "objectForKey:", _sqlEntityForEntityID(v48, v49 + v50)), "integerValue");
                      v94 = v49;
                      v52 = v92;
                      v53 = &v92[24 * v49];
                      *((_QWORD *)v53 + 1) = v51;
                      v54 = v53 + 8;
                      if (*(_QWORD *)&v52[24 * v49])
                      {
                        v97 = 0u;
                        v98 = 0u;
                        v95 = 0u;
                        v96 = 0u;
                        v55 = *(void **)&v92[24 * v94 + 16];
                        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
                        if (v56)
                        {
                          v57 = *(_QWORD *)v96;
                          do
                          {
                            for (j = 0; j != v56; ++j)
                            {
                              if (*(_QWORD *)v96 != v57)
                                objc_enumerationMutation(v55);
                              v59 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
                              v60 = (_QWORD *)objc_msgSend(v59, "entity");
                              if (v60)
                                v61 = _sqlCoreLookupSQLEntityForEntityDescription(v4, v60);
                              else
                                v61 = 0;
                              v62 = (void *)objc_msgSend(v4, "newObjectIDForEntity:pk:", v61, (*v54)--);
                              objc_msgSend(v8, "setObject:forKey:", v59, v62);

                            }
                            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
                          }
                          while (v56);
                        }
                      }
                      v49 = v94 + 1;
                      v46 = v90;
                      v45 = v88;
                      v48 = v89;
                    }
                    while (v94 != v91);
                  }
                  ++v46;
                }
                v64 = 0;
                v65 = 1;
              }
              else
              {
                if (v43)
                  v63 = (void *)v43[6];
                else
                  v63 = 0;
                v64 = v63;
                v65 = 0;
              }
              if (v93)
              {
                for (k = 0; objc_msgSend(v87, "count", v83) > k; ++k)
                {
                  v67 = (id *)v93[k];
                  v68 = v86[k];
                  if (v68 >= 1)
                  {
                    v69 = v67 + 5;
                    do
                    {

                      v69 += 3;
                      --v68;
                    }
                    while (v68);
                  }
                  free(v67);
                }
                free(v93);
              }

              free(v86);
              if (v64)
              {

                objc_exception_throw(v64);
              }
              if (v65)
              {
                v70 = objc_msgSend(v8, "count");
                v71 = v70;
                v94 = (uint64_t)&v83;
                if (v70 <= 1)
                  v72 = 1;
                else
                  v72 = v70;
                if (v70 >= 0x201)
                  v73 = 1;
                else
                  v73 = v72;
                v74 = (char *)&v83 - ((8 * v73 + 15) & 0xFFFFFFFFFFFFFFF0);
                v75 = 8 * v72;
                if (v70 > 0x200)
                {
                  v74 = (char *)NSAllocateScannedUncollectable();
                  v76 = (char *)NSAllocateScannedUncollectable();
                }
                else
                {
                  bzero((char *)&v83 - ((8 * v73 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v72);
                  v76 = (char *)&v83 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
                  bzero(v76, v75);
                }
                v78 = v71 < 0x201;
                objc_msgSend(v8, "getObjects:andKeys:", v76, v74);
                v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v74, v71);
                v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v76, v71);
                v77 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](v85, v80, v79);

                if (!v78)
                {
                  NSZoneFree(0, v74);
                  NSZoneFree(0, v76);
                }
              }
              else
              {
                v77 = 0;
              }

              v81 = objc_msgSend(v4, "doFilesystemCleanupOnRemove:", 0);
              if (v77)
              {
                if (v84)
                {
                  *v84 = v77;
                }
                else
                {
                  v82 = (void *)MEMORY[0x18D76B4E4](v81);
                  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v77);

                  objc_autoreleasePoolPop(v82);
                }
              }
              else if (v84)
              {
                *v84 = 0;
              }
              if (v65)
                return NSArray_EmptyArray;
              else
                return 0;
            }
          }
          v5 = objc_msgSend((id)v94, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
          result = 0;
          if (v5)
            continue;
          break;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return NSArray_EmptyArray;
    }
  }
  return result;
}

- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc(-[NSSQLCore objectIDFactoryForSQLEntity:](self, "objectIDFactoryForSQLEntity:", a3)), "initWithPK64:", a4);
}

sqlite3_int64 __31__NSSQLCore_currentChangeToken__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  sqlite3_int64 result;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  -[NSSQLiteConnection connect](v3);
  result = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:](v3, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("TRANSACTION")));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)ancillarySQLModels
{
  return self->_ancillarySQLModels;
}

- (void)_useModel:(id *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (a1[12] != a2)
    {
      v4 = (void *)MEMORY[0x18D76B4E4]();
      v5 = a2;

      a1[12] = a2;
      -[NSSQLiteAdapter _useModel:](objc_msgSend(a1, "adapter"), a2);
      -[NSSQLCore _setupHistoryModelForPSC:withExcludedEntityNames:]((uint64_t)a1, 0, (void *)NSSet_EmptySet);
      objc_autoreleasePoolPop(v4);
    }
  }
}

- (NSError)_newRowDataForXPCFetch:(void *)a3 variables:(uint64_t)a4 context:(NSError *)a5 error:
{
  NSError *error;
  NSSQLXPCFetchRequestContext *v9;
  const char *v10;
  NSSQLXPCFetchRequestContext *v11;
  void *v12;
  NSException *exception;
  NSError *v14;
  NSException *v16;

  error = a1;
  if (a1)
  {
    v9 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLXPCFetchRequestContext alloc], "initWithRequest:context:sqlCore:", a2, a4, a1);
    v11 = v9;
    if (v9)
      objc_setProperty_nonatomic(v9, v10, a3, 216);
    v12 = (void *)objc_msgSend(a2, "predicate");
    if (v12)
      objc_msgSend(v12, "minimalFormInContext:", 0);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)error, v11, 0);
    error = (NSError *)-[NSSQLStoreRequestContext result](v11, "result");
    if (error)
      goto LABEL_12;
    if (v11)
    {
      exception = v11->super.super._exception;
      if (exception)
      {
        v16 = exception;
        objc_exception_throw(exception);
      }
      if (!a5)
      {
        error = 0;
        goto LABEL_12;
      }
      error = v11->super.super._error;
    }
    else
    {
      error = 0;
      if (!a5)
        goto LABEL_12;
    }
    v14 = error;
    error = 0;
    *a5 = v14;
LABEL_12:

  }
  return error;
}

+ (int64_t)bufferedAllocationsOverride
{
  return qword_1ECD8D780;
}

- (id)metadata
{
  os_unfair_lock_s *p_sqlCoreStateLock;
  NSMutableDictionary *v4;

  p_sqlCoreStateLock = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_storeMetadata;
  os_unfair_lock_unlock(p_sqlCoreStateLock);
  return v4;
}

- (BOOL)loadMetadata:(id *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSSQLBlockRequestContext *v7;
  uint64_t v8;
  _BOOL4 v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  if (!self)
  {
    v9 = 1;
    if (!a3)
      return !v9;
    goto LABEL_6;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  v24 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __32__NSSQLCore__loadAndSetMetadata__block_invoke;
  v18[3] = &unk_1E1EDF610;
  v18[4] = self;
  v18[5] = &v19;
  if ((*(_BYTE *)&self->_sqlCoreFlags & 0x40) != 0)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = (uint64_t)__32__NSSQLCore__loadAndSetMetadata__block_invoke_2;
    v15 = (void (*)(uint64_t, uint64_t))&unk_1E1EDF638;
    v16 = (void (*)(uint64_t))v18;
    v7 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &v12, 0, self);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v7, 0);

  }
  else
  {
    v12 = 0;
    v13 = (uint64_t)&v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__23;
    v16 = __Block_byref_object_dispose__23;
    v17 = 0;
    v6 = -[NSSQLCore schemaValidationConnection](self);
    *(_QWORD *)(v13 + 40) = v6;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __32__NSSQLCore__loadAndSetMetadata__block_invoke_3;
    v11[3] = &unk_1E1EDF8C0;
    v11[4] = v18;
    v11[5] = &v12;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v6, (uint64_t)v11);
    _Block_object_dispose(&v12, 8);
  }
  v8 = v20[5];
  _Block_object_dispose(&v19, 8);
  v9 = v8 == 0;
  if (a3)
  {
LABEL_6:
    if (v9)
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134080, 0);
  }
  return !v9;
}

- (_QWORD)schemaValidationConnection
{
  _QWORD *v1;

  if ((result[24] & 0x40) != 0)
  {
    __break(1u);
  }
  else
  {
    v1 = result;
    result = (_QWORD *)result[14];
    if (!result)
    {
      result = -[NSSQLiteConnection initForSQLCore:]([NSSQLiteConnection alloc], "initForSQLCore:", v1);
      v1[14] = result;
    }
  }
  return result;
}

- (BOOL)supportsConcurrentRequestHandling
{
  int v3;
  id v4;
  const char *v5;

  v3 = -[NSSQLCore supportsComplexFeatures](self);
  if (v3)
  {
    v4 = -[NSDictionary valueForKey:](-[NSPersistentStore options](self, "options"), "valueForKey:", CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
    if (objc_msgSend(v4, "integerValue") > 0)
      goto LABEL_3;
    if (v4)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    v5 = getprogname();
    if (!v5 || (v3 = strncmp("YouTube", v5, 7uLL)) != 0)
LABEL_3:
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)load:(id *)a3
{
  _QWORD *v4;
  int v5;
  NSSQLiteConnection *schemaValidationConnection;
  _QWORD v8[7];
  _QWORD v9[3];
  char v10;

  if (self)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v4 = -[NSSQLCore schemaValidationConnection](self);
    if (-[NSSQLiteConnection canConnect]((uint64_t)v4)
      && (!-[NSSQLiteConnection databaseIsEmpty]((_BOOL8)v4) || (*((_BYTE *)&self->_sqlCoreFlags + 1) & 0x40) != 0))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__NSSQLCore__ensureDatabaseMatchesModel__block_invoke;
      v8[3] = &unk_1E1EDD138;
      v8[4] = v4;
      v8[5] = self;
      v8[6] = v9;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v4, (uint64_t)v8);
    }
    _Block_object_dispose(v9, 8);
  }
  v5 = *(_DWORD *)&self->_sqlCoreFlags | 0x40;
  self->_sqlCoreFlags = (_sqlCoreFlags)v5;
  schemaValidationConnection = self->_schemaValidationConnection;
  if (schemaValidationConnection)
    LODWORD(schemaValidationConnection) = ((*(_DWORD *)&schemaValidationConnection->_sqliteConnectionFlags & 0xC) == 4) << 7;
  self->_sqlCoreFlags = (_sqlCoreFlags)(schemaValidationConnection | v5 & 0xFFFFFF7F);
  self->_dispatchManager = -[NSSQLCoreDispatchManager initWithSQLCore:seedConnection:]([NSSQLCoreDispatchManager alloc], "initWithSQLCore:seedConnection:", self, self->_schemaValidationConnection);

  self->_schemaValidationConnection = 0;
  return 1;
}

- (void)_setupObserver
{
  char v3;
  int v4;
  _sqlCoreFlags sqlCoreFlags;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _NSSQLCoreConnectionObserver *v13;
  NSSQLCore *v14;
  _NSSQLCoreConnectionObserver *v15;
  void *v16;
  const char *v17;
  NSObject *queue;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD handler[4];
  id v35;
  id location;
  objc_super v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", CFSTR("NSPersistentStoreRemoteChangeNotificationOptionKey")), "BOOLValue");
  v4 = objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", CFSTR("NSXPCStorePostUpdateNotifications")), "BOOLValue");
  sqlCoreFlags = self->_sqlCoreFlags;
  if ((v3 & 1) != 0 || v4)
  {
    self->_sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&sqlCoreFlags | 0x1000);
LABEL_6:
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    {
      v6 = -[NSSQLCore identifier](self, "identifier");
      _NSCoreDataLog(9, (uint64_t)CFSTR("Remote Change Notification - registered core observer for %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    }
    v13 = [_NSSQLCoreConnectionObserver alloc];
    if (v13)
    {
      v37.receiver = v13;
      v37.super_class = (Class)_NSSQLCoreConnectionObserver;
      v14 = -[NSPersistentStore init](&v37, sel_init);
      v15 = (_NSSQLCoreConnectionObserver *)v14;
      if (!v14)
        goto LABEL_20;
      LODWORD(v14->super._configurationName) = -1;
      objc_storeWeak((id *)&v14->super._url, self);
      if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 0x10) == 0)
        goto LABEL_20;
      v16 = (void *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)_PFRoutines, self);
      if (!v16)
        goto LABEL_20;
      v15->_queue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.queue.%p"), v16, v15), "UTF8String"), 0);
      objc_initWeak(&location, v15);
      v17 = (const char *)objc_msgSend(v16, "fileSystemRepresentation");
      queue = v15->_queue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __48___NSSQLCoreConnectionObserver_initWithSQLCore___block_invoke;
      handler[3] = &unk_1E1EDF878;
      objc_copyWeak(&v35, &location);
      v19 = notify_register_dispatch(v17, &v15->_token, queue, handler);
      if (!(_DWORD)v19)
      {
        if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
          _NSCoreDataLog(9, (uint64_t)CFSTR("Remote Change Notification - registered for  %@"), v28, v29, v30, v31, v32, v33, (uint64_t)v16);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
        goto LABEL_20;
      }
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Remote Change Notification - Failed to setup notification listener for NSPersistentStoreRemoteChangeNotification: %d");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, v19);
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v19;
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Remote Change Notification - Failed to setup notification listener for NSPersistentStoreRemoteChangeNotification: %d", buf, 8u);
      }

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    v15 = 0;
LABEL_20:
    self->_observer = v15;
    return;
  }
  if ((*(_WORD *)&sqlCoreFlags & 0x1000) != 0)
    goto LABEL_6;
}

- (void)_initializeQueryGenerationConnectionForProtectionClasses
{
  const char *v2;
  BOOL v3;
  uint64_t v4;
  void *v5;
  _BOOL4 GenerationTracking;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;

  if (a1)
  {
    v2 = getprogname();
    v3 = v2 && strcmp("routined", v2) == 0;
    if (objc_msgSend(a1, "supportsGenerationalQuerying"))
    {
      if ((objc_msgSend(a1, "isReadOnly") & 1) == 0)
      {
        v4 = objc_msgSend((id)objc_msgSend(a1, "options"), "objectForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
        if (v4)
        {
          v5 = (void *)v4;
          if (objc_msgSend(a1, "_isCloudKitOptioned"))
          {
            if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2AB8]) & 1) != 0
              || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2AB0]))
            {
              if (a1[25])
              {
                if (!v3)
                  return;
              }
              else
              {
                GenerationTracking = -[NSSQLCore _initializeQueryGenerationTrackingConnection]((_BOOL8)a1);
                if (!v3)
                  return;
                if (GenerationTracking)
                {
                  v7 = objc_msgSend(a1, "options");
                  v14 = CFSTR("Preloading query generation connection success for store with options: %@");
LABEL_18:
                  _NSCoreDataLog(2, (uint64_t)v14, v8, v9, v10, v11, v12, v13, v7);
                  return;
                }
              }
              v7 = objc_msgSend(a1, "options");
              v14 = CFSTR("Preloading query generation connection failed without a reported error for store with options: %@");
              goto LABEL_18;
            }
          }
        }
      }
    }
  }
}

+ (void)initialize
{
  void *v2;
  void *v3;
  int v4;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;

  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_class();
    objc_opt_self();
    dword_1ECD8D774 = +[_PFRoutines sensitiveIntegerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.SQLDebug"));
    v2 = +[_PFRoutines stringValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.ConcurrentFetching"));
    if (v2 && (v3 = v2, objc_msgSend(v2, "length")))
      v4 = objc_msgSend(v3, "intValue");
    else
      v4 = 1;
    dword_1ECD8D778 = v4;
    v6 = (int)+[_PFTask getNumActiveProcessors]() > 1 && dword_1ECD8D778 > 0;
    dword_1ECD8D778 = v6;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"), "timeIntervalSinceReferenceDate");
    NSSQLDistantPastTimeInterval = v7;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
    NSSQLDistantFutureTimeInterval = v8;
    qword_1ECD8D788 = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v9 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.BufferAllocations"));
    qword_1ECD8D780 = v9;
    if (v9 >= 1)
      _NSCoreDataLog(2, (uint64_t)CFSTR("Dictionary Result type overridden to use Buffered Results with level - %ld!!!"), v10, v11, v12, v13, v14, v15, v9);
    _CoreData_debugVMBufferAllocations = +[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.BufferAllocations.VMMemory"));
    _CoreData_debugOneBufferAllocations = +[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.BufferAllocations.OneBuffer"));
    _CoreData_debuguseManyResultSetsAllocations = +[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.BufferAllocations.ManyResultSets"));
    _MergedGlobals_176 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.SQLDatabaseStatistics")) != 0;
    v16 = getprogname();
    if (v16)
    {
      v17 = v16;
      if (!strncmp("xctest", v16, 6uLL) || !strncmp("mapssyncd", v17, 9uLL))
        byte_1ECD8D771 = 1;
    }
  }
}

- (void)_supportDirectoryPath
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = (void *)objc_msgSend(result, "URL");
    if ((objc_msgSend(v1, "isFileURL") & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't write external data to non-file URL"), 0));
    v2 = (void *)objc_msgSend(v1, "path");
    return (void *)objc_msgSend((id)objc_msgSend(v2, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(CFSTR("."), "stringByAppendingString:", objc_msgSend((id)objc_msgSend(v2, "lastPathComponent"), "stringByDeletingPathExtension")), "stringByAppendingString:", CFSTR("_SUPPORT")));
  }
  return result;
}

- (void)setMetadata:(id)a3
{
  id v5;
  uint64_t v6;

  if (-[NSPersistentStore isReadOnly](self, "isReadOnly"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set metadata in read-only store."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self), CFSTR("NSAffectedStoresErrorKey"), 0)));
  v5 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:](self, "_updatedMetadataWithSeed:includeVersioning:", a3, 1);
  os_unfair_lock_lock_with_options();
  v6 = -[NSMutableDictionary objectForKey:](self->_storeMetadata, "objectForKey:", CFSTR("_NSAutoVacuumLevel"));
  os_unfair_lock_unlock(&self->_sqlCoreStateLock);
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("_NSAutoVacuumLevel"));
  -[NSSQLCore _setMetadata:clean:]((uint64_t)self, v5, 0);
}

- (id)currentQueryGeneration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 remoteStoresDidChange;
  uint64_t v10;
  NSSQLBlockRequestContext *v11;
  NSSQLiteConnection *queryGenerationTrackingConnection;
  _NSQueryGenerationToken *v13;
  _QWORD *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSSQLCore supportsGenerationalQuerying](self, "supportsGenerationalQuerying"))
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v26 = CFSTR("store");
    v27[0] = self;
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unsupported feature in this configuration"), v17));
  }
  if (self->_queryGenerationTrackingConnection
    || -[NSSQLCore _initializeQueryGenerationTrackingConnection]((_BOOL8)self))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__23;
    v24 = __Block_byref_object_dispose__23;
    v25 = 0;
    os_unfair_lock_lock_with_options();
    remoteStoresDidChange = self->_remoteStoresDidChange;
    os_unfair_lock_unlock(&self->_sqlCoreStateLock);
    v10 = MEMORY[0x1E0C809B0];
    if (remoteStoresDidChange)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __35__NSSQLCore_currentQueryGeneration__block_invoke;
      v19[3] = &unk_1E1EDF660;
      v19[4] = self;
      v11 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v19, 0, self);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v11, 0);

    }
    queryGenerationTrackingConnection = self->_queryGenerationTrackingConnection;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = (uint64_t)__35__NSSQLCore_currentQueryGeneration__block_invoke_397;
    v18[3] = (uint64_t)&unk_1E1EDD618;
    v18[4] = (uint64_t)self;
    v18[5] = (uint64_t)&v20;
    -[NSSQLiteConnection performAndWait:]((uint64_t)queryGenerationTrackingConnection, (uint64_t)v18);
    if (v21[5])
    {
      v13 = [_NSQueryGenerationToken alloc];
      v14 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v13, (void *)v21[5], self, 1);

    }
    else
    {
      v14 = 0;
    }
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("initializing query generations connection for current failed."), v3, v4, v5, v6, v7, v8, v18[0]);
    return 0;
  }
  return v14;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  return (id)-[NSSQLCore _obtainPermanentIDsForObjects:withNotification:error:]((uint64_t)self, a3, 0);
}

void __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke(uint64_t a1)
{
  id *v1;
  id Weak;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_time_t v11;
  NSObject *global_queue;
  _QWORD block[4];
  id v14;

  v1 = (id *)(a1 + 32);
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v3 = (uint64_t)Weak;
    v4 = (void *)MEMORY[0x18D76B4E4]();
    objc_msgSend((id)v3, "identifier");
    _NSCoreDataLog(2, (uint64_t)CFSTR("cache_handle_memory_pressure invoked for core %p / %@"), v5, v6, v7, v8, v9, v10, v3);
    -[NSSQLCoreDispatchManager enumerateAvailableConnectionsWithBlock:](*(_QWORD *)(v3 + 120), (uint64_t)&__block_literal_global_728);
    -[NSGenerationalRowCache forgetAllGenerationalExternalData](*(_QWORD *)(v3 + 128));
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_lock_with_options();
    dispatch_suspend(*(dispatch_object_t *)(v3 + 264));
    *(_DWORD *)(v3 + 192) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 144));
    v11 = dispatch_time(0, 10000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke_2;
    block[3] = &unk_1E1EDE1A0;
    objc_copyWeak(&v14, v1);
    dispatch_after(v11, global_queue, block);
    objc_destroyWeak(&v14);
  }
}

uint64_t __49__NSSQLCore__registerNewQueryGenerationSnapshot___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[NSSQLiteConnection _registerNewQueryGenerationSnapshot:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), *(void **)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = a1;
  if (a1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v3 = *(_QWORD *)(a1 + 200);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__NSSQLCore__registerNewQueryGenerationSnapshot___block_invoke;
    v5[3] = &unk_1E1EDE1F0;
    v5[5] = a2;
    v5[6] = &v6;
    v5[4] = v2;
    -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v5);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(v2 + 256) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 144));
    v2 = *((unsigned int *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }
  return v2;
}

+ (void)setDebugDefault:(int)a3
{
  dword_1ECD8D774 = a3;
}

+ (void)setColoredLoggingDefault:(BOOL)a3
{
  _CoreData_SyntaxColoredLogging = a3;
}

+ (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3
{
  _MergedGlobals_176 = a3;
}

+ (Class)migrationManagerClass
{
  return (Class)objc_opt_class();
}

void __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *Weak;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  NSObject *v4;

  Weak = (os_unfair_lock_s *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = Weak;
    v3 = Weak + 36;
    os_unfair_lock_lock_with_options();
    v4 = *(NSObject **)&v2[66]._os_unfair_lock_opaque;
    if (v4)
    {
      dispatch_resume(v4);
      v2[48]._os_unfair_lock_opaque &= ~0x20000u;
    }
    os_unfair_lock_unlock(v3);
  }
}

void __18__NSSQLCore_load___block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

void __18__NSSQLCore_load___block_invoke_2(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

- (uint64_t)_rebuildTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _WORD *v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[6];
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  int v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v4 = *(_QWORD *)(a1 + 96);
  if (v4)
    v5 = *(void **)(v4 + 32);
  else
    v5 = 0;
  v6 = (void *)objc_msgSend(v5, "allValues");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (!v7)
    goto LABEL_53;
  v41 = *(_QWORD *)v57;
  v44 = 1;
  v8 = MEMORY[0x1E0C809B0];
  do
  {
    v9 = 0;
    v42 = v7;
    do
    {
      if (*(_QWORD *)v57 != v41)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v9);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      if (v10)
        v11 = *(void **)(v10 + 40);
      else
        v11 = 0;
      v12 = (void *)objc_msgSend(v11, "allValues");
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      v43 = v9;
      if (v13)
      {
        v14 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v53 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_WORD **)(*((_QWORD *)&v52 + 1) + 8 * i);
            v17 = objc_msgSend(v16, "propertyType");
            if (v16)
              v18 = v17 == 1;
            else
              v18 = 0;
            if (v18 && (v16[16] & 8) != 0)
            {
              v19 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]((uint64_t)NSSQLAttributeExtensionFactory, v16, (uint64_t *)&v60);
              v20 = v19;
              if (v19)
              {
                v50[0] = v8;
                v50[1] = 3221225472;
                v50[2] = __72__NSSQLCore__rebuildTriggerSchemaUsingConnection_recomputeValues_error___block_invoke;
                v50[3] = &unk_1E1EDF770;
                v50[4] = v10;
                v50[5] = v45;
                v51 = 0;
                objc_msgSend(v19, "enumerateObjectsUsingBlock:", v50);
              }
              else
              {
                v44 = 0;
              }

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        }
        while (v13);
      }
      v9 = v43 + 1;
    }
    while (v43 + 1 != v42);
    v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    v7 = v21;
  }
  while (v21);
  if ((v44 & 1) != 0)
  {
LABEL_53:
    if (objc_msgSend(v45, "count"))
    {
      -[NSSQLiteConnection beginTransaction](a2);
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v23 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v46, v65, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v47 != v24)
              objc_enumerationMutation(v45);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, *(_QWORD **)(*((_QWORD *)&v46 + 1) + 8 * j));
          }
          v23 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v46, v65, 16);
        }
        while (v23);
      }
      v22 = 1;
      -[NSSQLiteConnection commitTransaction](a2);
    }
    else
    {
      v22 = 1;
    }
  }
  else
  {
    v22 = 0;
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:](a2, 0);
  v26 = v60;

  v27 = 0;
  v28 = v60;
  if ((v22 & 1) == 0)
  {
    if (v60)
    {
      if (a3)
        *a3 = v60;
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
      v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
        v63 = 1024;
        v64 = 5430;
        _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v22;
}

- (id)_rebuildDerivedAttributeTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSQLEntity_DerivedAttributesExtension *v10;
  NSSQLEntity_DerivedAttributesExtension *v11;
  NSMutableDictionary *migrationSQL;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(_QWORD *)(a1 + 96);
  if (v4)
    v5 = *(void **)(v4 + 32);
  else
    v5 = 0;
  v6 = (void *)objc_msgSend(v5, "allValues", v21);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v6);
        v10 = -[NSSQLEntity derivedAttributesExtension](*(NSSQLEntity_DerivedAttributesExtension **)(*((_QWORD *)&v28 + 1) + 8 * v9));
        v11 = v10;
        if (v10)
        {
          -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL]((uint64_t)v10);
          migrationSQL = v11->_migrationSQL;
        }
        else
        {
          migrationSQL = 0;
        }
        v13 = -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", CFSTR("dropStatements"));
        v14 = -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", CFSTR("triggerCreationStatements"));
        objc_msgSend(v3, "addObjectsFromArray:", v13);
        objc_msgSend(v3, "addObjectsFromArray:", v14);
        objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", CFSTR("dataStatements")));
        ++v9;
      }
      while (v7 != v9);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v7 = v15;
    }
    while (v15);
  }
  if (objc_msgSend(v3, "count"))
  {
    -[NSSQLiteConnection beginTransaction](a2);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v3);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, *(_QWORD **)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }
    -[NSSQLiteConnection commitTransaction](a2);
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:](a2, 0);

  v19 = 0;
  return 0;
}

- (void)_updateToVersion640PrimaryKeyTableUsingStatements:(_QWORD *)a3 connection:
{
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSSQLiteConnection connect]((uint64_t)a3);
  -[NSSQLiteConnection beginTransaction]((uint64_t)a3);
  v6 = -[NSSQLiteConnection fetchMetadata]((uint64_t)a3);
  v7 = (void *)objc_msgSend(v6, "objectForKey:", 0x1E1EF14B0);
  if (v7 && (int)objc_msgSend(v7, "intValue") <= 639)
  {
    v8 = (__CFString *)objc_msgSend(v6, "mutableCopy");
    -[__CFString setObject:forKey:](v8, "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
    -[NSSQLiteConnection saveMetadata:](a3, v8);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(a2);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a3, *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
    -[NSSQLiteConnection commitTransaction]((uint64_t)a3);
    objc_msgSend(*(id *)(a1 + 152), "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
  }
  else
  {
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a3);
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a3, 0);
}

uint64_t __32__NSSQLCore__loadAndSetMetadata__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __32__NSSQLCore__loadAndSetMetadata__block_invoke_4(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __20__NSSQLCore_dealloc__block_invoke_2(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
}

- (id)newObjectIDSetsForToManyPrefetchingRequest:(uint64_t)a3 andSourceObjectIDs:(uint64_t)a4 orderColumnName:
{
  id v4;
  NSSQLObjectIDSetFetchRequestContext *v5;

  v4 = a1;
  if (a1)
  {
    v5 = -[NSSQLObjectIDSetFetchRequestContext initWithRequest:context:sqlCore:idSets:columnName:]([NSSQLObjectIDSetFetchRequestContext alloc], "initWithRequest:context:sqlCore:idSets:columnName:", a2, 0, a1, a3, a4);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v4, v5, 0);
    v4 = -[NSSQLStoreRequestContext result](v5, "result");

  }
  return v4;
}

void __38__NSSQLCore__disconnectAllConnections__block_invoke_2(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
}

- (void)_rebuildIndiciesSynchronously:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSSQLBlockRequestContext *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *global_queue;
  _QWORD block[6];
  _QWORD v16[5];

  v3 = a3;
  if (-[NSPersistentStore isReadOnly](self, "isReadOnly")
    || !-[NSPersistentStore persistentStoreCoordinator](self, "persistentStoreCoordinator")
    || (*((_BYTE *)&self->_sqlCoreFlags + 1) & 1) != 0)
  {
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    {
      v7 = -[NSSQLCore identifier](self, "identifier");
      -[NSPersistentStore isReadOnly](self, "isReadOnly");
      _NSCoreDataLog(4, (uint64_t)CFSTR("Unable to reindex store(%@) - %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    }
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke;
    v16[3] = &unk_1E1EDF660;
    v16[4] = self;
    if (v3)
    {
      v6 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v16, 0, self);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v6, 0);

    }
    else
    {
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke_297;
      block[3] = &unk_1E1EDE8A0;
      block[4] = self;
      block[5] = v16;
      dispatch_async(global_queue, block);
    }
  }
}

void __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  if (-[NSSQLiteConnection recreateIndices](v3))
  {
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setValue:forKey:", 0, CFSTR("NSPersistentStoreRebuildIndicies"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 188) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setMetadataDirty:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
    v10 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    _NSCoreDataLog(2, (uint64_t)CFSTR("Finished rebuilding indicies for store - %@"), v11, v12, v13, v14, v15, v16, v10);
  }
  else
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Index recreation failed"), v4, v5, v6, v7, v8, v9, v17);
  }
}

void __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke_297(uint64_t a1)
{
  NSSQLBlockRequestContext *v2;

  v2 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
  -[NSSQLCore dispatchRequest:withRetries:](*(_QWORD *)(a1 + 32), v2, 0);

}

+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(a3, "path");
  v4 = objc_msgSend((id)objc_msgSend(v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(CFSTR("."), "stringByAppendingString:", objc_msgSend((id)objc_msgSend(v3, "lastPathComponent"), "stringByDeletingPathExtension")), "stringByAppendingString:", CFSTR("_SUPPORT")));
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
}

- (uint64_t)safeguardLocationForFileWithUUID:(uint64_t)a1
{
  if (!a1 || !objc_msgSend(a2, "length"))
    return 0;
  if (!*(_QWORD *)(a1 + 160))
    objc_msgSend((id)a1, "externalDataReferencesDirectory");
  return objc_msgSend(*(id *)(a1 + 168), "stringByAppendingPathComponent:", a2);
}

- (void)resetExternalDataReferencesDirectories
{
  if (a1)
  {

    a1[21] = 0;
    a1[20] = 0;

    a1[22] = 0;
  }
}

- (id)cachedModelWithError:(id)result
{
  uint64_t v3;
  NSSQLBlockRequestContext *v4;
  id v5;
  NSError *error;
  NSError *v7;
  NSException *exception;
  NSException *v9;

  if (result)
  {
    v3 = (uint64_t)result;
    if (a2)
      *a2 = 0;
    v4 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &__block_literal_global_13, 0, result);
    -[NSSQLCore dispatchRequest:withRetries:](v3, v4, 0);
    v5 = -[NSSQLStoreRequestContext result](v4, "result");
    if (v4)
      error = v4->super._error;
    else
      error = 0;
    v7 = error;
    if (!v5)
    {
      if (v4)
      {
        exception = v4->super._exception;
        if (exception)
        {
          v9 = exception;
          objc_exception_throw(exception);
        }
      }
      v5 = 0;
      if (a2)
        *a2 = v7;
    }

    return v5;
  }
  return result;
}

void __34__NSSQLCore_cachedModelWithError___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  const char *v5;

  if (a2)
    v3 = (void *)a2[3];
  else
    v3 = 0;
  if (-[NSSQLiteConnection canConnect]((uint64_t)v3))
  {
    -[NSSQLiteConnection connect]((uint64_t)v3);
    objc_msgSend(a2, "setResult:", -[NSSQLiteConnection fetchCachedModel](v3));
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134180, &unk_1E1F4AF48);
    if (a2)
      objc_setProperty_nonatomic(a2, v5, v4, 40);
  }
}

- (void)setIdentifier:(id)a3
{
  os_unfair_lock_s *p_sqlCoreStateLock;

  p_sqlCoreStateLock = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKey:](self->_storeMetadata, "setObject:forKey:", a3, CFSTR("NSStoreUUID"));
  self->_metadataIsClean = 0;
  -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 1);
  os_unfair_lock_unlock(p_sqlCoreStateLock);
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "metadataForPersistentStoreWithURL:options:error:", a3, 0, a4);
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "setMetadata:forPersistentStoreWithURL:options:error:", a3, a4, 0, a5);
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  objc_super v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___NSSQLCore;
  if (!objc_msgSendSuper2(&v20, sel_setMetadata_forPersistentStoreWithURL_error_, a3, a4, a6))
    return 0;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 240.0);
  v21 = CFSTR("journal_mode");
  v22[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("NSPersistentStoreTimeoutOption"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1), CFSTR("NSSQLitePragmasOption"), 0);
  v14 = v13;
  if (a5)
  {
    objc_msgSend(v13, "addEntriesFromDictionary:", a5);
    objc_msgSend(v14, "removeObjectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
    v15 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
    if (objc_msgSend(v15, "objectForKey:", CFSTR("journal_mode")))
    {
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      objc_msgSend(v16, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"));
      objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("NSSQLitePragmasOption"));

    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, a4, a5, (uint64_t *)a6))return 0;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, a4, v14);
  if (objc_msgSend(v17, "loadMetadata:", a6) && objc_msgSend(v17, "load:", a6))
  {
    objc_msgSend(v17, "setMetadata:", a3);
    v18 = objc_msgSend(v17, "executeRequest:withContext:error:", objc_alloc_init(NSSaveChangesRequest), 0, a6) != 0;
  }
  else
  {
    v18 = 0;
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v17);

  return v18;
}

+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || !objc_msgSend(a3, "isFileURL"))
  {
    if (a5)
    {
      v16 = 0;
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, &unk_1E1F4AF70);
      return v16;
    }
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)
  {
    if (a5)
    {
      v17 = objc_alloc(MEMORY[0x1E0C99D80]);
      v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", a3, *MEMORY[0x1E0CB3308], 0);
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v18);

    }
    return 0;
  }
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 240.0);
  v20 = CFSTR("journal_mode");
  v21[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSPersistentStoreTimeoutOption"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1), CFSTR("NSSQLitePragmasOption"), 0);
  v12 = v11;
  if (a4)
  {
    objc_msgSend(v11, "addEntriesFromDictionary:", a4);
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
    v13 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
    if (objc_msgSend(v13, "objectForKey:", CFSTR("journal_mode")))
    {
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"));
      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("NSSQLitePragmasOption"));

    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, a3, a4, (uint64_t *)a5))return 0;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, a3, v12);
  if (objc_msgSend(v15, "loadMetadata:", a5) && objc_msgSend(v15, "load:", a5))
    v16 = -[NSSQLCore cachedModelWithError:](v15, (NSError **)a5);
  else
    v16 = 0;
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v15);

  return v16;
}

+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  if (a3 && (objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    v20 = 0;
    v9 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Destroying store"), &v20);
    if (+[NSSQLiteConnection _destroyPersistentStoreAtURL:options:error:]((uint64_t)NSSQLiteConnection, a3, a4, (uint64_t *)a5))
    {
      v10 = objc_msgSend(a1, "_figureOutWhereExternalReferencesEndedUpRelativeTo:", a3);
      if (!v10
        || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v10, 0) & 1) != 0
        || +[NSSQLCore debugDefault](NSSQLCore, "debugDefault") < 1)
      {
        v12 = 1;
      }
      else
      {
        v11 = objc_msgSend(a3, "path");
        v12 = 1;
        _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to delete support directory for store: %@"), v13, v14, v15, v16, v17, v18, v11);
      }
    }
    else
    {
      v12 = 0;
    }
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v20, v9);
  }
  else
  {
    v12 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Only persistent stores backed by files can be destroyed"), a4, *MEMORY[0x1E0CB2D50], 0));
  }
  return v12;
}

+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7
{
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  int v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;

  if (a5)
  {
    v13 = objc_msgSend(a5, "isFileURL");
    if (a3)
    {
      if (v13 && (objc_msgSend(a3, "isFileURL") & 1) != 0)
      {
        v80 = 0;
        v74 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Replacing entire store"), &v80);
        v14 = (void *)objc_msgSend(a1, "_figureOutWhereExternalReferencesEndedUpRelativeTo:", a3);
        v76 = (void *)objc_msgSend(a1, "_figureOutWhereExternalReferencesEndedUpRelativeTo:", a5);
        v78 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", objc_msgSend((id)objc_msgSend(v14, "path"), "stringByAppendingString:", CFSTR("_transsrc_4052146efa0d85c9fbe0634c0e8bc4457ed82f7c")), 1);
        v77 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", objc_msgSend((id)objc_msgSend(v14, "path"), "stringByAppendingString:", CFSTR("_transdst_878d188f109e9f52ae70b0b25413f6a38c8267a8")), 1);
        v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v75 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v76, "path"));
        v73 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v14, "path"));
        v16 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v78, "path"));
        v17 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v77, "path"));
        if (!v16)
          goto LABEL_15;
        v79 = 0;
        if ((objc_msgSend(v15, "removeItemAtURL:error:", v78, &v79) & 1) != 0)
          goto LABEL_15;
        if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
        {
          v18 = objc_msgSend(v78, "path");
          _NSCoreDataLog(4, (uint64_t)CFSTR("Failed to delete staging area for external support directory for store: %@"), v19, v20, v21, v22, v23, v24, v18);
        }
        if (v75)
        {
          v25 = 0;
          if (a7)
            *a7 = v79;
        }
        else
        {
LABEL_15:
          v25 = 1;
        }
        v27 = v75;
        if (!v25)
          v27 = 0;
        if (v27 == 1)
        {
          v79 = 0;
          v28 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v76, v78, &v79);
          if ((v28 & 1) == 0)
          {
            if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
            {
              v72 = objc_msgSend(a5, "path");
              objc_msgSend(v78, "path");
              _NSCoreDataLog(4, (uint64_t)CFSTR("Failed to copy support directory from store: %@ to store: %@.  %@"), v29, v30, v31, v32, v33, v34, v72);
            }
            if (a7)
              *a7 = v79;
          }
          v25 = v28;
        }
        else
        {
          v28 = 0;
        }
        if (v25)
          v35 = v17;
        else
          v35 = 0;
        if (v35 == 1)
        {
          v79 = 0;
          if ((objc_msgSend(v15, "removeItemAtURL:error:", v77, &v79) & 1) != 0)
            goto LABEL_36;
          if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
          {
            v36 = objc_msgSend(a5, "path");
            objc_msgSend(v78, "path");
            _NSCoreDataLog(4, (uint64_t)CFSTR("Failed to copy support directory from store: %@ to store: %@.  %@"), v37, v38, v39, v40, v41, v42, v36);
          }
          if (!v73)
          {
LABEL_36:
            v25 = 1;
          }
          else
          {
            v25 = 0;
            if (a7)
              *a7 = v79;
          }
        }
        if (v25)
        {
          v43 = +[NSSQLiteConnection _replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:]((uint64_t)NSSQLiteConnection, a3, a4, a5, a6, (uint64_t *)a7);
          if ((v43 & v73) == 1)
          {
            v79 = 0;
            v44 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v14, v77, &v79);
            if ((v44 & 1) != 0)
              goto LABEL_47;
            if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
            {
              v45 = objc_msgSend(a3, "path");
              _NSCoreDataLog(4, (uint64_t)CFSTR("Failed to delete support directory for store: %@.  %@"), v46, v47, v48, v49, v50, v51, v45);
            }
            if (!v75)
            {
LABEL_47:
              v43 = 1;
            }
            else
            {
              v43 = 0;
              if (a7)
                *a7 = v79;
            }
          }
          else
          {
            v44 = 0;
          }
          if (v43)
            v52 = v28;
          else
            v52 = 0;
          if (v52 == 1)
          {
            v79 = 0;
            v53 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v78, v14, &v79);
            if ((v53 & 1) == 0 && +[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
            {
              v54 = objc_msgSend(a5, "path");
              objc_msgSend(a3, "path");
              _NSCoreDataLog(4, (uint64_t)CFSTR("Failed to copy support directory from store: %@ to store: %@ (failed to move %@ to %@ due to %@)"), v55, v56, v57, v58, v59, v60, v54);
            }
            v43 = v53;
          }
        }
        else
        {
          v44 = 0;
          v43 = 0;
        }
        v61 = (void *)objc_msgSend(a6, "objectForKey:", CFSTR("NSPersistentStoreUnlinkDestroyOption"));
        if (v61)
        {
          v62 = objc_msgSend(v61, "BOOLValue");
          v63 = v43 == 0;
          if (v43 && ((v62 ^ 1) & 1) == 0)
          {
            v79 = 0;
            if ((objc_msgSend(v15, "removeItemAtURL:error:", v76, &v79) & 1) == 0
              && +[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
            {
              v64 = objc_msgSend(v76, "path");
              objc_msgSend(a5, "path");
              _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to unlink support directory %@ from old store location: %@ due to %@"), v65, v66, v67, v68, v69, v70, v64);
            }
LABEL_65:
            if (v44)
              objc_msgSend(v15, "removeItemAtURL:error:", v77, 0);
            v26 = v43 != 0;
            +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v80, v74);
            return v26;
          }
        }
        else
        {
          v63 = v43 == 0;
        }
        if ((v63 & v28) == 1)
          objc_msgSend(v15, "removeItemAtURL:error:", v78, 0);
        goto LABEL_65;
      }
    }
  }
  v26 = 0;
  if (a7)
    *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Both source and destination stores must be backed by files"), a4, *MEMORY[0x1E0CB2D50], 0));
  return v26;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v14;

  if (a3 && (objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    v14 = 0;
    v10 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Rekeying entire store"), &v14);
    v11 = +[NSSQLCore _databaseKeyFromValue:]((uint64_t)NSSQLCore, a5);
    v12 = +[NSSQLiteConnection _rekeyPersistentStoreAtURL:options:withKey:error:]((uint64_t)NSSQLiteConnection, a3, a4, v11, (uint64_t *)a6);
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v14, v10);
  }
  else
  {
    v12 = 0;
    if (a6)
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Only persistent stores backed by files can be rekeyed"), a4, a5, *MEMORY[0x1E0CB2D50], 0));
  }
  return v12;
}

- (BOOL)_initializeQueryGenerationTrackingConnection
{
  uint64_t v1;
  id v2;
  unint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[8];
  _QWORD v15[5];

  if (result)
  {
    v1 = result;
    v2 = -[NSSQLiteConnection initAsQueryGenerationTrackingConnectionForSQLCore:]([NSSQLiteConnection alloc], "initAsQueryGenerationTrackingConnectionForSQLCore:", result);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__NSSQLCore__initializeQueryGenerationTrackingConnection__block_invoke;
    v15[3] = &unk_1E1EDD520;
    v15[4] = v2;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v2, (uint64_t)v15);
    if (v2)
    {
      os_unfair_lock_lock_with_options();
      v3 = (unint64_t *)(v1 + 200);
      while (!__ldaxr(v3))
      {
        if (!__stlxr((unint64_t)v2, v3))
          goto LABEL_10;
      }
      __clrex();

LABEL_10:
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 144));
      return *(_QWORD *)(v1 + 200) != 0;
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An unreported error occurred during initialization of query generation connection.");
      _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v13);
      v12 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: An unreported error occurred during initialization of query generation connection.", buf, 2u);
        return 0;
      }
    }
  }
  return result;
}

void __57__NSSQLCore__initializeQueryGenerationTrackingConnection__block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection connect](*(_QWORD *)(a1 + 32));
}

uint64_t __34__NSSQLCore__hasActiveGenerations__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(-[NSSQLiteConnection _activeGenerations](*(id **)(*(_QWORD *)(a1 + 32) + 200)), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __35__NSSQLCore_currentQueryGeneration__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  if (a2)
    v2 = *(void **)(a2 + 24);
  else
    v2 = 0;
  if (objc_msgSend(v2, "registerCurrentQueryGenerationWithStore:", *(_QWORD *)(a1 + 32)))
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to adopt query generation from remote change");
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v11);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: Failed to adopt query generation from remote change", (uint8_t *)&v11, 2u);
    }
  }
}

void __35__NSSQLCore_currentQueryGeneration__block_invoke_397(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLiteConnection currentQueryGenerationIdentifier](*(_PFSQLiteSnapshotWrapper **)(*(_QWORD *)(a1 + 32) + 200));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    _NSCoreDataLog(1, (uint64_t)CFSTR("SQLCore failed to get a currentQueryGeneration"), v10, v11, v12, v13, v14, v15, a9);
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSQLBlockRequestContext *v13;
  id v14;
  id result;
  NSException *exception;
  NSError *error;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD *);
  void *v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSSQLCore supportsGenerationalQuerying](self, "supportsGenerationalQuerying"))
  {
    v18 = *MEMORY[0x1E0C99768];
    v24 = CFSTR("store");
    v25[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v18, CFSTR("Unsupported feature in this configuration"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1)));
  }
  if (!self->_queryGenerationTrackingConnection
    && !-[NSSQLCore _initializeQueryGenerationTrackingConnection]((_BOOL8)self))
  {
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134502, 0);
    _NSCoreDataLog(1, (uint64_t)CFSTR("initializing query generations connection failed."), v7, v8, v9, v10, v11, v12, v19);
    return 0;
  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke;
  v22 = &unk_1E1EDF660;
  v23 = a3;
  v13 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &v19, 0, self);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v13, 0);
  v14 = -[NSSQLStoreRequestContext result](v13, "result", v19, v20, v21, v22, v23);
  if (v14)
    return -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:]([_NSQueryGenerationToken alloc], v14, self, 1);
  if (v13)
  {
    exception = v13->super._exception;
    if (exception)
      objc_exception_throw(exception);
    if (a4)
    {
      error = v13->super._error;
LABEL_10:
      result = 0;
      *a4 = error;
      return result;
    }
    return 0;
  }
  error = 0;
  result = 0;
  if (a4)
    goto LABEL_10;
  return result;
}

void __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  id newValue;

  if (a2)
    v4 = a2[3];
  else
    v4 = 0;
  -[NSSQLiteConnection connect](v4);
  newValue = 0;
  v6 = -[NSSQLiteConnection reopenQueryGenerationWithIdentifier:error:](v4, *(void **)(a1 + 32), &newValue);
  if (v6)
  {
    objc_msgSend(a2, "setResult:", v6);
  }
  else if (a2)
  {
    objc_setProperty_nonatomic(a2, v5, newValue, 40);
  }
}

- (id)connectionForMigration
{
  id v1;
  _QWORD v3[5];

  v1 = a1;
  if (a1)
  {
    v1 = -[NSSQLiteConnection initForSQLCore:]([NSSQLiteConnection alloc], "initForSQLCore:", a1);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __35__NSSQLCore_connectionForMigration__block_invoke;
    v3[3] = &unk_1E1EDD520;
    v3[4] = v1;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v1, (uint64_t)v3);
  }
  return v1;
}

void __35__NSSQLCore_connectionForMigration__block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection connect](*(_QWORD *)(a1 + 32));
}

- (void)setURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSSQLCore;
  -[NSPersistentStore setURL:](&v4, sel_setURL_, a3);
  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  -[NSSQLCore resetExternalDataReferencesDirectories]((id *)&self->super.super.isa);
}

- (_QWORD)_cacheRows:(_QWORD *)result
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = -[NSSQLCore rowCacheForGeneration:](result, 0);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = (_QWORD *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(a2);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6);
          v8 = (void *)objc_msgSend(v7, "objectID");
          if (v3)
            -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v3, (unsigned int *)v7, v8, 0);
          v6 = (_QWORD *)((char *)v6 + 1);
        }
        while (v4 != v6);
        result = (_QWORD *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (_QWORD)_uncacheRows:(_QWORD *)result
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = -[NSSQLCore rowCacheForGeneration:](result, 0);
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    result = (_QWORD *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(a2);
          -[NSPersistentStoreCache decrementRefCountForObjectID:]((uint64_t)v3, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "objectID"));
          v6 = (_QWORD *)((char *)v6 + 1);
        }
        while (v4 != v6);
        result = (_QWORD *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (self
    && -[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[NSDictionary valueForKey:](-[NSPersistentStore options](self, "options"), "valueForKey:", CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
  }
  if (objc_msgSend(v5, "integerValue"))
    -[NSSQLCoreDispatchManager setExclusiveLockingMode:](self->_dispatchManager, "setExclusiveLockingMode:", v3);
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3
{
  -[NSSQLCore managedObjectContextDidRegisterObjectsWithIDs:generation:](self, "managedObjectContextDidRegisterObjectsWithIDs:generation:", a3, 0);
}

- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  if (byte_1ECD8D771 == 1)
  {
    -[NSSQLCore managedObjectContextDidUnregisterObjectsWithIDs:generation:](self, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", a3, 0);
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempt to use SPI reserved for mapssyncd");
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v11);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: Attempt to use SPI reserved for mapssyncd", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3
{
  -[NSSQLCore managedObjectContextDidUnregisterObjectsWithIDs:generation:](self, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", a3, 0);
}

void __54__NSSQLCore_willRemoveFromPersistentStoreCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 24);
  else
    v2 = 0;
  +[NSSQLiteIndexTrackingModel updateIndexStatistics:usingConnection:model:]((uint64_t)NSSQLiteIndexTrackingModel, *(void **)(a1 + 32), v2, (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentStoreTrackIndexUseOptionKey")));
}

- (id)newFetchUUIDSForSubentitiesRootedAt:(void *)a1
{
  id v2;
  NSSQLBlockRequestContext *v4;
  NSException *exception;
  NSException *v6;
  _QWORD v8[5];

  v2 = a1;
  if (a1)
  {
    if (objc_msgSend(a2, "superentity"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't fetch UUIDs for non-root entities"), 0));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__NSSQLCore_newFetchUUIDSForSubentitiesRootedAt___block_invoke;
    v8[3] = &unk_1E1EDF660;
    v8[4] = a2;
    v4 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v8, 0, v2);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v4, 0);
    v2 = -[NSSQLStoreRequestContext result](v4, "result");
    if (v4)
      exception = v4->super._exception;
    else
      exception = 0;
    v6 = exception;
    if (!v2 && v6)
      objc_exception_throw(v6);

  }
  return v2;
}

void __49__NSSQLCore_newFetchUUIDSForSubentitiesRootedAt___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  id v5;

  if (a2)
    v4 = a2[3];
  else
    v4 = 0;
  -[NSSQLiteConnection connect](v4);
  v5 = -[NSSQLiteConnection newFetchUUIDSForSubentitiesRootedAt:](v4, *(void **)(a1 + 32));
  objc_msgSend(a2, "setResult:", v5);

}

- (void)removeUbiquityMetadata
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSSQLBlockRequestContext *v8;
  id v9;

  if (a1)
  {
    v2 = (void *)objc_msgSend(a1, "metadata");
    v9 = (id)objc_msgSend(v2, "mutableCopy");
    v3 = objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.coredata.ubiquity.ubiquitized"));
    v4 = v3 != 0;
    if (v3)
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("com.apple.coredata.ubiquity.ubiquitized"));
    if (objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.coredata.ubiquity.token")))
    {
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("com.apple.coredata.ubiquity.token"));
      v4 = 1;
    }
    if (objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.coredata.ubiquity.localImportComplete")))
    {
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("com.apple.coredata.ubiquity.localImportComplete"));
      v5 = objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.coredata.ubiquity.baseline.timestamp"));
      v6 = v9;
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v7 = objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.coredata.ubiquity.baseline.timestamp"));
      v6 = v9;
      if (!v7)
      {
        if (!v4)
        {

          return;
        }
        goto LABEL_11;
      }
    }
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.coredata.ubiquity.baseline.timestamp"));
    v6 = v9;
LABEL_11:
    objc_msgSend(a1, "setMetadata:", v6);

    v8 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &__block_literal_global_438, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v8, 0);

  }
}

void __35__NSSQLCore_removeUbiquityMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSSQLSaveChangesRequestContext *v4;
  uint64_t v5;
  NSSQLObjectFaultRequestContext *v6;
  NSFetchRequest *fetchRequest;
  void *v8;
  NSSQLObjectFaultRequestContext *v9;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  -[NSSQLiteConnection dropUbiquityTables](v3);
  v4 = [NSSQLSaveChangesRequestContext alloc];
  if (a2)
    v5 = *(_QWORD *)(a2 + 8);
  else
    v5 = 0;
  v6 = -[NSSQLSaveChangesRequestContext initWithRequest:context:sqlCore:](v4, "initWithRequest:context:sqlCore:", 0, 0, v5);
  if (v6)
  {
    if (v6->_objectID
      || (fetchRequest = v6->_fetchRequest) != 0 && (BYTE4(fetchRequest[1]._additionalPrivateIvars) & 2) != 0)
    {
      if (a2)
        v8 = *(void **)(a2 + 24);
      else
        v8 = 0;
      v9 = v6;
      -[NSSQLStoreRequestContext setConnection:]((uint64_t)v6, v8);
      _executeSaveChangesRequest(v9);
      -[NSSQLStoreRequestContext setConnection:]((uint64_t)v9, 0);
      v6 = v9;
    }
  }

}

- (id)fetchUbiquityKnowledgeVector
{
  id v1;
  NSSQLBlockRequestContext *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3052000000;
    v8 = __Block_byref_object_copy__23;
    v9 = __Block_byref_object_dispose__23;
    v10 = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__NSSQLCore_fetchUbiquityKnowledgeVector__block_invoke;
    v4[3] = &unk_1E1EDF6D0;
    v4[4] = &v5;
    v2 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v4, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v1, v2, 0);

    v1 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

id __41__NSSQLCore_fetchUbiquityKnowledgeVector__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id result;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  result = (id)-[NSSQLiteConnection fetchUbiquityKnowledgeVector](v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)updateUbiquityKnowledgeVector:(uint64_t)a1
{
  NSSQLBlockRequestContext *v3;
  _QWORD v4[5];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__NSSQLCore_updateUbiquityKnowledgeVector___block_invoke;
    v4[3] = &unk_1E1EDF660;
    v4[4] = a2;
    v3 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v4, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v3, 0);

  }
}

_QWORD *__43__NSSQLCore_updateUbiquityKnowledgeVector___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
    v2 = *(_QWORD **)(a2 + 24);
  else
    v2 = 0;
  return -[NSSQLiteConnection updateUbiquityKnowledgeVector:](v2, *(void **)(a1 + 32));
}

- (void)updateUbiquityKnowledgeForPeerWithID:(uint64_t)a3 andTransactionNumber:
{
  NSSQLBlockRequestContext *v4;
  _QWORD v5[6];

  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__NSSQLCore_updateUbiquityKnowledgeForPeerWithID_andTransactionNumber___block_invoke;
    v5[3] = &unk_1E1EDF6A8;
    v5[4] = a2;
    v5[5] = a3;
    v4 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v5, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v4, 0);

  }
}

_QWORD *__71__NSSQLCore_updateUbiquityKnowledgeForPeerWithID_andTransactionNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
    v2 = *(_QWORD **)(a2 + 24);
  else
    v2 = 0;
  return -[NSSQLiteConnection updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](v2, *(const __CFString **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)replaceUbiquityKnowledgeVector:(uint64_t)a1
{
  NSSQLBlockRequestContext *v3;
  _QWORD v4[5];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__NSSQLCore_replaceUbiquityKnowledgeVector___block_invoke;
    v4[3] = &unk_1E1EDF660;
    v4[4] = a2;
    v3 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v4, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v3, 0);

  }
}

_QWORD *__44__NSSQLCore_replaceUbiquityKnowledgeVector___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
    v2 = *(_QWORD **)(a2 + 24);
  else
    v2 = 0;
  return -[NSSQLiteConnection replaceUbiquityKnowledgeVector:](v2, *(void **)(a1 + 32));
}

- (id)allPeerRanges
{
  id v1;
  NSSQLBlockRequestContext *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3052000000;
    v8 = __Block_byref_object_copy__23;
    v9 = __Block_byref_object_dispose__23;
    v10 = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __26__NSSQLCore_allPeerRanges__block_invoke;
    v4[3] = &unk_1E1EDF6D0;
    v4[4] = &v5;
    v2 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v4, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v1, v2, 0);

    v1 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

_DWORD *__26__NSSQLCore_allPeerRanges__block_invoke(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  _DWORD *result;

  if (a2)
    v3 = *(_DWORD **)(a2 + 24);
  else
    v3 = 0;
  result = -[NSSQLiteConnection allPeerRanges](v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)addPeerRange:(uint64_t)a1
{
  NSSQLBlockRequestContext *v3;
  _QWORD v4[5];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __26__NSSQLCore_addPeerRange___block_invoke;
    v4[3] = &unk_1E1EDF660;
    v4[4] = a2;
    v3 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v4, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v3, 0);

  }
}

_QWORD *__26__NSSQLCore_addPeerRange___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
    v2 = *(_QWORD **)(a2 + 24);
  else
    v2 = 0;
  return -[NSSQLiteConnection addPeerRange:](v2, *(_QWORD **)(a1 + 32));
}

- (id)createMapOfEntityNameToPKMaxForEntities:(id)a3
{
  NSSQLBlockRequestContext *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NSSQLCore_createMapOfEntityNameToPKMaxForEntities___block_invoke;
  v7[3] = &unk_1E1EDF6F8;
  v7[4] = a3;
  v7[5] = &v8;
  v4 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v7, 0, self);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v4, 0);

  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void *__53__NSSQLCore_createMapOfEntityNameToPKMaxForEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *result;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  result = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntities:](v3, *(void **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setUbiquityTableValue:(uint64_t)a3 forKey:
{
  NSSQLBlockRequestContext *v4;
  _QWORD v5[6];

  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__NSSQLCore_setUbiquityTableValue_forKey___block_invoke;
    v5[3] = &unk_1E1EDF6A8;
    v5[4] = a2;
    v5[5] = a3;
    v4 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v5, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v4, 0);

  }
}

_QWORD *__42__NSSQLCore_setUbiquityTableValue_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
    v2 = *(_QWORD **)(a2 + 24);
  else
    v2 = 0;
  return -[NSSQLiteConnection setUbiquityTableValue:forKey:](v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)ubiquityTableValueForKey:(void *)a1
{
  id v2;
  NSSQLBlockRequestContext *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v2 = a1;
  if (a1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__23;
    v10 = __Block_byref_object_dispose__23;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__NSSQLCore_ubiquityTableValueForKey___block_invoke;
    v5[3] = &unk_1E1EDF6F8;
    v5[4] = a2;
    v5[5] = &v6;
    v3 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v5, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v3, 0);

    v2 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  return v2;
}

id __38__NSSQLCore_ubiquityTableValueForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id result;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  result = -[NSSQLiteConnection ubiquityTableValueForKey:](v3, *(void **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (uint64_t)_ubiquityDictionaryForAttribute:(void *)a3 onObject:
{
  const void *v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  NSSQLObjectFaultRequestContext *v9;
  NSException *exception;
  NSException *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v6 = (const void *)objc_msgSend(a3, "objectID");
  v7 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:](a1, (void *)objc_msgSend((id)objc_msgSend(a3, "managedObjectContext"), "_queryGenerationToken"));
  if (!v7
    || (v8 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v7, v6, *(double *)&NSSQLDistantPastTimeInterval)) == 0)
  {
    v9 = -[NSSQLObjectFaultRequestContext initWithObjectID:context:sqlCore:]([NSSQLObjectFaultRequestContext alloc], "initWithObjectID:context:sqlCore:", v6, objc_msgSend(a3, "managedObjectContext"), a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v9, 0);
    v8 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v9, "result");
    if (!v8)
    {
      if (v9)
        exception = v9->super._exception;
      else
        exception = 0;
      v11 = exception;
      if (v11)
        objc_exception_throw(v11);
      v8 = 0;
    }

  }
  v12 = -[os_unfair_lock_s valueForKey:](v8, "valueForKey:", objc_msgSend(a2, "name"));
  if (!v12)
    return 0;
  v13 = (void *)v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v14, "setObject:forKey:", objc_msgSend(v13, "databaseValue"), CFSTR("databaseValue"));
    v15 = objc_msgSend(v13, "UUID");
    if (v15)
    {
      objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("UUID"));
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "length")), CFSTR("length"));
    }
    return (uint64_t)v14;
  }
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("databaseValue"));
}

- (void)recomputePrimaryKeyMaxForEntities:(void *)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSQLBlockRequestContext *v11;
  NSException *exception;
  NSException *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a2, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v16;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(a2);
          v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
          if (v8)
          {
            if ((*(_BYTE *)(v8 + 120) & 4) != 0)
            {
              v9 = *(void **)(v8 + 72);
            }
            else
            {
              do
              {
                v9 = (void *)v8;
                v8 = objc_msgSend((id)v8, "superentity");
              }
              while (v8);
            }
          }
          else
          {
            v9 = 0;
          }
          objc_msgSend(v4, "addObject:", objc_msgSend((id)objc_msgSend(a1, "model"), "entityNamed:", objc_msgSend(v9, "name")));
          ++v7;
        }
        while (v7 != v5);
        v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v5 = v10;
      }
      while (v10);
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__NSSQLCore_recomputePrimaryKeyMaxForEntities___block_invoke;
    v14[3] = &unk_1E1EDF660;
    v14[4] = v4;
    v11 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v14, 0, a1);

    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v11, 0);
    if (v11)
      exception = v11->super._exception;
    else
      exception = 0;
    v13 = exception;

    if (v13)
      objc_exception_throw(v13);
  }
}

void __47__NSSQLCore_recomputePrimaryKeyMaxForEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSSQLiteStatement *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = *(_QWORD *)(a2 + 24);
  else
    v4 = 0;
  -[NSSQLiteConnection beginTransaction](v4);
  v5 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntities:](v4, *(void **)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(obj);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ set %@=%@ where %@ = '%@'"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7)), CFSTR("Z_NAME"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
        if (a2)
          v9 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)objc_msgSend(*(id *)(a2 + 8), "adapter"), (uint64_t)v8);
        else
          v9 = 0;

        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v4, v9);
        ++v7;
      }
      while (v6 != v7);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v10;
    }
    while (v10);
  }
  -[NSSQLiteConnection commitTransaction](v4);
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v4, 0);

}

- (id)_newReservedKeysForEntities:(void *)a3 counts:
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void **v12;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void **v18;
  unint64_t v19;
  CFIndex v20;
  CFDictionaryRef v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = objc_msgSend(a2, "count");
  if (!a2 || !a3 || (v7 = v6, v6 != objc_msgSend(a3, "count")))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid parameter value (missing parameter)"), 0));
  if (!v7)
    return (id)NSArray_EmptyArray;
  v8 = objc_msgSend(a2, "count");
  v9 = MEMORY[0x1E0C80A78](v8);
  v12 = (const void **)((char *)&v29 - v11);
  if (v9 > 0x200)
    v12 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v29 - v11, 8 * v10);
  v14 = objc_msgSend(a3, "count");
  v15 = MEMORY[0x1E0C80A78](v14);
  v18 = (const void **)((char *)&v29 - v17);
  if (v15 > 0x200)
    v18 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v29 - v17, 8 * v16);
  objc_msgSend(a2, "getObjects:range:", v12, 0, objc_msgSend(a2, "count"));
  if (objc_msgSend(a2, "count"))
  {
    v19 = 0;
    do
    {
      if (objc_msgSend((id)v12[v19], "superentity"))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid parameter value (bad entity)"), 0));
      v12[v19] = (const void *)_sqlCoreLookupSQLEntityForEntityDescription(a1, v12[v19]);
      ++v19;
    }
    while (v19 < objc_msgSend(a2, "count"));
  }
  objc_msgSend(a3, "getObjects:range:", v18, 0, objc_msgSend(a3, "count"));
  v20 = objc_msgSend(a2, "count");
  v21 = CFDictionaryCreate(0, v12, v18, v20, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v8 >= 0x201)
    NSZoneFree(0, v12);
  if (v14 >= 0x201)
    NSZoneFree(0, v18);
  v22 = -[NSSQLGenerateObjectIDRequestContext initForEntitiesAndCounts:context:sqlCore:]([NSSQLGenerateObjectIDRequestContext alloc], "initForEntitiesAndCounts:context:sqlCore:", v21, 0, a1);
  CFRelease(v21);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v22, 0);
  v23 = (id)objc_msgSend(v22, "result");
  if (!v23)
  {
    if (v22)
      v28 = (void *)v22[6];
    else
      v28 = 0;
    objc_exception_throw(v28);
  }

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  v29 = 0u;
  v25 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(a2);
        objc_msgSend(v24, "addObject:", objc_msgSend(v23, "objectForKey:", _sqlCoreLookupSQLEntityForEntityDescription(a1, *(_QWORD **)(*((_QWORD *)&v29 + 1) + 8 * i))));
      }
      v25 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v25);
  }

  return v24;
}

- (id)_newObjectIDForEntity:(id)a3 referenceData64:(unint64_t)a4
{
  id v6;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options", a3), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
    {
      v12 = CFSTR("PFUbiquitySetupCheckForFork");
      v13[0] = MEMORY[0x1E0C9AAB0];
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    }
    else
    {
      v11 = 0;
    }
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Invalid parameter value (zero)");
LABEL_10:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, v11));
  }
  if (!a3 || (v6 = -[NSSQLModel entityNamed:](self->_model, "entityNamed:", objc_msgSend(a3, "name"))) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Invalid parameter value (bad entity)");
    v11 = 0;
    goto LABEL_10;
  }
  return -[NSSQLCore newObjectIDForEntity:pk:](self, "newObjectIDForEntity:pk:", v6, a4);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)qword_1ECD8D788;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  objc_opt_self();
  -[PFUbiquitySwitchboard unregisterPersistentStore:inCoordinator:](_sharedSwitchboard, self, (uint64_t)-[NSPersistentStore persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

void __66__NSSQLCore_processCloudKitContainerEventRequest_inContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  NSPersistentCloudKitContainerEvent *v3;

  v3 = -[NSPersistentCloudKitContainerEvent initWithCKEvent:]([NSPersistentCloudKitContainerEvent alloc], "initWithCKEvent:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  NSError *v9;
  NSError *v10;
  NSError *v11;
  void *v12;
  uint64_t v13;
  NSError *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v9 = -[NSSQLCore _newValuesForRelationship:forObjectWithID:withContext:error:](self, a3, a4, a5, &v15);
  v10 = v9;
  if (a6 && !v9)
  {
    v11 = v15;
    if (!v15)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB28A8];
      v16 = CFSTR("message");
      v17[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to retrieve ordering information from fault for object %@ and relationship %@"), a4, objc_msgSend(a3, "name"));
      v11 = (NSError *)objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 133000, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
    }
    *a6 = v11;
  }
  return v10;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSQLiteStatement *v13;
  NSSQLiteStatement *v14;
  NSSQLBlockRequestContext *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  unint64_t Count;
  id v19;
  CFIndex i;
  uint64_t *ValueAtIndex;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  id v25;
  void *exception;
  NSSQLBlockRequestContext *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, _QWORD *);
  void *v32;
  NSSQLiteStatement *v33;

  v8 = (_QWORD *)objc_msgSend(a4, "entity");
  v9 = objc_msgSend((id)objc_msgSend(v8, "subentities"), "count");
  v10 = _sqlCoreLookupSQLEntityForEntityDescription(self, v8);
  v11 = objc_msgSend(a4, "name");
  if (v10)
  {
    v12 = objc_msgSend(*(id *)(v10 + 40), "objectForKey:", v11);
    if ((objc_msgSend((id)v12, "isToMany") & 1) != 0)
    {
LABEL_3:
      v13 = -[NSSQLiteAdapter generateSQLStatmentForSourcesAndOrderKeysForDestination:inToMany:]((NSSQLiteStatement *)-[NSSQLCore adapter](self, "adapter"), a3, (_QWORD *)v12);
LABEL_7:
      v14 = v13;
      goto LABEL_9;
    }
    if (v12 && *(_BYTE *)(v12 + 24) == 9)
    {
      v13 = -[NSSQLiteAdapter generateSQLStatmentForSourcesAndOrderKeysForDestination:inManyToMany:]((NSSQLiteStatement *)-[NSSQLCore adapter](self, "adapter"), a3, (__CFString *)v12);
      goto LABEL_7;
    }
    v14 = 0;
  }
  else
  {
    v12 = 0;
    v14 = 0;
    if (objc_msgSend(0, "isToMany"))
      goto LABEL_3;
  }
LABEL_9:
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __62__NSSQLCore__allOrderKeysForDestination_inRelationship_error___block_invoke;
  v32 = &unk_1E1EDF660;
  v33 = v14;
  v15 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &v29, 0, self);

  v28 = v15;
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v15, 4);
  v16 = -[NSSQLStoreRequestContext result](v15, "result");
  v17 = v16;
  if (!v16)
  {
    exception = v15;
    if (v15)
      exception = v15->super._exception;
    objc_exception_throw(exception);
  }
  Count = CFArrayGetCount(v16);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (Count >= 2)
  {
    CFArrayGetValueAtIndex(v17, 0);
    for (i = 1; i != Count; ++i)
    {
      ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(v17, i);
      v22 = *ValueAtIndex;
      if (*ValueAtIndex)
      {
        v23 = ValueAtIndex[2];
        v24 = (const void *)v10;
        if (v9)
          v24 = _sqlEntityForEntityID((uint64_t)self->_model, ValueAtIndex[1]);
        v25 = -[NSSQLCore newObjectIDForEntity:pk:](self, "newObjectIDForEntity:pk:", v24, v22, v28, v29, v30, v31, v32, v33);
        objc_msgSend(v19, "addObject:", v25);

        objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23));
      }
    }
  }

  return v19;
}

void __62__NSSQLCore__allOrderKeysForDestination_inRelationship_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  CFMutableArrayRef v4;

  if (a2)
    v3 = a2[3];
  else
    v3 = 0;
  v4 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v3, (void *)objc_msgSend(*(id *)(a1 + 32), "sqlString"));
  objc_msgSend(a2, "setResult:", v4);
  CFRelease(v4);
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v3, 0);
}

- (uint64_t)_refreshTriggerValues:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *__ptr32 *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _WORD *v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSSQLBlockRequestContext *v23;
  NSException *exception;
  NSException *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  _QWORD v46[6];
  _QWORD v47[6];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v56 = 0;
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v3 = *(_QWORD *)(a1 + 96);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  v5 = (void *)objc_msgSend(v4, "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  v7 = MEMORY[0x1E0C809B0];
  v8 = &off_18A509000;
  if (!v6)
    goto LABEL_34;
  obj = v5;
  v41 = *(_QWORD *)v53;
  v44 = 1;
  do
  {
    v9 = 0;
    v42 = v6;
    do
    {
      if (*(_QWORD *)v53 != v41)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v9);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      if (v10)
        v11 = *(void **)(v10 + 40);
      else
        v11 = 0;
      v12 = (void *)objc_msgSend(v11, "allValues");
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      v43 = v9;
      if (v13)
      {
        v14 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v49 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_WORD **)(*((_QWORD *)&v48 + 1) + 8 * i);
            v17 = objc_msgSend(v16, "propertyType");
            if (v16)
              v18 = v17 == 1;
            else
              v18 = 0;
            if (v18 && (v16[16] & 8) != 0)
            {
              v19 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]((uint64_t)NSSQLAttributeExtensionFactory, v16, (uint64_t *)&v56);
              v20 = v19;
              if (v19)
              {
                v47[0] = v7;
                v47[1] = 3221225472;
                v47[2] = __35__NSSQLCore__refreshTriggerValues___block_invoke;
                v47[3] = &unk_1E1EDF748;
                v47[4] = v10;
                v47[5] = v45;
                objc_msgSend(v19, "enumerateObjectsUsingBlock:", v47);
              }
              else
              {
                v44 = 0;
              }

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        }
        while (v13);
      }
      v9 = v43 + 1;
    }
    while (v43 + 1 != v42);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    v6 = v21;
  }
  while (v21);
  v8 = &off_18A509000;
  if ((v44 & 1) != 0)
  {
LABEL_34:
    v46[0] = v7;
    v46[1] = *((_QWORD *)v8 + 369);
    v46[2] = __35__NSSQLCore__refreshTriggerValues___block_invoke_2;
    v46[3] = &unk_1E1EDF6A8;
    v46[4] = v45;
    v46[5] = a1;
    v23 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v46, 0, a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v23, 0);
    if (v23)
      exception = v23->super._exception;
    else
      exception = 0;
    v25 = exception;

    if (v25)
      objc_exception_throw(v25);
    v22 = 1;
  }
  else
  {
    v22 = 0;
  }
  v26 = v56;

  v27 = 0;
  v28 = v56;
  if ((v22 & 1) == 0)
  {
    if (v56)
    {
      if (a2)
        *a2 = v56;
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
      v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
        v59 = 1024;
        v60 = 5347;
        _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v22;
}

uint64_t __35__NSSQLCore__refreshTriggerValues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSQLiteStatement *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(a2, "bulkUpdateSQLStrings", 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

void __35__NSSQLCore__refreshTriggerValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = *(void **)(a2 + 24);
  else
    v4 = 0;
  -[NSSQLiteConnection beginTransaction]((uint64_t)v4);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }
  -[NSSQLiteConnection commitTransaction]((uint64_t)v4);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 && *(_QWORD *)(v9 + 200))
  {
    if (a2)
      v10 = *(_QWORD *)(a2 + 8);
    else
      v10 = 0;
    v11 = objc_msgSend(v4, "registerCurrentQueryGenerationWithStore:", v10);
    if ((_DWORD)v11)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Refreshing trigger values failed to adopt post transaction query generation with error %d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, v11);
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v25 = v11;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Refreshing trigger values failed to adopt post transaction query generation with error %d", buf, 8u);
      }
    }
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v4, 0);
}

void __72__NSSQLCore__rebuildTriggerSchemaUsingConnection_recomputeValues_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSSQLiteStatement *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSSQLiteStatement *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSSQLiteStatement *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (id)objc_msgSend(a2, "insertSQLStrings");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = (void *)objc_msgSend(a2, "dropSQLStrings");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v4);
        v15 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

      }
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = (void *)objc_msgSend(a2, "bulkUpdateSQLStrings", 0);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v18);
    }
  }

}

- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4
{
  NSSQLBlockRequestContext *v6;
  NSException *exception;
  NSError *v8;
  NSError *error;
  char v10;
  NSException *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __58__NSSQLCore_finishDeferredLightweightMigration_withError___block_invoke;
  v16 = &unk_1E1EDF7C0;
  v17 = &v19;
  LOBYTE(v18) = a3;
  v6 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", &v13, 0, self);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v6, 0);
  if (*((_BYTE *)v20 + 24))
    goto LABEL_11;
  if (!v6)
  {
    if (!a4)
      goto LABEL_11;
    error = 0;
    goto LABEL_9;
  }
  exception = v6->super._exception;
  if (!exception)
  {
    if (!a4)
      goto LABEL_11;
    error = v6->super._error;
LABEL_9:
    v8 = error;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = exception;
    objc_exception_throw(exception);
  }
  if (a4)
  {
    v8 = (NSError *)-[NSException errorObjectWithUserInfo:](exception, "errorObjectWithUserInfo:", 0, v13, v14, v15, v16, v17, v18);
LABEL_10:
    *a4 = v8;
  }
LABEL_11:

  v10 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v10;
}

BOOL __58__NSSQLCore_finishDeferredLightweightMigration_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BOOL8 result;

  if (a2)
    v3 = *(_QWORD *)(a2 + 24);
  else
    v3 = 0;
  result = -[NSSQLiteConnection finishDeferredLightweightMigration:](v3, *(unsigned __int8 *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

_QWORD *__50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  void *v8;
  _QWORD v9[5];

  v3 = -[NSSQLiteConnection harvestUsedIndexes](a2);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    v5 = objc_msgSend(v4, "count");
    v6 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke_2;
      v9[3] = &unk_1E1EDF7E8;
      v9[4] = v6;
      return (_QWORD *)objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
    }
    v8 = *(void **)(*(_QWORD *)(v6 + 8) + 40);
  }
  else
  {
    v8 = 0;
  }

  result = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

_QWORD *__50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *result;
  uint64_t v7;

  result = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", a2);
  if (!result)
    return (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", a3, a2);
  v7 = result[4];
  result[3] += a3[3];
  result[4] = v7 + a3[4];
  result[5] += a3[5];
  return result;
}

- (BOOL)hasAncillaryModels
{
  return (*((unsigned __int8 *)&self->_sqlCoreFlags + 1) >> 3) & 1;
}

+ (BOOL)dropPersistentHistoryforPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  BOOL v19;
  NSSQLBlockRequestContext *v20;
  NSSQLBlockRequestContext *v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 240.0);
  v30 = CFSTR("journal_mode");
  v31[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v12 = (void *)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSPersistentStoreTimeoutOption"), v11, CFSTR("NSSQLitePragmasOption"), MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentHistoryTrackingKey"), 0);
  v13 = v12;
  if (a4)
  {
    objc_msgSend(v12, "addEntriesFromDictionary:", a4);
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
    v14 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
    if (objc_msgSend(v14, "objectForKey:", CFSTR("journal_mode")))
    {
      v15 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"));
      objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("NSSQLitePragmasOption"));

    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, a3, a4, (uint64_t *)a5))return 0;
  v16 = objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, a3, v13);
  v17 = (void *)v16;
  if (v16)
  {
    if ((*(_BYTE *)(v16 + 192) & 0x40) != 0)
    {
      v20 = [NSSQLBlockRequestContext alloc];
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = (uint64_t)__31__NSSQLCore__dropHistoryTables__block_invoke_2;
      v27 = (void (*)(uint64_t, uint64_t))&unk_1E1EDF638;
      v28 = (void (*)(uint64_t))&__block_literal_global_479;
      v21 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:](v20, "initWithBlock:context:sqlCore:", &v24, 0, v17);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v17, v21, 0);

    }
    else
    {
      v24 = 0;
      v25 = (uint64_t)&v24;
      v26 = 0x3052000000;
      v27 = __Block_byref_object_copy__23;
      v28 = __Block_byref_object_dispose__23;
      v29 = 0;
      v18 = -[NSSQLCore schemaValidationConnection]((_QWORD *)v16);
      *(_QWORD *)(v25 + 40) = v18;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __31__NSSQLCore__dropHistoryTables__block_invoke_3;
      v23[3] = &unk_1E1EDF8C0;
      v23[4] = &__block_literal_global_479;
      v23[5] = &v24;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v18, (uint64_t)v23);
      _Block_object_dispose(&v24, 8);
    }
  }
  v19 = 1;
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v17);

  return v19;
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = -[NSSQLiteConnection canConnect](a2);
  if ((_DWORD)result)
  {
    -[NSSQLiteConnection connect](a2);
    return -[NSSQLiteConnection _dropKnownHistoryTrackingTables](a2);
  }
  return result;
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __31__NSSQLCore__dropHistoryTables__block_invoke_4(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (unint64_t)entityIDForEntityDescription:(id)a3
{
  NSSQLModel *model;

  if (!a3)
    return 0;
  model = self->_model;
  if (model)
    return -[NSKnownKeysMappingStrategy fastIndexForKnownKey:](-[NSKnownKeysDictionary mapping](model->_entitiesByName, "mapping"), "fastIndexForKnownKey:", objc_msgSend(a3, "name"))+ 1;
  else
    return 0;
}

- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return (id)NSArray_EmptyArray;
  v3 = -[NSSQLModel entityNamed:](self->_model, "entityNamed:", objc_msgSend(a3, "name"));
  if (!v3)
    return (id)NSArray_EmptyArray;
  v4 = v3;
  v5 = (void *)objc_msgSend(v3, "foreignKeyColumns");
  v6 = (void *)objc_msgSend(v4, "foreignEntityKeyColumns");
  v7 = (void *)objc_msgSend(v4, "foreignOrderKeyColumns");
  v8 = (void *)objc_msgSend(v4, "attributeColumns");
  v9 = (void *)objc_msgSend(v4, "toManyRelationships");
  v10 = (void *)objc_msgSend(v4, "manyToManyRelationships");
  v50 = objc_msgSend(v8, "count");
  v11 = objc_msgSend(v7, "count");
  v12 = objc_msgSend(v6, "count");
  v13 = objc_msgSend(v5, "count");
  v14 = objc_msgSend(v9, "count");
  v15 = objc_msgSend(v10, "count");
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11 + v50 + v12 + v13 + v14 + v15);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v72;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v72 != v19)
          objc_enumerationMutation(v5);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v20), "toOneRelationship");
        if (v21)
        {
          v22 = (void *)objc_msgSend(v21, "propertyDescription");
          if (v22)
            objc_msgSend(v16, "addObject:", objc_msgSend(v22, "name"));
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v18);
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v68;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v68 != v25)
          objc_enumerationMutation(v6);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v26), "toOneRelationship");
        if (v27)
        {
          v28 = (void *)objc_msgSend(v27, "propertyDescription");
          if (v28)
            objc_msgSend(v16, "addObject:", objc_msgSend(v28, "name"));
        }
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    }
    while (v24);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v64;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v64 != v31)
          objc_enumerationMutation(v7);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v32), "toOneRelationship");
        if (v33)
        {
          v34 = (void *)objc_msgSend(v33, "propertyDescription");
          if (v34)
            objc_msgSend(v16, "addObject:", objc_msgSend(v34, "name"));
        }
        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    }
    while (v30);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v35 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v60;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v60 != v37)
          objc_enumerationMutation(v8);
        objc_msgSend(v16, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v38++), "attributeDescription"), "name"));
      }
      while (v36 != v38);
      v36 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
    }
    while (v36);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v56;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v56 != v41)
          objc_enumerationMutation(v9);
        v43 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v42);
        if (v43)
          v43 = (void *)objc_msgSend(v43, "propertyDescription");
        objc_msgSend(v16, "addObject:", objc_msgSend(v43, "name"));
        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
    }
    while (v40);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v75, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v52;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(v10);
        v48 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v47);
        if (v48)
          v48 = (void *)objc_msgSend(v48, "propertyDescription");
        objc_msgSend(v16, "addObject:", objc_msgSend(v48, "name"));
        ++v47;
      }
      while (v45 != v47);
      v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v75, 16);
    }
    while (v45);
  }
  return (id)objc_msgSend(v16, "allObjects");
}

@end
