@implementation ARImageSensor

- (ARImageSensor)initWithSettings:(id)a3 captureSession:(id)a4 captureQueue:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  void *v11;
  void *v12;
  ARImageSensor *v13;
  uint64_t v14;
  ARImageSensorSettings *settings;
  float v16;
  ARImageSensor *v17;
  void *v18;
  uint64_t v19;
  AVCaptureDevice *captureDevice;
  uint64_t v21;
  NSMutableArray *connections;
  uint64_t v23;
  NSMutableArray *captureDeviceKeysObserved;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (OS_dispatch_queue *)a5;
  objc_msgSend(v8, "videoFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v35.receiver = self;
    v35.super_class = (Class)ARImageSensor;
    v13 = -[ARImageSensor init](&v35, sel_init);
    if (v13)
    {
      v14 = objc_msgSend(v8, "copy");
      settings = v13->_settings;
      v13->_settings = (ARImageSensorSettings *)v14;

      if (objc_msgSend(v8, "autoFocusEnabled"))
        v16 = *MEMORY[0x1E0C89FD8];
      else
        +[ARImageSensor defaultLensPosition](ARImageSensor, "defaultLensPosition");
      v13->_defaultLensPosition = v16;
      objc_storeStrong((id *)&v13->_captureSession, a4);
      objc_msgSend(v8, "videoFormat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "device");
      v19 = objc_claimAutoreleasedReturnValue();
      captureDevice = v13->_captureDevice;
      v13->_captureDevice = (AVCaptureDevice *)v19;

      v13->_captureQueue = v10;
      v13->_powerUsage = 0;
      v21 = objc_opt_new();
      connections = v13->_connections;
      v13->_connections = (NSMutableArray *)v21;

      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("deviceWhiteBalanceGains"), CFSTR("exposureTargetOffset"), CFSTR("ISO"), 0);
      captureDeviceKeysObserved = v13->_captureDeviceKeysObserved;
      v13->_captureDeviceKeysObserved = (NSMutableArray *)v23;

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = v13->_captureDeviceKeysObserved;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v32;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v32 != v28)
              objc_enumerationMutation(v25);
            -[AVCaptureDevice addObserver:forKeyPath:options:context:](v13->_captureDevice, "addObserver:forKeyPath:options:context:", v13, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v29++), 1, v13);
          }
          while (v27 != v29);
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v27);
      }

    }
    self = v13;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (ARImageSensor)init
{
  objc_exception_throw(0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARImageSensor *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ dealloc", buf, 0x20u);

  }
  -[ARImageSensor stop](self, "stop");
  -[ARImageSensor teardown](self, "teardown");
  v7.receiver = self;
  v7.super_class = (Class)ARImageSensor;
  -[ARImageSensor dealloc](&v7, sel_dealloc);
}

- (ARImageSensorSettings)settings
{
  return (ARImageSensorSettings *)(id)-[ARImageSensorSettings copy](self->_settings, "copy");
}

- (ARImageSensorSettings)mutableSettings
{
  return self->_settings;
}

- (NSArray)outputsForSynchronizer
{
  void *v3;
  void *v4;

  if (self->_visionDataOutput || self->_calibrationOutput)
  {
    v3 = (void *)objc_opt_new();
    v4 = v3;
    if (self->_videoOutput)
      objc_msgSend(v3, "addObject:");
    if (self->_visionDataOutput)
      objc_msgSend(v4, "addObject:");
    if (self->_calibrationOutput)
      objc_msgSend(v4, "addObject:");
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (BOOL)canReconfigure:(id)a3
{
  ARImageSensorSettings *settings;
  id v4;
  void *v5;
  char v6;

  settings = self->_settings;
  v4 = a3;
  v5 = (void *)-[ARImageSensorSettings copy](settings, "copy");
  objc_msgSend(v5, "setAutoFocusEnabled:", objc_msgSend(v4, "autoFocusEnabled"));
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "isEnabled"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (void)reconfigure:(id)a3
{
  id v4;
  int v5;
  double v6;
  AVCaptureDevice *captureDevice;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  ARImageSensor *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ARImageSensor canReconfigure:](self, "canReconfigure:", v4))
  {
    v5 = objc_msgSend(v4, "autoFocusEnabled");
    if (v5 != -[ARImageSensorSettings autoFocusEnabled](self->_settings, "autoFocusEnabled"))
    {
      -[ARImageSensorSettings setAutoFocusEnabled:](self->_settings, "setAutoFocusEnabled:", objc_msgSend(v4, "autoFocusEnabled"));
      LODWORD(v6) = *MEMORY[0x1E0C89FD8];
      -[ARImageSensor setDefaultLensPosition:](self, "setDefaultLensPosition:", v6);
      captureDevice = self->_captureDevice;
      v18 = 0;
      v8 = -[AVCaptureDevice lockForConfiguration:](captureDevice, "lockForConfiguration:", &v18);
      v9 = v18;
      if (v8)
      {
        -[ARImageSensor _configureCameraFocusForDevice:](self, "_configureCameraFocusForDevice:", self->_captureDevice);
        -[AVCaptureDevice unlockForConfiguration](self->_captureDevice, "unlockForConfiguration");
      }
      else
      {
        _ARLogSensor_9();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v20 = v12;
          v21 = 2048;
          v22 = self;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock device for configuring focus mode change: %@", buf, 0x2Au);

        }
      }

    }
    v15 = objc_msgSend(v4, "isEnabled");
    if (v15 != -[ARImageSensorSettings isEnabled](self->_settings, "isEnabled"))
    {
      -[ARImageSensorSettings setEnabled:](self->_settings, "setEnabled:", objc_msgSend(v4, "isEnabled"));
      -[ARImageSensor captureSession](self, "captureSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "beginConfiguration");

      -[ARImageSensor enableSensor:](self, "enableSensor:", -[ARImageSensorSettings isEnabled](self->_settings, "isEnabled"));
      -[ARImageSensor captureSession](self, "captureSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "commitConfiguration");

    }
  }

}

- (id)logPrefix
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ARImageSensor settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureDeviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARImageSensor settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAVCaptureDevicePosition(objc_msgSend(v7, "captureDevicePosition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ - %@):"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)triggerVisionDataBurst
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARImageSensor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Vision data burst triggered", (uint8_t *)&v7, 0x20u);

  }
  -[AVCaptureVisionDataOutput triggerBurst](self->_visionDataOutput, "triggerBurst");
}

- (unint64_t)providedDataTypes
{
  return 1;
}

- (id)prepareToStart
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  char v12;
  AVCaptureDataOutputSynchronizer *outputSynchronizer;
  char v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  AVCaptureDataOutputSynchronizer *v20;
  AVCaptureDataOutputSynchronizer *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  Float64 Seconds;
  void *v47;
  void *v48;
  Float64 v49;
  NSObject *v50;
  objc_class *v51;
  id v52;
  id v53;
  AVCaptureDevice *captureDevice;
  Float64 v55;
  AVCaptureDevice *v56;
  Float64 v57;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  const __CFString *v63;
  NSObject *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTime time;
  id v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  ARImageSensor *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  Float64 v80;
  __int16 v81;
  Float64 v82;
  uint64_t v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v74 = v5;
    v75 = 2048;
    v76 = self;
    v77 = 2112;
    v78 = (uint64_t)v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ preparing to start", buf, 0x20u);

  }
  -[ARImageSensor setActiveFormat](self, "setActiveFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[ARImageSensor configureCaptureSession](self, "configureCaptureSession"),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    goto LABEL_6;
  }
  -[ARImageSensor outputsForSynchronizer](self, "outputsForSynchronizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureDataOutputSynchronizer dataOutputs](self->_outputSynchronizer, "dataOutputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToArray:", v10);

  if ((unint64_t)objc_msgSend(v10, "count") < 2 || (v12 & 1) == 0)
  {
    -[AVCaptureDataOutputSynchronizer setDelegate:queue:](self->_outputSynchronizer, "setDelegate:queue:", 0, 0);
    outputSynchronizer = self->_outputSynchronizer;
    self->_outputSynchronizer = 0;

  }
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
    v14 = 1;
  else
    v14 = v12;
  if ((v14 & 1) == 0)
  {
    _ARLogSensor_9();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v74 = v17;
      v75 = 2048;
      v76 = self;
      v77 = 2112;
      v78 = (uint64_t)v18;
      v79 = 2112;
      v80 = *(double *)&v19;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Outputs added to synchronizer: %@", buf, 0x2Au);

    }
    v20 = (AVCaptureDataOutputSynchronizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B078]), "initWithDataOutputs:", v10);
    v21 = self->_outputSynchronizer;
    self->_outputSynchronizer = v20;

  }
  -[AVCaptureDataOutputSynchronizer setDelegate:queue:](self->_outputSynchronizer, "setDelegate:queue:", self, self->_captureQueue);
  -[ARImageSensor captureDevice](self, "captureDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v23 = objc_msgSend(v22, "lockForConfiguration:", &v72);
  v24 = v72;

  if (v23)
  {
    -[ARImageSensor configureCaptureDevice](self, "configureCaptureDevice");
    -[ARImageSensor captureDevice](self, "captureDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "unlockForConfiguration");
    v8 = v24;
  }
  else
  {
    _ARLogSensor_9();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v74 = v28;
      v75 = 2048;
      v76 = self;
      v77 = 2112;
      v78 = (uint64_t)v29;
      v79 = 2112;
      v80 = *(double *)&v30;
      _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device for configuration: %@", buf, 0x2Au);

    }
    if (v24)
    {
      v83 = *MEMORY[0x1E0CB3388];
      v84[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0C9AA70];
    }
    ARErrorWithCodeAndUserInfo(101, v25);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_26;
  }

LABEL_26:
  if (v8)
  {
    v31 = v8;
  }
  else
  {
    -[AVCaptureVideoDataOutput connectionWithMediaType:](self->_videoOutput, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isCameraIntrinsicMatrixDeliverySupported");
    if (v33)
      objc_msgSend(v32, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);
    _ARLogSensor_9();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      v39 = CFSTR("unsupported");
      *(_DWORD *)buf = 138544130;
      v75 = 2048;
      v74 = v36;
      if (v33)
        v39 = CFSTR("supported");
      v76 = self;
      v77 = 2112;
      v78 = v37;
      v79 = 2112;
      v80 = *(double *)&v39;
      _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Intrinsics delivery is %@ by the connection", buf, 0x2Au);

    }
    _ARLogSensor_9();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureDevice activeFormat](self->_captureDevice, "activeFormat");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
        objc_msgSend(v44, "minExposureDuration");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      -[AVCaptureDevice activeFormat](self->_captureDevice, "activeFormat");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
        objc_msgSend(v47, "maxExposureDuration");
      else
        memset(&v70, 0, sizeof(v70));
      v49 = CMTimeGetSeconds(&v70);
      *(_DWORD *)buf = 138544386;
      v74 = v42;
      v75 = 2048;
      v76 = self;
      v77 = 2112;
      v78 = (uint64_t)v43;
      v79 = 2048;
      v80 = Seconds;
      v81 = 2048;
      v82 = v49;
      _os_log_impl(&dword_1B3A68000, v40, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Exposure duration supported: %f - %f", buf, 0x34u);

    }
    _ARLogSensor_9();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (id)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v53 = (id)objc_claimAutoreleasedReturnValue();
      captureDevice = self->_captureDevice;
      if (captureDevice)
        -[AVCaptureDevice activeVideoMinFrameDuration](captureDevice, "activeVideoMinFrameDuration");
      else
        memset(&v69, 0, sizeof(v69));
      v55 = CMTimeGetSeconds(&v69);
      v56 = self->_captureDevice;
      if (v56)
        -[AVCaptureDevice activeVideoMaxFrameDuration](v56, "activeVideoMaxFrameDuration");
      else
        memset(&v68, 0, sizeof(v68));
      v57 = CMTimeGetSeconds(&v68);
      *(_DWORD *)buf = 138544386;
      v74 = v52;
      v75 = 2048;
      v76 = self;
      v77 = 2112;
      v78 = (uint64_t)v53;
      v79 = 2048;
      v80 = v55;
      v81 = 2048;
      v82 = v57;
      _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Video frame duration: %f - %f", buf, 0x34u);

    }
    _ARLogSensor_9();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[AVCaptureDevice isVideoHDREnabled](self->_captureDevice, "isVideoHDREnabled"))
        v62 = CFSTR("Enabled");
      else
        v62 = CFSTR("Disabled");
      if (-[AVCaptureDevice automaticallyAdjustsVideoHDREnabled](self->_captureDevice, "automaticallyAdjustsVideoHDREnabled"))
      {
        *(double *)&v63 = COERCE_DOUBLE(CFSTR("Enabled"));
      }
      else
      {
        *(double *)&v63 = COERCE_DOUBLE(CFSTR("Disabled"));
      }
      *(_DWORD *)buf = 138544386;
      v74 = v60;
      v75 = 2048;
      v76 = self;
      v77 = 2112;
      v78 = (uint64_t)v61;
      v79 = 2112;
      v80 = *(double *)&v62;
      v81 = 2112;
      v82 = *(double *)&v63;
      _os_log_impl(&dword_1B3A68000, v58, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Video HDR: %@, Automatically adjusts video HDR: %@", buf, 0x34u);

    }
    _ARLogSensor_9();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v74 = v66;
      v75 = 2048;
      v76 = self;
      v77 = 2112;
      v78 = (uint64_t)v67;
      _os_log_impl(&dword_1B3A68000, v64, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ prepare to start complete", buf, 0x20u);

    }
  }

