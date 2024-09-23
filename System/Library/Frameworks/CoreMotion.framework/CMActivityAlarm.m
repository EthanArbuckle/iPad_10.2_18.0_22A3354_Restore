@implementation CMActivityAlarm

+ (BOOL)activityAlarmAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((sub_18F1F7758() & 1) != 0 || !objc_msgSend_sharedInstance(CMActivityAlarmProxy, v2, v3, v4, v5))
    return 0;
  v10 = (void *)objc_msgSend_sharedInstance(CMActivityAlarmProxy, v6, v7, v8, v9);
  return objc_msgSend_activityAlarmAvailable(v10, v11, v12, v13, v14);
}

+ (id)activityAlarmInfo
{
  return (id)sub_18F459908();
}

- (CMActivityAlarm)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6
{
  uint64_t v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v33;
  const char *v34;
  char *v35;
  objc_super v36;
  uint8_t buf[1640];
  uint64_t v38;

  v9 = *(_QWORD *)&a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x1C)
  {
    v33 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, (uint64_t)a5, (uint64_t)a6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMActivityAlarm.mm"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trigger < kActivityAlarmTriggerCount"));
  }
  if ((objc_msgSend_activityAlarmAvailable(CMActivityAlarm, a2, *(uint64_t *)&a3, (uint64_t)a5, (uint64_t)a6) & 1) == 0)goto LABEL_11;
  v36.receiver = self;
  v36.super_class = (Class)CMActivityAlarm;
  self = -[CMActivityAlarm init](&v36, sel_init);
  if (!objc_msgSend_sharedInstance(CMActivityAlarmProxy, v11, v12, v13, v14))
  {
    if (qword_1EE16D468 != -1)
      dispatch_once(&qword_1EE16D468, &unk_1E29541E8);
    v30 = qword_1EE16D460;
    if (os_log_type_enabled((os_log_t)qword_1EE16D460, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_FAULT, "Unable to create sharedInstance of CMActivityAlarmProxy.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D468 != -1)
        dispatch_once(&qword_1EE16D468, &unk_1E29541E8);
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMActivityAlarm initWithTrigger:duration:onQueue:withHandler:]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf)
        free(v35);
    }
LABEL_11:

    return 0;
  }
  self->fIsValid = 1;
  self->fRunLoop = 0;
  dispatch_retain((dispatch_object_t)a5);
  self->fQueue = (OS_dispatch_queue *)a5;
  self->fHandler = _Block_copy(a6);
  objc_msgSend_setDuration_(self, v15, v16, v17, v18, a4);
  objc_msgSend_setTrigger_(self, v19, v9, v20, v21);
  v26 = (void *)objc_msgSend_sharedInstance(CMActivityAlarmProxy, v22, v23, v24, v25);
  objc_msgSend_listenForActivityAlarm_(v26, v27, (uint64_t)self, v28, v29);
  return self;
}

- (CMActivityAlarm)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6
{
  uint64_t v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v33;
  const char *v34;
  char *v35;
  objc_super v36;
  uint8_t buf[1640];
  uint64_t v38;

  v9 = *(_QWORD *)&a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x1C)
  {
    v33 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, (uint64_t)a5, (uint64_t)a6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMActivityAlarm.mm"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trigger < kActivityAlarmTriggerCount"));
  }
  if ((objc_msgSend_activityAlarmAvailable(CMActivityAlarm, a2, *(uint64_t *)&a3, (uint64_t)a5, (uint64_t)a6) & 1) == 0)goto LABEL_11;
  v36.receiver = self;
  v36.super_class = (Class)CMActivityAlarm;
  self = -[CMActivityAlarm init](&v36, sel_init);
  if (!objc_msgSend_sharedInstance(CMActivityAlarmProxy, v11, v12, v13, v14))
  {
    if (qword_1EE16D468 != -1)
      dispatch_once(&qword_1EE16D468, &unk_1E29541E8);
    v30 = qword_1EE16D460;
    if (os_log_type_enabled((os_log_t)qword_1EE16D460, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_FAULT, "Unable to create sharedInstance of CMActivityAlarmProxy.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D468 != -1)
        dispatch_once(&qword_1EE16D468, &unk_1E29541E8);
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMActivityAlarm initWithTrigger:duration:onRunLoop:withHandler:]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf)
        free(v35);
    }
LABEL_11:

    return 0;
  }
  self->fIsValid = 1;
  self->fRunLoop = a5;
  self->fQueue = 0;
  self->fHandler = _Block_copy(a6);
  objc_msgSend_setDuration_(self, v15, v16, v17, v18, a4);
  objc_msgSend_setTrigger_(self, v19, v9, v20, v21);
  v26 = (void *)objc_msgSend_sharedInstance(CMActivityAlarmProxy, v22, v23, v24, v25);
  objc_msgSend_listenForActivityAlarm_(v26, v27, (uint64_t)self, v28, v29);
  return self;
}

- (void)setActivityDuration:(double)a3
{
  self->_activityDuration = a3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_invalidate(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)CMActivityAlarm;
  -[CMActivityAlarm dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  NSObject *fQueue;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    _Block_release(self->fHandler);
    self->fHandler = 0;
    fQueue = self->fQueue;
    if (fQueue)
    {
      dispatch_release(fQueue);
      self->fQueue = 0;
    }
    self->fRunLoop = 0;
    objc_sync_exit(self);
    v8 = objc_msgSend_sharedInstance(CMActivityAlarmProxy, v4, v5, v6, v7);
    MEMORY[0x1E0DE7D20](v8, sel_stopListeningForActivityAlarm_, self, v9, v10);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (BOOL)isValid
{
  BOOL fIsValid;

  objc_sync_enter(self);
  fIsValid = self->fIsValid;
  objc_sync_exit(self);
  return fIsValid;
}

- (void)fire
{
  uint64_t v3;
  void *v4;
  __CFRunLoop *fRunLoop;
  const void *v6;
  void *v7;
  NSObject *fQueue;
  _QWORD v9[6];
  _QWORD block[6];

  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    v3 = MEMORY[0x1E0C809B0];
    if (self->fRunLoop)
    {
      v4 = _Block_copy(self->fHandler);
      fRunLoop = self->fRunLoop;
      v6 = (const void *)*MEMORY[0x1E0C9B280];
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = sub_18F4AF5E8;
      block[3] = &unk_1E2955B60;
      block[4] = self;
      block[5] = v4;
      CFRunLoopPerformBlock(fRunLoop, v6, block);
      CFRunLoopWakeUp(self->fRunLoop);
      self->fRunLoop = 0;
    }
    if (self->fQueue)
    {
      v7 = _Block_copy(self->fHandler);
      fQueue = self->fQueue;
      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = sub_18F4AF61C;
      v9[3] = &unk_1E2955B60;
      v9[4] = self;
      v9[5] = v7;
      dispatch_async(fQueue, v9);
      dispatch_release((dispatch_object_t)self->fQueue);
      self->fQueue = 0;
    }
    _Block_release(self->fHandler);
    self->fHandler = 0;
  }
  objc_sync_exit(self);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unsigned)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unsigned int)a3
{
  self->_trigger = a3;
}

- (double)activityDuration
{
  return self->_activityDuration;
}

@end
