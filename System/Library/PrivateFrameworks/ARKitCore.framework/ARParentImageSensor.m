@implementation ARParentImageSensor

- (ARParentImageSensor)initWithSettings:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARParentImageSensor;
  v5 = -[ARParentImageSensor init](&v23, sel_init);
  if (v5)
  {
    if (!ARDeviceSupportsMulticamMode() || (ARUserDefaultsMulticamModeEnabled() & 1) == 0)
      ARDeviceSupportsJasper();
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v6;

    v8 = objc_opt_new();
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    v10 = objc_opt_new();
    v11 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v10;

    v12 = objc_msgSend(v4, "copy");
    v13 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v12;

    *((_BYTE *)v5 + 40) = 0;
    *((_BYTE *)v5 + 43) = 0;
    if (objc_msgSend(v4, "allowCameraInMultipleForegroundAppLayout"))
    {
      _ARLogSensor_1();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        v26 = 2048;
        v27 = v5;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting authorization to use camera in multiple foreground apps.", buf, 0x16u);

      }
      AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
    }
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.capture");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create_with_target_V2("com.apple.arkit.ARParentImageSensor.captureSessionNotificationsQueue", v19, *((dispatch_queue_t *)v5 + 2));
    v21 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v20;

    *((_DWORD *)v5 + 6) = 0;
    objc_msgSend(v5, "_addSensors");
  }

  return (ARParentImageSensor *)v5;
}

- (void)_addSensors
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[ARParentImageSensorSettings settings](self->_settings, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ARParentImageSensor _addSensorForSettings:](self, "_addSensorForSettings:", v5))
        ++v4;
      else
        objc_msgSend(v6, "removeObjectAtIndex:", v4);

    }
    while (v4 < objc_msgSend(v6, "count"));
  }
  -[ARParentImageSensorSettings setSettings:](self->_settings, "setSettings:", v6);

}

- (BOOL)_addSensorForSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ARFaceTrackingImageSensor *v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  __objc2_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  ARParentImageSensor *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "videoFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "captureDevicePosition") == 2)
    goto LABEL_4;
  objc_msgSend(v4, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8AA38]))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v4, "metaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8AA68]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v4, "videoFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "captureDevicePosition");

    if (v12 == 1)
    {
      objc_msgSend(v4, "videoFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "captureDeviceType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C89F80]);

      if (v15)
        v16 = ARDepthSensor;
      else
        v16 = ARImageSensor;
      v7 = (ARFaceTrackingImageSensor *)objc_msgSend([v16 alloc], "initWithSettings:captureSession:captureQueue:", v4, self->_captureSession, self->_captureQueue);
      if (v7)
        goto LABEL_6;
    }
    else
    {
      if (_ARLogGeneral_onceToken_8 != -1)
        dispatch_once(&_ARLogGeneral_onceToken_8, &__block_literal_global_219);
      v17 = (void *)_ARLogGeneral_logObj_8;
      if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_8, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v20;
        v24 = 2048;
        v25 = self;
        v26 = 2114;
        v27 = v4;
        _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create image sensor for settings: %{public}@", (uint8_t *)&v22, 0x20u);

      }
    }
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
LABEL_5:
  v7 = -[ARFaceTrackingImageSensor initWithSettings:captureSession:captureQueue:]([ARFaceTrackingImageSensor alloc], "initWithSettings:captureSession:captureQueue:", v4, self->_captureSession, self->_captureQueue);
  -[ARFaceTrackingImageSensor setRecordingMode:](v7, "setRecordingMode:", self->_recordingMode);
  if (!v7)
    goto LABEL_17;
LABEL_6:
  -[ARImageSensor setBufferPopulationMonitor:](v7, "setBufferPopulationMonitor:", self->_bufferPopulationMonitor);
  -[ARImageSensor setDataSource:](v7, "setDataSource:", self);
  -[NSMutableArray addObject:](self->_sensors, "addObject:", v7);

  v8 = 1;
