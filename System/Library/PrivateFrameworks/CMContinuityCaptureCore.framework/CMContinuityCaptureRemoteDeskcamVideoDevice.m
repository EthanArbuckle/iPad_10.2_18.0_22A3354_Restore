@implementation CMContinuityCaptureRemoteDeskcamVideoDevice

- (id)connectionsForConfiguration:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL8 v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  CMContinuityCaptureRemoteDeskcamVideoDevice *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v50 = self;
    v51 = 2080;
    v52 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:]";
    v53 = 2112;
    v54 = v4;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v12 = CMContinuityCaptureDevicePosition();
    v13 = *MEMORY[0x24BDB1A68];
    v14 = *MEMORY[0x24BDB1D50];
    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A68], *MEMORY[0x24BDB1D50], v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice setVideoDevice:](self, "setVideoDevice:", v15);

    -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:](self, "setDeskViewCameraMode:", objc_msgSend(v17, "deskViewCameraMode"));

      -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "streaming");

      if ((v19 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setCenterStageControlMode:", 1);
        objc_msgSend(MEMORY[0x24BDB2460], "setCenterStageEnabled:", 0);
      }
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:](self, "setFaceDrivenAFActive:", 0);
      v20 = (void *)MEMORY[0x24BDB2470];
      -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend(v20, "deviceInputWithDevice:error:", v21, &v47);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v47;
      -[CMContinuityCaptureRemoteVideoDevice setVideoDataInput:](self, "setVideoDataInput:", v22);

      -[CMContinuityCaptureRemoteVideoDevice videoDataInput](self, "videoDataInput");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && !v23)
      {
        v25 = objc_alloc_init(MEMORY[0x24BDB2508]);
        -[CMContinuityCaptureRemoteVideoDevice setVideoDataOutput:](self, "setVideoDataOutput:", v25);

        -[CMContinuityCaptureRemoteVideoDevice videoDataOutput](self, "videoDataOutput");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMContinuityCaptureDeviceBase queue](self, "queue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setSampleBufferDelegate:queue:", self, v27);

        -[CMContinuityCaptureRemoteVideoDevice videoDataInput](self, "videoDataInput");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v14, v13, v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "count"))
        {
          v30 = (void *)MEMORY[0x24BDB2448];
          objc_msgSend(v29, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v31;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMContinuityCaptureRemoteVideoDevice videoDataOutput](self, "videoDataOutput");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "connectionWithInputPorts:output:", v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMContinuityCaptureRemoteVideoDevice setVideoDataConnection:](self, "setVideoDataConnection:", v34);

          -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](self, "videoDataConnection");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v35);

          v36 = objc_msgSend(v4, "entity");
          v37 = v36 == -[CMContinuityCaptureDeviceBase entity](self, "entity");
          -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](self, "videoDataConnection");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setEnabled:", v37);

          CMContinuityCaptureLog(2);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](self, "videoDataConnection");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEnabled");
            *(_DWORD *)buf = 138543618;
            v50 = self;
            v51 = 1024;
            LODWORD(v52) = v41;
            _os_log_impl(&dword_227C5D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ VDO connection enabled %d", buf, 0x12u);

          }
          -[CMContinuityCaptureRemoteVideoDevice setConnections:](self, "setConnections:", v5);
          v23 = 0;
          v42 = v5;
        }
        else
        {
          CMContinuityCaptureLog(2);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:].cold.3();

          v42 = 0;
          v23 = 0;
        }
        goto LABEL_16;
      }
      CMContinuityCaptureLog(2);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:].cold.2();

      v42 = 0;
    }
    else
    {
      CMContinuityCaptureLog(2);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:].cold.1();

      v42 = 0;
      v23 = 0;
    }
    v29 = 0;
LABEL_16:
    v11 = v42;

    goto LABEL_17;
  }
  CMContinuityCaptureLog(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = self;
    v51 = 2112;
    v52 = v10;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ returning already created connections %@", buf, 0x16u);

  }
  -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v11;
}

