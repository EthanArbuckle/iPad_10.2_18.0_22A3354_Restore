@implementation ARWorldTrackingOptions

- (ARWorldTrackingOptions)init
{
  void *v3;
  ARImageSensorSettings *v4;
  void *v5;
  ARImageSensorSettings *v6;
  ARWorldTrackingOptions *v7;

  +[ARWorldTrackingConfiguration supportedVideoFormats](ARWorldTrackingConfiguration, "supportedVideoFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ARImageSensorSettings alloc];
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ARImageSensorSettings initWithVideoFormat:](v4, "initWithVideoFormat:", v5);

  -[ARImageSensorSettings setSupportsCapturingHighResolutionFrames:](v6, "setSupportsCapturingHighResolutionFrames:", 1);
  v7 = -[ARWorldTrackingOptions initWithImageSensorSettings:](self, "initWithImageSensorSettings:", v6);

  return v7;
}

- (ARWorldTrackingOptions)initWithImageSensorSettings:(id)a3
{
  id v5;
  ARWorldTrackingOptions *v6;
  ARWorldTrackingOptions *v7;
  NSString *slamConfigurationPreset;
  ARImageSensorSettings *imageSensorSettingsForUltraWide;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *activeVideoFormatsSemaphore;
  uint64_t v12;
  NSMutableDictionary *activeVideoFormatsMap;
  uint64_t v14;
  ARSceneReconstructionOptions *sceneReconstructionOptions;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARWorldTrackingOptions;
  v6 = -[ARWorldTrackingOptions init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_relocalizationEnabled = 1;
    objc_storeStrong((id *)&v6->_imageSensorSettings, a3);
    -[ARImageSensorSettings setAutoFocusEnabled:](v7->_imageSensorSettings, "setAutoFocusEnabled:", 1);
    v7->_planeDetection = 0;
    slamConfigurationPreset = v7->_slamConfigurationPreset;
    v7->_slamConfigurationPreset = (NSString *)CFSTR("ARKitiOS");

    v7->_minVergenceAngle = 1.0;
    imageSensorSettingsForUltraWide = v7->_imageSensorSettingsForUltraWide;
    v7->_imageSensorSettingsForUltraWide = 0;

    v10 = dispatch_semaphore_create(1);
    activeVideoFormatsSemaphore = v7->_activeVideoFormatsSemaphore;
    v7->_activeVideoFormatsSemaphore = (OS_dispatch_semaphore *)v10;

    v12 = objc_opt_new();
    activeVideoFormatsMap = v7->_activeVideoFormatsMap;
    v7->_activeVideoFormatsMap = (NSMutableDictionary *)v12;

    v7->_sceneReconstruction = 0;
    v14 = objc_opt_new();
    sceneReconstructionOptions = v7->_sceneReconstructionOptions;
    v7->_sceneReconstructionOptions = (ARSceneReconstructionOptions *)v14;

    v7->_planeEstimationShouldUseJasperData = ARDeviceSupportsJasper();
    v7->_alwaysUsePrimaryCameraForTracking = 0;
    v7->_recordForGeoTracking = 0;
    -[ARWorldTrackingOptions updateCameraMap](v7, "updateCameraMap");
  }

  return v7;
}

- (NSString)slamConfiguration
{
  return self->_slamConfigurationPreset;
}

- (void)setSlamConfiguration:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.worldtracking.slamConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", &stru_1E6676798))
  {

    v4 = 0;
  }
  if (v4)
    v5 = v4;
  else
    v5 = v6;
  objc_storeStrong((id *)&self->_slamConfigurationPreset, v5);

}

- (BOOL)shouldUseUltraWide
{
  void *v2;
  BOOL v3;

  -[ARWorldTrackingOptions imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setImageSensorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_imageSensorSettings, a3);
  -[ARWorldTrackingOptions updateCameraMap](self, "updateCameraMap");
}

- (void)setImageSensorSettingsForUltraWide:(id)a3
{
  objc_storeStrong((id *)&self->_imageSensorSettingsForUltraWide, a3);
  -[ARWorldTrackingOptions updateCameraMap](self, "updateCameraMap");
}

