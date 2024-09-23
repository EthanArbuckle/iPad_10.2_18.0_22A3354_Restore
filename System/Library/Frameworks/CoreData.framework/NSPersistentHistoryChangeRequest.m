@implementation NSPersistentHistoryChangeRequest

- (NSPersistentHistoryToken)token
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFetchRequest:(NSFetchRequest *)fetchRequest
{

  *((_QWORD *)self->_additionalPrivateIvars + 3) = fetchRequest;
}

- (unint64_t)percentageOfDB
{
  return self->_percentageOfDB;
}

- (NSPersistentHistoryChangeRequest)initWithTransactionID:(id)a3 delete:(BOOL)a4 transactionOnly:(BOOL)a5 percentageOfDB:(unint64_t)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  NSPersistentHistoryChangeRequest *v10;
  __persistentHistoryChangeRequestDescriptionFlags persistentHistoryChangeRequestDescriptionFlags;
  unsigned int v12;
  int v13;
  int v14;
  uint64_t v15;

  v7 = a5;
  v8 = a4;
  if (a4 && a5)
    return 0;
  v10 = -[NSPersistentHistoryChangeRequest init](self, "init");
  if (v10)
  {
    v10->_transactionNumber = (NSNumber *)a3;
    persistentHistoryChangeRequestDescriptionFlags = v10->_persistentHistoryChangeRequestDescriptionFlags;
    if (a6)
    {
      v10->_persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(*(_DWORD *)&persistentHistoryChangeRequestDescriptionFlags | 8);
      v10->_percentageOfDB = a6;
      v12 = v10->_persistentHistoryChangeRequestDescriptionFlags;
    }
    else
    {
      if (v8)
        v13 = 2;
      else
        v13 = 0;
      v12 = *(_DWORD *)&persistentHistoryChangeRequestDescriptionFlags & 0xFFFFFFFD | v13;
    }
    if (v7)
      v14 = 4;
    else
      v14 = 0;
    v10->_persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(v12 & 0xFFFFFFFB | v14);
    v15 = 5;
    if (v8)
      v15 = 0;
    v10->_resultType = v15;
  }
  return v10;
}

