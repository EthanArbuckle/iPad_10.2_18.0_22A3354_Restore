@implementation CMContinuityCaptureRemoteVideoDevice

- (CMContinuityCaptureRemoteVideoDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 captureSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *cmControlByName;
  NSMutableDictionary *v17;
  NSMutableDictionary *cmControlByNameWithPendingUpdates;
  NSObject *v19;
  _BOOL4 gazeSelectionEnabled;
  uint64_t v21;
  CMContinuityCaptureRemoteVideoDevice *v22;
  objc_super v24;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_8;
  objc_msgSend(v11, "localDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  self = -[CMContinuityCaptureDeviceBase initWithCapabilities:compositeDelegate:transportDevice:queue:](&v24, sel_initWithCapabilities_compositeDelegate_transportDevice_queue_, v8, v9, v13, v14);

  if (self)
  {
    objc_storeStrong((id *)&self->_captureSession, a5);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cmControlByName = self->_cmControlByName;
    self->_cmControlByName = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cmControlByNameWithPendingUpdates = self->_cmControlByNameWithPendingUpdates;
    self->_cmControlByNameWithPendingUpdates = v17;

    self->_isUltraWideCameraSupported = -[CMContinuityCaptureRemoteVideoDevice _isUltraWideCameraSupported](self, "_isUltraWideCameraSupported");
    self->_gazeSelectionEnabled = objc_msgSend(v12, "clientDeviceModel") != 2;
    CMContinuityCaptureLog(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      gazeSelectionEnabled = self->_gazeSelectionEnabled;
      v21 = objc_msgSend(v12, "clientDeviceModel");
      *(_DWORD *)buf = 138412802;
      v26 = self;
      v27 = 1024;
      v28 = gazeSelectionEnabled;
      v29 = 2048;
      v30 = v21;
      _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%@ gazeSelectionEnabled %d, clientDeviceModel %ld", buf, 0x1Cu);
    }

    if (-[CMContinuityCaptureDeviceBase entity](self, "entity") == 1)
      -[CMContinuityCaptureRemoteVideoDevice _registerDockKitNotification](self, "_registerDockKitNotification");
    self->_manualFramingFeatureFlagEnabled = _os_feature_enabled_impl();
    -[CMContinuityCaptureRemoteVideoDevice setupControls](self, "setupControls");
    self = self;
    v22 = self;
  }
  else
  {
LABEL_8:
    v22 = 0;
  }

  return v22;
}

- (void)terminateComplete:(id)a3
{
  id v4;
  DKNotificationAgent *dockKitNotificationAgent;
  objc_super v6;

  v4 = a3;
  dockKitNotificationAgent = self->_dockKitNotificationAgent;
  if (dockKitNotificationAgent)
    -[DKNotificationAgent deregisterNotifications](dockKitNotificationAgent, "deregisterNotifications");
  v6.receiver = self;
  v6.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  -[CMContinuityCaptureDeviceBase terminateComplete:](&v6, sel_terminateComplete_, v4);

}

- (void)setupControls
{
  uint64_t v3;
  uint64_t v4;
  CMContinuityCaptureControl *v5;
  uint64_t v6;
  uint64_t v7;
  CMContinuityCaptureControl *v8;
  uint64_t v9;
  CMContinuityCaptureControl *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableDictionary *cmControlByName;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _QWORD v35[11];

  v35[9] = *MEMORY[0x24BDAC8D0];
  v35[0] = CFSTR("4cc_cfac_glob_0000");
  v35[1] = CFSTR("PortraitEffectActive");
  v35[2] = CFSTR("StudioLightingActive");
  v35[3] = CFSTR("ReactionEffectsActive");
  v35[4] = CFSTR("ReactionsInProgress");
  v35[5] = CFSTR("BackgroundReplacementActive");
  v35[6] = CFSTR("CMIOExtensionPropertyStreamFrameDuration");
  v35[7] = CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration");
  v35[8] = CFSTR("OverheadCameraMode");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 9);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v7);
        v10 = [CMContinuityCaptureControl alloc];
        v11 = -[CMContinuityCaptureDeviceBase entity](self, "entity");
        v27 = xmmword_227CED5E8;
        v28 = 0;
        v5 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v10, "initWithName:attributes:entity:minimumSupportedVersion:value:", v9, 0, v11, &v27, &unk_24F07F840);

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v5, v9);
        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);

  }
  -[CMContinuityCaptureDeviceBase capabilities](self, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "controls");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        cmControlByName = self->_cmControlByName;
        objc_msgSend(v19, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](cmControlByName, "setObject:forKeyedSubscript:", v19, v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v16);
  }

}

- (id)controls
{
  return (id)-[NSMutableDictionary allValues](self->_cmControlByName, "allValues");
}

- (BOOL)isStreamingOnSuperWide
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  if (!-[CMContinuityCaptureDeviceBase streaming](self, "streaming"))
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "centerStageEnabled"))
  {

  }
  else
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCenterStageForcefullyEnabled");

    if (!v5)
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v6, "manualFramingDeviceType") == 2;
      goto LABEL_7;
    }
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "centerStageFieldOfViewRestrictedToWide") ^ 1;
LABEL_7:

  return v7;
}

- (NSArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (AVCaptureDeviceInput)videoDataInput
{
  return self->_videoDataInput;
}

- (void)setVideoDataInput:(id)a3
{
  objc_storeStrong((id *)&self->_videoDataInput, a3);
}

- (AVCaptureDevice)videoDevice
{
  return self->_videoDevice;
}

- (void)setVideoDevice:(id)a3
{
  AVCaptureDevice *v4;
  AVCaptureDevice *videoDevice;

  v4 = (AVCaptureDevice *)a3;
  if (self->_videoDevice)
    -[CMContinuityCaptureRemoteVideoDevice removeVideoDeviceKVOs](self, "removeVideoDeviceKVOs");
  videoDevice = self->_videoDevice;
  self->_videoDevice = v4;

  if (self->_videoDevice)
    -[CMContinuityCaptureRemoteVideoDevice addVideoDeviceKVOs](self, "addVideoDeviceKVOs");
}

- (AVCaptureVideoDataOutput)videoDataOutput
{
  return self->_videoDataOutput;
}

- (void)setVideoDataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_videoDataOutput, a3);
}

- (AVCaptureConnection)videoDataConnection
{
  return self->_videoDataConnection;
}

- (void)setVideoDataConnection:(id)a3
{
  objc_storeStrong((id *)&self->_videoDataConnection, a3);
}

- (BOOL)faceDrivenAFActive
{
  return -[AVCaptureDevice isFaceDrivenAutoFocusEnabled](self->_videoDevice, "isFaceDrivenAutoFocusEnabled");
}

- (void)setFaceDrivenAFActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AVCaptureDevice *videoDevice;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  AVCaptureDevice *v10;
  int v11;
  CMContinuityCaptureRemoteVideoDevice *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  videoDevice = self->_videoDevice;
  if (!videoDevice)
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
    goto LABEL_10;
  }
  if (!-[AVCaptureDevice isFocusModeSupported:](videoDevice, "isFocusModeSupported:", 2))
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_videoDevice;
      v11 = 138412802;
      v12 = self;
      v13 = 2080;
      v14 = "-[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ %s Capture device (%@) does not support auto-focus.", (uint8_t *)&v11, 0x20u);
    }
LABEL_10:

    return;
  }
  -[AVCaptureDevice lockForConfiguration:](self->_videoDevice, "lockForConfiguration:", 0);
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("off");
    if (v3)
      v8 = CFSTR("on");
    v11 = 138412802;
    v12 = self;
    v13 = 2080;
    v14 = "-[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]";
    v15 = 2112;
    v16 = (void *)v8;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%@ %s Turn %@ face-driven auto-focus.", (uint8_t *)&v11, 0x20u);
  }

  -[AVCaptureDevice setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:](self->_videoDevice, "setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:", 0);
  -[AVCaptureDevice setFaceDrivenAutoFocusEnabled:](self->_videoDevice, "setFaceDrivenAutoFocusEnabled:", v3);
  -[AVCaptureDevice setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:](self->_videoDevice, "setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:", v3);
  -[AVCaptureDevice setFocusMode:](self->_videoDevice, "setFocusMode:", 2);
  -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
}

- (int64_t)deskViewCameraMode
{
  return -[AVCaptureDevice deskViewCameraMode](self->_videoDevice, "deskViewCameraMode");
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  NSObject *v5;
  AVCaptureDevice *videoDevice;
  void *v7;
  NSObject *v8;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  videoDevice = self->_videoDevice;
  if (videoDevice
    && (-[AVCaptureDevice isOverheadCameraModeSupported:](videoDevice, "isOverheadCameraModeSupported:", a3) & 1) != 0)
  {
    -[AVCaptureDevice lockForConfiguration:](self->_videoDevice, "lockForConfiguration:", 0);
    -[AVCaptureDevice setDeskViewCameraMode:](self->_videoDevice, "setDeskViewCameraMode:", a3);
    -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeskViewCameraMode:", a3);

    -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
  }
  else
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:].cold.1();

  }
}

- (void)setFormat:(id)a3
{
  id v4;
  NSObject *v5;
  AVCaptureDevice *videoDevice;
  NSObject *v7;
  int v8;
  CMContinuityCaptureRemoteVideoDevice *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ setFormat %{public}@", (uint8_t *)&v8, 0x16u);
  }

  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice lockForConfiguration:](videoDevice, "lockForConfiguration:", 0);
    -[AVCaptureDevice setActiveFormat:](self->_videoDevice, "setActiveFormat:", v4);
    -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
  }
  else
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();

  }
}

- (AVCaptureDeviceFormat)format
{
  return -[AVCaptureDevice activeFormat](self->_videoDevice, "activeFormat");
}

- (void)setVideoZoomFactor:(double)a3
{
  NSObject *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  AVCaptureDevice *videoDevice;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  AVCaptureDevice *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2048;
    v27 = a3;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ zoomFactor: %.2f", buf, 0x16u);
  }

  if (self->_videoDevice && !-[CMContinuityCaptureRemoteVideoDevice centerStageEnabled](self, "centerStageEnabled"))
  {
    -[AVCaptureDevice minAvailableVideoZoomFactor](self->_videoDevice, "minAvailableVideoZoomFactor");
    if (v6 <= a3)
    {
      -[AVCaptureDevice activeFormat](self->_videoDevice, "activeFormat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoMaxZoomFactor");
      v9 = v8;

      if (v9 >= a3)
      {
        videoDevice = self->_videoDevice;
        v23 = 0;
        v11 = -[AVCaptureDevice lockForConfiguration:](videoDevice, "lockForConfiguration:", &v23);
        v12 = v23;
        if (v11)
        {
          -[AVCaptureDevice setVideoZoomFactor:](self->_videoDevice, "setVideoZoomFactor:", a3);
          -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
          -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "streaming") & 1) != 0)
            {
              v16 = -[CMContinuityCaptureDeviceBase streaming](self, "streaming");

              if (!v16)
              {
                CMContinuityCaptureLog(2);
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                  -[CMContinuityCaptureRemoteVideoDevice setVideoZoomFactor:].cold.2();
LABEL_13:

                goto LABEL_19;
              }
            }
            else
            {

            }
          }
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v18 = objc_claimAutoreleasedReturnValue();
          -[NSObject setVideoZoomFactor:](v18, "setVideoZoomFactor:", a3);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = self->_videoDevice;
            *(_DWORD *)buf = 138543874;
            v25 = self;
            v26 = 2112;
            v27 = *(double *)&v19;
            v28 = 2112;
            v29 = v12;
            _os_log_error_impl(&dword_227C5D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
          }
        }

        -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
        goto LABEL_19;
      }
    }
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    -[AVCaptureDevice minAvailableVideoZoomFactor](self->_videoDevice, "minAvailableVideoZoomFactor");
    v21 = v20;
    -[AVCaptureDevice activeFormat](self->_videoDevice, "activeFormat");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject videoMaxZoomFactor](v17, "videoMaxZoomFactor");
    *(_DWORD *)buf = 138544130;
    v25 = self;
    v26 = 2048;
    v27 = a3;
    v28 = 2048;
    v29 = v21;
    v30 = 2048;
    v31 = v22;
    _os_log_error_impl(&dword_227C5D000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported zoom factor (%.2f). Supported range: [%.2f-%.2f]", buf, 0x2Au);
    goto LABEL_13;
  }
  CMContinuityCaptureLog(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CMContinuityCaptureRemoteVideoDevice setVideoZoomFactor:].cold.1();
LABEL_19:

}

- (double)videoZoomFactor
{
  double result;

  -[AVCaptureDevice videoZoomFactor](self->_videoDevice, "videoZoomFactor");
  return result;
}

- (unsigned)maxFrameRate
{
  void *v2;
  unsigned int v3;

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxFrameRate");

  return v3;
}

- (void)setMaxFrameRate:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  AVCaptureDevice **p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  AVCaptureDevice *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  AVCaptureDevice *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  AVCaptureDevice *v42;
  CMTime v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v50;
  __int16 v51;
  _BYTE v52[20];
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v3 = *(_QWORD *)&a3;
  v56 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_videoDevice = &self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "videoSupportedFrameRateRanges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v46;
        v15 = (double)v3;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v46 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v17, "minFrameRate");
            if (v18 <= v15)
            {
              objc_msgSend(v17, "maxFrameRate");
              if (v19 >= v15)
                v13 = 1;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v12);

        if ((v13 & 1) != 0)
          goto LABEL_25;
      }
      else
      {

      }
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "videoSupportedFrameRateRanges");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = self;
        v51 = 1024;
        *(_DWORD *)v52 = v3;
        *(_WORD *)&v52[4] = 2112;
        *(_QWORD *)&v52[6] = v41;
        _os_log_error_impl(&dword_227C5D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported max frame rate %u. Supported ranges: %@", buf, 0x1Cu);

      }
      -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "videoSupportedFrameRateRanges");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "videoSupportedFrameRateRanges");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "videoSupportedFrameRateRanges");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "maxFrameRate");
          v3 = v28;

        }
        else
        {
          v3 = 0;
        }

      }
      else
      {
        v3 = 0;
      }

LABEL_25:
      if ((_DWORD)v3)
      {
        v29 = *p_videoDevice;
        v44 = 0;
        v30 = -[AVCaptureDevice lockForConfiguration:](v29, "lockForConfiguration:", &v44);
        v31 = v44;
        if (v30)
        {
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setMaxFrameRate:", v3);

          v33 = *p_videoDevice;
          CMTimeMake(&v43, 1, v3);
          -[AVCaptureDevice setActiveVideoMinFrameDuration:](v33, "setActiveVideoMinFrameDuration:", &v43);
          CMContinuityCaptureLog(2);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "maxFrameRate");
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "minFrameRate");
            *(_DWORD *)buf = 138544386;
            v50 = self;
            v51 = 2080;
            *(_QWORD *)v52 = "-[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:]";
            *(_WORD *)&v52[8] = 1024;
            *(_DWORD *)&v52[10] = v3;
            *(_WORD *)&v52[14] = 1024;
            *(_DWORD *)&v52[16] = v36;
            v53 = 1024;
            v54 = v38;
            _os_log_impl(&dword_227C5D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Setting Device MaxFrameRate to %u. _activeConfiguration.maxFrameRate: %u _activeConfiguration.minFrameRate: %u", buf, 0x28u);

          }
          -[AVCaptureDevice unlockForConfiguration](*p_videoDevice, "unlockForConfiguration");
        }
        else
        {
          CMContinuityCaptureLog(2);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v42 = *p_videoDevice;
            *(_DWORD *)buf = 138543874;
            v50 = self;
            v51 = 2112;
            *(_QWORD *)v52 = v42;
            *(_WORD *)&v52[8] = 2112;
            *(_QWORD *)&v52[10] = v31;
            _os_log_error_impl(&dword_227C5D000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
          }

        }
        -[CMContinuityCaptureRemoteVideoDevice _updateControlStatus](self, "_updateControlStatus");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:].cold.3();
      }
      goto LABEL_34;
    }
    CMContinuityCaptureLog(2);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:].cold.2((uint64_t)self, (id *)&self->_videoDevice, v31);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }
LABEL_34:

}

- (unsigned)minFrameRate
{
  void *v2;
  unsigned int v3;

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minFrameRate");

  return v3;
}

- (void)setMinFrameRate:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  AVCaptureDevice **p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  AVCaptureDevice *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  AVCaptureDevice *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  AVCaptureDevice *v42;
  CMTime v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v50;
  __int16 v51;
  _BYTE v52[20];
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v3 = *(_QWORD *)&a3;
  v56 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_videoDevice = &self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "videoSupportedFrameRateRanges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v46;
        v15 = (double)v3;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v46 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v17, "minFrameRate");
            if (v18 <= v15)
            {
              objc_msgSend(v17, "maxFrameRate");
              if (v19 >= v15)
                v13 = 1;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v12);

        if ((v13 & 1) != 0)
          goto LABEL_25;
      }
      else
      {

      }
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "videoSupportedFrameRateRanges");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = self;
        v51 = 1024;
        *(_DWORD *)v52 = v3;
        *(_WORD *)&v52[4] = 2112;
        *(_QWORD *)&v52[6] = v41;
        _os_log_error_impl(&dword_227C5D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported min frame rate %u. Supported ranges: %@", buf, 0x1Cu);

      }
      -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "videoSupportedFrameRateRanges");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "videoSupportedFrameRateRanges");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          -[AVCaptureDevice activeFormat](*p_videoDevice, "activeFormat");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "videoSupportedFrameRateRanges");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "minFrameRate");
          v3 = v28;

        }
        else
        {
          v3 = 0;
        }

      }
      else
      {
        v3 = 0;
      }

LABEL_25:
      if ((_DWORD)v3)
      {
        v29 = *p_videoDevice;
        v44 = 0;
        v30 = -[AVCaptureDevice lockForConfiguration:](v29, "lockForConfiguration:", &v44);
        v31 = v44;
        if (v30)
        {
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setMinFrameRate:", v3);

          v33 = *p_videoDevice;
          CMTimeMake(&v43, 1, v3);
          -[AVCaptureDevice setActiveVideoMaxFrameDuration:](v33, "setActiveVideoMaxFrameDuration:", &v43);
          CMContinuityCaptureLog(2);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "maxFrameRate");
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "minFrameRate");
            *(_DWORD *)buf = 138544386;
            v50 = self;
            v51 = 2080;
            *(_QWORD *)v52 = "-[CMContinuityCaptureRemoteVideoDevice setMinFrameRate:]";
            *(_WORD *)&v52[8] = 1024;
            *(_DWORD *)&v52[10] = v3;
            *(_WORD *)&v52[14] = 1024;
            *(_DWORD *)&v52[16] = v36;
            v53 = 1024;
            v54 = v38;
            _os_log_impl(&dword_227C5D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Setting Device MinFrameRate to %u. _activeConfiguration.maxFrameRate: %u _activeConfiguration.minFrameRate: %u", buf, 0x28u);

          }
          -[AVCaptureDevice unlockForConfiguration](*p_videoDevice, "unlockForConfiguration");
        }
        else
        {
          CMContinuityCaptureLog(2);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v42 = *p_videoDevice;
            *(_DWORD *)buf = 138543874;
            v50 = self;
            v51 = 2112;
            *(_QWORD *)v52 = v42;
            *(_WORD *)&v52[8] = 2112;
            *(_QWORD *)&v52[10] = v31;
            _os_log_error_impl(&dword_227C5D000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
          }

        }
        -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:].cold.3();
      }
      goto LABEL_34;
    }
    CMContinuityCaptureLog(2);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:].cold.2((uint64_t)self, (id *)&self->_videoDevice, v31);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }
LABEL_34:

}

- (BOOL)centerStageEnabled
{
  return objc_msgSend(MEMORY[0x24BDB2460], "isCenterStageEnabled");
}

- (void)setCenterStageEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  AVCaptureDevice *videoDevice;
  void *v9;
  NSObject *v10;
  int v11;
  CMContinuityCaptureRemoteVideoDevice *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "No";
    if (v3)
      v7 = "Yes";
    v11 = 138543618;
    v12 = self;
    v13 = 2080;
    v14 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageEnabled: %s", (uint8_t *)&v11, 0x16u);
  }

  videoDevice = self->_videoDevice;
  if (!videoDevice)
  {
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
    goto LABEL_18;
  }
  -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
LABEL_18:

    return;
  }
  if (v3)
  {
    if (self->_manualFramingFeatureFlagEnabled)
      -[CMContinuityCaptureRemoteVideoDevice _disableManualFraming](self, "_disableManualFraming");
    -[CMContinuityCaptureRemoteVideoDevice _enableCenterStage](self, "_enableCenterStage");
  }
  else
  {
    -[CMContinuityCaptureRemoteVideoDevice _disableCenterStage](self, "_disableCenterStage");
    if (self->_manualFramingFeatureFlagEnabled)
      -[CMContinuityCaptureRemoteVideoDevice _enableManualFraming](self, "_enableManualFraming");
  }
}

