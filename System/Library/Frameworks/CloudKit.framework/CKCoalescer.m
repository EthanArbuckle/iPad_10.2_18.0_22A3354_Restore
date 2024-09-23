@implementation CKCoalescer

- (void)coalesce:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t coalesceStart;
  __uint64_t v22;
  __uint64_t v23;
  BOOL v24;
  uint64_t v25;
  void (**v26)(_QWORD);

  v26 = (void (**)(_QWORD))a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (!self->_finished)
  {
    if (v26)
      v26[2](v26);
    v13 = objc_msgSend_activityDelay(self, v6, v7, v8);
    v17 = objc_msgSend_maxActivityDelay(self, v14, v15, v16);
    v20 = v17;
    coalesceStart = self->_coalesceStart;
    if (!coalesceStart || v17)
    {
      v22 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (!coalesceStart)
        self->_coalesceStart = v22;
      if (v13 && v20)
      {
        v23 = v22 - self->_coalesceStart;
        if (v23 + v13 <= v20)
          goto LABEL_17;
        v24 = v20 >= v23;
        v25 = v20 - v23;
        if (v24)
          v13 = v25;
        else
          v13 = 0;
      }
    }
    if (coalesceStart && !v13)
    {
LABEL_19:
      ++self->_eventCount;
      goto LABEL_20;
    }
LABEL_17:
    objc_msgSend_delayPostBy_(self, v18, v13, v19);
    if (!coalesceStart)
      dispatch_resume((dispatch_object_t)self->_fireTimer);
    goto LABEL_19;
  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v9, v12, v10, (uint64_t)CFSTR("%@ called on an already finished coalescer. Ignored."), v11);

LABEL_20:
  pthread_mutex_unlock(p_lock);

}

- (unint64_t)maxActivityDelay
{
  return self->_maxActivityDelay;
}

- (void)delayPostBy:(unint64_t)a3
{
  __uint64_t v5;
  unint64_t coalesceStart;
  __uint64_t v7;
  unint64_t v8;
  NSObject *fireTimer;
  dispatch_time_t v10;

  v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  coalesceStart = self->_coalesceStart;
  if (coalesceStart)
    v7 = v5 - coalesceStart;
  else
    v7 = 0;
  v8 = v7 + a3;
  if (v7 + a3 > self->_fireDelay)
  {
    fireTimer = self->_fireTimer;
    v10 = dispatch_time(0, a3);
    dispatch_source_set_timer(fireTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    self->_fireDelay = v8;
  }
}

- (unint64_t)activityDelay
{
  return self->_activityDelay;
}

- (void)mutate:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(p_lock);
  if (v5)
    v5[2]();
  pthread_mutex_unlock(p_lock);

}

