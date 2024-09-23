@implementation CPLCallObserver

- (CPLCallObserver)initWithObject:(id)a3 selector:(SEL)a4
{
  id v6;
  id v7;
  BOOL isClass;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_source_t v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD handler[4];
  id v22;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPLCallObserver;
  v7 = -[CPLCallObserver init](&v23, sel_init);
  if (v7)
  {
    isClass = object_isClass(v6);
    *((_BYTE *)v7 + 56) = isClass;
    v9 = (uint64_t)v6;
    if (!isClass)
      v9 = objc_opt_class();
    *((_QWORD *)v7 + 5) = v9;
    *((_QWORD *)v7 + 6) = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v10;

    CPLCopyDefaultSerialQueueAttributes();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.cpl.callobserver", v12);
    v14 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v13;

    v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v7 + 1));
    v16 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v15;

    v17 = *((_QWORD *)v7 + 2);
    v18 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v17, v18, 0x6FC23AC00uLL, 0x3B9ACA00uLL);
    v19 = *((_QWORD *)v7 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__CPLCallObserver_initWithObject_selector___block_invoke;
    handler[3] = &unk_1E60D65B8;
    v22 = v7;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_activate(*((dispatch_object_t *)v7 + 2));

  }
  return (CPLCallObserver *)v7;
}

- (void)callDidFinish
{
  NSObject *queue;
  double v4;
  double v5;
  NSObject *v6;
  const char *v7;
  Class aClass;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  Class v13;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  Class v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CPLCallObserver_callDidFinish__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(queue, block);
  -[NSDate timeIntervalSinceNow](self->_startDate, "timeIntervalSinceNow");
  v5 = -v4;
  if (v4 < -2.0)
  {
    if (_CPLSilentLogging)
      return;
    __CPLObserverOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    if (self->_objectIsClass)
      v7 = "+";
    else
      v7 = "-";
    aClass = self->_aClass;
    NSStringFromSelector(self->_selector);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = v7;
    v17 = 2114;
    v18 = aClass;
    v19 = 2114;
    v20 = v9;
    v21 = 2048;
    v22 = v5;
    v10 = v6;
    v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_14;
  }
  if (_CPLSilentLogging)
    return;
  __CPLObserverOSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (self->_objectIsClass)
      v12 = "+";
    else
      v12 = "-";
    v13 = self->_aClass;
    NSStringFromSelector(self->_selector);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v9;
    v21 = 2048;
    v22 = v5;
    v10 = v6;
    v11 = OS_LOG_TYPE_DEBUG;
LABEL_14:
    _os_log_impl(&dword_1B03C2000, v10, v11, "%s[%{public}@ %{public}@] completed in %.3fs", buf, 0x2Au);

  }
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __32__CPLCallObserver_callDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

void __43__CPLCallObserver_initWithObject_selector___block_invoke(uint64_t a1)
{
  BOOL v1;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    v1 = _CPLSilentLogging == 0;
  else
    v1 = 0;
  if (v1)
  {
    __CPLObserverOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v4 + 56))
        v5 = "+";
      else
        v5 = "-";
      v6 = *(_QWORD *)(v4 + 40);
      NSStringFromSelector(*(SEL *)(v4 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "timeIntervalSinceNow");
      v9 = 136315906;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      v15 = 2048;
      v16 = -v8;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "%s[%{public}@ %{public}@] has not completed after %.0fs", (uint8_t *)&v9, 0x2Au);

    }
  }
}

+ (void)observeSyncCallOn:(id)a3 selector:(SEL)a4 block:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  CPLCallObserver *v9;

  v7 = (void (**)(_QWORD))a5;
  v8 = a3;
  v9 = -[CPLCallObserver initWithObject:selector:]([CPLCallObserver alloc], "initWithObject:selector:", v8, a4);

  v7[2](v7);
  -[CPLCallObserver callDidFinish](v9, "callDidFinish");

}

+ (void)observeAsyncCallOn:(id)a3 selector:(SEL)a4 block:(id)a5
{
  void (**v7)(id, CPLCallObserver *);
  id v8;
  CPLCallObserver *v9;

  v7 = (void (**)(id, CPLCallObserver *))a5;
  v8 = a3;
  v9 = -[CPLCallObserver initWithObject:selector:]([CPLCallObserver alloc], "initWithObject:selector:", v8, a4);

  v7[2](v7, v9);
}

@end