LABEL_18:

  return v8;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sensors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDelegate:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)forceUpdatePowerUsage:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_powerUsage = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_sensors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "forceUpdatePowerUsage:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setPowerUsage:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_powerUsage = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_sensors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPowerUsage:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)canReconfigure:(id)a3
{
  id v4;
  os_unfair_lock_s *p_stateLock;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (-[ARParentImageSensor unrecoverable](self, "unrecoverable"))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)-[ARParentImageSensorSettings copy](self->_settings, "copy");
    objc_msgSend(v7, "setAudioCaptureEnabled:", objc_msgSend(v4, "audioCaptureEnabled"));
    objc_msgSend(v4, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(v7, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 == v11
      && (objc_msgSend(v4, "settings"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "setSettings:", v12),
          v12,
          objc_msgSend(v7, "isEqual:", v4)))
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 1;
      objc_msgSend(v4, "settings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __38__ARParentImageSensor_canReconfigure___block_invoke;
      v15[3] = &unk_1E66736B0;
      v15[4] = self;
      v15[5] = &v16;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

      v6 = *((_BYTE *)v17 + 24) != 0;
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v6 = 0;
    }

  }
  os_unfair_lock_unlock(p_stateLock);

  return v6;
}

void __38__ARParentImageSensor_canReconfigure___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "canReconfigure:", v8);

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)reconfigure:(id)a3
{
  id v4;
  void *v5;
  ARParentImageSensorSettings *v6;
  ARParentImageSensorSettings *v7;
  ARParentImageSensorSettings *v8;
  ARParentImageSensorSettings *settings;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  if (-[ARParentImageSensor canReconfigure:](self, "canReconfigure:", v4))
  {
    os_unfair_lock_lock(&self->_stateLock);
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__ARParentImageSensor_reconfigure___block_invoke;
    v13[3] = &unk_1E66736D8;
    v13[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

    LODWORD(v5) = objc_msgSend(v4, "audioCaptureEnabled");
    if ((_DWORD)v5 == -[ARParentImageSensorSettings audioCaptureEnabled](self->_settings, "audioCaptureEnabled"))
    {
      v8 = (ARParentImageSensorSettings *)objc_msgSend(v4, "copy");
      settings = self->_settings;
      self->_settings = v8;

    }
    else
    {
      if (objc_msgSend(v4, "audioCaptureEnabled"))
      {
        v12 = 0;
        if (!-[ARParentImageSensor _validateMicrophoneAuthorizationWithError:](self, "_validateMicrophoneAuthorizationWithError:", &v12))
        {
          v10 = v12;
          os_unfair_lock_unlock(&self->_stateLock);
          -[ARParentImageSensor delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sensor:didFailWithError:", self, v10);

          goto LABEL_8;
        }
      }
      v6 = (ARParentImageSensorSettings *)objc_msgSend(v4, "copy");
      v7 = self->_settings;
      self->_settings = v6;

      -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
      -[ARParentImageSensor _configureAudioCapture](self, "_configureAudioCapture");
      -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
    }
    os_unfair_lock_unlock(&self->_stateLock);
  }
LABEL_8:

}

void __35__ARParentImageSensor_reconfigure___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reconfigure:", v5);

}

- (void)setRecordingMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_recordingMode = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ARParentImageSensor sensors](self, "sensors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "setRecordingMode:", v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (unint64_t)providedDataTypes
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_sensors;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "providedDataTypes", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setInterrupted:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_interrupted != a3)
  {
    self->_interrupted = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_sensors;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setInterrupted:", self->_interrupted, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)start
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  ARParentImageSensor *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[ARParentImageSensor _validateCameraAuthorization](self, "_validateCameraAuthorization"))
  {
    os_unfair_lock_lock(&self->_stateLock);
    -[ARParentImageSensor settings](self, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "audioCaptureEnabled");

    if (v4
      && (v18 = 0,
          !-[ARParentImageSensor _validateMicrophoneAuthorizationWithError:](self, "_validateMicrophoneAuthorizationWithError:", &v18)))
    {
      v7 = v18;
      os_unfair_lock_unlock(&self->_stateLock);
      -[ARParentImageSensor delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sensor:didFailWithError:", self, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_captureSessionStateChanged_, *MEMORY[0x1E0C8A1C8], self->_captureSession);
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_captureSessionStateChanged_, *MEMORY[0x1E0C8A140], self->_captureSession);
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_captureSessionStateChanged_, *MEMORY[0x1E0C8A1B8], self->_captureSession);
      v17 = 0;
      v6 = -[ARParentImageSensor _startWithError:](self, "_startWithError:", &v17);
      v7 = v17;
      os_unfair_lock_unlock(&self->_stateLock);
      -[ARParentImageSensor delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v6)
      {
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          -[ARParentImageSensor delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sensorDidStart:", self);

        }
        if (-[ARParentImageSensor interrupted](self, "interrupted"))
        {
          -[ARParentImageSensor delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_opt_respondsToSelector();

          if ((v13 & 1) != 0)
          {
            -[ARParentImageSensor delegate](self, "delegate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "sensorDidPause:", self);

          }
        }
        _ARLogSensor_1();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v16;
          v21 = 2048;
          v22 = self;
          _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: started", buf, 0x16u);

        }
      }
      else
      {
        -[NSObject sensor:didFailWithError:](v8, "sensor:didFailWithError:", self, v7);
      }

    }
  }
}

