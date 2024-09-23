@implementation CMWorkoutManager

- (CMWorkoutManager)init
{
  CMWorkoutManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMWorkoutManager;
  v2 = -[CMWorkoutManager init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMWorkoutManagerInternal);
  return v2;
}

- (void)dealloc
{
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4EFCBC;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMWorkoutManager;
  -[CMWorkoutManager dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  _QWORD block[5];

  internal = self->_internal;
  internal->fDelegate = (CMWorkoutManagerDelegate *)a3;
  internal->fSender = self;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4EFD20;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_async(fInternalQueue, block);
}

- (CMWorkoutManagerDelegate)delegate
{
  return self->_internal->fDelegate;
}

+ (BOOL)isAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  sub_18F1F77DC();
  sub_18F1F77DC();
  if ((sub_18F20C9AC() & 1) != 0)
    return 1;
  else
    return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageNatalimetryAvailable", v4, v5);
}

- (void)startWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  _QWORD block[6];

  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 782, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4EFE34;
  block[3] = &unk_1E29559D0;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)stopWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  _QWORD block[6];

  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 791, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4EFEF4;
  block[3] = &unk_1E29559D0;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

+ (unint64_t)supportedMetricsForWorkoutType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v6 = 0;
  switch(a3)
  {
    case 1:
    case 2:
    case 15:
    case 16:
    case 17:
    case 18:
    case 24:
    case 27:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 49:
      if (objc_msgSend_isPaceAvailable(CMPedometer, a2, a3, v3, v4))
        v6 = 7;
      else
        v6 = 3;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 22:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 40:
    case 47:
    case 48:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
      v6 = 1;
      break;
    case 4:
    case 20:
    case 21:
    case 23:
    case 35:
    case 36:
    case 37:
    case 38:
      v6 = 7;
      break;
    case 19:
      v6 = 15;
      break;
    default:
      break;
  }
  if (sub_18F4223F0(a3) != 66)
  {
    sub_18F1F77DC();
    if (sub_18F376ACC())
      v6 |= 0x10uLL;
  }
  return v6;
}

- (void)getPromptsNeededForWorkoutType:(int64_t)a3 handler:(id)a4
{
  uint64_t v4;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD block[7];

  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 901, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if ((unint64_t)(a3 - 66) <= 0xFFFFFFFFFFFFFFBELL)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 902, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workoutType > kCMWorkoutTypeNoWorkout && workoutType < kCMWorkoutTypeMax"));
  }
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F00A4;
  block[3] = &unk_1E2957130;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)setSuggestedStopTimeout:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v11;
  const char *v12;
  _QWORD block[6];

  if (a3 <= 0.0)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v3, v4, v5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 911, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("seconds > 0"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F0188;
  block[3] = &unk_1E2956590;
  block[4] = internal;
  *(double *)&block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)userDismissedWorkoutAlert
{
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  _QWORD block[5];

  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F01F0;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_async(fInternalQueue, block);
}

- (void)triggerWorkoutLocationUpdateForTesting:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  _QWORD block[6];

  if ((unint64_t)a3 >= 3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 928, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workoutLocation >= kCMWorkoutLocationTypeUnknown && workoutLocation < kCMWorkoutLocationTypeTbd"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F02B0;
  block[3] = &unk_1E2956590;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)muteReminderType:(int64_t)a3 mute:(BOOL)a4
{
  NSObject *fInternalQueue;
  _QWORD block[6];
  BOOL v6;

  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F031C;
  block[3] = &unk_1E29574B8;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(fInternalQueue, block);
}

- (CMWorkoutManagerInternal)_internal
{
  return self->_internal;
}

- (void)beginWorkoutSession:(id)a3 withWorkout:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD block[7];
  BOOL v17;

  if (!a3)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 948, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("overview"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 949, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F0444;
  block[3] = &unk_1E2959608;
  block[4] = internal;
  block[5] = a3;
  block[6] = a4;
  v17 = a5;
  dispatch_async(fInternalQueue, block);
}

- (void)setCurrentWorkoutType:(id)a3 isManualTransition:(BOOL)a4
{
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v11;
  const char *v12;
  _QWORD block[6];
  BOOL v14;

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 958, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F0514;
  block[3] = &unk_1E29580D8;
  block[4] = internal;
  block[5] = a3;
  v14 = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)endWorkoutSession:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  _QWORD block[6];

  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F05D8;
  block[3] = &unk_1E29559D0;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)pauseWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  _QWORD block[6];

  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 976, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F0698;
  block[3] = &unk_1E29559D0;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)resumeWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMWorkoutManagerInternal *internal;
  NSObject *fInternalQueue;
  void *v10;
  const char *v11;
  _QWORD block[6];

  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutManager.mm"), 985, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4F0758;
  block[3] = &unk_1E29559D0;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)snapshotWithCompletion:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->_internal->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4F07C0;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

@end
