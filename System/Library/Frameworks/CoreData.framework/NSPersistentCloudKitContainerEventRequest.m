@implementation NSPersistentCloudKitContainerEventRequest

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterDate:(NSDate *)date
{
  NSFetchRequest *v5;
  void *v6;

  v5 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"));
  -[NSFetchRequest setPredicate:](v5, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startedAt > %@"), date));
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKEventFetchRequest:", v5);

  return (NSPersistentCloudKitContainerEventRequest *)v6;
}

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterEvent:(NSPersistentCloudKitContainerEvent *)event
{
  NSFetchRequest *v5;
  void *v6;

  v5 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"));
  if (event)
    -[NSFetchRequest setPredicate:](v5, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF > %@"), event->_ckEventObjectID));
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKEventFetchRequest:", v5);

  return (NSPersistentCloudKitContainerEventRequest *)v6;
}

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsMatchingFetchRequest:(NSFetchRequest *)fetchRequest
{
  unint64_t v5;
  NSString *v6;
  objc_class *v7;
  NSFetchRequest *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  objc_class *v24;
  NSString *v25;
  NSString *v26;
  objc_class *v27;
  uint64_t v28;
  int v29;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v38;
  objc_class *v39;
  NSString *v40;
  objc_class *v41;
  objc_class *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSString *v56;
  uint64_t v57;
  objc_class *v58;
  NSFetchRequest *v59;
  NSFetchRequest *v60;
  void *v61;
  NSArray *obj;
  uint8_t buf[16];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = 0x1E1EDA000uLL;
  objc_opt_self();
  v68 = 0;
  v6 = -[NSFetchRequest entityName](fetchRequest, "entityName");
  v7 = (objc_class *)objc_opt_class();
  if (!-[NSString isEqualToString:](v6, "isEqualToString:", NSStringFromClass(v7)))
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    -[NSFetchRequest entityName](fetchRequest, "entityName");
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    NSStringFromSelector(sel_fetchRequest);
    v54 = (uint64_t)v40;
    v68 = objc_msgSend(v38, "stringWithFormat:", CFSTR("Fetch requests for '%@' must use '%@' as the entity name, '%@' is not valid. Please consider using +[%@ %@]."));
    if (!v68)
      goto LABEL_28;
    v60 = 0;
    goto LABEL_32;
  }
  v8 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"));
  -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", -[NSFetchRequest affectedStores](fetchRequest, "affectedStores"));
  v60 = v8;
  if ((-[NSFetchRequest resultType](fetchRequest, "resultType") | 4) == 4)
  {
    -[NSFetchRequest setResultType:](v8, "setResultType:", -[NSFetchRequest resultType](fetchRequest, "resultType"));
    goto LABEL_5;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  +[NSFetchRequest _stringForFetchRequestResultType:](NSFetchRequest, "_stringForFetchRequestResultType:", 0);
  +[NSFetchRequest _stringForFetchRequestResultType:](NSFetchRequest, "_stringForFetchRequestResultType:", 4);
  v5 = 0x1E1EDA000uLL;
  v54 = (uint64_t)v11;
  v68 = objc_msgSend(v9, "stringWithFormat:", CFSTR("'%@' only supports fetch requests with the following result types: %@, %@"));
  if (v68)
  {
LABEL_32:

    v51 = (void *)MEMORY[0x1E0C99DA0];
    v52 = *MEMORY[0x1E0C99778];
    v53 = v68;
    goto LABEL_33;
  }
LABEL_5:
  v58 = (objc_class *)a1;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](-[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors"), "count"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v59 = fetchRequest;
  obj = -[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors");
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v65;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v65 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v19 = +[NSPersistentCloudKitContainerEventRequest ckEventKeyForKey:](*(_QWORD *)(v5 + 3096), (void *)objc_msgSend(v18, "key"));
        if (v19)
        {
          objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v19, objc_msgSend(v18, "ascending")));
        }
        else
        {
          v20 = v14;
          if (objc_msgSend((id)objc_msgSend(v18, "key"), "isEqualToString:", CFSTR("storeIdentifier")))
          {
            v61 = (void *)MEMORY[0x1E0CB3940];
            v21 = objc_msgSend(v18, "key");
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            v26 = NSStringFromSelector(sel_affectedStores);
            v27 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v27);
            v5 = 0x1E1EDA000;
            v28 = objc_msgSend(v61, "stringWithFormat:", CFSTR("Cannot sort events by '%@', it is not a persisted property of '%@'. Use '%@.%@' or '%@.%@' instead."), v21, v23, v25, v26, v56, NSStringFromSelector(sel_affectedStores));
          }
          else
          {
            v29 = objc_msgSend((id)objc_msgSend(v18, "key"), "isEqualToString:", CFSTR("error"));
            v30 = (void *)MEMORY[0x1E0CB3940];
            v31 = objc_msgSend(v18, "key");
            v32 = (objc_class *)objc_opt_class();
            v33 = NSStringFromClass(v32);
            if (!v29)
            {
              v54 = v31;
              v15 = objc_msgSend(v30, "stringWithFormat:", CFSTR("Cannot sort events by '%@', it is not an attribute of '%@'."));
              v68 = v15;
              goto LABEL_22;
            }
            v34 = NSStringFromSelector(sel_domain);
          }
          v15 = v28;
          v68 = v28;
          v14 = v20;
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_22:
  -[NSFetchRequest setSortDescriptors:](v60, "setSortDescriptors:", v12);

  if (v15)
    goto LABEL_32;
  if (-[NSFetchRequest predicate](v59, "predicate"))
  {
    v35 = (void *)+[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:]((uint64_t)NSPersistentCloudKitContainerEventRequest, -[NSFetchRequest predicate](v59, "predicate"), &v68);
    -[NSFetchRequest setPredicate:](v60, "setPredicate:", v35);

    if (v68)
      goto LABEL_32;
  }
  if (!v60)
  {
LABEL_28:
    v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetch request validation for NSPersistentCloudKitContainerEventRequest failed but did not report a failure reason.");
    _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, v54);
    v50 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v50, OS_LOG_TYPE_FAULT, "CoreData: Fetch request validation for NSPersistentCloudKitContainerEventRequest failed but did not report a failure reason.", buf, 2u);
    }
    v51 = (void *)MEMORY[0x1E0C99DA0];
    v52 = *MEMORY[0x1E0C99778];
    v53 = 0;
LABEL_33:
    objc_exception_throw((id)objc_msgSend(v51, "exceptionWithName:reason:userInfo:", v52, v53, 0));
  }
  v36 = (void *)objc_msgSend([v58 alloc], "initWithCKEventFetchRequest:", v60);

  return (NSPersistentCloudKitContainerEventRequest *)v36;
}

