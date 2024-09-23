@implementation _BRCOperation

- (NSUUID)operationID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_operationUUID);
}

- (_BRCOperation)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UNIMPLEMENTED"), &stru_1E8769030);

  return 0;
}

- (_BRCOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BRCOperation *v14;
  _BRCOperation *v15;
  uint64_t v16;
  NSDate *startDate;
  id v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *callbackQueue;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *internalQueue;
  void *v30;
  uint64_t v31;
  NSHashTable *subOperations;
  uint64_t v33;
  NSMutableArray *associatedEventMetrics;
  NSObject *group;
  void *v36;
  NSObject *v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  NSString *personaID;
  void *v42;
  double v43;
  id v45;
  id v46;
  __int128 v47;
  uint64_t v48;
  objc_super v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  _BRCOperation *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v49.receiver = self;
  v49.super_class = (Class)_BRCOperation;
  v14 = -[_BRCOperation init](&v49, sel_init);
  v15 = v14;
  if (v14)
  {
    v45 = v13;
    v46 = v12;
    -[_BRCOperation setName:](v14, "setName:", v10);
    uuid_generate_random(v15->_operationUUID);
    objc_storeStrong((id *)&v15->_sessionContext, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    v18 = objc_retainAutorelease(v10);
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v20);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v21, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v19, v22);

    callbackQueue = v15->_callbackQueue;
    v15->_callbackQueue = (OS_dispatch_queue *)v23;

    v25 = (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v26, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v25, v27);

    internalQueue = v15->_internalQueue;
    v15->_internalQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v15->_group, a6);
    objc_storeStrong((id *)&v15->_syncContext, a4);
    objc_msgSend(v11, "session");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_operationFailureThrottle = (BRCThrottle *)(id)objc_msgSend(v30, "operationFailureThrottle");

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v31 = objc_claimAutoreleasedReturnValue();
    subOperations = v15->_subOperations;
    v15->_subOperations = (NSHashTable *)v31;

    v33 = objc_opt_new();
    associatedEventMetrics = v15->_associatedEventMetrics;
    v15->_associatedEventMetrics = (NSMutableArray *)v33;

    group = v15->_group;
    if (group)
      dispatch_group_enter(group);
    -[_BRCOperation setQualityOfService:](v15, "setQualityOfService:", 17);
    v47 = 0uLL;
    v48 = 0;
    __brc_create_section(0, (uint64_t)"-[_BRCOperation initWithName:syncContext:sessionContext:group:]", 149, &v47);
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v51 = v47;
      v52 = 2112;
      v53 = v15;
      v54 = 2112;
      v55 = v36;
      _os_log_debug_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx creating operation %@%@", buf, 0x20u);
    }

    v38 = v47;
    *(_QWORD *)&v15->_logSections.line = v48;
    *(_OWORD *)&v15->_logSections.sectionID = v38;
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "br_currentPersonaID");
    v40 = objc_claimAutoreleasedReturnValue();
    personaID = v15->_personaID;
    v15->_personaID = (NSString *)v40;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "operationTimeout");
    v15->_timeout = v43;

    v15->_maxBackoff = 1.79769313e308;
    v13 = v45;
    v12 = v46;
  }

  return v15;
}

- (_BRCOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5
{
  return -[_BRCOperation initWithName:syncContext:sessionContext:group:](self, "initWithName:syncContext:sessionContext:group:", a3, a4, a5, 0);
}

- (_BRCOperation)initWithName:(id)a3
{
  return -[_BRCOperation initWithName:syncContext:sessionContext:group:](self, "initWithName:syncContext:sessionContext:group:", a3, 0, 0, 0);
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "BRCOperation/? (subclass activity missing)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)setGroup:(id)a3
{
  CKOperationGroup *v4;
  void *v5;
  NSObject *v6;
  CKOperationGroup *operationGroup;
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 logSections;
  uint8_t buf[4];
  unint64_t sectionID;
  __int16 v11;
  CKOperationGroup *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (CKOperationGroup *)a3;
  logSections = self->_logSections;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    sectionID = logSections.sectionID;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx now using group: %@%@", buf, 0x20u);
  }

  operationGroup = self->_operationGroup;
  self->_operationGroup = v4;

  __brc_leave_section((uint64_t *)&logSections);
}

- (void)dealloc
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 134218242;
  v4 = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v2, (uint64_t)v2, "[DEBUG] ┳%llx dealloc%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (BOOL)usesBackgroundSession
{
  return -[_BRCOperation qualityOfService](self, "qualityOfService") < 18;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)stateWithContext:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;

  v4 = a3;
  if (-[_BRCOperation isCancelled](self, "isCancelled"))
  {
    v5 = CFSTR("cancelled");
  }
  else if (-[_BRCOperation isExecuting](self, "isExecuting"))
  {
    v5 = CFSTR("executing");
  }
  else if (-[_BRCOperation isFinished](self, "isFinished"))
  {
    v5 = CFSTR("finished");
  }
  else
  {
    v5 = CFSTR("idle");
  }
  +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v5, 7, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  return 0;
}

