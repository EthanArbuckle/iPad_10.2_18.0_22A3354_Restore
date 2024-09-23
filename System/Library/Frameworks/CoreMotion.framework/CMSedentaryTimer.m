@implementation CMSedentaryTimer

- (CMSedentaryTimer)init
{
  CMSedentaryTimer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMSedentaryTimer;
  v2 = -[CMSedentaryTimer init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMSedentaryTimer_Internal);
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend__teardown(self->_internal, a2, v2, v3, v4);

  v6.receiver = self;
  v6.super_class = (Class)CMSedentaryTimer;
  -[CMSedentaryTimer dealloc](&v6, sel_dealloc);
}

+ (BOOL)isAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  sub_18F1F77DC();
  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageSedentaryTimerIsAvailable", v4, v5);
}

- (BOOL)isActive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend__internal(self, a2, v2, v3, v4);
  return MEMORY[0x1E0DE7D20](v5, sel__isActive, v6, v7, v8);
}

- (void)startTimerWithStartTime:(id)a3 periodInterval:(double)a4 reminderInterval:(double)a5 autoReschedule:(BOOL)a6 handler:(id)a7
{
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD block[9];
  BOOL v20;

  if (!a7)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a6, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSedentaryTimer.mm"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    if (a3)
      goto LABEL_3;
LABEL_5:
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a6, (uint64_t)a7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSedentaryTimer.mm"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startTime"));
    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v14 = *(NSObject **)(objc_msgSend__internal(self, a2, (uint64_t)a3, a6, (uint64_t)a7) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3509E0;
  block[3] = &unk_1E2955BB0;
  *(double *)&block[7] = a4;
  *(double *)&block[8] = a5;
  v20 = a6;
  block[4] = a3;
  block[5] = self;
  block[6] = a7;
  dispatch_async(v14, block);
}

- (void)stopTimerWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSedentaryTimer.mm"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v7 = *(NSObject **)(objc_msgSend__internal(self, a2, (uint64_t)a3, v3, v4) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F350D60;
  block[3] = &unk_1E2955B38;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v7, block);
}

- (void)queryAlarmDataSince:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  void *v10;
  const char *v11;
  _QWORD block[7];

  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSedentaryTimer.mm"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryHandler"));
  }
  v8 = *(NSObject **)(objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, v4) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F351000;
  block[3] = &unk_1E2955BD8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(v8, block);
}

- (void)registerForAlarmsWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSedentaryTimer.mm"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler"));
  }
  v7 = *(NSObject **)(objc_msgSend__internal(self, a2, (uint64_t)a3, v3, v4) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F351318;
  block[3] = &unk_1E2955B38;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v7, block);
}

- (CMSedentaryTimer_Internal)_internal
{
  return self->_internal;
}

@end
