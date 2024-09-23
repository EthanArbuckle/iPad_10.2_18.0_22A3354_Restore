@implementation ARLocationSensor

- (ARLocationSensor)init
{
  void *v3;
  void *v4;
  ARLocationSensor *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARLocationSensor initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v4);

  return v5;
}

- (ARLocationSensor)initWithBundleIdentifier:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ARLocationSensor;
  v5 = -[ARLocationSensor init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v5 + 56) = _Q0;
    *((_QWORD *)v5 + 9) = 0xBFF0000000000000;
    *((_WORD *)v5 + 20) = 1;
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.locationSensor.locationManager");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v13;

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v15;

    v17 = objc_opt_new();
    v18 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v17;

  }
  return (ARLocationSensor *)v5;
}

- (unint64_t)providedDataTypes
{
  return 64;
}

- (void)configureForReplay
{
  _CLLocationPlayer *v3;
  _CLLocationPlayer *locationPlayer;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  _CLLocationPlayer *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARLocationSensor *v12;
  __int16 v13;
  _CLLocationPlayer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_isLiveSensor = 0;
  v3 = (_CLLocationPlayer *)objc_opt_new();
  locationPlayer = self->_locationPlayer;
  self->_locationPlayer = v3;

  _ARLogSensor_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_locationPlayer;
    v9 = 138543874;
    v10 = v7;
    v11 = 2048;
    v12 = self;
    v13 = 2048;
    v14 = v8;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Created _CLLocationPlayer: %p", (uint8_t *)&v9, 0x20u);

  }
  -[_CLLocationPlayer setSimulationEnabled:](self->_locationPlayer, "setSimulationEnabled:", 0);
  -[_CLLocationPlayer start](self->_locationPlayer, "start");
}

- (void)start
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *locationManagerQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARLocationSensor *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: start", buf, 0x16u);

  }
  locationManagerQueue = self->_locationManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ARLocationSensor_start__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(locationManagerQueue, block);
}

void __25__ARLocationSensor_start__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id *v8;
  void *v9;
  _BYTE *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_msgSend(v2, "_createLocationManager");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  v7 = objc_msgSend(v3, "authorizationStatus");
  v8 = *(id **)(a1 + 32);
  if (!v7)
  {
    objc_msgSend(v8[2], "requestWhenInUseAuthorization");
    return;
  }
  objc_msgSend(v8, "_validateLocationAuthorization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sensor:didFailWithError:", *(_QWORD *)(a1 + 32), v9);
  }
  else
  {
    v10[41] = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "startUpdatingLocation");
    _ARLogSensor_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v18 = 138543618;
      v19 = v14;
      v20 = 2048;
      v21 = v15;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: started location updates.", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sensorDidStart:", *(_QWORD *)(a1 + 32));
  }

LABEL_12:
}

- (id)_createLocationManager
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundleIdentifier:delegate:onQueue:", self->_bundleIdentifier, self, self->_locationManagerQueue);
  objc_msgSend(v3, "setActivityType:", 4);
  objc_msgSend(v3, "setDesiredAccuracy:", *MEMORY[0x1E0C9E490]);
  objc_msgSend(v3, "setDistanceFilter:", *MEMORY[0x1E0C9E480]);
  objc_msgSend(v3, "_setGroundAltitudeEnabled:", 1);
  objc_msgSend(v3, "_setFusionInfoEnabled:", 1);
  return v3;
}

- (id)_validateLocationAuthorization
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if ((objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled") & 1) != 0)
  {
    if (-[CLLocationManager authorizationStatus](self->_locationManager, "authorizationStatus") == kCLAuthorizationStatusAuthorizedAlways
      || -[CLLocationManager authorizationStatus](self->_locationManager, "authorizationStatus") == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
      if (-[CLLocationManager accuracyAuthorization](self->_locationManager, "accuracyAuthorization") == CLAccuracyAuthorizationFullAccuracy)
        return 0;
      v11 = *MEMORY[0x1E0CB2D68];
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Usage of precise location denied by user."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v4;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v12;
      v7 = &v11;
    }
    else
    {
      v13 = *MEMORY[0x1E0CB2D68];
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Location authorization denied by the user."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v4;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v14;
      v7 = &v13;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0CB2D68];
    ARKitCoreBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Location use is restricted on this device."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v16;
    v7 = &v15;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ARErrorWithCodeAndUserInfo(101, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)stop
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  CLLocationManager *locationManager;
  CLLocationManager *v9;
  NSObject *locationManagerQueue;
  CLLocationManager *v11;
  _QWORD block[4];
  CLLocationManager *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARLocationSensor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v5;
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: stop", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ARLocationSensor(%p):"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isLiveSensor)
  {
    -[_CLLocationPlayer stop](self->_locationPlayer, "stop");
    _ARLogSensor_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%@ stopped location player.", buf, 0xCu);
    }

  }
  locationManager = self->_locationManager;
  if (locationManager)
  {
    self->_isStopped = 1;
    v9 = locationManager;
    locationManagerQueue = self->_locationManagerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__ARLocationSensor_stop__block_invoke;
    block[3] = &unk_1E6672118;
    v13 = v9;
    v14 = v6;
    v11 = v9;
    dispatch_async(locationManagerQueue, block);

  }
}