- (double)executionTimeInSec
{
  NSDate *finishDate;
  NSDate *v4;
  NSDate *v5;
  double v6;
  double v7;

  finishDate = self->_finishDate;
  if (finishDate)
  {
    v4 = finishDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[NSDate timeIntervalSinceDate:](v4, "timeIntervalSinceDate:", self->_startDate);
  v7 = v6;

  return v7;
}

- (id)lastErrorDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSError domain](self->_lastError, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%ld"), v4, -[NSError code](self->_lastError, "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BRCOperation *v8;
  void *v9;
  NSDate *finishDate;
  void *v11;
  NSDate *nextTryDate;
  void *v13;
  double v14;
  void *v15;
  NSError *lastError;
  void *v17;
  NSDate *lastTryDate;
  void *v19;
  void *v20;
  void *v21;
  NSHashTable *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSDate *v36;
  NSHashTable *obj;
  NSDate *v38;
  void *v39;
  _BRCOperation *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  +[BRCDumpContext nowDateFromContext:](BRCDumpContext, "nowDateFromContext:");
  v38 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
  +[BRCDumpContext stringFromOperationUUID:context:](BRCDumpContext, "stringFromOperationUUID:context:", self->_operationUUID, v41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%p %@ %@"), self, v5, v6);

  v8 = self;
  objc_sync_enter(v8);
  v40 = v8;
  -[_BRCOperation subclassableDescriptionWithContext:](v8, "subclassableDescriptionWithContext:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "length"))
  {
    objc_msgSend(v7, "appendString:", CFSTR(" "));
    objc_msgSend(v7, "appendString:", v39);
  }
  -[_BRCOperation stateWithContext:](v8, "stateWithContext:", v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR(" %@"), v9);

  finishDate = v8->_finishDate;
  if (!finishDate)
    finishDate = v38;
  v36 = finishDate;
  -[NSDate timeIntervalSinceDate:](v36, "timeIntervalSinceDate:", v8->_startDate);
  +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR(" duration:%@"), v11);

  if (!-[_BRCOperation usesBackgroundSession](v8, "usesBackgroundSession"))
    objc_msgSend(v7, "appendString:", CFSTR(" (bypassing system scheduling)"));
  nextTryDate = v8->_nextTryDate;
  if (nextTryDate)
  {
    +[BRCDumpContext stringFromDueDate:allowsPast:context:](BRCDumpContext, "stringFromDueDate:allowsPast:context:", nextTryDate, 0, v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" next-try:%@"), v13);

    -[NSDate timeIntervalSinceDate:](v8->_nextTryDate, "timeIntervalSinceDate:", v38);
    if (v14 < 0.0)
    {
      +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v41, -v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(" next-try:%@ ago"), v15);

    }
  }
  lastError = v8->_lastError;
  if (lastError)
  {
    +[BRCDumpContext stringFromError:context:](BRCDumpContext, "stringFromError:context:", lastError, v41);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" last-error:%@"), v17);

  }
  lastTryDate = v8->_lastTryDate;
  if (lastTryDate)
  {
    +[BRCDumpContext stringFromDueDate:allowsPast:context:](BRCDumpContext, "stringFromDueDate:allowsPast:context:", lastTryDate, 1, v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" last-try:%@"), v19);

  }
  -[_BRCOperation dependencies](v8, "dependencies");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  obj = v8->_subOperations;
  objc_sync_enter(obj);
  if (-[NSHashTable count](v8->_subOperations, "count"))
  {
    objc_msgSend(v7, "appendString:", CFSTR(" sub {\n"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v22 = v8->_subOperations;
    v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v21, "removeObject:", v26);
          objc_msgSend(v26, "lightweightDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v27, 2, v41);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("    %@,\n"), v28);

        }
        v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v23);
    }

    objc_msgSend(v7, "appendString:", CFSTR("}"));
  }
  objc_sync_exit(obj);

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v7, "appendString:", CFSTR(" dep {\n"));
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = v21;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "lightweightDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v33, 2, v41);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("    %@,\n"), v34);

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v30);
    }

    objc_msgSend(v7, "appendString:", CFSTR("}"));
  }

  objc_sync_exit(v40);
  return v7;
}

