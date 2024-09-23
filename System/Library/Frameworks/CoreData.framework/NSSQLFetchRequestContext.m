@implementation NSSQLFetchRequestContext

- (NSSQLFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  id v7;
  int v9;
  int v10;
  char v11;
  id v12;
  id v13;
  NSSQLFetchRequestContext *v14;
  NSSQLFetchRequestContext *v15;
  void *v16;
  void *v17;
  NSSQLEntity *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSFaultHandler *v67;
  id obj;
  objc_super v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v7 = a3;
  v77 = *MEMORY[0x1E0C80C00];
  if (BYTE1(dword_1ECD8DE20))
  {
    if (objc_msgSend(a3, "fetchBatchSize"))
    {
      if (objc_msgSend(v7, "resultType") == 2 && !objc_msgSend((id)objc_msgSend(v7, "propertiesToGroupBy"), "count"))
      {
        v9 = objc_msgSend(v7, "returnsDistinctResults");
        if ((v9 & 1) == 0)
        {
          v25 = v9;
          if (!objc_msgSend((id)objc_msgSend(v7, "propertiesToFetch"), "count"))
          {
            v10 = 1;
            goto LABEL_7;
          }
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          obj = (id)objc_msgSend(v7, "propertiesToFetch");
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v10 = v25 ^ 1;
            v29 = *(_QWORD *)v71;
            while (2)
            {
              v30 = 0;
              do
              {
                if (*(_QWORD *)v71 != v29)
                  objc_enumerationMutation(obj);
                v31 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v30);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend((id)objc_msgSend(v31, "expression"), "expressionType") == 14
                   || objc_msgSend((id)objc_msgSend(v31, "expression"), "expressionType") == 4))
                {
                  _NSCoreDataLog(1, (uint64_t)CFSTR("Returning unbatched results for unsupported NSExpression in propertiesToFetch: %@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);
                  objc_msgSend(v7, "setFetchBatchSize:", 0);
                  goto LABEL_6;
                }
                v28 = v28
                   || (objc_msgSend((id)objc_msgSend(v31, "name"), "isEqualToString:", CFSTR("objectID")) & 1) != 0
                   || objc_msgSend((id)objc_msgSend(v31, "name"), "isEqualToString:", CFSTR("self"));
                if (objc_msgSend((id)objc_msgSend(v31, "name"), "isEqualToString:", CFSTR("isDeleted")))
                {
                  if (!+[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.BatchDictionaryFault")))
                  {
                    _NSCoreDataLog(1, (uint64_t)CFSTR("Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@"), v54, v55, v56, v57, v58, v59, (uint64_t)v7);
                    goto LABEL_6;
                  }
                  v60 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@");
                  _NSCoreDataLog(17, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v7);
                  v52 = __pflogFaultLog;
                  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    goto LABEL_6;
                  *(_DWORD *)buf = 138412290;
                  v75 = v7;
                  v53 = "CoreData: Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBa"
                        "tchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@";
                  goto LABEL_65;
                }
                ++v30;
              }
              while (v27 != v30);
              v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
              v27 = v38;
              if (v38)
                continue;
              break;
            }
            if (v28)
              goto LABEL_7;
          }
          if (+[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.BatchDictionaryFault")))
          {
            v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@");
            _NSCoreDataLog(17, v45, v46, v47, v48, v49, v50, v51, (uint64_t)v7);
            v52 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v75 = v7;
              v53 = "CoreData: Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchS"
                    "ize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@";
LABEL_65:
              _os_log_fault_impl(&dword_18A253000, v52, OS_LOG_TYPE_FAULT, v53, buf, 0xCu);
            }
          }
          else
          {
            _NSCoreDataLog(1, (uint64_t)CFSTR("Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@"), v39, v40, v41, v42, v43, v44, (uint64_t)v7);
          }
        }
      }
    }
  }
LABEL_6:
  v10 = 0;
LABEL_7:
  if (!objc_msgSend(v7, "fetchBatchSize")
    || ((objc_msgSend(v7, "resultType") != 0) & ~v10) != 0
    || objc_msgSend(v7, "allocationType") == 1
    || objc_msgSend(v7, "allocationType") == 2)
  {
    v11 = 0;
    v12 = v7;
    v7 = 0;
  }
  else
  {
    v12 = (id)objc_msgSend(v7, "copy");
    v11 = 1;
    objc_msgSend(v12, "setResultType:", 1);
    objc_msgSend(v12, "setIncludesPropertyValues:", 0);
  }
  if (objc_msgSend(v12, "resultType") == 1)
  {
    v13 = v12;
    if (!v7)
    {
      v13 = (id)objc_msgSend(v12, "copy");
      v7 = v12;
      v12 = v13;
    }
    objc_msgSend(v13, "setPropertiesToFetch:", 0);
  }
  v69.receiver = self;
  v69.super_class = (Class)NSSQLFetchRequestContext;
  v14 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v69, sel_initWithRequest_context_sqlCore_, v12, a4, a5);
  v15 = v14;
  if (v14)
  {
    if (a5)
    {
      v14->_storeIsUbiquitized = objc_msgSend((id)objc_msgSend(a5, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")) != 0;
      if ((*((_BYTE *)a5 + 193) & 0x40) != 0)
      {
LABEL_24:
        v15->_fileBackedFuturesDirectory = (NSString *)(id)objc_msgSend(a5, "fileBackedFuturesDirectory");
        if (a5)
        {
          v15->_fileProtectionLevel = (*((_DWORD *)a5 + 48) >> 2) & 7;
          v15->_faultHandler = (NSFaultHandler *)(id)-[NSPersistentStore faultHandler]((unint64_t)a5);
          v17 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a5, (_QWORD *)objc_msgSend(v12, "entity"));
        }
        else
        {
          v15->_fileProtectionLevel = 0;
          v67 = (NSFaultHandler *)(id)-[NSPersistentStore faultHandler](0);
          v17 = 0;
          v15->_faultHandler = v67;
        }
        v18 = v17;
        v15->_sqlEntity = v18;
        v15->_sqlModel = (NSSQLModel *)-[NSSQLEntity model](v18, "model");
        v15->_isFaultRequest = 0;
        v15->_originalRequest = (NSFetchRequest *)v7;
        v15->_shouldUseBatches = v11;
        v15->_fetchPlan = fetchPlanAllocateInitialize(-[NSSQLFetchRequestContext request](v15, "request"), &v15->super._sqlCore->super, v15->super._context);
        v19 = objc_msgSend(v12, "resultType");
        v20 = objc_msgSend(v12, "returnsObjectsAsFaults");
        if (v19 == 1)
        {
          v21 = 4;
        }
        else if (v19 == 2)
        {
          v21 = 16;
        }
        else
        {
          v22 = v20;
          v23 = objc_msgSend((id)objc_msgSend(v12, "propertiesToFetch"), "count");
          if (v22)
            v21 = 0;
          else
            v21 = 12;
          if (v23)
            v21 = 20;
        }
        v15->_fetchPlan->flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&v15->_fetchPlan->flags & 0xFFFFFFE3 | v21);
        return v15;
      }
    }
    else
    {
      v14->_storeIsUbiquitized = 0;
    }
    v15->_externalDataReferencesDirectory = (NSString *)(id)objc_msgSend(a5, "externalDataReferencesDirectory");
    if (a5)
    {
      if (!*((_QWORD *)a5 + 20))
        objc_msgSend(a5, "externalDataReferencesDirectory");
      v16 = (void *)*((_QWORD *)a5 + 21);
    }
    else
    {
      v16 = 0;
    }
    v15->_externalDataLinksDirectory = (NSString *)v16;
    goto LABEL_24;
  }
  return v15;
}

