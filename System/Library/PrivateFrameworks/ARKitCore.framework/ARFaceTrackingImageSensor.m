@implementation ARFaceTrackingImageSensor

- (ARFaceTrackingImageSensor)initWithSettings:(id)a3 captureSession:(id)a4 captureQueue:(id)a5
{
  ARFaceTrackingImageSensor *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *faceDataSemaphore;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingImageSensor;
  v5 = -[ARImageSensor initWithSettings:captureSession:captureQueue:](&v9, sel_initWithSettings_captureSession_captureQueue_, a3, a4, a5);
  if (v5)
  {
    v6 = dispatch_semaphore_create(1);
    faceDataSemaphore = v5->_faceDataSemaphore;
    v5->_faceDataSemaphore = (OS_dispatch_semaphore *)v6;

  }
  return v5;
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
  ARFaceTrackingImageSensor *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSensor();
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
  -[ARFaceTrackingImageSensor stop](self, "stop");
  v7.receiver = self;
  v7.super_class = (Class)ARFaceTrackingImageSensor;
  -[ARImageSensor dealloc](&v7, sel_dealloc);
}

- (unint64_t)providedDataTypes
{
  return 49;
}

- (id)outputsForSynchronizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v3 = (void *)objc_opt_new();
  -[ARImageSensor videoOutput](self, "videoOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ARImageSensor videoOutput](self, "videoOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_depthDataOutput)
    objc_msgSend(v3, "addObject:");
  if (self->_metaDataOutput)
  {
    -[ARImageSensor settings](self, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metaData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8AA68]);

    if (v8)
      objc_msgSend(v3, "addObject:", self->_metaDataOutput);
  }
  return v3;
}

- (void)reconfigure:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  ARFaceTrackingImageSensor *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARFaceTrackingImageSensor;
  -[ARImageSensor reconfigure:](&v15, sel_reconfigure_, v4);
  if (-[ARImageSensor canReconfigure:](self, "canReconfigure:", v4))
  {
    v5 = objc_msgSend(v4, "maximumNumberOfTrackedFaces");
    -[ARImageSensor settings](self, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = v5 == objc_msgSend(v6, "maximumNumberOfTrackedFaces");

    if ((v5 & 1) == 0)
    {
      if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self->_metaDataOutput, "isFaceTrackingSupported")&& -[AVCaptureMetadataOutput isFaceTrackingMetadataObjectTypesAvailable](self->_metaDataOutput, "isFaceTrackingMetadataObjectTypesAvailable"))
      {
        -[AVCaptureMetadataOutput setFaceTrackingMaxFaces:](self->_metaDataOutput, "setFaceTrackingMaxFaces:", objc_msgSend(v4, "maximumNumberOfTrackedFaces"));
        _ARLogSensor();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = -[AVCaptureMetadataOutput faceTrackingMaxFaces](self->_metaDataOutput, "faceTrackingMaxFaces");
          v11 = -[AVCaptureMetadataOutput isFaceTrackingUsingFaceRecognition](self->_metaDataOutput, "isFaceTrackingUsingFaceRecognition");
          v12 = CFSTR("NO");
          *(_DWORD *)buf = 138544130;
          v17 = v9;
          v18 = 2048;
          if (v11)
            v12 = CFSTR("YES");
          v19 = self;
          v20 = 2048;
          v21 = v10;
          v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Reconfigured to maxFaces: %li, faceRecognition enabled: %@", buf, 0x2Au);

        }
      }
      v13 = objc_msgSend(v4, "maximumNumberOfTrackedFaces");
      -[ARImageSensor mutableSettings](self, "mutableSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMaximumNumberOfTrackedFaces:", v13);

    }
  }

}

- (int64_t)_videoOrientation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[ARImageSensor settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "captureDevicePosition");

  -[ARImageSensor settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 2)
  {
    if (objc_msgSend(v6, "mirrorVideoOutput"))
      v8 = 3;
    else
      v8 = 4;
  }
  else if (objc_msgSend(v6, "mirrorVideoOutput"))
  {
    v8 = 4;
  }
  else
  {
    v8 = 3;
  }

  return v8;
}

