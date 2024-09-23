@implementation SGXPCActivityManager

- (SGXPCActivityManager)init
{
  SGXPCActivityManager *v2;
  SGXPCActivityManager *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *activities;
  void *v7;
  uint64_t v8;
  NSMutableArray *lastCriteria;
  void *v10;
  uint64_t v11;
  NSMutableArray *handlers;
  uint64_t v13;
  NSMutableDictionary *currentTasks;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SGXPCActivityManager;
  v2 = -[SGXPCActivityManager init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    arrayFilledWith(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    activities = v3->_activities;
    v3->_activities = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    arrayFilledWith(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    lastCriteria = v3->_lastCriteria;
    v3->_lastCriteria = (NSMutableArray *)v8;

    nullHandler();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    arrayFilledWith(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    handlers = v3->_handlers;
    v3->_handlers = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    currentTasks = v3->_currentTasks;
    v3->_currentTasks = (NSMutableDictionary *)v13;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGXPCActivityManager;
  -[SGXPCActivityManager dealloc](&v3, sel_dealloc);
}

- (void)registerActivitiesWithSystem
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  _QWORD v12[4];
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableDictionary *v16;
  _opaque_pthread_mutex_t *v17;
  int v18;
  uint8_t buf[16];

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_registered)
  {
    pthread_mutex_unlock(p_lock);
    sgLogHandle();
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, &v4->super.super, OS_LOG_TYPE_DEBUG, "Already registered for activities", buf, 2u);
    }
  }
  else
  {
    self->_registered = 1;
    v4 = self->_activities;
    v5 = self->_lastCriteria;
    v6 = self->_handlers;
    v7 = self->_currentTasks;
    pthread_mutex_unlock(p_lock);
    v8 = 0;
    v9 = (void *)*MEMORY[0x1E0C80748];
    do
    {
      v10 = identifierForActivityId(v8);
      if (*v10)
      {
        v11 = v10;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __52__SGXPCActivityManager_registerActivitiesWithSystem__block_invoke;
        v12[3] = &unk_1E7DAC1F8;
        v18 = v8;
        v17 = p_lock;
        v13 = v4;
        v14 = v5;
        v15 = v6;
        v16 = v7;
        xpc_activity_register(v11, v9, v12);

      }
      v8 = (v8 + 1);
    }
    while ((_DWORD)v8 != 15);

  }
}

- (void)registerForActivity:(int)a3 handler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v12 = v7;
  if (a3 >= 0xF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGXPCActivity.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("0 <= activityId && activityId < _SGXPCActivityCount"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGXPCActivity.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  pthread_mutex_lock(&self->_lock);
  v8 = (void *)objc_msgSend(v12, "copy");
  v9 = (void *)MEMORY[0x1C3BD5158]();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_handlers, "setObject:atIndexedSubscript:", v9, a3);

  pthread_mutex_unlock(&self->_lock);
}

- (id)activityForActivityId:(int)a3
{
  uint64_t v3;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", (int)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = identifierForActivityId(v3);
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "Activity \"%s\" has not registered with the system yet. Returning nil.", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (int64_t)getState:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (BOOL)setState:(id)a3 state:(int64_t)a4
{
  return xpc_activity_set_state((xpc_activity_t)a3, a4);
}

- (void)setCriteria:(id)a3 criteria:(id)a4 forActivity:(int)a5
{
  _xpc_activity_s *v9;
  id v10;
  _opaque_pthread_mutex_t *p_lock;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  const char *string;
  const char *v20;
  const char *v21;
  int64_t int64;
  const char *v23;
  int64_t v24;
  const char *v25;
  int64_t v26;
  int64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  _xpc_activity_s *v31;
  uint8_t buf[4];
  _xpc_activity_s *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = (_xpc_activity_s *)a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGXPCActivity.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("criteria"));

  }
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v12 = a5;
  -[NSMutableArray objectAtIndexedSubscript:](self->_lastCriteria, "objectAtIndexedSubscript:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v13 == (void *)v14)
    goto LABEL_12;
  v31 = v9;
  v15 = (void *)v14;
  v16 = v13;
  v17 = v10;
  v18 = (const char *)*MEMORY[0x1E0C80878];
  string = xpc_dictionary_get_string(v16, (const char *)*MEMORY[0x1E0C80878]);
  v20 = xpc_dictionary_get_string(v17, v18);
  if (strcmp(string, v20)
    || (v21 = (const char *)*MEMORY[0x1E0C807A8],
        int64 = xpc_dictionary_get_int64(v16, (const char *)*MEMORY[0x1E0C807A8]),
        int64 != xpc_dictionary_get_int64(v17, v21))
    || (v23 = (const char *)*MEMORY[0x1E0C80760],
        v24 = xpc_dictionary_get_int64(v16, (const char *)*MEMORY[0x1E0C80760]),
        v24 != xpc_dictionary_get_int64(v17, v23)))
  {

    v9 = v31;
LABEL_12:

    goto LABEL_13;
  }
  v25 = (const char *)*MEMORY[0x1E0C80790];
  v26 = xpc_dictionary_get_int64(v16, (const char *)*MEMORY[0x1E0C80790]);
  v27 = xpc_dictionary_get_int64(v17, v25);

  v9 = v31;
  if (v26 == v27)
  {
    sgLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEBUG, "Ignoring CTS criteria change as it didn't change.", buf, 2u);
    }

    goto LABEL_16;
  }