- (_QWORD)addFaultsThatWereFired:(_QWORD *)result
{
  _QWORD *v2;
  void *v3;

  if (result)
  {
    v2 = result;
    v3 = (void *)result[21];
    if (v3)
    {
      return (_QWORD *)objc_msgSend(v3, "addObjectsFromArray:", a2);
    }
    else
    {
      result = a2;
      v2[21] = result;
    }
  }
  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(a3, "expressionType");
  if (v5)
  {
    if (v5 == 3
      || v5 == 4
      && (sel_valueForKey_ == (char *)objc_msgSend(a3, "selector")
       || sel_valueForKeyPath_ == (char *)objc_msgSend(a3, "selector")))
    {
      v6 = (void *)objc_msgSend(a3, "operand");
      if (!objc_msgSend(v6, "expressionType"))
        -[NSSQLFetchRequestContext _fireFaultsForValue:]((uint64_t)self, (void *)objc_msgSend(v6, "constantValue"));
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(a3, "constantValue");
    if (((objc_msgSend(v7, "isNSArray") & 1) != 0
       || (objc_msgSend(v7, "isNSSet") & 1) != 0
       || objc_msgSend(v7, "isNSOrderedSet"))
      && (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v7, "isFault"))
    {
      objc_msgSend(v7, "willRead");
    }
  }
}

- (void)setIsFaultRequest:(BOOL)a3
{
  self->_isFaultRequest = a3;
}

- (void)dealloc
{
  _PFFetchPlanHeader *fetchPlan;
  objc_super v4;

  self->_externalDataReferencesDirectory = 0;
  self->_externalDataLinksDirectory = 0;

  self->_fileBackedFuturesDirectory = 0;
  self->_sqlEntity = 0;

  self->_faultHandler = 0;
  self->_sqlModel = 0;

  self->_objectIDsToRegister = 0;
  self->_objectsToAwaken = 0;

  self->_parentContext = 0;
  self->_statement = 0;

  self->_originalRequest = 0;
  fetchPlan = self->_fetchPlan;
  if (fetchPlan)

  self->_concurrentFetchingPipelineRows = 0;
  self->_prefetchingSubstitutionVariables = 0;

  self->_resultFaultsThatWereFired = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLFetchRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v4, sel_dealloc);
}