void __24__ARLocationSensor_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stopUpdatingLocation");
  _ARLogSensor_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%@ stopped location manager.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)waitForOutstandingCallbacks
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_locationManagerQueue);
  dispatch_sync((dispatch_queue_t)self->_locationManagerQueue, &__block_literal_global_39);
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
  ARLocationSensor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  -[ARLocationSensor stop](self, "stop");
  v6.receiver = self;
  v6.super_class = (Class)ARLocationSensor;
  -[ARLocationSensor dealloc](&v6, sel_dealloc);
}

- (void)updateARSessionState:(unint64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  objc_class *v9;
  objc_class *v10;
  NSObject *locationManagerQueue;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARLocationSensor *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2uLL:
      _ARLogSensor_3();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v7;
        v18 = 2048;
        v19 = self;
        v8 = "%{public}@ <%p>: ARSessionStateInterrupted";
        goto LABEL_10;
      }
LABEL_11:

      locationManagerQueue = self->_locationManagerQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __41__ARLocationSensor_updateARSessionState___block_invoke;
      v15[3] = &unk_1E6673378;
      v15[4] = self;
      v15[5] = a3;
      dispatch_async(locationManagerQueue, v15);
      return;
    case 1uLL:
      _ARLogSensor_3();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v7;
        v18 = 2048;
        v19 = self;
        v8 = "%{public}@ <%p>: ARSessionStateRunning";
        goto LABEL_10;
      }
      goto LABEL_11;
    case 0uLL:
      _ARLogSensor_3();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v7;
        v18 = 2048;
        v19 = self;
        v8 = "%{public}@ <%p>: ARSessionStatePaused";
LABEL_10:
        _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, v8, buf, 0x16u);

        goto LABEL_11;
      }
      goto LABEL_11;
  }
  _ARLogSensor_3();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unknown ARSessionState received", buf, 0x16u);

  }
}

uint64_t __41__ARLocationSensor_updateARSessionState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 16;
  if (!*(_BYTE *)(v1 + 40))
    v2 = 24;
  return objc_msgSend(*(id *)(v1 + v2), "_updateARSessionState:", *(_QWORD *)(a1 + 40));
}

- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  NSObject *locationManagerQueue;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[5];
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  NSObject *v34;
  ARLocationSensor *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  ARLocationSensor *v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "worldTrackingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "poseTimestamp");
  v10 = v9;

  if (v10 > self->_lastVIOUpdateTimestamp)
  {
    objc_msgSend(v6, "worldTrackingState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inertialState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      self->_lastVIOUpdateTimestamp = v10;
      objc_msgSend(v7, "cameraIntrinsics");
      v22 = v13;
      v23 = v14;
      v24 = v15;
      objc_msgSend(v7, "imageResolution");
      locationManagerQueue = self->_locationManagerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__ARLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke;
      block[3] = &unk_1E6673FD8;
      v36 = v10;
      v26 = DWORD2(v22);
      v29 = DWORD2(v23);
      block[4] = v22;
      v27 = 0;
      v28 = v23;
      v30 = 0;
      v32 = DWORD2(v24);
      v31 = v24;
      v33 = 0;
      v37 = v17;
      v38 = v18;
      v34 = v6;
      v35 = self;
      dispatch_async(locationManagerQueue, block);
      v19 = v34;
    }
    else
    {
      _ARLogSensor_3();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v21;
        v41 = 2048;
        v42 = self;
        v43 = 2048;
        v44 = v10;
        _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: World tracking state is missing inertial state: %f", buf, 0x20u);

      }
    }

  }
}