- (id)configureCaptureSession
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  AVCaptureDepthDataOutput *v14;
  AVCaptureDepthDataOutput *depthDataOutput;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  AVCaptureConnection *v33;
  AVCaptureConnection *depthConnection;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  void *v45;
  _BOOL4 v46;
  const __CFString *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  ARFaceTrackingImageSensor *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  const __CFString *v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)ARFaceTrackingImageSensor;
  -[ARImageSensor configureCaptureSession](&v60, sel_configureCaptureSession);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!ARHasH10())
    {
      -[ARImageSensor videoOutput](self, "videoOutput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlwaysDiscardsLateVideoFrames:", 0);

    }
    -[ARImageSensor videoOutput](self, "videoOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ARImageSensor settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVideoMirrored:", objc_msgSend(v9, "mirrorVideoOutput"));

    objc_msgSend(v8, "setVideoOrientation:", -[ARFaceTrackingImageSensor _videoOrientation](self, "_videoOrientation"));
    if (self->_depthDataOutput)
      goto LABEL_7;
    -[ARImageSensor captureDevice](self, "captureDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == (void *)*MEMORY[0x1E0C89F90];

    if (!v12)
      goto LABEL_7;
    v14 = (AVCaptureDepthDataOutput *)objc_opt_new();
    depthDataOutput = self->_depthDataOutput;
    self->_depthDataOutput = v14;

    -[ARImageSensor captureSession](self, "captureSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "canAddOutput:", self->_depthDataOutput);

    if (v17)
    {
      -[ARImageSensor captureSession](self, "captureSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addOutputWithNoConnections:", self->_depthDataOutput);

      _ARLogSensor();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v21;
        v63 = 2048;
        v64 = self;
        v65 = 2112;
        v66 = v22;
        _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Added depth data output to the capture session", buf, 0x20u);

      }
      if (self->_depthConnection)
        goto LABEL_7;
      -[ARImageSensor videoInput](self, "videoInput");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor videoInput](self, "videoInput");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "device");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deviceType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor videoInput](self, "videoInput");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "position");
      objc_msgSend(v23, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", *MEMORY[0x1E0C8A7C0], v26, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v31 = (void *)MEMORY[0x1E0C8B070];
        v69[0] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "connectionWithInputPorts:output:", v32, self->_depthDataOutput);
        v33 = (AVCaptureConnection *)objc_claimAutoreleasedReturnValue();
        depthConnection = self->_depthConnection;
        self->_depthConnection = v33;

        -[ARImageSensor captureSession](self, "captureSession");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v31) = objc_msgSend(v35, "canAddConnection:", self->_depthConnection);

        if ((v31 & 1) != 0)
        {
          -[ARImageSensor connections](self, "connections");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", self->_depthConnection);

          -[ARImageSensor captureSession](self, "captureSession");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addConnection:", self->_depthConnection);

          _ARLogSensor();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v40;
            v63 = 2048;
            v64 = self;
            v65 = 2112;
            v66 = v41;
            _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added depth data output to the capture session", buf, 0x20u);

          }
          -[AVCaptureDepthDataOutput setAlwaysDiscardsLateDepthData:](self->_depthDataOutput, "setAlwaysDiscardsLateDepthData:", 1);
          -[AVCaptureDepthDataOutput setFilteringEnabled:](self->_depthDataOutput, "setFilteringEnabled:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imageSensor.face.depthDataFiltering")));
          _ARLogSensor();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (id)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = -[AVCaptureDepthDataOutput isFilteringEnabled](self->_depthDataOutput, "isFilteringEnabled");
            v47 = CFSTR("disabled");
            *(_DWORD *)buf = 138544130;
            v62 = v44;
            v63 = 2048;
            if (v46)
              v47 = CFSTR("enabled");
            v64 = self;
            v65 = 2112;
            v66 = v45;
            v67 = 2112;
            v68 = v47;
            _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Depth data filtering is %@.", buf, 0x2Au);

          }
          -[AVCaptureConnection setVideoMirrored:](self->_depthConnection, "setVideoMirrored:", objc_msgSend(v8, "isVideoMirrored"));
          -[AVCaptureConnection setVideoOrientation:](self->_depthConnection, "setVideoOrientation:", objc_msgSend(v8, "videoOrientation"));

LABEL_7:
          -[ARFaceTrackingImageSensor _configureMetaDataOutput](self, "_configureMetaDataOutput", v59);
          v4 = (id)objc_claimAutoreleasedReturnValue();
          v5 = v4;
