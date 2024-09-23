@implementation ARDepthSensor

- (unint64_t)providedDataTypes
{
  return 0;
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
  ARDepthSensor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[AVCapturePointCloudDataOutput setDelegate:callbackQueue:](self->_pointCloudOutput, "setDelegate:callbackQueue:", 0, 0);
  _ARLogSensor();
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
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARDepthSensor stop complete", (uint8_t *)&v7, 0x20u);

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
  ARDepthSensor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _ARLogSensor();
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
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ start called on a child depth image sensor instead of parent image sensor", (uint8_t *)&v7, 0x20u);

  }
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
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  ARDepthSensor *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    v24 = v5;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ preparing to start", buf, 0x20u);

  }
  -[ARImageSensor setActiveFormat](self, "setActiveFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[ARDepthSensor configureCaptureSession](self, "configureCaptureSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[ARImageSensor captureDevice](self, "captureDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v11 = objc_msgSend(v10, "lockForConfiguration:", &v20);
      v8 = v20;
      if (v11)
      {
        -[ARImageSensor configureFrameRateForDevice:](self, "configureFrameRateForDevice:", v10);
        -[ARDepthSensor _configureProjectorModeForDevice:](self, "_configureProjectorModeForDevice:", v10);
        objc_msgSend(v10, "unlockForConfiguration");
        if (!v8)
          goto LABEL_19;
      }
      else
      {
        _ARLogSensor();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v24 = v14;
          v25 = 2048;
          v26 = self;
          v27 = 2112;
          v28 = v15;
          v29 = 2112;
          v30 = v16;
          _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device for configuration: %@", buf, 0x2Au);

        }
        if (v8)
        {
          v21 = *MEMORY[0x1E0CB3388];
          v22 = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0C9AA70];
        }
        ARErrorWithCodeAndUserInfo(101, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        if (v8)
        v8 = (id)v18;
        if (!v18)
          goto LABEL_19;
      }
      v19 = v8;
LABEL_19:

      goto LABEL_6;
    }
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (id)configureCaptureSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FourCharCode MediaSubType;
  void *v17;
  id v18;
  AVCapturePointCloudDataOutput *v19;
  AVCapturePointCloudDataOutput *pointCloudOutput;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  AVCapturePointCloudDataOutput *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  objc_class *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  objc_class *v94;
  void *v95;
  void *v96;
  const char *v97;
  objc_class *v98;
  NSObject *v99;
  objc_class *v100;
  void *v101;
  void *v102;
  void *v103;
  objc_class *v104;
  void *v105;
  void *v106;
  Float64 Seconds;
  id v109;
  CMTime time;
  CMTime v111;
  CMTime v112;
  id v113;
  void *v114;
  uint64_t v115;
  id v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  ARDepthSensor *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  Float64 v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  -[ARImageSensor videoInput](self, "videoInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ARImageSensor videoInput](self, "videoInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor captureDevice](self, "captureDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      _ARLogSensor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor videoInput](self, "videoInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "device");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v118 = v9;
        v119 = 2048;
        v120 = self;
        v121 = 2112;
        v122 = v10;
        v123 = 2112;
        v124 = *(double *)&v12;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported capture device: %@", buf, 0x2Au);

      }
LABEL_24:

      v61 = 150;
      v62 = 0;
LABEL_25:
      ARErrorWithCodeAndUserInfo(v61, v62);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      return v31;
    }
    -[ARImageSensor videoInput](self, "videoInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v15, "formatDescription"));

    if (MediaSubType != 1785950320)
    {
      _ARLogSensor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v118 = v59;
        v119 = 2048;
        v120 = self;
        v121 = 2112;
        v122 = v60;
        v123 = 1024;
        LODWORD(v124) = MediaSubType;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported data format: %d", buf, 0x26u);

      }
      goto LABEL_24;
    }
  }
  -[ARImageSensor videoInput](self, "videoInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = 0;
  }
  else
  {
    v32 = objc_alloc(MEMORY[0x1E0C8B0B0]);
    -[ARImageSensor captureDevice](self, "captureDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0;
    v34 = (void *)objc_msgSend(v32, "initWithDevice:error:", v33, &v113);
    v18 = v113;
    -[ARImageSensor setVideoInput:](self, "setVideoInput:", v34);

    -[ARImageSensor videoInput](self, "videoInput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      _ARLogSensor();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v87 = (objc_class *)objc_opt_class();
        NSStringFromClass(v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "description");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor captureDevice](self, "captureDevice");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v118 = v88;
        v119 = 2048;
        v120 = self;
        v121 = 2112;
        v122 = v89;
        v123 = 2112;
        v124 = *(double *)&v90;
        v125 = 2112;
        v126 = v91;
        _os_log_impl(&dword_1B3A68000, v86, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Error creating capture input for depth sensor: %@ (%@)", buf, 0x34u);

      }
      if (!v18)
      {
        v62 = (void *)MEMORY[0x1E0C9AA70];
        v61 = 101;
        goto LABEL_25;
      }
      v115 = *MEMORY[0x1E0CB3388];
      v116 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(101, v92);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
      return v31;
    }
    -[ARImageSensor captureSession](self, "captureSession");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor videoInput](self, "videoInput");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "canAddInput:", v37);

    if (!v38)
    {
      _ARLogSensor();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v98 = (objc_class *)objc_opt_class();
        NSStringFromClass(v98);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v118 = v95;
        v119 = 2048;
        v120 = self;
        v121 = 2112;
        v122 = v96;
        v97 = "%{public}@ <%p>: %@ Cannot add video data input to the capture session";
        goto LABEL_39;
      }