LABEL_6:
  return v8;
}

- (void)stop
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARImageSensor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[AVCaptureDataOutputSynchronizer setDelegate:queue:](self->_outputSynchronizer, "setDelegate:queue:", 0, 0);
  -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](self->_videoOutput, "setSampleBufferDelegate:queue:", 0, 0);
  -[AVCaptureCameraCalibrationDataOutput setDelegate:callbackQueue:](self->_calibrationOutput, "setDelegate:callbackQueue:", 0, 0);
  -[ARImageSensor resetExposureTracking](self, "resetExposureTracking");
  _ARLogSensor_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARImageSensor stop complete", (uint8_t *)&v7, 0x20u);

  }
}

- (void)teardown
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVCaptureDeviceInput *videoInput;
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
  v3 = self->_captureDeviceKeysObserved;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_captureDevice, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), self, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_captureDeviceKeysObserved, "removeAllObjects");
  if (self->_videoInput)
  {
    -[AVCaptureSession removeInput:](self->_captureSession, "removeInput:");
    videoInput = self->_videoInput;
    self->_videoInput = 0;

  }
}

- (void)start
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARImageSensor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ start called on a child image sensor instead of parent image sensor", (uint8_t *)&v7, 0x20u);

  }
}

- (void)forceUpdatePowerUsage:(unint64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  unint64_t powerUsage;
  AVCaptureDevice *captureDevice;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  id v16;
  AVCaptureDevice *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  Float64 Seconds;
  AVCaptureDevice *v24;
  Float64 v25;
  CMTime v26;
  CMTime time;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  ARImageSensor *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  Float64 v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    powerUsage = self->_powerUsage;
    *(_DWORD *)buf = 138544386;
    v30 = v7;
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = v8;
    v35 = 2048;
    v36 = *(double *)&powerUsage;
    v37 = 2048;
    v38 = a3;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Power usage changed from %li to %li", buf, 0x34u);

  }
  self->_powerUsage = a3;
  captureDevice = self->_captureDevice;
  v28 = 0;
  v11 = -[AVCaptureDevice lockForConfiguration:](captureDevice, "lockForConfiguration:", &v28);
  v12 = v28;
  if (v11)
  {
    -[ARImageSensor configureFrameRateForDevice:](self, "configureFrameRateForDevice:", self->_captureDevice);
    _ARLogSensor_9();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = self->_captureDevice;
      if (v17)
        -[AVCaptureDevice activeVideoMinFrameDuration](v17, "activeVideoMinFrameDuration");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      v24 = self->_captureDevice;
      if (v24)
        -[AVCaptureDevice activeVideoMaxFrameDuration](v24, "activeVideoMaxFrameDuration");
      else
        memset(&v26, 0, sizeof(v26));
      v25 = CMTimeGetSeconds(&v26);
      *(_DWORD *)buf = 138544386;
      v30 = v15;
      v31 = 2048;
      v32 = self;
      v33 = 2112;
      v34 = v16;
      v35 = 2048;
      v36 = Seconds;
      v37 = 2048;
      v38 = *(_QWORD *)&v25;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Power usage changed, video frame duration adjusted to %f-%f", buf, 0x34u);

    }
    -[AVCaptureDevice unlockForConfiguration](self->_captureDevice, "unlockForConfiguration");
  }
  else
  {
    _ARLogSensor_9();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v30 = v20;
      v31 = 2048;
      v32 = self;
      v33 = 2112;
      v34 = v21;
      v35 = 2112;
      v36 = *(double *)&v22;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device to change frame rate due to power usage: %@", buf, 0x2Au);

    }
  }

}

- (void)setPowerUsage:(unint64_t)a3
{
  if (self->_powerUsage != a3)
    -[ARImageSensor forceUpdatePowerUsage:](self, "forceUpdatePowerUsage:");
}