- (void)_enableManualFraming
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v0, "videoDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v3, v4, "%{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_15();
}

- (void)_disableManualFraming
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v0, "videoDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v3, v4, "%{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_15();
}

- (void)_enableCenterStage
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v0, "videoDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v3, v4, "%{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_15();
}

- (void)_disableCenterStage
{
  NSObject *v3;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDB2460], "setCenterStageControlMode:", 1);
  objc_msgSend(MEMORY[0x24BDB2460], "setCenterStageEnabled:", 0);
  -[CMContinuityCaptureRemoteVideoDevice _updateControlStatus](self, "_updateControlStatus");
}

- (NSDictionary)centerStageRectOfInterest
{
  CFDictionaryRef v3;
  AVCaptureDevice *videoDevice;
  CFDictionaryRef DictionaryRepresentation;
  CGRect v7;

  v3 = &unk_24F07FDC8;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice centerStageRectOfInterest](videoDevice, "centerStageRectOfInterest");
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v7);

    v3 = DictionaryRepresentation;
  }
  return (NSDictionary *)v3;
}

- (void)setCenterStageRectOfInterest:(id)a3
{
  const __CFDictionary *v4;
  CGSize v5;
  NSObject *v6;
  AVCaptureDevice *videoDevice;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  AVCaptureDevice *v11;
  id v12;
  CGRect rect;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFDictionary *)a3;
  v5 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  rect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  rect.size = v5;
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ centerStageRectOfInterest: %@", buf, 0x16u);
  }

  if (self->_videoDevice
    && -[CMContinuityCaptureRemoteVideoDevice centerStageEnabled](self, "centerStageEnabled")
    && CGRectMakeWithDictionaryRepresentation(v4, &rect))
  {
    videoDevice = self->_videoDevice;
    v12 = 0;
    v8 = -[AVCaptureDevice lockForConfiguration:](videoDevice, "lockForConfiguration:", &v12);
    v9 = v12;
    if (v8)
    {
      -[AVCaptureDevice setCenterStageRectOfInterest:](self->_videoDevice, "setCenterStageRectOfInterest:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = self->_videoDevice;
        *(_DWORD *)buf = 138543874;
        v15 = self;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v9;
        _os_log_error_impl(&dword_227C5D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setCenterStageRectOfInterest:].cold.1();
  }

}

- (int64_t)centerStageFramingMode
{
  NSObject *v2;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(MEMORY[0x24BDB2460], "centerStageFramingMode");
}

- (void)setCenterStageFramingMode:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  CMContinuityCaptureRemoteVideoDevice *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDB2460], "setCenterStageFramingMode:", a3);
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 1024;
    v10 = a3;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ centerStageFramingMode: %d", (uint8_t *)&v7, 0x12u);
  }

}

- (BOOL)suppressVideoEffects
{
  void *v2;
  void *v3;
  char v4;

  -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suppressVideoEffects");

  return v4;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  id v19;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "No";
    if (v3)
      v7 = "Yes";
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2080;
    v23 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ SuppressVideoEffects: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *p_videoDevice;
      v19 = 0;
      v12 = objc_msgSend(v11, "lockForConfiguration:", &v19);
      v13 = v19;
      if (v12)
      {
        -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "captureSession");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSuppressVideoEffects:", v3);

        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSuppressVideoEffects:", v3);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v21 = self;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = v13;
          _os_log_error_impl(&dword_227C5D000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
      -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (BOOL)portraitEffect
{
  return objc_msgSend(MEMORY[0x24BDB2460], "isBackgroundBlurEnabled");
}

- (void)setPortraitEffect:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "No";
    if (v3)
      v7 = "Yes";
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2080;
    v22 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ PortraitEffect: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *p_videoDevice;
      v18 = 0;
      v12 = objc_msgSend(v11, "lockForConfiguration:", &v18);
      v13 = v18;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setBackgroundBlurControlMode:", 1);
        objc_msgSend(MEMORY[0x24BDB2460], "setBackgroundBlurEnabled:", v3);
        v14 = objc_msgSend(MEMORY[0x24BDB2460], "isBackgroundBlurEnabled");
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPortraitEffectEnabled:", v14);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v20 = self;
          v21 = 2112;
          v22 = v17;
          v23 = 2112;
          v24 = v13;
          _os_log_error_impl(&dword_227C5D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
      -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (float)portraitEffectAperture
{
  float result;

  objc_msgSend(MEMORY[0x24BDB2460], "backgroundBlurAperture");
  return result;
}

- (void)setPortraitEffectAperture:(float)a3
{
  NSObject *v5;
  NSObject *v6;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  double v13;
  void *v14;
  double v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ portraitEffectAperture: %f", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *p_videoDevice;
      v18 = 0;
      v11 = objc_msgSend(v10, "lockForConfiguration:", &v18);
      v12 = v18;
      if (v11)
      {
        *(float *)&v13 = a3;
        objc_msgSend(MEMORY[0x24BDB2460], "setBackgroundBlurAperture:", v13);
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v15 = a3;
        objc_msgSend(v14, "setPortraitEffectAperture:", v15);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v20 = self;
          v21 = 2112;
          v22 = *(double *)&v17;
          v23 = 2112;
          v24 = v12;
          _os_log_error_impl(&dword_227C5D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (BOOL)studioLighting
{
  return objc_msgSend(MEMORY[0x24BDB2460], "isStudioLightEnabled");
}

- (void)setStudioLighting:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "No";
    if (v3)
      v7 = "Yes";
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2080;
    v22 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ StudioLighting: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *p_videoDevice;
      v18 = 0;
      v12 = objc_msgSend(v11, "lockForConfiguration:", &v18);
      v13 = v18;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setStudioLightingEnabled:", v3);
        v14 = objc_msgSend(MEMORY[0x24BDB2460], "isStudioLightEnabled");
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setStudioLightingEnabled:", v14);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v20 = self;
          v21 = 2112;
          v22 = v17;
          v23 = 2112;
          v24 = v13;
          _os_log_error_impl(&dword_227C5D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
      -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (float)studioLightingIntensity
{
  float result;

  objc_msgSend(MEMORY[0x24BDB2460], "studioLightingIntensity");
  return result;
}

- (void)setStudioLightingIntensity:(float)a3
{
  NSObject *v5;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  double v12;
  void *v13;
  double v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *p_videoDevice;
      v17 = 0;
      v10 = objc_msgSend(v9, "lockForConfiguration:", &v17);
      v11 = v17;
      if (v10)
      {
        *(float *)&v12 = a3;
        objc_msgSend(MEMORY[0x24BDB2460], "setStudioLightingIntensity:", v12);
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v14 = a3;
        objc_msgSend(v13, "setStudioLightingIntensity:", v14);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v19 = self;
          v20 = 2112;
          v21 = v16;
          v22 = 2112;
          v23 = v11;
          _os_log_error_impl(&dword_227C5D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (BOOL)reactionEffects
{
  return objc_msgSend(MEMORY[0x24BDB2460], "reactionEffectsEnabled");
}

- (void)setReactionEffects:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "No";
    if (v3)
      v7 = "Yes";
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2080;
    v22 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionEffects: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *p_videoDevice;
      v18 = 0;
      v12 = objc_msgSend(v11, "lockForConfiguration:", &v18);
      v13 = v18;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setReactionEffectsEnabled:", v3);
        v14 = objc_msgSend(MEMORY[0x24BDB2460], "reactionEffectsEnabled");
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setReactionEffectsEnabled:", v14);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v20 = self;
          v21 = 2112;
          v22 = v17;
          v23 = 2112;
          v24 = v13;
          _os_log_error_impl(&dword_227C5D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
      -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (float)reactionEffectGesturesEnabled
{
  return (float)objc_msgSend(MEMORY[0x24BDB2460], "reactionEffectGesturesEnabled");
}

- (void)setReactionEffectGesturesEnabled:(float)a3
{
  NSObject *v5;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *p_videoDevice;
      v15 = 0;
      v10 = objc_msgSend(v9, "lockForConfiguration:", &v15);
      v11 = v15;
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setReactionEffectGesturesEnabled:", a3 != 0.0);
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setReactionEffectGesturesEnabled:", a3 != 0.0);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v17 = self;
          v18 = 2112;
          v19 = v14;
          v20 = 2112;
          v21 = v11;
          _os_log_error_impl(&dword_227C5D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (BOOL)backgroundReplacement
{
  return objc_msgSend(MEMORY[0x24BDB2460], "isBackgroundReplacementEnabled");
}

- (void)setBackgroundReplacement:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "No";
    if (v3)
      v7 = "Yes";
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2080;
    v22 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ BackgroundReplacement: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *p_videoDevice;
      v18 = 0;
      v12 = objc_msgSend(v11, "lockForConfiguration:", &v18);
      v13 = v18;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setBackgroundReplacementEnabled:", v3);
        v14 = objc_msgSend(MEMORY[0x24BDB2460], "isBackgroundReplacementEnabled");
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBackgroundReplacementEnabled:", v14);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v20 = self;
          v21 = 2112;
          v22 = v17;
          v23 = 2112;
          v24 = v13;
          _os_log_error_impl(&dword_227C5D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
      -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (__CVBuffer)backgroundReplacementPixelBuffer
{
  return (__CVBuffer *)objc_msgSend(MEMORY[0x24BDB2460], "backgroundReplacementPixelBuffer");
}

- (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  NSObject *v5;
  id *p_videoDevice;
  AVCaptureDevice *videoDevice;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    -[AVCaptureDevice activeFormat](videoDevice, "activeFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *p_videoDevice;
      v15 = 0;
      v10 = objc_msgSend(v9, "lockForConfiguration:", &v15);
      v11 = v15;
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDB2460], "setBackgroundReplacementPixelBuffer:", a3);
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundReplacementPixelBuffer:", a3);

        objc_msgSend(*p_videoDevice, "unlockForConfiguration");
      }
      else
      {
        CMContinuityCaptureLog(2);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          v17 = self;
          v18 = 2112;
          v19 = v14;
          v20 = 2112;
          v21 = v11;
          _os_log_error_impl(&dword_227C5D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }

      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:].cold.2();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:].cold.1();
  }

}

- (BOOL)isGazeSelectionEnabled
{
  return self->_gazeSelectionEnabled;
}

- (void)_configureVideoEffects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Configuration value for portraitEffectAperture is 0.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (id)_avfDeviceTypeForManualFramingDeviceType:(int64_t)a3
{
  id *v3;
  id v4;
  NSObject *v5;

  if (a3 == 2)
  {
    v3 = (id *)MEMORY[0x24BDB1A50];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = (id *)MEMORY[0x24BDB1A58];
LABEL_5:
    v4 = *v3;
    return v4;
  }
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CMContinuityCaptureRemoteVideoDevice _avfDeviceTypeForManualFramingDeviceType:].cold.1();

  v4 = 0;
  return v4;
}

- (BOOL)_isUltraWideCameraSupported
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = CMContinuityCaptureDevicePosition();
  v3 = (void *)MEMORY[0x24BDB2468];
  v8[0] = *MEMORY[0x24BDB1A50];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoverySessionWithDeviceTypes:mediaType:position:", v4, *MEMORY[0x24BDB1D50], v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v6, "count") != 0;

  return v2;
}

- (id)_selectVideoDeviceForConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CMContinuityCaptureRemoteVideoDevice _dockKitNotificationAgentIsTracking](self, "_dockKitNotificationAgentIsTracking"))
  {
    v29[0] = *MEMORY[0x24BDB1A58];
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = v29;
LABEL_3:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 1, v16, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "centerStageEnabled") & 1) != 0
    || objc_msgSend(v4, "isCenterStageForcefullyEnabled"))
  {
    if (self->_manualFramingFeatureFlagEnabled)
    {
      if (self->_isUltraWideCameraSupported)
      {
        if ((objc_msgSend(v4, "centerStageFieldOfViewRestrictedToWide") & 1) != 0)
        {
          v28 = *MEMORY[0x24BDB1A58];
          v5 = (void *)MEMORY[0x24BDBCE30];
          v6 = &v28;
        }
        else
        {
          v27 = *MEMORY[0x24BDB1A50];
          v5 = (void *)MEMORY[0x24BDBCE30];
          v6 = &v27;
        }
      }
      else
      {
        v26 = *MEMORY[0x24BDB1A58];
        v5 = (void *)MEMORY[0x24BDBCE30];
        v6 = &v26;
      }
    }
    else if (self->_isUltraWideCameraSupported)
    {
      v25 = *MEMORY[0x24BDB1A50];
      v5 = (void *)MEMORY[0x24BDBCE30];
      v6 = &v25;
    }
    else
    {
      v24 = *MEMORY[0x24BDB1A58];
      v5 = (void *)MEMORY[0x24BDBCE30];
      v6 = &v24;
    }
    goto LABEL_3;
  }
  if (!self->_manualFramingFeatureFlagEnabled)
  {
    v16 = *MEMORY[0x24BDB1A58];
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v16;
    goto LABEL_3;
  }
  if (!objc_msgSend(v4, "manualFramingDeviceType"))
  {
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2080;
      v21 = "-[CMContinuityCaptureRemoteVideoDevice _selectVideoDeviceForConfiguration:]";
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Host side doesn't support Manual Framing", buf, 0x16u);
    }

    v17 = *MEMORY[0x24BDB1A58];
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v17;
    goto LABEL_3;
  }
  -[CMContinuityCaptureRemoteVideoDevice _avfDeviceTypeForManualFramingDeviceType:](self, "_avfDeviceTypeForManualFramingDeviceType:", objc_msgSend(v4, "manualFramingDeviceType"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v23 = v12;
    v14 = &v23;
  }
  else
  {
    v22 = *MEMORY[0x24BDB1A58];
    v14 = &v22;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  objc_msgSend(MEMORY[0x24BDB2468], "discoverySessionWithDeviceTypes:mediaType:position:", v7, *MEMORY[0x24BDB1D50], CMContinuityCaptureDevicePosition());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)connectionsForConfiguration:(id)a3
{
  uint64_t v3;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  AVCaptureDevice *videoDevice;
  AVCaptureDeviceInput *v21;
  id v22;
  AVCaptureDeviceInput *videoDataInput;
  AVCaptureVideoDataOutput *v24;
  AVCaptureVideoDataOutput *videoDataOutput;
  AVCaptureVideoDataOutput *v26;
  void *v27;
  uint64_t v28;
  AVCaptureDeviceInput *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  AVCapturePhotoOutput *v38;
  AVCapturePhotoOutput *photoOutput;
  void *v40;
  char *v41;
  void *v42;
  void *v43;
  void *v44;
  AVCaptureMetadataOutput *v45;
  AVCaptureMetadataOutput *metadataOutput;
  AVCaptureDeviceInput *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSArray *v55;
  NSObject *p_super;
  NSArray *v57;
  char *v59;
  int v60;
  int v61;
  AVCaptureDeviceInput *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  _BYTE v78[10];
  char *v79;
  __int16 v80;
  _BOOL4 v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v74 = self;
    v75 = 2114;
    v76 = v5;
    v77 = 2112;
    *(_QWORD *)v78 = v8;
    *(_WORD *)&v78[8] = 1024;
    LODWORD(v79) = objc_msgSend(v9, "streaming");
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ connections for configuration %{public}@ companionDevice %@ streaming %d", buf, 0x26u);

  }
  -[CMContinuityCaptureRemoteVideoDevice _selectVideoDeviceForConfiguration:](self, "_selectVideoDeviceForConfiguration:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureRemoteVideoDevice setVideoDevice:](self, "setVideoDevice:", v10);

  CMContinuityCaptureLog(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CMContinuityCaptureRemoteVideoDevice isGazeSelectionEnabled](self, "isGazeSelectionEnabled");
    *(_DWORD *)buf = 138544386;
    v74 = self;
    v75 = 2080;
    v76 = "-[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:]";
    v77 = 2112;
    *(_QWORD *)v78 = v13;
    *(_WORD *)&v78[8] = 2112;
    v79 = v5;
    v80 = 1024;
    v81 = v14;
    _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Selected device %@ for configuration %@ with gazeSelectionEnabled %d", buf, 0x30u);

  }
  if (!self->_videoDevice)
  {
    LODWORD(v64) = 0;
    FigDebugAssert3();
    CMContinuityCaptureLog(2);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      -[AVCaptureDevice deviceType](self->_videoDevice, "deviceType", v64, v3);
      v59 = (char *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v5, "centerStageEnabled");
      v61 = objc_msgSend(v5, "isCenterStageForcefullyEnabled");
      *(_DWORD *)buf = 138544130;
      v74 = self;
      v75 = 2112;
      v76 = v59;
      v77 = 1024;
      *(_DWORD *)v78 = v60;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v61;
      _os_log_error_impl(&dword_227C5D000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ Could not find back camera with device type: %@, enableCenterStage: %d isCenterStageForcefullyEnabled: %d ", buf, 0x22u);

    }
    v55 = 0;
    v22 = 0;
    goto LABEL_29;
  }
  v15 = -[CMContinuityCaptureRemoteVideoDevice isGazeSelectionEnabled](self, "isGazeSelectionEnabled");
  -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGazeSelectionEnabled:", v15);

  -[AVCaptureDevice deviceType](self->_videoDevice, "deviceType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDB1A50]))
  {
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "streaming"))
    {

    }
    else
    {
      v19 = objc_msgSend(v5, "isCenterStageForcefullyEnabled");

      if (!v19)
        goto LABEL_12;
    }
    -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:](self, "setFaceDrivenAFActive:", 0);
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:](self, "setDeskViewCameraMode:", objc_msgSend(v17, "deskViewCameraMode"));
  }

LABEL_12:
  videoDevice = self->_videoDevice;
  v69 = 0;
  objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", videoDevice, &v69);
  v21 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
  v22 = v69;
  videoDataInput = self->_videoDataInput;
  self->_videoDataInput = v21;

  if (!self->_videoDataInput)
  {
    CMContinuityCaptureLog(2);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:].cold.1();
    v55 = 0;
LABEL_29:
    v67 = 0;
    v50 = 0;
    v36 = 0;
    v37 = v68;
    goto LABEL_21;
  }
  v66 = v22;
  v24 = (AVCaptureVideoDataOutput *)objc_alloc_init(MEMORY[0x24BDB2508]);
  videoDataOutput = self->_videoDataOutput;
  self->_videoDataOutput = v24;

  v26 = self->_videoDataOutput;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](v26, "setSampleBufferDelegate:queue:", self, v27);

  v28 = CMContinuityCaptureDevicePosition();
  v29 = self->_videoDataInput;
  v30 = *MEMORY[0x24BDB1D50];
  -[AVCaptureDevice deviceType](self->_videoDevice, "deviceType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](v29, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v30, v31, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = v32;
  if (objc_msgSend(v32, "count"))
  {
    v65 = v28;
    v33 = (void *)MEMORY[0x24BDB2448];
    objc_msgSend(v32, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "connectionWithInputPorts:output:", v35, self->_videoDataOutput);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setVideoDeviceOrientationCorrectionEnabled:", objc_msgSend(v36, "isVideoDeviceOrientationCorrectionSupported"));
    objc_storeStrong((id *)&self->_videoDataConnection, v36);
    v37 = v68;
    objc_msgSend(v68, "addObject:", v36);
    if (objc_msgSend(v5, "asyncStillCaptureEnabled"))
    {
      v38 = (AVCapturePhotoOutput *)objc_alloc_init(MEMORY[0x24BDB24C0]);
      photoOutput = self->_photoOutput;
      self->_photoOutput = v38;

      v40 = (void *)MEMORY[0x24BDB2448];
      objc_msgSend(v32, "firstObject");
      v41 = v5;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v42;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v68;
      objc_msgSend(v40, "connectionWithInputPorts:output:", v43, self->_photoOutput);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v41;
      objc_msgSend(v44, "setVideoDeviceOrientationCorrectionEnabled:", -[AVCaptureConnection isVideoDeviceOrientationCorrectionEnabled](self->_videoDataConnection, "isVideoDeviceOrientationCorrectionEnabled"));
      objc_msgSend(v68, "addObject:", v44);
      v36 = v44;
    }
    if ((objc_msgSend(v5, "faceDetectionEnabled") & 1) != 0
      || (objc_msgSend(v5, "humanBodyDetectionEnabled") & 1) != 0
      || objc_msgSend(v5, "humanFullBodyDetectionEnabled"))
    {
      v45 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x24BDB2498]);
      metadataOutput = self->_metadataOutput;
      self->_metadataOutput = v45;

      v47 = self->_videoDataInput;
      v48 = *MEMORY[0x24BDB1D18];
      -[AVCaptureDevice deviceType](self->_videoDevice, "deviceType");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](v47, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v48, v49, v65);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = (void *)MEMORY[0x24BDB2448];
      objc_msgSend(v50, "firstObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v52;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v68;
      objc_msgSend(v51, "connectionWithInputPorts:output:", v53, self->_metadataOutput);
      v54 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v68, "addObject:", v54);
      v36 = (void *)v54;
    }
    else
    {
      v50 = 0;
    }
    v22 = v66;
    -[CMContinuityCaptureRemoteVideoDevice _configureVideoEffects](self, "_configureVideoEffects");
    v55 = v37;
    p_super = &self->_connections->super;
    self->_connections = v55;
  }
  else
  {
    CMContinuityCaptureLog(2);
    p_super = objc_claimAutoreleasedReturnValue();
    v37 = v68;
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v62 = self->_videoDataInput;
      -[AVCaptureDevice deviceType](self->_videoDevice, "deviceType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v74 = self;
      v75 = 2112;
      v76 = (const char *)v62;
      v77 = 2112;
      *(_QWORD *)v78 = v63;
      _os_log_error_impl(&dword_227C5D000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get video input ports for input %@ and device type %@", buf, 0x20u);

    }
    v55 = 0;
    v50 = 0;
    v36 = 0;
  }
LABEL_21:

  v57 = v55;
  return v57;
}

