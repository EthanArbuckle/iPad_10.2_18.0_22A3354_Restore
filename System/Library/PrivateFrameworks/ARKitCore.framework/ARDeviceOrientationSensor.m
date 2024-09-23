@implementation ARDeviceOrientationSensor

- (ARDeviceOrientationSensor)initWithMotionManager:(id)a3 alignment:(int64_t)a4
{
  id v7;
  ARDeviceOrientationSensor *v8;
  id *p_isa;
  id v10;
  id v11;
  ARDeviceOrientationSensor *v12;
  objc_super v14;

  v7 = a3;
  if (objc_msgSend(v7, "isDeviceMotionAvailable"))
  {
    v14.receiver = self;
    v14.super_class = (Class)ARDeviceOrientationSensor;
    v8 = -[ARDeviceOrientationSensor init](&v14, sel_init);
    p_isa = (id *)&v8->super.isa;
    if (v8)
    {
      v8->_worldAlignment = a4;
      objc_storeStrong((id *)&v8->_motionManager, a3);
      v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      v11 = p_isa[2];
      p_isa[2] = v10;

      objc_msgSend(p_isa[2], "setQualityOfService:", 33);
      objc_msgSend(p_isa[2], "setMaxConcurrentOperationCount:", 1);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  ARDeviceOrientationSensor *v11;
  __int16 v12;
  CMMotionManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_10();
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
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc (%p).", buf, 0x20u);

  }
  -[ARDeviceOrientationSensor stop](self, "stop");
  v7.receiver = self;
  v7.super_class = (Class)ARDeviceOrientationSensor;
  -[ARDeviceOrientationSensor dealloc](&v7, sel_dealloc);
}

- (unint64_t)providedDataTypes
{
  return 8;
}

- (void)start
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CMMotionManager *motionManager;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  CMMotionManager *v11;
  CMMotionManager *v12;
  NSOperationQueue *taskDeviceMotion;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  CMMotionManager *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  ARDeviceOrientationSensor *v32;
  __int16 v33;
  CMMotionManager *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_10();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    motionManager = self->_motionManager;
    *(_DWORD *)buf = 138543874;
    v30 = v5;
    v31 = 2048;
    v32 = self;
    v33 = 2048;
    v34 = motionManager;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: start (%p)", buf, 0x20u);

  }
  -[ARDeviceOrientationSensor preferredInterval](self, "preferredInterval");
  -[ARDeviceOrientationSensor setInterval:](self, "setInterval:");
  if (self->_worldAlignment == 1)
    v7 = 8;
  else
    v7 = 1;
  _ARLogSensor_10();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromAttitudeReferenceFrame(v7);
    v11 = (CMMotionManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v10;
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: starting with reference frame: %@", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CA5670], "availableAttitudeReferenceFrames") & v7) != 0)
  {
    objc_initWeak((id *)buf, self);
    v12 = self->_motionManager;
    taskDeviceMotion = self->_taskDeviceMotion;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __34__ARDeviceOrientationSensor_start__block_invoke;
    v27[3] = &unk_1E6675848;
    objc_copyWeak(&v28, (id *)buf);
    -[CMMotionManager startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:](v12, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", v7, taskDeviceMotion, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
    -[ARDeviceOrientationSensor delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0)
      return;
    -[ARDeviceOrientationSensor delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sensorDidStart:", self);
    goto LABEL_17;
  }
  _ARLogSensor_10();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromAttitudeReferenceFrame(v7);
    v20 = (CMMotionManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v19;
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Device motion is not available for reference frame: %@", buf, 0x20u);

  }
  _ARLogSensor_10();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v23;
    v31 = 2048;
    v32 = self;
    _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to start.", buf, 0x16u);

  }
  -[ARDeviceOrientationSensor delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[ARDeviceOrientationSensor delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(101, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sensor:didFailWithError:", self, v26);

LABEL_17:
  }
}

void __34__ARDeviceOrientationSensor_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleDeviceMotionUpdateWithMotion:error:", v6, v5);

}

- (void)changeReferenceFrame:(unint64_t)a3
{
  CMMotionManager *motionManager;
  NSOperationQueue *taskDeviceMotion;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[CMMotionManager isDeviceMotionActive](self->_motionManager, "isDeviceMotionActive"))
  {
    -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
    objc_initWeak(&location, self);
    motionManager = self->_motionManager;
    taskDeviceMotion = self->_taskDeviceMotion;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__ARDeviceOrientationSensor_changeReferenceFrame___block_invoke;
    v7[3] = &unk_1E6675848;
    objc_copyWeak(&v8, &location);
    -[CMMotionManager startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:](motionManager, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", a3, taskDeviceMotion, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __50__ARDeviceOrientationSensor_changeReferenceFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleDeviceMotionUpdateWithMotion:error:", v6, v5);

}

- (void)handleDeviceMotionUpdateWithMotion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  double v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  CMMotionManager *motionManager;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  objc_class *v25;
  void *v26;
  ARDeviceOrientationData *v27;
  int v28;
  int v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  ARDeviceOrientationSensor *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  kdebug_trace();
  if (v7 && objc_msgSend(v7, "code") != 101)
  {
    _ARLogSensor_10();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v15;
      v34 = 2048;
      v35 = self;
      v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error received from motion manager: %@", buf, 0x20u);

    }
    -[ARDeviceOrientationSensor delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0CB3388];
    v31 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(102, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sensor:didFailWithError:](v17, "sensor:didFailWithError:", self, v19);

    goto LABEL_18;
  }
  if (!v6)
  {
    _ARLogSensor_10();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      motionManager = self->_motionManager;
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      v34 = 2048;
      v35 = self;
      v36 = 2048;
      v37 = motionManager;
      v22 = "%{public}@ <%p>: Failed to get device motion from motion manager (%p)";
      v23 = v17;
      v24 = 32;
LABEL_17:
      _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
LABEL_18:

    }
LABEL_19:

    goto LABEL_24;
  }
  objc_msgSend(v6, "timestamp");
  if (v8 <= self->_previousCaptureEndingTimestamp)
  {
    _ARLogSensor_10();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v18;
      v34 = 2048;
      v35 = self;
      v22 = "%{public}@ <%p>: Rejected stale device motion data";
      v23 = v17;
      v24 = 22;
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (self->_worldAlignment == 1)
  {
    objc_msgSend(v6, "magneticField");
    if (v29 != 2)
    {
      _ARLogSensor_10();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "magneticField");
        if ((v28 + 1) > 3)
          v12 = &stru_1E6676798;
        else
          v12 = off_1E6675868[v28 + 1];
        *(_DWORD *)buf = 138543874;
        v33 = v11;
        v34 = 2048;
        v35 = self;
        v36 = 2112;
        v37 = (void *)v12;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Warning: Magnetic calibration accuracy is %@", buf, 0x20u);

      }
    }
  }
  -[ARDeviceOrientationSensor delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[ARDeviceOrientationData initWithMotionData:]([ARDeviceOrientationData alloc], "initWithMotionData:", v6);
  objc_msgSend(v26, "sensor:didOutputSensorData:", self, v27);

  objc_msgSend(v6, "timestamp");
  kdebug_trace();
LABEL_24:

}