- (BOOL)_startWithError:(id *)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  BOOL v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  ARParentImageSensor *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_stateLock);
  -[AVCaptureSession setSessionPreset:](self->_captureSession, "setSessionPreset:", *MEMORY[0x1E0C8A188]);
  -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_sensors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "prepareToStart", (_QWORD)v34);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v29 = (void *)v10;
          -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
          if (a3)
            *a3 = objc_retainAutorelease(v29);

          return 0;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[ARParentImageSensorSettings settings](self->_settings, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sensors, "objectAtIndexedSubscript:", v13, (_QWORD)v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARParentImageSensorSettings settings](self->_settings, "settings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enableSensor:", objc_msgSend(v16, "isEnabled"));

      ++v13;
      -[ARParentImageSensorSettings settings](self->_settings, "settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v18 > v13);
  }
  -[ARParentImageSensor _configureAudioCapture](self, "_configureAudioCapture", (_QWORD)v34);
  -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
  _ARLogSensor_1();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    v40 = 2048;
    v41 = self;
    _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: startRunning capture session", buf, 0x16u);

  }
  -[AVCaptureSession startRunning](self->_captureSession, "startRunning");
  if (!-[AVCaptureSession isRunning](self->_captureSession, "isRunning"))
  {
    _ARLogSensor_1();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      v40 = 2048;
      v41 = self;
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was started but the AVCaptureSession hasn't started running yet", buf, 0x16u);

    }
  }
  -[ARParentImageSensor setRunning:](self, "setRunning:", 1);
  if (-[AVCaptureSession isInterrupted](self->_captureSession, "isInterrupted"))
  {
    _ARLogSensor_1();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      v40 = 2048;
      v41 = self;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: starting interrupted", buf, 0x16u);

    }
    v28 = 1;
    -[ARParentImageSensor setInterrupted:](self, "setInterrupted:", 1);
  }
  else
  {
    if (-[ARParentImageSensor interrupted](self, "interrupted"))
    {
      _ARLogSensor_1();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        v40 = 2048;
        v41 = self;
        _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting sensor and forcing interrupted to NO", buf, 0x16u);

      }
      -[ARParentImageSensor setInterrupted:](self, "setInterrupted:", 0);
    }
    return 1;
  }
  return v28;
}

- (void)stop
{
  os_unfair_lock_s *p_stateLock;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  ARParentImageSensor *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (-[ARParentImageSensor running](self, "running"))
  {
    _ARLogSensor_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v6;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARImageSensor stopping", buf, 0x16u);

    }
    -[ARParentImageSensor setRunning:](self, "setRunning:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObserver:name:object:](v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8A1C8], self->_captureSession);
    -[NSObject removeObserver:name:object:](v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8A140], self->_captureSession);
    -[NSObject removeObserver:name:object:](v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8A1B8], self->_captureSession);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_sensors;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "stop", (_QWORD)v15);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");
    os_unfair_lock_unlock(p_stateLock);
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
    _ARLogSensor_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping the request to stop the sensor as it is not running.", buf, 0x16u);

    }
  }

}

- (void)waitForOutstandingCallbacks
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_captureQueue);
  dispatch_sync((dispatch_queue_t)self->_captureQueue, &__block_literal_global_27);
}

- (void)teardown
{
  os_unfair_lock_s *p_stateLock;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = self->_sensors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "teardown", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
  os_unfair_lock_unlock(p_stateLock);
}

- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3
{
  id v4;
  NSMutableArray *sensors;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sensors = self->_sensors;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ARParentImageSensor_captureHighResolutionFrameWithPhotoSettings___block_invoke;
  v7[3] = &unk_1E6673700;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](sensors, "enumerateObjectsUsingBlock:", v7);

}

void __67__ARParentImageSensor_captureHighResolutionFrameWithPhotoSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCapturingHighResolutionFrames");

  if (v7)
  {
    objc_msgSend(v8, "captureHighResolutionFrameWithPhotoSettings:", *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

}

- (void)_configureAudioCapture
{
  _BOOL4 v3;
  AVCaptureAudioDataOutput *audioOutput;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  AVCaptureAudioDataOutput *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  AVCaptureDeviceInput *v22;
  id v23;
  AVCaptureDeviceInput *audioInput;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  AVCaptureDeviceInput *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  NSObject *p_super;
  objc_class *v36;
  void *v37;
  void *v38;
  AVCaptureAudioDataOutput *v39;
  AVCaptureAudioDataOutput *v40;
  void *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  AVCaptureDeviceInput *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  AVCaptureDeviceInput *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  AVCaptureConnection *v63;
  AVCaptureConnection *audioConnection;
  NSObject *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  id v71;
  NSObject *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  ARParentImageSensor *v76;
  __int16 v77;
  void *v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_stateLock);
  if (-[ARParentImageSensorSettings audioCaptureEnabled](self->_settings, "audioCaptureEnabled") || self->_audioOutput)
  {
    v3 = -[ARParentImageSensorSettings audioCaptureEnabled](self->_settings, "audioCaptureEnabled");
    audioOutput = self->_audioOutput;
    if (v3)
    {
      if (audioOutput)
        return;
    }
    else if (audioOutput)
    {
      _ARLogSensor_1();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v7;
        v75 = 2048;
        v76 = self;
        _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Removing audio output", buf, 0x16u);

      }
      -[AVCaptureSession removeOutput:](self->_captureSession, "removeOutput:", self->_audioOutput);
      v8 = self->_audioOutput;
      self->_audioOutput = 0;

    }
    if (-[ARParentImageSensorSettings audioCaptureEnabled](self->_settings, "audioCaptureEnabled"))
    {
      _ARLogSensor_1();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v11;
        v75 = 2048;
        v76 = self;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting audio capture configuration", buf, 0x16u);

      }
      -[ARParentImageSensorSettings settings](self->_settings, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "videoFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "captureDevicePosition");

      if (!self->_audioInput)
      {
        v16 = (void *)MEMORY[0x1E0C8B0A8];
        v79[0] = *MEMORY[0x1E0C89F70];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x1E0C8A7A0];
        objc_msgSend(v16, "discoverySessionWithDeviceTypes:mediaType:position:", v17, *MEMORY[0x1E0C8A7A0], v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "devices");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithMediaType:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v71 = 0;
        objc_msgSend(MEMORY[0x1E0C8B0B0], "deviceInputWithDevice:error:", v21, &v71);
        v22 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
        v23 = v71;
        audioInput = self->_audioInput;
        self->_audioInput = v22;

        if (self->_audioInput
          && (-[ARParentImageSensor captureSession](self, "captureSession"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v25, "canAddInput:", self->_audioInput),
              v25,
              v26))
        {
          -[ARParentImageSensor captureSession](self, "captureSession");
          v27 = objc_claimAutoreleasedReturnValue();
          -[NSObject addInputWithNoConnections:](v27, "addInputWithNoConnections:", self->_audioInput);
        }
        else
        {
          _ARLogSensor_1();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "description");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v37;
            v75 = 2048;
            v76 = self;
            v77 = 2112;
            v78 = v38;
            _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating audio input: %@", buf, 0x20u);

          }
        }

      }
      v39 = (AVCaptureAudioDataOutput *)objc_opt_new();
      v40 = self->_audioOutput;
      self->_audioOutput = v39;

      -[AVCaptureAudioDataOutput setSampleBufferDelegate:queue:](self->_audioOutput, "setSampleBufferDelegate:queue:", self, self->_captureQueue);
      -[ARParentImageSensor captureSession](self, "captureSession");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "canAddOutput:", self->_audioOutput);

      _ARLogSensor_1();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v46;
          v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B3A68000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Adding audio output", buf, 0x16u);

        }
        -[ARParentImageSensor captureSession](self, "captureSession");
        v44 = objc_claimAutoreleasedReturnValue();
        -[NSObject addOutputWithNoConnections:](v44, "addOutputWithNoConnections:", self->_audioOutput);
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v48;
        v75 = 2048;
        v76 = self;
        _os_log_impl(&dword_1B3A68000, v44, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding audio output", buf, 0x16u);

      }
      if (!self->_audioConnection)
      {
        v49 = self->_audioInput;
        v50 = *MEMORY[0x1E0C8A7A0];
        -[AVCaptureDeviceInput device](v49, "device");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "deviceType");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](v49, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v50, v52, v15);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "firstObject");
        p_super = objc_claimAutoreleasedReturnValue();

        if (p_super)
          goto LABEL_41;
        v54 = self->_audioInput;
        -[AVCaptureDeviceInput device](v54, "device");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "deviceType");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](v54, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v50, v56, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "firstObject");
        p_super = objc_claimAutoreleasedReturnValue();

        _ARLogSensor_1();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = (objc_class *)objc_opt_class();
          NSStringFromClass(v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v60;
          v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B3A68000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Falling back to AVCaptureDevicePositionUnspecified.", buf, 0x16u);

        }
        if (p_super)
        {
LABEL_41:
          v61 = (void *)MEMORY[0x1E0C8B070];
          v72 = p_super;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "connectionWithInputPorts:output:", v62, self->_audioOutput);
          v63 = (AVCaptureConnection *)objc_claimAutoreleasedReturnValue();
          audioConnection = self->_audioConnection;
          self->_audioConnection = v63;

          _ARLogSensor_1();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = (objc_class *)objc_opt_class();
            NSStringFromClass(v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromAVCaptureDevicePosition(-[NSObject sourceDevicePosition](p_super, "sourceDevicePosition"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v67;
            v75 = 2048;
            v76 = self;
            v77 = 2112;
            v78 = v68;
            _os_log_impl(&dword_1B3A68000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Adding audio connection. Position: %@", buf, 0x20u);

          }
          -[AVCaptureSession addConnection:](self->_captureSession, "addConnection:", self->_audioConnection);
        }
        else
        {
          _ARLogSensor_1();
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            v69 = (objc_class *)objc_opt_class();
            NSStringFromClass(v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v74 = v70;
            v75 = 2048;
            v76 = self;
            _os_log_impl(&dword_1B3A68000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error finding audio port", buf, 0x16u);

          }
        }
LABEL_44:

      }
    }
    else
    {
      if (self->_audioInput)
      {
        _ARLogSensor_1();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v30;
          v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Removing audio input", buf, 0x16u);

        }
        -[AVCaptureSession removeInput:](self->_captureSession, "removeInput:", self->_audioInput);
        v31 = self->_audioInput;
        self->_audioInput = 0;

      }
      if (self->_audioConnection)
      {
        _ARLogSensor_1();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v34;
          v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Removing audio connection", buf, 0x16u);

        }
        p_super = &self->_audioConnection->super;
        self->_audioConnection = 0;
        goto LABEL_44;
      }
    }
  }
}