- (id)description
{
  return -[_BRCOperation descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (NSError)error
{
  void *v4;
  NSObject *v5;

  if (!-[_BRCOperation isFinished](self, "isFinished"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_BRCOperation error].cold.1();

  }
  return self->_lastError;
}

- (void)setFinished:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (self->_finished != v3)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_storeStrong((id *)&self->_finishDate, v5);
    if (v3)

    -[_BRCOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = v3;
    -[_BRCOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (BOOL)isExecuting
{
  return self->_executionTransaction != 0;
}

- (void)setExecuting:(BOOL)a3
{
  _BOOL4 v3;
  OS_os_transaction *v5;
  OS_os_transaction *executionTransaction;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if ((((self->_executionTransaction == 0) ^ v3) & 1) == 0)
  {
    -[_BRCOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    if (v3)
      v5 = (OS_os_transaction *)os_transaction_create();
    else
      v5 = 0;
    executionTransaction = self->_executionTransaction;
    self->_executionTransaction = v5;

    -[_BRCOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (BOOL)_finishIfCancelled
{
  int v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (-[_BRCOperation isFinished](self, "isFinished"))
    goto LABEL_4;
  v3 = -[_BRCOperation isCancelled](self, "isCancelled");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 20, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1D17A6BE8]();
    -[_BRCOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v4);
    objc_autoreleasePoolPop(v5);

LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)finishIfCancelled
{
  int v3;
  OS_dispatch_queue *callbackQueue;
  _QWORD v6[5];

  v3 = -[_BRCOperation isCancelled](self, "isCancelled");
  if (v3)
  {
    callbackQueue = self->_callbackQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34___BRCOperation_finishIfCancelled__block_invoke;
    v6[3] = &unk_1E875D500;
    v6[4] = self;
    dispatch_async_with_logs(callbackQueue, v6);
  }
  return v3;
}

- (void)main
{
  void *v3;
  void (**v4)(id, _BRCOperation *);
  objc_super v5;

  -[_BRCOperation mainBlock](self, "mainBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_BRCOperation mainBlock](self, "mainBlock");
    v4 = (void (**)(id, _BRCOperation *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_BRCOperation;
    -[_BRCOperation main](&v5, sel_main);
  }
}

- (void)_main
{
  OS_dispatch_queue *internalQueue;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  -[_BRCOperation setExecuting:](self, "setExecuting:", 1);
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22___BRCOperation__main__block_invoke;
  v4[3] = &unk_1E875D500;
  v4[4] = self;
  dispatch_async_with_logs(internalQueue, v4);
}

- (void)_executeWithPreviousError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSHashTable *v9;
  void *v10;
  void *v11;
  NSObject *retryTimer;
  OS_dispatch_source *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (!-[_BRCOperation _finishIfCancelled](self, "_finishIfCancelled"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_BRCOperation dependencies](self, "dependencies", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          -[_BRCOperation removeDependency:](self, "removeDependency:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v9 = self->_subOperations;
    objc_sync_enter(v9);
    -[NSHashTable removeAllObjects](self->_subOperations, "removeAllObjects");
    objc_sync_exit(v9);

    -[_BRCOperation operationThrottle](self, "operationThrottle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incrementRetryCount:", self->_throttleHash);

    if (v4)
    {
      -[_BRCOperation operationFailureThrottle](self, "operationFailureThrottle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "incrementRetryCount:", self->_throttleHash);

    }
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      dispatch_source_cancel(retryTimer);
      v13 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    -[_BRCOperation _main](self, "_main");
  }

}

- (void)_scheduleExecutionWithPreviousError:(id)a3
{
  id v4;
  _BRCOperation *v5;
  uint64_t v6;
  NSDate *lastTryDate;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  int64_t v27;
  void *v28;
  NSObject *v29;
  _BRCOperation *v30;
  uint64_t v31;
  NSDate *nextTryDate;
  void *v33;
  NSObject *v34;
  _BRCOperation *v35;
  uint64_t v36;
  NSDate *v37;
  NSObject *v38;
  dispatch_source_t v39;
  OS_dispatch_source *retryTimer;
  dispatch_time_t v41;
  uint64_t v42;
  OS_dispatch_source *v43;
  NSObject *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  dispatch_block_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  int64_t throttleHash;
  _QWORD v55[5];
  id v56;
  uint8_t buf[4];
  double v58;
  __int16 v59;
  int64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  -[_BRCOperation setExecuting:](self, "setExecuting:", 0);
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = objc_claimAutoreleasedReturnValue();
  lastTryDate = v5->_lastTryDate;
  v5->_lastTryDate = (NSDate *)v6;

  objc_sync_exit(v5);
  objc_msgSend(v4, "br_suggestedRetryTimeInterval");
  v9 = v8;
  if (!v5->_throttleHash)
  {
    -[_BRCOperation name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_throttleHash = +[BRCThrottle throttleHashFormat:](BRCThrottle, "throttleHashFormat:", CFSTR("%@%d"), v10, -[_BRCOperation nonDiscretionary](v5, "nonDiscretionary"));

  }
  -[_BRCOperation operationThrottle](v5, "operationThrottle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "nsecsToNextRetry:now:increment:", v5->_throttleHash, brc_current_date_nsec(), 0);
  -[_BRCOperation operationFailureThrottle](v5, "operationFailureThrottle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "nsecsToNextRetry:now:increment:", v5->_throttleHash, brc_current_date_nsec(), 0);
  if (v14 <= v12)
    v15 = v12;
  else
    v15 = v14;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    throttleHash = v5->_throttleHash;
    *(_DWORD *)buf = 134218498;
    v58 = (double)v15 / 1000000000.0;
    v59 = 2048;
    v60 = throttleHash;
    v61 = 2112;
    v62 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] throttle backoff: %03fs for hash:0x%016llx%@", buf, 0x20u);
  }

  v18 = !-[_BRCOperation nonDiscretionary](v5, "nonDiscretionary");
  if (!v4)
    LOBYTE(v18) = 1;
  if ((v18 & 1) != 0
    || (+[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = v15 > objc_msgSend(v19, "maxBackoffToRetryUserInitiated"),
        v19,
        !v20))
  {
    if (v9 <= 0.0)
    {
      v24 = 0;
    }
    else
    {
      if (v9 <= 9223372040.0)
        v24 = 1000000000 * (uint64_t)v9;
      else
        v24 = 0x7FFFFFFFFFFFFFFFLL;
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.5();

    }
    if (v24 <= v15)
      v27 = v15;
    else
      v27 = v24;
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.2();

      v30 = v5;
      objc_sync_enter(v30);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v31 = objc_claimAutoreleasedReturnValue();
      nextTryDate = v30->_nextTryDate;
      v30->_nextTryDate = (NSDate *)v31;

      objc_sync_exit(v30);
    }
    else if ((double)v27 / 1000000000.0 >= v5->_maxBackoff)
    {
      brc_bread_crumbs();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
        -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.4();

      v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v52 = (void *)objc_msgSend(v51, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D10B70], 23, 0);
      v53 = (void *)MEMORY[0x1D17A6BE8]();
      -[_BRCOperation finishWithResult:error:](v5, "finishWithResult:error:", 0, v52);
      objc_autoreleasePoolPop(v53);

    }
    else if (v27)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.3();

      v35 = v5;
      objc_sync_enter(v35);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v27 / 1000000000.0);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v35->_nextTryDate;
      v35->_nextTryDate = (NSDate *)v36;

      objc_sync_exit(v35);
      -[_BRCOperation callbackQueue](v35, "callbackQueue");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v38);
      retryTimer = v35->_retryTimer;
      v35->_retryTimer = (OS_dispatch_source *)v39;

      v41 = dispatch_time(0, v27);
      if (v27 >= 0)
        v42 = v27;
      else
        v42 = v27 + 1;
      dispatch_source_set_timer((dispatch_source_t)v35->_retryTimer, v41, 0xFFFFFFFFFFFFFFFFLL, v42 >> 1);
      v43 = v35->_retryTimer;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __53___BRCOperation__scheduleExecutionWithPreviousError___block_invoke;
      v55[3] = &unk_1E875D470;
      v55[4] = v35;
      v56 = v4;
      v44 = v43;
      v45 = v55;
      v46 = v45;
      v47 = v45;
      if (*MEMORY[0x1E0D11070])
      {
        ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v47);
      dispatch_source_set_event_handler(v44, v48);

      dispatch_resume((dispatch_object_t)v35->_retryTimer);
    }
    else
    {
      -[_BRCOperation _executeWithPreviousError:](v5, "_executeWithPreviousError:", v4);
    }
  }
  else
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      -[_BRCOperation _scheduleExecutionWithPreviousError:].cold.1();

    v23 = (void *)MEMORY[0x1D17A6BE8]();
    -[_BRCOperation finishWithResult:error:](v5, "finishWithResult:error:", 0, v4);
    objc_autoreleasePoolPop(v23);
  }

}

- (void)schedule
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: there should be a group created for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)start
{
  OS_os_activity *v3;
  OS_os_activity *Activity;
  void *v5;
  void *v6;
  NSObject *callbackQueue;
  _QWORD *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  os_activity_scope_state_s state;

  -[_BRCOperation createActivity](self, "createActivity");
  v3 = (OS_os_activity *)objc_claimAutoreleasedReturnValue();
  Activity = self->_Activity;
  self->_Activity = v3;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_Activity, &state);
  -[_BRCOperation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  -[_BRCOperation hash](self, "hash");
  kdebug_trace();

  dispatch_activate((dispatch_object_t)self->_callbackQueue);
  if (!-[_BRCOperation finishIfCancelled](self, "finishIfCancelled"))
  {
    -[_BRCOperation operationThrottle](self, "operationThrottle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      callbackQueue = self->_callbackQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __22___BRCOperation_start__block_invoke;
      v10[3] = &unk_1E875D500;
      v10[4] = self;
      v8 = v10;
    }
    else
    {
      -[_BRCOperation cancelAfterDelay:](self, "cancelAfterDelay:", self->_timeout);
      callbackQueue = self->_callbackQueue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __22___BRCOperation_start__block_invoke_77;
      v9[3] = &unk_1E875D500;
      v9[4] = self;
      v8 = v9;
    }
    dispatch_async(callbackQueue, v8);

  }
  os_activity_scope_leave(&state);
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _BRCOperation *v19;
  NSObject *callbackQueue;
  NSHashTable *obj;
  _QWORD block[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint64_t v32[3];
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  _BRCOperation *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[_BRCOperation cancel]", 616, v32);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v36 = v32[0];
    v37 = 2112;
    v38 = self;
    v39 = 2112;
    v40 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling %@%@", buf, 0x20u);
  }

  v31.receiver = self;
  v31.super_class = (Class)_BRCOperation;
  -[_BRCOperation cancel](&v31, sel_cancel);
  obj = self->_subOperations;
  objc_sync_enter(obj);
  -[_BRCOperation dependencies](self, "dependencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_subOperations;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "cancel");
        objc_msgSend(v6, "removeObject:", v11);
      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        -[_BRCOperation removeDependency:](self, "removeDependency:", v16);
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[_BRCOperation operationID](self, "operationID");
          v19 = (_BRCOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v36 = v16;
          v37 = 2112;
          v38 = v19;
          v39 = 2112;
          v40 = v17;
          _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Removed %@ as dependency of cancelled op %@%@", buf, 0x20u);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v13);
  }

  objc_sync_exit(obj);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23___BRCOperation_cancel__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  __brc_leave_section(v32);
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  if (-[_BRCOperation nonDiscretionary](self, "nonDiscretionary"))
    v5 = objc_msgSend(v4, "brc_isUserInitiatedRetriable");
  else
    v5 = objc_msgSend(v4, "brc_isRetriable");
  v6 = v5;

  return v6;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *group;
  OS_dispatch_group *v11;
  NSObject *timeoutTimer;
  OS_dispatch_source *v13;
  void (**finishBlock)(id, id, id);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSHashTable *v19;
  void *v20;
  id v21;
  id mainBlock;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27[3];
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  _BRCOperation *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[_BRCOperation finishWithResult:error:]", 661, v27);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v30 = v27[0];
    v31 = 2112;
    v32 = self;
    v33 = 2112;
    v34 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@%@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  group = self->_group;
  if (group)
  {
    dispatch_group_leave(group);
    v11 = self->_group;
    self->_group = 0;

  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    v13 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  finishBlock = (void (**)(id, id, id))self->_finishBlock;
  if (finishBlock)
    finishBlock[2](finishBlock, v6, v7);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_BRCOperation dependencies](self, "dependencies", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v15);
        -[_BRCOperation removeDependency:](self, "removeDependency:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }

  v19 = self->_subOperations;
  objc_sync_enter(v19);
  -[NSHashTable removeAllObjects](self->_subOperations, "removeAllObjects");
  objc_sync_exit(v19);

  -[_BRCOperation name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hash");
  -[_BRCOperation hash](self, "hash");
  kdebug_trace();

  -[_BRCOperation setExecuting:](self, "setExecuting:", 0);
  -[_BRCOperation setFinished:](self, "setFinished:", 1);
  v21 = self->_finishBlock;
  self->_finishBlock = 0;

  mainBlock = self->_mainBlock;
  self->_mainBlock = 0;

  __brc_leave_section(v27);
}

- (void)_completedWithResult:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  _BRCOperation *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 logSections;
  uint8_t buf[4];
  unint64_t sectionID;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  _BRCOperation *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  logSections = self->_logSections;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v20 = CFSTR("failed");
    *(_DWORD *)buf = 134219522;
    if (!v7)
      v20 = CFSTR("completed");
    sectionID = logSections.sectionID;
    v26 = 2112;
    v21 = &stru_1E8769030;
    v27 = &stru_1E8769030;
    v22 = CFSTR("\nwith error: ");
    if (!v7)
      v22 = &stru_1E8769030;
    v28 = 2112;
    if (v7)
      v21 = v7;
    v29 = v20;
    v30 = 2112;
    v31 = self;
    v32 = 2112;
    v33 = v22;
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@%@ %@%@%@%@", buf, 0x48u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (!-[_BRCOperation _finishIfCancelled](self, "_finishIfCancelled"))
  {
    v10 = self;
    objc_sync_enter(v10);
    objc_storeStrong((id *)&v10->_lastError, a4);
    objc_sync_exit(v10);

    if (!-[__CFString brc_isDenylistError](v7, "brc_isDenylistError"))
    {
      if (-[__CFString brc_isCloudKitAccountTemporarilyUnavailable](v7, "brc_isCloudKitAccountTemporarilyUnavailable"))
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[_BRCOperation _completedWithResult:error:].cold.1();

        -[BRCSyncContext session](v10->_syncContext, "session");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "invalidateAccountStatus");

      }
      if (v7)
      {
        if (-[_BRCOperation shouldRetryForError:](v10, "shouldRetryForError:", v7))
        {
          -[_BRCOperation _scheduleExecutionWithPreviousError:](v10, "_scheduleExecutionWithPreviousError:", v7);
          goto LABEL_17;
        }
        -[_BRCOperation operationFailureThrottle](v10, "operationFailureThrottle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (!v17)
        {
          -[_BRCOperation operationFailureThrottle](v10, "operationFailureThrottle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "incrementRetryCount:", v10->_throttleHash);

        }
      }
      v19 = (void *)MEMORY[0x1D17A6BE8]();
      -[_BRCOperation finishWithResult:error:](v10, "finishWithResult:error:", v6, v7);
      objc_autoreleasePoolPop(v19);
      goto LABEL_17;
    }
    brc_bread_crumbs();
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      sectionID = (unint64_t)v10;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] We are denylisted! Not notifying about finishing %@%@", buf, 0x16u);
    }

  }
LABEL_17:
  __brc_leave_section((uint64_t *)&logSections);

}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSString *v13;
  NSString *v14;
  int v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  void *v20;
  NSObject *callbackQueue;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSString *personaID;
  void *v32;
  NSObject *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD block[5];
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  NSString *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((BRCurrentPersonaMatchesID() & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_BRCOperation completedWithResult:error:].cold.4();

    if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
      || (v13 = self->_personaID) == 0)
    {
      if (completedWithResult_error____personaOnceToken != -1)
        dispatch_once(&completedWithResult_error____personaOnceToken, &__block_literal_global_2);
      v14 = (NSString *)(id)completedWithResult_error____personalPersona;
      v15 = 1;
    }
    else
    {
      v14 = v13;
      v15 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentPersona");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    objc_msgSend(v17, "userPersonaUniqueString");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 == v14 || -[NSString isEqualToString:](v18, "isEqualToString:", v14))
    {
      v20 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        v40 = 0;
        v24 = (void *)objc_msgSend(v17, "copyCurrentPersonaContextWithError:", &v40);
        v25 = v40;
        v26 = v41;
        v41 = v24;

        if (v25)
        {
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
            -[_BRCOperation completedWithResult:error:].cold.1();

        }
        objc_msgSend(v17, "generateAndRestorePersonaContextWithPersonaUniqueString:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_14;
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          personaID = self->_personaID;
          *(_DWORD *)buf = 138412802;
          v43 = personaID;
          v44 = 2112;
          v45 = v20;
          v46 = 2112;
          v47 = v29;
          _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (!v15 || (objc_msgSend(v17, "isDataSeparatedPersona") & 1) != 0)
        {
          brc_bread_crumbs();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.2();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[_BRCOperation completedWithResult:error:].cold.3();
        v20 = 0;
      }

    }
LABEL_14:
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43___BRCOperation_completedWithResult_error___block_invoke_91;
    block[3] = &unk_1E875D448;
    block[4] = self;
    v38 = v6;
    v39 = v7;
    v22 = v7;
    v23 = v6;
    dispatch_async(callbackQueue, block);

    _BRRestorePersona();
    goto LABEL_15;
  }
  v8 = self->_callbackQueue;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __43___BRCOperation_completedWithResult_error___block_invoke_2;
  v34[3] = &unk_1E875D448;
  v34[4] = self;
  v35 = v6;
  v36 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v34);

LABEL_15:
}

- (void)_setDeviceConfigurationHeaderOnCKOp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BRCDeviceConfiguration *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalRequestHTTPHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v12 = v8;

  v9 = objc_alloc_init(BRCDeviceConfiguration);
  -[BRCDeviceConfiguration getDeviceConfigurationString](v9, "getDeviceConfigurationString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("X-APPLE-BR-DEVICE-CONFIGURATION"));

  objc_msgSend(v3, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAdditionalRequestHTTPHeaders:", v12);
}

- (void)addSubOperation:(id)a3 overrideContext:(id)a4 allowsCellularAccess:(id)a5
{
  id v8;
  BRCSyncContext *v9;
  id v10;
  NSHashTable *v11;
  OS_dispatch_queue *internalQueue;
  id v13;
  id v14;
  BRCSyncContext *v15;
  _QWORD v16[4];
  BRCSyncContext *v17;
  id v18;
  _BRCOperation *v19;
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = (BRCSyncContext *)a4;
  v10 = a5;
  if (!v9)
    v9 = self->_syncContext;
  v21.receiver = self;
  v21.super_class = (Class)_BRCOperation;
  -[_BRCOperation addDependency:](&v21, sel_addDependency_, v8);
  v11 = self->_subOperations;
  objc_sync_enter(v11);
  -[NSHashTable addObject:](self->_subOperations, "addObject:", v8);
  objc_sync_exit(v11);

  objc_msgSend(v8, "setQualityOfService:", -[_BRCOperation qualityOfService](self, "qualityOfService"));
  objc_msgSend(v8, "setQueuePriority:", -[_BRCOperation queuePriority](self, "queuePriority"));
  internalQueue = self->_internalQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke;
  v16[3] = &unk_1E875DD30;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async_with_logs(internalQueue, v16);

}

- (void)addSubOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (!self->_syncContext)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_BRCOperation addSubOperation:].cold.1();

  }
  -[_BRCOperation addSubOperation:overrideContext:allowsCellularAccess:](self, "addSubOperation:overrideContext:allowsCellularAccess:", v4, 0, 0);

}

- (void)addDependency:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  _BRCOperation *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_BRCOperation nonDiscretionary](self, "nonDiscretionary"))
  {
    if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "nonDiscretionary") & 1) == 0)
      {
        brc_bread_crumbs();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v9 = v4;
          v10 = 2112;
          v11 = self;
          v12 = 2112;
          v13 = v5;
          _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Adding discretionary op %@ as a dependency of a non-discretionary op %@%@", buf, 0x20u);
        }

      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_BRCOperation;
  -[_BRCOperation addDependency:](&v7, sel_addDependency_, v4);

}

