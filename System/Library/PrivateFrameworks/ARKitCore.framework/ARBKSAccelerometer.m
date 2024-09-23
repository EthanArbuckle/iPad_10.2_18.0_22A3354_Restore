@implementation ARBKSAccelerometer

+ (id)sharedWeakAccelerometerHandle
{
  return objc_loadWeakRetained(&sharedAccelerometer);
}

+ (id)sharedAccelerometerHandle
{
  id WeakRetained;

  if (sharedAccelerometerHandle_onceToken != -1)
    dispatch_once(&sharedAccelerometerHandle_onceToken, &__block_literal_global_112);
  dispatch_semaphore_wait((dispatch_semaphore_t)sharedAccelerometerHandle_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  WeakRetained = objc_loadWeakRetained(&sharedAccelerometer);
  if (!WeakRetained)
  {
    WeakRetained = -[ARBKSAccelerometer initPrivate]([ARBKSAccelerometer alloc], "initPrivate");
    objc_storeWeak(&sharedAccelerometer, WeakRetained);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)sharedAccelerometerHandle_semaphore);
  return WeakRetained;
}

void __47__ARBKSAccelerometer_sharedAccelerometerHandle__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)sharedAccelerometerHandle_semaphore;
  sharedAccelerometerHandle_semaphore = (uint64_t)v0;

}

- (id)initPrivate
{
  ARBKSAccelerometer *v2;
  uint64_t v3;
  BKSAccelerometer *accelerometer;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARBKSAccelerometer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)ARBKSAccelerometer;
  v2 = -[ARBKSAccelerometer init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = (BKSAccelerometer *)v3;

    -[BKSAccelerometer setPassiveOrientationEvents:](v2->_accelerometer, "setPassiveOrientationEvents:", 0);
    -[BKSAccelerometer setOrientationEventsEnabled:](v2->_accelerometer, "setOrientationEventsEnabled:", 1);
    v2->_lastValidDeviceOrientation = 3;
    _ARLogGeneral_40();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: init", buf, 0x16u);

    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  ARBKSAccelerometer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 0);
  _ARLogGeneral_40();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)ARBKSAccelerometer;
  -[ARBKSAccelerometer dealloc](&v6, sel_dealloc);
}

- (int64_t)currentOrientation
{
  int64_t v3;
  int64_t v4;

  v3 = -[ARBKSAccelerometer rawOrientation](self, "rawOrientation");
  if ((unint64_t)(v3 - 1) > 3)
  {
    kdebug_trace();
    return self->_lastValidDeviceOrientation;
  }
  else
  {
    v4 = v3;
    self->_lastValidDeviceOrientation = v3;
    kdebug_trace();
  }
  return v4;
}

- (int64_t)rawOrientation
{
  return -[BKSAccelerometer currentDeviceOrientation](self->_accelerometer, "currentDeviceOrientation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerometer, 0);
}

@end