void __58__ARLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int64x2_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  void *v17;
  uint64_t v18;
  int8x16_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int8x16_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  int8x16_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  int8x16_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  int8x16_t v52;
  uint64_t v53;
  int8x16_t v54;
  uint64_t v55;
  int8x16_t v56;
  uint64_t v57;
  int8x16_t v58;
  uint64_t v59;
  int64x2_t v60;
  int64x2_t v61;
  int64x2_t v62;
  int64x2_t v63;
  int64x2_t v64;
  __int128 v65;
  int8x16_t v66;
  uint64_t v67;
  int8x16_t v68;
  uint64_t v69;
  int8x16_t v70;
  uint64_t v71;
  int8x16_t v72;
  uint64_t v73;
  _OWORD v74[4];
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 80), "worldTrackingState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTrackingState:", objc_msgSend(v3, "vioTrackingState"));

  objc_msgSend(*(id *)(a1 + 80), "worldTrackingState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originTimestamp");
  objc_msgSend(v2, "setOriginTimestamp:");

  objc_msgSend(v2, "setTimestamp:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 80), "worldTrackingState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inertialState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 201219;
  v50 = ARGetInertialStateInfo_kCV3DVIOInertialStateInfo;
  objc_msgSend(v2, "setInertialStateInfo:", &v50);

  objc_msgSend(*(id *)(a1 + 80), "worldTrackingState");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "inertialState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0uLL;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "orientation");
    v11 = v60;
    v10 = v61;
    v13 = v62;
    v12 = v63;
    v9 = v64;
    v14 = v65;
  }
  else
  {
    v14 = 0;
    v13 = 0uLL;
    v12 = 0uLL;
    v11 = 0uLL;
    v10 = 0uLL;
  }
  v15 = vzip1q_s64(v11, v13);
  v16 = vzip2q_s64(v13, v9);
  v9.i64[1] = v11.i64[1];
  v74[0] = v15;
  v74[1] = v9;
  v74[2] = v16;
  v74[3] = vzip1q_s64(v10, v12);
  v75 = v14;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v74, 72);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (v8)
  {
    objc_msgSend(v8, "gyroscopeBias");
    v19 = v58;
    v20 = vextq_s8(v19, v19, 8uLL).u64[0];
    v21 = v59;
  }
  else
  {
    v19.i64[0] = 0;
    v20 = 0;
    v21 = 0;
  }
  v19.i64[1] = v20;
  v72 = v19;
  v73 = v21;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v72, 24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "velocity");
    v23 = v56;
    v24 = vextq_s8(v23, v23, 8uLL).u64[0];
    v18 = v57;
  }
  else
  {
    v23.i64[0] = 0;
    v24 = 0;
  }
  v23.i64[1] = v24;
  v70 = v23;
  v71 = v18;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v70, 24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  if (v8)
  {
    objc_msgSend(v8, "accelerometerBias");
    v27 = v54;
    v28 = vextq_s8(v27, v27, 8uLL).u64[0];
    v29 = v55;
  }
  else
  {
    v27.i64[0] = 0;
    v28 = 0;
    v29 = 0;
  }
  v27.i64[1] = v28;
  v68 = v27;
  v69 = v29;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v68, 24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "position");
    v31 = v52;
    v32 = vextq_s8(v31, v31, 8uLL).u64[0];
    v26 = v53;
  }
  else
  {
    v31.i64[0] = 0;
    v32 = 0;
  }
  v31.i64[1] = v32;
  v66 = v31;
  v67 = v26;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v66, 24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v17, "length");
  v35 = objc_msgSend(v22, "length") + v34;
  v36 = objc_msgSend(v25, "length");
  v37 = v35 + v36 + objc_msgSend(v30, "length");
  v38 = objc_msgSend(v33, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v37 + v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "appendData:", v17);
  objc_msgSend(v39, "appendData:", v22);
  objc_msgSend(v39, "appendData:", v25);
  objc_msgSend(v39, "appendData:", v30);
  objc_msgSend(v39, "appendData:", v33);

  objc_msgSend(v2, "setInertialState:", v39);
  objc_msgSend(*(id *)(a1 + 80), "worldTrackingState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inertialState");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 199683;
  v48 = ARGetInertialCovarianceInfo_kCV3DVIOInertialCovarianceInfo;
  objc_msgSend(v2, "setInertialCovarianceInfo:", &v48);

  objc_msgSend(*(id *)(a1 + 80), "worldTrackingState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "inertialState");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v43, "covarianceMatrix"), 1800);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInertialCovariance:", v44);

  objc_msgSend(*(id *)(a1 + 80), "visionCameraTransform");
  objc_msgSend(v2, "setCameraPose:");
  objc_msgSend(v2, "setCameraIntrinsics:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  objc_msgSend(v2, "setCameraImageResolution:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  v45 = *(_QWORD *)(a1 + 88);
  v46 = 16;
  if (!*(_BYTE *)(v45 + 40))
    v46 = 24;
  objc_msgSend(*(id *)(v45 + v46), "_updateVIOEstimation:", v2);
  kdebug_trace();

}

