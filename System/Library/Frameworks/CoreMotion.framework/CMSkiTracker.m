@implementation CMSkiTracker

- (CMSkiTracker)init
{
  CMSkiTracker *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMSkiTracker;
  v2 = -[CMSkiTracker init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMSkiTrackerInternal);
  return v2;
}

- (void)dealloc
{
  CMSkiTrackerInternal *internal;
  NSObject *fInternalQueue;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F489894;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMSkiTracker;
  -[CMSkiTracker dealloc](&v5, sel_dealloc);
}

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  uint64_t v4;
  void *v9;
  const char *v10;
  _QWORD v11[7];

  if (!a4)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSkiTracker.mm"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F489978;
  v11[3] = &unk_1E2955BD8;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v11, (uint64_t)a4, v4);
}

- (void)stopUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4899FC;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)querySkiUpdatesFromRecord:(id)a3 handler:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;

  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSkiTracker.mm"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (qword_1ECEDFBE8 != -1)
    dispatch_once(&qword_1ECEDFBE8, &unk_1E2955308);
  if (qword_1ECEDFBE0 == 3)
  {
    v8 = objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
    MEMORY[0x1E0DE7D20](v8, sel__queryUpdatesFromRecord_handler_, a3, a4, v12);
  }
}

- (void)startLiveUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;
  _QWORD v10[6];

  if (!a3)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSkiTracker.mm"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F489BC8;
  v10[3] = &unk_1E2955B38;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10, v3, v4);
}

- (void)stopLiveUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F489C4C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (CMSkiTrackerInternal)_internal
{
  return self->_internal;
}

@end
