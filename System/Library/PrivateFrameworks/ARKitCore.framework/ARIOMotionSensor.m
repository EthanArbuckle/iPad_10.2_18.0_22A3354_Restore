@implementation ARIOMotionSensor

- (ARIOMotionSensor)init
{
  ARIOMotionSensor *v2;
  ARIOMotionSensor *v3;
  NSString *location;
  uint64_t v5;
  ARGyroscopeData *currentGyroData;
  uint64_t v7;
  ARAccelerometerData *currentAccelerometerData;
  uint64_t v9;
  OS_dispatch_queue *imuDataQueue;
  __IOHIDEventSystemClient *v11;
  __IOHIDEventSystemClient *v12;
  __IOHIDServiceClient *accelerometerService;
  void *v14;
  __IOHIDServiceClient *gyroService;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ARIOMotionSensor;
  v2 = -[ARIOMotionSensor init](&v18, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_11;
  location = v2->_location;
  v2->_location = (NSString *)&stru_1E6676798;

  v5 = objc_opt_new();
  currentGyroData = v3->_currentGyroData;
  v3->_currentGyroData = (ARGyroscopeData *)v5;

  v7 = objc_opt_new();
  currentAccelerometerData = v3->_currentAccelerometerData;
  v3->_currentAccelerometerData = (ARAccelerometerData *)v7;

  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.motion");
  v9 = objc_claimAutoreleasedReturnValue();
  imuDataQueue = v3->_imuDataQueue;
  v3->_imuDataQueue = (OS_dispatch_queue *)v9;

  v11 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v3->_accelerometerSystemClient = v11;
  if (v11)
    v3->_accelerometerService = copyHIDServicePlugin(v11, 65280, 3, -[NSString UTF8String](v3->_location, "UTF8String"));
  v12 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v3->_gyroSystemClient = v12;
  if (v12)
    v3->_gyroService = copyHIDServicePlugin(v12, 65280, 9, -[NSString UTF8String](v3->_location, "UTF8String"));
  if (!v3->_accelerometerSystemClient || !v3->_gyroSystemClient)
  {
LABEL_12:
    accelerometerService = 0;
    goto LABEL_13;
  }
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterEventCallback();
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterEventCallback();
  accelerometerService = v3->_accelerometerService;
  if (accelerometerService)
  {
    if (v3->_gyroService)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(accelerometerService, CFSTR("ReportInterval"), v14);

      gyroService = v3->_gyroService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(gyroService, CFSTR("ReportInterval"), v16);

LABEL_11:
      accelerometerService = v3;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:

  return (ARIOMotionSensor *)accelerometerService;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  __IOHIDServiceClient *accelerometerService;
  __IOHIDEventSystemClient *accelerometerSystemClient;
  __IOHIDServiceClient *gyroService;
  __IOHIDEventSystemClient *gyroSystemClient;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARIOMotionSensor *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_ARLogSensor_onceToken_1 != -1)
    dispatch_once(&_ARLogSensor_onceToken_1, &__block_literal_global_108);
  v3 = (void *)_ARLogSensor_logObj_1;
  if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_1, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARIOMotionSensor dealloc", buf, 0x16u);

  }
  -[ARIOMotionSensor stop](self, "stop");
  if (self->_accelerometerSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    MEMORY[0x1B5E2D048](self->_accelerometerSystemClient, self->_imuDataQueue);
  }
  accelerometerService = self->_accelerometerService;
  if (accelerometerService)
    CFRelease(accelerometerService);
  accelerometerSystemClient = self->_accelerometerSystemClient;
  if (accelerometerSystemClient)
    CFRelease(accelerometerSystemClient);
  if (self->_gyroSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    MEMORY[0x1B5E2D048](self->_gyroSystemClient, self->_imuDataQueue);
  }
  gyroService = self->_gyroService;
  if (gyroService)
    CFRelease(gyroService);
  gyroSystemClient = self->_gyroSystemClient;
  if (gyroSystemClient)
    CFRelease(gyroSystemClient);
  v11.receiver = self;
  v11.super_class = (Class)ARIOMotionSensor;
  -[ARIOMotionSensor dealloc](&v11, sel_dealloc);
}