- (void)_attemptAltitudeLookupAtCoordinate:(CLLocationCoordinate2D)a3 attemptCount:(unsigned int)a4 lookupStartDate:(id)a5 completionHandler:(id)a6
{
  double longitude;
  double latitude;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  objc_class *v14;
  void *v15;
  const __CFString *v16;
  double v17;
  CLLocationManager *v18;
  CLLocationManager *locationManager;
  ARLocationData *currentLocation;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  _BOOL4 v26;
  objc_class *v27;
  void *v28;
  unsigned int v29;
  float v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  dispatch_time_t v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  unsigned int v43;
  CLLocationManager *v44;
  void *v45;
  ARSkipTileBounds *v46;
  BOOL v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  unsigned int v64;
  float v65;
  NSObject *v66;
  objc_class *v67;
  void *v68;
  NSObject *v69;
  objc_class *v70;
  void *v71;
  dispatch_time_t v72;
  NSObject *v73;
  ARSkipTileBounds *v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  double v78;
  NSObject *v79;
  objc_class *v80;
  void *v81;
  double v82;
  double v83;
  const __CFString *v84;
  objc_class *v85;
  void *v86;
  double v87;
  VLLocalizer *localizer;
  void *v89;
  OS_dispatch_queue *locationManagerQueue;
  _QWORD v91[5];
  ARSkipTileBounds *v92;
  ARSkipTileBounds *v93;
  _QWORD v94[4];
  ARSkipTileBounds *v95;
  ARLocationSensor *v96;
  id v97;
  void (**v98)(id, _QWORD);
  double v99;
  double v100;
  unsigned int v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD block[5];
  id v107;
  void (**v108)(id, _QWORD);
  double v109;
  double v110;
  unsigned int v111;
  uint8_t v112[128];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  ARLocationSensor *v116;
  __int16 v117;
  _BYTE v118[24];
  uint64_t v119;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v119 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if (self->_locationManager)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    -[ARLocationSensor _createLocationManager](self, "_createLocationManager");
    v18 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
    locationManager = self->_locationManager;
    self->_locationManager = v18;

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  if (!objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled")
    || -[CLLocationManager authorizationStatus](self->_locationManager, "authorizationStatus") != kCLAuthorizationStatusAuthorizedAlways
    && -[CLLocationManager authorizationStatus](self->_locationManager, "authorizationStatus") != kCLAuthorizationStatusAuthorizedWhenInUse
    || -[CLLocationManager accuracyAuthorization](self->_locationManager, "accuracyAuthorization"))
  {
    _ARLogSensor_3();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v114 = v15;
      v115 = 2048;
      v116 = self;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Precise location permissions must be enabled to use geo tracking features.", buf, 0x16u);

    }
    v16 = CFSTR("FailedDueToMissingPermissions");
    v17 = 0.0;
LABEL_10:
    +[ARSessionMetrics recordAltitudeLookupAttemptWithDuration:andResult:](ARSessionMetrics, "recordAltitudeLookupAttemptWithDuration:andResult:", v16, v17);
LABEL_11:
    v12[2](v12, 0);
    goto LABEL_12;
  }
  currentLocation = self->_currentLocation;
  if (currentLocation)
  {
    -[ARLocationData location](currentLocation, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinate");
    v24 = ARLInfinityAngularDistance(latitude, longitude, v22, v23);

    _ARLogSensor_3();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24 > 0.05)
    {
      if (v26)
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v114 = v28;
        v115 = 2048;
        v116 = self;
        v117 = 2049;
        *(_QWORD *)v118 = 0x3FA999999999999ALL;
        _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Lookup coordinate too far away (>%{private}f degrees) from current location to perform CL altitude lookup", buf, 0x20u);

      }
      goto LABEL_11;
    }
    if (v26)
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v114 = v37;
      v115 = 2048;
      v116 = self;
      v117 = 1024;
      *(_DWORD *)v118 = a4 + 1;
      *(_WORD *)&v118[4] = 2049;
      *(double *)&v118[6] = latitude;
      *(_WORD *)&v118[14] = 2049;
      *(double *)&v118[16] = longitude;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Performing CL altitude look up attempt #%d at coordinate: %{private}f, %{private}f", buf, 0x30u);

    }
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v38 = self->_altitudeSkipTiles;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v103;
      while (2)
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v103 != v41)
            objc_enumerationMutation(v38);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i), "isInside:", latitude, longitude))
          {
            _ARLogSensor_3();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v62 = (objc_class *)objc_opt_class();
              NSStringFromClass(v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v114 = v63;
              v115 = 2048;
              v116 = self;
              _os_log_impl(&dword_1B3A68000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tile hasn't been loaded. Skipping look up.", buf, 0x16u);

            }
            v46 = 0;
            goto LABEL_51;
          }
        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
        if (v40)
          continue;
        break;
      }
    }

    v43 = 0;
    do
    {
      v44 = self->_locationManager;
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
      -[CLLocationManager _groundAltitudeAtLocation:](v44, "_groundAltitudeAtLocation:", v45);
      v46 = (ARSkipTileBounds *)objc_claimAutoreleasedReturnValue();

      if (v46)
        v47 = 1;
      else
        v47 = v43 >= 7;
      ++v43;
    }
    while (!v47);
    if (v46)
    {
      v48 = -[ARSkipTileBounds isAltitudeWgs84Available](v46, "isAltitudeWgs84Available");
      _ARLogSensor_3();
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if ((v48 & 1) != 0)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544131;
          v114 = v52;
          v115 = 2048;
          v116 = self;
          v117 = 2049;
          *(double *)v118 = latitude;
          *(_WORD *)&v118[8] = 2049;
          *(double *)&v118[10] = longitude;
          _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Look up succeeded at coordinate: %{private}f, %{private}f", buf, 0x2Au);

        }
        objc_msgSend(v11, "timeIntervalSinceNow");
        +[ARSessionMetrics recordAltitudeLookupAttemptWithDuration:andResult:](ARSessionMetrics, "recordAltitudeLookupAttemptWithDuration:andResult:", CFSTR("Success"), fabs(v53));
        -[ARLocationData location](self->_currentLocation, "location");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "coordinate");
        v57 = ARLInfinityDistance(latitude, longitude, v55, v56);

        if (v57 > 60.0)
        {
          _ARLogSensor_3();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            v59 = (objc_class *)objc_opt_class();
            NSStringFromClass(v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            v114 = v60;
            v115 = 2048;
            v116 = self;
            v117 = 2049;
            *(_QWORD *)v118 = 0x404E000000000000;
            _os_log_impl(&dword_1B3A68000, v58, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Look up coordinate too far away (>%{private}f meters) from current location to perform VL altitude look up", buf, 0x20u);

          }
          ((void (**)(id, ARSkipTileBounds *))v12)[2](v12, v46);
          goto LABEL_71;
        }
        localizer = self->_localizer;
        v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
        locationManagerQueue = self->_locationManagerQueue;
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_50;
        v91[3] = &unk_1E6674050;
        v91[4] = self;
        v92 = v46;
        v93 = v12;
        v46 = v46;
        -[VLLocalizer determineAltitudesAtLocation:callbackQueue:callback:](localizer, "determineAltitudesAtLocation:callbackQueue:callback:", v89, locationManagerQueue, v91);

        v74 = v93;
        goto LABEL_59;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v85 = (objc_class *)objc_opt_class();
        NSStringFromClass(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v86;
        v115 = 2048;
        v116 = self;
        _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Altitude value is not available. Giving up.", buf, 0x16u);

      }
      objc_msgSend(v11, "timeIntervalSinceNow");
      v83 = fabs(v87);
      v84 = CFSTR("FailedDueToUnavailableAltitude");
    }
    else
    {
      v46 = -[ARSkipTileBounds initWithCoordinate:]([ARSkipTileBounds alloc], "initWithCoordinate:", latitude, longitude);
LABEL_51:
      v64 = a4 + 1;
      if (a4 + 1 <= 5)
      {
        v65 = _attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler__kDelayTimes[v64];
        _ARLogSensor_3();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          v67 = (objc_class *)objc_opt_class();
          NSStringFromClass(v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v68;
          v115 = 2048;
          v116 = self;
          v117 = 2048;
          *(double *)v118 = v65;
          _os_log_impl(&dword_1B3A68000, v66, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL Look up failed. Scheduling another attempt in %f seconds.", buf, 0x20u);

        }
        if (v46)
        {
          _ARLogSensor_3();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            v70 = (objc_class *)objc_opt_class();
            NSStringFromClass(v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v114 = v71;
            v115 = 2048;
            v116 = self;
            _os_log_impl(&dword_1B3A68000, v69, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Storing DEM bounds.", buf, 0x16u);

          }
          -[NSMutableArray addObject:](self->_altitudeSkipTiles, "addObject:", v46);
        }
        v72 = dispatch_time(0, (uint64_t)(float)(v65 * 1000000000.0));
        v73 = self->_locationManagerQueue;
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_43;
        v94[3] = &unk_1E6674028;
        v95 = v46;
        v96 = self;
        v99 = latitude;
        v100 = longitude;
        v101 = v64;
        v97 = v11;
        v98 = v12;
        v46 = v46;
        dispatch_after(v72, v73, v94);

        v74 = v95;
LABEL_59:

LABEL_71:
        goto LABEL_12;
      }
      _ARLogSensor_3();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v80 = (objc_class *)objc_opt_class();
        NSStringFromClass(v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v81;
        v115 = 2048;
        v116 = self;
        _os_log_impl(&dword_1B3A68000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: All CL altitude look up attempts have failed. Giving up.", buf, 0x16u);

      }
      objc_msgSend(v11, "timeIntervalSinceNow");
      v83 = fabs(v82);
      v84 = CFSTR("FailedDueToTimeout");
    }
    +[ARSessionMetrics recordAltitudeLookupAttemptWithDuration:andResult:](ARSessionMetrics, "recordAltitudeLookupAttemptWithDuration:andResult:", v84, v83);
    v12[2](v12, 0);
    goto LABEL_71;
  }
  v29 = a4 + 1;
  if (a4 + 1 > 5)
  {
    _ARLogSensor_3();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = (objc_class *)objc_opt_class();
      NSStringFromClass(v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v114 = v77;
      v115 = 2048;
      v116 = self;
      _os_log_impl(&dword_1B3A68000, v75, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: All CL altitude look up attempts have failed (no current location). Giving up.", buf, 0x16u);

    }
    objc_msgSend(v11, "timeIntervalSinceNow");
    v17 = fabs(v78);
    v16 = CFSTR("FailedDueToNoLocation");
    goto LABEL_10;
  }
  v30 = _attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler__kDelayTimes[v29];
  _ARLogSensor_3();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v114 = v33;
    v115 = 2048;
    v116 = self;
    v117 = 2048;
    *(double *)v118 = v30;
    _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor altitude lookup is too soon; current location hasn't been set yet. Trying again in %f seconds.",
      buf,
      0x20u);

  }
  v34 = dispatch_time(0, (uint64_t)(float)(v30 * 1000000000.0));
  v35 = self->_locationManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke;
  block[3] = &unk_1E6674000;
  block[4] = self;
  v109 = latitude;
  v110 = longitude;
  v111 = v29;
  v107 = v11;
  v108 = v12;
  dispatch_after(v34, v35, block);

LABEL_12:
}