- (void)enableSensor:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
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

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ARImageSensor connections](self, "connections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v14.receiver = self;
  v14.super_class = (Class)ARImageSensor;
  -[ARImageSensor description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARImageSensor captureDevice](self, "captureDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v6);

  -[ARImageSensor captureDevice](self, "captureDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v8);

  -[ARImageSensor captureDevice](self, "captureDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAVCaptureDevicePosition(objc_msgSend(v9, "position"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v10);

  objc_msgSend(v5, "appendFormat:", CFSTR(" (%li fps)\n"), -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond"));
  -[ARImageSensorSettings description](self->_settings, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v12);

  return (NSString *)v5;
}

- (id)configureCaptureSession
{
  AVCaptureDeviceInput *videoInput;
  AVCaptureDevice *v4;
  AVCaptureDevice *captureDevice;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  FourCharCode MediaSubType;
  id v14;
  id v15;
  AVCaptureDevice *v16;
  AVCaptureDeviceInput *v17;
  AVCaptureDeviceInput *v18;
  AVCaptureDeviceInput *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  double v34;
  AVCaptureDevice *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  float v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  float v49;
  const char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint32_t v53;
  objc_class *v54;
  void *v55;
  int v56;
  NSObject *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  AVCaptureDeviceInput *v70;
  NSObject *v71;
  objc_class *v72;
  void *v73;
  void *v74;
  AVCaptureDeviceInput *v75;
  NSObject *v76;
  objc_class *v77;
  void *v78;
  void *v79;
  const char *v80;
  void *v81;
  uint64_t v82;
  Float64 Seconds;
  AVCaptureVideoDataOutput *v84;
  AVCaptureVideoDataOutput *videoOutput;
  NSObject *v86;
  objc_class *v87;
  void *v88;
  void *v89;
  AVCaptureDeviceInput *v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  AVCaptureConnection *v100;
  AVCaptureConnection *videoConnection;
  NSObject *v102;
  objc_class *v103;
  void *v104;
  void *v105;
  objc_class *v106;
  NSObject *v107;
  objc_class *v108;
  void *v109;
  void *v110;
  const char *v111;
  objc_class *v112;
  CMTime time;
  CMTime v115;
  CMTime v116;
  id v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint8_t buf[4];
  void *v122;
  __int16 v123;
  ARImageSensor *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  Float64 v128;
  __int16 v129;
  AVCaptureDevice *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  videoInput = self->_videoInput;
  if (!videoInput)
    goto LABEL_8;
  -[AVCaptureDeviceInput device](videoInput, "device");
  v4 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
  captureDevice = self->_captureDevice;

  if (v4 == captureDevice)
  {
    -[AVCaptureDeviceInput device](self->_videoInput, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v12, "formatDescription"));

    if (MediaSubType != 875704422)
    {
      _ARLogSensor_9();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v122 = v40;
        v123 = 2048;
        v124 = self;
        v125 = 2112;
        v126 = v41;
        v127 = 1024;
        LODWORD(v128) = MediaSubType;
        _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported pixel format: %d", buf, 0x26u);

      }
      goto LABEL_19;
    }
    if (self->_videoInput)
    {
      v14 = 0;
      goto LABEL_50;
    }
LABEL_8:
    v15 = objc_alloc(MEMORY[0x1E0C8B0B0]);
    v16 = self->_captureDevice;
    v117 = 0;
    v17 = (AVCaptureDeviceInput *)objc_msgSend(v15, "initWithDevice:error:", v16, &v117);
    v14 = v117;
    v18 = self->_videoInput;
    self->_videoInput = v17;

    v19 = self->_videoInput;
    if (!v19)
    {
      _ARLogSensor_9();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v34 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v35 = self->_captureDevice;
        *(_DWORD *)buf = 138544386;
        v122 = v32;
        v123 = 2048;
        v124 = self;
        v125 = 2112;
        v126 = v33;
        v127 = 2112;
        v128 = v34;
        v129 = 2112;
        v130 = v35;
        _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Error creating capture input for image sensor: %@ (%@)", buf, 0x34u);

      }
      if (v14)
      {
        v119 = *MEMORY[0x1E0CB3388];
        v120 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 101;
        v38 = v36;
LABEL_78:
        ARErrorWithCodeAndUserInfo(v37, v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_85:
        return v42;
      }
      v81 = (void *)MEMORY[0x1E0C9AA70];
      v82 = 101;
LABEL_71:
      ARErrorWithCodeAndUserInfo(v82, v81);
      v92 = (id)objc_claimAutoreleasedReturnValue();
LABEL_84:
      v42 = v92;
      goto LABEL_85;
    }
    -[AVCaptureDeviceInput setCenterStageAllowed:](v19, "setCenterStageAllowed:", 0);
    -[AVCaptureDeviceInput setBackgroundBlurAllowed:](self->_videoInput, "setBackgroundBlurAllowed:", 0);
    if (!-[ARImageSensorSettings visionDataOutputEnabled](self->_settings, "visionDataOutputEnabled"))
    {
LABEL_24:
      -[ARImageSensorSettings maxGainOverride](self->_settings, "maxGainOverride");
      if (v44 <= 0.0)
      {
LABEL_32:
        if (-[ARImageSensorSettings calibrationDataOutputEnabled](self->_settings, "calibrationDataOutputEnabled"))
        {
          -[AVCaptureDevice activeFormat](self->_captureDevice, "activeFormat");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "isCameraCalibrationDataDeliverySupported");

          if (v56)
          {
            -[AVCaptureDeviceInput setCameraCalibrationDataDeliveryEnabled:](self->_videoInput, "setCameraCalibrationDataDeliveryEnabled:", 1);
          }
          else
          {
            _ARLogSensor_9();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              v58 = (objc_class *)objc_opt_class();
              NSStringFromClass(v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARImageSensor logPrefix](self, "logPrefix");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v122 = v59;
              v123 = 2048;
              v124 = self;
              v125 = 2112;
              v126 = v60;
              _os_log_impl(&dword_1B3A68000, v57, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Does not support camera calibration delivery", buf, 0x20u);

            }
          }
        }
        if (!-[AVCaptureSession canAddInput:](self->_captureSession, "canAddInput:", self->_videoInput))
        {
          _ARLogSensor_9();
          v76 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
LABEL_70:

            v82 = 102;
            v81 = 0;
            goto LABEL_71;
          }
          v77 = (objc_class *)objc_opt_class();
          NSStringFromClass(v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v122 = v78;
          v123 = 2048;
          v124 = self;
          v125 = 2112;
          v126 = v79;
          v80 = "%{public}@ <%p>: %@ Cannot add video data input to the capture session";
LABEL_69:
          _os_log_impl(&dword_1B3A68000, v76, OS_LOG_TYPE_ERROR, v80, buf, 0x20u);

          goto LABEL_70;
        }
        -[AVCaptureSession addInputWithNoConnections:](self->_captureSession, "addInputWithNoConnections:", self->_videoInput);
        _ARLogSensor_9();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v122 = v63;
          v123 = 2048;
          v124 = self;
          v125 = 2112;
          v126 = v64;
          _os_log_impl(&dword_1B3A68000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data input to the capture session", buf, 0x20u);

        }
        -[ARImageSensorSettings videoFormat](self->_settings, "videoFormat");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "frameRatesByPowerUsage");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "doubleValue");
        v69 = v68;

        CMTimeMake(&v116, 1, (int)v69);
        v70 = self->_videoInput;
        v115 = v116;
        -[AVCaptureDeviceInput setVideoMinFrameDurationOverride:](v70, "setVideoMinFrameDurationOverride:", &v115);
        _ARLogSensor_9();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v72 = (objc_class *)objc_opt_class();
          NSStringFromClass(v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = self->_videoInput;
          if (v75)
            -[AVCaptureDeviceInput videoMinFrameDurationOverride](v75, "videoMinFrameDurationOverride");
          else
            memset(&time, 0, sizeof(time));
          Seconds = CMTimeGetSeconds(&time);
          *(_DWORD *)buf = 138544130;
          v122 = v73;
          v123 = 2048;
          v124 = self;
          v125 = 2112;
          v126 = v74;
          v127 = 2048;
          v128 = Seconds;
          _os_log_impl(&dword_1B3A68000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Video min frame duration override set to %f", buf, 0x2Au);

        }
LABEL_50:
        if (self->_videoOutput)
          goto LABEL_55;
        v84 = (AVCaptureVideoDataOutput *)objc_opt_new();
        videoOutput = self->_videoOutput;
        self->_videoOutput = v84;

        if (-[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", self->_videoOutput))
        {
          -[AVCaptureSession addOutputWithNoConnections:](self->_captureSession, "addOutputWithNoConnections:", self->_videoOutput);
          _ARLogSensor_9();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
          {
            v87 = (objc_class *)objc_opt_class();
            NSStringFromClass(v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v122 = v88;
            v123 = 2048;
            v124 = self;
            v125 = 2112;
            v126 = v89;
            _os_log_impl(&dword_1B3A68000, v86, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data output to the capture session", buf, 0x20u);

          }
LABEL_55:
          v90 = self->_videoInput;
          if (self->_videoConnection)
            goto LABEL_56;
          v93 = *MEMORY[0x1E0C8A808];
          -[AVCaptureDeviceInput device](self->_videoInput, "device");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "deviceType");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVCaptureDeviceInput device](self->_videoInput, "device");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](v90, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v93, v95, objc_msgSend(v96, "position"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            v98 = (void *)MEMORY[0x1E0C8B070];
            v118 = v36;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "connectionWithInputPorts:output:", v99, self->_videoOutput);
            v100 = (AVCaptureConnection *)objc_claimAutoreleasedReturnValue();
            videoConnection = self->_videoConnection;
            self->_videoConnection = v100;

            if (-[AVCaptureSession canAddConnection:](self->_captureSession, "canAddConnection:", self->_videoConnection))
            {
              -[NSMutableArray addObject:](self->_connections, "addObject:", self->_videoConnection);
              -[AVCaptureSession addConnection:](self->_captureSession, "addConnection:", self->_videoConnection);
              _ARLogSensor_9();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
              {
                v103 = (objc_class *)objc_opt_class();
                NSStringFromClass(v103);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                -[ARImageSensor logPrefix](self, "logPrefix");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v122 = v104;
                v123 = 2048;
                v124 = self;
                v125 = 2112;
                v126 = v105;
                _os_log_impl(&dword_1B3A68000, v102, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data connection to the capture session", buf, 0x20u);

              }
              v90 = self->_videoInput;
LABEL_56:
              if (-[AVCaptureDeviceInput isCameraCalibrationDataDeliveryEnabled](v90, "isCameraCalibrationDataDeliveryEnabled"))
              {
                -[ARImageSensor configureCaptureSessionCalibration](self, "configureCaptureSessionCalibration");
                v91 = (void *)objc_claimAutoreleasedReturnValue();

                if (v91)
                {
LABEL_61:
                  v92 = v91;
LABEL_83:
                  v14 = v92;
                  goto LABEL_84;
                }
                v14 = 0;
              }
              -[AVCaptureVideoDataOutput setAlwaysDiscardsLateVideoFrames:](self->_videoOutput, "setAlwaysDiscardsLateVideoFrames:", 1);
              -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](self->_videoOutput, "setSampleBufferDelegate:queue:", self, self->_captureQueue);
              if (-[AVCaptureDeviceInput isVisionDataDeliveryEnabled](self->_videoInput, "isVisionDataDeliveryEnabled"))
              {
                -[ARImageSensor _configureVisionDataOutputForSession:](self, "_configureVisionDataOutputForSession:", self->_captureSession);
                v91 = (void *)objc_claimAutoreleasedReturnValue();

                if (v91)
                  goto LABEL_61;
                v14 = 0;
              }
              if (!-[ARImageSensorSettings supportsCapturingHighResolutionFrames](self->_settings, "supportsCapturingHighResolutionFrames"))
              {
                v42 = 0;
                goto LABEL_85;
              }
              -[ARImageSensor _configurePhotoOutputForCaptureSession:](self, "_configurePhotoOutputForCaptureSession:", self->_captureSession);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v42)
              {
                v14 = 0;
                goto LABEL_85;
              }
              v92 = v42;
              goto LABEL_83;
            }
            _ARLogSensor_9();
            v107 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              goto LABEL_77;
            v112 = (objc_class *)objc_opt_class();
            NSStringFromClass(v112);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v122 = v109;
            v123 = 2048;
            v124 = self;
            v125 = 2112;
            v126 = v110;
            v111 = "%{public}@ <%p>: %@ Cannot add video connection to capture session";
          }
          else
          {
            _ARLogSensor_9();
            v107 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            {
LABEL_77:

              v37 = 102;
              v38 = 0;
              goto LABEL_78;
            }
            v108 = (objc_class *)objc_opt_class();
            NSStringFromClass(v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v122 = v109;
            v123 = 2048;
            v124 = self;
            v125 = 2112;
            v126 = v110;
            v111 = "%{public}@ <%p>: %@ Cannot find a video port in the input added to the capture session";
          }
          _os_log_impl(&dword_1B3A68000, v107, OS_LOG_TYPE_ERROR, v111, buf, 0x20u);

          goto LABEL_77;
        }
        _ARLogSensor_9();
        v76 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        v106 = (objc_class *)objc_opt_class();
        NSStringFromClass(v106);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v122 = v78;
        v123 = 2048;
        v124 = self;
        v125 = 2112;
        v126 = v79;
        v80 = "%{public}@ <%p>: %@ Cannot add video data output to the capture session";
        goto LABEL_69;
      }
      if (-[AVCaptureDeviceInput isMaxGainOverrideSupported](self->_videoInput, "isMaxGainOverrideSupported"))
      {
        -[ARImageSensorSettings maxGainOverride](self->_settings, "maxGainOverride");
        -[AVCaptureDeviceInput setMaxGainOverride:](self->_videoInput, "setMaxGainOverride:");
        _ARLogSensor_9();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVCaptureDeviceInput maxGainOverride](self->_videoInput, "maxGainOverride");
          *(_DWORD *)buf = 138544130;
          v122 = v47;
          v123 = 2048;
          v124 = self;
          v125 = 2112;
          v126 = v48;
          v127 = 2048;
          v128 = v49;
          v50 = "%{public}@ <%p>: %@ Camera max gain override set to %f";
          v51 = v45;
          v52 = OS_LOG_TYPE_DEFAULT;
          v53 = 42;
LABEL_30:
          _os_log_impl(&dword_1B3A68000, v51, v52, v50, buf, v53);

        }
      }
      else
      {
        _ARLogSensor_9();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v122 = v47;
          v123 = 2048;
          v124 = self;
          v125 = 2112;
          v126 = v48;
          v50 = "%{public}@ <%p>: %@ Overriding max gain is not supported by the device.";
          v51 = v45;
          v52 = OS_LOG_TYPE_ERROR;
          v53 = 32;
          goto LABEL_30;
        }
      }

      goto LABEL_32;
    }
    -[ARImageSensor captureDevice](self, "captureDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isVisionDataDeliverySupported");

    if (v22)
    {
      -[AVCaptureDeviceInput setVisionDataDeliveryEnabled:](self->_videoInput, "setVisionDataDeliveryEnabled:", 1);
      _ARLogSensor_9();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v122 = v25;
        v123 = 2048;
        v124 = self;
        v125 = 2112;
        v126 = v26;
        v27 = "%{public}@ <%p>: %@ Vision data delivery enabled";
        v28 = v23;
        v29 = OS_LOG_TYPE_DEFAULT;
LABEL_22:
        _os_log_impl(&dword_1B3A68000, v28, v29, v27, buf, 0x20u);

      }
    }
    else
    {
      _ARLogSensor_9();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v122 = v25;
        v123 = 2048;
        v124 = self;
        v125 = 2112;
        v126 = v26;
        v27 = "%{public}@ <%p>: %@ Vision data delivery requested but not supported by device format. Sensor will continu"
              "e with standard outputs.";
        v28 = v23;
        v29 = OS_LOG_TYPE_ERROR;
        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
  _ARLogSensor_9();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDeviceInput device](self->_videoInput, "device");
    v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138544130;
    v122 = v8;
    v123 = 2048;
    v124 = self;
    v125 = 2112;
    v126 = v9;
    v127 = 2112;
    v128 = v10;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported capture device: %@", buf, 0x2Au);

  }
LABEL_19:

  ARErrorWithCodeAndUserInfo(150, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  return v42;
}

- (id)_configurePhotoOutputForCaptureSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  AVCapturePhotoOutput *v13;
  AVCapturePhotoOutput *photoOutput;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  ARImageSensor *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_photoOutput)
  {
    v5 = 0;
  }
  else
  {
    +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.photoQualityPrioritization"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "integerValue") + 1;
    else
      v8 = 1;
    _ARLogSensor_9();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v11;
      v21 = 2048;
      v22 = self;
      v23 = 2112;
      v24 = v12;
      v25 = 2048;
      v26 = v8;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Using photo quality prioritization: %ld", (uint8_t *)&v19, 0x2Au);

    }
    v13 = (AVCapturePhotoOutput *)objc_opt_new();
    photoOutput = self->_photoOutput;
    self->_photoOutput = v13;

    -[AVCapturePhotoOutput setMaxPhotoQualityPrioritization:](self->_photoOutput, "setMaxPhotoQualityPrioritization:", v8);
    if (objc_msgSend(v4, "canAddOutput:", self->_photoOutput))
    {
      objc_msgSend(v4, "addOutput:", self->_photoOutput);
      v15 = (void *)objc_opt_class();
      -[AVCaptureDevice activeFormat](self->_captureDevice, "activeFormat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCapturePhotoOutput setMaxPhotoDimensions:](self->_photoOutput, "setMaxPhotoDimensions:", objc_msgSend(v15, "maxPhotoDimensionsForVideoFormat:maximumHeight:", v16, 3024));

      -[AVCapturePhotoOutput connectionWithMediaType:](self->_photoOutput, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_connections, "addObject:", v17);

      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8A2F8], -11861, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[ARImageSensorSettings focusPixelBlurScoreDeliveryEnabled](self->_settings, "focusPixelBlurScoreDeliveryEnabled")&& -[AVCapturePhotoOutput isFocusPixelBlurScoreSupported](self->_photoOutput, "isFocusPixelBlurScoreSupported"))
    {
      -[AVCapturePhotoOutput setFocusPixelBlurScoreEnabled:](self->_photoOutput, "setFocusPixelBlurScoreEnabled:", 1);
    }

  }
  return v5;
}

- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ARImageSensor _defaultPhotoSettings](self, "_defaultPhotoSettings");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[AVCapturePhotoOutput capturePhotoWithSettings:delegate:](self->_photoOutput, "capturePhotoWithSettings:delegate:", v5, self);

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  double Width;
  double Height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ARImageData *v24;
  int64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  ARImageData *v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  ARImageSensor *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a4);
  v7 = (__CVBuffer *)objc_msgSend(v6, "pixelBuffer");
  if (v7)
  {
    v8 = v7;
    Width = (double)CVPixelBufferGetWidth(v7);
    Height = (double)CVPixelBufferGetHeight(v8);
    -[AVCameraCalibrationData intrinsicMatrix](self->_cameraCalibrationData, "intrinsicMatrix");
    v34 = v12;
    v35 = v11;
    v33 = v13;
    -[AVCameraCalibrationData intrinsicMatrixReferenceDimensions](self->_cameraCalibrationData, "intrinsicMatrixReferenceDimensions");
    if (v14 != Width || v15 != Height)
    {
      *(float *)&v17 = ARAdjustIntrinsicsForViewportSize(*(float *)&v35, v34, v33, v14, v15, Width, Height);
      v34 = v18;
      v35 = v17;
      v33 = v19;
    }
    objc_msgSend(v6, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("{Exif}"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("{TIFF}"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "focusPixelBlurScore");
    CVBufferSetAttachment(v8, CFSTR("FocusPixelBlurScore"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), kCVAttachmentMode_ShouldPropagate);
    v24 = [ARImageData alloc];
    v25 = -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond");
    -[ARImageSensor captureDevice](self, "captureDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureSession](self, "captureSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v6, "timestamp");
    else
      memset(v36, 0, sizeof(v36));
    v32 = -[ARImageData initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:](v24, "initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:", v8, v25, v26, v27, v36, v21, v35, v34, v33, v23);

    -[ARImageData setHighResolution:](v32, "setHighResolution:", 1);
    -[ARImageData setCalibrationData:](v32, "setCalibrationData:", self->_cameraCalibrationData);
    +[ARImageSensor registerSignPostForImageData:](ARImageSensor, "registerSignPostForImageData:", v32);
    -[ARImageSensor _dispatchImageData:](self, "_dispatchImageData:", v32);

  }
  else
  {
    _ARLogSensor_9();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v30;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Failed to capture a high resolution frame.", buf, 0x20u);

    }
    -[ARImageSensor delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(107, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sensor:didFailWithError:", self, v23);
  }

}

- (id)configureCaptureSessionCalibration
{
  AVCaptureCameraCalibrationDataOutput *v4;
  AVCaptureCameraCalibrationDataOutput *calibrationOutput;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  AVCaptureDeviceInput *videoInput;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AVCaptureConnection *v23;
  AVCaptureConnection *calibrationConnection;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  const char *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  ARImageSensor *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (self->_calibrationOutput)
    return 0;
  v4 = (AVCaptureCameraCalibrationDataOutput *)objc_alloc_init(MEMORY[0x1E0C8B068]);
  calibrationOutput = self->_calibrationOutput;
  self->_calibrationOutput = v4;

  if (-[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", self->_calibrationOutput))
  {
    -[AVCaptureSession addOutputWithNoConnections:](self->_captureSession, "addOutputWithNoConnections:", self->_calibrationOutput);
    _ARLogSensor_9();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v8;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = v9;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added calibration data output to the capture session", buf, 0x20u);

    }
    if (self->_calibrationConnection)
      goto LABEL_7;
    videoInput = self->_videoInput;
    v15 = *MEMORY[0x1E0C8A7B0];
    -[AVCaptureDeviceInput device](videoInput, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDeviceInput device](self->_videoInput, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](videoInput, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v15, v17, objc_msgSend(v18, "position"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0C8B070];
      v36 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "connectionWithInputPorts:output:", v22, self->_calibrationOutput);
      v23 = (AVCaptureConnection *)objc_claimAutoreleasedReturnValue();
      calibrationConnection = self->_calibrationConnection;
      self->_calibrationConnection = v23;

      if (-[AVCaptureSession canAddConnection:](self->_captureSession, "canAddConnection:", self->_calibrationConnection))
      {
        -[NSMutableArray addObject:](self->_connections, "addObject:", self->_calibrationConnection);
        -[AVCaptureSession addConnection:](self->_captureSession, "addConnection:", self->_calibrationConnection);
        _ARLogSensor_9();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v27;
          v39 = 2048;
          v40 = self;
          v41 = 2112;
          v42 = v28;
          _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added calibration data connection to the capture session", buf, 0x20u);

        }
LABEL_7:
        -[AVCaptureCameraCalibrationDataOutput setAlwaysDiscardsLateCameraCalibrationData:](self->_calibrationOutput, "setAlwaysDiscardsLateCameraCalibrationData:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.calibrationData.alwaysDiscardsLateData")));
        -[AVCaptureCameraCalibrationDataOutput setDelegate:callbackQueue:](self->_calibrationOutput, "setDelegate:callbackQueue:", self, self->_captureQueue);
        return 0;
      }
      _ARLogSensor_9();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v31;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = v32;
      v33 = "%{public}@ <%p>: %@ Cannot add calibration connection to capture session";
    }
    else
    {
      _ARLogSensor_9();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        ARErrorWithCodeAndUserInfo(102, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        return v35;
      }
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v31;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = v32;
      v33 = "%{public}@ <%p>: %@ Cannot find a calibration port in the input added to the capture session";
    }
    _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);

    goto LABEL_21;
  }
  _ARLogSensor_9();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v12;
    v39 = 2048;
    v40 = self;
    v41 = 2112;
    v42 = v13;
    _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add calibration data output to the capture session", buf, 0x20u);

  }
  ARErrorWithCodeAndUserInfo(102, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)configureCaptureDevice
{
  id v3;

  -[ARImageSensor captureDevice](self, "captureDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ARImageSensor configureFrameRateForDevice:](self, "configureFrameRateForDevice:", v3);
  -[ARImageSensor _configureCameraExposureForDevice:](self, "_configureCameraExposureForDevice:", v3);
  -[ARImageSensor _configureCameraWhiteBalanceForDevice:](self, "_configureCameraWhiteBalanceForDevice:", v3);
  -[ARImageSensor _configureCameraFocusForDevice:](self, "_configureCameraFocusForDevice:", v3);
  -[ARImageSensor _configureImageControlModeForDevice:](self, "_configureImageControlModeForDevice:", v3);
  -[ARImageSensor configureGeometricDistortionCorrectionForDevice:](self, "configureGeometricDistortionCorrectionForDevice:", v3);

}

- (void)updateCaptureDeviceFrameRate:(double)a3
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARImageSensor *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ARImageSensor captureDevice](self, "captureDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v5, "lockForConfiguration:", &v15);
  v7 = v15;

  if (v6)
  {
    -[ARImageSensor captureDevice](self, "captureDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor _configureFrameRateForDevice:frameRate:](self, "_configureFrameRateForDevice:frameRate:", v8, a3);

    -[ARImageSensor captureDevice](self, "captureDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlockForConfiguration");

  }
  else
  {
    if (_ARLogSession_onceToken_2 != -1)
      dispatch_once(&_ARLogSession_onceToken_2, &__block_literal_global_485);
    v10 = (void *)_ARLogSession_logObj_2;
    if (os_log_type_enabled((os_log_t)_ARLogSession_logObj_2, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v17 = v13;
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Encountered error updating capture device frame rate %@", buf, 0x2Au);

    }
  }

}

- (id)setActiveFormat
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v31[3];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  ARImageSensor *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[ARImageSensor captureDevice](self, "captureDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v4 = objc_msgSend(v3, "lockForConfiguration:", v31);
  v5 = v31[0];

  if (v4)
  {
    -[ARImageSensorSettings videoFormat](self->_settings, "videoFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveFormat:", v7);

    -[ARImageSensor captureDevice](self, "captureDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0C89F90];
    LODWORD(v7) = v10 == (void *)*MEMORY[0x1E0C89F90];

    if ((_DWORD)v7)
    {
      -[ARImageSensorSettings videoFormat](self->_settings, "videoFormat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "depthDataFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor captureDevice](self, "captureDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActiveDepthDataFormat:", v13);

    }
    _ARLogSensor_9();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[AVCaptureDevice activeFormat](self->_captureDevice, "activeFormat");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v17;
      v34 = 2048;
      v35 = self;
      v36 = 2112;
      v37 = v18;
      v38 = 2112;
      v39 = v20;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Active format selected: %@", buf, 0x2Au);

    }
    -[AVCaptureDevice deviceType](self->_captureDevice, "deviceType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == v11;

    if (v22)
    {
      _ARLogSensor_9();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        -[AVCaptureDevice activeDepthDataFormat](self->_captureDevice, "activeDepthDataFormat");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v25;
        v34 = 2048;
        v35 = self;
        v36 = 2112;
        v37 = v26;
        v38 = 2112;
        v39 = v28;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Active depth data format selected: %@", buf, 0x2Au);

      }
    }
    -[ARImageSensor captureDevice](self, "captureDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "unlockForConfiguration");

  }
  return v5;
}

- (void)configureFrameRateForDevice:(id)a3
{
  ARImageSensorSettings *settings;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  settings = self->_settings;
  v10 = a3;
  -[ARImageSensorSettings videoFormat](settings, "videoFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameRatesByPowerUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", -[ARImageSensor powerUsage](self, "powerUsage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[ARImageSensor _configureFrameRateForDevice:frameRate:](self, "_configureFrameRateForDevice:frameRate:", v10, v9);
}

- (void)_configureFrameRateForDevice:(id)a3 frameRate:(double)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  id v16;
  Float64 Seconds;
  CMTime time;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  ARImageSensor *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CMTimeMake(&v24, 1, (int)a4);
  v23 = v24;
  objc_msgSend(v6, "setActiveVideoMinFrameDuration:", &v23);
  CMTimeMake(&v22, 1, (int)a4);
  v21 = v22;
  objc_msgSend(v6, "setActiveVideoMaxFrameDuration:", &v21);
  -[ARImageSensor setCaptureFramesPerSecond:](self, "setCaptureFramesPerSecond:", (uint64_t)a4);
  _ARLogSensor_9();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v26 = v9;
    v27 = 2048;
    v28 = self;
    v29 = 2112;
    v30 = v10;
    v31 = 2048;
    v32 = a4;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARImageSensor Capture frames per second set to %f", buf, 0x2Au);

  }
  objc_msgSend(v6, "deviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == (void *)*MEMORY[0x1E0C89F90];

  if (v12)
  {
    CMTimeMake(&v20, 1, (int)(a4 * 0.25));
    v19 = v20;
    objc_msgSend(v6, "setActiveDepthDataMinFrameDuration:", &v19);
    _ARLogSensor_9();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v6, "activeDepthDataMinFrameDuration");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138544130;
      v26 = v15;
      v27 = 2048;
      v28 = self;
      v29 = 2112;
      v30 = v16;
      v31 = 2048;
      v32 = Seconds;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Depth min frame duration changed to: %f", buf, 0x2Au);

    }
  }

}

- (void)_configureCameraExposureForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString **v9;
  __CFString **v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  Float64 v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  Float64 v40;
  Float64 Seconds;
  void *v42;
  int v43;
  CMTime v44;
  CMTime time;
  CMTime v46;
  CMTime time2;
  CMTime v48;
  _QWORD v49[5];
  id v50;
  CMTime v51;
  CMTime location;
  void *v53;
  __int16 v54;
  Float64 v55;
  __int16 v56;
  Float64 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "position") != 1)
  {
    if (objc_msgSend(v4, "position") == 2)
    {
      v9 = ARFrontFacingImageSensorISOUserDefaultsKey;
      v10 = ARFrontFacingImageSensorExposureDurationUserDefaultsKey;
      goto LABEL_9;
    }
LABEL_7:
    v11 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C89FA0];

  if (v5 == v6)
  {
    v9 = ARBackFacingWideImageSensorISOUserDefaultsKey;
    v10 = ARBackFacingWideImageSensorExposureDurationUserDefaultsKey;
    goto LABEL_9;
  }
  objc_msgSend(v4, "deviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0C89F98];

  if (v7 != v8)
    goto LABEL_7;
  v9 = ARBackFacingUltraWideImageSensorISOUserDefaultsKey;
  v10 = ARBackFacingUltraWideImageSensorExposureDurationUserDefaultsKey;
LABEL_9:
  +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", *v10);
  v12 = objc_claimAutoreleasedReturnValue();
  +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", *v9);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  if (v12 | v11)
  {
    v51 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0C89FC8];
    if (v12)
    {
      objc_msgSend((id)v12, "doubleValue");
      CMTimeMake(&v51, (uint64_t)(v13 * 1000.0), 1000000);
    }
    if (v11)
    {
      objc_msgSend((id)v11, "floatValue");
      v15 = v14;
    }
    else
    {
      v15 = *MEMORY[0x1E0C89FD0];
    }
    objc_initWeak((id *)&location, v4);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __51__ARImageSensor__configureCameraExposureForDevice___block_invoke;
    v49[3] = &unk_1E6675770;
    v49[4] = self;
    objc_copyWeak(&v50, (id *)&location);
    v48 = v51;
    objc_msgSend(v4, "setExposureModeCustomWithDuration:ISO:completionHandler:", &v48, v49, COERCE_DOUBLE(__PAIR64__(HIDWORD(v51.value), v15)));
    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)&location);
  }
  else if (objc_msgSend(v4, "isExposureModeSupported:", 2))
  {
    if (objc_msgSend(v4, "isExposurePointOfInterestSupported"))
    {
      objc_msgSend(v4, "setExposurePointOfInterest:", 0.5, 0.5);
      _ARLogSensor_9();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "exposurePointOfInterest");
        v21 = v20;
        objc_msgSend(v4, "exposurePointOfInterest");
        LODWORD(location.value) = 138544386;
        *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v18;
        LOWORD(location.flags) = 2048;
        *(_QWORD *)((char *)&location.flags + 2) = self;
        HIWORD(location.epoch) = 2112;
        v53 = v19;
        v54 = 2048;
        v55 = v21;
        v56 = 2048;
        v57 = v22;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Exposure point of interest set at %f, %f", (uint8_t *)&location, 0x34u);

      }
    }
    objc_msgSend(v4, "setExposureMode:", 2);
    _ARLogSensor_9();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location.value) = 138543874;
      *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v25;
      LOWORD(location.flags) = 2048;
      *(_QWORD *)((char *)&location.flags + 2) = self;
      HIWORD(location.epoch) = 2112;
      v53 = v26;
      _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Exposure mode set to AVCaptureExposureModeContinuousAutoExposure", (uint8_t *)&location, 0x20u);

    }
    memset(&v51, 0, sizeof(v51));
    CMTimeMake(&v51, 1, 60);
    objc_msgSend(v4, "activeFormat");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      objc_msgSend(v27, "maxExposureDuration");
    else
      memset(&time2, 0, sizeof(time2));
    location = v51;
    v29 = CMTimeCompare(&location, &time2) < 1;

    if (v29)
    {
      v46 = v51;
      objc_msgSend(v4, "setActiveMaxExposureDuration:", &v46);
      _ARLogSensor_9();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          objc_msgSend(v4, "activeMaxExposureDuration");
        else
          memset(&time, 0, sizeof(time));
        Seconds = CMTimeGetSeconds(&time);
        LODWORD(location.value) = 138544130;
        *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v38;
        LOWORD(location.flags) = 2048;
        *(_QWORD *)((char *)&location.flags + 2) = self;
        HIWORD(location.epoch) = 2112;
        v53 = v39;
        v54 = 2048;
        v55 = Seconds;
        _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Max exposure set to %f", (uint8_t *)&location, 0x2Au);

      }
    }
    else
    {
      _ARLogSensor_9();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        location = v51;
        v34 = CMTimeGetSeconds(&location);
        objc_msgSend(v4, "activeFormat");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
          objc_msgSend(v35, "maxExposureDuration");
        else
          memset(&v44, 0, sizeof(v44));
        v40 = CMTimeGetSeconds(&v44);
        LODWORD(location.value) = 138544386;
        *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v32;
        LOWORD(location.flags) = 2048;
        *(_QWORD *)((char *)&location.flags + 2) = self;
        HIWORD(location.epoch) = 2112;
        v53 = v33;
        v54 = 2048;
        v55 = v34;
        v56 = 2048;
        v57 = v40;
        _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Max exposure out of range: %f > %f", (uint8_t *)&location, 0x34u);

      }
    }

  }
  if (-[ARImageSensorSettings videoHDRAllowed](self->_settings, "videoHDRAllowed", v44.value, *(_QWORD *)&v44.timescale, v44.epoch, time.value, *(_QWORD *)&time.timescale, time.epoch))
  {
    objc_msgSend(v4, "setAutomaticallyAdjustsVideoHDREnabled:", 1);
  }
  else
  {
    objc_msgSend(v4, "setAutomaticallyAdjustsVideoHDREnabled:", 0);
    objc_msgSend(v4, "activeFormat");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isVideoHDRSupported");

    if (v43)
      objc_msgSend(v4, "setVideoHDREnabled:", 0);
  }

}