- (unint64_t)fetchBatchSize
{
  unint64_t result;

  result = *((_QWORD *)self->_additionalPrivateIvars + 2);
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

- (unint64_t)fetchLimit
{
  unint64_t result;

  result = *((_QWORD *)self->_additionalPrivateIvars + 1);
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

- (id)entityNameToFetch
{
  const __CFString *v3;
  unint64_t v4;
  __CFString **v5;

  if (-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"))
  {
    v3 = CFSTR("TRANSACTION");
    if (!-[NSString isEqualToString:](-[NSFetchRequest entityName](-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"), "entityName"), "isEqualToString:", CFSTR("TRANSACTION"))&& !-[NSString isEqualToString:](-[NSFetchRequest entityName](-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"), "entityName"), "isEqualToString:", CFSTR("Transaction")))
    {
      v3 = CFSTR("CHANGE");
      if (!-[NSString isEqualToString:](-[NSFetchRequest entityName](-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"), "entityName"), "isEqualToString:", CFSTR("CHANGE"))&& !-[NSString isEqualToString:](-[NSFetchRequest entityName](-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"), "entityName"), "isEqualToString:", CFSTR("Change")))
      {
        return 0;
      }
    }
  }
  else
  {
    v4 = self->_resultType - 1;
    if (v4 > 5)
      v5 = PFPersistentHistoryTransaction;
    else
      v5 = off_1E1EDD260[v4];
    return *v5;
  }
  return (id)v3;
}

- (NSFetchRequest)fetchRequest
{
  return (NSFetchRequest *)*((_QWORD *)self->_additionalPrivateIvars + 3);
}

- (unint64_t)requestType
{
  return 8;
}

- (id)predicateForStoreIdentifier:(id)a3
{
  void *v5;
  NSPredicate *v6;
  NSPredicate *v7;
  _NSPersistentHistoryPredicateRemapper *v8;
  id v9;
  id v10;
  id v12;

  if (!-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"))
    return -[NSPersistentHistoryChangeRequest _predicateForStoreID:](self, (uint64_t)a3);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v6 = -[NSFetchRequest predicate](-[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest"), "predicate");
  if (v6)
  {
    v7 = v6;
    v8 = -[_NSPersistentHistoryPredicateRemapper initWithStoreIdentifier:]([_NSPersistentHistoryPredicateRemapper alloc], "initWithStoreIdentifier:", a3);
    v9 = -[_NSPersistentHistoryPredicateRemapper createPredicateForFetchFromPredicate:](v8, "createPredicateForFetchFromPredicate:", v7);
    v10 = v9;

  }
  else
  {
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  }
  objc_msgSend(v5, "addObject:", v9);
  if (self->_token
    || -[NSPersistentHistoryChangeRequest date](self, "date")
    || self->_transactionNumber
    || -[NSArray count](self->_transactionIDs, "count"))
  {
    v12 = -[NSPersistentHistoryChangeRequest predicate](self, "predicate");
    if (v12)
      objc_msgSend(v5, "addObject:", v12);
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
}

- (void)_predicateForStoreID:(void *)result
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  int v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "date");
    v5 = *((_QWORD *)v3 + 3);
    v6 = v5 > 6;
    v7 = (1 << v5) & 0x52;
    if (v6 || v7 == 0)
    {
      if (*((_QWORD *)v3 + 5))
      {
        v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "fetchRequest"), "entityName"), "isEqualToString:", CFSTR("Change"));
        v9 = (void *)MEMORY[0x1E0CB3940];
        if (v11)
        {
          if ((objc_msgSend(v3, "isFetchTransactionForToken") & 1) != 0)
          {
            v12 = CFSTR("=");
          }
          else if (objc_msgSend(v3, "isDelete"))
          {
            v12 = CFSTR("<");
          }
          else
          {
            v12 = CFSTR(">");
          }
          v35 = v12;
          v36 = objc_msgSend(*((id *)v3 + 5), "longLongValue");
          v34 = CFSTR("TRANSACTIONID");
          v18 = CFSTR("%@ %@ %lld");
        }
        else
        {
          if ((objc_msgSend(v3, "isFetchTransactionForToken") & 1) != 0)
          {
            v19 = CFSTR("=");
          }
          else if (objc_msgSend(v3, "isDelete"))
          {
            v19 = CFSTR("<");
          }
          else
          {
            v19 = CFSTR(">");
          }
          v34 = v19;
          v35 = (const __CFString *)objc_msgSend(*((id *)v3 + 5), "longLongValue");
          v18 = CFSTR("_pk %@ %lld");
        }
        goto LABEL_41;
      }
      if (objc_msgSend(*((id *)v3 + 4), "count"))
        return (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY _pk IN %@"), *((_QWORD *)v3 + 4));
      if (!v4 && !*((_QWORD *)v3 + 2))
        return (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "fetchRequest"), "entityName"), "isEqualToString:", CFSTR("Change")))v24 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@."), CFSTR("TRANSACTIONID"));
      else
        v24 = &stru_1E1EE23F0;
      v26 = (void *)*((_QWORD *)v3 + 2);
      if (v26)
      {
        v27 = objc_msgSend((id)objc_msgSend(v26, "storeTokens"), "valueForKey:", a2);
        if (v27)
        {
          v28 = v27;
          v29 = (void *)MEMORY[0x1E0CB3940];
          if ((objc_msgSend(v3, "isFetchTransactionForToken") & 1) != 0)
          {
            v30 = CFSTR("=");
          }
          else
          {
            v31 = objc_msgSend(v3, "isDelete");
            v30 = CFSTR(">");
            if (v31)
              v30 = CFSTR("<");
          }
          v23 = objc_msgSend(v29, "stringWithFormat:", CFSTR("%@%@ %@ %@"), v24, CFSTR("_pk"), v30, v28);
          if (v23)
            return (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v23);
        }
      }
      v16 = (void *)MEMORY[0x1E0CB3940];
      if (objc_msgSend(v3, "isDelete", v23))
        v32 = CFSTR("<");
      else
        v32 = CFSTR(">");
      if (v4)
        objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      else
        v33 = 0;
      v37 = v33;
      v35 = CFSTR("TIMESTAMP");
      v36 = (uint64_t)v32;
      v34 = v24;
      v18 = CFSTR("%@%@ %@ %f");
    }
    else
    {
      if (objc_msgSend(*((id *)v3 + 4), "count"))
        return (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY TRANSACTIONID IN %@"), *((_QWORD *)v3 + 4));
      if (*((_QWORD *)v3 + 5))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        if ((objc_msgSend(v3, "isFetchTransactionForToken") & 1) != 0)
        {
          v10 = CFSTR("=");
        }
        else if (objc_msgSend(v3, "isDelete"))
        {
          v10 = CFSTR("<");
        }
        else
        {
          v10 = CFSTR(">");
        }
        v35 = v10;
        v36 = objc_msgSend(*((id *)v3 + 5), "longLongValue");
        v34 = CFSTR("TRANSACTIONID");
        v18 = CFSTR("ANY %@ %@ %lld");
LABEL_41:
        v22 = v9;
LABEL_68:
        v23 = objc_msgSend(v22, "stringWithFormat:", v18, v34, v35, v36, v37);
        return (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v23);
      }
      v13 = (void *)*((_QWORD *)v3 + 2);
      if (v13)
      {
        v14 = objc_msgSend((id)objc_msgSend(v13, "storeTokens"), "valueForKey:", a2);
        if (v14)
        {
          v15 = v14;
          v16 = (void *)MEMORY[0x1E0CB3940];
          if ((objc_msgSend(v3, "isFetchTransactionForToken") & 1) != 0)
          {
            v17 = CFSTR("=");
          }
          else
          {
            v25 = objc_msgSend(v3, "isDelete");
            v17 = CFSTR(">");
            if (v25)
              v17 = CFSTR("<");
          }
          v35 = v17;
          v36 = v15;
          v34 = CFSTR("TRANSACTIONID");
          v18 = CFSTR("ANY %@ %@ %@");
          goto LABEL_67;
        }
        v23 = 0;
        return (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v23);
      }
      v16 = (void *)MEMORY[0x1E0CB3940];
      if (objc_msgSend(v3, "isDelete"))
        v20 = CFSTR("<");
      else
        v20 = CFSTR(">");
      if (v4)
        objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      else
        v21 = 0;
      v37 = v21;
      v35 = CFSTR("TIMESTAMP");
      v36 = (uint64_t)v20;
      v34 = CFSTR("TRANSACTIONID");
      v18 = CFSTR("ANY %@.%@ %@ %f");
    }