uint64_t __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptAltitudeLookupAtCoordinate:attemptCount:lookupStartDate:completionHandler:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_43(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObject:");
  return objc_msgSend(*(id *)(a1 + 40), "_attemptAltitudeLookupAtCoordinate:attemptCount:lookupStartDate:completionHandler:", *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  uint64_t v40;
  int v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 40), "altitudeWgs84");
    v12 = v11;

    v13 = 0;
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v13 = 0;
      v14 = vabdd_f64(v10, v12);
      v15 = 1;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        objc_msgSend(*(id *)(a1 + 40), "altitudeWgs84");
        v20 = vabdd_f64(v18, v19);

        if (v20 < v14)
        {
          v14 = v20;
          v13 = v15;
        }
        ++v15;
      }
      while (v15 < objc_msgSend(v5, "count"));
    }
    _ARLogSensor_3();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "altitude");
      v26 = v25;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v41 = 138544131;
      v42 = v23;
      v43 = 2048;
      v44 = v24;
      v45 = 2049;
      v46 = v26;
      v47 = 2049;
      v48 = v28;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: High Resolution Altitude Lookup: SUCCESS (%{private}f :> %{private}f)", (uint8_t *)&v41, 0x2Au);

    }
    v29 = objc_alloc(MEMORY[0x1E0C9E450]);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v31;
    objc_msgSend(*(id *)(a1 + 40), "undulation");
    v34 = ARWGS84ToMSLAltitude(v32, v33);
    objc_msgSend(*(id *)(a1 + 40), "undulation");
    v36 = (void *)objc_msgSend(v29, "initWithEstimate:uncertainty:undulation:undulationModel:", objc_msgSend(*(id *)(a1 + 40), "undulationModel"), v34, -1.0, v35);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _ARLogSensor_3();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(a1 + 32);
      v41 = 138543874;
      v42 = v39;
      v43 = 2048;
      v44 = v40;
      v45 = 2112;
      v46 = v7;
      _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: High resolution (VL) altitude lookup failed, error=%@", (uint8_t *)&v41, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v7;
  NSObject *locationManagerQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  locationManagerQueue = self->_locationManagerQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ARLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke;
  v10[3] = &unk_1E6674078;
  v12 = latitude;
  v13 = longitude;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(locationManagerQueue, v10);

}