- (void)blockOnHighPriorityOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSHashTable *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  OS_dispatch_group *v13;
  OS_dispatch_group *highPriorityWaitGroup;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE location[12];
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[_BRCOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[_BRCOperation operationID](self, "operationID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "operationID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking %@ on high priority operation %@%@", location, 0x20u);

    }
    -[_BRCOperation addDependency:](self, "addDependency:", v4);
    v7 = self->_subOperations;
    objc_sync_enter(v7);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_subOperations;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "blockOnHighPriorityOperation:", v4);
          else
            objc_msgSend(v12, "addDependency:", v4);
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    if (!self->_highPriorityWaitGroup)
    {
      v13 = (OS_dispatch_group *)dispatch_group_create();
      highPriorityWaitGroup = self->_highPriorityWaitGroup;
      self->_highPriorityWaitGroup = v13;

    }
    objc_msgSend(v4, "completionBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter((dispatch_group_t)self->_highPriorityWaitGroup);
    objc_initWeak((id *)location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46___BRCOperation_blockOnHighPriorityOperation___block_invoke;
    v19[3] = &unk_1E875DD58;
    objc_copyWeak(&v21, (id *)location);
    v16 = v15;
    v20 = v16;
    objc_msgSend(v4, "setCompletionBlock:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);

    objc_sync_exit(v7);
  }

}

- (void)associateCKOperationsToEventMetric:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_associatedEventMetrics, "addObject:");
}

