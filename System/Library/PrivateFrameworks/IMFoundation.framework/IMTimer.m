@implementation IMTimer

- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8
{
  return (IMTimer *)MEMORY[0x1E0DE7D20](self, sel_initWithTimeInterval_name_shouldWake_target_selector_userInfo_useCurrentRunLoop_, a4, a5);
}

- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 useCurrentRunLoop:(BOOL)a9
{
  return (IMTimer *)objc_msgSend__initWithTimeInterval_name_shouldWake_target_selector_userInfo_useCurrentRunLoop_queue_(self, a2, (uint64_t)a4, a5, a6, a7, a8, a9, a3, 0);
}

- (IMTimer)initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 queue:(id)a9
{
  return (IMTimer *)objc_msgSend__initWithTimeInterval_name_shouldWake_target_selector_userInfo_useCurrentRunLoop_queue_(self, a2, (uint64_t)a4, a5, a6, a7, a8, 0, a3, a9);
}

- (id)_initWithTimeInterval:(double)a3 name:(id)a4 shouldWake:(BOOL)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 useCurrentRunLoop:(BOOL)a9 queue:(id)a10
{
  id v18;
  id v19;
  IMTimer *v20;
  IMTimer *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  id timer;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  objc_super v37;

  v34 = a4;
  v36 = a6;
  v18 = a8;
  v19 = a10;
  if (a3 < 0.001)
    a3 = 5.0;
  v37.receiver = self;
  v37.super_class = (Class)IMTimer;
  v20 = -[IMTimer init](&v37, sel_init, v34);
  v21 = v20;
  if (v20)
  {
    v20->_wakeDevice = a5;
    objc_storeStrong(&v20->_target, a6);
    v21->_selector = a7;
    v21->_timeInterval = a3;
    v21->_useCurrentRunLoop = a9;
    objc_storeStrong(&v21->_userInfo, a8);
    objc_storeStrong((id *)&v21->_name, a4);
    if (v19)
      objc_storeStrong((id *)&v21->_queue, a10);
    if (a5 || v21->_queue)
    {
      objc_msgSend__reschedulePCPersistentTimer(v21, v22, v23, v24);
    }
    else
    {
      objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x1E0C99E88], v22, (uint64_t)v36, (uint64_t)a7, v18, 0, a3);
      v26 = objc_claimAutoreleasedReturnValue();
      timer = v21->_timer;
      v21->_timer = (id)v26;

      if (a9 || !objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v28, v29, v30))
      {
        objc_msgSend_mainRunLoop(MEMORY[0x1E0C99E58], v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_currentRunLoop(MEMORY[0x1E0C99E58], v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v33 = v31;
      objc_msgSend_addTimer_forMode_(v31, v32, (uint64_t)v21->_timer, *MEMORY[0x1E0C99748]);

    }
  }

  return v21;
}

- (void)setFireTimeInterval:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  self->_timeInterval = a3;
  if (self->_wakeDevice || self->_queue)
  {
    objc_msgSend__reschedulePCPersistentTimer(self, a2, v3, v4);
  }
  else
  {
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], a2, v3, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFireDate_(self->_timer, v6, (uint64_t)v8, v7);

  }
}

- (void)_reschedulePCPersistentTimer
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id timer;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  OS_dispatch_queue *queue;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int isMainThread;
  id v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  char v37;

  v3 = (void *)MEMORY[0x19400E788](self, a2);
  objc_msgSend_invalidate(self->_timer, v4, v5, v6);
  timer = self->_timer;
  self->_timer = 0;

  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v8, v9, v10, self->_timeInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)qword_1EE1DD618;
  if (!qword_1EE1DD618)
  {
    v12 = (objc_class *)IMWeakLinkClass(CFSTR("PCPersistentTimer"), CFSTR("PersistentConnection"));
    qword_1EE1DD618 = (uint64_t)v12;
  }
  v13 = [v12 alloc];
  v15 = (void *)objc_msgSend_initWithFireDate_serviceIdentifier_target_selector_userInfo_(v13, v14, (uint64_t)v11, (uint64_t)self->_name, self->_target, self->_selector, self->_userInfo);
  v16 = self->_timer;
  self->_timer = v15;

  objc_msgSend_setMinimumEarlyFireProportion_(self->_timer, v17, v18, v19, 1.0);
  objc_msgSend_setDisableSystemWaking_(self->_timer, v20, !self->_wakeDevice, v21);
  queue = self->_queue;
  if (queue)
  {
    objc_msgSend_scheduleInQueue_(self->_timer, v22, (uint64_t)queue, v23);
  }
  else
  {
    if (!self->_useCurrentRunLoop)
      _IMWarn(CFSTR("creating an IMTimer with shouldWake = YES and useCurrentRunLoop = NO is not supported! Forcing to main run loop anyway"), (uint64_t)v22, 0, v23, v24, v25, v26, v27, v37);
    isMainThread = objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v22, (uint64_t)queue, v23);
    v33 = self->_timer;
    if (isMainThread)
      objc_msgSend_currentRunLoop(MEMORY[0x1E0C99E58], v29, v30, v31);
    else
      objc_msgSend_mainRunLoop(MEMORY[0x1E0C99E58], v29, v30, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheduleInRunLoop_(v33, v35, (uint64_t)v34, v36);

  }
  objc_autoreleasePoolPop(v3);
}

- (NSDate)fireDate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_fireDate(self->_timer, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_fireTime(self->_timer, v7, v8, v9);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return (NSDate *)v6;
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_invalidate(self->_timer, a2, v2, v3);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self->_timer, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMTimer;
  -[IMTimer dealloc](&v5, sel_dealloc);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong(&self->_timer, 0);
}

@end
