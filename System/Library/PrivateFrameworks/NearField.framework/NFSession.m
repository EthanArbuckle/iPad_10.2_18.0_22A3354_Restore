@implementation NFSession

- (NFSession)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NFSession;
  v2 = -[NFSession init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.nearfield.session", v3);
    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v4;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), (const void *)*MEMORY[0x1E0DE7900], 0, 0);
    dispatch_suspend(*((dispatch_object_t *)v2 + 2));
    *((_BYTE *)v2 + 9) = 1;
    *((_QWORD *)v2 + 7) = 0;
  }
  return (NFSession *)v2;
}

- (void)dealloc
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *Name;
  objc_super v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_state == 1)
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i endSession should have been called before dealloc", v10, ClassName, Name, 53);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      *(_DWORD *)buf = 67109890;
      v17 = v13;
      v18 = 2082;
      v19 = object_getClassName(self);
      v20 = 2082;
      v21 = sel_getName(a2);
      v22 = 1024;
      v23 = 53;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i endSession should have been called before dealloc", buf, 0x22u);
    }

  }
  if (self->_isCallbackQueueSuspended)
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
  v15.receiver = self;
  v15.super_class = (Class)NFSession;
  -[NFSession dealloc](&v15, sel_dealloc);
}

- (id)proxy
{
  NFSession *v2;
  NFSessionInterface *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  NFSession *v5;
  NFSessionInterface *v6;

  v6 = (NFSessionInterface *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_proxy != v6)
    objc_storeStrong((id *)&v5->_proxy, a3);
  objc_sync_exit(v5);

}

- (BOOL)didEnd
{
  return self->_state == 2;
}

- (BOOL)isActive
{
  return self->_state == 1;
}

- (BOOL)isFirstInQueue
{
  return self->_isFirstInQueue;
}

- (void)setIsFirstInQueue:(BOOL)a3
{
  self->_isFirstInQueue = a3;
}

- (void)resume
{
  if (self->_isCallbackQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
    self->_isCallbackQueueSuspended = 0;
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setDidStartCallback:(id)a3
{
  void *v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__NFSession_setDidStartCallback___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callbackQueue, v7);

}

void __33__NFSession_setDidStartCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC40C8](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void)setDidEndCallback:(id)a3
{
  void *v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__NFSession_setDidEndCallback___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callbackQueue, v7);

}

void __31__NFSession_setDidEndCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC40C8](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didStartSessionWithoutQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (!self->_state)
  {
    v6 = v4;
    if (v4)
    {
      -[NFSession _invokeDidStartCallback:](self, "_invokeDidStartCallback:", v4);
      -[NFSession endSession](self, "endSession");
    }
    else
    {
      if (-[NFSession isTimeLimited](self, "isTimeLimited"))
        -[NFSession setSessionTimeLimit:](self, "setSessionTimeLimit:", 900.0);
      self->_state = 1;
      -[NFSession _invokeDidStartCallback:](self, "_invokeDidStartCallback:", 0);
    }
    v5 = v6;
  }

}

- (void)didStartSession:(id)a3
{
  id v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__NFSession_didStartSession___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callbackQueue, v7);

}

uint64_t __29__NFSession_didStartSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStartSessionWithoutQueue:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isTimeLimited
{
  return 1;
}

- (void)setSessionTimeLimit:(double)a3
{
  NSObject *v5;
  NFTimer *sessionKillSwitch;
  id v8;
  NFTimer *v9;
  NFTimer *v10;
  NFTimer *v11;
  _QWORD v12[6];
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_19B5EB000, "setSessionTimeLimit:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  sessionKillSwitch = self->_sessionKillSwitch;
  if (a3 != 0.0 || sessionKillSwitch == 0)
  {
    if (a3 != 0.0)
    {
      if (!sessionKillSwitch)
      {
        v8 = objc_alloc(MEMORY[0x1E0DE78F8]);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __33__NFSession_setSessionTimeLimit___block_invoke;
        v12[3] = &unk_1E3B51460;
        v12[4] = self;
        *(double *)&v12[5] = a3;
        v9 = (NFTimer *)objc_msgSend(v8, "initSleepTimerWithCallback:queue:", v12, self->_callbackQueue);
        v10 = self->_sessionKillSwitch;
        self->_sessionKillSwitch = v9;

        sessionKillSwitch = self->_sessionKillSwitch;
      }
      -[NFTimer startTimer:](sessionKillSwitch, "startTimer:", a3);
    }
  }
  else
  {
    -[NFTimer stopTimer](sessionKillSwitch, "stopTimer");
    v11 = self->_sessionKillSwitch;
    self->_sessionKillSwitch = 0;

  }
}