- (void)setFetchStatement:(id)a3
{
  NSSQLiteStatement *statement;

  statement = self->_statement;
  self->_statement = (NSSQLiteStatement *)a3;

}

- (void)executeEpilogue
{
  unint64_t v3;
  _DWORD *v4;
  NSMutableSet *objectsToAwaken;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self && -[NSMutableSet allObjects](self->_objectIDsToRegister, "allObjects"))
    -[NSSQLCore managedObjectContextDidRegisterObjectsWithIDs:generation:](self->super._sqlCore, "managedObjectContextDidRegisterObjectsWithIDs:generation:", -[NSMutableSet allObjects](self->_objectIDsToRegister, "allObjects"), -[NSManagedObjectContext _queryGenerationToken](self->super._context, "_queryGenerationToken"));
  if (!-[NSFetchRequest resultType](-[NSSQLFetchRequestContext request](self, "request"), "resultType")
    && !-[NSFetchRequest returnsObjectsAsFaults](-[NSSQLFetchRequestContext request](self, "request"), "returnsObjectsAsFaults")&& objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "count"))
  {
    v3 = 0;
    do
    {
      v4 = (_DWORD *)objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "objectAtIndex:", v3);
      -[NSMutableSet removeObject:](self->_objectsToAwaken, "removeObject:", v4);
      if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_resultFaultsThatWereFired, "objectAtIndex:", v3), "BOOLValue"))
      {
        v4[4] |= 0x1000u;
        objc_msgSend(v4, "awakeFromFetch");
        v4[4] &= ~0x1000u;
      }
      ++v3;
    }
    while (v3 < objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "count"));
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objectsToAwaken = self->_objectsToAwaken;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](objectsToAwaken, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(objectsToAwaken);
        v10 = *(_DWORD **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v10[4] |= 0x1000u;
        objc_msgSend(v10, "awakeFromFetch");
        v10[4] &= ~0x1000u;
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](objectsToAwaken, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

- (id)createChildContextForNestedFetchRequest:(id)a3
{
  NSSQLFetchRequestContext *v5;
  NSManagedObjectContext *context;
  NSSQLiteConnection *connection;
  NSSQLCore *sqlCore;
  NSSQLFetchRequestContext *v9;

  v5 = [NSSQLFetchRequestContext alloc];
  if (self)
  {
    connection = self->super._connection;
    context = self->super._context;
    sqlCore = self->super._sqlCore;
    if (v5)
      goto LABEL_3;
    return 0;
  }
  context = 0;
  connection = 0;
  sqlCore = 0;
  if (!v5)
    return 0;
LABEL_3:
  v9 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:](v5, "initWithRequest:context:sqlCore:", a3, context, sqlCore);
  if (v9)
  {
    v9->_parentContext = self;
    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v9, connection);
  }
  return v9;
}