- (unsigned)throttledMaxFrameRate
{
  void *v2;
  unsigned int v3;

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxFrameRate");

  return v3;
}

- (void)setMinFrameDurationOverrideIfApplicable
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  CMTime v27;
  CMTime v28;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CMContinuityCaptureDeviceBase streaming](self, "streaming");
    -[CMContinuityCaptureRemoteVideoDevice videoDataInput](self, "videoDataInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v30 = self;
    v31 = 2080;
    v32 = "-[CMContinuityCaptureRemoteVideoDevice setMinFrameDurationOverrideIfApplicable]";
    v33 = 1024;
    v34 = v4;
    v35 = 2112;
    v36 = v5;
    v37 = 2112;
    v38 = v6;
    v39 = 2114;
    v40 = v7;
    v41 = 1024;
    v42 = objc_msgSend(v8, "streaming");
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ streaming %s streaming %d %@ %@ companionDevice %{public}@ streaming %d", buf, 0x40u);

  }
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[CMContinuityCaptureRemoteVideoDevice videoDataInput](self, "videoDataInput");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = -[CMContinuityCaptureDeviceBase streaming](self, "streaming");

      if (!v14)
        return;
      -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deviceType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 == (void *)*MEMORY[0x24BDB1A58])
      {
        -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "streaming");

        if (v19)
        {
          CMContinuityCaptureLog(2);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = self;
            _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting videoMinFrameDurationOverride", buf, 0xCu);
          }

          -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "frameRateManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "allowedFrameRateRangeForDevice:", self);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "maxFrameRate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          CMTimeMake(&v28, 1, objc_msgSend(v23, "unsignedIntValue"));
          -[CMContinuityCaptureRemoteVideoDevice videoDataInput](self, "videoDataInput");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v28;
          objc_msgSend(v24, "setVideoMinFrameDurationOverride:", &v27);

          goto LABEL_13;
        }
      }
      else
      {

      }
      -[CMContinuityCaptureRemoteVideoDevice videoDataInput](self, "videoDataInput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BDC0D40];
      v26 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
      objc_msgSend(v11, "setVideoMinFrameDurationOverride:", &v25);
    }
LABEL_13:

  }
}

- (BOOL)configureConnections
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  AVCaptureVideoDataOutput *videoDataOutput;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  char v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  char v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  char v65;
  AVCaptureMetadataOutput *metadataOutput;
  void *v67;
  NSObject *v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BYTE buf[12];
  __int16 v86;
  _BYTE v87[10];
  void *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  int v92;
  __int16 v93;
  int v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  __int16 v101;
  int v102;
  __int16 v103;
  int v104;
  __int16 v105;
  int v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  int v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maxFrameRate");
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureRemoteVideoDevice compatibleDeviceFormatForMaxFrameRate:minFrameRate:](self, "compatibleDeviceFormatForMaxFrameRate:minFrameRate:", v6, objc_msgSend(v8, "minFrameRate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[AVCaptureDevice localizedName](self->_videoDevice, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v84, "maxFrameRate");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v83, "minFrameRate");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v82, "suppressVideoEffects");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v81, "portraitEffectEnabled");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v80, "centerStageEnabled");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v79, "studioLightingEnabled");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v78, "reactionEffectsEnabled");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v13, "backgroundReplacementEnabled");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isCenterStageForcefullyEnabled");
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "portraitEffectAperture");
      v18 = v17;
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "studioLightingIntensity");
      v21 = v20;
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138546946;
      *(_QWORD *)&buf[4] = self;
      v86 = 2112;
      *(_QWORD *)v87 = v12;
      *(_WORD *)&v87[8] = 2112;
      v88 = v9;
      v89 = 1024;
      v90 = v77;
      v91 = 1024;
      v92 = v76;
      v93 = 1024;
      v94 = v75;
      v95 = 1024;
      v96 = v74;
      v97 = 1024;
      v98 = v73;
      v99 = 1024;
      v100 = v72;
      v101 = 1024;
      v102 = v71;
      v103 = 1024;
      v104 = v70;
      v105 = 1024;
      v106 = v15;
      v107 = 2048;
      v108 = v18;
      v109 = 2048;
      v110 = v21;
      v111 = 1024;
      v112 = objc_msgSend(v22, "reactionEffectGesturesEnabled");
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting format for %@: %@ FR: %d MnFR: %d SVE %d PE %d CS %d SL %d RE %d BR %d FCS %d BBA: %f SLI: %f REG: %d", buf, 0x70u);

    }
    -[CMContinuityCaptureRemoteVideoDevice setFormat:](self, "setFormat:", v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.6();

    v23 = (void *)MEMORY[0x24BDBCE88];
    v24 = *MEMORY[0x24BDBCAB0];
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "raise:format:", v24, CFSTR("%@ ContinuityCapture error : Invalid format for configuration %@"), self, v25);

  }
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frameRateManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allowedFrameRateRangeForDevice:", self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "maxFrameRate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:](self, "setMaxFrameRate:", objc_msgSend(v29, "unsignedIntValue"));

  objc_msgSend(v28, "maxFrameRate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureRemoteVideoDevice setMinFrameRate:](self, "setMinFrameRate:", objc_msgSend(v30, "unsignedIntValue"));

  CMContinuityCaptureLog(2);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = -[CMContinuityCaptureRemoteVideoDevice maxFrameRate](self, "maxFrameRate");
    v33 = -[CMContinuityCaptureRemoteVideoDevice minFrameRate](self, "minFrameRate");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v86 = 1024;
    *(_DWORD *)v87 = v32;
    *(_WORD *)&v87[4] = 1024;
    *(_DWORD *)&v87[6] = v33;
    _os_log_impl(&dword_227C5D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting MFR %d MXFR %d", buf, 0x18u);
  }

  -[CMContinuityCaptureRemoteVideoDevice setMinFrameDurationOverrideIfApplicable](self, "setMinFrameDurationOverrideIfApplicable");
  if (-[CMContinuityCaptureRemoteVideoDevice _dockKitNotificationAgentIsTracking](self, "_dockKitNotificationAgentIsTracking"))
  {
    -[AVCaptureDevice lockForConfiguration:](self->_videoDevice, "lockForConfiguration:", 0);
    -[AVCaptureDevice setVideoZoomFactor:](self->_videoDevice, "setVideoZoomFactor:", 1.0);
    -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
  }
  else
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "videoZoomFactor");
    -[CMContinuityCaptureRemoteVideoDevice setVideoZoomFactor:](self, "setVideoZoomFactor:");

  }
  videoDataOutput = self->_videoDataOutput;
  if (videoDataOutput)
  {
    v36 = *MEMORY[0x24BDB1D50];
    -[AVCaptureVideoDataOutput connectionWithMediaType:](videoDataOutput, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37 && objc_msgSend(v37, "isVideoDeviceOrientationCorrectionSupported"))
    {
      objc_msgSend(v38, "setVideoMirrored:", 0);
    }
    else
    {
      CMContinuityCaptureLog(2);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.5();

    }
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "asyncStillCaptureEnabled");

    if (v41)
    {
      -[CMContinuityCaptureRemoteVideoDevice _updatePhotoOutputConfigs](self, "_updatePhotoOutputConfigs");
      -[AVCaptureDevice activeFormat](self->_videoDevice, "activeFormat");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "supportedMaxPhotoDimensions");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v44)
      {
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        -[AVCaptureDevice activeFormat](self->_videoDevice, "activeFormat");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "supportedMaxPhotoDimensions");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "getValue:", buf);

        -[AVCapturePhotoOutput setMaxPhotoDimensions:](self->_photoOutput, "setMaxPhotoDimensions:", *(_QWORD *)buf);
      }
      else
      {
        CMContinuityCaptureLog(2);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.4((uint64_t)self, (id *)&self->_videoDevice, v49);

      }
      -[AVCapturePhotoOutput setHighResolutionCaptureEnabled:](self->_photoOutput, "setHighResolutionCaptureEnabled:", 1);
      -[AVCapturePhotoOutput connectionWithMediaType:](self->_photoOutput, "connectionWithMediaType:", v36);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setVideoOrientation:", objc_msgSend(v38, "videoOrientation"));
      objc_msgSend(v48, "setVideoMirrored:", objc_msgSend(v38, "isVideoMirrored"));
    }
    else
    {
      v48 = 0;
    }
    if (self->_metadataOutput)
      v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    else
      v50 = 0;
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "faceDetectionEnabled");

    if (v52)
    {
      -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metadataOutput, "availableMetadataObjectTypes");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *MEMORY[0x24BDB1E98];
      v55 = objc_msgSend(v53, "containsObject:", *MEMORY[0x24BDB1E98]);

      if ((v55 & 1) == 0)
      {
        CMContinuityCaptureLog(2);
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.3();
        goto LABEL_51;
      }
      objc_msgSend(v50, "addObject:", v54);
    }
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "humanBodyDetectionEnabled");

    if (v57)
    {
      -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metadataOutput, "availableMetadataObjectTypes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *MEMORY[0x24BDB1EA0];
      v60 = objc_msgSend(v58, "containsObject:", *MEMORY[0x24BDB1EA0]);

      if ((v60 & 1) == 0)
      {
        CMContinuityCaptureLog(2);
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.2();
        goto LABEL_51;
      }
      objc_msgSend(v50, "addObject:", v59);
    }
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "humanFullBodyDetectionEnabled");

    if (!v62)
    {
LABEL_40:
      metadataOutput = self->_metadataOutput;
      if (metadataOutput)
      {
        -[AVCaptureMetadataOutput setMetadataObjectTypes:](metadataOutput, "setMetadataObjectTypes:", v50);
        metadataOutput = self->_metadataOutput;
      }
      -[AVCaptureMetadataOutput connectionWithMediaType:](metadataOutput, "connectionWithMediaType:", *MEMORY[0x24BDB1D18]);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setEnabled:", 0);

      -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
      goto LABEL_43;
    }
    -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metadataOutput, "availableMetadataObjectTypes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x24BDB1EA8];
    v65 = objc_msgSend(v63, "containsObject:", *MEMORY[0x24BDB1EA8]);

    if ((v65 & 1) != 0)
    {
      objc_msgSend(v50, "addObject:", v64);
      goto LABEL_40;
    }
    CMContinuityCaptureLog(2);
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.1();
LABEL_51:

LABEL_43:
  }

  return 1;
}

- (id)compatibleDeviceFormatForMaxFrameRate:(unsigned int)a3 minFrameRate:(unsigned int)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  unsigned int v13;
  unsigned int v14;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__CMContinuityCaptureRemoteVideoDevice_compatibleDeviceFormatForMaxFrameRate_minFrameRate___block_invoke;
  v12[3] = &unk_24F06BF38;
  v12[4] = self;
  v13 = a4;
  v14 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[AVCaptureDevice formats](self->_videoDevice, "formats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithArray:", v8);

  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_5);
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __91__CMContinuityCaptureRemoteVideoDevice_compatibleDeviceFormatForMaxFrameRate_minFrameRate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "activeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "captureSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "_deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:", v4, v5, objc_msgSend(v6, "isMulticamSession"), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));

  return v7;
}

uint64_t __91__CMContinuityCaptureRemoteVideoDevice_compatibleDeviceFormatForMaxFrameRate_minFrameRate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isVideoHDRSupported") && !objc_msgSend(v5, "isVideoHDRSupported"))
    goto LABEL_7;
  if ((objc_msgSend(v4, "isVideoHDRSupported") & 1) == 0 && (objc_msgSend(v5, "isVideoHDRSupported") & 1) != 0)
  {
LABEL_11:
    v6 = 1;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isVideoBinned") & 1) != 0 || (objc_msgSend(v5, "isVideoBinned") & 1) == 0)
  {
    if (!objc_msgSend(v4, "isVideoBinned") || objc_msgSend(v5, "isVideoBinned"))
    {
      v6 = 0;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_7:
  v6 = -1;
LABEL_12:

  return v6;
}

- (BOOL)_deviceFormat:(id)a3 isCompatibleWithConfiguration:(id)a4 requiringMultiCamSupport:(BOOL)a5 minFrameRate:(unsigned int)a6 maxFrameRate:(unsigned int)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t Dimensions;
  void *v15;
  void *v16;
  uint64_t v17;
  FourCharCode MediaSubType;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;

  v8 = a5;
  v11 = a3;
  v12 = a4;
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CMContinuityCaptureRemoteVideoDevice _deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:].cold.1((uint64_t)self, v11, v13);

  }
  Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v11, "formatDescription"));
  objc_msgSend(v12, "format");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "width") == (int)Dimensions)
  {
    objc_msgSend(v12, "format");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "height");

    if (v17 == Dimensions >> 32)
    {
      MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v11, "formatDescription"));
      objc_msgSend(v12, "format");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "pixelFormat");

      if (MediaSubType == v20)
      {
        objc_msgSend(v11, "videoSupportedFrameRateRanges");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "maxFrameRate");
        v24 = v23;

        if (v24 >= (double)a7
          && ((objc_msgSend(v12, "centerStageEnabled") & 1) == 0
           && (!objc_msgSend(v12, "isCenterStageForcefullyEnabled")
            || -[CMContinuityCaptureDeviceBase entity](self, "entity") == 2)
           || objc_msgSend(v11, "isCenterStageSupported"))
          && (!objc_msgSend(v12, "manualFramingDeviceType")
           || objc_msgSend(v11, "isManualFramingSupported"))
          && (!objc_msgSend(v12, "studioLightingEnabled")
           || objc_msgSend(v11, "isStudioLightSupported"))
          && (!objc_msgSend(v12, "reactionEffectsEnabled")
           || objc_msgSend(v11, "reactionEffectsSupported"))
          && (!objc_msgSend(v12, "backgroundReplacementEnabled")
           || objc_msgSend(v11, "isBackgroundReplacementSupported"))
          && (!v8 || objc_msgSend(v11, "isMultiCamSupported")))
        {
          v25 = 1;
          goto LABEL_14;
        }
      }
    }
  }
  else
  {

  }
  v25 = 0;
LABEL_14:

  return v25;
}

- (BOOL)_companionConnectionsRequired
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 manualFramingFeatureFlagEnabled;
  void *v7;
  int v8;
  char v9;
  void *v10;
  int v11;
  char v12;
  void *v13;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "streaming") & 1) != 0)
  {
    v9 = 0;
    goto LABEL_16;
  }
  manualFramingFeatureFlagEnabled = self->_manualFramingFeatureFlagEnabled;
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "centerStageEnabled");
  if (!manualFramingFeatureFlagEnabled)
  {
    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "isCenterStageForcefullyEnabled");

    }
    goto LABEL_15;
  }
  if (v8)
  {

LABEL_9:
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "centerStageFieldOfViewRestrictedToWide");
    goto LABEL_10;
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCenterStageForcefullyEnabled");

  if (v11)
    goto LABEL_9;
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "manualFramingDeviceType") != 2)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v12 = -[CMContinuityCaptureRemoteVideoDevice _dockKitNotificationAgentIsTracking](self, "_dockKitNotificationAgentIsTracking");
LABEL_10:
  v9 = v12 ^ 1;
LABEL_15:

LABEL_16:
  return v9;
}

- (void)_toggleBetweenCenterStageAndManualFraming
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  const char *v21;
  float v22;
  double v23;
  float v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_manualFramingFeatureFlagEnabled)
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0);

    return;
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "manualFramingDeviceType") == 1)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "centerStageFieldOfViewRestrictedToWide");

  }
  else
  {
    v6 = 0;
  }

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "manualFramingDeviceType") == 2)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "centerStageFieldOfViewRestrictedToWide") ^ 1;

  }
  else
  {
    v9 = 0;
  }

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "centerStageEnabled") & 1) != 0)
  {

    if (((v6 | v9) & 1) != 0)
    {
      -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "willConfigure");

      goto LABEL_14;
    }
    goto LABEL_19;
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCenterStageForcefullyEnabled");

  if (((v6 | v9) & 1) != 0)
  {
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willConfigure");

    if ((v13 & 1) == 0)
    {
      -[CMContinuityCaptureRemoteVideoDevice _disableCenterStage](self, "_disableCenterStage");
      if (self->_manualFramingFeatureFlagEnabled)
        -[CMContinuityCaptureRemoteVideoDevice _enableManualFraming](self, "_enableManualFraming");
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureDevice manualFramingPanningAngleX](self->_videoDevice, "manualFramingPanningAngleX");
      v23 = v22;
      -[AVCaptureDevice manualFramingPanningAngleY](self->_videoDevice, "manualFramingPanningAngleY");
      v25 = v24;
      -[CMContinuityCaptureRemoteVideoDevice videoZoomFactor](self, "videoZoomFactor");
      *(_DWORD *)buf = 138544386;
      v32 = self;
      v33 = 2112;
      v34 = v17;
      v35 = 2048;
      v36 = v23;
      v37 = 2048;
      v38 = v25;
      v39 = 2048;
      v40 = v26;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition from Center Stage to Manual Framing (both on %@). Setting panning angle x: %f, y: %f, zoom factor %f", buf, 0x34u);
      goto LABEL_25;
    }
LABEL_14:
    if (self->_manualFramingFeatureFlagEnabled)
      -[CMContinuityCaptureRemoteVideoDevice _disableManualFraming](self, "_disableManualFraming");
    -[CMContinuityCaptureRemoteVideoDevice _enableCenterStage](self, "_enableCenterStage");
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    -[CMContinuityCaptureRemoteVideoDevice videoDevice](self, "videoDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice centerStageRectOfInterest](self, "centerStageRectOfInterest");
    v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[CMContinuityCaptureRemoteVideoDevice videoZoomFactor](self, "videoZoomFactor");
    *(_DWORD *)buf = 138544130;
    v32 = self;
    v33 = 2112;
    v34 = v17;
    v35 = 2112;
    v36 = v18;
    v37 = 2048;
    v38 = v19;
    _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition from Manual Framing to Center Stage (both on %@). Setting CS RoI %@, zoom factor to %f", buf, 0x2Au);

LABEL_25:
LABEL_26:

    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "didConfigure");

    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "start");

    return;
  }
  if (v13)
  {
LABEL_19:
    CMContinuityCaptureLog(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "Transition from Manual Framing to Center Stage on a different camera. Rebuilding the camera stack.";
LABEL_29:
      _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  CMContinuityCaptureLog(2);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v21 = "Transition from Center Stage to Manual Framing on a different camera. Rebuilding the camera stack.";
    goto LABEL_29;
  }
LABEL_30:

  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0);

}

- (void)_updateManualFramingDeviceType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  CMContinuityCaptureRemoteVideoDevice *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setManualFramingDeviceType:", a3);

  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2080;
    v15 = "-[CMContinuityCaptureRemoteVideoDevice _updateManualFramingDeviceType:]";
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Resetting Manual Framing states due to device type change", (uint8_t *)&v12, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPanningAngleX:", 0.0);

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPanningAngleY:", 0.0);

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVideoZoomFactor:", 1.0);

  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0);

}

