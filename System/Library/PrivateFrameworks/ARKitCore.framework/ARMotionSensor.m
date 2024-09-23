@implementation ARMotionSensor

- (ARMotionSensor)initWithMotionManager:(id)a3
{
  id v5;
  ARMotionSensor *v6;
  ARMotionSensor *v7;
  uint64_t v8;
  ARGyroscopeData *currentGyroData;
  uint64_t v10;
  ARAccelerometerData *currentAccelerometerData;
  uint64_t v12;
  ARMagnetometerData *currentMagnetometerData;
  ARMotionSensor *v14;
  objc_super v16;

  v5 = a3;
  if (objc_msgSend(v5, "isGyroAvailable") && objc_msgSend(v5, "isAccelerometerAvailable"))
  {
    v16.receiver = self;
    v16.super_class = (Class)ARMotionSensor;
    v6 = -[ARMotionSensor init](&v16, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_motionManager, a3);
      v7->_requestMagnetometerData = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.motionSensor.magnetometerEnabled"));
      v8 = objc_opt_new();
      currentGyroData = v7->_currentGyroData;
      v7->_currentGyroData = (ARGyroscopeData *)v8;

      v10 = objc_opt_new();
      currentAccelerometerData = v7->_currentAccelerometerData;
      v7->_currentAccelerometerData = (ARAccelerometerData *)v10;

      if (v7->_requestMagnetometerData)
      {
        v12 = objc_opt_new();
        currentMagnetometerData = v7->_currentMagnetometerData;
        v7->_currentMagnetometerData = (ARMagnetometerData *)v12;

      }
    }
    self = v7;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CMMotionManager *motionManager;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARMotionSensor *v11;
  __int16 v12;
  CMMotionManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ARMotionSensor stop](self, "stop");
  _ARLogSensor_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    motionManager = self->_motionManager;
    *(_DWORD *)buf = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = motionManager;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARMotionSensor dealloc (%p).", buf, 0x20u);

  }
  v7.receiver = self;
  v7.super_class = (Class)ARMotionSensor;
  -[ARMotionSensor dealloc](&v7, sel_dealloc);
}

- (unint64_t)providedDataTypes
{
  if (self->_requestMagnetometerData)
    return 1030;
  else
    return 6;
}

- (double)preferredInterval
{
  float v2;

  +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.motionSensor.sampleRate"));
  return 1.0 / v2;
}

- (void)start
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CMMotionManager *motionManager;
  double v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  ARMotionSensor *v20;
  __int16 v21;
  CMMotionManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    motionManager = self->_motionManager;
    v17 = 138543874;
    v18 = v5;
    v19 = 2048;
    v20 = self;
    v21 = 2048;
    v22 = motionManager;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARMotionSensor start (%p).", (uint8_t *)&v17, 0x20u);

  }
  -[ARMotionSensor preferredInterval](self, "preferredInterval");
  -[ARMotionSensor setInterval:](self, "setInterval:");
  -[ARMotionSensor interval](self, "interval");
  if (v7 > 0.0)
  {
    -[ARMotionSensor delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    -[ARMotionSensor delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sensorDidStart:", self);
    goto LABEL_10;
  }
  _ARLogSensor_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Accelerometer and/or Gyroscope sensor(s) not available", (uint8_t *)&v17, 0x16u);

  }
  -[ARMotionSensor delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[ARMotionSensor delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(101, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sensor:didFailWithError:", self, v16);

LABEL_10:
  }
}

- (void)stop
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CMMotionManager *motionManager;
  int v7;
  void *v8;
  __int16 v9;
  ARMotionSensor *v10;
  __int16 v11;
  CMMotionManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    motionManager = self->_motionManager;
    v7 = 138543874;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    v11 = 2048;
    v12 = motionManager;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARMotionSensor stop (%p).", (uint8_t *)&v7, 0x20u);

  }
  -[ARMotionSensor setInterval:](self, "setInterval:", 0.0);
}