- (void)updateCameraMap
{
  void *v3;
  void *v4;
  NSMutableDictionary *activeVideoFormatsMap;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableDictionary removeAllObjects](self->_activeVideoFormatsMap, "removeAllObjects");
  -[ARImageSensorSettings videoFormat](self->_imageSensorSettings, "videoFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ARImageSensorSettings videoFormat](self->_imageSensorSettings, "videoFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    activeVideoFormatsMap = self->_activeVideoFormatsMap;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[ARImageSensorSettings videoFormat](self->_imageSensorSettings, "videoFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "captureDeviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInt:", -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](self, "cameraIdForCaptureDeviceType:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](activeVideoFormatsMap, "setObject:forKeyedSubscript:", v4, v9);

  }
  -[ARImageSensorSettings videoFormat](self->_imageSensorSettingsForUltraWide, "videoFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ARImageSensorSettings videoFormat](self->_imageSensorSettingsForUltraWide, "videoFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_activeVideoFormatsMap;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[ARImageSensorSettings videoFormat](self->_imageSensorSettingsForUltraWide, "videoFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "captureDeviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInt:", -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](self, "cameraIdForCaptureDeviceType:", v15));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v16);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore);
}

- (NSDictionary)activeVideoFormatsMap
{
  void *v3;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = (void *)-[NSMutableDictionary copy](self->_activeVideoFormatsMap, "copy");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore);
  return (NSDictionary *)v3;
}

- (unsigned)cameraIdForCaptureDeviceType:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  v5 = -[ARWorldTrackingOptions shouldUseUltraWide](self, "shouldUseUltraWide")
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C89F98]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C89FA0]) & 1) != 0;

  return v5;
}

- (int)createSLAMCalibration:(CV3DSLAMCalibration *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  const char *v24;
  objc_class *v25;
  void *v26;
  int v27;
  objc_class *v28;
  int v29;
  objc_class *v30;
  objc_class *v31;
  int v33;
  void *v34;
  __int16 v35;
  ARWorldTrackingOptions *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  *a3 = (CV3DSLAMCalibration *)CV3DSLAMCalibrationCreate();
  -[ARWorldTrackingOptions deviceModel](self, "deviceModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ARWorldTrackingOptions deviceModel](self, "deviceModel");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    v7 = CV3DSLAMCameraModelTypeFromString();

  }
  else
  {
    v7 = CV3DSLAMCalibrationDetectRuntimeHardware();
  }

  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", CFSTR("com.apple.arkit.worldtracking.calibrationParameters.imu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      _ARLogGeneral_7();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v12;
        v35 = 2048;
        v36 = self;
        _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Parsing custom imu calibration parameters.", (uint8_t *)&v33, 0x16u);

      }
      v13 = ARParseAndAddImuCalibrationParameters(v9);
      _ARLogGeneral_7();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543618;
          v34 = v26;
          v35 = 2048;
          v36 = self;
          _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using custom imu calibration parameters.", (uint8_t *)&v33, 0x16u);

        }
        goto LABEL_18;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v17;
        v35 = 2048;
        v36 = self;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error parsing custom imu calibration parameters, using default parameters", (uint8_t *)&v33, 0x16u);

      }
    }
  }
  v18 = SetDefaultImuCalibrationData();
  if (v18)
  {
    v19 = v18;
    _ARLogGeneral_7();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DSLAMCalibrationReturn(v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543874;
      v34 = v22;
      v35 = 2048;
      v36 = self;
      v37 = 2114;
      v38 = v23;
      v24 = "%{public}@ <%p>: Error setting default Imu calibration data: %{public}@";
LABEL_31:
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v33, 0x20u);

      goto LABEL_32;
    }
    goto LABEL_32;
  }