- (BOOL)startCameraCaptureStack:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSUUID *v10;
  NSUUID *cameraCaptureStreamSessionID;
  NSObject *v12;
  unint64_t v13;
  NSUUID *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  BOOL v43;
  NSObject *v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v53;
  __int16 v54;
  CMContinuityCaptureRemoteVideoDevice *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  NSUUID *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if (self->_dockedTrackingSupported)
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controlWithName:", CFSTR("kCMContinuityCaptureControlDockedTrackingActive"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CMContinuityCaptureRemoteVideoDevice _dockKitNotificationAgentIsTracking](self, "_dockKitNotificationAgentIsTracking"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:", v7);

      -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValueForControl:completion:", v6, 0);

    }
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_captureStackActive || -[CMContinuityCaptureDeviceBase invalidated](self, "invalidated"))
    goto LABEL_41;
  self->_videoBufferDropCounter = 0;
  v10 = (NSUUID *)objc_opt_new();
  cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
  self->_cameraCaptureStreamSessionID = v10;

  CMContinuityCaptureLog(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v14 = self->_cameraCaptureStreamSessionID;
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v53 = self;
    v54 = 2048;
    v55 = (CMContinuityCaptureRemoteVideoDevice *)v13;
    v56 = 2080;
    v57 = "-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
    v58 = 1024;
    v59 = a3;
    v60 = 2114;
    v61 = v14;
    v62 = 2114;
    v63 = v15;
    _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option:%d streamSessionID:%{public}@ configuration:%{public}@", buf, 0x3Au);

  }
  +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor](CMContinuityCaptureMSNExceptionMonitor, "sharedMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "incrementExceptionCountForEntity:", objc_msgSend(v17, "entity"));

  -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "willConfigure");

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v19, "isCenterStageForcefullyEnabled");

  if ((_DWORD)v17)
    -[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide](self, "_forcefullyEnableCenterStageOnSuperWide");
  -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hasConnectionsForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

  if ((v21 & 1) == 0)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:](self, "connectionsForConfiguration:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v23);

    CMContinuityCaptureLog(2);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      v54 = 2114;
      v55 = self;
      _os_log_impl(&dword_227C5D000, v24, OS_LOG_TYPE_DEFAULT, "%s Self %{public}@ connections added to capture session", buf, 0x16u);
    }

    if (!objc_msgSend(v9, "count"))
    {
      CMContinuityCaptureLog(2);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      goto LABEL_40;
    }
  }
  if (-[CMContinuityCaptureRemoteVideoDevice _companionConnectionsRequired](self, "_companionConnectionsRequired"))
  {
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "connectionsForConfiguration:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v27);

    CMContinuityCaptureLog(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      v54 = 2114;
      v55 = self;
      _os_log_impl(&dword_227C5D000, v28, OS_LOG_TYPE_DEFAULT, "%s Companion connections added to capture session by %{public}@", buf, 0x16u);
    }

    if (!objc_msgSend(v9, "count"))
    {
      CMContinuityCaptureLog(2);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
LABEL_39:
        -[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:].cold.1();
LABEL_40:

LABEL_41:
      v43 = 0;
      goto LABEL_35;
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v29 = objc_claimAutoreleasedReturnValue();
    -[NSObject addConnections:](v29, "addConnections:", v9);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      v54 = 2114;
      v55 = self;
      _os_log_impl(&dword_227C5D000, v29, OS_LOG_TYPE_DEFAULT, "%s No new connections added to capture session by %{public}@", buf, 0x16u);
    }
  }

  -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](self, "videoDataConnection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEnabled");

  if ((v31 & 1) == 0)
  {
    -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](self, "videoDataConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEnabled:", 1);

    CMContinuityCaptureLog(2);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      v54 = 2114;
      v55 = self;
      _os_log_impl(&dword_227C5D000, v33, OS_LOG_TYPE_DEFAULT, "%s Enabled video data connection for %{public}@", buf, 0x16u);
    }

  }
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frameRateManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reportStreamStatus:forDevice:", 1, self);

  -[CMContinuityCaptureRemoteVideoDevice configureConnections](self, "configureConnections");
  -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "didConfigure");

  -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "start");

  -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
  self->_captureStackActive = 1;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[NSMutableDictionary allValues](self->_cmControlByNameWithPendingUpdates, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v38);
        -[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:](self, "setValueForControl:completion:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), &__block_literal_global_38);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v40);
  }

  v46.receiver = self;
  v46.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  v43 = -[CMContinuityCaptureDeviceBase startCameraCaptureStack:](&v46, sel_startCameraCaptureStack_, a3);
LABEL_35:

  return v43;
}

- (void)tearDownConnectionsWithVideoDataConnectionDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  AVCapturePhotoOutput *photoOutput;
  AVCaptureMetadataOutput *metadataOutput;
  AVCaptureDeviceInput *videoDataInput;
  AVCaptureVideoDataOutput *videoDataOutput;
  AVCaptureConnection *videoDataConnection;
  NSArray *connections;
  int v12;
  CMContinuityCaptureRemoteVideoDevice *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ tearDownConnectionsWithVideoDataConnectionDisabled %d", (uint8_t *)&v12, 0x12u);
  }

  if (!v3)
  {
    photoOutput = self->_photoOutput;
    self->_photoOutput = 0;

    metadataOutput = self->_metadataOutput;
    self->_metadataOutput = 0;

    videoDataInput = self->_videoDataInput;
    self->_videoDataInput = 0;

    videoDataOutput = self->_videoDataOutput;
    self->_videoDataOutput = 0;

    videoDataConnection = self->_videoDataConnection;
    self->_videoDataConnection = 0;

    connections = self->_connections;
    self->_connections = 0;

    -[CMContinuityCaptureRemoteVideoDevice setVideoDevice:](self, "setVideoDevice:", 0);
  }
}

- (BOOL)_shouldOnlyDisableVideoConnection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "centerStageEnabled") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isCenterStageForcefullyEnabled");

  }
  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "streaming");

  if (v7)
  {
    if (self->_manualFramingFeatureFlagEnabled)
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v4)
        v4 = objc_msgSend(v8, "centerStageFieldOfViewRestrictedToWide") ^ 1;
      else
        v4 = objc_msgSend(v8, "manualFramingDeviceType") == 2;

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_stopCameraCaptureStackRemoveCaptureSessionConnectionsWithOption:(unint64_t)a3
{
  _BOOL8 v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMContinuityCaptureRemoteVideoDevice *v23;
  int v24;
  CMContinuityCaptureRemoteVideoDevice *v25;
  __int16 v26;
  CMContinuityCaptureRemoteVideoDevice *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (a3 & 0x600) == 0
    && -[CMContinuityCaptureRemoteVideoDevice _shouldOnlyDisableVideoConnection](self, "_shouldOnlyDisableVideoConnection");
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCenterStageForcefullyEnabled");

  if (v6)
  {
    -[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:](self, "_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:", 1);
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:", 1);

  }
  if (v4)
  {
    -[CMContinuityCaptureRemoteVideoDevice videoDataConnection](self, "videoDataConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v24 = 138543618;
    v25 = self;
    v26 = 1024;
    LODWORD(v27) = 1;
    v10 = "Self %{public}@ video connection disabled %d";
  }
  else
  {
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeConnections:", v12);

    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v24 = 138543618;
    v25 = self;
    v26 = 1024;
    LODWORD(v27) = 0;
    v10 = "Self %{public}@ connections removed, disableVideoDataConnection %d";
  }
  _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 0x12u);
LABEL_12:

  -[CMContinuityCaptureRemoteVideoDevice tearDownConnectionsWithVideoDataConnectionDisabled:](self, "tearDownConnectionsWithVideoDataConnectionDisabled:", v4);
  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    return;
  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v14 = objc_claimAutoreleasedReturnValue();
  -[NSObject connections](v14, "connections");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "streaming");

    if ((v18 & 1) != 0)
      return;
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "connections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeConnections:", v21);

    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tearDownConnectionsWithVideoDataConnectionDisabled:", 0);

    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
      v23 = (CMContinuityCaptureRemoteVideoDevice *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v23;
      v26 = 2114;
      v27 = self;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "Companion %{public}@ connections removed by %{public}@", (uint8_t *)&v24, 0x16u);

    }
  }

}

- (void)_forcefullyEnableCenterStageOnSuperWide
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int v17;
  CMContinuityCaptureRemoteVideoDevice *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[CMContinuityCaptureRemoteVideoDevice isDockedTrackingEnabled](self, "isDockedTrackingEnabled");
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "Docked tracking is enabled, do not forcefully enable Center Stage as requested", (uint8_t *)&v17, 2u);
    }
    goto LABEL_15;
  }
  if (v5)
  {
    v17 = 138543618;
    v18 = self;
    v19 = 2080;
    v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Forcefully enable Center Stage on the default video camera as requested", (uint8_t *)&v17, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "forcefulCenterStageEnablementType");
  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForcefulCenterStageEnablementType:", v7);

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "forcefulCenterStageEnablementType");

  if (v11 == 2)
  {
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543618;
      v18 = self;
      v19 = 2080;
      v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      v16 = "%{public}@ %s [forceful CS enablement] Already running Center Stage on the wide, switching to the super wide";
      goto LABEL_13;
    }
LABEL_14:

    -[CMContinuityCaptureRemoteVideoDevice setShouldRestoreCenterStageOnWideCamera:](self, "setShouldRestoreCenterStageOnWideCamera:", 1);
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setCenterStageFieldOfViewRestrictedToWide:](v4, "setCenterStageFieldOfViewRestrictedToWide:", 0);
LABEL_15:

    return;
  }
  if (v11 == 1)
  {
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543618;
      v18 = self;
      v19 = 2080;
      v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching from Manual Framing to Center Stage", (uint8_t *)&v17, 0x16u);
    }

    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "centerStageFieldOfViewRestrictedToWide");

    if (v14)
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543618;
        v18 = self;
        v19 = 2080;
        v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        v16 = "%{public}@ %s [forceful CS enablement] Switching to the super wide";
LABEL_13:
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v17, 0x16u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
}

- (void)_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  CMContinuityCaptureRemoteVideoDevice *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCenterStageForcefullyEnabled");

  if (!v6)
    return;
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543618;
    v30 = self;
    v31 = 2080;
    v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Restoring states while exiting forcefully enabled Center Stage on super wide", (uint8_t *)&v29, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "forcefulCenterStageEnablementType");

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setForcefulCenterStageEnablementType:", 0);

  if (v9 == 1)
  {
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138543618;
      v30 = self;
      v31 = 2080;
      v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
      _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching back to Manual Framing", (uint8_t *)&v29, 0x16u);
    }

    if (v3)
      -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:](self, "setCenterStageEnabled:", 0);
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCenterStageEnabled:", 0);

    if (-[CMContinuityCaptureRemoteVideoDevice shouldRestoreCenterStageOnWideCamera](self, "shouldRestoreCenterStageOnWideCamera"))
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCenterStageFieldOfViewRestrictedToWide:", 1);

      -[CMContinuityCaptureRemoteVideoDevice setShouldRestoreCenterStageOnWideCamera:](self, "setShouldRestoreCenterStageOnWideCamera:", 0);
    }
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "manualFramingDeviceType");

    if (v22 == 1 && v3)
    {
      CMContinuityCaptureLog(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138543618;
        v30 = self;
        v31 = 2080;
        v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
        _os_log_impl(&dword_227C5D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Manual Framing is set on the back wide, rebuild connections in order to switch from the super wide to the wide", (uint8_t *)&v29, 0x16u);
      }

      -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeConnections:", v25);

      -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:](self, "connectionsForConfiguration:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addConnections:", v28);

    }
LABEL_21:
    if (!v3)
      return;
    goto LABEL_22;
  }
  if (v9 != 2)
    goto LABEL_21;
  CMContinuityCaptureLog(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543618;
    v30 = self;
    v31 = 2080;
    v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
    _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching back to running Center Stage on the back wide", (uint8_t *)&v29, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenterStageFieldOfViewRestrictedToWide:", 1);

  -[CMContinuityCaptureRemoteVideoDevice setShouldRestoreCenterStageOnWideCamera:](self, "setShouldRestoreCenterStageOnWideCamera:", 0);
  if (v3)
  {
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeConnections:", v14);

    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:](self, "connectionsForConfiguration:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addConnections:", v17);

LABEL_22:
    -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");
  }
}

- (BOOL)stopCameraCaptureStack:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  NSUUID *cameraCaptureStreamSessionID;
  unint64_t videoBufferDropCounter;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  int v29;
  CMContinuityCaptureRemoteVideoDevice *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138544130;
    v30 = self;
    v31 = 2048;
    v32 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v33 = 2080;
    v34 = "-[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:]";
    v35 = 2048;
    v36 = a3;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option: %lu", (uint8_t *)&v29, 0x2Au);
  }

  if (self->_captureStackActive)
  {
    if ((a3 & 0x10) != 0)
    {
      CMContinuityCaptureLog(2);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138543618;
        v30 = self;
        v31 = 2080;
        v32 = "-[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:]";
        _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ %s skip anticipating reconnect", (uint8_t *)&v29, 0x16u);
      }
      goto LABEL_22;
    }
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frameRateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportStreamStatus:forDevice:", 0, self);

    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "willConfigure");

    if (-[CMContinuityCaptureRemoteVideoDevice isDockedTrackingEnabled](self, "isDockedTrackingEnabled"))
      -[CMContinuityCaptureRemoteVideoDevice setDockedTrackingEnabled:](self, "setDockedTrackingEnabled:", 0);
    -[CMContinuityCaptureRemoteVideoDevice _stopCameraCaptureStackRemoveCaptureSessionConnectionsWithOption:](self, "_stopCameraCaptureStackRemoveCaptureSessionConnectionsWithOption:", a3);
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didConfigure");

    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stop");

    self->_captureStackActive = 0;
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
      cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
      videoBufferDropCounter = self->_videoBufferDropCounter;
      v29 = 138544130;
      v30 = self;
      v31 = 2048;
      v32 = (const char *)v13;
      v33 = 2114;
      v34 = (const char *)cameraCaptureStreamSessionID;
      v35 = 2048;
      v36 = videoBufferDropCounter;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] #of frame drops for streamSessionID:%{public}@: %lld", (uint8_t *)&v29, 0x2Au);
    }

    if ((a3 & 0x400) != 0)
      self->_propagateCaptureSessionRestartedAttachment = 1;
  }
  if ((a3 & 0x200) != 0)
  {
    -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasConnectionsForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

    if (v17)
    {
      -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stopCameraCaptureStack:", 0);

      }
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138543618;
        v30 = self;
        v31 = 2080;
        v32 = "-[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:]";
        _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ received terminate connections %s", (uint8_t *)&v29, 0x16u);
      }

      -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureRemoteVideoDevice connections](self, "connections");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeConnections:", v22);

      -[CMContinuityCaptureRemoteVideoDevice tearDownConnectionsWithVideoDataConnectionDisabled:](self, "tearDownConnectionsWithVideoDataConnectionDisabled:", 0);
    }
  }
  +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor](CMContinuityCaptureMSNExceptionMonitor, "sharedMonitor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "decrementExceptionCountForEntity:", objc_msgSend(v24, "entity"));

  -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "entity");

  if (v26 == 1)
  {
    -[CMContinuityCaptureRemoteVideoDevice companionDevice](self, "companionDevice");
    v27 = objc_claimAutoreleasedReturnValue();
    -[NSObject setMinFrameDurationOverrideIfApplicable](v27, "setMinFrameDurationOverrideIfApplicable");
LABEL_22:

  }
  return 1;
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  -[CMContinuityCaptureDeviceBase invalidate](&v2, sel_invalidate);
  +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", 0);
}

- (void)addVideoDeviceKVOs
{
  AVCaptureDevice *videoDevice;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AVCaptureDevice *v8;
  int v9;
  CMContinuityCaptureRemoteVideoDevice *v10;
  __int16 v11;
  AVCaptureDevice *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  videoDevice = self->_videoDevice;
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureDevice addObserver:forKeyPath:options:context:](videoDevice, "addObserver:forKeyPath:options:context:", v4, CFSTR("systemPressureState"), 3, 0);

  -[AVCaptureDevice addObserver:forKeyPath:options:context:](self->_videoDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("activeVideoMinFrameDuration"), 3, 0);
  -[AVCaptureDevice addObserver:forKeyPath:options:context:](self->_videoDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("activeVideoMaxFrameDuration"), 3, 0);
  -[AVCaptureDevice addObserver:forKeyPath:options:context:](self->_videoDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("reactionEffectsInProgress"), 3, 0);
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameRateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("throttled"), 3, 0);

  self->_videoDeviceKVOsActive = 1;
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_videoDevice;
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ KVOs are active on %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)removeVideoDeviceKVOs
{
  AVCaptureDevice *videoDevice;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AVCaptureDevice *v8;
  const char *v9;
  AVCaptureDevice *v10;
  int v11;
  CMContinuityCaptureRemoteVideoDevice *v12;
  __int16 v13;
  AVCaptureDevice *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_videoDeviceKVOsActive)
  {
    videoDevice = self->_videoDevice;
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDevice removeObserver:forKeyPath:context:](videoDevice, "removeObserver:forKeyPath:context:", v4, CFSTR("systemPressureState"), 0);

    -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_videoDevice, "removeObserver:forKeyPath:context:", self, CFSTR("activeVideoMinFrameDuration"), 0);
    -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_videoDevice, "removeObserver:forKeyPath:context:", self, CFSTR("activeVideoMaxFrameDuration"), 0);
    -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_videoDevice, "removeObserver:forKeyPath:context:", self, CFSTR("reactionEffectsInProgress"), 0);
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frameRateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("throttled"), 0);

    self->_videoDeviceKVOsActive = 0;
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_videoDevice;
      v11 = 138543618;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      v9 = "%{public}@ KVOs removed on %@{public}@";
LABEL_6:
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_videoDevice;
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v10;
      v9 = "%{public}@ KVOs for _videoDevice %{public}@ are inactive";
      goto LABEL_6;
    }
  }

}

- (void)didStartStreamInput:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  CMContinuityCaptureRemoteVideoDevice *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138544130;
    v8 = self;
    v9 = 2048;
    v10 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v11 = 2080;
    v12 = "-[CMContinuityCaptureRemoteVideoDevice didStartStreamInput:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCInput setup complete %s %@", (uint8_t *)&v7, 0x2Au);
  }

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  self->_avcStreamInputActive = 1;
}

- (void)didStopStreamInput:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  CMContinuityCaptureRemoteVideoDevice *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureRemoteVideoDevice didStopStreamInput:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_avcStreamInputActive = 0;
}

- (void)serverDidDie
{
  NSObject *v3;
  int v4;
  CMContinuityCaptureRemoteVideoDevice *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2080;
    v7 = "-[CMContinuityCaptureRemoteVideoDevice serverDidDie]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v4, 0x16u);
  }

}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  CMContinuityCaptureRemoteVideoDevice *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543874;
    v9 = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureRemoteVideoDevice stream:didStart:error:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)streamDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  _BYTE buf[12];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureRemoteVideoDevice streamDidStop:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureRemoteVideoDevice_streamDidStop___block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

void __54__CMContinuityCaptureRemoteVideoDevice_streamDidStop___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[41];
    v6 = v2;
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)v6[41];
      v6[41] = 0;

      v2 = v6;
    }
    v5 = (void *)v2[31];
    v2[31] = 0;

    v2 = v6;
    *((_BYTE *)v6 + 320) = 0;
  }

}

- (void)streamDidServerDie:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  _BYTE buf[12];
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureRemoteVideoDevice streamDidServerDie:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureRemoteVideoDevice_streamDidServerDie___block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

void __59__CMContinuityCaptureRemoteVideoDevice_streamDidServerDie___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[31];
    WeakRetained[31] = 0;

    v2 = (void *)WeakRetained[30];
    WeakRetained[30] = 0;

    *((_BYTE *)WeakRetained + 320) = 0;
    v3 = WeakRetained[41];
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)WeakRetained[41];
      WeakRetained[41] = 0;

    }
    objc_msgSend(WeakRetained, "postAVCStreamInterruption");
  }

}

- (void)postAVCStreamInterruption
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  _BYTE buf[12];
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureRemoteVideoDevice postAVCStreamInterruption]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CMContinuityCaptureRemoteVideoDevice_postAVCStreamInterruption__block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __65__CMContinuityCaptureRemoteVideoDevice_postAVCStreamInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "compositeDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1007, 0);
      objc_msgSend(v2, "connectionInterrupted:forDevice:", v3, 0);

    }
    WeakRetained = v4;
  }

}

