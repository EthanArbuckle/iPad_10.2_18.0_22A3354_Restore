@implementation IMDispatchTimer

- (IMDispatchTimer)initWithQueue:(id)a3 interval:(unint64_t)a4 repeats:(BOOL)a5 handlerBlock:(id)a6
{
  _BOOL8 v7;
  NSObject *v10;
  id v11;
  IMDispatchTimer *v12;
  IMDispatchTimer *v13;
  id userInfo;
  dispatch_source_t v15;
  OS_dispatch_source *timerSource;
  void *v17;
  id handlerBlock;
  const char *v19;
  NSObject *v20;
  IMDispatchTimer *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  OS_dispatch_source *v27;
  _QWORD handler[4];
  IMDispatchTimer *v30;
  id v31;
  unint64_t v32;
  objc_super v33;
  uint8_t buf[4];
  IMDispatchTimer *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  OS_dispatch_source *v41;
  __int16 v42;
  NSObject *v43;
  uint64_t v44;

  v7 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v33.receiver = self;
  v33.super_class = (Class)IMDispatchTimer;
  v12 = -[IMDispatchTimer init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    userInfo = v12->_userInfo;
    v12->_userInfo = 0;

    v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
    timerSource = v13->_timerSource;
    v13->_timerSource = (OS_dispatch_source *)v15;

    v13->_isValid = 1;
    v17 = _Block_copy(v11);
    handlerBlock = v13->_handlerBlock;
    v13->_handlerBlock = v17;

    objc_msgSend_updateTimerInterval_repeats_(v13, v19, a4, v7);
    v20 = v13->_timerSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_190689154;
    handler[3] = &unk_1E2C44428;
    v21 = v13;
    v30 = v21;
    v31 = v11;
    v32 = a4;
    dispatch_source_set_event_handler(v20, handler);
    objc_msgSend_timer(IMIDSLog, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = CFSTR("NO");
      v27 = v13->_timerSource;
      *(_DWORD *)buf = 134219010;
      if (v7)
        v26 = CFSTR("YES");
      v35 = v21;
      v36 = 2048;
      v37 = a4;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v27;
      v42 = 2112;
      v43 = v10;
      _os_log_impl(&dword_19066D000, v25, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer init] {self: %p, interval: %llu, repeats: %@, _timerSource: %@, queue: %@}", buf, 0x34u);
    }

    dispatch_resume((dispatch_object_t)v13->_timerSource);
  }

  return v13;
}

- (IMDispatchTimer)initWithQueue:(id)a3 interval:(unint64_t)a4 repeats:(BOOL)a5 userInfo:(id)a6 handlerBlock:(id)a7
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  IMDispatchTimer *v16;
  const char *v17;
  IMDispatchTimer *v18;

  v9 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = [IMDispatchTimer alloc];
  v18 = (IMDispatchTimer *)objc_msgSend_initWithQueue_interval_repeats_handlerBlock_(v16, v17, (uint64_t)v15, a4, v9, v14);

  if (v18)
    objc_storeStrong(&v18->_userInfo, a6);

  return v18;
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  OS_dispatch_source *timerSource;
  NSDate *fireDate;
  id userInfo;
  id handlerBlock;
  int v10;
  IMDispatchTimer *v11;
  __int16 v12;
  OS_dispatch_source *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_isValid)
  {
    if (self->_timerSource)
    {
      objc_msgSend_timer(IMIDSLog, a2, v2, v3);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        timerSource = self->_timerSource;
        v10 = 134218242;
        v11 = self;
        v12 = 2112;
        v13 = timerSource;
        _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer invalidate] {self: %p, _timerSource: %@}", (uint8_t *)&v10, 0x16u);
      }

      dispatch_source_cancel((dispatch_source_t)self->_timerSource);
    }
    fireDate = self->_fireDate;
    self->_fireDate = 0;

    self->_timeInterval = 0.0;
    *(_WORD *)&self->_isValid = 0;
    userInfo = self->_userInfo;
    self->_userInfo = 0;

    handlerBlock = self->_handlerBlock;
    self->_handlerBlock = 0;

  }
}

- (void)updateTimerInterval:(unint64_t)a3 repeats:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  NSDate *v8;
  NSDate *v9;
  unint64_t v10;
  dispatch_time_t v11;
  NSDate *fireDate;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  OS_dispatch_source *timerSource;
  const __CFString *v19;
  int v20;
  IMDispatchTimer *v21;
  __int16 v22;
  OS_dispatch_source *v23;
  __int16 v24;
  dispatch_time_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_isValid)
  {
    v4 = a4;
    self->_timeInterval = (double)a3;
    v7 = a3 != -1 && a4;
    self->_repeats = v7;
    if (a3 == -1)
    {
      fireDate = self->_fireDate;
      self->_fireDate = 0;

      v11 = -1;
      v10 = -1000000000;
    }
    else
    {
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], a2, a3, a4);
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v9 = self->_fireDate;
      self->_fireDate = v8;

      v10 = 1000000000 * a3;
      v11 = dispatch_time(0, 1000000000 * a3);
    }
    if (v7)
      v13 = v10;
    else
      v13 = -1;
    dispatch_source_set_timer((dispatch_source_t)self->_timerSource, v11, v13, 0x5F5E100uLL);
    objc_msgSend_timer(IMIDSLog, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      timerSource = self->_timerSource;
      v19 = CFSTR("NO");
      v20 = 134219522;
      if (v4)
        v19 = CFSTR("YES");
      v21 = self;
      v22 = 2112;
      v23 = timerSource;
      v24 = 2048;
      v25 = v11;
      v26 = 2048;
      v27 = v13;
      v28 = 2048;
      v29 = 100000000;
      v30 = 2048;
      v31 = a3;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_19066D000, v17, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer update] {self: %p, _timerSource: %@, timerStart: %llu, timerInterval: %llu, timerLeeway: %llu, newInterval: %llu, repeats: %@}", (uint8_t *)&v20, 0x48u);
    }

  }
}

- (void)stop
{
  objc_msgSend_updateTimerInterval_repeats_(self, a2, -1, 0);
}

- (void)fire
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if (self->_isValid)
  {
    (*((void (**)(void))self->_handlerBlock + 2))();
    if (!self->_repeats)
      objc_msgSend_invalidate(self, v3, v4, v5);
  }
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_fireDate, a3);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong(&self->_userInfo, 0);
}

@end