- (double)preferredInterval
{
  float v2;

  +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.motionSensor.sampleRate"));
  return 1.0 / v2;
}

- (void)setInterval:(double)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  ARDeviceOrientationSensor *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[CMMotionManager isDeviceMotionAvailable](self->_motionManager, "isDeviceMotionAvailable"))
    a3 = 0.0;
  if (self->_interval != a3)
  {
    -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", fmax(a3, 0.0));
    _ARLogSensor_10();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 2048;
      v11 = self;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CMDeviceMotion update interval set at %f", (uint8_t *)&v8, 0x20u);

    }
    self->_interval = a3;
  }
}

- (void)stop
{
  void *v3;
  void *v4;
  double v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  CMMotionManager *motionManager;
  int v10;
  void *v11;
  __int16 v12;
  ARDeviceOrientationSensor *v13;
  __int16 v14;
  CMMotionManager *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CMMotionManager deviceMotion](self->_motionManager, "deviceMotion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timestamp");
    self->_previousCaptureEndingTimestamp = v5;
  }
  -[ARDeviceOrientationSensor setInterval:](self, "setInterval:", 0.0);
  _ARLogSensor_10();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    motionManager = self->_motionManager;
    v10 = 138543874;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    v14 = 2048;
    v15 = motionManager;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: stop (%p).", (uint8_t *)&v10, 0x20u);

  }
  -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");

}

- (void)waitForOutstandingCallbacks
{
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_taskDeviceMotion, "waitUntilAllOperationsAreFinished");
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

- (int64_t)worldAlignment
{
  return self->_worldAlignment;
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskDeviceMotion, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end