LABEL_18:
  if (-[ARWorldTrackingOptions shouldUseUltraWide](self, "shouldUseUltraWide"))
  {
    v27 = -[ARWorldTrackingOptions setupCameraCalibration:forImageSensorSettings:deviceModel:](self, "setupCameraCalibration:forImageSensorSettings:deviceModel:", a3, self->_imageSensorSettingsForUltraWide, v7);
    if (v27)
    {
      v19 = v27;
      _ARLogGeneral_7();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCV3DSLAMCalibrationReturn(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v22;
        v35 = 2048;
        v36 = self;
        v37 = 2114;
        v38 = v23;
        v24 = "%{public}@ <%p>: Error setting camera calibration for ultra wide camera: %{public}@";
        goto LABEL_31;
      }
LABEL_32:

      CV3DSLAMCalibrationRelease();
      *a3 = 0;
      goto LABEL_33;
    }
  }
  if (!-[ARWorldTrackingOptions shouldUseUltraWide](self, "shouldUseUltraWide")
    || !-[ARWorldTrackingOptions alwaysUsePrimaryCameraForTracking](self, "alwaysUsePrimaryCameraForTracking"))
  {
    v29 = -[ARWorldTrackingOptions setupCameraCalibration:forImageSensorSettings:deviceModel:](self, "setupCameraCalibration:forImageSensorSettings:deviceModel:", a3, self->_imageSensorSettings, v7);
    if (v29)
    {
      v19 = v29;
      _ARLogGeneral_7();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCV3DSLAMCalibrationReturn(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v22;
        v35 = 2048;
        v36 = self;
        v37 = 2114;
        v38 = v23;
        v24 = "%{public}@ <%p>: Error setting camera calibration for wide camera: %{public}@";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  if (!ARDeviceSupportsJasper())
  {
    v19 = 0;
    goto LABEL_33;
  }
  v19 = SetDefaultJasperCalibrationData();
  if (v19)
  {
    _ARLogGeneral_7();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DSLAMCalibrationReturn(v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543874;
      v34 = v22;
      v35 = 2048;
      v36 = self;
      v37 = 2114;
      v38 = v23;
      v24 = "%{public}@ <%p>: Error setting jasper calibration data: %{public}@";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
LABEL_33:

  return v19;
}

- (int)setupCameraCalibration:(CV3DSLAMCalibration *)a3 forImageSensorSettings:(id)a4 deviceModel:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __CFString **v13;
  unsigned int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  unsigned int v34;
  int v35;
  int v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  int v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  ARWorldTrackingOptions *v48;
  __int16 v49;
  _BYTE v50[10];
  __int16 v51;
  int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "videoFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "videoFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "captureDeviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == (void *)*MEMORY[0x1E0C89FA0])
    {
      v13 = ARWorldTrackingBackWideCalibrationParametersUserDefaultsKey;
    }
    else
    {
      if (v10 != (void *)*MEMORY[0x1E0C89F98])
      {
        v11 = 0;
LABEL_9:
        v14 = -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](self, "cameraIdForCaptureDeviceType:", v10);
        objc_msgSend(v7, "videoFormat");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "imageResolution");
        v17 = v16;
        v19 = v18;

        v20 = CV3DSLAMCameraVideoModeForResolutionAndDeviceType(v10, v17, v19);
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v11;
            v43 = a5;
            if (_ARLogTechnique_onceToken_3 != -1)
              dispatch_once(&_ARLogTechnique_onceToken_3, &__block_literal_global_187);
            v22 = (void *)_ARLogTechnique_logObj_3;
            if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_3, OS_LOG_TYPE_DEBUG))
            {
              v23 = v22;
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v46 = v25;
              v47 = 2048;
              v48 = self;
              v49 = 2112;
              *(_QWORD *)v50 = v10;
              _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Parsing custom camera calibration parameters for device type %@.", buf, 0x20u);

            }
            v26 = ARParseAndAddCameraCalibrationParameters(v21);
            _ARLogGeneral_7();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (!v26)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v40 = (objc_class *)objc_opt_class();
                NSStringFromClass(v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v46 = v41;
                v47 = 2048;
                v48 = self;
                _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using custom camera calibration parameters.", buf, 0x16u);

              }
              v12 = 0;
              goto LABEL_27;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v30;
              v47 = 2048;
              v48 = self;
              _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error parsing custom camera calibration parameters, using default parameters", buf, 0x16u);

            }
            a5 = v43;
          }
        }
        v12 = SetDefaultCameraCalibrationData();
        if (!v12)
        {
LABEL_28:

          goto LABEL_29;
        }
        _ARLogGeneral_7();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCV3DSLAMCalibrationReturn(v12);
          v44 = v11;
          v34 = v14;
          v35 = v20;
          v36 = a5;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v46 = v33;
          v47 = 2048;
          v48 = self;
          v49 = 2114;
          *(_QWORD *)v50 = v37;
          _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting default camera calibration data: %{public}@", buf, 0x20u);

          a5 = v36;
          v20 = v35;
          v14 = v34;
          v11 = v44;

        }
        _ARLogGeneral_7();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544899;
          v46 = v39;
          v47 = 2048;
          v48 = self;
          v49 = 1025;
          *(_DWORD *)v50 = a5;
          *(_WORD *)&v50[4] = 1025;
          *(_DWORD *)&v50[6] = v20;
          v51 = 1025;
          v52 = 0;
          v53 = 1025;
          v54 = v14;
          v55 = 1025;
          v56 = 0;
          _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Input values of failing call to SetDefaultCameraCalibrationData: deviceModel: %{private}d, videoMode: %{private}d, cameraMode: %{private}d, cameraID: %{private}d, cameraStreamId: %{private}d", buf, 0x34u);

        }