LABEL_8:

          goto LABEL_9;
        }
        _ARLogSensor();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v57;
          v63 = 2048;
          v64 = self;
          v65 = 2112;
          v66 = v58;
          _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add depth connection to the capture session.", buf, 0x20u);

        }
      }
      else
      {
        _ARLogSensor();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v53 = (objc_class *)objc_opt_class();
          NSStringFromClass(v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v54;
          v63 = 2048;
          v64 = self;
          v65 = 2112;
          v66 = v55;
          _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find depth data input port on the video input.", buf, 0x20u);

        }
      }

      ARErrorWithCodeAndUserInfo(102, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _ARLogSensor();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v50;
        v63 = 2048;
        v64 = self;
        v65 = 2112;
        v66 = v51;
        _os_log_impl(&dword_1B3A68000, v48, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add depth data output to the capture session.", buf, 0x20u);

      }
      ARErrorWithCodeAndUserInfo(102, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = 0;
    goto LABEL_8;
  }
  v4 = v3;
  v5 = v4;
LABEL_9:

  return v5;
}

- (void)configureCaptureDevice
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARFaceTrackingImageSensor;
  -[ARImageSensor configureCaptureDevice](&v4, sel_configureCaptureDevice);
  -[ARImageSensor captureDevice](self, "captureDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaceDetectionDrivenImageProcessingEnabled:", 1);

}

- (id)configureCaptureSessionCalibration
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  ARFaceTrackingImageSensor *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSensor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ skipping configuration for camera calibration output", (uint8_t *)&v8, 0x20u);

  }
  return 0;
}

- (id)prepareToStart
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  ARFaceTrackingImageSensor *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _ARLogSensor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ preparing to start", buf, 0x20u);

  }
  self->_signpostFirstFrameDone = 0;
  self->_signpostFirstFaceDone = 0;
  kdebug_trace();
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)ARFaceTrackingImageSensor;
  -[ARImageSensor prepareToStart](&v17, sel_prepareToStart);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    self->_startTime = v11;

    self->_droppedFramesPerSec = 0;
    _ARLogSensor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2048;
      v21 = self;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ prepare to start complete", buf, 0x20u);

    }
  }

  return v8;
}

- (void)stop
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSArray *availableMetadataObjectTypes;
  ARFaceData *latestFaceData;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  ARFaceTrackingImageSensor *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _ARLogSensor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v5;
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ stopping", buf, 0x20u);

  }
  v13.receiver = self;
  v13.super_class = (Class)ARFaceTrackingImageSensor;
  -[ARImageSensor stop](&v13, sel_stop);
  -[AVCaptureMetadataOutput setMetadataObjectsDelegate:queue:](self->_metaDataOutput, "setMetadataObjectsDelegate:queue:", 0, 0);
  availableMetadataObjectTypes = self->_availableMetadataObjectTypes;
  self->_availableMetadataObjectTypes = 0;

  latestFaceData = self->_latestFaceData;
  self->_latestFaceData = 0;

  self->_droppedFramesPerSec = 0;
  self->_startTime = 0.0;
  _ARLogSensor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ stop complete", buf, 0x20u);

  }
}