uint64_t __33__NFSession_setSessionTimeLimit___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v5;
  const char *Name;
  uint64_t v7;
  _QWORD v8[5];
  _BYTE state[22];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_19B5EB000, "com.apple.nfcd.session.activeTimer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)state = 136315394;
    *(_QWORD *)&state[4] = Name;
    *(_WORD *)&state[12] = 2048;
    *(_QWORD *)&state[14] = v7;
    _os_log_fault_impl(&dword_19B5EB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s is still active after %lf seconds", state, 0x16u);
  }
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__NFSession_setSessionTimeLimit___block_invoke_12;
  v8[3] = &unk_1E3B51A60;
  v8[4] = v3;
  return objc_msgSend(v3, "endSessionWithCompletion:", v8);
}

void __33__NFSession_setSessionTimeLimit___block_invoke_12(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleSessionReachedTimeLimit");

  }
}

- (void)endSession
{
  -[NFSession endSessionWithCompletion:](self, "endSessionWithCompletion:", 0);
}

- (void)endSessionAndStartNextSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "endSessionAndStartNextSession:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  objc_msgSend(v7, "prioritizeSession");
  -[NFSession endSessionWithCompletion:](self, "endSessionWithCompletion:", v6);

}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *callbackQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "endSessionWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__NFSession_endSessionWithCompletion___block_invoke;
  v8[3] = &unk_1E3B52F90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(callbackQueue, v8);

}

uint64_t __38__NFSession_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    objc_msgSend(*(id *)(v2 + 48), "stopTimer");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 56) == 2)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    objc_msgSend((id)v2, "_endProxySession");
    v6 = *(_QWORD **)(a1 + 32);
    if (v6[7] != 1)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0CB2D50];
      v12[0] = CFSTR("Session ended before started.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 0, v9);
      objc_msgSend(v6, "_invokeDidStartCallback:", v10);

      v6 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v6, "_invokeDidEndSession");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 2;
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_endProxySession
{
  void *v4;
  void *v5;
  void *v6;
  NFSession *v7;
  NFSessionInterface *proxy;
  _QWORD v9[6];

  -[NFSession proxy](self, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NFSession proxy](self, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __29__NFSession__endProxySession__block_invoke;
    v9[3] = &unk_1E3B51410;
    v9[4] = self;
    v9[5] = a2;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endSession:", &__block_literal_global_4);

    v7 = self;
    objc_sync_enter(v7);
    proxy = v7->_proxy;
    v7->_proxy = 0;

    objc_sync_exit(v7);
  }
}

void __29__NFSession__endProxySession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 255, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 255;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

- (void)_invokeDidStartCallback:(id)a3
{
  void (**didStartCallback)(id, NFSession *);
  NFSession *v5;
  id v6;

  didStartCallback = (void (**)(id, NFSession *))self->_didStartCallback;
  if (didStartCallback)
  {
    if (a3)
      v5 = 0;
    else
      v5 = self;
    didStartCallback[2](didStartCallback, v5);
    v6 = self->_didStartCallback;
    self->_didStartCallback = 0;

  }
}

