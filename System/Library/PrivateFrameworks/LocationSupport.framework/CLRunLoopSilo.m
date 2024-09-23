@implementation CLRunLoopSilo

- (CLRunLoopSilo)initWithCurrentRunLoopAndIdentifier:(id)a3 bePermissive:(BOOL)a4
{
  CLRunLoopSilo *result;

  result = -[CLRunLoopSilo initWithCurrentRunLoopAndIdentifier:](self, "initWithCurrentRunLoopAndIdentifier:", a3);
  if (result)
    result->_useCLPermissiveTimer = a4;
  return result;
}

- (CLRunLoopSilo)initWithCurrentRunLoopAndIdentifier:(id)a3
{
  CLRunLoopSilo *v3;
  CLRunLoopSiloThread *v4;
  CLRunLoopSiloThread *siloThread;
  CLRunLoopSilo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLRunLoopSilo;
  v3 = -[CLSilo initWithIdentifier:](&v8, sel_initWithIdentifier_, a3);
  if (v3
    && (v4 = -[CLRunLoopSiloThread initWithCurrentThread]([CLRunLoopSiloThread alloc], "initWithCurrentThread"), siloThread = v3->_siloThread, v3->_siloThread = v4, siloThread, !v3->_siloThread))
  {
    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (void)async:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CLRunLoopSiloThread underlyingRunLoop](self->_siloThread, "underlyingRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A1A02914;
  v7[3] = &unk_1E45FB910;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siloThread, 0);
}

- (CLRunLoopSilo)initWithIdentifier:(id)a3
{
  id v4;
  CLRunLoopSilo *v5;
  void *v6;
  char *v7;
  char **__ptr32 *v8;
  void *v9;
  CLRunLoopSiloThread *v11;
  CLRunLoopSiloThread *siloThread;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  CLRunLoopSilo *v16;
  char **__ptr32 *v17;
  objc_super v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLRunLoopSilo;
  v5 = -[CLSilo initWithIdentifier:](&v18, sel_initWithIdentifier_, v4);
  if (v5)
  {
    +[CLSilo globalConfiguration](CLSilo, "globalConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NameToCohortMap"));
    v7 = (char *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (char **__ptr32 *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("default"));
      v8 = (char **__ptr32 *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v11 = objc_alloc_init(CLRunLoopSiloThread);
        siloThread = v5->_siloThread;
        v5->_siloThread = v11;

        goto LABEL_6;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A1A097D4;
    v15[3] = &unk_1E45FB8E8;
    v16 = v5;
    v8 = v8;
    v17 = v8;
    if (qword_1ECE24E50 != -1)
      goto LABEL_17;
    while (1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECE24E40);
      sub_1A1A097D4((uint64_t)v15, (void *)qword_1ECE24E48);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24E40);

      v4 = v9;
LABEL_6:
      if (v5->_siloThread)
        break;
      sub_1A1A091BC();
      v13 = objc_claimAutoreleasedReturnValue();
      v8 = &off_1A1A18000;
      v9 = &unk_1A1A18FAF;
      v7 = "_siloThread";
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        v20 = 0;
        v21 = 2082;
        v22 = &unk_1A1A18FAF;
        v23 = 2082;
        v24 = "assert";
        v25 = 2081;
        v26 = "_siloThread";
        _os_log_impl(&dword_1A19F4000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSiloThread failed to init\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A1A091BC();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 68289539;
        v20 = 0;
        v21 = 2082;
        v22 = &unk_1A1A18FAF;
        v23 = 2082;
        v24 = "assert";
        v25 = 2081;
        v26 = "_siloThread";
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSiloThread failed to init", "{\"msg%{public}.0s\":\"CLRunLoopSiloThread failed to init\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      sub_1A1A091BC();
      v5 = (CLRunLoopSilo *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        v20 = 0;
        v21 = 2082;
        v22 = &unk_1A1A18FAF;
        v23 = 2082;
        v24 = "assert";
        v25 = 2081;
        v26 = "_siloThread";
        _os_log_impl(&dword_1A19F4000, &v5->super.super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSiloThread failed to init\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }

      abort_report_np();
LABEL_17:
      dispatch_once(&qword_1ECE24E50, &unk_1E45FB980);
    }

  }
  return v5;
}

- (CLRunLoopSilo)initWithUnderlyingRunLoop:(__CFRunLoop *)a3
{
  void *v5;
  CLRunLoopSilo *v6;
  CLRunLoopSiloThread *v7;
  CLRunLoopSiloThread *siloThread;
  CLRunLoopSilo *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RunLoop: %p"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFRunLoopGetCurrent() == a3)
  {
    v6 = -[CLRunLoopSilo initWithCurrentRunLoopAndIdentifier:](self, "initWithCurrentRunLoopAndIdentifier:", v5);
LABEL_6:
    v6 = v6;
    v9 = v6;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)CLRunLoopSilo;
  v6 = -[CLSilo initWithIdentifier:](&v11, sel_initWithIdentifier_, v5);
  if (!v6)
    goto LABEL_6;
  v7 = -[CLRunLoopSiloThread initWithRunLoop:]([CLRunLoopSiloThread alloc], "initWithRunLoop:", a3);
  siloThread = v6->_siloThread;
  v6->_siloThread = v7;

  if (v6->_siloThread)
    goto LABEL_6;
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)runloop
{
  return -[CLRunLoopSiloThread underlyingRunLoop](self->_siloThread, "underlyingRunLoop");
}

- (id)getTimeCoercibleVariantInstance
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support time coercion. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
  }
}

