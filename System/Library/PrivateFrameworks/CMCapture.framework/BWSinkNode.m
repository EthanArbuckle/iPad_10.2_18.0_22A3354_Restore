@implementation BWSinkNode

- (id)nodeType
{
  return CFSTR("Sink");
}

- (uint64_t)_setupSinkNodeStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWSinkNodeStateMachine"), 4, 1, result);
    *(_QWORD *)(v1 + 96) = v2;
    -[FigStateMachine setPerformsAtomicStateTransitions:](v2, "setPerformsAtomicStateTransitions:", 0);
    objc_msgSend(*(id *)(v1 + 96), "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 96), "setLabel:forState:", CFSTR("Activating"), 2);
    objc_msgSend(*(id *)(v1 + 96), "setLabel:forState:", CFSTR("Active"), 4);
    return objc_msgSend(*(id *)(v1 + 96), "setLabel:forState:", CFSTR("Deactivating"), 8);
  }
  return result;
}

- (NSString)sinkID
{
  return self->_sinkID;
}

- (void)notifyWhenActive:(id)a3
{
  sn_notifyOnStateTransition(self->_stateMachine, &self->_stateLock, 4, (void (**)(_QWORD))a3, (id *)&self->_handlersToCallWhenActive);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  _BOOL4 v7;
  NSMutableArray *handlersToCallWhenActive;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *configurationLiveIDs;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[BWNode supportsConcurrentLiveInputCallbacks](self, "supportsConcurrentLiveInputCallbacks", a3, a4, a5))
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ supports concurrent live input callbacks, and BWSinkNode doesn't know how to manage the idle state for nodes with concurrent input callbacks"), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v20, 0));
  }
  -[BWNode configurationID](self, "configurationID");
  v7 = -[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1);
  os_unfair_lock_lock(&self->_stateLock);
  -[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 2, 1);
  if (v7
    && -[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 4, 2))
  {
    handlersToCallWhenActive = self->_handlersToCallWhenActive;
    self->_handlersToCallWhenActive = 0;
    os_unfair_lock_unlock(&self->_stateLock);
    if (handlersToCallWhenActive)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](handlersToCallWhenActive, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(handlersToCallWhenActive);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12++) + 16))();
          }
          while (v10 != v12);
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](handlersToCallWhenActive, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v10);
      }

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_configurationHandlerLock);
  self->_liveConfigurationID = a3;
  if (-[NSMutableArray count](self->_configurationLiveIDs, "count")
    && (configurationLiveIDs = self->_configurationLiveIDs,
        v25[0] = MEMORY[0x1E0C809B0],
        v25[1] = 3221225472,
        v25[2] = __70__BWSinkNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke,
        v25[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l,
        v25[4] = a3,
        v14 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](configurationLiveIDs, "indexesOfObjectsPassingTest:", v25), objc_msgSend(v14, "count")))
  {
    v15 = (id)-[NSMutableArray objectsAtIndexes:](self->_configurationLiveHandlers, "objectsAtIndexes:", v14);
    -[NSMutableArray removeObjectsAtIndexes:](self->_configurationLiveHandlers, "removeObjectsAtIndexes:", v14);
    -[NSMutableArray removeObjectsAtIndexes:](self->_configurationLiveIDs, "removeObjectsAtIndexes:", v14);
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
    if (v15)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++) + 16))();
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
        }
        while (v17);
      }

    }
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
  }
}

- (void)notifyWhenIdle:(id)a3
{
  sn_notifyOnStateTransition(self->_stateMachine, &self->_stateLock, 1, (void (**)(_QWORD))a3, (id *)&self->_handlersToCallWhenIdle);
}

- (BWSinkNode)initWithSinkID:(id)a3
{
  uint64_t v3;
  BWSinkNode *v6;
  BWSinkNode *v7;
  int v9;
  uint64_t v10;
  objc_super v11;

  if (!a3)
  {
    fig_log_get_emitter();
    v10 = v3;
    v9 = 0;
    FigDebugAssert3();
  }
  v11.receiver = self;
  v11.super_class = (Class)BWSinkNode;
  v6 = -[BWNode init](&v11, sel_init, v9, v10);
  v7 = v6;
  if (v6)
  {
    v6->_stateLock._os_unfair_lock_opaque = 0;
    -[BWSinkNode _setupSinkNodeStateMachine]((uint64_t)v6);
    v7->_sinkID = (NSString *)objc_msgSend(a3, "copy");
    v7->_configurationHandlerLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v7->_configurationLiveHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_configurationLiveIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v7;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[FigStateMachine currentState](self->_stateMachine, "currentState");
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWSinkNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)notifyWhenConfigurationID:(int64_t)a3 becomesLive:(id)a4
{
  int64_t liveConfigurationID;
  void *v8;

  if (-[NSArray count](-[BWNode inputs](self, "inputs"), "count") >= 2)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Don't know how to track configuration IDs becoming live for sink nodes with multiple inputs"), 0));
  pthread_mutex_lock((pthread_mutex_t *)self->_configurationHandlerLock);
  liveConfigurationID = self->_liveConfigurationID;
  if (liveConfigurationID >= a3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
    (*((void (**)(id, int64_t))a4 + 2))(a4, liveConfigurationID);
  }
  else
  {
    v8 = (void *)objc_msgSend(a4, "copy");
    -[NSMutableArray addObject:](self->_configurationLiveHandlers, "addObject:", v8);

    -[NSMutableArray addObject:](self->_configurationLiveIDs, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3));
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
  }
}

- (NSString)currentStateDebugString
{
  os_unfair_lock_s *p_stateLock;
  NSString *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = -[NSString lowercaseString](-[FigStateMachine currentStateLabel](self->_stateMachine, "currentStateLabel"), "lowercaseString");
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BOOL)isActive
{
  BWSinkNode *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = -[FigStateMachine currentState](v2->_stateMachine, "currentState");
  os_unfair_lock_unlock(p_stateLock);
  return (_DWORD)v2 != 1;
}

- (void)addOutput:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't add outputs to sink nodes"), 0));
}

- (int64_t)liveConfigurationID
{
  int64_t liveConfigurationID;

  pthread_mutex_lock((pthread_mutex_t *)self->_configurationHandlerLock);
  liveConfigurationID = self->_liveConfigurationID;
  pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
  return liveConfigurationID;
}

BOOL __70__BWSinkNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "longLongValue") <= *(_QWORD *)(a1 + 32);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  _BOOL4 v4;
  NSMutableArray *handlersToCallWhenIdle;
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
  v4 = -[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0);
  os_unfair_lock_lock(&self->_stateLock);
  -[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 8, 4);
  if (v4
    && -[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 1, 8))
  {
    handlersToCallWhenIdle = self->_handlersToCallWhenIdle;
    self->_handlersToCallWhenIdle = 0;
    os_unfair_lock_unlock(&self->_stateLock);
    if (handlersToCallWhenIdle)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](handlersToCallWhenIdle, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
              objc_enumerationMutation(handlersToCallWhenIdle);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
          }
          while (v7 != v9);
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](handlersToCallWhenIdle, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

@end