void __51__ARImageSensor__configureCameraExposureForDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  Float64 Seconds;
  id v11;
  float v12;
  CMTime time;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  Float64 v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "exposureDuration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    v11 = objc_loadWeakRetained(v7);
    objc_msgSend(v11, "ISO");
    *(_DWORD *)buf = 138544386;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = Seconds;
    v22 = 2048;
    v23 = v12;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Exposure duration set at %f, ISO %f", buf, 0x34u);

  }
}

- (void)_configureCameraWhiteBalanceForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString **v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _BYTE location[12];
  __int16 v35;
  ARImageSensor *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "position") == 1)
  {
    objc_msgSend(v4, "deviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0C89FA0];

    if (v5 != v6)
    {
      objc_msgSend(v4, "deviceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)*MEMORY[0x1E0C89F98];

      if (v7 == v8)
      {
        v9 = ARBackFacingUltraWideImageSensorWhiteBalanceUserDefaultsKey;
        goto LABEL_9;
      }
LABEL_7:
      v10 = 0;
      goto LABEL_15;
    }
    v9 = ARBackFacingWideImageSensorWhiteBalanceUserDefaultsKey;
  }
  else
  {
    if (objc_msgSend(v4, "position") != 2)
      goto LABEL_7;
    v9 = ARFrontFacingImageSensorWhiteBalanceUserDefaultsKey;
  }
LABEL_9:
  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", *v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if (v11)
  {
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
    v12 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v12, "count") == 3)
    {
      -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      objc_initWeak((id *)location, v4);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __55__ARImageSensor__configureCameraWhiteBalanceForDevice___block_invoke;
      v32[3] = &unk_1E6675798;
      objc_copyWeak(&v33, (id *)location);
      v32[4] = self;
      LODWORD(v22) = v15;
      LODWORD(v23) = v18;
      LODWORD(v24) = v21;
      objc_msgSend(v4, "setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:completionHandler:", v32, v22, v23, v24);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)location);
LABEL_18:

      goto LABEL_19;
    }
    _ARLogSensor_9();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544130;
      *(_QWORD *)&location[4] = v27;
      v35 = 2048;
      v36 = self;
      v37 = 2112;
      v38 = v28;
      v39 = 2048;
      v40 = -[NSObject count](v12, "count");
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Custom white balance user defaults does not contain 3 values as expected (number of values found: %tu) ", location, 0x2Au);

    }
  }
LABEL_15:
  if (objc_msgSend(v4, "isWhiteBalanceModeSupported:", 2))
  {
    objc_msgSend(v4, "setWhiteBalanceMode:", 2);
    _ARLogSensor_9();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v30;
      v35 = 2048;
      v36 = self;
      v37 = 2112;
      v38 = v31;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Continuous auto white balance enabled", location, 0x20u);

    }
    goto LABEL_18;
  }
LABEL_19:

}

void __55__ARImageSensor__configureCameraWhiteBalanceForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceWhiteBalanceGains");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  _ARLogSensor_9();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "logPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v11;
    v16 = 2048;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2048;
    v21 = v4;
    v22 = 2048;
    v23 = v6;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Custom white balance gains set at %f, %f, %f", (uint8_t *)&v14, 0x3Eu);

  }
}

- (void)_configureCameraFocusForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  id v21;
  void *v22;
  double v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id from;
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  ARImageSensor *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogSensor_9();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v7;
    v36 = 2048;
    v37 = self;
    v38 = 2112;
    v39 = v8;
    v40 = 2048;
    v41 = COERCE_DOUBLE(objc_msgSend(v9, "autoFocusSystem"));
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Auto focus system: %li", buf, 0x2Au);

  }
  if (objc_msgSend(v4, "position") != 1)
  {
    _ARLogSensor_9();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v12;
      v36 = 2048;
      v37 = self;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Focus is only configured for back facing image sensor", buf, 0x20u);

    }
    goto LABEL_20;
  }
  if (-[ARImageSensorSettings autoFocusEnabled](self->_settings, "autoFocusEnabled"))
  {
    if (objc_msgSend(v4, "isFocusModeSupported:", 1))
    {
      objc_msgSend(v4, "setFocusMode:", 1);
      -[ARImageSensor setRunningSingleShotAutoFocus:](self, "setRunningSingleShotAutoFocus:", 1);
    }
    else
    {
      -[ARImageSensor enableAutoFocusForDevice:](self, "enableAutoFocusForDevice:", v4);
    }
    goto LABEL_21;
  }
  if (!objc_msgSend(v4, "isLockingFocusWithCustomLensPositionSupported"))
  {
    _ARLogSensor_9();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v25;
      v36 = 2048;
      v37 = self;
      v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Unable to lock lens position", buf, 0x20u);

    }
LABEL_20:

    goto LABEL_21;
  }
  -[ARImageSensor defaultLensPosition](self, "defaultLensPosition");
  v15 = v14;
  if (objc_msgSend(v4, "position") == 1
    && (objc_msgSend(v4, "deviceType"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = v16 == (void *)*MEMORY[0x1E0C89FA0],
        v16,
        v17))
  {
    +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.lensPosition"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;
    if (v27)
    {
      objc_msgSend(v27, "floatValue");
      v15 = v28;
    }
  }
  else
  {
    v18 = 0;
  }
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  _ARLogSensor_9();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v21;
    v36 = 2048;
    v37 = self;
    v38 = 2112;
    v39 = v22;
    v40 = 2048;
    v41 = v15;
    _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Setting lens position to %f", buf, 0x2Au);

  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __48__ARImageSensor__configureCameraFocusForDevice___block_invoke;
  v29[3] = &unk_1E66757C0;
  v29[4] = self;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(&v31, &location);
  *(float *)&v23 = v15;
  objc_msgSend(v4, "setFocusModeLockedWithLensPosition:completionHandler:", v29, v23);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_21:
}

void __48__ARImageSensor__configureCameraFocusForDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  float v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "logPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "lensPosition");
    v10 = 138544130;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Lens position set at %f", (uint8_t *)&v10, 0x2Au);

  }
}

- (void)_configureImageControlModeForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARImageSensor *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isImageControlModeSupported:", 1))
  {
    objc_msgSend(v4, "setAutomaticallyAdjustsImageControlMode:", 0);
    objc_msgSend(v4, "setImageControlMode:", 1);
  }
  _ARLogSensor_9();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544386;
    v10 = v7;
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    v15 = 1024;
    v16 = objc_msgSend(v4, "automaticallyAdjustsImageControlMode");
    v17 = 2048;
    v18 = objc_msgSend(v4, "imageControlMode");
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Capture device image control mode: %i, %li", (uint8_t *)&v9, 0x30u);

  }
}

- (void)configureGeometricDistortionCorrectionForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  objc_class *v15;
  int v16;
  void *v17;
  __int16 v18;
  ARImageSensor *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "position") == 2)
  {
    _ARLogSensor_9();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v7;
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = v8;
      v9 = "%{public}@ <%p>: %@ Configuring geometric distortion correction on front facing camera is not supported";
LABEL_11:
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, 0x20u);
LABEL_12:

    }
  }
  else if (objc_msgSend(v4, "isGeometricDistortionCorrectionSupported"))
  {
    -[ARImageSensor settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGeometricDistortionCorrectionEnabled:", objc_msgSend(v10, "backFacingCameraGeometricDistortionCorrectionEnabled"));

    _ARLogSensor_9();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor settings](self, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "backFacingCameraGeometricDistortionCorrectionEnabled");
      v14 = CFSTR("disabled");
      v16 = 138544130;
      v18 = 2048;
      v17 = v7;
      if (v13)
        v14 = CFSTR("enabled");
      v19 = self;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Capture device geometric distortion correction: %@", (uint8_t *)&v16, 0x2Au);

      goto LABEL_12;
    }
  }
  else
  {
    _ARLogSensor_9();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v7;
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = v8;
      v9 = "%{public}@ <%p>: %@ Device doesn't support geometric distortion correction";
      goto LABEL_11;
    }
  }

}

- (void)enableAutoFocusForDevice:(id)a3
{
  id v4;
  AVCaptureDevice *captureDevice;
  BOOL v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  objc_class *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  ARImageSensor *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  captureDevice = self->_captureDevice;
  v43 = 0;
  v6 = -[AVCaptureDevice lockForConfiguration:](captureDevice, "lockForConfiguration:", &v43);
  v7 = v43;
  if (v6)
  {
    if (objc_msgSend(v4, "isFocusPointOfInterestSupported"))
    {
      objc_msgSend(v4, "setFocusPointOfInterest:", 0.5, 0.5);
      _ARLogSensor_9();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "focusPointOfInterest");
        v13 = v12;
        objc_msgSend(v4, "focusPointOfInterest");
        *(_DWORD *)buf = 138544386;
        v45 = v10;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v11;
        v50 = 2048;
        v51 = v13;
        v52 = 2048;
        v53 = v14;
        _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Focus point of interest at at %f, %f", buf, 0x34u);

      }
    }
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.smoothAutoFocus")))
    {
      if (!objc_msgSend(v4, "isSmoothAutoFocusSupported"))
      {
LABEL_16:
        +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.autoFocusRange"));
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_30;
        objc_msgSend(v4, "deviceType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)*MEMORY[0x1E0C89FA0];

        if (v28 != v29)
          goto LABEL_30;
        if ((-[NSObject isEqualToString:](v22, "isEqualToString:", CFSTR("near")) & 1) != 0)
        {
          v30 = 1;
        }
        else if ((-[NSObject isEqualToString:](v22, "isEqualToString:", CFSTR("far")) & 1) != 0)
        {
          v30 = 2;
        }
        else
        {

          v30 = 0;
          v22 = CFSTR("none");
        }
        if (objc_msgSend(v4, "isAutoFocusRangeRestrictionSupported"))
        {
          objc_msgSend(v4, "setAutoFocusRangeRestriction:", v30);
          _ARLogSensor_9();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v45 = v33;
            v46 = 2048;
            v47 = self;
            v48 = 2112;
            v49 = v34;
            v50 = 2112;
            v51 = (const __CFString *)v22;
            v35 = "%{public}@ <%p>: %@ Focus range restriction set to %@";
            v36 = v31;
            v37 = 42;
LABEL_28:
            _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_INFO, v35, buf, v37);

          }
        }
        else
        {
          _ARLogSensor_9();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v45 = v33;
            v46 = 2048;
            v47 = self;
            v48 = 2112;
            v49 = v34;
            v35 = "%{public}@ <%p>: %@ Device does not support auto focus range restriction";
            v36 = v31;
            v37 = 32;
            goto LABEL_28;
          }
        }