LABEL_13:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_lastCriteria, "setObject:atIndexedSubscript:", v10, v12);
  sgLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_INFO, "Setting CTS criteria for activity: %@, criteria: %@", buf, 0x16u);
  }

  xpc_activity_set_criteria(v9, v10);
LABEL_16:
  pthread_mutex_unlock(p_lock);

}

- (id)_taskForActivity:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  uint64_t v6;
  id v7;
  void *v8;
  NSMutableDictionary *currentTasks;
  void *v10;

  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
      break;
    if (++v6 == 15)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  currentTasks = self->_currentTasks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](currentTasks, "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  pthread_mutex_unlock(p_lock);

  return v8;
}

- (BOOL)shouldDefer:(id)a3
{
  _xpc_activity_s *v4;
  char v5;
  void *v6;

  v4 = (_xpc_activity_s *)a3;
  if (xpc_activity_should_defer(v4))
  {
    v5 = 1;
  }
  else
  {
    -[SGXPCActivityManager _taskForActivity:](self, "_taskForActivity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "shouldDefer");

  }
  return v5;
}

- (id)copyCriteria:(id)a3
{
  _xpc_activity_s *v5;
  xpc_object_t v6;
  void *v8;

  v5 = (_xpc_activity_s *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGXPCActivity.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activity"));

  }
  v6 = xpc_activity_copy_criteria(v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTasks, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_lastCriteria, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

void __52__SGXPCActivityManager_registerActivitiesWithSystem__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  xpc_object_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    +[SGLongRunningTaskManager sharedInstance](SGLongRunningTaskManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskWithDeadline:", 3600.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", *(int *)(a1 + 72));
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    nullHandler();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v9)
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v18 = identifierForActivityId(*(unsigned int *)(a1 + 72));
        v19 = 136315138;
        v20 = v18;
        _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "Stub activity called for %s", (uint8_t *)&v19, 0xCu);
      }

    }
    else
    {
      v10 = (void *)MEMORY[0x1C3BD4F6C]();
      ((void (**)(_QWORD, _xpc_activity_s *))v6)[2](v6, v3);
      objc_autoreleasePoolPop(v10);
    }
    objc_msgSend(v5, "markFinished");
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
    v14 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  }
  else
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = identifierForActivityId(*(unsigned int *)(a1 + 72));
      v19 = 136315138;
      v20 = v17;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "Checking in for activity %s", (uint8_t *)&v19, 0xCu);
    }

    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v3, *(int *)(a1 + 72));
    v12 = xpc_activity_copy_criteria(v3);
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v12, *(int *)(a1 + 72));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v16, *(int *)(a1 + 72));

    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_11908 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_11908, &__block_literal_global_11909);
  return (id)sharedInstance__pasExprOnceResult_11910;
}

+ (id)nameForActivityId:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", identifierForActivityId(*(uint64_t *)&a3));
}

void __38__SGXPCActivityManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_11910;
  sharedInstance__pasExprOnceResult_11910 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