- (uint64_t)addObjectsToAwaken:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 160);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      *(_QWORD *)(v3 + 160) = v4;
    }
    return objc_msgSend(v4, "addObjectsFromArray:", a2);
  }
  return result;
}

- (uint64_t)addObjectIDsToRegister:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 152);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      *(_QWORD *)(v3 + 152) = v4;
    }
    return objc_msgSend(v4, "addObjectsFromArray:", a2);
  }
  return result;
}

- (BOOL)executeRequestCore:(id *)a3
{
  NSError *error;

  -[NSSQLFetchRequestContext fetchStatement](self, "fetchStatement");
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", _executeFetchRequest((uint64_t)self));
  if (!self)
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  error = self->super._error;
  if (error && a3)
    *a3 = error;
  return !self->super._exception && !self->super._error && -[NSSQLStoreRequestContext result](self, "result") != 0;
}

- (NSSQLiteStatement)fetchStatement
{
  NSSQLiteStatement *statement;
  NSFetchRequest *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  NSSQLiteStatement *v11;
  _PFFetchPlanHeader *fetchPlan;
  $C6D29F7D67899FE11DE7F8953A7C3E5F flags;
  NSDictionary *prefetchingSubstitutionVariables;
  NSSQLiteStatement *v15;
  NSFetchRequest *v16;
  id v17;
  const char *v18;
  ptrdiff_t v19;

  statement = self->_statement;
  if (statement)
    return statement;
  if (!-[NSFetchRequest _isCachingFetchRequest](-[NSSQLFetchRequestContext request](self, "request"), "_isCachingFetchRequest"))
  {
    statement = -[NSSQLFetchRequestContext _createStatement](self, "_createStatement");
    self->_statement = statement;
    return statement;
  }
  v4 = -[NSSQLFetchRequestContext request](self, "request");
  v5 = -[NSFetchRequest _cachedInfoForRequestor:](v4, "_cachedInfoForRequestor:", self->super._connection);
  if (v5)
  {
    v6 = v5;
    if (-[NSFetchRequest fetchLimit](v4, "fetchLimit")
      && !objc_msgSend((id)-[NSFetchRequest substitutionVariables](v4, "substitutionVariables"), "objectForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")))
    {
      v10 = *(_QWORD **)(v6 + 16);
      v8 = (_QWORD *)(v6 + 16);
      v7 = v10;
      if (!v10 || !v7[8])
        goto LABEL_12;
    }
    else
    {
      v9 = *(_QWORD **)(v6 + 8);
      v8 = (_QWORD *)(v6 + 8);
      v7 = v9;
      if (!v9 || !v7[8])
      {
LABEL_12:

        v7 = 0;
        *v8 = 0;
      }
    }
    v11 = v7;
    statement = v11;
    if (v11)
    {
      self->_isUsingCachedStatement = 1;
      fetchPlan = self->_fetchPlan;
      flags = fetchPlan->flags;
      if ((*(_BYTE *)&flags & 0x18) == 0x10)
      {
        fetchPlan->statement_entity = v11->_fakeEntityForFetch;
        fetchPlan->flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&flags & 0xFFFFFFFE);
      }
      prefetchingSubstitutionVariables = self->_prefetchingSubstitutionVariables;
      if (prefetchingSubstitutionVariables)
        -[NSSQLFetchRequestContext _setupBindVariablesForCachedStatement:usingValues:]((uint64_t)self, v11, prefetchingSubstitutionVariables);
      else
        -[NSSQLFetchRequestContext _setupBindVariablesForCachedStatement:usingValues:]((uint64_t)self, v11, (void *)-[NSFetchRequest substitutionVariables](-[NSSQLFetchRequestContext request](self, "request"), "substitutionVariables"));
    }
    v15 = statement;
    if (statement)
      return statement;
  }
  statement = -[NSSQLFetchRequestContext _createStatement](self, "_createStatement");
  self->_statement = statement;
  if (-[NSFetchRequest _isCachingFetchRequest](-[NSSQLFetchRequestContext request](self, "request"), "_isCachingFetchRequest"))
  {
    self->_isUsingCachedStatement = 1;
    v16 = -[NSSQLFetchRequestContext request](self, "request");
    v17 = (id)-[NSFetchRequest _cachedInfoForRequestor:](v16, "_cachedInfoForRequestor:", self->super._connection);
    if (!v17)
    {
      v17 = -[NSCachedFetchRequestThunk initForConnection:]([NSCachedFetchRequestThunk alloc], "initForConnection:", self->super._connection);
      -[NSFetchRequest _cacheInfo:forRequestor:](v16, "_cacheInfo:forRequestor:", v17, self->super._connection);

    }
    if (-[NSFetchRequest fetchLimit](v16, "fetchLimit")
      && !objc_msgSend((id)-[NSFetchRequest substitutionVariables](v16, "substitutionVariables"), "objectForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")))
    {
      if (v17)
      {
        v19 = 16;
        goto LABEL_29;
      }
    }
    else if (v17)
    {
      v19 = 8;
LABEL_29:
      objc_setProperty_nonatomic(v17, v18, statement, v19);
    }
  }
  return statement;
}