LABEL_30:
        if (objc_msgSend(v4, "isFocusModeSupported:", 2))
        {
          objc_msgSend(v4, "setFocusMode:", 2);
          _ARLogSensor_9();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v45 = v41;
            v46 = 2048;
            v47 = self;
            v48 = 2112;
            v49 = v42;
            _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Continuous auto focus enabled", buf, 0x20u);

          }
        }
        objc_msgSend(v4, "unlockForConfiguration");
        goto LABEL_35;
      }
      objc_msgSend(v4, "setSmoothAutoFocusEnabled:", 1);
      _ARLogSensor_9();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v17;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v18;
        v19 = "%{public}@ <%p>: %@ Smooth auto focus enabled";
        v20 = v15;
        v21 = 32;
LABEL_14:
        _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);

      }
    }
    else
    {
      _ARLogSensor_9();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v45 = v17;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v18;
        v50 = 2112;
        v51 = CFSTR("disabled");
        v19 = "%{public}@ <%p>: %@ Smooth auto focus %@ by user defaults";
        v20 = v15;
        v21 = 42;
        goto LABEL_14;
      }
    }

    goto LABEL_16;
  }
  _ARLogSensor_9();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v45 = v24;
    v46 = 2048;
    v47 = self;
    v48 = 2112;
    v49 = v25;
    v50 = 2112;
    v51 = v26;
    _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device to enable auto focus: %@", buf, 0x2Au);

  }
LABEL_35:

}

- (id)_configureVisionDataOutputForSession:(id)a3
{
  id v4;
  void *v5;
  AVCaptureVisionDataOutput *v7;
  AVCaptureVisionDataOutput *visionDataOutput;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  float v46;
  float v47;
  double v48;
  double v49;
  AVCaptureVisionDataOutput *v50;
  AVCaptureVisionDataOutput *v51;
  AVCaptureVisionDataOutput *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  AVCaptureDeviceInput *videoInput;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  AVCaptureConnection *v82;
  AVCaptureConnection *visionDataConnection;
  NSObject *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  objc_class *v88;
  void *v89;
  void *v90;
  CMTime v91;
  CMTime v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  CMTime v97;
  CMTime v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  ARImageSensor *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  _QWORD v107[4];

  v107[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_visionDataOutput)
  {
    v7 = (AVCaptureVisionDataOutput *)objc_opt_new();
    visionDataOutput = self->_visionDataOutput;
    self->_visionDataOutput = v7;

    if (objc_msgSend(v4, "canAddOutput:", self->_visionDataOutput))
      objc_msgSend(v4, "addOutputWithNoConnections:", self->_visionDataOutput);
    if (self->_visionDataConnection)
      goto LABEL_7;
    videoInput = self->_videoInput;
    -[AVCaptureDeviceInput device](videoInput, "device");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "deviceType");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDeviceInput device](self->_videoInput, "device");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](videoInput, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", *MEMORY[0x1E0C8A810], v76, objc_msgSend(v77, "position"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "firstObject");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79)
    {
      v80 = (void *)MEMORY[0x1E0C8B070];
      v107[0] = v79;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "connectionWithInputPorts:output:", v81, self->_visionDataOutput);
      v82 = (AVCaptureConnection *)objc_claimAutoreleasedReturnValue();
      visionDataConnection = self->_visionDataConnection;
      self->_visionDataConnection = v82;

      if (-[AVCaptureSession canAddConnection:](self->_captureSession, "canAddConnection:", self->_visionDataConnection))
      {
        -[NSMutableArray addObject:](self->_connections, "addObject:", self->_visionDataConnection);
        -[AVCaptureSession addConnection:](self->_captureSession, "addConnection:", self->_visionDataConnection);

LABEL_7:
        -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          _ARLogSensor_9();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v11 = (objc_class *)objc_opt_class();
            NSStringFromClass(v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v100 = v12;
            v101 = 2048;
            v102 = self;
            v103 = 2112;
            v104 = v13;
            v105 = 2112;
            v106 = v15;
            _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Setting vision data output parameters from dictionary: %@", buf, 0x2Au);

          }
          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0CFCA18]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "valueForKey:", *MEMORY[0x1E0CFCA28]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v22 = v21;

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "valueForKey:", *MEMORY[0x1E0CFCA40]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "BOOLValue");

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "valueForKey:", *MEMORY[0x1E0CFCA48]);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "integerValue");

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "valueForKey:", *MEMORY[0x1E0CFCA50]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          v32 = v31;

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "valueForKey:", *MEMORY[0x1E0CFCA68]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "floatValue");
          v36 = v35;

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "valueForKey:", *MEMORY[0x1E0CFCA70]);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "integerValue");

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "valueForKey:", *MEMORY[0x1E0CFCA78]);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "floatValue");
          v43 = v42;

          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "valueForKey:", *MEMORY[0x1E0CFCA80]);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "floatValue");
          v47 = v46;

          -[AVCaptureVisionDataOutput setFeatureBinningEnabled:](self->_visionDataOutput, "setFeatureBinningEnabled:", v18);
          LODWORD(v48) = v22;
          -[AVCaptureVisionDataOutput setKeypointDetectionThreshold:](self->_visionDataOutput, "setKeypointDetectionThreshold:", v48);
          -[AVCaptureVisionDataOutput setFeatureOrientationAssignmentEnabled:](self->_visionDataOutput, "setFeatureOrientationAssignmentEnabled:", v25);
          -[AVCaptureVisionDataOutput setGaussianPyramidOctavesCount:](self->_visionDataOutput, "setGaussianPyramidOctavesCount:", v28);
          LODWORD(v49) = v32;
          -[AVCaptureVisionDataOutput setGaussianPyramidBaseOctaveDownscalingFactor:](self->_visionDataOutput, "setGaussianPyramidBaseOctaveDownscalingFactor:", v49);
          CMTimeMakeWithSeconds(&v98, v36, 1000);
          v50 = self->_visionDataOutput;
          v97 = v98;
          -[AVCaptureVisionDataOutput setMaxBurstDuration:](v50, "setMaxBurstDuration:", &v97);
          -[AVCaptureVisionDataOutput setMaxKeypointsCount:](self->_visionDataOutput, "setMaxKeypointsCount:", v39);
          -[ARImageSensor _createCMTimeFractionFromDecimalDuration:](self, "_createCMTimeFractionFromDecimalDuration:", v43);
          v51 = self->_visionDataOutput;
          v93 = v95;
          v94 = v96;
          -[AVCaptureVisionDataOutput setMinBurstFrameDuration:](v51, "setMinBurstFrameDuration:", &v93);
          CMTimeMakeWithSeconds(&v92, v47, 1000);
          v52 = self->_visionDataOutput;
          v91 = v92;
          -[AVCaptureVisionDataOutput setMinFrameDuration:](v52, "setMinFrameDuration:", &v91);
          if (-[AVCaptureVisionDataOutput isDynamicThresholdingSupported](self->_visionDataOutput, "isDynamicThresholdingSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "valueForKey:", *MEMORY[0x1E0CFCA10]);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVisionDataOutput setDynamicThresholdingEnabled:](self->_visionDataOutput, "setDynamicThresholdingEnabled:", objc_msgSend(v54, "BOOLValue"));

          }
          -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "valueForKey:", *MEMORY[0x1E0CFCA20]);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "integerValue");

          if (-[AVCaptureVisionDataOutput isKeypointDetectionFlowTypeSupported:](self->_visionDataOutput, "isKeypointDetectionFlowTypeSupported:", v57))-[AVCaptureVisionDataOutput setKeypointDetectionFlowType:](self->_visionDataOutput, "setKeypointDetectionFlowType:", v57);
          if (-[AVCaptureVisionDataOutput isSubPixelThresholdSupported](self->_visionDataOutput, "isSubPixelThresholdSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "valueForKey:", *MEMORY[0x1E0CFCAA0]);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVisionDataOutput setSubPixelThreshold:](self->_visionDataOutput, "setSubPixelThreshold:", objc_msgSend(v59, "integerValue"));

          }
          if (-[AVCaptureVisionDataOutput isFeatureMatchingSupported](self->_visionDataOutput, "isFeatureMatchingSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "valueForKey:", *MEMORY[0x1E0CFCA38]);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVisionDataOutput setFeatureMatchingEnabled:](self->_visionDataOutput, "setFeatureMatchingEnabled:", objc_msgSend(v61, "BOOLValue"));

            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "valueForKey:", *MEMORY[0x1E0CFCA30]);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVisionDataOutput setFeatureMatchingDescriptorSize:](self->_visionDataOutput, "setFeatureMatchingDescriptorSize:", objc_msgSend(v63, "integerValue"));

          }
          if (-[AVCaptureVisionDataOutput isOrientationDistanceThresholdSupported](self->_visionDataOutput, "isOrientationDistanceThresholdSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "valueForKey:", *MEMORY[0x1E0CFCA88]);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "floatValue");
            -[AVCaptureVisionDataOutput setOrientationDistanceThreshold:](self->_visionDataOutput, "setOrientationDistanceThreshold:");

          }
          if (-[AVCaptureVisionDataOutput isSigmaDistanceThresholdSupported](self->_visionDataOutput, "isSigmaDistanceThresholdSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "valueForKey:", *MEMORY[0x1E0CFCA90]);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "floatValue");
            -[AVCaptureVisionDataOutput setSigmaDistanceThreshold:](self->_visionDataOutput, "setSigmaDistanceThreshold:");

          }
          if (-[AVCaptureVisionDataOutput isSquareDistanceDisparityFractionSupported](self->_visionDataOutput, "isSquareDistanceDisparityFractionSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "valueForKey:", *MEMORY[0x1E0CFCA98]);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "floatValue");
            -[AVCaptureVisionDataOutput setSquareDistanceDisparityFraction:](self->_visionDataOutput, "setSquareDistanceDisparityFraction:");

          }
          if (-[AVCaptureVisionDataOutput isHammingDistanceThresholdSupported](self->_visionDataOutput, "isHammingDistanceThresholdSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "valueForKey:", *MEMORY[0x1E0CFCA58]);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVisionDataOutput setHammingDistanceThreshold:](self->_visionDataOutput, "setHammingDistanceThreshold:", objc_msgSend(v71, "integerValue"));

          }
          if (-[AVCaptureVisionDataOutput isLACCConfigAndMetadataSupported](self->_visionDataOutput, "isLACCConfigAndMetadataSupported"))
          {
            -[ARImageSensorSettings visionDataOutputParameters](self->_settings, "visionDataOutputParameters");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "valueForKey:", *MEMORY[0x1E0CFCA60]);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVisionDataOutput setLaccConfigAndMetadata:](self->_visionDataOutput, "setLaccConfigAndMetadata:", v73);

          }
        }
        goto LABEL_2;
      }
      _ARLogSensor_9();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v88 = (objc_class *)objc_opt_class();
        NSStringFromClass(v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v100 = v89;
        v101 = 2048;
        v102 = self;
        v103 = 2112;
        v104 = v90;
        _os_log_impl(&dword_1B3A68000, v84, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add vision data connection to capture session", buf, 0x20u);

      }
    }
    else
    {
      _ARLogSensor_9();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v85 = (objc_class *)objc_opt_class();
        NSStringFromClass(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v100 = v86;
        v101 = 2048;
        v102 = self;
        v103 = 2112;
        v104 = v87;
        _os_log_impl(&dword_1B3A68000, v84, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find a vision data port in the input added to the capture session", buf, 0x20u);

      }
    }

    ARErrorWithCodeAndUserInfo(102, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
LABEL_2:
  v5 = 0;
LABEL_3:

  return v5;
}

- (void)enableContinuousAutoFocusIfPossible
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARImageSensor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[ARImageSensor runningSingleShotAutoFocus](self, "runningSingleShotAutoFocus")
    && -[AVCaptureDevice focusMode](self->_captureDevice, "focusMode") == AVCaptureFocusModeLocked)
  {
    -[ARImageSensor setRunningSingleShotAutoFocus:](self, "setRunningSingleShotAutoFocus:", 0);
    _ARLogSensor_9();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543874;
      v8 = v5;
      v9 = 2048;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Enabling continuous auto focus after single shot auto focus is locked.", (uint8_t *)&v7, 0x20u);

    }
    -[ARImageSensor enableAutoFocusForDevice:](self, "enableAutoFocusForDevice:", self->_captureDevice);
  }
}