LABEL_27:

        goto LABEL_28;
      }
      v13 = ARWorldTrackingBackUltraWideCalibrationParametersUserDefaultsKey;
    }
    +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", *v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v12 = 1;
LABEL_29:

  return v12;
}

- (void)createSLAMConfig:(CV3DSLAMConfig *)a3 calibration:(CV3DSLAMCalibration *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  ARWorldTrackingOptions *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[ARWorldTrackingOptions imageSensorSettings](self, "imageSensorSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ARWorldTrackingOptions shouldUseUltraWide](self, "shouldUseUltraWide"))
  {
    -[ARWorldTrackingOptions imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v6, "videoFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    *a3 = 0;
    goto LABEL_51;
  }
  objc_msgSend(v6, "videoFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageResolution");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v6, "videoFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "captureDeviceType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CV3DSLAMCameraVideoModeForResolutionAndDeviceType(v15, v11, v13);

  -[ARWorldTrackingOptions slamConfiguration](self, "slamConfiguration");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "UTF8String");
  CV3DSLAMConfigPresetFromString();

  +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.simulateHWFeatureDetection"));
  objc_msgSend(v6, "visionDataOutputEnabled");
  CV3DSLAMConfigCalcFeaturePointDetectionResolution();
  CV3DSLAMConfigCalcLineDetectionResolution();
  *a3 = (CV3DSLAMConfig *)CV3DSLAMConfigCreate2();
  -[ARWorldTrackingOptions relocalizationEnabled](self, "relocalizationEnabled");
  CV3DSLAMConfigSetRelocalizationEnabled();
  CV3DSLAMConfigUseSWProxyFeaturePoints();
  v17 = CV3DSLAMConfigUseHWFeaturePoints();
  if (MEMORY[0x1B5E2C970](v17)
    && +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.useLACCIfAvailable")))
  {
    CV3DSLAMConfigEnableLacc();
  }
  if (-[ARWorldTrackingOptions isCollaborationEnabled](self, "isCollaborationEnabled"))
  {
    CV3DSLAMConfigEnableCollaborativeMapping();
    +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.collaborativeMappingStatistics"));
    CV3DSLAMConfigOutputCollaborativeMappingStatistics();
  }
  -[ARWorldTrackingOptions deterministicMode](self, "deterministicMode");
  CV3DSLAMConfigUseDeterministicMode();
  if (self->_disableMLRelocalization)
  {
    _ARLogGeneral_7();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v20;
      v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Force disabling relocalization mode. The user default has no effect.", (uint8_t *)&v41, 0x16u);

    }
    goto LABEL_13;
  }
  v31 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.worldTracking.mlRelocalizationMode"));
  if (v31 != 2)
  {
    if (v31 == 1)
    {
LABEL_13:
      CV3DSLAMConfigDisableMLRelocalization();
      goto LABEL_14;
    }
    if (v31 || !CV3DSLAMConfigIsMLRelocalizationSupported())
      goto LABEL_14;
  }
  CV3DSLAMConfigEnableMLRelocalization();
LABEL_14:
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldtracking.enableTempMappingDirectory"))&& !self->_disableMLRelocalization)
  {
    NSTemporaryDirectory();
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "fileSystemRepresentation");
    v22 = CV3DSLAMConfigSetMappingDirectory();
    if (v22)
    {
      v23 = v22;
      _ARLogGeneral_7();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCV3DSLAMConfigReturn(v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543874;
        v42 = v26;
        v43 = 2048;
        v44 = self;
        v45 = 2114;
        v46 = v27;
        _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting SLAM mapping directory: %{public}@", (uint8_t *)&v41, 0x20u);

      }
    }

  }
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.worldtracking.lineFeatures"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
    v30 = objc_msgSend(v28, "BOOLValue");
  else
    v30 = 0;
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.worldtracking.lineFeaturesAlwaysOn"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32 && objc_msgSend(v32, "BOOLValue"))
  {
    CV3DSLAMConfigEnableLineTrackingAlways();
  }
  else if (v30)
  {
    CV3DSLAMConfigEnableLineTracking();
  }
  else
  {
    CV3DSLAMConfigDisableLineTracking();
  }
  if (self->_sceneReconstruction)
    CV3DSLAMConfigAnchorStrategy();
  if (ARDeviceSupportsJasper()
    && -[ARWorldTrackingOptions planeEstimationShouldUseJasperData](self, "planeEstimationShouldUseJasperData"))
  {
    CV3DSLAMConfigEnablePlaneTracking();
  }
  else
  {
    CV3DSLAMConfigDisablePlaneTracking();
  }
  -[ARWorldTrackingOptions initialWorldMap](self, "initialWorldMap");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[ARWorldTrackingOptions initialWorldMap](self, "initialWorldMap");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trackingData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CV3DSLAMConfigSetMapFromCFData();

  }
  if (-[ARWorldTrackingOptions alwaysUsePrimaryCameraForTracking](self, "alwaysUsePrimaryCameraForTracking"))
    CV3DSLAMConfigDisableCameraSwitchingAndUsePrimaryCamera();
  -[ARWorldTrackingOptions vioSessionID](self, "vioSessionID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[ARWorldTrackingOptions vioSessionID](self, "vioSessionID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "unsignedIntegerValue");
    CV3DSLAMConfigOverrideSessionID();

  }
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.worldtracking.transformToExternalSubmap"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "BOOLValue");
    CV3DSLAMConfigEnableTransformToExternalSubmap();
  }