- (void)postNotice
{
  _opaque_pthread_mutex_t *p_lock;
  __uint64_t v4;
  unint64_t fireDelay;
  __uint64_t v6;
  NSObject *fireTimer;
  dispatch_time_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id notifyBlock;
  _QWORD v19[5];

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (!self->_finished)
  {
    v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    fireDelay = self->_fireDelay;
    v6 = v4 - self->_coalesceStart;
    if (fireDelay <= v6)
    {
      self->_coalesceStart = 0;
      self->_fireDelay = 0;
      dispatch_suspend((dispatch_object_t)self->_fireTimer);
      v12 = objc_msgSend_coalescingInterval(self, v9, v10, v11);
      if (v12)
        objc_msgSend_delayPostBy_(self, v13, v12, v14);
      dispatch_suspend((dispatch_object_t)self->_fireTimer);
      self->_delegateProcessingInProgress = 1;
      notifyBlock = self->_notifyBlock;
      if (notifyBlock)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = sub_18A5F3794;
        v19[3] = &unk_1E1F5FAA8;
        v19[4] = self;
        (*((void (**)(id, _QWORD, _QWORD *))notifyBlock + 2))(notifyBlock, 0, v19);
      }
      else
      {
        objc_msgSend_processingComplete(self, v15, v16, v17);
      }
    }
    else
    {
      fireTimer = self->_fireTimer;
      v8 = dispatch_time(0, fireDelay - v6);
      dispatch_source_set_timer(fireTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (unint64_t)processingDelay
{
  return self->_processingDelay;
}

- (void)processingComplete
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A5F31EC;
  block[3] = &unk_1E1F5FAA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (CKCoalescer)initWithActivityDelay:(unint64_t)a3 maxActivityDelay:(unint64_t)a4 coalescingInterval:(unint64_t)a5 processingDelay:(unint64_t)a6 notifyBlock:(id)a7
{
  id v12;
  CKCoalescer *v13;
  CKCoalescer *v14;
  void *v15;
  id notifyBlock;
  NSObject *v17;
  dispatch_source_t v18;
  OS_dispatch_source *fireTimer;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v12 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CKCoalescer;
  v13 = -[CKCoalescer init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    pthread_mutex_init(&v13->_lock, 0);
    v15 = _Block_copy(v12);
    notifyBlock = v14->_notifyBlock;
    v14->_notifyBlock = v15;

    v14->_activityDelay = a3;
    v14->_maxActivityDelay = a4;
    v14->_coalescingInterval = a5;
    v14->_processingDelay = a6;
    dispatch_get_global_queue(17, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v17);
    fireTimer = v14->_fireTimer;
    v14->_fireTimer = (OS_dispatch_source *)v18;

    objc_initWeak(&location, v14);
    v20 = v14->_fireTimer;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_18A5E51C4;
    v22[3] = &unk_1E1F608C8;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v20, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (unint64_t)coalescingInterval
{
  return self->_coalescingInterval;
}

- (CKCoalescer)initWithNotifyBlock:(id)a3
{
  return (CKCoalescer *)MEMORY[0x1E0DE7D20](self, sel_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_, 0, 0);
}

- (CKCoalescer)initWithNotifyFrequency:(unint64_t)a3 notifyBlock:(id)a4
{
  return (CKCoalescer *)MEMORY[0x1E0DE7D20](self, sel_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_, (0x3B9ACA00 / a3) >> 2, 0x3B9ACA00 / a3);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_delegateProcessingInProgress)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("CKCoalescer deallocated while delegate processing in progress. (Did the delegate invoke the processingComplete block?)"));
  dispatch_source_cancel((dispatch_source_t)self->_fireTimer);
  if (!self->_coalesceStart)
    dispatch_resume((dispatch_object_t)self->_fireTimer);
  v3.receiver = self;
  v3.super_class = (Class)CKCoalescer;
  -[CKCoalescer dealloc](&v3, sel_dealloc);
}

- (void)postFinishedNotice
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v3 = _Block_copy(self->_notifyBlock);
  if (v3)
  {
    dispatch_get_global_queue(17, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_18A7A32B8;
    v5[3] = &unk_1E1F5F730;
    v5[4] = self;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

- (void)finish:(id)a3
{
  void (**v4)(_QWORD);
  _opaque_pthread_mutex_t *p_lock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id notifyBlock;
  uint8_t v11[16];

  v4 = (void (**)(_QWORD))a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_finished)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_FAULT, "-finish: called on an already finished coalescer. Ignored.", v11, 2u);
    }
  }
  else
  {
    if (v4)
      v4[2](v4);
    self->_finished = 1;
    if (!self->_delegateProcessingInProgress)
      objc_msgSend_postFinishedNotice(self, v6, v7, v8);
    notifyBlock = self->_notifyBlock;
    self->_notifyBlock = 0;

  }
  pthread_mutex_unlock(p_lock);

}

- (void)setActivityDelay:(unint64_t)a3
{
  self->_activityDelay = a3;
}

- (void)setMaxActivityDelay:(unint64_t)a3
{
  self->_maxActivityDelay = a3;
}

- (void)setCoalescingInterval:(unint64_t)a3
{
  self->_coalescingInterval = a3;
}

- (void)setProcessingDelay:(unint64_t)a3
{
  self->_processingDelay = a3;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_fireTimer, 0);
}

@end