LABEL_40:

      ARErrorWithCodeAndUserInfo(102, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    -[ARImageSensor captureSession](self, "captureSession");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor videoInput](self, "videoInput");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addInputWithNoConnections:", v40);

    _ARLogSensor();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v118 = v43;
      v119 = 2048;
      v120 = self;
      v121 = 2112;
      v122 = v44;
      _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data input to the capture session", buf, 0x20u);

    }
    -[ARImageSensor settings](self, "settings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "videoFormat");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frameRatesByPowerUsage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "doubleValue");
    v50 = v49;

    CMTimeMake(&v112, 1, (int)v50);
    -[ARImageSensor videoInput](self, "videoInput");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v112;
    objc_msgSend(v51, "setVideoMinFrameDurationOverride:", &v111);

    _ARLogSensor();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor videoInput](self, "videoInput");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      if (v56)
        objc_msgSend(v56, "videoMinFrameDurationOverride");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138544130;
      v118 = v54;
      v119 = 2048;
      v120 = self;
      v121 = 2112;
      v122 = v55;
      v123 = 2048;
      v124 = Seconds;
      _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Video min frame duration override set to %f", buf, 0x2Au);

    }
  }
  if (self->_pointCloudOutput)
    goto LABEL_13;
  v19 = (AVCapturePointCloudDataOutput *)objc_opt_new();
  pointCloudOutput = self->_pointCloudOutput;
  self->_pointCloudOutput = v19;

  -[ARImageSensor captureSession](self, "captureSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "canAddOutput:", self->_pointCloudOutput);

  if (!v22)
  {
    _ARLogSensor();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v118 = v95;
      v119 = 2048;
      v120 = self;
      v121 = 2112;
      v122 = v96;
      v97 = "%{public}@ <%p>: %@ Cannot add video data output to the capture session";
LABEL_39:
      _os_log_impl(&dword_1B3A68000, v93, OS_LOG_TYPE_ERROR, v97, buf, 0x20u);

      goto LABEL_40;
    }
    goto LABEL_40;
  }
  -[ARImageSensor captureSession](self, "captureSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOutputWithNoConnections:", self->_pointCloudOutput);

  _ARLogSensor();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v118 = v26;
    v119 = 2048;
    v120 = self;
    v121 = 2112;
    v122 = v27;
    _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data output to the capture session", buf, 0x20u);

  }
LABEL_13:
  -[ARImageSensor videoConnection](self, "videoConnection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v109 = v18;
    -[ARImageSensor videoInput](self, "videoInput");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x1E0C8A7E8];
    -[ARImageSensor videoInput](self, "videoInput");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "device");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "deviceType");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor videoInput](self, "videoInput");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "device");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v64, v67, objc_msgSend(v69, "position"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "firstObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      v72 = (void *)MEMORY[0x1E0C8B070];
      v114 = v71;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "connectionWithInputPorts:output:", v73, self->_pointCloudOutput);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor setVideoConnection:](self, "setVideoConnection:", v74);

      -[ARImageSensor captureSession](self, "captureSession");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor videoConnection](self, "videoConnection");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v75, "canAddConnection:", v76);

      if ((v77 & 1) != 0)
      {
        -[ARImageSensor connections](self, "connections");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor videoConnection](self, "videoConnection");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObject:", v79);

        -[ARImageSensor captureSession](self, "captureSession");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor videoConnection](self, "videoConnection");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addConnection:", v81);

        _ARLogSensor();
        v82 = objc_claimAutoreleasedReturnValue();
        v18 = v109;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          v83 = (objc_class *)objc_opt_class();
          NSStringFromClass(v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARImageSensor logPrefix](self, "logPrefix");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v118 = v84;
          v119 = 2048;
          v120 = self;
          v121 = 2112;
          v122 = v85;
          _os_log_impl(&dword_1B3A68000, v82, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data connection to the capture session", buf, 0x20u);

        }
        goto LABEL_14;
      }
      _ARLogSensor();
      v99 = objc_claimAutoreleasedReturnValue();
      v103 = v109;
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v104 = (objc_class *)objc_opt_class();
        NSStringFromClass(v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v118 = v105;
        v119 = 2048;
        v120 = self;
        v121 = 2112;
        v122 = v106;
        _os_log_impl(&dword_1B3A68000, v99, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add video connection to capture session", buf, 0x20u);

      }
    }
    else
    {
      _ARLogSensor();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v100 = (objc_class *)objc_opt_class();
        NSStringFromClass(v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageSensor logPrefix](self, "logPrefix");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v118 = v101;
        v119 = 2048;
        v120 = self;
        v121 = 2112;
        v122 = v102;
        _os_log_impl(&dword_1B3A68000, v99, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find a video port in the input added to the capture session", buf, 0x20u);

      }
      v103 = v109;
    }

    ARErrorWithCodeAndUserInfo(102, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    return v31;
  }