- (void)setInterval:(double)a3
{
  CMMotionManager *motionManager;
  CMMotionManager *v6;
  uint64_t (*v7)(uint64_t, void *);
  ARMotionSensor *v8;
  double v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  ARMotionSensor *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_interval == a3)
    return;
  motionManager = self->_motionManager;
  if (a3 <= 0.0)
  {
    -[CMMotionManager setGyroDataCallback:info:interval:](motionManager, "setGyroDataCallback:info:interval:", 0, 0, 0.0);
    -[CMMotionManager setAccelerometerDataCallback:info:interval:](self->_motionManager, "setAccelerometerDataCallback:info:interval:", 0, 0, 0.0);
    if (-[CMMotionManager isMagnetometerAvailable](self->_motionManager, "isMagnetometerAvailable")
      && self->_requestMagnetometerData)
    {
      v6 = self->_motionManager;
      v9 = 0.0;
      v7 = 0;
      v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    -[CMMotionManager setGyroDataCallback:info:interval:](motionManager, "setGyroDataCallback:info:interval:", rawGyroscopeCallback, self, a3);
    -[CMMotionManager setAccelerometerDataCallback:info:interval:](self->_motionManager, "setAccelerometerDataCallback:info:interval:", rawAccelerometerCallback, self, a3);
    if (-[CMMotionManager isMagnetometerAvailable](self->_motionManager, "isMagnetometerAvailable")
      && self->_requestMagnetometerData)
    {
      v6 = self->_motionManager;
      v7 = rawMagnetometerCallback;
      v8 = self;
      v9 = a3;
LABEL_9:
      -[CMMotionManager setMagnetometerDataCallback:info:interval:](v6, "setMagnetometerDataCallback:info:interval:", v7, v8, v9);
    }
  }
  _ARLogSensor_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v12;
    v15 = 2048;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Accelerometer and Gyroscope update interval set at %f", (uint8_t *)&v13, 0x20u);

  }
  self->_interval = a3;
}

- (void)gyroscopeOutput:(id *)a3
{
  void *v5;

  kdebug_trace();
  -[ARGyroscopeData setTimestamp:](self->_currentGyroData, "setTimestamp:", a3->var1);
  -[ARGyroscopeData setRotationRate:](self->_currentGyroData, "setRotationRate:", a3->var0.var0, a3->var0.var1, a3->var0.var2);
  -[ARMotionSensor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensor:didOutputSensorData:", self, self->_currentGyroData);

  kdebug_trace();
}

- (void)accelerometerOutput:(id *)a3
{
  void *v5;

  kdebug_trace();
  -[ARAccelerometerData setTimestamp:](self->_currentAccelerometerData, "setTimestamp:", a3->var1);
  -[ARAccelerometerData setAcceleration:](self->_currentAccelerometerData, "setAcceleration:", a3->var0.var0, a3->var0.var1, a3->var0.var2);
  -[ARMotionSensor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensor:didOutputSensorData:", self, self->_currentAccelerometerData);

  kdebug_trace();
}

- (void)magnetometerOutput:(id *)a3
{
  void *v5;

  kdebug_trace();
  -[ARMagnetometerData setTimestamp:](self->_currentMagnetometerData, "setTimestamp:", a3->var1);
  -[ARMagnetometerData setMagneticField:](self->_currentMagnetometerData, "setMagneticField:", a3->var0.var0, a3->var0.var1, a3->var0.var2);
  -[ARMotionSensor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensor:didOutputSensorData:", self, self->_currentMagnetometerData);

  kdebug_trace();
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" MotionManager=%@"), self->_motionManager);
  objc_msgSend(v6, "appendFormat:", CFSTR(" Gyroscope=%@"), self->_currentGyroData);
  objc_msgSend(v6, "appendFormat:", CFSTR(" Accelerometer=%@"), self->_currentAccelerometerData);
  if (self->_requestMagnetometerData)
    objc_msgSend(v6, "appendFormat:", CFSTR(" Magnetometer=%@"), self->_currentMagnetometerData);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentMagnetometerData, 0);
  objc_storeStrong((id *)&self->_currentAccelerometerData, 0);
  objc_storeStrong((id *)&self->_currentGyroData, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end