LABEL_67:
    v22 = v16;
    goto LABEL_68;
  }
  return result;
}

- (id)date
{
  return *self->_additionalPrivateIvars;
}

- (BOOL)isFetchTransactionForToken
{
  return (*(_BYTE *)&self->_persistentHistoryChangeRequestDescriptionFlags >> 2) & 1;
}

- (void)setResultType:(NSPersistentHistoryResultType)resultType
{
  NSPersistentHistoryResultType v5;

  if (-[NSPersistentHistoryChangeRequest isDelete](self, "isDelete"))
    v5 = NSPersistentHistoryResultTypeStatusOnly;
  else
    v5 = resultType;
  self->_resultType = v5;
}

- (BOOL)isDelete
{
  return (*(_BYTE *)&self->_persistentHistoryChangeRequestDescriptionFlags & 0xA) != 0;
}

- (id)propertiesToFetch
{
  return 0;
}

- (id)predicate
{
  return -[NSPersistentHistoryChangeRequest _predicateForStoreID:](self, 0);
}

- (unint64_t)fetchOffset
{
  unint64_t result;

  result = *((_QWORD *)self->_additionalPrivateIvars + 4);
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeDate:(NSDate *)date
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDate:delete:", date, 1);
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterDate:(NSDate *)date
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDate:", date);
}

- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3 delete:(BOOL)a4 percentageOfDB:(unint64_t)a5
{
  _BOOL4 v6;
  NSPersistentHistoryChangeRequest *v8;
  uint64_t v9;
  int v10;

  v6 = a4;
  v8 = -[NSPersistentHistoryChangeRequest init](self, "init");
  if (v8)
  {
    *v8->_additionalPrivateIvars = a3;
    v9 = 5;
    if (v6)
      v9 = 0;
    v8->_resultType = v9;
    v8->_transactionIDs = (NSArray *)(id)NSArray_EmptyArray;
    if (a5)
    {
      *(_DWORD *)&v8->_persistentHistoryChangeRequestDescriptionFlags |= 8u;
      v8->_percentageOfDB = a5;
    }
    if (v6)
      v10 = 2;
    else
      v10 = 0;
    v8->_persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(*(_DWORD *)&v8->_persistentHistoryChangeRequestDescriptionFlags & 0xFFFFFFFD | v10);
  }
  return v8;
}

- (NSPersistentHistoryChangeRequest)initWithTransactionIDs:(id)a3
{
  NSPersistentHistoryChangeRequest *v4;

  v4 = -[NSPersistentHistoryChangeRequest init](self, "init");
  if (v4)
  {
    v4->_transactionIDs = (NSArray *)a3;
    v4->_resultType = 4;
  }
  return v4;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterToken:(NSPersistentHistoryToken *)token
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithToken:", token);
}

- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3 delete:(BOOL)a4 percentageOfDB:(unint64_t)a5
{
  _BOOL4 v6;
  NSPersistentHistoryChangeRequest *v8;
  uint64_t v9;
  int v10;

  v6 = a4;
  v8 = -[NSPersistentHistoryChangeRequest init](self, "init");
  if (v8)
  {
    if (a3)
      v8->_token = (NSPersistentHistoryToken *)a3;
    v9 = 5;
    if (v6)
      v9 = 0;
    v8->_resultType = v9;
    if (v6)
    {
      if (a5)
      {
        v8->_percentageOfDB = a5;
        v10 = 8;
      }
      else
      {
        v10 = 2;
      }
      *(_DWORD *)&v8->_persistentHistoryChangeRequestDescriptionFlags |= v10;
    }
  }
  return v8;
}

- (NSPersistentHistoryChangeRequest)init
{
  NSPersistentHistoryChangeRequest *v2;
  NSPersistentHistoryChangeRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSPersistentHistoryChangeRequest;
  v2 = -[NSPersistentHistoryChangeRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_resultType = 5;
    v2->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(5);
  }
  return v3;
}

- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3 delete:(BOOL)a4
{
  return -[NSPersistentHistoryChangeRequest initWithToken:delete:percentageOfDB:](self, "initWithToken:delete:percentageOfDB:", a3, a4, 0);
}

- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3
{
  return -[NSPersistentHistoryChangeRequest initWithToken:delete:](self, "initWithToken:delete:", a3, 0);
}

- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3 delete:(BOOL)a4
{
  return -[NSPersistentHistoryChangeRequest initWithDate:delete:percentageOfDB:](self, "initWithDate:delete:percentageOfDB:", a3, a4, 0);
}

- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3
{
  return -[NSPersistentHistoryChangeRequest initWithDate:delete:](self, "initWithDate:delete:", a3, 0);
}

- (NSFetchRequest)fetchRequestDescribingChangeRequestForStore:(void *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  NSFetchRequest *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(a1, "entityNameToFetch");
  v5 = objc_msgSend(a2, "persistentStoreCoordinator");
  if (v5)
    v6 = *(_QWORD *)(v5 + 96);
  else
    v6 = 0;
  v7 = CFSTR("TRANSACTION");
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TRANSACTION")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("Transaction")))
  {
    v7 = CFSTR("CHANGE");
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CHANGE")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("Change")))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexepected Entity Name for a History Request - %@");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)v4);
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Unexepected Entity Name for a History Request - %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), v7);
  if (!v6)
  {
LABEL_30:
    v9 = 0;
    goto LABEL_10;
  }
  v9 = (void *)objc_msgSend(*(id *)(v6 + 56), "objectForKey:", v8);
LABEL_10:
  v10 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), objc_msgSend((id)objc_msgSend(v9, "name"), "uppercaseString")));
  -[NSFetchRequest setIncludesSubentities:](v10, "setIncludesSubentities:", 0);
  v11 = objc_msgSend(a1, "predicateForStoreIdentifier:", objc_msgSend(a2, "identifier"));
  if (v11)
    -[NSFetchRequest setPredicate:](v10, "setPredicate:", v11);
  -[NSFetchRequest setIncludesPropertyValues:](v10, "setIncludesPropertyValues:", 1);
  -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0);
  if (objc_msgSend(a1, "fetchLimit"))
  {
    -[NSFetchRequest setFetchLimit:](v10, "setFetchLimit:", objc_msgSend(a1, "fetchLimit"));
    if (objc_msgSend(a1, "fetchOffset"))
      -[NSFetchRequest setFetchOffset:](v10, "setFetchOffset:", objc_msgSend(a1, "fetchOffset"));
  }
  if (objc_msgSend(a1, "fetchRequest")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "sortDescriptors"), "count"))
  {
    -[NSFetchRequest setSortDescriptors:](v10, "setSortDescriptors:", objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "sortDescriptors"));
  }
  if (objc_msgSend(a1, "fetchBatchSize"))
  {
    -[NSFetchRequest setFetchBatchSize:](v10, "setFetchBatchSize:", objc_msgSend(a1, "fetchBatchSize"));
    if (!-[NSArray count](-[NSFetchRequest sortDescriptors](v10, "sortDescriptors"), "count"))
    {
      v23 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
      -[NSFetchRequest setSortDescriptors:](v10, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1));
    }
  }
  if (objc_msgSend(a1, "resultType") == 5)
  {
    v22 = CFSTR("CHANGES");
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v10, "setRelationshipKeyPathsForPrefetching:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1));
  }
  if (objc_msgSend(a1, "resultType") && objc_msgSend(a1, "resultType") != 2 && objc_msgSend(a1, "resultType") != 6)
  {
    if (objc_msgSend(a1, "propertiesToFetch"))
    {
      v12 = (void *)objc_msgSend(a1, "propertiesToFetch");
    }
    else
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(a1, "propertiesToFetchForEntity:includeTransactionStrings:", v9, 1));
      if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", CFSTR("NSXPCStore")))
        objc_msgSend(v12, "removeObject:", CFSTR("QUERYGEN"));
    }
    -[NSFetchRequest setPropertiesToFetch:](v10, "setPropertiesToFetch:", v12);
  }
  if (objc_msgSend((id)objc_msgSend(a1, "affectedStores"), "count"))
    -[NSFetchRequest setAffectedStores:](v10, "setAffectedStores:", objc_msgSend(a1, "affectedStores"));
  return v10;
}