- (void)cancelAfterDelay:(double)a3
{
  _BRCOperation *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  dispatch_source_t v12;
  OS_dispatch_source *timeoutTimer;
  OS_dispatch_source *v14;
  OS_dispatch_source *v15;
  _QWORD *v16;
  NSObject *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  dispatch_block_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3 != 0.0)
  {
    v4 = self;
    objc_sync_enter(v4);
    if ((-[_BRCOperation isCancelled](v4, "isCancelled") & 1) == 0 && !v4->_timeoutTimer)
    {
      -[NSDate timeIntervalSinceNow](v4->_startDate, "timeIntervalSinceNow");
      v6 = (uint64_t)(v5 * 1000000000.0);
      v7 = (uint64_t)(a3 * 1000000000.0);
      v8 = v7 - v6;
      if (v7 <= v6)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          -[_BRCOperation description](v4, "description");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BRCOperation cancelAfterDelay:].cold.1(v24, (uint64_t)v22, (uint64_t)buf);
        }

        -[_BRCOperation cancel](v4, "cancel");
      }
      else
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          -[_BRCOperation description](v4, "description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v28 = v8 / 0x3B9ACA00;
          v29 = 2112;
          v30 = v25;
          v31 = 2112;
          v32 = v9;
          _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Launching timeout timer of %llu seconds for operation %@%@", buf, 0x20u);

        }
        v11 = dispatch_time(0, v8);
        v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
        timeoutTimer = v4->_timeoutTimer;
        v4->_timeoutTimer = (OS_dispatch_source *)v12;

        v14 = v4->_timeoutTimer;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __34___BRCOperation_cancelAfterDelay___block_invoke;
        v26[3] = &unk_1E875D500;
        v26[4] = v4;
        v15 = v14;
        v16 = v26;
        v17 = v15;
        v18 = v16;
        v19 = v18;
        v20 = v18;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v20);
        dispatch_source_set_event_handler(v17, v21);

        dispatch_source_set_timer((dispatch_source_t)v4->_timeoutTimer, v11, 0xFFFFFFFFFFFFFFFFLL, v7 / 10);
        dispatch_resume((dispatch_object_t)v4->_timeoutTimer);
      }
    }
    objc_sync_exit(v4);

  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BRCThrottle)operationThrottle
{
  return self->_operationThrottle;
}