LABEL_14:
  -[AVCapturePointCloudDataOutput setAlwaysDiscardsLatePointCloudData:](self->_pointCloudOutput, "setAlwaysDiscardsLatePointCloudData:", 1);
  v29 = self->_pointCloudOutput;
  -[ARImageSensor captureQueue](self, "captureQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCapturePointCloudDataOutput setDelegate:callbackQueue:](v29, "setDelegate:callbackQueue:", self, v30);

  v31 = 0;
  return v31;
}

- (BOOL)canReconfigure:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ARImageSensor settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (void)_configureProjectorModeForDevice:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  char v8;
  __CFString *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  ARDepthSensor *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARImageSensor settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeOfFlightProjectorMode");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[ARImageSensor captureDevice](self, "captureDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTimeOfFlightProjectorModeSupported:", ARAVTimeOfFlightProjectorModeFromARTimeOfFlightProjectMode(v6));

  if ((v8 & 1) != 0)
  {
    v9 = v6;
  }
  else
  {
    _ARLogSensor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544386;
      v24 = v12;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v6;
      v31 = 2048;
      v32 = objc_msgSend(v4, "timeOfFlightProjectorMode");
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Requested projector mode %@ is not supported on this device. Current projector mode of the device: %ld.", (uint8_t *)&v23, 0x34u);

    }
    v9 = CFSTR("ARTimeOfFlightProjectorModeNormal");

    _ARLogSensor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor logPrefix](self, "logPrefix");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v16;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Falling back to projector mode %@.", (uint8_t *)&v23, 0x2Au);

    }
  }
  objc_msgSend(v4, "setTimeOfFlightProjectorMode:", ARAVTimeOfFlightProjectorModeFromARTimeOfFlightProjectMode(v9));
  _ARLogSensor();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v4, "timeOfFlightProjectorMode");
    v23 = 138544386;
    v24 = v20;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v21;
    v29 = 2112;
    v30 = v9;
    v31 = 2048;
    v32 = v22;
    _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARDepthSensor projector mode set to %@(%ld)", (uint8_t *)&v23, 0x34u);

  }
}