- (id)propertiesToFetchForEntity:(id)a3 includeTransactionStrings:(BOOL)a4
{
  _BOOL4 v4;
  NSExpressionDescription *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSExpressionDescription *v16;
  uint64_t v17;
  NSExpressionDescription *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _QWORD v35[4];
  _QWORD v36[5];

  v4 = a4;
  v36[3] = *MEMORY[0x1E0C80C00];
  if (-[NSPersistentHistoryChangeRequest resultType](self, "resultType") != NSPersistentHistoryResultTypeObjectIDs
    || (__CFString *)objc_msgSend(a3, "name") != CFSTR("CHANGE"))
  {
    v7 = objc_alloc_init(NSExpressionDescription);
    -[NSPropertyDescription setName:](v7, "setName:", CFSTR("self"));
    -[NSExpressionDescription setExpression:](v7, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"));
    -[NSExpressionDescription setExpressionResultType:](v7, "setExpressionResultType:", 2000);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);

    if (!objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", CFSTR("TRANSACTION"))
      || -[NSPersistentHistoryChangeRequest resultType](self, "resultType") != NSPersistentHistoryResultTypeObjectIDs
      && -[NSPersistentHistoryChangeRequest resultType](self, "resultType") != NSPersistentHistoryResultTypeChangesOnly)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", CFSTR("TRANSACTION")) && v4)
      {
        v35[0] = CFSTR("AUTHORTS");
        v35[1] = CFSTR("BUNDLEIDTS");
        v35[2] = CFSTR("CONTEXTNAMETS");
        v35[3] = CFSTR("PROCESSIDTS");
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              if (a3)
              {
                v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "objectForKey:", v14))
                {
                  v15 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v14, CFSTR("NAME")));
                  v16 = objc_alloc_init(NSExpressionDescription);
                  -[NSPropertyDescription setName:](v16, "setName:", v14);
                  -[NSExpressionDescription setExpression:](v16, "setExpression:", v15);
                  -[NSExpressionDescription setExpressionResultType:](v16, "setExpressionResultType:", 700);
                  objc_msgSend(v8, "addObject:", v16);

                }
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v11);
        }
        goto LABEL_21;
      }
      if (!objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", CFSTR("CHANGE"))
        || (v17 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("TRANSACTIONID")),
            v18 = objc_alloc_init(NSExpressionDescription),
            -[NSPropertyDescription setName:](v18, "setName:", CFSTR("TRANSACTIONID")),
            -[NSExpressionDescription setExpression:](v18, "setExpression:", v17),
            -[NSExpressionDescription setExpressionResultType:](v18, "setExpressionResultType:", 2000),
            objc_msgSend(v8, "addObject:", v18),
            v18,
            -[NSPersistentHistoryChangeRequest resultType](self, "resultType") != NSPersistentHistoryResultTypeTransactionsOnly))
      {
LABEL_21:
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v19 = (void *)objc_msgSend(a3, "attributeKeys");
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v26 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v21);
        }
      }
    }
    return v8;
  }
  v36[0] = CFSTR("CHANGETYPE");
  v36[1] = CFSTR("ENTITY");
  v36[2] = CFSTR("ENTITYPK");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
}

- (NSPersistentHistoryResultType)resultType
{
  return self->_resultType;
}

- (id)transactionNumber
{
  return self->_transactionNumber;
}

- (BOOL)isPercentageDelete
{
  return (*(_BYTE *)&self->_persistentHistoryChangeRequestDescriptionFlags >> 3) & 1;
}

- (void)dealloc
{
  id *additionalPrivateIvars;
  objc_super v4;

  self->_token = 0;
  self->_transactionIDs = 0;

  self->_transactionNumber = 0;
  additionalPrivateIvars = self->_additionalPrivateIvars;
  if (additionalPrivateIvars)
  {

    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
    self->_additionalPrivateIvars = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPersistentHistoryChangeRequest;
  -[NSPersistentStoreRequest dealloc](&v4, sel_dealloc);
}

- (void)setFetchLimit:(unint64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 1);
  if (v5)
  {
    if (objc_msgSend(v5, "unsignedIntegerValue") == a3)
      return;
    v6 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 1);
  }
  else
  {
    v6 = 0;
  }

  *((_QWORD *)self->_additionalPrivateIvars + 1) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
}

- (void)setFetchBatchSize:(unint64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 2);
  if (v5)
  {
    if (objc_msgSend(v5, "unsignedIntegerValue") == a3)
      return;
    v6 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 2);
  }
  else
  {
    v6 = 0;
  }

  *((_QWORD *)self->_additionalPrivateIvars + 2) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
}