- (void)trackExposureTargetOffsetIfNeededForImageData:(id)a3 shouldDrop:(BOOL *)a4
{
  id v6;
  BOOL v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  unint64_t initialImageDatasCounter;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  float v30;
  double v31;
  float v32;
  const char *v33;
  float v34;
  float v35;
  float v36;
  objc_class *v37;
  float v38;
  double v39;
  float v40;
  int v41;
  void *v42;
  __int16 v43;
  ARImageSensor *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[ARImageSensorSettings dropsInitialFramesOutsideExposureTargetOffsetThreshold](self->_settings, "dropsInitialFramesOutsideExposureTargetOffsetThreshold")&& !self->_reachedExposureTargetOffsetThreshold)
  {
    objc_msgSend(v6, "timestamp");
    objc_msgSend(v6, "exposureTargetOffset");
    kdebug_trace();
    ++self->_initialImageDatasCounter;
    objc_msgSend(v6, "exposureTargetOffset");
    v9 = v8;
    -[ARImageSensorSettings negativeExposureTargetOffsetThreshold](self->_settings, "negativeExposureTargetOffsetThreshold");
    if (v9 >= v10
      && (objc_msgSend(v6, "exposureTargetOffset"),
          v12 = v11,
          -[ARImageSensorSettings positiveExposureTargetOffsetThreshold](self->_settings, "positiveExposureTargetOffsetThreshold"), v12 <= v13)|| (v14 = self->_initialImageDatasCounter, v14 > -[ARImageSensorSettings maximumNumberOfInitialFramesDropped](self->_settings, "maximumNumberOfInitialFramesDropped")))
    {
      _ARLogSensor_9();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        initialImageDatasCounter = self->_initialImageDatasCounter;
        objc_msgSend(v6, "exposureTargetOffset");
        v20 = v19;
        -[ARImageSensorSettings negativeExposureTargetOffsetThreshold](self->_settings, "negativeExposureTargetOffsetThreshold");
        v22 = v21;
        -[ARImageSensorSettings positiveExposureTargetOffsetThreshold](self->_settings, "positiveExposureTargetOffsetThreshold");
        v41 = 138544642;
        v42 = v17;
        v43 = 2048;
        v44 = self;
        v45 = 2048;
        v46 = *(double *)&initialImageDatasCounter;
        v47 = 2048;
        v48 = v20;
        v49 = 2048;
        v50 = v22;
        v51 = 2048;
        v52 = v23;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Finished dropping initial frames after %lu frames due to absolute exposureTargetOffset value being below or above threshold: exposureTargetOffset=%f, negativeExposureTargetOffsetThreshold=%f, positiveExposureTargetOffsetThreshold=%f", (uint8_t *)&v41, 0x3Eu);

      }
      self->_reachedExposureTargetOffsetThreshold = 1;
      if (a4)
        goto LABEL_4;
      goto LABEL_6;
    }
    objc_msgSend(v6, "exposureTargetOffset");
    v25 = v24;
    -[ARImageSensorSettings negativeExposureTargetOffsetThreshold](self->_settings, "negativeExposureTargetOffsetThreshold");
    if (v25 >= v26)
    {
      objc_msgSend(v6, "exposureTargetOffset");
      v35 = v34;
      -[ARImageSensorSettings positiveExposureTargetOffsetThreshold](self->_settings, "positiveExposureTargetOffsetThreshold");
      if (v35 <= v36)
      {
LABEL_22:
        if (!a4)
          goto LABEL_6;
        v7 = 1;
        goto LABEL_5;
      }
      _ARLogSensor_9();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "exposureTargetOffset");
        v39 = v38;
        -[ARImageSensorSettings positiveExposureTargetOffsetThreshold](self->_settings, "positiveExposureTargetOffsetThreshold");
        v41 = 138544130;
        v42 = v29;
        v43 = 2048;
        v44 = self;
        v45 = 2048;
        v46 = v39;
        v47 = 2048;
        v48 = v40;
        v33 = "%{public}@ <%p>: Dropping initial frame due to absolute exposureTargetOffset value being above positive th"
              "reshold: exposureTargetOffset=%f, positiveExposureTargetOffsetThreshold=%f";
        goto LABEL_20;
      }
    }
    else
    {
      _ARLogSensor_9();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "exposureTargetOffset");
        v31 = v30;
        -[ARImageSensorSettings negativeExposureTargetOffsetThreshold](self->_settings, "negativeExposureTargetOffsetThreshold");
        v41 = 138544130;
        v42 = v29;
        v43 = 2048;
        v44 = self;
        v45 = 2048;
        v46 = v31;
        v47 = 2048;
        v48 = v32;
        v33 = "%{public}@ <%p>: Dropping initial frame due to absolute exposureTargetOffset value being below negative th"
              "reshold: exposureTargetOffset=%f, negativeExposureTargetOffsetThreshold=%f";
LABEL_20:
        _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_INFO, v33, (uint8_t *)&v41, 0x2Au);

      }
    }

    goto LABEL_22;
  }
  if (a4)
  {
LABEL_4:
    v7 = 0;
LABEL_5:
    *a4 = v7;
  }
LABEL_6:

}

- (void)resetExposureTracking
{
  self->_reachedExposureTargetOffsetThreshold = 0;
  self->_initialImageDatasCounter = 0;
}

- (void)setInterrupted:(BOOL)a3
{
  if (self->_interrupted != a3)
  {
    self->_interrupted = a3;
    if (a3)
      -[ARImageSensor resetExposureTracking](self, "resetExposureTracking");
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_createCMTimeFractionFromDecimalDuration:(SEL)a3
{
  double v6;

  objc_msgSend(&unk_1E66CDFD8, "doubleValue");
  if (fabs(a4 + -1.0 / v6) >= 0.00001)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, 1000);
  else
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, objc_msgSend(&unk_1E66CDFD8, "intValue"));
}

- (id)_defaultPhotoSettings
{
  void *v3;
  void *v4;
  void *v5;
  AVCapturePhotoOutput *photoOutput;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  ARImageSensor *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C8B0F8];
  v18 = *MEMORY[0x1E0CA9040];
  v19[0] = &unk_1E66CDFF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoSettingsWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  photoOutput = self->_photoOutput;
  if (photoOutput)
  {
    objc_msgSend(v5, "setPhotoQualityPrioritization:", -[AVCapturePhotoOutput maxPhotoQualityPrioritization](photoOutput, "maxPhotoQualityPrioritization"));
    objc_msgSend(v5, "setMaxPhotoDimensions:", -[AVCapturePhotoOutput maxPhotoDimensions](self->_photoOutput, "maxPhotoDimensions"));
  }
  else
  {
    _ARLogSensor_9();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Could not set all properties for defaultPhotoSettings because photo output has not been created yet.", (uint8_t *)&v12, 0x20u);

    }
  }
  return v5;
}

+ (float)defaultLensPosition
{
  if (defaultLensPosition_onceToken != -1)
    dispatch_once(&defaultLensPosition_onceToken, &__block_literal_global_101);
  return *(float *)&defaultLensPosition_lensPosition;
}

uint64_t __36__ARImageSensor_defaultLensPosition__block_invoke()
{
  uint64_t result;
  int v1;

  result = MGIsDeviceOneOfType();
  if ((result & 1) != 0)
  {
    v1 = 1062836634;
  }
  else
  {
    result = MGIsDeviceOneOfType();
    if (!(_DWORD)result)
      return result;
    v1 = 1061997773;
  }
  defaultLensPosition_lensPosition = v1;
  return result;
}

+ ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensionsForVideoFormat:(id)a3 maximumHeight:(int)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  _BOOL4 v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "supportedMaxPhotoDimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    _ARLogSensor_9();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v11;
      v32 = 2048;
      v33 = a1;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Returning {0, 0} for maxPhotoDimensions because the supportedMaxPhotoDimensions array is empty for video format: %@", buf, 0x20u);

    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "supportedMaxPhotoDimensions", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    LODWORD(v16) = 0;
    LODWORD(v17) = 0;
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v13);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "CMVideoDimensionsValue");
        v22 = (int)v17 >= (int)v20 || SHIDWORD(v20) > a4;
        if (v22)
          v16 = v16;
        else
          v16 = HIDWORD(v20);
        if (v22)
          v17 = v17;
        else
          v17 = v20;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
    v23 = v16 << 32;
  }
  else
  {
    v23 = 0;
    v17 = 0;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v23 | v17);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  AVCaptureVideoDataOutput *v7;
  AVCaptureVideoDataOutput *videoOutput;
  ARImageData *v9;
  int64_t v10;
  void *v11;
  void *v12;
  ARImageData *v13;

  objc_msgSend(a5, "output", a3);
  v7 = (AVCaptureVideoDataOutput *)objc_claimAutoreleasedReturnValue();
  videoOutput = self->_videoOutput;

  if (v7 == videoOutput)
  {
    v9 = [ARImageData alloc];
    v10 = -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond");
    -[ARImageSensor captureDevice](self, "captureDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureSession](self, "captureSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ARImageData initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:](v9, "initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:", a4, v10, v11, v12);

    +[ARImageSensor registerSignPostForImageData:](ARImageSensor, "registerSignPostForImageData:", v13);
    -[ARImageSensor _dispatchImageData:](self, "_dispatchImageData:", v13);

  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  void *v7;
  Float64 Seconds;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  CMTime time;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  ARImageSensor *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  Float64 v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0CA2660], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CMSampleBufferGetPresentationTimeStamp(&time, a4);
  Seconds = CMTimeGetSeconds(&time);
  _ARLogSensor_9();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    v20 = 2048;
    v21 = Seconds;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ capture session dropped video frame: %f, %@", buf, 0x34u);

  }
}

- (void)_logIfDataIsMissingWithVideoData:(id)a3 visionData:(id)a4 calibrationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  objc_class *v19;
  objc_class *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  objc_class *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  int v43;
  void *v44;
  __int16 v45;
  ARImageSensor *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _ARLogSensor_9();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543874;
    v44 = v13;
    v45 = 2048;
    v46 = self;
    v47 = 2112;
    v48 = v15;
    v16 = "%{public}@ <%p>: %@: No video frame received. Dropping frame!";
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "sampleBufferWasDropped"))
  {
    if (objc_msgSend(v8, "sampleBuffer"))
      goto LABEL_13;
    _ARLogSensor_9();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543874;
    v44 = v13;
    v45 = 2048;
    v46 = self;
    v47 = 2112;
    v48 = v15;
    v16 = "%{public}@ <%p>: %@: No video frame received. Dropping frame! No reason provided";
LABEL_10:
    v17 = v11;
    v18 = 32;
    goto LABEL_11;
  }
  _ARLogSensor_9();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138544130;
    v44 = v13;
    v45 = 2048;
    v46 = self;
    v47 = 2112;
    v48 = v15;
    v49 = 2048;
    v50 = objc_msgSend(v8, "droppedReason");
    v16 = "%{public}@ <%p>: %@: No video frame received. Dropping frame! Reason: %ld";
    v17 = v11;
    v18 = 42;
LABEL_11:
    _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v43, v18);

  }
LABEL_12:

LABEL_13:
  if (!v9)
    goto LABEL_22;
  if (objc_msgSend(v9, "visionDataWasDropped"))
  {
    _ARLogSensor_9();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor captureDevice](self, "captureDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deviceType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v9, "droppedReason");
      v43 = 138544130;
      v44 = v23;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v25;
      v49 = 2048;
      v50 = v26;
      v27 = "%{public}@ <%p>: %@: Video frame received without vision data. Reason: %ld";
      v28 = v21;
      v29 = 42;
LABEL_20:
      _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v43, v29);

    }
  }
  else
  {
    if (objc_msgSend(v9, "visionDataPixelBuffer"))
      goto LABEL_22;
    _ARLogSensor_9();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor captureDevice](self, "captureDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deviceType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138543874;
      v44 = v23;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v25;
      v27 = "%{public}@ <%p>: %@: Video frame received without vision data. No reason provided";
      v28 = v21;
      v29 = 32;
      goto LABEL_20;
    }
  }