- (void)streamDidRTPTimeOut:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CMContinuityCaptureRemoteVideoDevice *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543874;
    v7 = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureRemoteVideoDevice streamDidRTPTimeOut:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureRemoteVideoDevice streamDidRTCPTimeOut:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_INFO, "%@ %s %@", buf, 0x20u);
  }

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CMContinuityCaptureRemoteVideoDevice_streamDidRTCPTimeOut___block_invoke;
  v7[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __61__CMContinuityCaptureRemoteVideoDevice_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "postAVCStreamInterruption");
    WeakRetained = v2;
  }

}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  void (**v7)(id, id);
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  NSObject *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  float v21;
  float v22;
  double v23;
  void *v24;
  CVImageBufferRef ImageBuffer;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t HostTimeInNanoSec;
  AVCStreamInput *avcStreamInput;
  char v34;
  id v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  objc_super v39;
  id v40;
  CGPoint point;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  CGFloat x;
  __int16 v46;
  CGFloat y;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, id))a5;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (const __CFString *)*MEMORY[0x24BE10868];
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BE10868], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE11898]);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      point.x = NAN;
      point.y = NAN;
      CGPointMakeWithDictionaryRepresentation(v12, &point);
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v43 = *(double *)&self;
        v44 = 2048;
        x = point.x;
        v46 = 2048;
        y = point.y;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating local activeConfiguration panning angle x:%f,y:%f based on transport layer attachments", buf, 0x20u);
      }

      v15 = point.x;
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPanningAngleX:", v15);

      v17 = point.y;
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPanningAngleY:", v17);

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE11890]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "floatValue");
        *(_DWORD *)buf = 134217984;
        v43 = v21;
        _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "Updating local activeConfiguration video zoom factor to %f based on transport layer attachments", buf, 0xCu);
      }

      objc_msgSend(v19, "floatValue");
      v23 = v22;
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setVideoZoomFactor:", v23);

    }
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    CMGetAttachment(ImageBuffer, CFSTR("ReactionEffectComplexity"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = *MEMORY[0x24BE11858];
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE11858]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");

      if (v29)
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v26, CFSTR("ReactionEffectComplexity"));
      else
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v26, CFSTR("ReactionEffectComplexity"), 0);
      v30 = (void *)objc_msgSend(v11, "mutableCopy");
      if (v30)
      {
        v31 = v30;
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v27);
      }
      else
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v29, v27, 0);
      }
      CMSetAttachment(a3, v9, v31, 1u);

    }
  }
  if (self->_avcStreamInputActive)
  {
    HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
    avcStreamInput = self->_avcStreamInput;
    v40 = 0;
    v34 = -[AVCStreamInput pushSampleBuffer:error:](avcStreamInput, "pushSampleBuffer:error:", a3, &v40);
    v35 = v40;
    if ((v34 & 1) != 0)
    {
      v36 = CMContinuityCaptureGetHostTimeInNanoSec() - HostTimeInNanoSec;
      if (CMContinityCaptureDebugLogEnabled())
      {
        CMContinuityCaptureLog(2);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:].cold.1();

      }
      if (v36 >= 0xF4241)
        CMSetAttachment(a3, CFSTR("HighLatencyFrame"), (CFTypeRef)*MEMORY[0x24BDBD270], 0);
      v39.receiver = self;
      v39.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
      -[CMContinuityCaptureDeviceBase dispatchFrame:entity:completion:](&v39, sel_dispatchFrame_entity_completion_, a3, -[CMContinuityCaptureDeviceBase entity](self, "entity"), &__block_literal_global_58);
    }
    else
    {
      CMContinuityCaptureLog(2);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:].cold.2();

    }
  }
  else
  {
    v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1003, 0);
  }
  v7[2](v7, v35);

}

- (id)createAVCVideoStream
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  id v16;
  id v18;
  id v19;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v26[0] = 0xAAAAAAAAAAAAAAAALL;
  v26[1] = 0xAAAAAAAAAAAAAAAALL;
  -[CMContinuityCaptureDeviceBase transportStream](self, "transportStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v13 = 0;
    v12 = 0;
    v5 = 0;
LABEL_19:
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "streamUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v13 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 2048;
    v23 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream for StreamUUID %@", buf, 0x20u);
  }

  objc_msgSend(v5, "getUUIDBytes:", v26);
  -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v10 = 0;
LABEL_9:
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2112;
      v23 = (unint64_t)v10;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid avcStreamInitOptions, error %@", buf, 0x16u);
    }

    v10 = 0;
    v9 = (void *)MEMORY[0x24BDBD1B8];
    goto LABEL_12;
  }
  -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "generateMediaStreamInitOptionsWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (!v9)
    goto LABEL_9;
LABEL_12:
  v18 = v10;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFDA40]), "initWithNWConnectionClientID:options:error:", v26, v9, &v18);
  v13 = v18;

  if (v12)
  {
    objc_msgSend(v12, "setDelegate:", self);
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2048;
      v23 = v15;
      v24 = 2048;
      v25 = v12;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream %p Success", buf, 0x20u);
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createAVCVideoStream].cold.1();
    v12 = 0;
  }

LABEL_16:
  v16 = v12;

  return v16;
}

- (id)newVideoStreamCurrentConfiguration:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t AVCVideoResolutionForFormat;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  int v44;
  id v45;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase transportStream](self, "transportStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "server");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (v5 && v8)
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cipherKeyforSessionID:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        objc_msgSend(v15, "generateMediaStreamConfigurationWithError:", &v51);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v51;

        if (v10)
        {
          v50 = v11;
          objc_msgSend(v10, "setRtcpSendInterval:", 1.0);
          objc_msgSend(v10, "setRtcpTimeOutEnabled:", 1);
          v16 = objc_msgSend(v9, "currentTransport");
          v17 = 12.0;
          if (v16 == 2)
            v17 = 8.0;
          objc_msgSend(v10, "setRtcpTimeOutInterval:", v17);
          objc_msgSend(v10, "setSRTPCipherSuite:", 5);
          objc_msgSend(v10, "setSRTCPCipherSuite:", 5);
          objc_msgSend(v10, "setSendMediaKey:", v12);
          objc_msgSend(v10, "setReceiveMediaKey:", v12);
          objc_msgSend(v10, "setStreamInputID:", a3);
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "format");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          AVCVideoResolutionForFormat = CMContinuityCaptureGetAVCVideoResolutionForFormat(v19);
          objc_msgSend(v10, "video");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setVideoResolution:", AVCVideoResolutionForFormat);

          objc_msgSend(v10, "video");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "videoResolution");

          if (v23 == 12)
          {
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "format");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "width");
            objc_msgSend(v10, "video");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setCustomWidth:", v26);

            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "format");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "height");
            objc_msgSend(v10, "video");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setCustomHeight:", v30);

          }
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "maxFrameRate");
          objc_msgSend(v10, "video");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setFramerate:", v33);

          objc_msgSend(v10, "video");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setLatencySensitiveModeEnabled:", 1);

          CMContinuityCaptureLog(2);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v47 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
            objc_msgSend(v10, "video");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v48, "videoResolution");
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v49 = v9;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v12;
            v40 = v5;
            v41 = objc_msgSend(v38, "maxFrameRate");
            v42 = v7;
            v43 = objc_msgSend(v10, "localSSRC");
            v44 = objc_msgSend(v10, "remoteSSRC");
            *(_DWORD *)buf = 138413570;
            v53 = self;
            v54 = 2048;
            v55 = v47;
            v56 = 1024;
            v57 = v37;
            v58 = 1024;
            v59 = v41;
            v5 = v40;
            v12 = v39;
            v60 = 1024;
            v61 = v43;
            v7 = v42;
            v62 = 1024;
            v63 = v44;
            _os_log_impl(&dword_227C5D000, v36, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] Stream Resolution %u at frameRate %u localSSRC %x remoteSSRC %x", buf, 0x2Eu);

            v9 = v49;
          }
          v11 = v50;
        }
        else
        {
          CMContinuityCaptureLog(2);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration].cold.2();
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
    }
    v45 = v10;

  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  id stopCompletionBlock;
  id *p_avcVideoStream;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  AVCStreamInput *v13;
  id v14;
  AVCStreamInput *avcStreamInput;
  AVCStreamInput *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  BOOL v22;
  NSObject *v24;
  id v25;
  objc_super v26;
  id v27;
  id v28;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  stopCompletionBlock = self->_stopCompletionBlock;
  self->_stopCompletionBlock = 0;

  self->_avcStreamInputActive = 0;
  p_avcVideoStream = (id *)&self->_avcVideoStream;
  if (!self->_avcVideoStream)
  {
    -[CMContinuityCaptureRemoteVideoDevice createAVCVideoStream](self, "createAVCVideoStream");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *p_avcVideoStream;
    *p_avcVideoStream = (id)v7;

    if (!*p_avcVideoStream)
    {
      v22 = 0;
      v21 = 0;
      goto LABEL_8;
    }
  }
  v9 = objc_alloc(MEMORY[0x24BDFDA30]);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "format");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v13 = (AVCStreamInput *)objc_msgSend(v9, "initWithDelegate:delegateQueue:format:options:error:", self, v10, objc_msgSend(v12, "formatDescription"), 0, &v28);
  v14 = v28;
  avcStreamInput = self->_avcStreamInput;
  self->_avcStreamInput = v13;

  v16 = self->_avcStreamInput;
  if (v16)
  {
    v17 = -[CMContinuityCaptureRemoteVideoDevice newVideoStreamCurrentConfiguration:](self, "newVideoStreamCurrentConfiguration:", -[AVCStreamInput streamInputID](v16, "streamInputID"));
    if (v17)
    {
      v18 = v17;
      v19 = *p_avcVideoStream;
      v27 = v14;
      v20 = objc_msgSend(v19, "configure:error:", v18, &v27);
      v21 = v27;

      if ((v20 & 1) != 0)
      {
        objc_msgSend(*p_avcVideoStream, "start");
        v22 = 1;
      }
      else
      {
        CMContinuityCaptureLog(2);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = *p_avcVideoStream;
          *(_DWORD *)buf = 138543874;
          v30 = self;
          v31 = 2048;
          v32 = v25;
          v33 = 2112;
          v34 = v21;
          _os_log_error_impl(&dword_227C5D000, v24, OS_LOG_TYPE_ERROR, "%{public}@ AVCVideoStream %p configure error %@", buf, 0x20u);
        }

        v22 = 0;
      }
      goto LABEL_7;
    }
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice startAVConferenceStack:].cold.2();
  }
  else
  {
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice startAVConferenceStack:].cold.1();
  }
  v22 = 0;
  v21 = v14;
LABEL_7:

LABEL_8:
  v26.receiver = self;
  v26.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  -[CMContinuityCaptureDeviceBase startAVConferenceStack:](&v26, sel_startAVConferenceStack_, a3);

  return v22;
}

- (BOOL)stopAVConferenceStack
{
  NSObject *v3;
  AVCVideoStream *avcVideoStream;
  BOOL v5;
  AVCStreamInput *avcStreamInput;
  int v8;
  CMContinuityCaptureRemoteVideoDevice *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureRemoteVideoDevice stopAVConferenceStack]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }

  if (self->_avcStreamInput && (avcVideoStream = self->_avcVideoStream) != 0)
  {
    -[AVCVideoStream stop](avcVideoStream, "stop");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (!self->_avcStreamInputActive)
  {
    avcStreamInput = self->_avcStreamInput;
    self->_avcStreamInput = 0;

  }
  return v5;
}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  NSObject *v8;
  AVCVideoStream *avcVideoStream;
  NSObject *v10;
  void *v11;
  void *v12;
  id stopCompletionBlock;
  dispatch_time_t v14;
  NSObject *v15;
  _BOOL4 v16;
  AVCVideoStream *v17;
  AVCStreamInput *avcStreamInput;
  AVCVideoStream *v19;
  NSObject *v20;
  id v21;
  objc_super v22;
  _QWORD block[4];
  id v24;
  _BYTE buf[12];
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (self->_stopCompletionBlock)
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      v26 = 2080;
      v27 = "-[CMContinuityCaptureRemoteVideoDevice stopCaptureStack:completion:]";
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s already in progress", buf, 0x16u);
    }

    if ((a3 & 4) != 0)
    {
      avcVideoStream = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      CMContinuityCaptureLog(2);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }

    }
    if (v6)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 3, 0);
      v6[2](v6, v11);

    }
  }
  else
  {
    if (self->_avcStreamInputActive)
    {
      v12 = (void *)MEMORY[0x22E2A7CB0](v6);
      stopCompletionBlock = self->_stopCompletionBlock;
      self->_stopCompletionBlock = v12;

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v14 = dispatch_time(0, 5000000000);
      -[CMContinuityCaptureDeviceBase queue](self, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__CMContinuityCaptureRemoteVideoDevice_stopCaptureStack_completion___block_invoke;
      block[3] = &unk_24F06AE60;
      objc_copyWeak(&v24, (id *)buf);
      dispatch_after(v14, v15, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
    v16 = -[CMContinuityCaptureRemoteVideoDevice stopAVConferenceStack](self, "stopAVConferenceStack");
    -[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:](self, "stopCameraCaptureStack:", a3);
    if ((a3 & 4) != 0)
    {
      v17 = self->_avcVideoStream;
      if (v17)
        -[AVCVideoStream stop](v17, "stop");
      avcStreamInput = self->_avcStreamInput;
      self->_avcStreamInput = 0;

      v19 = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      self->_avcStreamInputActive = 0;
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }

    }
    v22.receiver = self;
    v22.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
    -[CMContinuityCaptureDeviceBase stopCaptureStack:completion:](&v22, sel_stopCaptureStack_completion_, a3, &__block_literal_global_66);
    if (!v16 || !self->_avcStreamInputActive)
    {
      v21 = self->_stopCompletionBlock;
      self->_stopCompletionBlock = 0;

      v6[2](v6, 0);
    }
  }

}

void __68__CMContinuityCaptureRemoteVideoDevice_stopCaptureStack_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[41];
    if (v3)
    {
      v5 = v2;
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)v5[41];
      v5[41] = 0;

      v2 = v5;
    }
  }

}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  objc_super *v12;
  objc_super v13;
  objc_super v14;
  CMContinuityCaptureRemoteVideoDevice *v15;
  __objc2_class *v16;

  v8 = a4;
  v9 = v8;
  if (a3 == 3)
  {
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamInterrupted"));

    if (v11)
    {
      v15 = self;
      v16 = CMContinuityCaptureRemoteVideoDevice;
      v12 = (objc_super *)&v15;
    }
    else
    {
      -[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:](self, "stopCameraCaptureStack:", 1024);
      -[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:](self, "startCameraCaptureStack:", 0);
      v14.receiver = self;
      v14.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
      v12 = &v14;
    }
    -[objc_super postActionOfType:forEvent:option:](v12, sel_postActionOfType_forEvent_option_, 13, v9, a5, v13.receiver, v13.super_class, v14.receiver, v14.super_class, v15, v16);
  }
  else
  {
    -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v13, sel_postActionOfType_forEvent_option_, a3, v8, a5, self, CMContinuityCaptureRemoteVideoDevice, v14.receiver, v14.super_class, v15, v16);
  }

}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  CMContinuityCaptureRemoteEventToBeRelayedList();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureRemoteEventToBeRelayedListEvenWhenDropped();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsObject:", v8)
    && (!v10
     || objc_msgSend(v10, "code") != 1
     && (objc_msgSend(v10, "code") != 2 || objc_msgSend(v12, "containsObject:", v8))))
  {
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postEvent:entity:data:", v8, -[CMContinuityCaptureDeviceBase entity](self, "entity"), v9);

  }
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](&v14, sel_postActionCompletionForEventName_eventData_error_, v8, v9, v10);

}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  CMContinuityCaptureRemoteVideoDevice *v14;
  id v15;
  id v16;
  id location;

  v7 = a3;
  v8 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CMContinuityCaptureRemoteVideoDevice_captureStillImage_entity_completion___block_invoke;
  block[3] = &unk_24F06C000;
  objc_copyWeak(&v16, &location);
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__CMContinuityCaptureRemoteVideoDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  int v25;
  void *v26;
  int v27;
  id *v28;
  __int16 v29;
  _BYTE v30[18];
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v27 = 138543618;
      v28 = WeakRetained;
      v29 = 2112;
      *(_QWORD *)v30 = v4;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Got captureStillImage with request %@", (uint8_t *)&v27, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "compressedFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "compressedFormat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDB2268]);

    }
    objc_msgSend(MEMORY[0x24BDB24C8], "photoSettingsWithFormat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(*(id *)(a1 + 32), "maxPhotoDimensions") < 1
      || (int)((unint64_t)objc_msgSend(*(id *)(a1 + 32), "maxPhotoDimensions") >> 32) < 1)
    {
      objc_msgSend(v7, "setHighResolutionPhotoEnabled:", objc_msgSend(*(id *)(a1 + 32), "highResolutionPhotoEnabled"));
    }
    else
    {
      objc_msgSend(v7, "setMaxPhotoDimensions:", objc_msgSend(*(id *)(a1 + 32), "maxPhotoDimensions"));
    }
    objc_msgSend(WeakRetained[33], "supportedFlashModes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if (v10)
    {
      objc_msgSend(v7, "setFlashMode:", (int)objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    }
    else
    {
      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(*(id *)(a1 + 32), "flashMode");
        objc_msgSend(WeakRetained[33], "supportedFlashModes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = WeakRetained;
        v29 = 1024;
        *(_DWORD *)v30 = v25;
        *(_WORD *)&v30[4] = 2112;
        *(_QWORD *)&v30[6] = v26;
        _os_log_error_impl(&dword_227C5D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Still capture request specified unsupported flash mode %d, supported modes %@", (uint8_t *)&v27, 0x1Cu);

      }
    }
    objc_msgSend(v7, "setPhotoQualityPrioritization:", (int)objc_msgSend(*(id *)(a1 + 32), "photoQualityPrioritization"));
    if (v7 && objc_msgSend(WeakRetained, "streaming") && WeakRetained[33])
    {
      v12 = *(id *)(a1 + 40);
      objc_sync_enter(v12);
      v13 = WeakRetained[29];
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = WeakRetained[29];
        WeakRetained[29] = (id)v14;

        v13 = WeakRetained[29];
      }
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v7, "uniqueID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v17);

      objc_sync_exit(v12);
      CMContinuityCaptureLog(2);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v27 = 138543874;
        v28 = WeakRetained;
        v29 = 2112;
        *(_QWORD *)v30 = v7;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = v19;
        _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Capturing %@ for %@", (uint8_t *)&v27, 0x20u);
      }

      objc_msgSend(WeakRetained[33], "capturePhotoWithSettings:delegate:", v7, *(_QWORD *)(a1 + 40));
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = objc_msgSend(WeakRetained, "streaming");
        v24 = WeakRetained[33];
        v27 = 138544386;
        v28 = WeakRetained;
        v29 = 2112;
        *(_QWORD *)v30 = v22;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = v7;
        v31 = 1024;
        v32 = v23;
        v33 = 2112;
        v34 = v24;
        _os_log_error_impl(&dword_227C5D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to capture photo for request %@. photoSettings:%@ streaming:%d photoOutput:%@", (uint8_t *)&v27, 0x30u);
      }

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1002, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CMContinuityCaptureRemoteVideoDevice_enqueueReactionEffect_entity___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__CMContinuityCaptureRemoteVideoDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t buf[4];
  _QWORD *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v7 = WeakRetained;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Got enqueueReactionEffect with reactionType %@", buf, 0x16u);
    }

    if (objc_msgSend(WeakRetained, "streaming"))
    {
      v5 = (void *)WeakRetained[36];
      if (v5)
        objc_msgSend(v5, "performEffectForReaction:", *(_QWORD *)(a1 + 32));
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__CMContinuityCaptureRemoteVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_24F06AFA0;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __87__CMContinuityCaptureRemoteVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  double v13;
  void *v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  char v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE buf[12];
  __int16 v66;
  _BYTE v67[10];
  __int16 v68;
  int v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("activeVideoMinFrameDuration")))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (-[NSObject CMTimeValue](v11, "CMTimeValue"), *(_QWORD *)buf))
    {
      *(float *)&v13 = (float)*(int *)&buf[8] / (float)*(uint64_t *)buf;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &unk_24F07FCB8;
    }
    v17 = objc_msgSend(v14, "unsignedIntValue");
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaxFrameRate:", v17);

LABEL_33:
    -[CMContinuityCaptureRemoteVideoDevice updateControlStatus](self, "updateControlStatus");

