@implementation CATOperation

+ (BOOL)automaticallyNotifiesObserversOfUUID
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfCreatedDate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfEnqueuedDate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfStartedDate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfFinishedDate
{
  return 0;
}

+ (BOOL)isCancelable
{
  return 0;
}

- (CATOperation)init
{
  CATOperation *v2;
  uint64_t v3;
  NSDate *createdDate;
  uint64_t v5;
  NSUUID *UUID;
  uint64_t v7;
  NSLock *mLock;
  void *v9;
  _CATObserverManager *v10;
  _CATObserverManager *mObserverManager;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CATOperation;
  v2 = -[CATOperation init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    createdDate = v2->_createdDate;
    v2->_createdDate = (NSDate *)v3;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v5;

    v2->_completedUnitCount = -1;
    v2->_totalUnitCount = -1;
    v7 = objc_opt_new();
    mLock = v2->mLock;
    v2->mLock = (NSLock *)v7;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p"), objc_opt_class(), v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock setName:](v2->mLock, "setName:", v9);

    v10 = -[_CATObserverManager initWithOperation:]([_CATObserverManager alloc], "initWithOperation:", v2);
    mObserverManager = v2->mObserverManager;
    v2->mObserverManager = v10;

  }
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATOperation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATOperation UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATOperation stateDescription](self, "stateDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@, ID = %@, state = %@, completed = %ld/%ld }>"), v4, self, v5, v7, v8, -[CATOperation completedUnitCount](self, "completedUnitCount"), -[CATOperation totalUnitCount](self, "totalUnitCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stateDescription
{
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = aA[!-[CATOperation isAsynchronous](self, "isAsynchronous")];
  v5 = atomic_load((unsigned int *)&self->mState);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%c%c%c [%ld]"), v4, aReeeef[v5], aC[!-[CATOperation isCanceled](self, "isCanceled")], -[CATOperation queuePriority](self, "queuePriority"));
}

- (BOOL)isAsynchronous
{
  return 0;
}

+ (id)keyPathsForValuesAffectingIsCanceled
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("isCancelled"));
}

- (BOOL)isReady
{
  void *v3;
  objc_super v5;

  if (-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 0, 1))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation setEnqueuedDate:](self, "setEnqueuedDate:", v3);

    -[CATOperation setPhase:](self, "setPhase:", 1);
  }
  v5.receiver = self;
  v5.super_class = (Class)CATOperation;
  return -[CATOperation isReady](&v5, sel_isReady);
}

- (BOOL)isExecuting
{
  return -[CATOperation phase](self, "phase") == 2;
}

- (BOOL)isFinished
{
  return -[CATOperation phase](self, "phase") == 3;
}

- (void)start
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 1, 2))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = atomic_load((unsigned int *)&self->mState);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 234, CFSTR("%@ cannot transition to '_CATOperationStateStarting' from state (%d)."), self, v14);

  }
  v4 = (void *)MEMORY[0x20BD108A4]();
  -[CATOperation operationWillStart](self, "operationWillStart");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATOperation setStartedDate:](self, "setStartedDate:", v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CATOperation dependencies](self, "dependencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v17.receiver = self;
        v17.super_class = (Class)CATOperation;
        -[CATOperation removeDependency:](&v17, sel_removeDependency_, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  if (!-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 2, 3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = atomic_load((unsigned int *)&self->mState);
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 250, CFSTR("%@ cannot transition to '_CATOperationStateRunning' from state (%d)."), self, v16);

  }
  if (-[CATOperation isCanceled](self, "isCanceled"))
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v12);

  }
  else
  {
    -[CATOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[CATOperation setPhase:](self, "setPhase:", 2);
    -[CATOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[_CATObserverManager operationDidStart:](self->mObserverManager, "operationDidStart:", self);
    -[CATOperation main](self, "main");
    if (!-[CATOperation isAsynchronous](self, "isAsynchronous"))
      -[CATOperation endOperationSuccessfullyIfNeeded](self, "endOperationSuccessfullyIfNeeded");
  }
  objc_autoreleasePoolPop(v4);
}

- (void)endOperationSuccessfullyIfNeeded
{
  id obj;

  objc_msgSend((id)objc_opt_class(), "callStackSymbols");
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->mLock, "lock");
  if (-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 3, 4))
  {
    objc_storeStrong((id *)&self->mCallStackSymbols, obj);
    -[NSLock unlock](self->mLock, "unlock");
    -[CATOperation finalizeOperation](self, "finalizeOperation");
  }
  else
  {
    -[NSLock unlock](self->mLock, "unlock");
  }

}