- (void)pointCloudDataOutput:(id)a3 didOutputPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  id v8;
  ARPointCloudSensorData *v9;
  int64_t v10;
  void *v11;
  void *v12;
  ARPointCloudSensorData *v13;
  void *v14;
  char v15;
  NSMutableDictionary *extrinsicsMap;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double Seconds;
  void *v45;
  void *v46;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  void *v54;
  uint64_t v55;
  simd_float4x4 v56;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = [ARPointCloudSensorData alloc];
  v10 = -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond");
  -[ARImageSensor captureDevice](self, "captureDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageSensor captureSession](self, "captureSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ARPointCloudSensorData initWithPointCloudData:captureFramePerSecond:captureDevice:captureSession:](v9, "initWithPointCloudData:captureFramePerSecond:captureDevice:captureSession:", v8, v10, v11, v12);

  if (v13)
  {
    -[ARImageSensor dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v47 = a5;
      extrinsicsMap = self->_extrinsicsMap;
      if (!extrinsicsMap)
      {
        -[ARImageSensor dataSource](self, "dataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "captureDeviceTypeToExtrinsicsMapForImageSensor:", self);
        v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v19 = self->_extrinsicsMap;
        self->_extrinsicsMap = v18;

        extrinsicsMap = self->_extrinsicsMap;
      }
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[NSMutableDictionary allKeys](extrinsicsMap, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v49;
        v24 = *MEMORY[0x1E0C89FA0];
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v49 != v23)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if (objc_msgSend(v26, "isEqualToString:", v24))
            {
              -[NSMutableDictionary objectForKeyedSubscript:](self->_extrinsicsMap, "objectForKeyedSubscript:", v26);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(double *)v56.columns[0].i64 = ARMatrix4x3FromNSData(v32);
              -[ARPointCloudSensorData setExtrinsicsToWideSensor:](v13, "setExtrinsicsToWideSensor:", ARMatrix4x3Inverse(v56));

              goto LABEL_17;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_17:

      a5 = v47;
    }
    -[ARPointCloudSensorData extrinsicsToWideSensor](v13, "extrinsicsToWideSensor");
    if (ARMatrix4x3IsZero(v33, v34, v35, v36))
    {
      _ARLogGeneral_0();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.var0) = 138543618;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v39;
        LOWORD(buf.var2) = 2048;
        *(_QWORD *)((char *)&buf.var2 + 2) = self;
        _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_FAULT, "%{public}@ <%p>: Did not receive extrinsics from [AVCaptureDevice extrinsicMatrixFromDevice:sensor.captureDevice toDevice:depthSensor.captureDevice];",
          (uint8_t *)&buf,
          0x16u);

      }
    }
    -[ARImageSensor bufferPopulationMonitor](self, "bufferPopulationMonitor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(objc_retainAutorelease(v8), "pointCloudDataBuffer");
    -[ARImageSensor captureDevice](self, "captureDevice");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    buf = *a5;
    Seconds = CMTimeGetSeconds((CMTime *)&buf);
    -[ARImageSensor captureDevice](self, "captureDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "deviceType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trackDataBuffer:withLabel:timestamp:signpostType:", v41, v43, ARBufferPopulationMonitorSignpostTypeForCaptureDevice(v46), Seconds);

    objc_msgSend((id)objc_opt_class(), "registerSignPostForPointCloudData:", v13);
    -[ARImageSensor delegate](self, "delegate");
    v27 = objc_claimAutoreleasedReturnValue();
    -[NSObject sensor:didOutputSensorData:](v27, "sensor:didOutputSensorData:", self, v13);
  }
  else
  {
    _ARLogSensor();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageSensor captureDevice](self, "captureDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "deviceType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.var0) = 138543874;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v29;
      LOWORD(buf.var2) = 2048;
      *(_QWORD *)((char *)&buf.var2 + 2) = self;
      HIWORD(buf.var3) = 2112;
      v54 = v31;
      _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropped a pointCloudDataOutput: %@", (uint8_t *)&buf, 0x20u);

    }
  }

}

- (void)pointCloudDataOutput:(id)a3 didDropPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7
{
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  double Seconds;
  const __CFString *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  void *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _ARLogSensor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageSensor logPrefix](self, "logPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *a5;
    Seconds = CMTimeGetSeconds((CMTime *)&v16);
    if ((unint64_t)a7 > 3)
      v15 = CFSTR("Undefined");
    else
      v15 = off_1E6672208[a7];
    LODWORD(v16.var0) = 138544386;
    *(int64_t *)((char *)&v16.var0 + 4) = (int64_t)v12;
    LOWORD(v16.var2) = 2048;
    *(_QWORD *)((char *)&v16.var2 + 2) = self;
    HIWORD(v16.var3) = 2112;
    v17 = v13;
    v18 = 2048;
    v19 = Seconds;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ capture session dropped jasper frame: %f, %@", (uint8_t *)&v16, 0x34u);

  }
  kdebug_trace();
}

+ (void)registerSignPostForPointCloudData:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "pointCloud");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v8, "pointCloud");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v8, "pointCloud");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bankIds");

      objc_msgSend(v8, "timestamp");
      kdebug_trace();
    }
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARImageSensor captureDevice](self, "captureDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" %@\n"), v7);

  -[ARImageSensor captureDevice](self, "captureDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "timeOfFlightProjectorMode");
  if (v9 > 6)
    v10 = CFSTR("Undefined");
  else
    v10 = off_1E6672228[v9];
  objc_msgSend(v6, "appendFormat:", CFSTR("ProjectorMode: %@\n"), v10);

  -[ARImageSensor captureDevice](self, "captureDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("BankCount: %li\n"), objc_msgSend(v11, "timeOfFlightBankCount"));

  -[ARImageSensor settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v14);

  return (NSString *)v6;
}

- (NSString)projectorMode
{
  return self->_projectorMode;
}

- (void)setProjectorMode:(id)a3
{
  objc_storeStrong((id *)&self->_projectorMode, a3);
}

- (AVCapturePointCloudDataOutput)pointCloudOutput
{
  return self->_pointCloudOutput;
}

- (void)setPointCloudOutput:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointCloudOutput, 0);
  objc_storeStrong((id *)&self->_projectorMode, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
}

@end