- (id)_createStatement
{
  NSSQLFetchRequestContext *v2;
  id result;
  _PFFetchPlanHeader *fetchPlan;
  $C6D29F7D67899FE11DE7F8953A7C3E5F flags;

  v2 = self;
  if (self)
    self = (NSSQLFetchRequestContext *)self->super._sqlCore;
  result = -[NSSQLiteAdapter newSelectStatementWithFetchRequestContext:ignoreInheritance:](-[NSSQLFetchRequestContext adapter](self, "adapter"), v2, v2->_isFaultRequest);
  if (result)
  {
    fetchPlan = v2->_fetchPlan;
    flags = fetchPlan->flags;
    if ((*(_BYTE *)&flags & 0x18) == 0x10)
    {
      fetchPlan->statement_entity = (NSSQLEntity *)*((_QWORD *)result + 6);
      fetchPlan->flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&flags & 0xFFFFFFFE);
    }
  }
  return result;
}

- (void)executePrologue
{
  NSPredicate *v3;
  NSPredicate *v4;
  void *v5;
  _QWORD v6[5];

  v3 = -[NSFetchRequest predicate](-[NSSQLFetchRequestContext request](self, "request"), "predicate");
  if (self && v3)
    -[NSPredicate acceptVisitor:flags:](v3, "acceptVisitor:flags:", self, 1);
  v4 = -[NSFetchRequest havingPredicate](-[NSSQLFetchRequestContext request](self, "request"), "havingPredicate");
  if (self && v4)
    -[NSPredicate acceptVisitor:flags:](v4, "acceptVisitor:flags:", self, 1);
  -[NSSQLFetchRequestContext request](self, "request");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)-[NSFetchRequest substitutionVariables](-[NSSQLFetchRequestContext request](self, "request"), "substitutionVariables");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__NSSQLFetchRequestContext_executePrologue__block_invoke;
    v6[3] = &unk_1E1EDEBC8;
    v6[4] = self;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