- (void)endOperationWithResultObject:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  signed int v10;
  id v11;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->mLock, "lock");
  if (-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 3, 4))
  {
    objc_storeStrong((id *)&self->mCallStackSymbols, v5);
    -[NSLock unlock](self->mLock, "unlock");
    -[CATOperation setResultObject:](self, "setResultObject:", v11);
    -[CATOperation finalizeOperation](self, "finalizeOperation");
  }
  else
  {
    v6 = atomic_load((unsigned int *)&self->mState);
    -[NSLock unlock](self->mLock, "unlock");
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 > 4)
    {
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 311, CFSTR("%@ cannot call %@ when operation is already finished. Previous call:\n%@"), self, v8, self->mCallStackSymbols);
    }
    else
    {
      v10 = atomic_load((unsigned int *)&self->mState);
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 307, CFSTR("%@ cannot call %@ when operation's state is %ld"), self, v8, v10);
    }

  }
}

- (void)endOperationWithError:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  signed int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 319, CFSTR("%@ cannot call %@ when the specified error is nil."), self, v12);

  }
  -[NSLock lock](self->mLock, "lock");
  if (-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 3, 4))
  {
    objc_storeStrong((id *)&self->mCallStackSymbols, v5);
    -[NSLock unlock](self->mLock, "unlock");
    -[CATOperation setError:](self, "setError:", v13);
    -[CATOperation finalizeOperation](self, "finalizeOperation");
  }
  else
  {
    v6 = atomic_load((unsigned int *)&self->mState);
    -[NSLock unlock](self->mLock, "unlock");
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 > 4)
    {
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 336, CFSTR("%@ cannot call %@ when operation is already finished. Previous call:\n%@"), self, v8, self->mCallStackSymbols);
    }
    else
    {
      v10 = atomic_load((unsigned int *)&self->mState);
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 332, CFSTR("%@ cannot call %@ when operation's state is %ld"), self, v8, v10);
    }

  }
}

+ (id)callStackSymbols
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CATCaptureCallStackSymbols"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x24BDBD1C0];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &unk_24C1D8E60;
  }
  return v10;
}

- (void)finalizeOperation
{
  void *v3;

  -[CATOperation operationWillFinish](self, "operationWillFinish");
  if (-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 4, 5))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation setFinishedDate:](self, "setFinishedDate:", v3);

    -[CATOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[CATOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    -[CATOperation setPhase:](self, "setPhase:", 3);
    -[CATOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
    -[CATOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[CATOperation operationDidFinish](self, "operationDidFinish");
    -[_CATObserverManager operationDidFinish:](self->mObserverManager, "operationDidFinish:", self);
  }
}

- (void)operationWillEnqueueOntoOperationQueue:(id)a3
{
  void *v4;

  if (-[CATOperation whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 0, 1))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation setEnqueuedDate:](self, "setEnqueuedDate:", v4);

    -[CATOperation setPhase:](self, "setPhase:", 1);
  }
}

- (BOOL)whenStateIs:(int)a3 atomicallySwapWith:(int)a4
{
  int *p_mState;
  unsigned int v5;
  BOOL result;

  p_mState = &self->mState;
  while (1)
  {
    v5 = __ldaxr((unsigned int *)p_mState);
    if (v5 != a3)
      break;
    if (!__stlxr(a4, (unsigned int *)p_mState))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

- (void)addObserver:(id)a3
{
  -[_CATObserverManager addObserver:](self->mObserverManager, "addObserver:", a3);
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5
{
  -[CATOperation addTarget:selector:forOperationEvents:userInfo:delegateQueue:](self, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", a3, a4, a5, 0, MEMORY[0x24BDAC9B8]);
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 userInfo:(id)a6
{
  -[CATOperation addTarget:selector:forOperationEvents:userInfo:delegateQueue:](self, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", a3, a4, a5, a6, MEMORY[0x24BDAC9B8]);
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 delegateQueue:(id)a6
{
  -[CATOperation addTarget:selector:forOperationEvents:userInfo:delegateQueue:](self, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", a3, a4, a5, 0, a6);
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 userInfo:(id)a6 delegateQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  _CATOperationTargetSelectorObserver *v15;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = -[_CATOperationTargetSelectorObserver initWithTarget:selector:events:userInfo:delegateQueue:]([_CATOperationTargetSelectorObserver alloc], "initWithTarget:selector:events:userInfo:delegateQueue:", v14, a4, a5, v13, v12);

  -[CATOperation addObserver:](self, "addObserver:", v15);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSDate)createdDate
{
  return (NSDate *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSDate)enqueuedDate
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (void)setEnqueuedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSDate)startedDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setStartedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSDate)finishedDate
{
  return (NSDate *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFinishedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 336, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (id)resultObject
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setResultObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (BOOL)canCancel
{
  return self->_canCancel;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong(&self->_resultObject, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_startedDate, 0);
  objc_storeStrong((id *)&self->_enqueuedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->mObserverManager, 0);
  objc_storeStrong((id *)&self->mLock, 0);
  objc_storeStrong((id *)&self->mCallStackSymbols, 0);
}

@end