- (BOOL)inPermissiveMode
{
  return self->_useCLPermissiveTimer;
}

- (void)assertInside
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CLRunLoopSiloThread underlyingRunLoop](self->_siloThread, "underlyingRunLoop");
  if (v3 != (id)objc_claimAutoreleasedReturnValue())
    __assert_rtn("-[CLRunLoopSilo assertInside]", "CLRunLoopSilo.m", 285, "[NSRunLoop currentRunLoop] == _siloThread.underlyingRunLoop");

}

- (void)assertOutside
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CLRunLoopSiloThread underlyingRunLoop](self->_siloThread, "underlyingRunLoop");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
    __assert_rtn("-[CLRunLoopSilo assertOutside]", "CLRunLoopSilo.m", 290, "[NSRunLoop currentRunLoop] != _siloThread.underlyingRunLoop");

}

- (void)suspend
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
  }
}

- (void)resume
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support resume. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support resume. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support resume. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support resume. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
  }
}

- (BOOL)isSuspended
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444", "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLRunLoopSilo doesn't support suspend or resume yet. See rdar://problem/45973444\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
  }
}

- (double)currentLatchedAbsoluteTimestamp
{
  return self->super._currentLatchedAbsoluteTimestamp;
}

- (id)newTimer
{
  CLRunLoopTimerScheduler *v3;
  __objc2_class **v4;
  void *v5;

  v3 = -[CLRunLoopTimerScheduler initWithRunLoopSilo:]([CLRunLoopTimerScheduler alloc], "initWithRunLoopSilo:", self);
  if (self->_useCLPermissiveTimer)
    v4 = off_1E45FA720;
  else
    v4 = &off_1E45FA748;
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initInSilo:withScheduler:", self, v3);

  return v5;
}

- (void)sync:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[2];

  v4 = a3;
  v9[0] = 0;
  v9[1] = 0;
  -[CLRunLoopSiloThread threadId](self->_siloThread, "threadId");
  pthread_dependency_init_np();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A1A0A42C;
  v6[3] = &unk_1E45FB938;
  v7 = v4;
  v8 = v9;
  v5 = v4;
  -[CLRunLoopSilo async:](self, "async:", v6);
  pthread_dependency_wait_np();

}

- (void)afterInterval:(double)a3 async:(id)a4
{
  CLRunLoopSiloThread *siloThread;
  id v6;
  void *v7;
  id v8;

  siloThread = self->_siloThread;
  v6 = a4;
  -[CLRunLoopSiloThread underlyingRunLoop](siloThread, "underlyingRunLoop");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(v6);

  objc_msgSend(v8, "performSelector:withObject:afterDelay:", sel_async_, v7, a3);
}

- (id)debugDescription
{
  void *v2;
  NSString *identifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->super._identifier;
  -[CLRunLoopSiloThread underlyingRunLoop](self->_siloThread, "underlyingRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CLRunLoopSilo: %@ - %@"), identifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)heartBeat:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CLRunLoopSilo *v9;

  v4 = a3;
  -[CLRunLoopSiloThread underlyingRunLoop](self->_siloThread, "underlyingRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A1A0A5F8;
  v7[3] = &unk_1E45FB960;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

@end