- (void)_invokeDidEndSession
{
  void (**didEndCallback)(id, NFSession *);
  id v4;

  didEndCallback = (void (**)(id, NFSession *))self->_didEndCallback;
  if (didEndCallback)
  {
    didEndCallback[2](didEndCallback, self);
    v4 = self->_didEndCallback;
    self->_didEndCallback = 0;

  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[NFSession proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("No connection to nfcd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 0, v9);
    v4[2](v4, v10);

  }
  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[NFSession proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("No connection to nfcd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 0, v9);
    v4[2](v4, v10);

  }
  return v6;
}

- (void)prioritizeSession
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_19B5EB000, "prioritizeSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  if (self->_state != 2)
  {
    -[NFSession proxy](self, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__NFSession_prioritizeSession__block_invoke;
    v7[3] = &unk_1E3B51410;
    v7[4] = self;
    v7[5] = a2;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prioritizeSessionWithCompletion:", &__block_literal_global_27_0);

  }
}

void __30__NFSession_prioritizeSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 313, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 313;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

- (id)createSessionHandoffToken:(id *)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  os_activity_scope_state_s state;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = _os_activity_create(&dword_19B5EB000, "createSessionHandoffToken:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  -[NFSession proxy](self, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__NFSession_createSessionHandoffToken___block_invoke;
  v13[3] = &unk_1E3B51998;
  v13[5] = &state;
  v13[6] = a2;
  v13[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __39__NFSession_createSessionHandoffToken___block_invoke_28;
  v12[3] = &unk_1E3B52FD8;
  v12[4] = &state;
  v12[5] = &v14;
  objc_msgSend(v9, "createHandoffTokenWithCompletion:", v12);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __39__NFSession_createSessionHandoffToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 326, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 67110146;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 2082;
    v25 = v16;
    v26 = 1024;
    v27 = 326;
    v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v3;

}

void __39__NFSession_createSessionHandoffToken___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (id)activateWithToken:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[7];
  os_activity_scope_state_s state;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "activateWithToken:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  -[NFSession proxy](self, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__NFSession_activateWithToken___block_invoke;
  v13[3] = &unk_1E3B51998;
  v13[5] = &state;
  v13[6] = a2;
  v13[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __31__NFSession_activateWithToken___block_invoke_30;
  v12[3] = &unk_1E3B51D20;
  v12[4] = &state;
  objc_msgSend(v9, "activateWithToken:completion:", v5, v12);

  v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

void __31__NFSession_activateWithToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 349, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 67110146;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 2082;
    v25 = v16;
    v26 = 1024;
    v27 = 349;
    v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v3;

}

void __31__NFSession_activateWithToken___block_invoke_30(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)handleSessionSuspended:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  const void **v15;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  id WeakRetained;
  char v28;
  id v29;
  const char *ClassName;
  const char *Name;
  const char *sel;
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "NF_numberForKey:", CFSTR("ReasonCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NF_dataForKey:", CFSTR("Field"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    v33 = 0;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v12, v7, &v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v33;

    if (v14)
    {
      sel = a2;
      v15 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v17 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(sel);
        v20 = 45;
        if (isMetaClass)
          v20 = 43;
        v17(3, "%c[%{public}s %{public}s]:%i Archive error=%{public}@", v20, ClassName, Name, 375, v14);
      }
      dispatch_get_specific(*v15);
      NFSharedLogGetLogger();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        v24 = object_getClassName(self);
        v25 = sel_getName(sel);
        *(_DWORD *)buf = 67110146;
        v35 = v23;
        v36 = 2082;
        v37 = v24;
        v38 = 2082;
        v39 = v25;
        v40 = 1024;
        v41 = 375;
        v42 = 2114;
        v43 = v14;
        _os_log_impl(&dword_19B5EB000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Archive error=%{public}@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v5, "NF_dataForKey:", CFSTR("Token"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    v29 = objc_loadWeakRetained((id *)&self->_sessionDelegate);
    objc_msgSend(v29, "handleSessionSuspended:token:reason:field:", self, v26, objc_msgSend(v6, "integerValue"), v13);

  }
}

- (void)handleSessionResumed
{
  NFSessionDelegate **p_sessionDelegate;
  id WeakRetained;
  char v5;
  id v6;

  p_sessionDelegate = &self->_sessionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_sessionDelegate);
    objc_msgSend(v6, "handleSessionResumed:", self);

  }
}

- (unint64_t)state
{
  return self->_state;
}

- (NFSessionDelegate)sessionDelegate
{
  return (NFSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (id)didStartCallback
{
  return self->_didStartCallback;
}

- (id)didEndCallback
{
  return self->_didEndCallback;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_sessionKillSwitch, 0);
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong(&self->_didStartCallback, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