LABEL_34:
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("activeVideoMaxFrameDuration")))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if (v15 && (-[NSObject CMTimeValue](v15, "CMTimeValue"), *(_QWORD *)buf))
    {
      *(float *)&v16 = (float)*(int *)&buf[8] / (float)*(uint64_t *)buf;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &unk_24F07FCB8;
    }
    v39 = objc_msgSend(v14, "unsignedIntValue");
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setMinFrameRate:", v39);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setValue:", v14);

    goto LABEL_33;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("reactionEffectsInProgress")))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v19, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v23 = v19;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v62 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v25);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v29 = v20;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v58 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          if ((objc_msgSend(v21, "containsObject:", v34) & 1) == 0)
          {
            objc_msgSend(v34, "dictionaryRepresentation");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v35);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v31);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("ReactionsInProgress"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setValue:", v22);
    CMContinuityCaptureLog(2);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      v66 = 2114;
      *(_QWORD *)v67 = v36;
      _os_log_impl(&dword_227C5D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
    }

    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValueForControl:completion:", v36, 0);

    v9 = v56;
    goto LABEL_35;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("active")))
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("throttled")))
      goto LABEL_35;
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "BOOLValue");

    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frameRateManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "allowedFrameRateRangeForDevice:", self);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject maxFrameRate](v12, "maxFrameRate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:](self, "setMaxFrameRate:", objc_msgSend(v48, "unsignedIntValue"));

    -[NSObject minFrameRate](v12, "minFrameRate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteVideoDevice setMinFrameRate:](self, "setMinFrameRate:", objc_msgSend(v49, "unsignedIntValue"));

    CMContinuityCaptureLog(2);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = self;
      v66 = 1024;
      *(_DWORD *)v67 = -[CMContinuityCaptureRemoteVideoDevice maxFrameRate](self, "maxFrameRate");
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = -[CMContinuityCaptureRemoteVideoDevice minFrameRate](self, "minFrameRate");
      v68 = 1024;
      v69 = v45;
      _os_log_impl(&dword_227C5D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated maxFrameRate: %u minFrameRate: %u, throttled state: %d", buf, 0x1Eu);
    }

    goto LABEL_34;
  }
  v42 = *MEMORY[0x24BDD0E70];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "BOOLValue"))
  {

    goto LABEL_47;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "BOOLValue");

  if (!v52)
  {
LABEL_47:
    objc_msgSend(v9, "objectForKeyedSubscript:", v42);
    v12 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject BOOLValue](v12, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "BOOLValue");

      if ((v55 & 1) != 0)
        goto LABEL_35;
      CMContinuityCaptureLog(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ active 0 -> 1", buf, 0xCu);
      }
    }
    goto LABEL_34;
  }
  CMContinuityCaptureLog(2);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_227C5D000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ active 1 -> 0", buf, 0xCu);
  }

  -[CMContinuityCaptureRemoteVideoDevice stopCaptureStack:completion:](self, "stopCaptureStack:completion:", 4, &__block_literal_global_75_0);
LABEL_35:

}

- (void)updateControlStatus
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CMContinuityCaptureRemoteVideoDevice_updateControlStatus__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__CMContinuityCaptureRemoteVideoDevice_updateControlStatus__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateControlStatus");
    WeakRetained = v2;
  }

}

- (void)_updateControlStatus
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  AVCaptureDevice *videoDevice;
  AVCaptureDevice *v87;
  AVCaptureDevice *v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  AVCaptureDevice *v99;
  AVCaptureDevice *v100;
  AVCaptureDevice *v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  NSObject *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  uint64_t v120;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v122;
  __int16 v123;
  const char *v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v122 = self;
    v123 = 2080;
    v124 = "-[CMContinuityCaptureRemoteVideoDevice _updateControlStatus]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("4cc_cfac_glob_0000"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVCaptureDeviceInput device](self->_videoDataInput, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isCenterStageActive"))
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isCenterStageForcefullyEnabled") & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "centerStageEnabled");

      }
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(v5, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((_DWORD)v8 != v11)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:", v12);

      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v5;
        _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValueForControl:completion:", v5, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("OverheadCameraMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "deskViewCameraMode");

    objc_msgSend(v15, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    if (v17 != v19)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:", v20);

      CMContinuityCaptureLog(2);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v15;
        _os_log_impl(&dword_227C5D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setValueForControl:completion:", v15, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("4cc_cfen_glob_0000"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "centerStageEnabled") & 1) != 0)
    {
      v25 = 1;
    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v26, "isCenterStageForcefullyEnabled");

    }
    objc_msgSend(v23, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if ((_DWORD)v25 != v28)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:", v29);

      CMContinuityCaptureLog(2);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v23;
        _os_log_impl(&dword_227C5D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setValueForControl:completion:", v23, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("4cc_cfri_glob_0000"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v32, "value");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      -[CMContinuityCaptureRemoteVideoDevice centerStageRectOfInterest](self, "centerStageRectOfInterest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "value");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqualToDictionary:", v36);

      if ((v37 & 1) == 0)
      {
        -[CMContinuityCaptureRemoteVideoDevice centerStageRectOfInterest](self, "centerStageRectOfInterest");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setValue:", v38);

        CMContinuityCaptureLog(2);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v122 = self;
          v123 = 2114;
          v124 = (const char *)v32;
          _os_log_impl(&dword_227C5D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
        }

        -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setValueForControl:completion:", v32, 0);

      }
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("4cc_cffm_glob_0000"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "centerStageFramingMode");

    objc_msgSend(v41, "value");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "intValue");

    if (v43 != v45)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setValue:", v46);

      CMContinuityCaptureLog(2);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v41;
        _os_log_impl(&dword_227C5D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setValueForControl:completion:", v41, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("PortraitEffectActive"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[AVCaptureDeviceInput device](self->_videoDataInput, "device");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v50, "isPortraitEffectActive") & 1) != 0)
    {
      v51 = 1;
    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v52, "portraitEffectEnabled");

    }
    objc_msgSend(v49, "value");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "BOOLValue");

    if ((_DWORD)v51 != v54)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v51);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setValue:", v55);

      CMContinuityCaptureLog(2);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v49;
        _os_log_impl(&dword_227C5D000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setValueForControl:completion:", v49, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("StudioLightingActive"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[AVCaptureDeviceInput device](self->_videoDataInput, "device");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v59, "isStudioLightActive") & 1) != 0)
    {
      v60 = 1;
    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v61, "studioLightingEnabled");

    }
    objc_msgSend(v58, "value");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "BOOLValue");

    if ((_DWORD)v60 != v63)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v60);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setValue:", v64);

      CMContinuityCaptureLog(2);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v58;
        _os_log_impl(&dword_227C5D000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setValueForControl:completion:", v58, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("ReactionEffectsActive"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[AVCaptureDeviceInput device](self->_videoDataInput, "device");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v68, "canPerformReactionEffects") & 1) != 0)
    {
      v69 = 1;
    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v70, "reactionEffectsEnabled");

    }
    objc_msgSend(v67, "value");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "BOOLValue");

    if ((_DWORD)v69 != v72)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v69);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setValue:", v73);

      CMContinuityCaptureLog(2);
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v67;
        _os_log_impl(&dword_227C5D000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setValueForControl:completion:", v67, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("BackgroundReplacementActive"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[AVCaptureDeviceInput device](self->_videoDataInput, "device");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v77, "isBackgroundReplacementActive") & 1) != 0)
    {
      v78 = 1;
    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v79, "backgroundReplacementEnabled");

    }
    objc_msgSend(v76, "value");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "BOOLValue");

    if ((_DWORD)v78 != v81)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v78);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setValue:", v82);

      CMContinuityCaptureLog(2);
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        v123 = 2114;
        v124 = (const char *)v76;
        _os_log_impl(&dword_227C5D000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setValueForControl:completion:", v76, 0);

    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    videoDevice = self->_videoDevice;
    if (videoDevice)
    {
      -[AVCaptureDevice activeVideoMinFrameDuration](videoDevice, "activeVideoMinFrameDuration");
      if (v120)
      {
        v87 = self->_videoDevice;
        if (v87)
        {
          -[AVCaptureDevice activeVideoMinFrameDuration](v87, "activeVideoMinFrameDuration");
          v88 = self->_videoDevice;
          v89 = (double)v119;
          if (v88)
          {
            -[AVCaptureDevice activeVideoMinFrameDuration](v88, "activeVideoMinFrameDuration");
            v90 = (double)v118;
            goto LABEL_79;
          }
        }
        else
        {
          v89 = 0.0;
        }
        v90 = 0.0;
LABEL_79:
        v91 = v89 / v90;
        objc_msgSend(v85, "value");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "doubleValue");
        v94 = v93;

        if (v94 != v91)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v91);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setValue:", v95);

          CMContinuityCaptureLog(2);
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v122 = self;
            v123 = 2114;
            v124 = (const char *)v85;
            _os_log_impl(&dword_227C5D000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
          }

          -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setValueForControl:completion:", v85, 0);

        }
      }
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v98)
    goto LABEL_96;
  v99 = self->_videoDevice;
  if (!v99)
    goto LABEL_96;
  -[AVCaptureDevice activeVideoMaxFrameDuration](v99, "activeVideoMaxFrameDuration");
  if (!v117)
    goto LABEL_96;
  v100 = self->_videoDevice;
  if (v100)
  {
    -[AVCaptureDevice activeVideoMaxFrameDuration](v100, "activeVideoMaxFrameDuration");
    v101 = self->_videoDevice;
    v102 = (double)(int)v115;
    if (v101)
    {
      -[AVCaptureDevice activeVideoMaxFrameDuration](v101, "activeVideoMaxFrameDuration");
      v103 = (double)v111;
      goto LABEL_92;
    }
  }
  else
  {
    v114 = 0;
    v115 = 0;
    v102 = 0.0;
    v116 = 0;
  }
  v111 = 0;
  v112 = 0;
  v103 = 0.0;
  v113 = 0;
LABEL_92:
  v104 = v102 / v103;
  objc_msgSend(v98, "value", v111, v112, v113, v114, v115, v116);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "doubleValue");
  v107 = v106;

  if (v107 != v104)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v104);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setValue:", v108);

    CMContinuityCaptureLog(2);
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v122 = self;
      v123 = 2114;
      v124 = (const char *)v98;
      _os_log_impl(&dword_227C5D000, v109, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
    }

    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setValueForControl:completion:", v98, 0);

  }
LABEL_96:

}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CMContinuityCaptureRemoteVideoDevice *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke;
  v10[3] = &unk_24F06AF00;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = self;
  v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  NSObject *v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  const char *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  int v63;
  const char *v64;
  const char *v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  int v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  int v76;
  const char *v77;
  void *v78;
  int v79;
  void *v80;
  int v81;
  void *v82;
  int v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  int v88;
  const char *v89;
  void *v90;
  int v91;
  void *v92;
  int v93;
  void *v94;
  int v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  int v100;
  const char *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  uint64_t v113;
  void *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  int v118;
  const char *v119;
  void *v120;
  int v121;
  void *v122;
  int v123;
  void *v124;
  int v125;
  void *v126;
  uint64_t v127;
  void *v128;
  NSObject *v129;
  void *v130;
  void *v131;
  int v132;
  const char *v133;
  void *v134;
  int v135;
  void *v136;
  double v137;
  double v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  double v149;
  void *v150;
  int v151;
  void *v152;
  int v153;
  void *v154;
  int v155;
  void *v156;
  uint64_t v157;
  void *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  int v162;
  const char *v163;
  void *v164;
  int v165;
  void *v166;
  int v167;
  void *v168;
  int v169;
  void *v170;
  uint64_t v171;
  void *v172;
  NSObject *v173;
  void *v174;
  void *v175;
  int v176;
  const char *v177;
  void *v178;
  int v179;
  void *v180;
  int v181;
  void *v182;
  int v183;
  void *v184;
  uint64_t v185;
  void *v186;
  NSObject *v187;
  void *v188;
  void *v189;
  int v190;
  const char *v191;
  void *v192;
  int v193;
  void *v194;
  void *v195;
  void *v196;
  NSObject *v197;
  void *v198;
  void *v199;
  double v200;
  void *v201;
  int v202;
  void *v203;
  uint64_t v204;
  void *v205;
  int v206;
  void *v207;
  uint64_t v208;
  void *v209;
  NSObject *v210;
  void *v211;
  void *v212;
  void *v213;
  int v214;
  void *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  int v219;
  const __CFDictionary *v220;
  NSObject *v221;
  void *v222;
  void *v223;
  NSObject *v224;
  void *v225;
  int v226;
  const __CFDictionary *v227;
  NSObject *v228;
  void *v229;
  void *v230;
  void *v231;
  int v232;
  void *v233;
  int v234;
  void *v235;
  int v236;
  NSObject *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  double v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  int v249;
  void *v250;
  int v251;
  void *v252;
  int v253;
  NSObject *v254;
  void *v255;
  void *v256;
  void *v257;
  uint64_t v258;
  void *v259;
  void *v260;
  void *v261;
  int v262;
  NSObject *v263;
  void *v264;
  void *v265;
  NSObject *v266;
  void *v267;
  int v268;
  NSObject *v269;
  void *v270;
  void *v271;
  void *v272;
  int v273;
  void *v274;
  float v275;
  float v276;
  void *v277;
  float v278;
  float v279;
  void *v280;
  int v281;
  int v282;
  void *v283;
  double v284;
  NSObject *v285;
  void *v286;
  void *v287;
  float v288;
  void *v289;
  void *v290;
  int v291;
  void *v292;
  float v293;
  float v294;
  void *v295;
  float v296;
  float v297;
  void *v298;
  int v299;
  int v300;
  void *v301;
  double v302;
  NSObject *v303;
  void *v304;
  void *v305;
  float v306;
  void *v307;
  int v308;
  void *v309;
  float v310;
  void *v311;
  float v312;
  float v313;
  void *v314;
  float v315;
  _BOOL8 v316;
  void *v317;
  NSObject *v318;
  void *v319;
  void *v320;
  void *v321;
  int v322;
  void *v323;
  double v324;
  void *v325;
  uint64_t v326;
  void *v327;
  NSObject *v328;
  void *v329;
  void *v330;
  int v331;
  NSObject *v332;
  void *v333;
  void *v334;
  int v335;
  const __CFString *v336;
  void *v337;
  uint64_t v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  int v343;
  void *v344;
  NSObject *v345;
  id v346;
  void *v347;
  double v348;
  id v349;
  id v350;
  id v351;
  id v352;
  CGPoint point;
  uint8_t buf[4];
  id v355;
  __int16 v356;
  double v357;
  __int16 v358;
  CGFloat x;
  __int16 v360;
  CGFloat y;
  uint64_t v362;

  v362 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_61;
  if (!WeakRetained[344])
  {
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_loadWeakRetained(v2);
      v12 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v355 = v11;
      v356 = 2112;
      v357 = v12;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping control %@ update since capture stack not active", buf, 0x16u);

    }
    v13 = *(void **)(a1 + 32);
    v14 = (void *)*((_QWORD *)v4 + 44);
    objc_msgSend(v13, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);
    goto LABEL_60;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("4cc_cfen_glob_0000"));

  if (v6)
  {
    if (objc_msgSend(v4, "isDockedTrackingEnabled"))
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "Center Stage should not be set when docked tracking is enabled. Ignore the request.", buf, 2u);
      }
      goto LABEL_60;
    }
    objc_msgSend(v4, "activeConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject centerStageEnabled](v7, "centerStageEnabled");
    objc_msgSend(*(id *)(a1 + 32), "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != objc_msgSend(v9, "BOOLValue"))
    {

LABEL_23:
      objc_msgSend(*(id *)(a1 + 32), "value");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "BOOLValue");
      objc_msgSend(v4, "activeConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setCenterStageEnabled:", v40);

      objc_msgSend(*((id *)v4 + 32), "objectForKeyedSubscript:", CFSTR("4cc_cfen_glob_0000"));
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "value");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:](v7, "setValue:", v42);

      CMContinuityCaptureLog(2);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = *(void **)(a1 + 40);
        objc_msgSend(v4, "activeConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "centerStageEnabled");
        *(double *)&v47 = COERCE_DOUBLE("Off");
        if (v46)
          *(double *)&v47 = COERCE_DOUBLE("On");
        *(_DWORD *)buf = 138543618;
        v355 = v44;
        v356 = 2080;
        v357 = *(double *)&v47;
        _os_log_impl(&dword_227C5D000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageEnabled %s", buf, 0x16u);

      }
      objc_msgSend(v4, "activeConfiguration");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isCenterStageForcefullyEnabled");

      if (v49)
      {
        objc_msgSend(v4, "_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:", 0);
        objc_msgSend(v4, "companionDevice");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:", 0);

      }
      objc_msgSend(v4, "_toggleBetweenCenterStageAndManualFraming");
      goto LABEL_57;
    }
    objc_msgSend(v4, "activeConfiguration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v36, "isCenterStageForcefullyEnabled") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "value");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "BOOLValue");

      if ((v38 & 1) != 0)
        goto LABEL_58;
      goto LABEL_23;
    }