- (id)encodeForXPC
{
  id v2;
  void *v3;
  id v4;

  v2 = -[NSPersistentHistoryChangeRequestToken initForRequest:]([NSPersistentHistoryChangeRequestToken alloc], "initForRequest:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "setDelegate:", objc_opt_class());
  objc_msgSend(v3, "encodeObject:forKey:", v2, CFSTR("root"));
  objc_msgSend(v3, "finishEncoding");
  v4 = (id)objc_msgSend(v3, "encodedData");

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  NSPersistentHistoryChangeRequest *v10;
  _NSPersistentHistoryToken *v11;
  NSPersistentHistoryChangeRequest *v12;
  NSPersistentHistoryChangeRequest *v13;
  uint64_t v14;
  uint64_t v15;
  NSPersistentHistoryChangeRequest *v16;
  NSPersistentHistoryChangeRequest *v17;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
  objc_msgSend(v7, "setDelegate:", a4);
  v8 = (void *)objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("root"));

  if (objc_msgSend(v8, "fetchData"))
  {
    v9 = +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:](NSFetchRequest, "decodeFromXPCArchive:withContext:andPolicy:", objc_msgSend(v8, "fetchData"), a4, a5);
    if (objc_msgSend(v8, "delete"))
    {
      v10 = +[NSPersistentHistoryChangeRequest deleteRequest](NSPersistentHistoryChangeRequest, "deleteRequest");
      -[NSPersistentHistoryChangeRequest setFetchRequest:](v10, "setFetchRequest:", v9);
    }
    else
    {
      v10 = -[NSPersistentHistoryChangeRequest initWithFetchRequest:]([NSPersistentHistoryChangeRequest alloc], "initWithFetchRequest:", v9);
      v13 = v10;
    }
  }
  else
  {
    if (objc_msgSend(v8, "date") || objc_msgSend(v8, "token"))
    {
      v10 = 0;
    }
    else
    {
      if (objc_msgSend(v8, "delete"))
      {
        if (objc_msgSend(v8, "percentageOfDB"))
          v17 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:", 0, objc_msgSend(v8, "percentageOfDB"));
        else
          v17 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:", 0);
      }
      else
      {
        v17 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", 0);
      }
      v10 = v17;
    }
    if (objc_msgSend(v8, "token"))
    {
      v11 = -[_NSPersistentHistoryToken initWithDictionary:]([_NSPersistentHistoryToken alloc], "initWithDictionary:", objc_msgSend(v8, "token"));
      if (objc_msgSend(v8, "delete"))
      {
        if (objc_msgSend(v8, "percentageOfDB"))
          v12 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:", v11, objc_msgSend(v8, "percentageOfDB"));
        else
          v12 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:", v11);
      }
      else if (objc_msgSend(v8, "transactionFromToken"))
      {
        v12 = +[NSPersistentHistoryChangeRequest fetchHistoryTransactionForToken:](NSPersistentHistoryChangeRequest, "fetchHistoryTransactionForToken:", v11);
      }
      else
      {
        v12 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", v11);
      }
      v10 = v12;

    }
    else if (objc_msgSend(v8, "date"))
    {
      if (objc_msgSend(v8, "delete"))
      {
        v14 = objc_msgSend(v8, "percentageOfDB");
        v15 = objc_msgSend(v8, "date");
        if (v14)
          v16 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:", v15, objc_msgSend(v8, "percentageOfDB"));
        else
          v16 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeDate:", v15);
      }
      else
      {
        v16 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterDate:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterDate:", objc_msgSend(v8, "date"));
      }
      v10 = v16;
    }
  }
  -[NSPersistentHistoryChangeRequest setResultType:](v10, "setResultType:", objc_msgSend(v8, "resultType"));
  if (objc_msgSend(v8, "fetchLimit"))
  {
    -[NSPersistentHistoryChangeRequest setFetchLimit:](v10, "setFetchLimit:", objc_msgSend(v8, "fetchLimit"));
    if (objc_msgSend(v8, "fetchOffset"))
      -[NSPersistentHistoryChangeRequest setFetchOffset:](v10, "setFetchOffset:", objc_msgSend(v8, "fetchOffset"));
  }
  if (objc_msgSend(v8, "fetchBatchSize"))
    -[NSPersistentHistoryChangeRequest setFetchBatchSize:](v10, "setFetchBatchSize:", objc_msgSend(v8, "fetchBatchSize"));
  return v10;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterTransaction:(NSPersistentHistoryTransaction *)transaction
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithToken:", -[NSPersistentHistoryTransaction token](transaction, "token"));
}

+ (id)fetchHistoryTransactionForToken:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTransactionToken:", a3);
  else
    return 0;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryWithFetchRequest:(NSFetchRequest *)fetchRequest
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:", fetchRequest);
}

+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeToken:(NSPersistentHistoryToken *)token
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithToken:delete:", token, 1);
}

+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeTransaction:(NSPersistentHistoryTransaction *)transaction
{
  return (NSPersistentHistoryChangeRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithToken:delete:", -[NSPersistentHistoryTransaction token](transaction, "token"), 1);
}

+ (id)deleteHistoryBeforeDate:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDate:delete:percentageOfDB:", a3, 1, a4);
}

+ (id)deleteHistoryBeforeToken:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithToken:delete:percentageOfDB:", a3, 1, a4);
}

+ (id)deleteRequest
{
  NSPersistentHistoryChangeRequest *v2;

  v2 = objc_alloc_init(NSPersistentHistoryChangeRequest);
  v2->_resultType = 0;
  v2->_transactionIDs = (NSArray *)(id)NSArray_EmptyArray;
  *(_DWORD *)&v2->_persistentHistoryChangeRequestDescriptionFlags |= 2u;
  return v2;
}