+ (NSFetchRequest)fetchRequestForEvents
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", NSStringFromClass(v2));
}

- (NSPersistentCloudKitContainerEventRequest)initWithCKEventFetchRequest:(id)a3
{
  NSPersistentCloudKitContainerEventRequest *v4;
  NSPersistentCloudKitContainerEventRequest *v5;
  NSFetchRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSPersistentCloudKitContainerEventRequest;
  v4 = -[NSPersistentCloudKitContainerEventRequest init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_resultType = 0;
    v6 = (NSFetchRequest *)a3;
    v5->_ckEventFetchRequest = v6;
    if (-[NSArray count](-[NSFetchRequest affectedStores](v6, "affectedStores"), "count"))
      -[NSPersistentStoreRequest setAffectedStores:](v5, "setAffectedStores:", -[NSFetchRequest affectedStores](v5->_ckEventFetchRequest, "affectedStores"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEventRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)requestType
{
  return 11;
}

+ (const)ckEventKeyForKey:(uint64_t)a1
{
  objc_opt_self();
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("identifier")) & 1) != 0)
    return CFSTR("eventIdentifier");
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("type")) & 1) != 0)
    return CFSTR("cloudKitEventType");
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("startDate")) & 1) != 0)
    return CFSTR("startedAt");
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("endDate")) & 1) != 0)
    return CFSTR("endedAt");
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("succeeded")) & 1) == 0)
  {
    if ((objc_msgSend(a2, "isEqualToString:", CFSTR("error.domain")) & 1) != 0)
    {
      return CFSTR("errorDomain");
    }
    else if (objc_msgSend(a2, "isEqualToString:", CFSTR("error.code")))
    {
      return CFSTR("errorCode");
    }
    else
    {
      return 0;
    }
  }
  return (const __CFString *)a2;
}

