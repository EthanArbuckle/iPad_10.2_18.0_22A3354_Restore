@implementation AMSObservable

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[AMSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    -[AMSObservable logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v10;
    v56 = 2114;
    v57 = v12;
    v13 = "%{public}@: [%{public}@] Someone is attempting to add an observer to a completed AMSObservable.";
LABEL_11:
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEBUG, v13, buf, 0x16u);

LABEL_12:
    -[AMSObservable stateLock](self, "stateLock");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unlock");
    goto LABEL_35;
  }
  -[AMSObservable observers](self, "observers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v4);

  if (v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    v16 = (void *)objc_opt_class();
    v11 = v16;
    -[AMSObservable logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v16;
    v56 = 2114;
    v57 = v12;
    v13 = "%{public}@: [%{public}@] Someone is attempting to add an observer to a AMSObservable it's already observing.";
    goto LABEL_11;
  }
  -[AMSObservable observers](self, "observers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v4);

  -[AMSObservable queuedResults](self, "queuedResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  -[AMSObservable queuedResults](self, "queuedResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

  v39 = v4;
  if (objc_msgSend(v20, "count"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (void *)objc_opt_class();
      v25 = v24;
      -[AMSObservable logKey](self, "logKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v24;
      v56 = 2114;
      v57 = v26;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] There are pending results. Sending them now that we have an observer.", buf, 0x16u);

    }
    -[AMSObservable observers](self, "observers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v27, "copy");

  }
  else
  {
    v42 = 0;
  }
  -[AMSObservable stateLock](self, "stateLock");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unlock");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v17 = v20;
  v43 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v43)
  {
    obj = v17;
    v41 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v31 = v42;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v45 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              v37 = (void *)objc_msgSend(v30, "copy");
              -[AMSObservable sendMessageQueue](self, "sendMessageQueue");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "_sendResult:usingQueue:", v37, v38);

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v33);
        }

      }
      v17 = obj;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v43);
  }

  v4 = v39;
LABEL_35:

}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (NSMutableArray)queuedResults
{
  return self->_queuedResults;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (AMSObservable)init
{
  return -[AMSObservable initWithObserver:](self, "initWithObserver:", 0);
}

- (AMSObservable)initWithObserver:(id)a3 behavior:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  AMSObservable *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AMSObservable initWithObservers:behavior:](self, "initWithObservers:behavior:", v8, a4);

  }
  else
  {
    v9 = -[AMSObservable initWithObservers:behavior:](self, "initWithObservers:behavior:", 0, a4);
  }

  return v9;
}

- (AMSObservable)initWithObservers:(id)a3 behavior:(unint64_t)a4
{
  id v6;
  AMSObservable *v7;
  AMSObservable *v8;
  uint64_t v9;
  NSString *logKey;
  NSMutableArray *v11;
  NSMutableArray *observers;
  NSMutableArray *v13;
  NSMutableArray *queuedResults;
  dispatch_queue_t v15;
  OS_dispatch_queue *sendMessageQueue;
  uint64_t v17;
  NSConditionLock *stateLock;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSObservable;
  v7 = -[AMSObservable init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_behavior = a4;
    AMSGenerateLogCorrelationKey();
    v9 = objc_claimAutoreleasedReturnValue();
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v9;

    if (v6)
      v11 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    else
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v8->_observers;
    v8->_observers = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queuedResults = v8->_queuedResults;
    v8->_queuedResults = v13;

    v15 = dispatch_queue_create("coma.apple.AppleMediaServices.AMSObservable.sendMessage", MEMORY[0x1E0C80D50]);
    sendMessageQueue = v8->_sendMessageQueue;
    v8->_sendMessageQueue = (OS_dispatch_queue *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v8->_stateLock;
    v8->_stateLock = (NSConditionLock *)v17;

  }
  return v8;
}

- (AMSObservable)initWithObserver:(id)a3
{
  return -[AMSObservable initWithObserver:behavior:](self, "initWithObserver:behavior:", a3, 0);
}

- (AMSObservable)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  _AMSKeyValueObservable *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[_AMSKeyValueObservable initWithObject:keyPath:options:]([_AMSKeyValueObservable alloc], "initWithObject:keyPath:options:", v9, v8, a5);

  return &v10->super;
}

- (AMSObservable)initWithNotification:(id)a3 object:(id)a4
{
  id v6;
  id v7;
  _AMSNotificationObservable *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_AMSNotificationObservable initWithNotification:object:]([_AMSNotificationObservable alloc], "initWithNotification:object:", v7, v6);

  return &v8->super;
}

- (AMSObservable)initWithObservers:(id)a3
{
  return -[AMSObservable initWithObservers:behavior:](self, "initWithObservers:behavior:", a3, 0);
}

- (BOOL)isCancelled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[AMSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[AMSObservable _isComplete](self, "_isComplete"))
  {
    -[AMSObservable failureError](self, "failureError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ams_isUserCancelledError");

  }
  else
  {
    v5 = 0;
  }
  -[AMSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return v5;
}

