@implementation CMBatchedSensorManager

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

- (CMBatchedSensorManager)init
{
  CMBatchedSensorManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMBatchedSensorManager;
  v2 = -[CMBatchedSensorManager init](&v4, sel_init);
  if (v2)
    v2->_internal = (CMBatchedSensorManagerInternal *)objc_opt_new();
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t *internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  _QWORD block[5];

  internal = (dispatch_queue_t *)self->_internal;
  dispatch_queue_set_specific(internal[2], &unk_1EE16E888, &unk_1EE16E888, 0);
  if (dispatch_get_specific(&unk_1EE16E888) == &unk_1EE16E888)
  {
    objc_msgSend__teardown(internal, v4, v5, v6, v7);
  }
  else
  {
    v8 = internal[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4D24BC;
    block[3] = &unk_1E2955938;
    block[4] = internal;
    dispatch_sync(v8, block);
  }

  v9.receiver = self;
  v9.super_class = (Class)CMBatchedSensorManager;
  -[CMBatchedSensorManager dealloc](&v9, sel_dealloc);
}

+ (BOOL)isAccelerometerSupported
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_areBatchedSensorsSupported(CMBatchedSensorManagerInternal, a2, v2, v3, v4);
}

- (BOOL)isAccelerometerActive
{
  return self->_internal->_accelActive;
}

- (NSInteger)accelerometerDataFrequency
{
  return 800;
}

- (void)startAccelerometerUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4D2540;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startAccelerometerUpdatesWithHandler:(void *)handler
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F4D2604;
  v5[3] = &unk_1E2955B38;
  v5[4] = self;
  v5[5] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

- (void)stopAccelerometerUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4D26CC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSArray)accelerometerBatch
{
  return (NSArray *)((uint64_t (*)(CMBatchedSensorManagerInternal *, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel_accelBatch);
}

+ (BOOL)isDeviceMotionSupported
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_areBatchedSensorsSupported(CMBatchedSensorManagerInternal, a2, v2, v3, v4);
}

- (BOOL)isDeviceMotionActive
{
  return self->_internal->_deviceMotionActive;
}

- (NSInteger)deviceMotionDataFrequency
{
  return 200;
}

- (void)startDeviceMotionUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4D275C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startDeviceMotionUpdatesWithHandler:(void *)handler
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F4D2820;
  v5[3] = &unk_1E2955B38;
  v5[4] = self;
  v5[5] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

- (void)stopDeviceMotionUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4D28E8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSArray)deviceMotionBatch
{
  return (NSArray *)((uint64_t (*)(CMBatchedSensorManagerInternal *, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel_deviceMotionBatch);
}

@end