- (NSFetchRequest)request
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLFetchRequestContext;
  return (NSFetchRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (BOOL)shouldUseBatches
{
  return self->_shouldUseBatches;
}

- (void)_setupBindVariablesForCachedStatement:(void *)a3 usingValues:
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const char *ClassName;
  uint64_t v49;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[4];
  _BYTE v62[128];
  char v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (a2 && (v4 = a2[7]) != 0)
  {
    v5 = *(void **)(v4 + 8);
    v53 = *(void **)(v4 + 16);
  }
  else
  {
    v5 = 0;
    v53 = 0;
  }
  v6 = (void *)objc_msgSend(a2, "bindVariables");
  v54 = objc_msgSend(v5, "count");
  if (v54)
  {
    v7 = 0;
    v51 = v5;
    do
    {
      v8 = (void *)objc_msgSend(v5, "objectAtIndex:", v7);
      v9 = v7 + 1;
      v10 = (void *)objc_msgSend(v5, "objectAtIndex:", v9);
      v11 = (void *)objc_msgSend(a3, "valueForKey:", v8);
      if (!v11)
      {
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v43 = *MEMORY[0x1E0C99768];
        v45 = (void *)MEMORY[0x1E0CB3940];
        v47 = v8;
        goto LABEL_66;
      }
      v12 = v11;
      if (objc_msgSend(v11, "expressionType"))
      {
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v43 = *MEMORY[0x1E0C99778];
        v45 = (void *)MEMORY[0x1E0CB3940];
        v47 = v8;
        goto LABEL_68;
      }
      v13 = (void *)objc_msgSend(v12, "constantValue");
      if ((objc_msgSend(v13, "isNSArray") & 1) != 0
        || (objc_msgSend(v13, "isNSSet") & 1) != 0
        || objc_msgSend(v13, "isNSOrderedSet"))
      {
LABEL_62:
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v43 = *MEMORY[0x1E0C99778];
        v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad substitution variable for %@, must not be a collection"), v8, ClassName, v49);
        goto LABEL_70;
      }
      v14 = (void *)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
      if (objc_msgSend(v14, "sqlType") != 2)
        goto LABEL_29;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v6;
        v16 = (void *)objc_msgSend(v13, "objectID");
        v17 = v16;
        v18 = a1;
        if (a1)
          a1 = *(_QWORD *)(a1 + 8);
        if (a1 == objc_msgSend(v16, "persistentStore"))
          v19 = objc_msgSend(v17, "_referenceData64");
        else
          v19 = 0;
        a1 = v18;
        v6 = v15;
        v5 = v51;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = objc_msgSend(v13, "longLongValue");
LABEL_26:
          v19 = v21;
          goto LABEL_27;
        }
        if (a1)
          v20 = *(_QWORD *)(a1 + 8);
        else
          v20 = 0;
        if (v20 == objc_msgSend(v13, "persistentStore"))
        {
          v21 = objc_msgSend(v13, "_referenceData64");
          goto LABEL_26;
        }
        v19 = 0;
      }
LABEL_27:
      if ((objc_msgSend(v8, "isEqual:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")) & 1) == 0
        && !objc_msgSend(v8, "isEqual:", CFSTR("FETCH_REQUEST_OFFSET_SUBSTITUTION")))
      {
        objc_msgSend(v14, "setInt64:", v19);
        goto LABEL_30;
      }
LABEL_29:
      objc_msgSend(v14, "setValue:", v13);
LABEL_30:
      v7 = v9 + 1;
    }
    while (v7 < v54);
  }
  v55 = (void *)objc_msgSend(a2, "bindIntarrays");
  v52 = objc_msgSend(v55, "count");
  if (!v52)
    return;
  for (i = 0; i < v52; i += 3)
  {
    v23 = objc_msgSend(v53, "objectAtIndex:", i);
    v24 = (void *)objc_msgSend(v53, "objectAtIndex:", i + 1);
    v25 = (void *)objc_msgSend(v53, "objectAtIndex:", i + 2);
    v26 = (void *)objc_msgSend(a3, "valueForKey:", v23);
    if (!v26)
    {
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99768];
      v45 = (void *)MEMORY[0x1E0CB3940];
      v47 = (void *)v23;
LABEL_66:
      v46 = CFSTR("missing variable binding for %@");
      goto LABEL_69;
    }
    v27 = v26;
    if (objc_msgSend(v26, "expressionType"))
    {
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99778];
      v45 = (void *)MEMORY[0x1E0CB3940];
      v47 = (void *)v23;