- (void)setOperationThrottle:(id)a3
{
  self->_operationThrottle = (BRCThrottle *)a3;
}

- (BRCThrottle)operationFailureThrottle
{
  return self->_operationFailureThrottle;
}

- (void)setOperationFailureThrottle:(id)a3
{
  self->_operationFailureThrottle = (BRCThrottle *)a3;
}

- (id)mainBlock
{
  return self->_mainBlock;
}

- (void)setMainBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (id)finishBlock
{
  return self->_finishBlock;
}

- (void)setFinishBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- ($3E6A31346F70D3E0191F2ED888AF46F4)logSections
{
  *($3C52EB5FA2A5D3907B44D7DBAB114CA7 *)retstr = ($3C52EB5FA2A5D3907B44D7DBAB114CA7)self[20];
  return self;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)nextTryDate
{
  return self->_nextTryDate;
}

- (BRCSyncContext)syncContext
{
  return self->_syncContext;
}

- (CKOperationGroup)group
{
  return self->_operationGroup;
}

- (BOOL)nonDiscretionary
{
  return self->_nonDiscretionary;
}

- (void)setNonDiscretionary:(BOOL)a3
{
  self->_nonDiscretionary = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (OS_dispatch_group)highPriorityWaitGroup
{
  return self->_highPriorityWaitGroup;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)maxBackoff
{
  return self->_maxBackoff;
}

- (void)setMaxBackoff:(double)a3
{
  self->_maxBackoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong(&self->_mainBlock, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_associatedEventMetrics, 0);
  objc_storeStrong((id *)&self->_Activity, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_highPriorityWaitGroup, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_nextTryDate, 0);
  objc_storeStrong((id *)&self->_lastTryDate, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_executionTransaction, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_syncContext, 0);
}

- (void)error
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.finished%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleExecutionWithPreviousError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] throttle backoff is greater than max.  Failing the operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleExecutionWithPreviousError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] %@ has been denylisted and won't be attempted again%@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleExecutionWithPreviousError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v1, "[DEBUG] attempting execution again in %.03fs%@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleExecutionWithPreviousError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] cancelling operation since reached to maximal allowed backoff%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleExecutionWithPreviousError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v1, "[DEBUG] server provided backoff: %.03fs%@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_completedWithResult:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] CloudKit account is temporarily unavailable. Invalidating account status after %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)completedWithResult:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] won't restore persona: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)completedWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completedWithResult:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completedWithResult:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] Completed operation %@ with different persona than we started with%@");
  OUTLINED_FUNCTION_2();
}

- (void)addSubOperation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _syncContext%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelAfterDelay:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] Timeout already expired, cancelling operation %@%@", v5);

}

@end
