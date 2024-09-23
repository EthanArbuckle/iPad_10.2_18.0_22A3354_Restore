@implementation CMHealthTracker

- (CMHealthTracker)init
{
  CMHealthTracker *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMHealthTracker;
  v2 = -[CMHealthTracker init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMHealthTrackerInternal);
  return v2;
}

- (void)dealloc
{
  NSObject *fInternalQueue;
  objc_super v4;
  _QWORD block[5];

  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F40D3B4;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMHealthTracker;
  -[CMHealthTracker dealloc](&v4, sel_dealloc);
}

+ (BOOL)isMetMinutesAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

+ (int64_t)isAuthorizedForMetMinutes
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, (uint64_t)CFSTR("com.apple.locationd.metminutes"), v2, v3);
}

- (void)queryMetMinutesFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMHealthTracker.mm"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toDate"));
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMHealthTracker.mm"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_4;
  }
  v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, (uint64_t)a5);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMHealthTracker.mm"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromDate"));
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v10 = objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  MEMORY[0x1E0DE7D20](v10, sel__queryMetMinutesFromDate_toDate_handler_, a3, a4, a5);
}

+ (BOOL)isVO2MaxDataAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

+ (int64_t)isAuthorizedForVO2MaxData
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, (uint64_t)CFSTR("com.apple.locationd.vo2max"), v2, v3);
}

- (void)queryVO2MaxInputsFromRecord:(id)a3 handler:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;

  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMHealthTracker.mm"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v8 = objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  MEMORY[0x1E0DE7D20](v8, sel__queryVO2MaxInputsFromRecord_handler_, a3, a4, v12);
}

- (CMHealthTrackerInternal)_internal
{
  return self->_internal;
}

@end