LABEL_51:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ARImageSensorSettings copyWithZone:](self->_imageSensorSettings, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[ARImageSensorSettings copyWithZone:](self->_imageSensorSettingsForUltraWide, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  *(_BYTE *)(v5 + 32) = self->_relocalizationEnabled;
  v12 = -[ARWorldMap copyWithZone:](self->_initialWorldMap, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_slamConfigurationPreset, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  *(_BYTE *)(v5 + 33) = self->_deterministicMode;
  *(_BYTE *)(v5 + 34) = self->_lowQosSchedulingEnabled;
  *(_QWORD *)(v5 + 80) = self->_planeDetection;
  *(double *)(v5 + 88) = self->_minVergenceAngle;
  *(_BYTE *)(v5 + 35) = self->_mlModelEnabled;
  *(_BYTE *)(v5 + 36) = self->_collaborationEnabled;
  objc_storeStrong((id *)(v5 + 112), self->_vioSessionID);
  *(_BYTE *)(v5 + 37) = self->_depthBuffersWillBeProvided;
  *(_BYTE *)(v5 + 38) = self->_visionDataWillBeReplayed;
  *(_QWORD *)(v5 + 96) = self->_sceneReconstruction;
  v16 = -[ARSceneReconstructionOptions copyWithZone:](self->_sceneReconstructionOptions, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  *(_BYTE *)(v5 + 39) = self->_planeEstimationShouldUseJasperData;
  *(_BYTE *)(v5 + 40) = self->_alwaysUsePrimaryCameraForTracking;
  *(_BYTE *)(v5 + 41) = self->_disableMLRelocalization;
  *(_BYTE *)(v5 + 42) = self->_recordForGeoTracking;
  *(_BYTE *)(v5 + 43) = self->_planeBundleAdjustmentEnabled;
  v18 = MEMORY[0x1B5E2DF90](self->_singleShotPlaneCallback);
  v19 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v18;

  v20 = MEMORY[0x1B5E2DF90](self->_trackedPlaneCallback);
  v21 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v20;

  v22 = MEMORY[0x1B5E2DF90](self->_planeDetectionVIOPoseCallback);
  v23 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v22;

  v24 = MEMORY[0x1B5E2DF90](self->_planeDetectionPoseUpdateCallback);
  v25 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v24;

  objc_msgSend((id)v5, "updateCameraMap");
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ARImageSensorSettings **v5;
  ARImageSensorSettings *imageSensorSettings;
  ARImageSensorSettings *imageSensorSettingsForUltraWide;
  NSString *deviceModel;
  ARWorldMap *initialWorldMap;
  NSString *slamConfigurationPreset;
  ARSceneReconstructionOptions *sceneReconstructionOptions;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (ARImageSensorSettings **)v4;
    imageSensorSettings = self->_imageSensorSettings;
    v12 = (imageSensorSettings == v5[6] || -[ARImageSensorSettings isEqual:](imageSensorSettings, "isEqual:"))
       && ((imageSensorSettingsForUltraWide = self->_imageSensorSettingsForUltraWide,
            imageSensorSettingsForUltraWide == v5[7])
        || -[ARImageSensorSettings isEqual:](imageSensorSettingsForUltraWide, "isEqual:"))
       && ((deviceModel = self->_deviceModel, deviceModel == (NSString *)v5[8])
        || -[NSString isEqualToString:](deviceModel, "isEqualToString:"))
       && self->_relocalizationEnabled == *((unsigned __int8 *)v5 + 32)
       && ((initialWorldMap = self->_initialWorldMap, initialWorldMap == (ARWorldMap *)v5[9])
        || -[ARWorldMap isEqual:](initialWorldMap, "isEqual:"))
       && ((slamConfigurationPreset = self->_slamConfigurationPreset, slamConfigurationPreset == (NSString *)v5[3])
        || -[NSString isEqual:](slamConfigurationPreset, "isEqual:"))
       && self->_deterministicMode == *((unsigned __int8 *)v5 + 33)
       && (ARImageSensorSettings *)self->_planeDetection == v5[10]
       && self->_lowQosSchedulingEnabled == *((unsigned __int8 *)v5 + 34)
       && self->_minVergenceAngle == *((double *)v5 + 11)
       && self->_mlModelEnabled == *((unsigned __int8 *)v5 + 35)
       && self->_collaborationEnabled == *((unsigned __int8 *)v5 + 36)
       && (ARImageSensorSettings *)self->_vioSessionID == v5[14]
       && self->_depthBuffersWillBeProvided == *((unsigned __int8 *)v5 + 37)
       && self->_visionDataWillBeReplayed == *((unsigned __int8 *)v5 + 38)
       && (ARImageSensorSettings *)self->_sceneReconstruction == v5[12]
       && ((sceneReconstructionOptions = self->_sceneReconstructionOptions,
            sceneReconstructionOptions == (ARSceneReconstructionOptions *)v5[13])
        || -[ARSceneReconstructionOptions isEqual:](sceneReconstructionOptions, "isEqual:"))
       && self->_planeEstimationShouldUseJasperData == *((unsigned __int8 *)v5 + 39)
       && self->_alwaysUsePrimaryCameraForTracking == *((unsigned __int8 *)v5 + 40)
       && self->_disableMLRelocalization == *((unsigned __int8 *)v5 + 41)
       && self->_recordForGeoTracking == *((unsigned __int8 *)v5 + 42)
       && self->_planeBundleAdjustmentEnabled == *((unsigned __int8 *)v5 + 43)
       && self->_singleShotPlaneCallback == v5[15]
       && self->_trackedPlaneCallback == v5[16]
       && self->_planeDetectionVIOPoseCallback == v5[17]
       && self->_planeDetectionPoseUpdateCallback == v5[18];

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (ARImageSensorSettings)imageSensorSettings
{
  return self->_imageSensorSettings;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  return self->_imageSensorSettingsForUltraWide;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)relocalizationEnabled
{
  return self->_relocalizationEnabled;
}

- (void)setRelocalizationEnabled:(BOOL)a3
{
  self->_relocalizationEnabled = a3;
}

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (void)setDeterministicMode:(BOOL)a3
{
  self->_deterministicMode = a3;
}

- (BOOL)lowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (unint64_t)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(unint64_t)a3
{
  self->_planeDetection = a3;
}

- (double)minVergenceAngle
{
  return self->_minVergenceAngle;
}

- (void)setMinVergenceAngle:(double)a3
{
  self->_minVergenceAngle = a3;
}

- (BOOL)mlModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isCollaborationEnabled
{
  return self->_collaborationEnabled;
}

- (void)setCollaborationEnabled:(BOOL)a3
{
  self->_collaborationEnabled = a3;
}

- (BOOL)depthBuffersWillBeProvided
{
  return self->_depthBuffersWillBeProvided;
}

- (void)setDepthBuffersWillBeProvided:(BOOL)a3
{
  self->_depthBuffersWillBeProvided = a3;
}

- (BOOL)visionDataWillBeReplayed
{
  return self->_visionDataWillBeReplayed;
}

- (void)setVisionDataWillBeReplayed:(BOOL)a3
{
  self->_visionDataWillBeReplayed = a3;
}

- (unint64_t)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (void)setSceneReconstruction:(unint64_t)a3
{
  self->_sceneReconstruction = a3;
}

- (BOOL)planeEstimationShouldUseJasperData
{
  return self->_planeEstimationShouldUseJasperData;
}

- (void)setPlaneEstimationShouldUseJasperData:(BOOL)a3
{
  self->_planeEstimationShouldUseJasperData = a3;
}

- (ARSceneReconstructionOptions)sceneReconstructionOptions
{
  return self->_sceneReconstructionOptions;
}

- (void)setSceneReconstructionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_sceneReconstructionOptions, a3);
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)disableMLRelocalization
{
  return self->_disableMLRelocalization;
}

- (void)setDisableMLRelocalization:(BOOL)a3
{
  self->_disableMLRelocalization = a3;
}

- (BOOL)recordForGeoTracking
{
  return self->_recordForGeoTracking;
}

- (void)setRecordForGeoTracking:(BOOL)a3
{
  self->_recordForGeoTracking = a3;
}

- (NSNumber)vioSessionID
{
  return self->_vioSessionID;
}

- (void)setVioSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_vioSessionID, a3);
}