LABEL_57:
    goto LABEL_58;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("4cc_cfri_glob_0000"))
    && (objc_msgSend(*(id *)(a1 + 32), "value"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = (void *)v17;
    objc_msgSend(*(id *)(a1 + 32), "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activeConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCenterStageRectOfInterest:", v21);

      CMContinuityCaptureLog(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(void **)(a1 + 40);
        objc_msgSend(v4, "activeConfiguration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "centerStageRectOfInterest");
        v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138412546;
        v355 = v24;
        v356 = 2112;
        v357 = v26;
        _os_log_impl(&dword_227C5D000, v23, OS_LOG_TYPE_DEFAULT, "%@ CenterStageRectOfInterest %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "value");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCenterStageRectOfInterest:", v7);
      goto LABEL_57;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("4cc_cffm_glob_0000"));

  v29 = *(void **)(a1 + 32);
  if (v28)
  {
    objc_msgSend(v29, "value");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (int)objc_msgSend(v30, "intValue");

    objc_msgSend(v4, "activeConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCenterStageFramingMode:", v31);

    CMContinuityCaptureLog(2);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(void **)(a1 + 40);
      objc_msgSend(v4, "activeConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v355 = v34;
      v356 = 2048;
      v357 = COERCE_DOUBLE(objc_msgSend(v35, "centerStageFramingMode"));
      _os_log_impl(&dword_227C5D000, v33, OS_LOG_TYPE_DEFAULT, "%@ CenterStageFramingMode %ld", buf, 0x16u);

    }
    objc_msgSend(v4, "setCenterStageFramingMode:", v31);
    goto LABEL_58;
  }
  objc_msgSend(v29, "name");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("FaceDetectionEnabled"));

  if (v52)
  {
    objc_msgSend(v4, "activeConfiguration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "faceDetectionEnabled");
    objc_msgSend(*(id *)(a1 + 32), "value");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "BOOLValue");

    if (v54 == v56)
      goto LABEL_58;
    objc_msgSend(*(id *)(a1 + 32), "value");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "BOOLValue");
    objc_msgSend(v4, "activeConfiguration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFaceDetectionEnabled:", v58);

    CMContinuityCaptureLog(2);
    v60 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      goto LABEL_56;
    v61 = *(void **)(a1 + 40);
    objc_msgSend(v4, "activeConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "faceDetectionEnabled");
    *(double *)&v64 = COERCE_DOUBLE("Off");
    if (v63)
      *(double *)&v64 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v355 = v61;
    v356 = 2080;
    v357 = *(double *)&v64;
    v65 = "%{public}@ FaceDetectionEnabled %s";
    goto LABEL_55;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "isEqualToString:", CFSTR("HumanBodyDetectionEnabled"));

  if (v67)
  {
    objc_msgSend(v4, "activeConfiguration");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "humanBodyDetectionEnabled");
    objc_msgSend(*(id *)(a1 + 32), "value");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "BOOLValue");

    if (v69 == v71)
      goto LABEL_58;
    objc_msgSend(*(id *)(a1 + 32), "value");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "BOOLValue");
    objc_msgSend(v4, "activeConfiguration");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setHumanBodyDetectionEnabled:", v73);

    CMContinuityCaptureLog(2);
    v60 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      goto LABEL_56;
    v75 = *(void **)(a1 + 40);
    objc_msgSend(v4, "activeConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v62, "humanBodyDetectionEnabled");
    *(double *)&v77 = COERCE_DOUBLE("Off");
    if (v76)
      *(double *)&v77 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v355 = v75;
    v356 = 2080;
    v357 = *(double *)&v77;
    v65 = "%{public}@ HumanBodyDetectionEnabled %s";
    goto LABEL_55;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "isEqualToString:", CFSTR("HumanFullBodyDetectionEnabled"));

  if (v79)
  {
    objc_msgSend(v4, "activeConfiguration");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "humanFullBodyDetectionEnabled");
    objc_msgSend(*(id *)(a1 + 32), "value");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "BOOLValue");

    if (v81 == v83)
      goto LABEL_58;
    objc_msgSend(*(id *)(a1 + 32), "value");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "BOOLValue");
    objc_msgSend(v4, "activeConfiguration");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setHumanFullBodyDetectionEnabled:", v85);

    CMContinuityCaptureLog(2);
    v60 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      goto LABEL_56;
    v87 = *(void **)(a1 + 40);
    objc_msgSend(v4, "activeConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v62, "humanFullBodyDetectionEnabled");
    *(double *)&v89 = COERCE_DOUBLE("Off");
    if (v88)
      *(double *)&v89 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v355 = v87;
    v356 = 2080;
    v357 = *(double *)&v89;
    v65 = "%{public}@ HumanFullBodyDetectionEnabled %s";
    goto LABEL_55;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "isEqualToString:", CFSTR("AsyncStillCaptureEnabled"));

  if (v91)
  {
    objc_msgSend(v4, "activeConfiguration");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "asyncStillCaptureEnabled");
    objc_msgSend(*(id *)(a1 + 32), "value");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "BOOLValue");

    if (v93 == v95)
      goto LABEL_58;
    objc_msgSend(*(id *)(a1 + 32), "value");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "BOOLValue");
    objc_msgSend(v4, "activeConfiguration");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setAsyncStillCaptureEnabled:", v97);

    CMContinuityCaptureLog(2);
    v60 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      goto LABEL_56;
    v99 = *(void **)(a1 + 40);
    objc_msgSend(v4, "activeConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v62, "asyncStillCaptureEnabled");
    *(double *)&v101 = COERCE_DOUBLE("Off");
    if (v100)
      *(double *)&v101 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v355 = v99;
    v356 = 2080;
    v357 = *(double *)&v101;
    v65 = "%{public}@ AsyncStillCaptureEnabled %s";
LABEL_55:
    _os_log_impl(&dword_227C5D000, v60, OS_LOG_TYPE_DEFAULT, v65, buf, 0x16u);

LABEL_56:
    objc_msgSend(v4, "compositeDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject postEvent:entity:data:](v7, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), objc_msgSend(v4, "entity"), 0);
    goto LABEL_57;
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "isEqualToString:", CFSTR("SuppressVideoEffects"));

  if (!v107)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "isEqualToString:", CFSTR("PortraitEffectEnabled"));

    if (v121)
    {
      objc_msgSend(v4, "activeConfiguration");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "portraitEffectEnabled");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "BOOLValue");

      if (v123 != v125)
      {
        objc_msgSend(*(id *)(a1 + 32), "value");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v126, "BOOLValue");
        objc_msgSend(v4, "activeConfiguration");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "setPortraitEffectEnabled:", v127);

        CMContinuityCaptureLog(2);
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        {
          v130 = *(void **)(a1 + 40);
          objc_msgSend(v4, "activeConfiguration");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v131, "portraitEffectEnabled");
          *(double *)&v133 = COERCE_DOUBLE("Off");
          if (v132)
            *(double *)&v133 = COERCE_DOUBLE("On");
          *(_DWORD *)buf = 138543618;
          v355 = v130;
          v356 = 2080;
          v357 = *(double *)&v133;
          _os_log_impl(&dword_227C5D000, v129, OS_LOG_TYPE_DEFAULT, "%{public}@ PortraitEffectEnabled %s", buf, 0x16u);

        }
        objc_msgSend(v4, "activeConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setPortraitEffect:", -[NSObject portraitEffectEnabled](v7, "portraitEffectEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v134, "isEqualToString:", CFSTR("VideoZoomFactor"));

    if (v135)
    {
      objc_msgSend(v4, "activeConfiguration");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "videoZoomFactor");
      v138 = v137;
      objc_msgSend(*(id *)(a1 + 32), "value");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "doubleValue");
      v141 = v140;

      if (v138 != v141)
      {
        objc_msgSend(*(id *)(a1 + 32), "value");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "doubleValue");
        v144 = v143;
        objc_msgSend(v4, "activeConfiguration");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setVideoZoomFactor:", v144);

        CMContinuityCaptureLog(2);
        v146 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          v147 = *(void **)(a1 + 40);
          objc_msgSend(v4, "activeConfiguration");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "videoZoomFactor");
          *(_DWORD *)buf = 138543618;
          v355 = v147;
          v356 = 2048;
          v357 = v149;
          _os_log_impl(&dword_227C5D000, v146, OS_LOG_TYPE_DEFAULT, "%{public}@ VideoZoomFactor %.2f", buf, 0x16u);

        }
        objc_msgSend(v4, "activeConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject videoZoomFactor](v7, "videoZoomFactor");
        objc_msgSend(v4, "setVideoZoomFactor:");
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "isEqualToString:", CFSTR("StudioLightingEnabled"));

    if (v151)
    {
      objc_msgSend(v4, "activeConfiguration");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend(v152, "studioLightingEnabled");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v154, "BOOLValue");

      if (v153 != v155)
      {
        objc_msgSend(*(id *)(a1 + 32), "value");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = objc_msgSend(v156, "BOOLValue");
        objc_msgSend(v4, "activeConfiguration");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "setStudioLightingEnabled:", v157);

        CMContinuityCaptureLog(2);
        v159 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
        {
          v160 = *(void **)(a1 + 40);
          objc_msgSend(v4, "activeConfiguration");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = objc_msgSend(v161, "studioLightingEnabled");
          *(double *)&v163 = COERCE_DOUBLE("Off");
          if (v162)
            *(double *)&v163 = COERCE_DOUBLE("On");
          *(_DWORD *)buf = 138543618;
          v355 = v160;
          v356 = 2080;
          v357 = *(double *)&v163;
          _os_log_impl(&dword_227C5D000, v159, OS_LOG_TYPE_DEFAULT, "%{public}@ StudioLightingEnabled %s", buf, 0x16u);

        }
        objc_msgSend(v4, "activeConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStudioLighting:", -[NSObject studioLightingEnabled](v7, "studioLightingEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_msgSend(v164, "isEqualToString:", CFSTR("ReactionEffectsEnabled"));

    if (v165)
    {
      objc_msgSend(v4, "activeConfiguration");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v166, "reactionEffectsEnabled");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = objc_msgSend(v168, "BOOLValue");

      if (v167 != v169)
      {
        objc_msgSend(*(id *)(a1 + 32), "value");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = objc_msgSend(v170, "BOOLValue");
        objc_msgSend(v4, "activeConfiguration");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "setReactionEffectsEnabled:", v171);

        CMContinuityCaptureLog(2);
        v173 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
        {
          v174 = *(void **)(a1 + 40);
          objc_msgSend(v4, "activeConfiguration");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend(v175, "reactionEffectsEnabled");
          *(double *)&v177 = COERCE_DOUBLE("Off");
          if (v176)
            *(double *)&v177 = COERCE_DOUBLE("On");
          *(_DWORD *)buf = 138543618;
          v355 = v174;
          v356 = 2080;
          v357 = *(double *)&v177;
          _os_log_impl(&dword_227C5D000, v173, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionEffectsEnabled %s", buf, 0x16u);

        }
        objc_msgSend(v4, "activeConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setReactionEffects:", -[NSObject reactionEffectsEnabled](v7, "reactionEffectsEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend(v178, "isEqualToString:", CFSTR("BackgroundReplacementEnabled"));

    if (v179)
    {
      objc_msgSend(v4, "activeConfiguration");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend(v180, "backgroundReplacementEnabled");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = objc_msgSend(v182, "BOOLValue");

      if (v181 != v183)
      {
        objc_msgSend(*(id *)(a1 + 32), "value");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = objc_msgSend(v184, "BOOLValue");
        objc_msgSend(v4, "activeConfiguration");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "setBackgroundReplacementEnabled:", v185);

        CMContinuityCaptureLog(2);
        v187 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
        {
          v188 = *(void **)(a1 + 40);
          objc_msgSend(v4, "activeConfiguration");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          v190 = objc_msgSend(v189, "backgroundReplacementEnabled");
          *(double *)&v191 = COERCE_DOUBLE("Off");
          if (v190)
            *(double *)&v191 = COERCE_DOUBLE("On");
          *(_DWORD *)buf = 138543618;
          v355 = v188;
          v356 = 2080;
          v357 = *(double *)&v191;
          _os_log_impl(&dword_227C5D000, v187, OS_LOG_TYPE_DEFAULT, "%{public}@ BackgroundReplacementEnabled %s", buf, 0x16u);

        }
        objc_msgSend(v4, "activeConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setBackgroundReplacement:", -[NSObject backgroundReplacementEnabled](v7, "backgroundReplacementEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v192, "isEqualToString:", CFSTR("AsyncStillCaptureConfigurations"));

    v194 = *(void **)(a1 + 32);
    if (v193)
    {
      objc_msgSend(v194, "value");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activeConfiguration");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "setAsyncStillCaptureConfigs:", v195);

      CMContinuityCaptureLog(2);
      v197 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
      {
        v198 = *(void **)(a1 + 40);
        objc_msgSend(v4, "activeConfiguration");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "asyncStillCaptureConfigs");
        v200 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543618;
        v355 = v198;
        v356 = 2112;
        v357 = v200;
        _os_log_impl(&dword_227C5D000, v197, OS_LOG_TYPE_DEFAULT, "%{public}@ AsyncStillCaptureConfigs %@", buf, 0x16u);

      }
      objc_msgSend(v4, "_updatePhotoOutputConfigs");
      goto LABEL_58;
    }
    objc_msgSend(v194, "name");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v201, "isEqualToString:", CFSTR("OverheadCameraMode"));

    if (v202)
    {
      objc_msgSend(v4, "activeConfiguration");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = objc_msgSend(v203, "deskViewCameraMode");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = objc_msgSend(v205, "unsignedIntValue");

      if (v204 != v206)
      {
        objc_msgSend(*(id *)(a1 + 32), "value");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        v208 = objc_msgSend(v207, "unsignedIntValue");
        objc_msgSend(v4, "activeConfiguration");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "setDeskViewCameraMode:", v208);

        CMContinuityCaptureLog(2);
        v210 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
        {
          v211 = *(void **)(a1 + 40);
          objc_msgSend(v4, "activeConfiguration");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v355 = v211;
          v356 = 1024;
          LODWORD(v357) = objc_msgSend(v212, "deskViewCameraMode");
          _os_log_impl(&dword_227C5D000, v210, OS_LOG_TYPE_DEFAULT, "%{public}@ DeskViewCameraMode %u", buf, 0x12u);

        }
        if (objc_msgSend(v4, "entity") == 2)
        {
          objc_msgSend(v4, "companionDevice");
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = objc_msgSend(v213, "isStreamingOnSuperWide");

          if (v214)
          {
            objc_msgSend(*(id *)(a1 + 32), "value");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = objc_msgSend(v215, "unsignedIntValue");
            objc_msgSend(v4, "companionDevice");
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "setDeskViewCameraMode:", v216);

          }
        }
        objc_msgSend(v4, "activeConfiguration");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDeskViewCameraMode:", -[NSObject deskViewCameraMode](v7, "deskViewCameraMode"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = objc_msgSend(v218, "isEqualToString:", CFSTR("StartPanningAtPoint"));

    if (v219)
    {
      point.x = NAN;
      point.y = NAN;
      objc_msgSend(*(id *)(a1 + 32), "value");
      v220 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGPointMakeWithDictionaryRepresentation(v220, &point);

      CMContinuityCaptureLog(2);
      v221 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
      {
        v222 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v355 = v222;
        v356 = 2080;
        v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
        v358 = 2048;
        x = point.x;
        v360 = 2048;
        y = point.y;
        _os_log_impl(&dword_227C5D000, v221, OS_LOG_TYPE_DEFAULT, "%{public}@ (%s) StartPanningAtPoint {%.3f, %.3f}", buf, 0x2Au);
      }

      objc_msgSend(v4, "videoDevice");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v352 = 0;
      objc_msgSend(v223, "lockForConfiguration:", &v352);
      v7 = v352;

      if (v7)
      {
        CMContinuityCaptureLog(2);
        v224 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_1(a1, v4);
        goto LABEL_143;
      }
      objc_msgSend(v4, "videoDevice");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "startPanningAtPoint:", point.x, point.y);
LABEL_142:

      objc_msgSend(v4, "videoDevice");
      v224 = objc_claimAutoreleasedReturnValue();
      -[NSObject unlockForConfiguration](v224, "unlockForConfiguration");
LABEL_143:

      goto LABEL_57;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = objc_msgSend(v225, "isEqualToString:", CFSTR("PanWithTranslation"));

    if (v226)
    {
      point.x = NAN;
      point.y = NAN;
      objc_msgSend(*(id *)(a1 + 32), "value");
      v227 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGPointMakeWithDictionaryRepresentation(v227, &point);

      CMContinuityCaptureLog(2);
      v228 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
      {
        v229 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v355 = v229;
        v356 = 2080;
        v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
        v358 = 2048;
        x = point.x;
        v360 = 2048;
        y = point.y;
        _os_log_impl(&dword_227C5D000, v228, OS_LOG_TYPE_DEFAULT, "%{public}@ (%s) PanWithTransaltion {%.3f, %.3f}", buf, 0x2Au);
      }

      objc_msgSend(v4, "videoDevice");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      v351 = 0;
      objc_msgSend(v230, "lockForConfiguration:", &v351);
      v7 = v351;

      if (v7)
      {
        CMContinuityCaptureLog(2);
        v224 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_1(a1, v4);
        goto LABEL_143;
      }
      objc_msgSend(v4, "videoDevice");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "panWithTranslation:", point.x, point.y);
      goto LABEL_142;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend(v231, "isEqualToString:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));

    if (v232)
    {
      objc_msgSend(v4, "activeConfiguration");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = objc_msgSend(v233, "maxFrameRate");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = objc_msgSend(v235, "unsignedIntValue");

      if (v234 == v236)
        goto LABEL_58;
      CMContinuityCaptureLog(2);
      v237 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
      {
        v238 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "value");
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v355 = v238;
        v356 = 1024;
        LODWORD(v357) = objc_msgSend(v239, "unsignedIntValue");
        _os_log_impl(&dword_227C5D000, v237, OS_LOG_TYPE_DEFAULT, "%{public}@ MaxFrameRate %u", buf, 0x12u);

      }
      objc_msgSend(*(id *)(a1 + 32), "value");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = objc_msgSend(v240, "unsignedIntValue");
      objc_msgSend(v4, "activeConfiguration");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "setMaxFrameRate:", v241);

      objc_msgSend(v4, "compositeDelegate");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "frameRateManager");
      v244 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      objc_msgSend(*(id *)&v244, "reportStreamStatus:forDevice:", objc_msgSend(v4, "streaming"), v4);
      objc_msgSend(*(id *)&v244, "allowedFrameRateRangeForDevice:", v4);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "maxFrameRate");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMaxFrameRate:", objc_msgSend(v246, "unsignedIntValue"));
LABEL_139:

      goto LABEL_140;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = objc_msgSend(v248, "isEqualToString:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));

    if (v249)
    {
      objc_msgSend(v4, "activeConfiguration");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = objc_msgSend(v250, "minFrameRate");
      objc_msgSend(*(id *)(a1 + 32), "value");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = objc_msgSend(v252, "unsignedIntValue");

      if (v251 == v253)
        goto LABEL_58;
      CMContinuityCaptureLog(2);
      v254 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
      {
        v255 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "value");
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v355 = v255;
        v356 = 1024;
        LODWORD(v357) = objc_msgSend(v256, "unsignedIntValue");
        _os_log_impl(&dword_227C5D000, v254, OS_LOG_TYPE_DEFAULT, "%{public}@ MinFrameRate %u", buf, 0x12u);

      }
      objc_msgSend(*(id *)(a1 + 32), "value");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      v258 = objc_msgSend(v257, "unsignedIntValue");
      objc_msgSend(v4, "activeConfiguration");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "setMinFrameRate:", v258);

      objc_msgSend(v4, "compositeDelegate");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "frameRateManager");
      v244 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      objc_msgSend(*(id *)&v244, "reportStreamStatus:forDevice:", objc_msgSend(v4, "streaming"), v4);
      objc_msgSend(*(id *)&v244, "allowedFrameRateRangeForDevice:", v4);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "minFrameRate");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMinFrameRate:", objc_msgSend(v246, "unsignedIntValue"));
      goto LABEL_139;
    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = objc_msgSend(v261, "isEqualToString:", CFSTR("PerformOneShotFraming"));

    if (v262)
    {
      CMContinuityCaptureLog(2);
      v263 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
        v264 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v355 = v264;
        v356 = 2080;
        v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
      }

      objc_msgSend(v4, "videoDevice");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      v350 = 0;
      objc_msgSend(v265, "lockForConfiguration:", &v350);
      v15 = v350;

      if (v15)
      {
        CMContinuityCaptureLog(2);
        v266 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR))
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_3();
LABEL_156:

        goto LABEL_60;
      }
      objc_msgSend(v4, "videoDevice");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "performOneShotFraming");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      v268 = objc_msgSend(v267, "isEqualToString:", CFSTR("ResetFraming"));

      if (!v268)
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = objc_msgSend(v272, "isEqualToString:", CFSTR("PortraitEffectAperture"));

        if (v273)
        {
          objc_msgSend(v4, "activeConfiguration");
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v274, "portraitEffectAperture");
          v276 = v275;
          objc_msgSend(*(id *)(a1 + 32), "value");
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "floatValue");
          v279 = v278;

          if (v276 != v279)
          {
            objc_msgSend(*(id *)(a1 + 32), "value");
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v280, "floatValue");
            v282 = v281;
            objc_msgSend(v4, "activeConfiguration");
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v284) = v282;
            objc_msgSend(v283, "setPortraitEffectAperture:", v284);

            CMContinuityCaptureLog(2);
            v285 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v285, OS_LOG_TYPE_DEFAULT))
            {
              v286 = *(void **)(a1 + 40);
              objc_msgSend(v4, "activeConfiguration");
              v287 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v287, "portraitEffectAperture");
              *(_DWORD *)buf = 138543618;
              v355 = v286;
              v356 = 2048;
              v357 = v288;
              _os_log_impl(&dword_227C5D000, v285, OS_LOG_TYPE_DEFAULT, "%{public}@ PortraitEffectAperture %f", buf, 0x16u);

            }
            objc_msgSend(*(id *)(a1 + 32), "value");
            v7 = objc_claimAutoreleasedReturnValue();
            -[NSObject floatValue](v7, "floatValue");
            objc_msgSend(v4, "setPortraitEffectAperture:");
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        objc_msgSend(*(id *)(a1 + 32), "name");
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        v291 = objc_msgSend(v290, "isEqualToString:", CFSTR("StudioLightingIntensity"));

        if (v291)
        {
          objc_msgSend(v4, "activeConfiguration");
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v292, "studioLightingIntensity");
          v294 = v293;
          objc_msgSend(*(id *)(a1 + 32), "value");
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v295, "floatValue");
          v297 = v296;

          if (v294 != v297)
          {
            objc_msgSend(*(id *)(a1 + 32), "value");
            v298 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v298, "floatValue");
            v300 = v299;
            objc_msgSend(v4, "activeConfiguration");
            v301 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v302) = v300;
            objc_msgSend(v301, "setStudioLightingIntensity:", v302);

            CMContinuityCaptureLog(2);
            v303 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
            {
              v304 = *(void **)(a1 + 40);
              objc_msgSend(v4, "activeConfiguration");
              v305 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v305, "studioLightingIntensity");
              *(_DWORD *)buf = 138543618;
              v355 = v304;
              v356 = 2048;
              v357 = v306;
              _os_log_impl(&dword_227C5D000, v303, OS_LOG_TYPE_DEFAULT, "%{public}@ StudioLightingIntensity %f", buf, 0x16u);

            }
            objc_msgSend(*(id *)(a1 + 32), "value");
            v7 = objc_claimAutoreleasedReturnValue();
            -[NSObject floatValue](v7, "floatValue");
            objc_msgSend(v4, "setStudioLightingIntensity:");
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        objc_msgSend(*(id *)(a1 + 32), "name");
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        v308 = objc_msgSend(v307, "isEqualToString:", CFSTR("GesturesEnabled"));

        if (v308)
        {
          objc_msgSend(v4, "activeConfiguration");
          v309 = (void *)objc_claimAutoreleasedReturnValue();
          v310 = (float)objc_msgSend(v309, "reactionEffectGesturesEnabled");
          objc_msgSend(*(id *)(a1 + 32), "value");
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v311, "floatValue");
          v313 = v312;

          if (v313 != v310)
          {
            objc_msgSend(*(id *)(a1 + 32), "value");
            v314 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v314, "floatValue");
            v316 = v315 != 0.0;
            objc_msgSend(v4, "activeConfiguration");
            v317 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v317, "setReactionEffectGesturesEnabled:", v316);

            CMContinuityCaptureLog(2);
            v318 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
            {
              v319 = *(void **)(a1 + 40);
              objc_msgSend(v4, "activeConfiguration");
              v320 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v355 = v319;
              v356 = 1024;
              LODWORD(v357) = objc_msgSend(v320, "reactionEffectGesturesEnabled");
              _os_log_impl(&dword_227C5D000, v318, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionEffectGesturesEnabled %d", buf, 0x12u);

            }
            objc_msgSend(*(id *)(a1 + 32), "value");
            v7 = objc_claimAutoreleasedReturnValue();
            -[NSObject floatValue](v7, "floatValue");
            objc_msgSend(v4, "setReactionEffectGesturesEnabled:");
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        objc_msgSend(*(id *)(a1 + 32), "name");
        v321 = (void *)objc_claimAutoreleasedReturnValue();
        v322 = objc_msgSend(v321, "isEqualToString:", CFSTR("BackgroundReplacementPixelBuffer"));

        v323 = *(void **)(a1 + 32);
        if (v322)
        {
          objc_msgSend(v323, "value");
          v324 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

          objc_msgSend(v4, "activeConfiguration");
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          v326 = objc_msgSend(v325, "backgroundReplacementPixelBuffer");

          if (v326 != *(_QWORD *)&v324)
          {
            objc_msgSend(v4, "activeConfiguration");
            v327 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v327, "setBackgroundReplacementPixelBuffer:", *(_QWORD *)&v324);

            CMContinuityCaptureLog(2);
            v328 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT))
            {
              v329 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v355 = v329;
              v356 = 2112;
              v357 = v324;
              _os_log_impl(&dword_227C5D000, v328, OS_LOG_TYPE_DEFAULT, "%{public}@ BackgroundReplacementPixelBuffer %@", buf, 0x16u);
            }

            objc_msgSend(v4, "setBackgroundReplacementPixelBuffer:", *(_QWORD *)&v324);
          }
          goto LABEL_58;
        }
        objc_msgSend(v323, "name");
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        v331 = objc_msgSend(v330, "isEqualToString:", CFSTR("CenterStageFieldOfViewRestrictedToWide"));

        if (v331)
        {
          CMContinuityCaptureLog(2);
          v332 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v332, OS_LOG_TYPE_DEFAULT))
          {
            v333 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 32), "value");
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            v335 = objc_msgSend(v334, "BOOLValue");
            *(double *)&v336 = COERCE_DOUBLE(CFSTR("NO"));
            if (v335)
              *(double *)&v336 = COERCE_DOUBLE(CFSTR("YES"));
            *(_DWORD *)buf = 138543874;
            v355 = v333;
            v356 = 2080;
            v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
            v358 = 2112;
            x = *(double *)&v336;

          }
          objc_msgSend(*(id *)(a1 + 32), "value");
          v337 = (void *)objc_claimAutoreleasedReturnValue();
          v338 = objc_msgSend(v337, "BOOLValue");
          objc_msgSend(v4, "activeConfiguration");
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setCenterStageFieldOfViewRestrictedToWide:", v338);

          objc_msgSend(v4, "activeConfiguration");
          v340 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v338) = objc_msgSend(v340, "isCenterStageForcefullyEnabled");

          if ((_DWORD)v338)
          {
            objc_msgSend(v4, "_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:", 0);
            objc_msgSend(v4, "companionDevice");
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v341, "_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:", 0);

          }
          objc_msgSend(v4, "activeConfiguration");
          v60 = objc_claimAutoreleasedReturnValue();
          -[NSObject setCenterStageEnabled:](v60, "setCenterStageEnabled:", 1);
          goto LABEL_56;
        }
        objc_msgSend(*(id *)(a1 + 32), "name");
        v342 = (void *)objc_claimAutoreleasedReturnValue();
        v343 = objc_msgSend(v342, "isEqualToString:", CFSTR("ManualFramingDeviceType"));

        if (!v343)
        {
          CMContinuityCaptureLog(2);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v348 = *(double *)(a1 + 32);
            v347 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v355 = v347;
            v356 = 2114;
            v357 = v348;
            _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ unhandled control %{public}@", buf, 0x16u);
          }
          goto LABEL_57;
        }
        objc_msgSend(*(id *)(a1 + 32), "value");
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        +[CMContinuityCaptureConfiguration stringForManualFramingDeviceType:](CMContinuityCaptureConfiguration, "stringForManualFramingDeviceType:", objc_msgSend(v344, "integerValue"));
        v244 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

        CMContinuityCaptureLog(2);
        v345 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v345, OS_LOG_TYPE_DEFAULT))
        {
          v346 = objc_loadWeakRetained(v2);
          *(_DWORD *)buf = 138543874;
          v355 = v346;
          v356 = 2080;
          v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
          v358 = 2112;
          x = v244;

        }
        objc_msgSend(*(id *)(a1 + 32), "value");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_updateManualFramingDeviceType:", objc_msgSend(v245, "integerValue"));