uint64_t __65__ARLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptAltitudeLookupAtCoordinate:attemptCount:lookupStartDate:completionHandler:", 0, 0, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)updateFromVisualLocalizationResult:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *locationManagerQueue;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  ARLocationSensor *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_isLiveSensor && (objc_msgSend(v4, "isSecure") & 1) == 0)
  {
    _ARLogSensor_3();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping update due to insecure location data.", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v5, "timestamp");
    if (v6 > self->_lastVLUpdateTimestamp)
    {
      objc_msgSend(v5, "timestamp");
      self->_lastVLUpdateTimestamp = v7;
      locationManagerQueue = self->_locationManagerQueue;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__ARLocationSensor_updateFromVisualLocalizationResult___block_invoke;
      v12[3] = &unk_1E6672118;
      v12[4] = self;
      v13 = v5;
      dispatch_async(locationManagerQueue, v12);

    }
  }

}

void __55__ARLocationSensor_updateFromVisualLocalizationResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float64x2_t v8;
  float64x2_t v9;
  void *v10;
  void *v11;
  void *v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  void *v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  float64x2_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  float64x2_t v34;
  float64x2_t v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "localizationResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "location");
      v8 = v34;
      v9 = v35;
    }
    else
    {
      v8 = 0uLL;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      v9 = 0uLL;
    }
    ARVector3Description((__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizationResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "transform");
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
    }
    v13.n128_f64[0] = ARMatrix4x4DoubleToFloat(&v26);
    ARMatrix4x4Description(1, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    *(_DWORD *)buf = 138544387;
    v38 = v4;
    v39 = 2048;
    v40 = v5;
    v41 = 2113;
    v42 = v10;
    v43 = 2113;
    v44 = v17;
    v45 = 2048;
    v46 = v18;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: updateFromVisualLocalizationResult: location = %{private}@, transform = %{private}@, time = %f", buf, 0x34u);

  }
  v19 = objc_alloc(MEMORY[0x1E0C9E470]);
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v21 = v20;
  objc_msgSend(*(id *)(a1 + 40), "localizationResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithTimestamp:localizationResult:", v22, v21);

  v24 = *(_QWORD *)(a1 + 32);
  v25 = 16;
  if (!*(_BYTE *)(v24 + 40))
    v25 = 24;
  objc_msgSend(*(id *)(v24 + v25), "_updateVLLocalizationResult:", v23, *(_OWORD *)&v26, v27, v28, v29, v30, v31, v32, v33, *(_OWORD *)&v34, *(_OWORD *)&v35, v36);

}