- (BOOL)configureConnections
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  CMContinuityCaptureRemoteDeskcamVideoDevice *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v34;
  uint64_t v35;
  CMContinuityCaptureRemoteDeskcamVideoDevice *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  CMContinuityCaptureRemoteDeskcamVideoDevice *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinFrameDurationOverrideIfApplicable");

  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStreamingOnSuperWide");

  if (v6)
  {
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFaceDrivenAFActive:", 0);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = self;
  -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v39;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v34)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
      -[CMContinuityCaptureDeviceBase activeConfiguration](v36, "activeConfiguration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureRemoteVideoDevice captureSession](v36, "captureSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isMulticamSession");
      -[CMContinuityCaptureDeviceBase activeConfiguration](v36, "activeConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "format");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "minFrameRate");
      -[CMContinuityCaptureDeviceBase activeConfiguration](v36, "activeConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "format");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = -[CMContinuityCaptureRemoteVideoDevice _deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:](v36, "_deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:", v11, v37, v13, v16, objc_msgSend(v18, "maxFrameRate"));

      if ((v13 & 1) != 0)
        break;
      if (v35 == ++v10)
      {
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v35)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v19 = v11;

    if (!v19)
      goto LABEL_16;
    CMContinuityCaptureLog(2);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v36;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[CMContinuityCaptureRemoteVideoDevice videoDevice](v36, "videoDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v36;
      v44 = 2112;
      v45 = v23;
      v46 = 2112;
      v47 = v19;
      _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting format for %@: %@", buf, 0x20u);

    }
    -[CMContinuityCaptureRemoteVideoDevice setFormat:](v36, "setFormat:", v19);
  }
  else
  {
LABEL_11:

LABEL_16:
    CMContinuityCaptureLog(2);
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = v36;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteDeskcamVideoDevice configureConnections].cold.1();

    v19 = 0;
  }
  if (-[CMContinuityCaptureRemoteVideoDevice deskViewCameraMode](v21, "deskViewCameraMode"))
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](v21, "activeConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:](v21, "setDeskViewCameraMode:", objc_msgSend(v25, "deskViewCameraMode"));

    -[CMContinuityCaptureRemoteVideoDevice companionDevice](v21, "companionDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isStreamingOnSuperWide");

    if (v27)
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](v21, "activeConfiguration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "deskViewCameraMode");
      -[CMContinuityCaptureRemoteVideoDevice companionDevice](v21, "companionDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDeskViewCameraMode:", v29);

    }
  }
  -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](v21, "videoDataConnection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEnabled:", 1);

  return 1;
}