- (unint64_t)providedDataTypes
{
  return 6;
}

- (int64_t)preferredSampleRate
{
  return +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.motionSensor.sampleRate"));
}

- (void)start
{
  uint64_t v3;
  __IOHIDServiceClient *accelerometerService;
  uint64_t v5;
  void *v6;
  __IOHIDServiceClient *gyroService;
  void *v8;
  __IOHIDServiceClient *v9;
  void *v10;
  __IOHIDServiceClient *v11;
  id v12;

  v3 = -[ARIOMotionSensor preferredSampleRate](self, "preferredSampleRate");
  accelerometerService = self->_accelerometerService;
  if (accelerometerService)
  {
    if (self->_gyroService)
    {
      v5 = (1000000.0 / (double)v3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(accelerometerService, CFSTR("ReportInterval"), v6);

      gyroService = self->_gyroService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(gyroService, CFSTR("ReportInterval"), v8);

      v9 = self->_accelerometerService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(v9, CFSTR("BatchInterval"), v10);

      v11 = self->_gyroService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(v11, CFSTR("BatchInterval"), v12);

    }
  }
}

- (void)stop
{
  __IOHIDServiceClient *accelerometerService;
  void *v4;
  __IOHIDServiceClient *gyroService;
  void *v6;
  __IOHIDServiceClient *v7;
  void *v8;
  __IOHIDServiceClient *v9;
  id v10;

  accelerometerService = self->_accelerometerService;
  if (accelerometerService)
  {
    if (self->_gyroService)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(accelerometerService, CFSTR("ReportInterval"), v4);

      gyroService = self->_gyroService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(gyroService, CFSTR("ReportInterval"), v6);

      v7 = self->_accelerometerService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(v7, CFSTR("BatchInterval"), v8);

      v9 = self->_gyroService;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      IOHIDServiceClientSetProperty(v9, CFSTR("BatchInterval"), v10);

    }
  }
}

- (void)waitForOutstandingCallbacks
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_imuDataQueue);
  dispatch_sync((dispatch_queue_t)self->_imuDataQueue, &__block_literal_global_21);
}

- (void)accelerometerDidOutputEvent:(__IOHIDEvent *)a3 timestamp:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFNumber *Value;
  void *v14;
  uint64_t valuePtr;

  kdebug_trace();
  -[ARAccelerometerData setTimestamp:](self->_currentAccelerometerData, "setTimestamp:", a4);
  IOHIDEventGetFloatValue();
  v7 = v6;
  IOHIDEventGetFloatValue();
  v9 = v8;
  IOHIDEventGetFloatValue();
  -[ARAccelerometerData setAcceleration:](self->_currentAccelerometerData, "setAcceleration:", v7, v9, v10);
  v11 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(self->_accelerometerService, CFSTR("AppleVoltageDictionary"));
  if (v11)
  {
    v12 = v11;
    Value = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("ACCEL_TEMP"));
    if (Value)
    {
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
      if (valuePtr != 21474836)
        -[ARAccelerometerData setTemperature:](self->_currentAccelerometerData, "setTemperature:", (float)((float)valuePtr / 100.0));
    }
    CFRelease(v12);
  }
  -[ARIOMotionSensor delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sensor:didOutputSensorData:", self, self->_currentAccelerometerData);

  kdebug_trace();
}

- (void)gyroscopeDidOutputEvent:(__IOHIDEvent *)a3 timestamp:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  kdebug_trace();
  -[ARGyroscopeData setTimestamp:](self->_currentGyroData, "setTimestamp:", a4);
  IOHIDEventGetFloatValue();
  v7 = v6;
  IOHIDEventGetFloatValue();
  v9 = v8;
  IOHIDEventGetFloatValue();
  -[ARGyroscopeData setRotationRate:](self->_currentGyroData, "setRotationRate:", v7, v9, v10);
  -[ARIOMotionSensor delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sensor:didOutputSensorData:", self, self->_currentGyroData);

  kdebug_trace();
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAccelerometerData, 0);
  objc_storeStrong((id *)&self->_currentGyroData, 0);
  objc_storeStrong((id *)&self->_imuDataQueue, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