- (id)updateFromLocationData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  objc_class *v12;
  id v13;
  double v15;
  double v16;
  _CLLocationPlayer *locationPlayer;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  objc_class *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  int v33;
  void *v34;
  __int16 v35;
  ARLocationSensor *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_isLiveSensor)
  {
    _ARLogSensor_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v8;
      v35 = 2048;
      v36 = self;
      v9 = "%{public}@ <%p>: updateFromLocationData is only intended for use during replay; skipping.";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEBUG;
LABEL_7:
      _os_log_impl(&dword_1B3A68000, v10, v11, v9, (uint8_t *)&v33, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "isSecure"))
  {
    objc_msgSend(v5, "timestamp");
    if (v15 <= self->_lastLocationUpdateTimestamp)
      goto LABEL_9;
    objc_msgSend(v5, "timestamp");
    self->_lastLocationUpdateTimestamp = v16;
    locationPlayer = self->_locationPlayer;
    objc_msgSend(v5, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    -[_CLLocationPlayer _getFusedLocationFrom:machAbsTime:](locationPlayer, "_getFusedLocationFrom:machAbsTime:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v5;
    v21 = v20;
    if (!v19)
    {
      _ARLogSensor_3();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v31;
        v35 = 2048;
        v36 = self;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location fusion failed.", (uint8_t *)&v33, 0x16u);

      }
      v13 = v21;
      goto LABEL_22;
    }
    v13 = (id)objc_msgSend(v20, "copy");

    objc_msgSend(v13, "setLocation:", v19);
    v22 = objc_msgSend(v19, "isCoordinateFused");
    _ARLogSensor_3();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v22)
    {
      if (v24)
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543875;
        v34 = v26;
        v35 = 2048;
        v36 = self;
        v37 = 2113;
        v38 = v13;
        v27 = "%{public}@ <%p>: Updated to fused location: %{private}@.";
        v28 = v23;
        v29 = 32;
LABEL_21:
        _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v33, v29);

      }
    }
    else if (v24)
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v26;
      v35 = 2048;
      v36 = self;
      v27 = "%{public}@ <%p>: Fusion did not produce fused location.";
      v28 = v23;
      v29 = 22;
      goto LABEL_21;
    }