LABEL_22:
  if (!v10)
  {
    _ARLogSensor_9();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deviceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543874;
    v44 = v33;
    v45 = 2048;
    v46 = self;
    v47 = 2112;
    v48 = v35;
    v37 = "%{public}@ <%p>: %@: Video frame received without camera calibration data. Dropping frame!";
LABEL_31:
    v38 = v31;
    v39 = 32;
    goto LABEL_32;
  }
  if (objc_msgSend(v10, "cameraCalibrationDataWasDropped"))
  {
    _ARLogSensor_9();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor captureDevice](self, "captureDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "deviceType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v10, "droppedReason");
      v43 = 138544130;
      v44 = v33;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v35;
      v49 = 2048;
      v50 = v36;
      v37 = "%{public}@ <%p>: %@: Video frame received without camera calibration data. Dropping frame! Reason: %ld";
      v38 = v31;
      v39 = 42;
LABEL_32:
      _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_ERROR, v37, (uint8_t *)&v43, v39);

    }
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(v10, "cameraCalibrationData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    _ARLogSensor_9();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deviceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543874;
    v44 = v33;
    v45 = 2048;
    v46 = self;
    v47 = 2112;
    v48 = v35;
    v37 = "%{public}@ <%p>: %@: Video frame received without camera calibration data. Dropping frame! No reason provided";
    goto LABEL_31;
  }
LABEL_34:

}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVCameraCalibrationData *v10;
  AVCameraCalibrationData *cameraCalibrationData;
  ARImageData *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  ARImageData *v17;
  CMTime time;

  v5 = a4;
  objc_msgSend(v5, "count");
  kdebug_trace();
  objc_msgSend(v5, "synchronizedDataForCaptureOutput:", self->_videoOutput);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizedDataForCaptureOutput:", self->_visionDataOutput);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizedDataForCaptureOutput:", self->_calibrationOutput);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_calibrationOutput
    || (-[ARImageSensor _logIfDataIsMissingWithVideoData:visionData:calibrationData:](self, "_logIfDataIsMissingWithVideoData:visionData:calibrationData:", v6, v7, v8), v8)&& !objc_msgSend(v8, "cameraCalibrationDataWasDropped")&& (objc_msgSend(v8, "cameraCalibrationData"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v6)&& v9)
  {
    objc_msgSend(v8, "cameraCalibrationData");
    v10 = (AVCameraCalibrationData *)objc_claimAutoreleasedReturnValue();
    cameraCalibrationData = self->_cameraCalibrationData;
    self->_cameraCalibrationData = v10;

    v12 = [ARImageData alloc];
    v13 = objc_msgSend(v6, "sampleBuffer");
    v14 = -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond");
    -[ARImageSensor captureDevice](self, "captureDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureSession](self, "captureSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ARImageData initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:](v12, "initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:", v13, v14, v15, v16);

    -[ARImageData setVisionData:](v17, "setVisionData:", objc_msgSend(v7, "visionDataPixelBuffer"));
    -[ARImageData setCalibrationData:](v17, "setCalibrationData:", self->_cameraCalibrationData);
    +[ARImageSensor registerSignPostForImageData:](ARImageSensor, "registerSignPostForImageData:", v17);
    -[ARImageSensor _dispatchImageData:](self, "_dispatchImageData:", v17);
    -[ARImageData timestamp](v17, "timestamp");
    if (v7)
    {
      objc_msgSend(v7, "timestamp");
      CMTimeGetSeconds(&time);
    }
    kdebug_trace();

  }
  else
  {
    kdebug_trace();
  }

}

- (void)cameraCalibrationDataOutput:(id)a3 didOutputCameraCalibrationData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  ARImageSensor *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ cameraCalibrationDataOutput:didOutputCameraCalibrationData called without an AVCaptureDataOutputSynchronizer, not supported.", (uint8_t *)&v11, 0x20u);

  }
}

- (void)cameraCalibrationDataOutput:(id)a3 didDropCameraCalibrationDataAtTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6
{
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  double Seconds;
  const __CFString *v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_9();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *a4;
    Seconds = CMTimeGetSeconds((CMTime *)&v15);
    if ((unint64_t)a6 > 3)
      v14 = CFSTR("Undefined");
    else
      v14 = off_1E6675820[a6];
    LODWORD(v15.var0) = 138544386;
    *(int64_t *)((char *)&v15.var0 + 4) = (int64_t)v11;
    LOWORD(v15.var2) = 2048;
    *(_QWORD *)((char *)&v15.var2 + 2) = self;
    HIWORD(v15.var3) = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = Seconds;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ capture session dropped calibration data: %lf, %@", (uint8_t *)&v15, 0x34u);

  }
}

- (void)_dispatchImageData:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSMutableDictionary *extrinsicsMap;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  __int32 v20;
  __int32 v21;
  __int32 v22;
  __int32 v23;
  uint64_t v24;
  void *v25;
  simd_float4 v26;
  simd_float4 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  __int32 v48;
  __int32 v49;
  __int32 v50;
  __int32 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  _BYTE v57[128];
  uint64_t v58;
  simd_float4x4 v59;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_17:
    kdebug_trace();
    goto LABEL_18;
  }
  -[ARImageSensor enableContinuousAutoFocusIfPossible](self, "enableContinuousAutoFocusIfPossible");
  v56 = 0;
  -[ARImageSensor trackExposureTargetOffsetIfNeededForImageData:shouldDrop:](self, "trackExposureTargetOffsetIfNeededForImageData:shouldDrop:", v4, &v56);
  if (!v56)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      extrinsicsMap = self->_extrinsicsMap;
      if (!extrinsicsMap)
      {
        v8 = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(v8, "captureDeviceTypeToExtrinsicsMapForImageSensor:", self);
        v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v10 = self->_extrinsicsMap;
        self->_extrinsicsMap = v9;

        extrinsicsMap = self->_extrinsicsMap;
      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[NSMutableDictionary allKeys](extrinsicsMap, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v53;
        do
        {
          v15 = 0;
          v16 = v44;
          v17 = v45;
          v18 = v46;
          v19 = v47;
          v20 = v48;
          v21 = v49;
          v22 = v50;
          v23 = v51;
          do
          {
            v50 = v22;
            v51 = v23;
            v48 = v20;
            v49 = v21;
            v46 = v18;
            v47 = v19;
            v44 = v16;
            v45 = v17;
            if (*(_QWORD *)v53 != v14)
              objc_enumerationMutation(v11);
            v24 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v15);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_extrinsicsMap, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(double *)v26.i64 = ARMatrix4x3FromNSData(v25);
            v27 = v26;
            v27.i32[3] = v51;
            v59.columns[1].i32[3] = v50;
            v59.columns[2].i32[3] = v49;
            v59.columns[3].i32[3] = v48;
            v59.columns[0] = v27;
            objc_msgSend(v4, "addExtrinsicMatrix:toDeviceType:", v24, ARMatrix4x3Inverse(v59));

            v16 = v44;
            v17 = v45;
            v18 = v46;
            v19 = v47;
            v20 = v48;
            v21 = v49;
            v22 = v50;
            v23 = v51;
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v13);
      }

    }
    -[ARImageSensor bufferPopulationMonitor](self, "bufferPopulationMonitor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v4, "pixelBuffer");
    -[ARImageSensor captureDevice](self, "captureDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v33 = v32;
    -[ARImageSensor captureDevice](self, "captureDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deviceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trackPixelBuffer:withLabel:timestamp:signpostType:", v29, v31, ARBufferPopulationMonitorSignpostTypeForCaptureDevice(v35), v33);

    if (objc_msgSend(v4, "visionData"))
    {
      -[ARImageSensor bufferPopulationMonitor](self, "bufferPopulationMonitor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v4, "visionData");
      v38 = (void *)MEMORY[0x1E0CB3940];
      -[ARImageSensor captureDevice](self, "captureDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ Vision Data"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamp");
      objc_msgSend(v36, "trackPixelBuffer:withLabel:timestamp:signpostType:", v37, v41, 3);

    }
    objc_msgSend(v4, "timestamp");
    objc_msgSend(v4, "captureDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSinceNow");
    kdebug_trace();

    objc_msgSend(v4, "timestamp");
    kdebug_trace();
    -[ARImageSensor delegate](self, "delegate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sensor:didOutputSensorData:", self, v4);

    objc_msgSend(v4, "timestamp");
    kdebug_trace();
    objc_msgSend(v4, "timestamp");
    goto LABEL_17;
  }
LABEL_18:

}

+ (void)registerSignPostForImageData:(id)a3
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "isHighResolution");
  objc_msgSend(v12, "cameraType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89FA0]);

  if (v4)
  {
    v5 = objc_msgSend(v12, "cameraPosition");
    if (v5 != 2)
    {
      if (v5 == 1)
      {
        objc_msgSend(v12, "timestamp");
        objc_msgSend(v12, "imageResolution");
        objc_msgSend(v12, "imageResolution");
        goto LABEL_13;
      }
      v6 = v12;
      if (v5)
        goto LABEL_14;
    }
    objc_msgSend(v12, "timestamp");
  }
  else
  {
    objc_msgSend(v12, "cameraType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89F90]);

    if (v8)
    {
      objc_msgSend(v12, "cameraPosition");
      objc_msgSend(v12, "timestamp");
    }
    else
    {
      objc_msgSend(v12, "cameraType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89F98]);

      v6 = v12;
      if (!v10)
        goto LABEL_14;
      v11 = objc_msgSend(v12, "cameraPosition");
      objc_msgSend(v12, "timestamp");
      if (v11 == 1)
      {
        objc_msgSend(v12, "imageResolution");
        objc_msgSend(v12, "imageResolution");
      }
    }
  }
LABEL_13:
  kdebug_trace();
  v6 = v12;
LABEL_14:
  if (objc_msgSend(v6, "visionData"))
  {
    objc_msgSend(v12, "timestamp");
    kdebug_trace();
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

- (ARImageSensorDataSource)dataSource
{
  return (ARImageSensorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (AVCaptureDeviceInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
  objc_storeStrong((id *)&self->_videoInput, a3);
}

- (AVCaptureVideoDataOutput)videoOutput
{
  return self->_videoOutput;
}

- (AVCaptureConnection)videoConnection
{
  return self->_videoConnection;
}

- (void)setVideoConnection:(id)a3
{
  objc_storeStrong((id *)&self->_videoConnection, a3);
}

- (AVCapturePhotoOutput)photoOutput
{
  return self->_photoOutput;
}

- (AVCaptureConnection)calibrationConnection
{
  return self->_calibrationConnection;
}

- (AVCaptureConnection)visionDataConnection
{
  return self->_visionDataConnection;
}

- (AVCaptureDataOutputSynchronizer)outputSynchronizer
{
  return self->_outputSynchronizer;
}

- (OS_dispatch_queue)captureQueue
{
  return self->_captureQueue;
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (int64_t)captureFramesPerSecond
{
  return self->_captureFramesPerSecond;
}

- (void)setCaptureFramesPerSecond:(int64_t)a3
{
  self->_captureFramesPerSecond = a3;
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (float)defaultLensPosition
{
  return self->_defaultLensPosition;
}

- (void)setDefaultLensPosition:(float)a3
{
  self->_defaultLensPosition = a3;
}

- (BOOL)runningSingleShotAutoFocus
{
  return self->_runningSingleShotAutoFocus;
}

- (void)setRunningSingleShotAutoFocus:(BOOL)a3
{
  self->_runningSingleShotAutoFocus = a3;
}

- (AVCaptureCameraCalibrationDataOutput)calibrationOutput
{
  return self->_calibrationOutput;
}

- (ARBufferPopulationMonitor)bufferPopulationMonitor
{
  return self->_bufferPopulationMonitor;
}

- (void)setBufferPopulationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_bufferPopulationMonitor, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferPopulationMonitor, 0);
  objc_storeStrong((id *)&self->_calibrationOutput, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_outputSynchronizer, 0);
  objc_storeStrong((id *)&self->_visionDataConnection, 0);
  objc_storeStrong((id *)&self->_calibrationConnection, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_videoConnection, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
  objc_storeStrong((id *)&self->_cameraCalibrationData, 0);
  objc_storeStrong((id *)&self->_captureDeviceKeysObserved, 0);
  objc_storeStrong((id *)&self->_visionDataOutput, 0);
}

@end