- (BOOL)_validateCameraAuthorization
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  os_unfair_lock_assert_not_owner(&self->_stateLock);
  v3 = *MEMORY[0x1E0C8A808];
  v4 = objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *MEMORY[0x1E0C8A808]);
  if (v4)
  {
    if (v4 == 2)
    {
      -[ARParentImageSensor delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(103, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sensor:didFailWithError:", self, v8);
      goto LABEL_6;
    }
    if (v4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ARKitCoreBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Camera use is restricted on this device."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);

      -[ARParentImageSensor delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(101, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sensor:didFailWithError:", self, v9);

LABEL_6:
      return 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x1E0C8B0A0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ARParentImageSensor__validateCameraAuthorization__block_invoke;
    v12[3] = &unk_1E6673728;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v11, "requestAccessForMediaType:completionHandler:", v3, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __51__ARParentImageSensor__validateCameraAuthorization__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v5 = objc_msgSend(WeakRetained, "running");
      v4 = v8;
      if (v5)
      {
        objc_msgSend(v8, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        ARErrorWithCodeAndUserInfo(103, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sensor:didFailWithError:", v8, v7);

        v4 = v8;
      }
    }
  }

}

- (BOOL)_validateMicrophoneAuthorizationWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL result;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = *MEMORY[0x1E0C8A7A0];
  v6 = objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *MEMORY[0x1E0C8A7A0]);
  if (v6)
  {
    if (v6 == 2)
    {
      if (a3)
      {
        ARErrorWithCodeAndUserInfo(104, 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a3 = v10;
        return result;
      }
      return 0;
    }
    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ARKitCoreBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Microphone use is restricted on this device."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D68]);

      if (a3)
      {
        ARErrorWithCodeAndUserInfo(101, v7);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0C8B0A0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__ARParentImageSensor__validateMicrophoneAuthorizationWithError___block_invoke;
    v13[3] = &unk_1E6673728;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v12, "requestAccessForMediaType:completionHandler:", v5, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __65__ARParentImageSensor__validateMicrophoneAuthorizationWithError___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v5 = objc_msgSend(WeakRetained, "running");
      v4 = v8;
      if (v5)
      {
        objc_msgSend(v8, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        ARErrorWithCodeAndUserInfo(104, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sensor:didFailWithError:", v8, v7);

        v4 = v8;
      }
    }
  }

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
  ARParentImageSensor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_1();
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
  -[ARParentImageSensor stop](self, "stop");
  -[ARParentImageSensor teardown](self, "teardown");
  v6.receiver = self;
  v6.super_class = (Class)ARParentImageSensor;
  -[ARParentImageSensor dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  ARBufferPopulationMonitor *bufferPopulationMonitor;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37A0];
  v22.receiver = self;
  v22.super_class = (Class)ARParentImageSensor;
  -[ARParentImageSensor description](&v22, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_stateLock);
  if (self->_running)
    v5 = CFSTR("Running");
  else
    v5 = CFSTR("Stopped");
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@ "), v5);
  if (self->_interrupted)
    objc_msgSend(v4, "appendFormat:", CFSTR("Interrupted "));
  if (self->_unrecoverable)
    objc_msgSend(v4, "appendFormat:", CFSTR("Unrecoverable "));
  -[ARParentImageSensorSettings description](self->_settings, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tImageSensorSettings: %@\n"), v7);

  objc_msgSend(v4, "appendFormat:", CFSTR("\tSensors:\n"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_sensors;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t|\t"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\t| - %@\n"), v13);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

  bufferPopulationMonitor = self->_bufferPopulationMonitor;
  if (bufferPopulationMonitor)
  {
    -[ARBufferPopulationMonitor description](bufferPopulationMonitor, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v15);

  }
  os_unfair_lock_unlock(&self->_stateLock);
  return (NSString *)v4;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  os_unfair_lock_s *p_stateLock;
  id v8;
  AVCaptureAudioDataOutput *v9;
  AVCaptureAudioDataOutput *audioOutput;
  ARAudioData *v11;
  id v12;

  p_stateLock = &self->_stateLock;
  v8 = a5;
  os_unfair_lock_lock(p_stateLock);
  objc_msgSend(v8, "output");
  v9 = (AVCaptureAudioDataOutput *)objc_claimAutoreleasedReturnValue();

  audioOutput = self->_audioOutput;
  os_unfair_lock_unlock(p_stateLock);
  if (v9 == audioOutput)
  {
    -[ARParentImageSensor delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[ARAudioData initWithSampleBuffer:]([ARAudioData alloc], "initWithSampleBuffer:", a4);
    objc_msgSend(v12, "sensor:didOutputSensorData:", self, v11);

  }
}

- (void)_captureSessionStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  ARParentImageSensor *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (!-[ARParentImageSensor running](self, "running"))
    goto LABEL_9;
  _ARLogSensor_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v7;
    v36 = 2048;
    v37 = self;
    v38 = 2114;
    v39 = v4;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: capture state changed (%{public}@)", buf, 0x20u);

  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8A1B8]);

  if (v9)
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A138]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "code") == -11873)
    {
      -[ARParentImageSensor setUnrecoverable:](self, "setUnrecoverable:", 1);
    }
    else
    {
      v14 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.attemptfailurerecovery"));
      if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.attemptfailurerecoveryafterbackground")))
      {
        if (!-[ARParentImageSensor interrupted](self, "interrupted") && !v14)
          goto LABEL_27;
      }
      else if (!v14)
      {
        goto LABEL_27;
      }
      _ARLogSensor_1();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v25;
        v36 = 2048;
        v37 = self;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recovering capture session due to AVCaptureSessionRuntimeErrorNotification. (%@)", buf, 0x20u);

      }
      v26 = -[ARParentImageSensor interrupted](self, "interrupted");
      if (-[ARParentImageSensor _startWithError:](self, "_startWithError:", 0))
      {
        -[ARParentImageSensor setInterrupted:](self, "setInterrupted:", 0);
        os_unfair_lock_unlock(&self->_stateLock);
        if (!v26)
          goto LABEL_32;
        -[ARParentImageSensor delegate](self, "delegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) == 0)
          goto LABEL_32;
        -[ARParentImageSensor delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sensorDidRestart:", self);
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
    }
LABEL_27:
    os_unfair_lock_unlock(&self->_stateLock);
    if (v11)
    {
      v32 = *MEMORY[0x1E0CB3388];
      v33 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(102, v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ARErrorWithCodeAndUserInfo(102, MEMORY[0x1E0C9AA70]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ARParentImageSensor delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sensor:didFailWithError:", self, v29);

    goto LABEL_31;
  }
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8A1C8]);

  if (v13)
  {
    if (-[ARParentImageSensor interrupted](self, "interrupted"))
    {
LABEL_9:
      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_33;
    }
    -[ARParentImageSensor setInterrupted:](self, "setInterrupted:", 1);
    os_unfair_lock_unlock(&self->_stateLock);
    -[ARParentImageSensor delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0)
      goto LABEL_33;
    -[ARParentImageSensor delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sensorDidPause:", self);
LABEL_19:

    goto LABEL_33;
  }
  objc_msgSend(v4, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C8A140]);

  if (v16)
  {
    v17 = -[ARParentImageSensor interrupted](self, "interrupted");
    -[ARParentImageSensor setInterrupted:](self, "setInterrupted:", 0);
    os_unfair_lock_unlock(&self->_stateLock);
    if (v17)
    {
      -[ARParentImageSensor delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        -[ARParentImageSensor delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sensorDidRestart:", self);
        goto LABEL_19;
      }
    }
  }
LABEL_33:

}

- (void)captureSessionStateChanged:(id)a3
{
  id v4;
  NSObject *captureSessionNotificationsQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  captureSessionNotificationsQueue = self->_captureSessionNotificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ARParentImageSensor_captureSessionStateChanged___block_invoke;
  block[3] = &unk_1E66721B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(captureSessionNotificationsQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__ARParentImageSensor_captureSessionStateChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_captureSessionStateChanged:", *(_QWORD *)(a1 + 32));

}

- (id)captureDeviceTypeToExtrinsicsMapForImageSensor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_sensors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "captureDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "captureDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        if ((v14 & 1) == 0)
        {
          v15 = (void *)MEMORY[0x1E0C8B0A0];
          objc_msgSend(v4, "captureDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "extrinsicMatrixFromDevice:toDevice:", v10, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v10, "deviceType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v18);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  return v20;
}

- (ARParentImageSensorSettings)settings
{
  return self->_settings;
}

- (NSMutableArray)sensors
{
  return self->_sensors;
}

- (void)setSensors:(id)a3
{
  objc_storeStrong((id *)&self->_sensors, a3);
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (AVCaptureDeviceInput)audioInput
{
  return self->_audioInput;
}

- (AVCaptureAudioDataOutput)audioOutput
{
  return self->_audioOutput;
}

- (AVCaptureConnection)audioConnection
{
  return self->_audioConnection;
}

- (BOOL)recordingMode
{
  return self->_recordingMode;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (BOOL)unrecoverable
{
  return self->_unrecoverable;
}

- (void)setUnrecoverable:(BOOL)a3
{
  self->_unrecoverable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioConnection, 0);
  objc_storeStrong((id *)&self->_audioOutput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sensors, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_captureSessionNotificationsQueue, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_bufferPopulationMonitor, 0);
}

@end
