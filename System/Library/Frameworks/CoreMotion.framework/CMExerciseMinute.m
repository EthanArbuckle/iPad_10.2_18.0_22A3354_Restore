@implementation CMExerciseMinute

- (CMExerciseMinute)init
{
  CMExerciseMinute *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMExerciseMinute;
  v2 = -[CMExerciseMinute init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMExerciseMinuteInternal);
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
  block[2] = sub_18F3DA428;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMExerciseMinute;
  -[CMExerciseMinute dealloc](&v4, sel_dealloc);
}

+ (BOOL)isExerciseMinuteAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  sub_18F1F77DC();
  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageNatalimetryAvailable", v4, v5);
}

+ (id)maxExerciseMinuteDataEntries
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(CMExerciseMinuteData, sel_maxExerciseMinuteDataEntries);
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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMExerciseMinute.mm"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F3DA534;
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
  v4[2] = sub_18F3DA5B8;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;
  _QWORD v10[6];

  if (!a3)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMExerciseMinute.mm"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F3DA684;
  v10[3] = &unk_1E2955B38;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10, v3, v4);
}

- (void)queryExerciseMinutesFromRecord:(id)a3 handler:(id)a4
{
  uint64_t v4;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v12;
  const char *v13;

  if (!a4)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMExerciseMinute.mm"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (qword_1ECEDF868 != -1)
    dispatch_once(&qword_1ECEDF868, &unk_1E29551A8);
  if (qword_1ECEDF860 == 3)
  {
    v8 = (void *)objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
    objc_msgSend__queryExerciseMinutesFromRecord_handler_(v8, v9, (uint64_t)a3, (uint64_t)a4, v10);
  }
}

- (CMExerciseMinuteInternal)_internal
{
  return self->_internal;
}

@end
