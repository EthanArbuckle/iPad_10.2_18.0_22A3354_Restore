@implementation CLLocationManagerRoutine

- (CLLocationManagerRoutine)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  CLLocationManagerRoutine *v12;

  v4 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("_CLLocationManagerRoutineProxy, %p"), v2, self);
  v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  v9 = dispatch_queue_create(v8, 0);
  v12 = (CLLocationManagerRoutine *)objc_msgSend_initWithQueue_(self, v10, (uint64_t)v9, v11);
  dispatch_release(v9);
  return v12;
}

- (CLLocationManagerRoutine)initWithQueue:(id)a3
{
  uint64_t v3;
  CLLocationManagerRoutine *v6;
  _CLLocationManagerRoutineProxy *v7;
  const char *v8;
  void *v11;
  const char *v12;
  objc_super v13;

  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)CLLocationManagerRoutine;
    v6 = -[CLLocationManagerRoutine init](&v13, sel_init);
    if (v6)
    {
      v7 = [_CLLocationManagerRoutineProxy alloc];
      v6->_locationManagerRoutineProxy = (_CLLocationManagerRoutineProxy *)objc_msgSend_initWithQueue_locationManagerRoutine_(v7, v8, (uint64_t)a3, (uint64_t)v6);
    }
  }
  else
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManagerRoutine.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationManagerRoutine;
  -[CLLocationManagerRoutine dealloc](&v3, sel_dealloc);
}

- (void)startUpdatingLocation
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD v7[6];

  v6 = *(NSObject **)(objc_msgSend_locationManagerRoutineProxy(self, a2, v2, v3) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F5D79A8;
  v7[3] = &unk_1E2991168;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

- (void)stopUpdatingLocation
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[5];

  v5 = *(NSObject **)(objc_msgSend_locationManagerRoutineProxy(self, a2, v2, v3) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F5D7A8C;
  block[3] = &unk_1E2990DE0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  _QWORD v7[6];

  v6 = *(NSObject **)(objc_msgSend_locationManagerRoutineProxy(self, a2, (uint64_t)a3, v3) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F5D7B30;
  v7[3] = &unk_1E2991118;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (CLLocationManagerDelegate)delegate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_locationManagerRoutineProxy(self, a2, v2, v3);
  return (CLLocationManagerDelegate *)objc_msgSend_delegate(v4, v5, v6, v7);
}

- (void)setInertialDelegate:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  _QWORD v7[6];

  v6 = *(NSObject **)(objc_msgSend_locationManagerRoutineProxy(self, a2, (uint64_t)a3, v3) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F5D7BD4;
  v7[3] = &unk_1E2991118;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (CLInertialDataManagerDelegate)inertialDelegate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_locationManagerRoutineProxy(self, a2, v2, v3);
  return (CLInertialDataManagerDelegate *)objc_msgSend_inertialDelegate(v4, v5, v6, v7);
}

- (_CLLocationManagerRoutineProxy)locationManagerRoutineProxy
{
  return self->_locationManagerRoutineProxy;
}

- (void)setLocationManagerRoutineProxy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