- (id)_configureMetaDataOutput
{
  void *v3;
  void *v4;
  AVCaptureMetadataOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  AVCaptureMetadataOutput *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AVCaptureMetadataOutput *metaDataOutput;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  AVCaptureMetadataOutput *v37;
  AVCaptureMetadataOutput *v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  AVCaptureConnection *v56;
  AVCaptureConnection *metadataConnection;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  AVCaptureMetadataOutput *v66;
  NSObject *v67;
  objc_class *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSArray *v78;
  NSArray *availableMetadataObjectTypes;
  NSObject *v80;
  objc_class *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  objc_class *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  ARFaceTrackingImageSensor *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  _QWORD v102[2];

  v102[1] = *MEMORY[0x1E0C80C00];
  -[ARImageSensor settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ARImageSensor captureSession](self, "captureSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeOutput:", self->_metaDataOutput);

    metaDataOutput = self->_metaDataOutput;
    self->_metaDataOutput = 0;

    _ARLogSensor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v28;
      v96 = 2048;
      v97 = self;
      v98 = 2112;
      v99 = (uint64_t)v29;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Removed metadata output from the capture session", buf, 0x20u);

    }
    goto LABEL_29;
  }
  if (self->_metaDataOutput)
  {
LABEL_3:
    v5 = self->_metaDataOutput;
    -[ARImageSensor captureQueue](self, "captureQueue", v92);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureMetadataOutput setMetadataObjectsDelegate:queue:](v5, "setMetadataObjectsDelegate:queue:", self, v6);

    -[ARImageSensor captureSession](self, "captureSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", self->_metaDataOutput);

    if (!v9)
    {
      -[ARImageSensor delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ARKitCoreBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Could not add metadata output to capture session"), &stru_1E6676798, CFSTR("Localizable_iOS"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CB2D68]);

        ARErrorWithCodeAndUserInfo(102, v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        return v35;
      }
      goto LABEL_30;
    }
    if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self->_metaDataOutput, "isFaceTrackingSupported"))
    {
      -[AVCaptureMetadataOutput setFaceTrackingMetadataObjectTypesAvailable:](self->_metaDataOutput, "setFaceTrackingMetadataObjectTypesAvailable:", 1);
      -[ARImageSensor settings](self, "settings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureMetadataOutput setFaceTrackingMaxFaces:](self->_metaDataOutput, "setFaceTrackingMaxFaces:", objc_msgSend(v10, "maximumNumberOfTrackedFaces"));

      _ARLogSensor();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = -[AVCaptureMetadataOutput faceTrackingMaxFaces](self->_metaDataOutput, "faceTrackingMaxFaces");
        v15 = -[AVCaptureMetadataOutput isFaceTrackingUsingFaceRecognition](self->_metaDataOutput, "isFaceTrackingUsingFaceRecognition");
        v16 = CFSTR("NO");
        *(_DWORD *)buf = 138544130;
        v95 = v13;
        v96 = 2048;
        if (v15)
          v16 = CFSTR("YES");
        v97 = self;
        v98 = 2048;
        v99 = v14;
        v100 = 2112;
        v101 = (void *)v16;
        _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: maxFaces: %li, faceRecognition enabled: %@", buf, 0x2Au);

      }
    }
    -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metaDataOutput, "availableMetadataObjectTypes");
    v17 = objc_claimAutoreleasedReturnValue();
    -[ARImageSensor settings](self, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "metaData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NSObject containsObject:](v17, "containsObject:", v19);

    if (v20)
    {
      v21 = self->_metaDataOutput;
      -[ARImageSensor settings](self, "settings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "metaData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureMetadataOutput setMetadataObjectTypes:](v21, "setMetadataObjectTypes:", v24);

    }
    else
    {
      -[ARImageSensor captureSession](self, "captureSession");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "removeOutput:", self->_metaDataOutput);

      v66 = self->_metaDataOutput;
      self->_metaDataOutput = 0;

      _ARLogSensor();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = (objc_class *)objc_opt_class();
        NSStringFromClass(v68);
        v69 = (id)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor settings](self, "settings");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "metaData");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v95 = v69;
        v96 = 2048;
        v97 = self;
        v98 = 2112;
        v99 = (uint64_t)v71;
        v100 = 2112;
        v101 = v17;
        _os_log_impl(&dword_1B3A68000, v67, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Metadata %@ is not supported. Available metadata types are %@", buf, 0x2Au);

      }
      -[ARImageSensor delegate](self, "delegate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_opt_respondsToSelector();

      if ((v73 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        ARKitCoreBundle();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("AVFoundation failed to deliver the requested metadata object types."), &stru_1E6676798, CFSTR("Localizable_iOS"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setObject:forKeyedSubscript:", v76, *MEMORY[0x1E0CB2D68]);

        ARErrorWithCodeAndUserInfo(102, v74);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        return v77;
      }
    }
LABEL_29:

LABEL_30:
    -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metaDataOutput, "availableMetadataObjectTypes");
    v78 = (NSArray *)objc_claimAutoreleasedReturnValue();
    availableMetadataObjectTypes = self->_availableMetadataObjectTypes;
    self->_availableMetadataObjectTypes = v78;

    return 0;
  }
  v37 = (AVCaptureMetadataOutput *)objc_opt_new();
  v38 = self->_metaDataOutput;
  self->_metaDataOutput = v37;

  -[ARImageSensor captureSession](self, "captureSession");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "canAddOutput:", self->_metaDataOutput);

  if (v40)
  {
    -[ARImageSensor captureSession](self, "captureSession");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addOutputWithNoConnections:", self->_metaDataOutput);

    _ARLogSensor();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v44;
      v96 = 2048;
      v97 = self;
      v98 = 2112;
      v99 = (uint64_t)v45;
      _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added metadata output to the capture session", buf, 0x20u);

    }
    if (self->_metadataConnection)
      goto LABEL_3;
    -[ARImageSensor videoInput](self, "videoInput");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor videoInput](self, "videoInput");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "device");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "deviceType");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor videoInput](self, "videoInput");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "device");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "position");
    objc_msgSend(v46, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", *MEMORY[0x1E0C8A7D8], v49, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firstObject");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      v54 = (void *)MEMORY[0x1E0C8B070];
      v102[0] = v92;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "connectionWithInputPorts:output:", v55, self->_metaDataOutput);
      v56 = (AVCaptureConnection *)objc_claimAutoreleasedReturnValue();
      metadataConnection = self->_metadataConnection;
      self->_metadataConnection = v56;

      -[ARImageSensor captureSession](self, "captureSession");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v54) = objc_msgSend(v58, "canAddConnection:", self->_metadataConnection);

      if ((v54 & 1) != 0)
      {
        -[ARImageSensor connections](self, "connections");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObject:", self->_metadataConnection);

        -[ARImageSensor captureSession](self, "captureSession");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addConnection:", self->_metadataConnection);

        _ARLogSensor();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = v63;
          v96 = 2048;
          v97 = self;
          v98 = 2112;
          v99 = (uint64_t)v64;
          _os_log_impl(&dword_1B3A68000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added metadata connection to the capture session", buf, 0x20u);

        }
        goto LABEL_3;
      }
      _ARLogSensor();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v88 = (objc_class *)objc_opt_class();
        NSStringFromClass(v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = v89;
        v96 = 2048;
        v97 = self;
        v98 = 2112;
        v99 = (uint64_t)v90;
        _os_log_impl(&dword_1B3A68000, v84, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add meta data connection to capture session.", buf, 0x20u);

      }
    }
    else
    {
      _ARLogSensor();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v85 = (objc_class *)objc_opt_class();
        NSStringFromClass(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = v86;
        v96 = 2048;
        v97 = self;
        v98 = 2112;
        v99 = (uint64_t)v87;
        _os_log_impl(&dword_1B3A68000, v84, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find meta data input port on the video input.", buf, 0x20u);

      }
    }

    ARErrorWithCodeAndUserInfo(102, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    return v91;
  }
  else
  {
    _ARLogSensor();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v81 = (objc_class *)objc_opt_class();
      NSStringFromClass(v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v82;
      v96 = 2048;
      v97 = self;
      v98 = 2112;
      v99 = (uint64_t)v83;
      _os_log_impl(&dword_1B3A68000, v80, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add mete data output to the capture session.", buf, 0x20u);

    }
    ARErrorWithCodeAndUserInfo(102, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "output");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageSensor videoOutput](self, "videoOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    v12 = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    -[ARFaceTrackingImageSensor capturedSynchedOutput:didOutputSampleBuffer:fromVideoConnection:metaDataOutput:didOutputMetadataObjects:didOutputDepthData:atTime:](self, "capturedSynchedOutput:didOutputSampleBuffer:fromVideoConnection:metaDataOutput:didOutputMetadataObjects:didOutputDepthData:atTime:", v8, a4, v9, 0, 0, 0, &v12);
  }

}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  AVCaptureMetadataOutput *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  _BOOL4 v28;
  unint64_t droppedFramesPerSec;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[3];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  ARFaceTrackingImageSensor *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  -[ARImageSensor videoOutput](self, "videoOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", self->_metaDataOutput);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_depthDataOutput)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(v40, "dataOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", self->_metaDataOutput))
  {
    -[AVCaptureMetadataOutput metadataObjectTypes](self->_metaDataOutput, "metadataObjectTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C8AA68];
    if (objc_msgSend(v10, "containsObject:", *MEMORY[0x1E0C8AA68]))
    {
      v12 = -[NSArray containsObject:](self->_availableMetadataObjectTypes, "containsObject:", v11);
      if (v39)
        v13 = 0;
      else
        v13 = v12;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v8;
      -[ARImageSensor videoOutput](self, "videoOutput");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v35, "sampleBuffer");
      -[ARImageSensor videoOutput](self, "videoOutput");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0C8A808];
      objc_msgSend(v14, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_signpostFirstFrameDone)
      {
        self->_signpostFirstFrameDone = 1;
        kdebug_trace();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v39;
        v17 = self->_metaDataOutput;
        objc_msgSend(v16, "metadataObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSArray containsObject:](self->_availableMetadataObjectTypes, "containsObject:", *MEMORY[0x1E0C8AA68]))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "filteredArrayUsingPredicate:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v20, "count"))
            v13 = 1;

        }
        if (!v37)
        {
          -[ARImageSensor videoOutput](self, "videoOutput");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "connectionWithMediaType:", v15);
          v22 = objc_claimAutoreleasedReturnValue();

          v37 = (void *)v22;
        }

      }
      else
      {
        v17 = 0;
        v18 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v38, "depthData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSince1970");
      v26 = v25;

      if (v26 - self->_startTime > 1.0)
      {
        self->_startTime = v26;
        self->_droppedFramesPerSec = 0;
      }
      if (v13)
      {
        v27 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.face.previousImageDataOnDrop"));
        v28 = self->_previousImageDataValid && v27;
        droppedFramesPerSec = self->_droppedFramesPerSec;
        if (v28)
        {
          self->_droppedFramesPerSec = droppedFramesPerSec + 1;
          self->_previousImageDataValid = 0;
          kdebug_trace();
LABEL_40:
          kdebug_trace();
LABEL_47:

          goto LABEL_48;
        }
        if (droppedFramesPerSec <= 4)
        {
          self->_droppedFramesPerSec = droppedFramesPerSec + 1;
          _ARLogSensor();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARImageSensor logPrefix](self, "logPrefix");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v32;
            v44 = 2048;
            v45 = self;
            v46 = 2112;
            v47 = v33;
            _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Image frame was dropped.", buf, 0x20u);

          }
          goto LABEL_40;
        }
        kdebug_trace();
      }
      if (v34)
      {
        kdebug_trace();
        if (v38)
          objc_msgSend(v38, "timestamp");
        else
          memset(v41, 0, sizeof(v41));
        -[ARFaceTrackingImageSensor capturedSynchedOutput:didOutputSampleBuffer:fromVideoConnection:metaDataOutput:didOutputMetadataObjects:didOutputDepthData:atTime:](self, "capturedSynchedOutput:didOutputSampleBuffer:fromVideoConnection:metaDataOutput:didOutputMetadataObjects:didOutputDepthData:atTime:", v36, v34, v37, v17, v18, v23, v41);
      }
      goto LABEL_47;
    }
  }