- (BOOL)planeBundleAdjustmentEnabled
{
  return self->_planeBundleAdjustmentEnabled;
}

- (void)setPlaneBundleAdjustmentEnabled:(BOOL)a3
{
  self->_planeBundleAdjustmentEnabled = a3;
}

- (id)singleShotPlaneCallback
{
  return self->_singleShotPlaneCallback;
}

- (void)setSingleShotPlaneCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)trackedPlaneCallback
{
  return self->_trackedPlaneCallback;
}

- (void)setTrackedPlaneCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)planeDetectionVIOPoseCallback
{
  return self->_planeDetectionVIOPoseCallback;
}

- (void)setPlaneDetectionVIOPoseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)planeDetectionPoseUpdateCallback
{
  return self->_planeDetectionPoseUpdateCallback;
}

- (void)setPlaneDetectionPoseUpdateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_planeDetectionPoseUpdateCallback, 0);
  objc_storeStrong(&self->_planeDetectionVIOPoseCallback, 0);
  objc_storeStrong(&self->_trackedPlaneCallback, 0);
  objc_storeStrong(&self->_singleShotPlaneCallback, 0);
  objc_storeStrong((id *)&self->_vioSessionID, 0);
  objc_storeStrong((id *)&self->_sceneReconstructionOptions, 0);
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_imageSensorSettingsForUltraWide, 0);
  objc_storeStrong((id *)&self->_imageSensorSettings, 0);
  objc_storeStrong((id *)&self->_slamConfigurationPreset, 0);
  objc_storeStrong((id *)&self->_activeVideoFormatsSemaphore, 0);
  objc_storeStrong((id *)&self->_activeVideoFormatsMap, 0);
}

@end
