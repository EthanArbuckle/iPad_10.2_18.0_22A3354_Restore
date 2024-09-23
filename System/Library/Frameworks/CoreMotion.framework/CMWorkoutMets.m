@implementation CMWorkoutMets

- (CMWorkoutMets)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CMWorkoutMets *v6;
  objc_super v8;

  if (!objc_msgSend_isAvailable(CMWorkoutMets, a2, v2, v3, v4))
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)CMWorkoutMets;
  v6 = -[CMWorkoutMets init](&v8, sel_init);
  if (v6)
    v6->_internal = objc_alloc_init(CMWorkoutMetsInternal);
  return v6;
}

- (void)dealloc
{
  NSObject *fInternalQueue;
  objc_super v4;
  _QWORD block[5];

  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F491248;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMWorkoutMets;
  -[CMWorkoutMets dealloc](&v4, sel_dealloc);
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

- (void)queryWorkoutMetsWithSessionId:(id)a3 handler:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;

  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutMets.mm"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (qword_1ECEDFC08 != -1)
    dispatch_once(&qword_1ECEDFC08, &unk_1E2945268);
  if (qword_1ECEDFC00 == 3)
  {
    v8 = objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
    MEMORY[0x1E0DE7D20](v8, sel__queryWorkoutMetsWithSessionId_handler_, a3, a4, v12);
  }
}

- (CMWorkoutMetsInternal)_internal
{
  return self->_internal;
}

@end