- (BOOL)_shouldOnlyDisableVideoConnection
{
  NSObject *v3;
  void *v4;
  int v5;
  _BOOL4 manualFramingFeatureFlagEnabled;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "streaming");

  if (v5)
  {
    manualFramingFeatureFlagEnabled = self->super._manualFramingFeatureFlagEnabled;
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "centerStageEnabled");

    if (manualFramingFeatureFlagEnabled)
    {
      -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v8)
        v8 = objc_msgSend(v10, "centerStageFieldOfViewRestrictedToWide") ^ 1;
      else
        v8 = objc_msgSend(v10, "manualFramingDeviceType") == 2;

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_companionConnectionsRequired
{
  void *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "streaming") & 1) != 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "centerStageEnabled");
  if ((v7 & 1) != 0
    || (objc_msgSend(v5, "activeConfiguration"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "isCenterStageForcefullyEnabled")))
  {
    objc_msgSend(v5, "activeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "centerStageFieldOfViewRestrictedToWide") ^ 1;

    if ((v7 & 1) != 0)
      goto LABEL_8;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

LABEL_8:
LABEL_9:

  return v9;
}

- (void)_forcefullyEnableCenterStageOnSuperWide
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  CMContinuityCaptureRemoteDeskcamVideoDevice *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDockedTrackingEnabled");

  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "Docked tracking is enabled, do not forcefully enable Center Stage as requested", (uint8_t *)&v26, 2u);
    }
  }
  else
  {
    if (v6)
    {
      v26 = 138543618;
      v27 = self;
      v28 = 2080;
      v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Forcefully enable Center Stage on the default video camera as requested", (uint8_t *)&v26, 0x16u);
    }

    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "forcefulCenterStageEnablementType");
    -[NSObject activeConfiguration](v5, "activeConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setForcefulCenterStageEnablementType:", v8);

    LODWORD(v8) = -[NSObject centerStageEnabled](v5, "centerStageEnabled");
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v8)
    {
      if (v11)
      {
        v26 = 138543618;
        v27 = self;
        v28 = 2080;
        v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Already running Center Stage on the wide, switching to the super wide", (uint8_t *)&v26, 0x16u);
      }

      -[NSObject setShouldRestoreCenterStageOnWideCamera:](v5, "setShouldRestoreCenterStageOnWideCamera:", 1);
      -[NSObject activeConfiguration](v5, "activeConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCenterStageFieldOfViewRestrictedToWide:", 0);

LABEL_18:
      -[NSObject captureSession](v5, "captureSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject connections](v5, "connections");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeConnections:", v22);

      -[NSObject captureSession](v5, "captureSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject activeConfiguration](v5, "activeConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject connectionsForConfiguration:](v5, "connectionsForConfiguration:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addConnections:", v25);

      goto LABEL_22;
    }
    if (v11)
    {
      v26 = 138543618;
      v27 = self;
      v28 = 2080;
      v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching from Manual Framing to Center Stage", (uint8_t *)&v26, 0x16u);
    }

    -[NSObject activeConfiguration](v5, "activeConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "centerStageFieldOfViewRestrictedToWide");

    if (v14)
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543618;
        v27 = self;
        v28 = 2080;
        v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Center Stage is set to run on the back wide. Switching to the super wide", (uint8_t *)&v26, 0x16u);
      }

      -[NSObject setShouldRestoreCenterStageOnWideCamera:](v5, "setShouldRestoreCenterStageOnWideCamera:", 1);
      -[NSObject activeConfiguration](v5, "activeConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCenterStageFieldOfViewRestrictedToWide:", 0);

    }
    -[NSObject activeConfiguration](v5, "activeConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "manualFramingDeviceType");

    CMContinuityCaptureLog(2);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18 == 1)
    {
      if (v20)
      {
        v26 = 138543618;
        v27 = self;
        v28 = 2080;
        v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Manual Framing on the back wide. Switching to the super wide", (uint8_t *)&v26, 0x16u);
      }

      goto LABEL_18;
    }
    if (v20)
    {
      v26 = 138543618;
      v27 = self;
      v28 = 2080;
      v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Manual Framing on the super wide. Turning on Center Stage", (uint8_t *)&v26, 0x16u);
    }

    -[NSObject setCenterStageEnabled:](v5, "setCenterStageEnabled:", 1);
  }
LABEL_22:

}

- (void)_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  CMContinuityCaptureRemoteDeskcamVideoDevice *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCenterStageForcefullyEnabled");

  if (v5)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = self;
      v10 = 2080;
      v11 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldRecon"
            "figureCaptureStack:]";
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Restoring states while exiting forcefully enabled Center Stage on super wide", (uint8_t *)&v8, 0x16u);
    }

    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setForcefulCenterStageEnablementType:", 0);

  }
}

- (void)connectionsForConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Desk View camera is required but not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)connectionsForConfiguration:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%@ Failed to create input for the Desk View camera %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)connectionsForConfiguration:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_18();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "videoDataInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, v0, v3, "%{public}@ Failed to find the Desk View camera input ports for input %@", v4);

  OUTLINED_FUNCTION_13_0();
}

- (void)configureConnections
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v1, "videoDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v5, v6, "%{public}@ Unable to find compatible device format for %@ configuration %@", v7, v8, v9, v10, v11);

}

@end