LABEL_22:

    -[ARLocationSensor setCurrentLocation:](self, "setCurrentLocation:", v13);
    goto LABEL_10;
  }
  _ARLogSensor_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543618;
    v34 = v8;
    v35 = 2048;
    v36 = self;
    v9 = "%{public}@ <%p>: updateFromLocationData expects insecure data.";
    v10 = v6;
    v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  v13 = v5;
LABEL_10:

  return v13;
}

- (id)updateFromDeviceOrientationData:(id)a3
{
  return a3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE v16[22];
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  _ARLogSensor_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "authorizationStatus");
    v9 = objc_msgSend(v4, "accuracyAuthorization");
    v10 = CFSTR("No");
    *(_DWORD *)v16 = 138544130;
    *(_WORD *)&v16[12] = 2048;
    *(_QWORD *)&v16[4] = v7;
    if (!v9)
      v10 = CFSTR("Yes");
    *(_QWORD *)&v16[14] = self;
    v17 = 1024;
    v18 = v8;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: authorization status changed: %i with precise location: %@", v16, 0x26u);

  }
  -[ARLocationSensor locationManagerDelegate](self, "locationManagerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[ARLocationSensor locationManagerDelegate](self, "locationManagerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locationManagerDidChangeAuthorization:", v4);

  }
  -[ARLocationSensor _validateLocationAuthorization](self, "_validateLocationAuthorization", *(_OWORD *)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ARLocationSensor delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sensor:didFailWithError:", self, v14);

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  ARLocationData *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  ARLocationSensor *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if (self->_isStopped)
  {
    _ARLogSensor_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v8;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Disregarding location update for stopped sensor", (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v5, "count");
    kdebug_trace();
    v9 = [ARLocationData alloc];
    objc_msgSend(v5, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ARLocationData initWithLocation:](v9, "initWithLocation:", v10);

    _ARLogSensor_3();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject description](v6, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v13;
      v22 = 2048;
      v23 = self;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: location update received: %@", (uint8_t *)&v20, 0x20u);

    }
    -[ARLocationSensor setCurrentLocation:](self, "setCurrentLocation:", v6);
    -[NSObject timestamp](v6, "timestamp");
    -[NSObject location](v6, "location");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "coordinate");
    -[NSObject location](v6, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinate");
    -[NSObject location](v6, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "horizontalAccuracy");
    kdebug_trace();

    -[ARLocationSensor delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[ARLocationSensor delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sensor:didOutputSensorData:", self, v6);

    }
    kdebug_trace();
    kdebug_trace();
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if (objc_msgSend(v6, "code"))
  {
    -[ARLocationSensor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ARLocationSensor delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sensor:didFailWithError:", self, v6);

    }
  }
  -[ARLocationSensor locationManagerDelegate](self, "locationManagerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[ARLocationSensor locationManagerDelegate](self, "locationManagerDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationManager:didFailWithError:", v13, v6);

  }
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLLocationManagerDelegate)locationManagerDelegate
{
  return (CLLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_locationManagerDelegate);
}

- (void)setLocationManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_locationManagerDelegate, a3);
}

- (ARLocationData)currentLocation
{
  return (ARLocationData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_destroyWeak((id *)&self->_locationManagerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_altitudeSkipTiles, 0);
  objc_storeStrong((id *)&self->_locationManagerQueue, 0);
  objc_storeStrong((id *)&self->_localizer, 0);
  objc_storeStrong((id *)&self->_locationPlayer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