LABEL_48:

}

uint64_t __88__ARFaceTrackingImageSensor_dataOutputSynchronizer_didOutputSynchronizedDataCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)capturedSynchedOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromVideoConnection:(id)a5 metaDataOutput:(id)a6 didOutputMetadataObjects:(id)a7 didOutputDepthData:(id)a8 atTime:(id *)a9
{
  id v13;
  id v14;
  ARImageData *v15;
  int64_t v16;
  void *v17;
  void *v18;
  ARImageData *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  ARFaceData *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  CMTime v44;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45;
  CMTime time2;
  CMTime time1;
  char v48;
  CMTime time;
  CMTime v50;

  v13 = a5;
  v14 = a7;
  v43 = a8;
  memset(&v50, 0, sizeof(v50));
  CMSampleBufferGetPresentationTimeStamp(&v50, a4);
  time = v50;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  v15 = [ARImageData alloc];
  v16 = -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond");
  -[ARImageSensor captureDevice](self, "captureDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageSensor captureSession](self, "captureSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ARImageData initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:](v15, "initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:", a4, v16, v17, v18);

  -[ARImageData setMirrored:](v19, "setMirrored:", objc_msgSend(v13, "isVideoMirrored"));
  if (v19)
  {
    -[ARImageSensor enableContinuousAutoFocusIfPossible](self, "enableContinuousAutoFocusIfPossible");
    v42 = v14;
    v48 = 0;
    -[ARImageSensor trackExposureTargetOffsetIfNeededForImageData:shouldDrop:](self, "trackExposureTargetOffsetIfNeededForImageData:shouldDrop:", v19, &v48);
    if (!v48)
    {
      -[ARImageSensor bufferPopulationMonitor](self, "bufferPopulationMonitor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ARImageData pixelBuffer](v19, "pixelBuffer");
      -[ARImageSensor captureDevice](self, "captureDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageData timestamp](v19, "timestamp");
      v25 = v24;
      -[ARImageSensor captureDevice](self, "captureDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "deviceType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trackPixelBuffer:withLabel:timestamp:signpostType:", v21, v23, ARBufferPopulationMonitorSignpostTypeForCaptureDevice(v27), v25);

      time1 = *(CMTime *)a9;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      if (CMTimeCompare(&time1, &time2))
      {
        v45 = *a9;
        -[ARImageSensor captureSession](self, "captureSession");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARImageData captureDateFromPresentationTimestamp:session:](ARImageData, "captureDateFromPresentationTimestamp:session:", &v45, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[ARImageData timestamp](v19, "timestamp");
        -[ARImageData captureDate](v19, "captureDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "timeIntervalSinceNow");
        objc_msgSend(v29, "timeIntervalSinceNow");
        kdebug_trace();

      }
      else
      {
        -[ARImageData timestamp](v19, "timestamp");
        -[ARImageData captureDate](v19, "captureDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceNow");
        kdebug_trace();
      }

      -[ARImageSensor outputSynchronizer](self, "outputSynchronizer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_10;
      -[ARImageSensor outputSynchronizer](self, "outputSynchronizer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dataOutputs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "containsObject:", self->_metaDataOutput);

      if (v34)
      {
        v35 = -[ARFaceData initWithMetadataObjects:mirroredVideoInput:stripDetectionData:]([ARFaceData alloc], "initWithMetadataObjects:mirroredVideoInput:stripDetectionData:", v42, objc_msgSend(v13, "isVideoMirrored"), -[ARFaceTrackingImageSensor recordingMode](self, "recordingMode") ^ 1);
        -[ARImageData setFaceData:](v19, "setFaceData:", v35);

      }
      else
      {
LABEL_10:
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_faceDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        -[ARImageData setFaceData:](v19, "setFaceData:", self->_latestFaceData);
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_faceDataSemaphore);
      }
      if (self->_depthDataOutput)
      {
        -[ARImageData setDepthData:](v19, "setDepthData:", v43);
        v44 = *(CMTime *)a9;
        -[ARImageData setDepthDataTimestamp:](v19, "setDepthDataTimestamp:", CMTimeGetSeconds(&v44));
      }
      else
      {
        -[ARImageData setDepthData:](v19, "setDepthData:", 0);
      }
      self->_previousImageDataValid = 1;
      if (!self->_signpostFirstFaceDone)
      {
        -[ARImageData faceData](v19, "faceData");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "faceMeshPayload");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD88]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v39)
        {
          self->_signpostFirstFaceDone = 1;
          kdebug_trace();
        }
      }
      +[ARImageSensor registerSignPostForImageData:](ARImageSensor, "registerSignPostForImageData:", v19);
      -[ARImageData timestamp](v19, "timestamp");
      kdebug_trace();
      -[ARImageSensor delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sensor:didOutputSensorData:", self, v19);

      -[ARImageData timestamp](v19, "timestamp");
      kdebug_trace();
      -[ARImageData timestamp](v19, "timestamp");
      -[ARImageData cameraType](v19, "cameraType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      kdebug_trace();

    }
    v14 = v42;
  }
  else
  {
    kdebug_trace();
  }

}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  ARFaceData *v6;
  void *v7;
  ARFaceData *v8;
  ARFaceData *latestFaceData;
  id v10;

  v10 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_faceDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v6 = [ARFaceData alloc];
  -[ARImageSensor settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ARFaceData initWithMetadataObjects:mirroredVideoInput:stripDetectionData:](v6, "initWithMetadataObjects:mirroredVideoInput:stripDetectionData:", v10, objc_msgSend(v7, "mirrorVideoOutput"), -[ARFaceTrackingImageSensor recordingMode](self, "recordingMode") ^ 1);
  latestFaceData = self->_latestFaceData;
  self->_latestFaceData = v8;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_faceDataSemaphore);
}

- (BOOL)recordingMode
{
  return self->_recordingMode;
}

- (void)setRecordingMode:(BOOL)a3
{
  self->_recordingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataConnection, 0);
  objc_storeStrong((id *)&self->_depthConnection, 0);
  objc_storeStrong((id *)&self->_faceDataSemaphore, 0);
  objc_storeStrong((id *)&self->_latestFaceData, 0);
  objc_storeStrong((id *)&self->_depthDataOutput, 0);
  objc_storeStrong((id *)&self->_availableMetadataObjectTypes, 0);
  objc_storeStrong((id *)&self->_metaDataOutput, 0);
}

@end