LABEL_68:
      v46 = CFSTR("bad substitution variable for %@, must be a constant value");
LABEL_69:
      v44 = objc_msgSend(v45, "stringWithFormat:", v46, v47, ClassName, v49);
      goto LABEL_70;
    }
    v28 = (void *)objc_msgSend(v27, "constantValue");
    if ((objc_msgSend(v28, "isNSArray") & 1) == 0
      && (objc_msgSend(v28, "isNSSet") & 1) == 0
      && (objc_msgSend(v28, "isNSOrderedSet") & 1) == 0)
    {
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99778];
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad substitution variable for %@, must be a collection"), v23, ClassName, v49);
      goto LABEL_70;
    }
    v29 = (void *)objc_msgSend(v55, "objectAtIndex:", objc_msgSend(v25, "unsignedIntegerValue"));
    if (objc_msgSend(v28, "count"))
    {
      memset(v61, 0, sizeof(v61));
      objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", v61, v63, 16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v28);
LABEL_48:
        v30 = v31;
        goto LABEL_49;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v28;
        goto LABEL_48;
      }
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99778];
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad substitution variable for %@, must be a collection of objects or objectIDs"), v23, ClassName, v49);
LABEL_70:
      objc_exception_throw((id)objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v43, v44, a3));
    }
    v30 = 0;
LABEL_49:
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (!v32)
      goto LABEL_59;
    v33 = v32;
    v34 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(v30);
        v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (objc_msgSend((id)objc_msgSend(v8, "entity"), "isKindOfEntity:", v24) & 1) == 0)
        {
          ClassName = object_getClassName(v8);
          v49 = objc_msgSend(v24, "name");
          _NSCoreDataLog(1, (uint64_t)CFSTR("oid = %@ [oid class] = %s expecting entity %@"), v36, v37, v38, v39, v40, v41, (uint64_t)v8);
          __break(1u);
          goto LABEL_62;
        }
      }
      v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v33);
LABEL_59:
    objc_msgSend(v29, "setValue:", v30);

  }
}

uint64_t __43__NSSQLFetchRequestContext_executePrologue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visitPredicateExpression:");
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self)
    self = (NSSQLFetchRequestContext *)self->super._connection;
  return -[NSSQLitePrefetchRequestCache manyToManyPrefetchRequestsForRelationshipNamed:onEntity:](-[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self), "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:", a3, a4);
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self)
    self = (NSSQLFetchRequestContext *)self->super._connection;
  return -[NSSQLitePrefetchRequestCache manyToOnePrefetchRequestForRelationshipNamed:onEntity:](-[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self), "manyToOnePrefetchRequestForRelationshipNamed:onEntity:", a3, a4);
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self)
    self = (NSSQLFetchRequestContext *)self->super._connection;
  return -[NSSQLitePrefetchRequestCache inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:](-[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self), "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:", a3, a4);
}

- (void)ubiquitousExternalReferenceLocationForUUID:(void *)result
{
  if (result)
    return (void **)+[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, a2, result[1]);
  return result;
}

- (uint64_t)_fireFaultsForValue:(uint64_t)result
{
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v3 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      return objc_msgSend(a2, "willAccessValueForKey:", 0);
    }
    else if ((objc_msgSend(a2, "isNSArray") & 1) != 0
           || (objc_msgSend(a2, "isNSSet") & 1) != 0
           || (result = objc_msgSend(a2, "isNSOrderedSet"), (_DWORD)result))
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __48__NSSQLFetchRequestContext__fireFaultsForValue___block_invoke;
      v4[3] = &unk_1E1EE1A20;
      v4[4] = v3;
      return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
    }
  }
  return result;
}

uint64_t __48__NSSQLFetchRequestContext__fireFaultsForValue___block_invoke(uint64_t a1)
{
  return -[NSSQLFetchRequestContext _fireFaultsForValue:](*(_QWORD *)(a1 + 32));
}

- (BOOL)isFaultRequest
{
  return self->_isFaultRequest;
}

@end