LABEL_140:

        goto LABEL_58;
      }
      CMContinuityCaptureLog(2);
      v269 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
      {
        v270 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v355 = v270;
        v356 = 2080;
        v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
      }

      objc_msgSend(v4, "videoDevice");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      v349 = 0;
      objc_msgSend(v271, "lockForConfiguration:", &v349);
      v15 = v349;

      if (v15)
      {
        CMContinuityCaptureLog(2);
        v266 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR))
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_4();
        goto LABEL_156;
      }
      objc_msgSend(v4, "videoDevice");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "resetFraming");
    }

    objc_msgSend(v4, "videoDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject unlockForConfiguration](v7, "unlockForConfiguration");
    goto LABEL_57;
  }
  objc_msgSend(v4, "activeConfiguration");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "suppressVideoEffects");
  objc_msgSend(*(id *)(a1 + 32), "value");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "BOOLValue");

  if (v109 != v111)
  {
    objc_msgSend(*(id *)(a1 + 32), "value");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v112, "BOOLValue");
    objc_msgSend(v4, "activeConfiguration");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setSuppressVideoEffects:", v113);

    CMContinuityCaptureLog(2);
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      v116 = *(void **)(a1 + 40);
      objc_msgSend(v4, "activeConfiguration");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v117, "suppressVideoEffects");
      *(double *)&v119 = COERCE_DOUBLE("Off");
      if (v118)
        *(double *)&v119 = COERCE_DOUBLE("On");
      *(_DWORD *)buf = 138543618;
      v355 = v116;
      v356 = 2080;
      v357 = *(double *)&v119;
      _os_log_impl(&dword_227C5D000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@ SuppressVideoEffects %s", buf, 0x16u);

    }
    objc_msgSend(v4, "activeConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSuppressVideoEffects:", -[NSObject suppressVideoEffects](v7, "suppressVideoEffects"));
    goto LABEL_57;
  }
LABEL_58:
  v102 = (void *)*((_QWORD *)v4 + 44);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "objectForKey:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    v105 = (void *)*((_QWORD *)v4 + 44);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "removeObjectForKey:", v15);
LABEL_60:

  }
LABEL_61:

}

- (void)_updatePhotoOutputConfigs
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  CMContinuityCaptureRemoteVideoDevice *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "asyncStillCaptureEnabled");

  if ((v4 & 1) != 0)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v8, "maxPhotoQualityPrioritization") <= 0)
    {

    }
    else
    {
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "maxPhotoQualityPrioritization");

      if (v6 <= 3)
      {
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[AVCapturePhotoOutput setMaxPhotoQualityPrioritization:](self->_photoOutput, "setMaxPhotoQualityPrioritization:", (int)objc_msgSend(v9, "maxPhotoQualityPrioritization"));

      }
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip updating photo output configs when asyncStillCaptureEnabled is Off", buf, 0xCu);
    }

  }
}

- (BOOL)_shouldPrintDroppedSampleBufferLog:(int64_t)a3
{
  return a3 < 5 || 0xEEEEEEEEEEEEEEEFLL * a3 < 0x1111111111111112;
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CMContinuityCaptureRemoteVideoDevice *v14;
  NSMutableDictionary *photoRequests;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  CMContinuityCaptureRemoteVideoDevice *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  int v32;
  BOOL v33;
  CMContinuityCaptureRemoteVideoDevice *v34;
  uint64_t v35;
  void *v36;
  CMClockRef HostTimeClock;
  void *v38;
  const void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  CMTime time;
  CMTime v47;
  CMTime buf;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    objc_sync_enter(v14);
    photoRequests = v14->_photoRequests;
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "resolvedSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "uniqueID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](photoRequests, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    objc_sync_exit(v14);
    if (v20)
    {
      objc_msgSend(v20, "setCaptureComplete:", v10 == 0);
      objc_msgSend(v20, "setError:", v10);
      objc_msgSend(v9, "fileDataRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setImageFileData:", v21);

      objc_msgSend(v9, "resolvedSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "photoDimensions");

      objc_msgSend(v20, "compressedFormat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      v26 = v14;
      v27 = v9;
      v28 = v12;
      v29 = v10;
      v30 = v13;
      v31 = v8;
      v32 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDB22A0]);

      v33 = v32 == 0;
      v8 = v31;
      v13 = v30;
      v10 = v29;
      v12 = v28;
      v9 = v27;
      v34 = v26;
      v20 = v25;
      if (v33)
        v35 = 1785750887;
      else
        v35 = 1752589105;
      objc_msgSend(v25, "setImageCodecType:", v35);
      objc_msgSend(v25, "setImageWidth:", v23);
      objc_msgSend(v25, "setImageHeight:", HIDWORD(v23));
      objc_msgSend(v13, "timeSyncClock");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        HostTimeClock = CMClockGetHostTimeClock();
        -[CMContinuityCaptureRemoteVideoDevice captureSession](v34, "captureSession");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (const void *)objc_msgSend(v38, "synchronizationClock");

        memset(&buf, 170, sizeof(buf));
        if (v9)
          objc_msgSend(v9, "timestamp");
        else
          memset(&buf, 0, sizeof(buf));
        time = buf;
        memset(&v47, 170, sizeof(v47));
        CMSyncConvertTime(&v47, &time, v39, HostTimeClock);
        objc_msgSend(v13, "timeSyncClock");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        time = v47;
        v41 = objc_msgSend(v40, "domainTimeForMachAbsoluteTime:", CMClockConvertHostTimeToSystemUnits(&time));

        if (v41 != *MEMORY[0x24BEB70D8])
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setNetworkTimestamp:", v42);

        }
      }
      CMContinuityCaptureLog(2);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = -[CMContinuityCaptureDeviceBase entity](v34, "entity");
        LODWORD(buf.value) = 138543874;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
        LOWORD(buf.flags) = 2112;
        *(_QWORD *)((char *)&buf.flags + 2) = v20;
        HIWORD(buf.epoch) = 2048;
        v49 = v44;
        _os_log_impl(&dword_227C5D000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Captured photo for %@, entity:%ld", (uint8_t *)&buf, 0x20u);
      }

      -[CMContinuityCaptureDeviceBase transportDevice](v34, "transportDevice");
      v45 = objc_claimAutoreleasedReturnValue();
      -[NSObject didCaptureStillImage:entity:](v45, "didCaptureStillImage:entity:", v20, -[CMContinuityCaptureDeviceBase entity](v34, "entity"));
    }
    else
    {
      CMContinuityCaptureLog(2);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice captureOutput:didFinishProcessingPhoto:error:].cold.1();
    }

  }
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  CMContinuityCaptureRemoteVideoDevice *v12;
  NSMutableDictionary *photoRequests;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSObject *v19;
  int v20;
  CMContinuityCaptureRemoteVideoDevice *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "uniqueID");
  v12 = self;
  objc_sync_enter(v12);
  photoRequests = v12->_photoRequests;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](photoRequests, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  v17 = v12->_photoRequests;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", 0, v18);

  objc_sync_exit(v12);
  CMContinuityCaptureLog(2);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543874;
    v21 = v12;
    v22 = 2048;
    v23 = v11;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ DidFinishCapture for captureID:%lld. Removed %@ from photoRequests", (uint8_t *)&v20, 0x20u);
  }

}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  CMClockRef HostTimeClock;
  void *v16;
  const void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  CMTime v39;
  CMTime v40;
  CMTime time;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue", a3, a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const __CFString *)*MEMORY[0x24BE10868];
    CMGetAttachment(a4, (CFStringRef)*MEMORY[0x24BE10868], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CMSetAttachment(a4, v11, v12, 1u);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v10, "currentSessionID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("ContinuityCaptureRemoteSessionID"));

    objc_msgSend(v10, "timeSyncClock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      HostTimeClock = CMClockGetHostTimeClock();
      -[CMContinuityCaptureRemoteVideoDevice captureSession](self, "captureSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (const void *)objc_msgSend(v16, "synchronizationClock");

      memset(&v40, 170, sizeof(v40));
      CMSampleBufferGetPresentationTimeStamp(&v40, a4);
      memset(&v39, 170, sizeof(v39));
      time = v40;
      CMSyncConvertTime(&v39, &time, v17, HostTimeClock);
      objc_msgSend(v10, "timeSyncClock");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      time = v39;
      v19 = objc_msgSend(v18, "domainTimeForMachAbsoluteTime:", CMClockConvertHostTimeToSystemUnits(&time));

      objc_msgSend(v10, "timeSyncClock");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "grandMasterIdentifier");

      if (v19 != *MEMORY[0x24BEB70D8])
      {
        if (CMContinityCaptureDebugLogEnabled())
        {
          CMContinuityCaptureLog(2);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(time.value) = 138543874;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
            LOWORD(time.flags) = 2048;
            *(_QWORD *)((char *)&time.flags + 2) = v19;
            HIWORD(time.epoch) = 2048;
            v42 = v21;
            _os_log_debug_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ networkTime %llx identity %llx", (uint8_t *)&time, 0x20u);
          }

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("NetworkTime"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("NetworkTimeClockIdentity"));

      }
    }
    if (self->_metadataOutput)
    {
      CMGetAttachment(a4, (CFStringRef)*MEMORY[0x24BE107F8], 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metadataOutput, "availableMetadataObjectTypes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDB1E98]);

        if (v28)
        {
          v29 = *MEMORY[0x24BE10918];
          objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BE10918]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v29);

        }
        -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metadataOutput, "availableMetadataObjectTypes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "containsObject:", *MEMORY[0x24BDB1EA0]);

        if (v32)
        {
          v33 = *MEMORY[0x24BE10910];
          objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BE10910]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, v33);

        }
        -[AVCaptureMetadataOutput availableMetadataObjectTypes](self->_metadataOutput, "availableMetadataObjectTypes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "containsObject:", *MEMORY[0x24BDB1EA8]);

        if (v36)
        {
          v37 = *MEMORY[0x24BE10920];
          objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BE10920]);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, v37);

        }
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE10B70]);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24F07F858, *MEMORY[0x24BE10B78]);

      }
      CMGetAttachment(a4, (CFStringRef)*MEMORY[0x24BE10808], 0);

    }
    if (self->_captureStackActive && self->_propagateCaptureSessionRestartedAttachment)
    {
      self->_propagateCaptureSessionRestartedAttachment = 0;
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("CaptureSessionRestarted"));
    }
    -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:](self, "dispatchFrame:entity:completion:", a4, -[CMContinuityCaptureDeviceBase entity](self, "entity"), &__block_literal_global_85_0);

  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  unint64_t *p_videoBufferDropCounter;
  NSObject *v7;
  NSObject *v8;

  p_videoBufferDropCounter = &self->_videoBufferDropCounter;
  ++self->_videoBufferDropCounter;
  -[CMContinuityCaptureDeviceBase queue](self, "queue", a3, a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[CMContinuityCaptureRemoteVideoDevice _shouldPrintDroppedSampleBufferLog:](self, "_shouldPrintDroppedSampleBufferLog:", *p_videoBufferDropCounter))
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice captureOutput:didDropSampleBuffer:fromConnection:].cold.1();

  }
}

- (void)_registerDockKitNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Failed to soft link DockKit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

void __68__CMContinuityCaptureRemoteVideoDevice__registerDockKitNotification__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("disabled");
      if (a2)
        v5 = CFSTR("enabled");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "[dock] DockKit device is %@. Restarting the stream.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(WeakRetained, "compositeDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), objc_msgSend(WeakRetained, "entity"), 0);

  }
}

- (BOOL)_dockKitNotificationAgentIsTracking
{
  return -[DKNotificationAgent isTracking](self->_dockKitNotificationAgent, "isTracking");
}

- (BOOL)isDockedTrackingEnabled
{
  return -[AVCaptureDevice isDockedTrackingEnabled](self->_videoDevice, "isDockedTrackingEnabled");
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  CMContinuityCaptureRemoteVideoDevice *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = -[AVCaptureDevice lockForConfiguration:](self->_videoDevice, "lockForConfiguration:", 0);
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v3)
        v8 = CFSTR("YES");
      v9 = 138543874;
      v10 = self;
      v11 = 2080;
      v12 = "-[CMContinuityCaptureRemoteVideoDevice setDockedTrackingEnabled:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "[dock] %{public}@ %s docked tracking enabled: %@", (uint8_t *)&v9, 0x20u);
    }

    -[AVCaptureDevice setDockedTrackingEnabled:](self->_videoDevice, "setDockedTrackingEnabled:", v3);
    -[AVCaptureDevice unlockForConfiguration](self->_videoDevice, "unlockForConfiguration");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteVideoDevice setDockedTrackingEnabled:].cold.1();

  }
}

- (CMContinuityCaptureRemoteVideoDevice)companionDevice
{
  return (CMContinuityCaptureRemoteVideoDevice *)objc_loadWeakRetained((id *)&self->_companionDevice);
}

- (void)setCompanionDevice:(id)a3
{
  objc_storeWeak((id *)&self->_companionDevice, a3);
}

- (CMContinuityCaptureAVCaptureVideoSession)captureSession
{
  return (CMContinuityCaptureAVCaptureVideoSession *)objc_getProperty(self, a2, 400, 1);
}

- (BOOL)shouldRestoreCenterStageOnWideCamera
{
  return self->_shouldRestoreCenterStageOnWideCamera;
}

- (void)setShouldRestoreCenterStageOnWideCamera:(BOOL)a3
{
  self->_shouldRestoreCenterStageOnWideCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_destroyWeak((id *)&self->_companionDevice);
  objc_storeStrong((id *)&self->_dockKitNotificationAgent, 0);
  objc_storeStrong((id *)&self->_cameraCaptureStreamSessionID, 0);
  objc_storeStrong((id *)&self->_cmControlByNameWithPendingUpdates, 0);
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_videoDataConnection, 0);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_videoDevice, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_videoDataInput, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_avcStreamInput, 0);
  objc_storeStrong((id *)&self->_avcVideoStream, 0);
  objc_storeStrong((id *)&self->_photoRequests, 0);
}

- (void)setFaceDrivenAFActive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ No video device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setDeskViewCameraMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ No video device or support for overhead mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setVideoZoomFactor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, v0, v1, "%{public}@ No video device or Center Stage enabled. Cannot set the zoomFactor to %f", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)setVideoZoomFactor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, v0, v1, "%{public}@ Only deskcam device is streaming. Skip setting the zoomFactor to %f", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)setMaxFrameRate:(NSObject *)a3 .cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "activeFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, a3, v5, "%{public}@ No video format for %@", v6);

  OUTLINED_FUNCTION_13_0();
}

- (void)setMaxFrameRate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_20(&dword_227C5D000, v0, v1, "%{public}@ Invalid framerate %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setCenterStageEnabled:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ No active format for %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)setCenterStageRectOfInterest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ No video device or center stage is NOT enabled or failed to convert centerStageRectOfInterest dictionary to a CGRect.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_avfDeviceTypeForManualFramingDeviceType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ unsupported device type: %ld");
  OUTLINED_FUNCTION_1_0();
}

- (void)connectionsForConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ Error creating device input: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)configureConnections
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(*(id *)(v1 + 288), "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v4, v5, " %@ Unable to find compatible device format for %@ configuration %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_15();
}

- (void)_deviceFormat:(NSObject *)a3 isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "isPortraitEffectSupported");
  v7 = 138544130;
  v8 = a1;
  OUTLINED_FUNCTION_15_0();
  v9 = "-[CMContinuityCaptureRemoteVideoDevice _deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFr"
       "ameRate:maxFrameRate:]";
  v10 = 2112;
  v11 = a2;
  v12 = 1024;
  v13 = v6;
  _os_log_debug_impl(&dword_227C5D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ %s Available Format %@ pb supported %d", (uint8_t *)&v7, 0x26u);
  OUTLINED_FUNCTION_15();
}

- (void)startCameraCaptureStack:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ Invalid connections", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchFrame:entity:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_23();
  _os_log_debug_impl(&dword_227C5D000, v0, OS_LOG_TYPE_DEBUG, "%@ frame dispatch delta %lld", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchFrame:entity:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ pushSampleBuffer %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCVideoInput Error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCVideoStream %p Invalid configuration");
  OUTLINED_FUNCTION_1_0();
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "videoDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v3, v4, "%{public}@ (%s) Failed to lock device %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_15();
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Failed to lock device when performing one-shot framing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Failed to lock device when resetting framing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)captureOutput:didFinishProcessingPhoto:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ captured photo %@ but couldn't find paired stillImageRequest from remote side.");
  OUTLINED_FUNCTION_1_0();
}

- (void)captureOutput:didDropSampleBuffer:fromConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ Dropped %llu buffers");
  OUTLINED_FUNCTION_1_0();
}

- (void)setDockedTrackingEnabled:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v0, "videoDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v3, v4, "[dock] %{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_15();
}

@end
