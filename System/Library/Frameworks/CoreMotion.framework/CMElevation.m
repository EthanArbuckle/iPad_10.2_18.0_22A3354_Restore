@implementation CMElevation

- (CMElevation)init
{
  CMElevation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMElevation;
  v2 = -[CMElevation init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMAltimeterInternal);
  return v2;
}

- (void)dealloc
{
  NSObject *value;
  objc_super v4;
  _QWORD block[5];

  value = self->_internal->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C8A14;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(value, block);

  v4.receiver = self;
  v4.super_class = (Class)CMElevation;
  -[CMElevation dealloc](&v4, sel_dealloc);
}

+ (BOOL)isElevationAvailable
{
  sub_18F1F77DC();
  return 0;
}

- (void)startElevationUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;
  _QWORD v10[6];

  if (!a3)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 1114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4C8AEC;
  v10[3] = &unk_1E2955B38;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10, v3, v4);
}

- (void)stopElevationUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4C8B70;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (CMAltimeterInternal)_internal
{
  return self->_internal;
}

@end