- (BOOL)isComplete
{
  void *v3;
  void *v4;

  -[AMSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = -[AMSObservable _isComplete](self, "_isComplete");
  -[AMSObservable stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (BOOL)cancel
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AMSObservable sendFailure:](self, "sendFailure:", v3);

  return (char)self;
}

- (BOOL)sendCompletion
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[AMSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[AMSObservable stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "condition");

  if (v5 == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      -[AMSObservable logKey](self, "logKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to send a completion from a completed AMSObservable.", buf, 0x16u);

    }
    -[AMSObservable stateLock](self, "stateLock");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");
  }
  else
  {
    -[AMSObservable observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[AMSObservable stateLock](self, "stateLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlockWithCondition:", 1);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          -[AMSObservable sendMessageQueue](self, "sendMessageQueue", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_sendCompletionUsingQueue:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

  }
  return v5 != 1;
}

- (BOOL)sendFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[AMSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      -[AMSObservable logKey](self, "logKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      v31 = 2114;
      v32 = v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to send a failure from a completed AMSObservable.", buf, 0x16u);

    }
    -[AMSObservable stateLock](self, "stateLock");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlock");
  }
  else
  {
    -[AMSObservable setFailureError:](self, "setFailureError:", v4);
    -[AMSObservable observers](self, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    -[AMSObservable stateLock](self, "stateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlockWithCondition:", 1);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          -[AMSObservable sendMessageQueue](self, "sendMessageQueue", (_QWORD)v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_sendFailure:usingQueue:", v4, v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

  }
  return v7 != 1;
}

- (BOOL)sendResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id obj;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[AMSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[AMSObservable logKey](self, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v10;
      v66 = 2114;
      v67 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to send a result from a completed AMSObservable.", buf, 0x16u);

    }
    -[AMSObservable stateLock](self, "stateLock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");
    v14 = 0;
    goto LABEL_37;
  }
  -[AMSObservable queuedResults](self, "queuedResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v4);

  -[AMSObservable queuedResults](self, "queuedResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v16, "copy");

  -[AMSObservable observers](self, "observers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  v53 = v18;
  if (objc_msgSend(v18, "count"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    v21 = v13;
    v22 = (void *)objc_opt_class();
    v23 = v22;
    -[AMSObservable logKey](self, "logKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v65 = v22;
    v13 = v21;
    v66 = 2114;
    v67 = v24;
    v25 = "%{public}@: [%{public}@] There's at least one observer. Sending the result.";
    goto LABEL_12;
  }
  v26 = -[AMSObservable behavior](self, "behavior");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v27 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v27;
  if (v26)
  {
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = v13;
      v30 = (void *)objc_opt_class();
      v31 = v30;
      -[AMSObservable logKey](self, "logKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v30;
      v13 = v29;
      v66 = 2114;
      v67 = v32;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] The are no observers. Queuing the result.", buf, 0x16u);

    }
    goto LABEL_20;
  }
  if (!v27)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v47 = v13;
    v48 = (void *)objc_opt_class();
    v23 = v48;
    -[AMSObservable logKey](self, "logKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v65 = v48;
    v13 = v47;
    v66 = 2114;
    v67 = v24;
    v25 = "%{public}@: [%{public}@] The are no observers.";
LABEL_12:
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, v25, buf, 0x16u);

  }
LABEL_13:

  -[AMSObservable queuedResults](self, "queuedResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");
LABEL_20:

  -[AMSObservable stateLock](self, "stateLock");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "unlock");

  v34 = objc_msgSend(v53, "count");
  v14 = v34 != 0;
  if (v34)
  {
    v49 = v13;
    v50 = v4;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v13;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v35)
    {
      v36 = v35;
      v52 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v59 != v52)
            objc_enumerationMutation(obj);
          v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v39 = v53;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v41; ++j)
              {
                if (*(_QWORD *)v55 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                -[AMSObservable sendMessageQueue](self, "sendMessageQueue");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "_sendResult:usingQueue:", v38, v45);

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
            }
            while (v41);
          }

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v36);
    }

    v13 = v49;
    v4 = v50;
    v14 = 1;
  }

LABEL_37:
  return v14;
}

- (id)subscribeWithResultBlock:(id)a3
{
  id v4;
  AMSObserver *v5;

  v4 = a3;
  v5 = -[AMSObserver initWithResultBlock:]([AMSObserver alloc], "initWithResultBlock:", v4);

  -[AMSObservable subscribe:](self, "subscribe:", v5);
  return v5;
}

- (void)unsubscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[AMSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    -[AMSObservable logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v10;
    v20 = 2114;
    v21 = v12;
    v13 = "%{public}@: [%{public}@] Someone is attempting to remove an observer from a completed observable.";
LABEL_12:
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  -[AMSObservable observers](self, "observers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v4);

  if ((v15 & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    v16 = (void *)objc_opt_class();
    v11 = v16;
    -[AMSObservable logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v16;
    v20 = 2114;
    v21 = v12;
    v13 = "%{public}@: [%{public}@] Someone is attempting to remove an observer from an observable it isn't subscribed to.";
    goto LABEL_12;
  }
  -[AMSObservable observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);
LABEL_14:

  -[AMSObservable stateLock](self, "stateLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

- (void)unsubscribeAll
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AMSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[AMSObservable stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "condition");

  if (v5 == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      -[AMSObservable logKey](self, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to remove all observers from a completed observable.", buf, 0x16u);

    }
    -[AMSObservable stateLock](self, "stateLock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlock");

  }
  else
  {
    -[AMSObservable observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[AMSObservable stateLock](self, "stateLock");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");

  }
}

- (BOOL)_isComplete
{
  void *v2;
  BOOL v3;

  -[AMSObservable stateLock](self, "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition") == 1;

  return v3;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(id)a3
{
  objc_storeStrong((id *)&self->_failureError, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setQueuedResults:(id)a3
{
  objc_storeStrong((id *)&self->_queuedResults, a3);
}

- (OS_dispatch_queue)sendMessageQueue
{
  return self->_sendMessageQueue;
}

- (void)setSendMessageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sendMessageQueue, a3);
}

- (void)setStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_stateLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_sendMessageQueue, 0);
  objc_storeStrong((id *)&self->_queuedResults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_failureError, 0);
}

@end
