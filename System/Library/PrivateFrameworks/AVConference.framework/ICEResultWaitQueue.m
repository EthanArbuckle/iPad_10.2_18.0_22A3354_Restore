@implementation ICEResultWaitQueue

- (ICEResultWaitQueue)init
{
  ICEResultWaitQueue *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)ICEResultWaitQueue;
  v2 = -[ICEResultWaitQueue init](&v4, sel_init);
  v2->queryList = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  pthread_mutex_init(&v2->resMutex, 0);
  pthread_cond_init(&v2->resCond, 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->queryList, "removeAllObjects");

  pthread_mutex_destroy(&self->resMutex);
  pthread_cond_destroy(&self->resCond);
  v3.receiver = self;
  v3.super_class = (Class)ICEResultWaitQueue;
  -[ICEResultWaitQueue dealloc](&v3, sel_dealloc);
}

- (id)copyResultForCallID:(unsigned int)a3
{
  uint64_t v3;
  ICEResultWaitQueue *v4;
  _opaque_pthread_mutex_t *p_resMutex;
  ICEResultQuery *v6;
  pthread_cond_t *p_resCond;
  NSMutableArray *queryList;
  uint64_t v9;
  uint64_t v10;
  ICEResultWaitQueue *v11;
  uint64_t v12;
  uint64_t i;
  ICEResultQuery *v14;
  uint64_t v15;
  NSObject *v16;
  _opaque_pthread_mutex_t *v18;
  timespec v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  v31 = *MEMORY[0x1E0C80C00];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v6 = 0;
  p_resCond = &v4->resCond;
  v18 = p_resMutex;
  do
  {
    if (v6)
    {
      if (-[ICEResultQuery isQueryAnswered](v6, "isQueryAnswered"))
        goto LABEL_26;
      v19.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v19.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    }
    else
    {
      v19.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v19.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      queryList = v4->queryList;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](queryList, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (!v9)
        goto LABEL_17;
      v10 = v9;
      v11 = v4;
      v6 = 0;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(queryList);
          v14 = *(ICEResultQuery **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (-[ICEResultQuery callID](v14, "callID") == (_DWORD)v3)
            v6 = v14;
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](queryList, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v10);
      v4 = v11;
      p_resMutex = v18;
      if (!v6)
      {
LABEL_17:
        v6 = -[ICEResultQuery initWithCallID:]([ICEResultQuery alloc], "initWithCallID:", v3);
        -[NSMutableArray addObject:](v4->queryList, "addObject:", v6);
        goto LABEL_18;
      }
    }
    if (-[ICEResultQuery isQueryAnswered](v6, "isQueryAnswered"))
    {
LABEL_26:
      -[NSMutableArray removeObject:](v4->queryList, "removeObject:", v6);
      pthread_mutex_unlock(p_resMutex);
      return v6;
    }
LABEL_18:
    v19 = (timespec)xmmword_1D91092B0;
  }
  while (!pthread_cond_timedwait_relative_np(p_resCond, p_resMutex, &v19));
  if (v6 && -[NSMutableArray containsObject:](v4->queryList, "containsObject:", v6))
    -[NSMutableArray removeObject:](v4->queryList, "removeObject:", v6);

  pthread_mutex_unlock(p_resMutex);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = v15;
      v22 = 2080;
      v23 = "-[ICEResultWaitQueue copyResultForCallID:]";
      v24 = 1024;
      v25 = 126;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Didn't return a connection result in the ICE result wait queue.  This shouldn't happen", buf, 0x1Cu);
    }
  }
  return 0;
}

- (void)addResult:(tagCONNRESULT *)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  _opaque_pthread_mutex_t *p_resMutex;
  NSMutableArray *queryList;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  ICEResultQuery *v15;
  ICEResultQuery *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  queryList = self->queryList;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](queryList, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v9)
    goto LABEL_12;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(queryList);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v14, "callID") == (_DWORD)v4)
        v11 = v14;
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](queryList, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  }
  while (v10);
  if (v11)
  {
    objc_msgSend(v11, "setResult:", a3);
  }
  else
  {
LABEL_12:
    v15 = -[ICEResultQuery initWithResult:]([ICEResultQuery alloc], "initWithResult:", a3);
    v16 = v15;
    if (!a3)
      -[ICEResultQuery setCallID:](v15, "setCallID:", v4);
    -[NSMutableArray addObject:](self->queryList, "addObject:", v16);

  }
  pthread_cond_broadcast(&self->resCond);
  pthread_mutex_unlock(p_resMutex);
}

@end