- (NSPersistentHistoryChangeRequest)initWithFetchRequest:(id)a3
{
  NSPersistentHistoryChangeRequest *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((objc_msgSend((id)objc_msgSend(a3, "entityName"), "isEqualToString:", CFSTR("Change")) & 1) != 0
    || (objc_msgSend((id)objc_msgSend(a3, "entityName"), "isEqualToString:", CFSTR("Transaction")) & 1) != 0)
  {
    v5 = -[NSPersistentHistoryChangeRequest init](self, "init");
    if (v5)
    {
      *((_QWORD *)v5->_additionalPrivateIvars + 3) = a3;
      v5->_transactionIDs = (NSArray *)(id)NSArray_EmptyArray;
      if (objc_msgSend((id)objc_msgSend(a3, "entityName"), "isEqualToString:", CFSTR("Change")))
        v5->_resultType = 4;
    }
  }
  else
  {
    v6 = objc_opt_class();
    _NSCoreDataLog(1, (uint64_t)CFSTR("%@ only accepts a NSFetchRequest that has the entity set to a Persistent History Entity"), v7, v8, v9, v10, v11, v12, v6);

    return 0;
  }
  return v5;
}

- (NSPersistentHistoryChangeRequest)initWithTransactionToken:(id)a3
{
  NSPersistentHistoryChangeRequest *v4;

  if (!a3)
    return 0;
  v4 = -[NSPersistentHistoryChangeRequest init](self, "init");
  if (v4)
  {
    v4->_token = (NSPersistentHistoryToken *)a3;
    *(_DWORD *)&v4->_persistentHistoryChangeRequestDescriptionFlags |= 4u;
    v4->_resultType = 5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  NSPersistentHistoryToken *token;
  NSArray *transactionIDs;
  NSNumber *transactionNumber;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSPersistentHistoryChangeRequest;
  v4 = -[NSPersistentStoreRequest copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    token = self->_token;
    if (token)
      v4[2] = token;
    transactionIDs = self->_transactionIDs;
    if (transactionIDs)
      v4[4] = -[NSArray copy](transactionIDs, "copy");
    transactionNumber = self->_transactionNumber;
    if (transactionNumber)
      v4[5] = -[NSNumber copy](transactionNumber, "copy");
    v4[8] = self->_percentageOfDB;
    *((_DWORD *)v4 + 12) = self->_persistentHistoryChangeRequestDescriptionFlags;
    *(_QWORD *)v4[7] = objc_msgSend(*self->_additionalPrivateIvars, "copy");
    *(_QWORD *)(v4[7] + 8) = objc_msgSend(self->_additionalPrivateIvars[1], "copy");
    *(_QWORD *)(v4[7] + 16) = objc_msgSend(self->_additionalPrivateIvars[2], "copy");
    *(_QWORD *)(v4[7] + 24) = objc_msgSend(self->_additionalPrivateIvars[3], "copy");
    *(_QWORD *)(v4[7] + 32) = objc_msgSend(self->_additionalPrivateIvars[4], "copy");
    v4[3] = self->_resultType;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSPersistentHistoryToken *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSPersistentHistoryResultType v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSFetchRequest *v19;
  uint64_t v20;

  if (a3 == self)
    goto LABEL_31;
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_30:
    LOBYTE(v6) = 0;
    return v6;
  }
  v5 = -[NSPersistentHistoryChangeRequest token](self, "token");
  v6 = objc_msgSend(a3, "token");
  if (v5 == (NSPersistentHistoryToken *)v6
    || (v7 = v6, LOBYTE(v6) = 0, v5)
    && v7
    && (LODWORD(v6) = -[NSPersistentHistoryToken isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSPersistentHistoryChangeRequest transactionNumber](self, "transactionNumber");
    v6 = objc_msgSend(a3, "transactionNumber");
    if (v8 == (id)v6 || (v9 = v6, LOBYTE(v6) = 0, v8) && v9 && (LODWORD(v6) = objc_msgSend(v8, "isEqual:"), (_DWORD)v6))
    {
      v10 = -[NSPersistentHistoryChangeRequest transactionIDs](self, "transactionIDs");
      v6 = objc_msgSend(a3, "transactionIDs");
      if (v10 == (id)v6
        || (v11 = v6, LOBYTE(v6) = 0, v10) && v11 && (LODWORD(v6) = objc_msgSend(v10, "isEqual:"), (_DWORD)v6))
      {
        if (((*((_DWORD *)a3 + 12) ^ *(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags) & 0xF) == 0)
        {
          v12 = -[NSPersistentHistoryChangeRequest resultType](self, "resultType");
          if (v12 == objc_msgSend(a3, "resultType"))
          {
            v13 = -[NSPersistentHistoryChangeRequest percentageOfDB](self, "percentageOfDB");
            if (v13 == objc_msgSend(a3, "percentageOfDB"))
            {
              v14 = -[NSPersistentHistoryChangeRequest date](self, "date");
              v6 = objc_msgSend(a3, "date");
              if (v14 != (id)v6)
              {
                v15 = v6;
                LOBYTE(v6) = 0;
                if (!v14)
                  return v6;
                if (!v15)
                  return v6;
                LODWORD(v6) = objc_msgSend(v14, "isEqual:");
                if (!(_DWORD)v6)
                  return v6;
              }
              v16 = -[NSPersistentHistoryChangeRequest fetchLimit](self, "fetchLimit");
              if (v16 == objc_msgSend(a3, "fetchLimit"))
              {
                v17 = -[NSPersistentHistoryChangeRequest fetchOffset](self, "fetchOffset");
                if (v17 == objc_msgSend(a3, "fetchOffset"))
                {
                  v18 = -[NSPersistentHistoryChangeRequest fetchBatchSize](self, "fetchBatchSize");
                  if (v18 == objc_msgSend(a3, "fetchBatchSize"))
                  {
                    v19 = -[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest");
                    v6 = objc_msgSend(a3, "fetchRequest");
                    if (v19 != (NSFetchRequest *)v6)
                    {
                      v20 = v6;
                      LOBYTE(v6) = 0;
                      if (v19 && v20)
                        LOBYTE(v6) = -[NSFetchRequest isEqual:](v19, "isEqual:");
                      return v6;
                    }
LABEL_31:
                    LOBYTE(v6) = 1;
                    return v6;
                  }
                }
              }
            }
          }
        }
        goto LABEL_30;
      }
    }
  }
  return v6;
}

- (id)transactionIDs
{
  return self->_transactionIDs;
}

- (id)propertiesToFetchForEntity:(id)a3
{
  return -[NSPersistentHistoryChangeRequest propertiesToFetchForEntity:includeTransactionStrings:](self, "propertiesToFetchForEntity:includeTransactionStrings:", a3, 1);
}

- (BOOL)useQueryGenerationToken
{
  return *(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 1;
}

- (void)setUseQueryGenerationToken:(BOOL)a3
{
  self->_persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(*(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 0xFFFFFFFE | a3);
}

- (void)setFetchOffset:(unint64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  if (v5)
  {
    if (objc_msgSend(v5, "unsignedIntegerValue") == a3)
      return;
    v6 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  }
  else
  {
    v6 = 0;
  }

  *((_QWORD *)self->_additionalPrivateIvars + 4) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
}

- (BOOL)includesSubentities
{
  return 0;
}

- (NSFetchRequest)fetchRequestDescribingTokenCheckForStore:(NSFetchRequest *)a1
{
  NSFetchRequest *v2;
  void *v4;

  v2 = a1;
  if (a1)
  {
    if (-[NSFetchRequest token](a1, "token")
      && (v4 = (void *)objc_msgSend((id)-[NSArray storeTokens](v2->_groupByProperties, "storeTokens"), "valueForKey:", objc_msgSend(a2, "identifier")), objc_msgSend(v4, "longLongValue") >= 1))
    {
      v2 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), CFSTR("TRANSACTION")));
      -[NSFetchRequest setIncludesSubentities:](v2, "setIncludesSubentities:", 0);
      -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("_pk = %@"), v4));
      -[NSFetchRequest setResultType:](v2, "setResultType:", 4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (id)description
{
  const __CFString *v2;

  if ((*(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 2) != 0)
    v2 = CFSTR("Delete");
  else
    v2 = CFSTR("Fetch");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSPersistentHistoryChangeRequest : %@ < %@ - %@-%@> %@"), v2, *self->_additionalPrivateIvars, self->_token, self->_transactionNumber, +[NSPersistentHistoryChangeRequest _stringForHistoryRequestResultType:](NSPersistentHistoryChangeRequest, "_stringForHistoryRequestResultType:", self->_resultType));
}

- (id)debugDescription
{
  void *v3;
  const __CFString *v4;
  id v5;
  NSPersistentHistoryToken *token;
  NSNumber *transactionNumber;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  NSFetchRequest *v12;
  const __CFString *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if ((*(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 2) != 0)
    v4 = CFSTR("Delete");
  else
    v4 = CFSTR("Fetch");
  v5 = *self->_additionalPrivateIvars;
  token = self->_token;
  transactionNumber = self->_transactionNumber;
  v8 = -[NSPersistentHistoryChangeRequest fetchLimit](self, "fetchLimit");
  v9 = -[NSPersistentHistoryChangeRequest fetchOffset](self, "fetchOffset");
  v10 = -[NSPersistentHistoryChangeRequest fetchBatchSize](self, "fetchBatchSize");
  v11 = +[NSPersistentHistoryChangeRequest _stringForHistoryRequestResultType:](NSPersistentHistoryChangeRequest, "_stringForHistoryRequestResultType:", self->_resultType);
  v12 = -[NSPersistentHistoryChangeRequest fetchRequest](self, "fetchRequest");
  v13 = CFSTR("nil");
  if (v12)
    v13 = (const __CFString *)v12;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("NSPersistentHistoryChangeRequest : %@ <Date-%@ Token-%@ TransactionID-%@> limit - %lu offset - %lu batchSize - %lu, resultType - %@, fetchRequest - %@"), v4, v5, token, transactionNumber, v8, v9, v10, v11, v13);
}

+ (id)_stringForHistoryRequestResultType:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 7)
    return off_1E1EDD290[a3];
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown fetch request result type: %ld");
  _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
  v12 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Unknown fetch request result type: %ld", buf, 0xCu);
  }
  return 0;
}

@end