+ (uint64_t)translatePredicate:(uint64_t *)a3 orReturnFailureReason:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a2, "subpredicates"), "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = (void *)objc_msgSend(a2, "subpredicates");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (!v7)
    {
LABEL_10:
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(a2, "compoundPredicateType"), v5);
      goto LABEL_20;
    }
    v8 = v7;
    v9 = *(_QWORD *)v32;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(v6);
      v11 = +[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:](NSPersistentCloudKitContainerEventRequest, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10), a3);
      if (!v11)
        goto LABEL_19;
      v12 = (void *)v11;
      objc_msgSend(v5, "addObject:", v11);

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v8)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = (objc_class *)objc_opt_class();
    v16 = objc_msgSend(v17, "stringWithFormat:", CFSTR("'%@' does not support predicates of type '%@'."), v19, NSStringFromClass(v20));
    goto LABEL_15;
  }
  if (objc_msgSend(a2, "predicateOperatorType") == 11)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    v16 = objc_msgSend(v14, "stringWithFormat:", CFSTR("'%@' does not support predicates with custom selectors: %@"), NSStringFromClass(v15), a2);
LABEL_15:
    v13 = 0;
    *a3 = v16;
    return v13;
  }
  v5 = +[NSPersistentCloudKitContainerEventRequest translateExpression:orReturnFailureReason:]((uint64_t)NSPersistentCloudKitContainerEventRequest, (void *)objc_msgSend(a2, "leftExpression"), a3);
  if (!v5)
  {
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v21 = +[NSPersistentCloudKitContainerEventRequest translateExpression:orReturnFailureReason:]((uint64_t)NSPersistentCloudKitContainerEventRequest, (void *)objc_msgSend(a2, "rightExpression"), a3);
  if (v21)
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v21, objc_msgSend(a2, "comparisonPredicateModifier"), objc_msgSend(a2, "predicateOperatorType"), objc_msgSend(a2, "options"));
  else
    v13 = 0;

LABEL_20:
  if (!((unint64_t)a3 | v13))
  {
    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPersistentCloudKitContainerEventRequest predicate translation failed but did not return a failure reason: %@");
    _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)a2);
    v29 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = a2;
      _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainerEventRequest predicate translation failed but did not return a failure reason: %@", buf, 0xCu);
    }
    return 0;
  }
  return v13;
}

+ (id)translateExpression:(uint64_t *)a3 orReturnFailureReason:
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  objc_class *v11;
  NSString *v12;
  objc_class *v13;
  NSString *v14;
  NSString *v15;
  objc_class *v16;
  NSString *v17;
  uint64_t v18;
  int v19;
  void *v20;
  objc_class *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  objc_opt_self();
  if (objc_msgSend(a2, "expressionType") == 3)
  {
    v4 = (void *)objc_msgSend(a2, "keyPath");
    v5 = +[NSPersistentCloudKitContainerEventRequest ckEventKeyForKey:]((uint64_t)NSPersistentCloudKitContainerEventRequest, v4);
    if (v5)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v5);
      return v6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("storeIdentifier")))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(sel_affectedStores);
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = objc_msgSend(v10, "stringWithFormat:", CFSTR("Cannot query events by '%@', it is not a persisted property of '%@'. Use '%@.%@' or '%@.%@' instead."), v4, v12, v14, v15, v17, NSStringFromSelector(sel_affectedStores));
    }
    else
    {
      v19 = objc_msgSend(v4, "isEqualToString:", CFSTR("error"));
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = v22;
      if (v19)
      {
        v24 = NSStringFromSelector(sel_domain);
      }
      else
      {
        v18 = objc_msgSend(v20, "stringWithFormat:", CFSTR("Cannot query events by '%@', it is not an attribute of '%@'."), v4, v22, v25, v26, v27, v28);
      }
    }
    v8 = 0;
    *a3 = v18;
  }
  else
  {
    if (objc_msgSend(a2, "expressionType") != 13)
    {
      v6 = a2;
      return v6;
    }
    v7 = (void *)+[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:](NSPersistentCloudKitContainerEventRequest, objc_msgSend(a2, "predicate"), a3);
    if (v7)
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3948]), "initWithExpression:usingIteratorExpression:predicate:", objc_msgSend(a2, "collection"), objc_msgSend(a2, "variableExpression"), v7);
    else
      v8 = 0;

  }
  return (id)v8;
}

- (NSPersistentCloudKitContainerEventResultType)resultType
{
  return self->_resultType;
}

- (void)setResultType:(NSPersistentCloudKitContainerEventResultType)resultType
{
  self->_resultType = resultType;
}

@end
