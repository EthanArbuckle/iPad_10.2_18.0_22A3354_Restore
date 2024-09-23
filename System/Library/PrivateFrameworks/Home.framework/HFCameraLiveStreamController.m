@implementation HFCameraLiveStreamController

- (HFCameraLiveStreamController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_cameraProfile_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraLiveStreamController.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCameraLiveStreamController init]",
    v5);

  return 0;
}

- (HFCameraLiveStreamController)initWithHome:(id)a3 cameraProfile:(id)a4
{
  id v7;
  id v8;
  HFCameraLiveStreamController *v9;
  HFCameraLiveStreamController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFCameraLiveStreamController;
  v9 = -[HFCameraLiveStreamController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addCameraObserver:", v10);

    v10->_startStreamingAfterStop = 0;
    v10->_inferredStreamState = 4;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  HFCameraLiveStreamController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    HFLogForCategory(0x1CuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%@ dealloc for name:%@. Stop streaming requested.", buf, 0x16u);

    }
    -[HFCameraLiveStreamController stopStreaming](self, "stopStreaming");
  }
  v7.receiver = self;
  v7.super_class = (Class)HFCameraLiveStreamController;
  -[HFCameraLiveStreamController dealloc](&v7, sel_dealloc);
}

- (unint64_t)streamState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "streamState");

  return v4;
}

- (HMCameraSource)liveCameraSource
{
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  HFCameraLiveStreamController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[HFCameraLiveStreamController streamState](self, "streamState");
  HFLogForCategory(0x18uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 2)
  {
    if (v5)
    {
      -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = self;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Displaying stream control for profile:%@/%@", (uint8_t *)&v18, 0x20u);

    }
    -[HFCameraLiveStreamController activeStream](self, "activeStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = self;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Displaying liveCameraSource snapshot for profile:%@/%@", (uint8_t *)&v18, 0x20u);

    }
    -[HFCameraLiveStreamController mostRecentSnapshot](self, "mostRecentSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HMCameraSource *)v11;
}

- (NSError)streamError
{
  void *v2;
  void *v3;
  void *v4;

  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_cameraManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedStreamError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

- (void)startStreaming
{
  void *v3;
  id v4;

  if (-[HFCameraLiveStreamController inferredStreamState](self, "inferredStreamState") == 3)
  {
    -[HFCameraLiveStreamController setStartStreamingAfterStop:](self, "setStartStreamingAfterStop:", 1);
  }
  else
  {
    self->_inferredStreamState = 1;
    -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_cameraManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginContinuousStreamingWithRequester:", self);

  }
}

- (void)stopStreaming
{
  void *v3;
  id v4;

  if (-[HFCameraLiveStreamController inferredStreamState](self, "inferredStreamState") != 4)
    -[HFCameraLiveStreamController setInferredStreamState:](self, "setInferredStreamState:", 3);
  -[HFCameraLiveStreamController setStartStreamingAfterStop:](self, "setStartStreamingAfterStop:", 0);
  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_cameraManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endContinuousStreamingWithRequester:", self);

}

- (BOOL)isStreamingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_cameraManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuousStreamingEnabled");

  return v4;
}

- (void)setStreamAudioEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  HFCameraLiveStreamController *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_streamAudioEnabled != a3)
  {
    v3 = a3;
    self->_streamAudioEnabled = a3;
    HFLogForCategory(0x1CuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Updating stream audio state to %d", (uint8_t *)&v6, 0x12u);
    }

    -[HFCameraLiveStreamController _updateAudioManagerState](self, "_updateAudioManagerState");
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  HFCameraLiveStreamController *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_microphoneEnabled != a3)
  {
    v3 = a3;
    self->_microphoneEnabled = a3;
    HFLogForCategory(0x1CuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Updating microphone state to %d", (uint8_t *)&v6, 0x12u);
    }

    -[HFCameraLiveStreamController _updateAudioManagerState](self, "_updateAudioManagerState");
  }
}

- (void)setStreamAudioVolume:(float)a3
{
  NSObject *v5;
  int v6;
  HFCameraLiveStreamController *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_streamAudioVolume != a3)
  {
    self->_streamAudioVolume = a3;
    HFLogForCategory(0x1CuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2048;
      v9 = a3;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Updating stream audio volume to %f", (uint8_t *)&v6, 0x16u);
    }

    -[HFCameraLiveStreamController _updateAudioManagerState](self, "_updateAudioManagerState");
  }
}

- (id)activeStream
{
  void *v2;
  void *v3;
  void *v4;

  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mostRecentSnapshot
{
  void *v2;
  void *v3;
  void *v4;

  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mostRecentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateAudioManagerState
{
  void *v3;
  void *v4;
  HFCameraAudioManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFCameraAudioManager *v10;
  NSObject *v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  float v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  NSObject *v27;
  float v28;
  void *v29;
  id v30;
  float v31;
  int v32;
  HFCameraLiveStreamController *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[HFCameraLiveStreamController activeStream](self, "activeStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFCameraLiveStreamController audioManager](self, "audioManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = [HFCameraAudioManager alloc];
      -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraLiveStreamController activeStream](self, "activeStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraLiveStreamController home](self, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_characteristicValueManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HFCameraAudioManager initWithCameraProfile:cameraStream:valueManager:](v5, "initWithCameraProfile:cameraStream:valueManager:", v6, v7, v9);
      -[HFCameraLiveStreamController setAudioManager:](self, "setAudioManager:", v10);

    }
  }
  else
  {
    -[HFCameraLiveStreamController setAudioManager:](self, "setAudioManager:", 0);
  }
  HFLogForCategory(0x1CuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraLiveStreamController audioManager](self, "audioManager");
    v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v13 = -[HFCameraLiveStreamController isStreamAudioEnabled](self, "isStreamAudioEnabled");
    v14 = -[HFCameraLiveStreamController isMicrophoneEnabled](self, "isMicrophoneEnabled");
    -[HFCameraLiveStreamController streamAudioVolume](self, "streamAudioVolume");
    v32 = 138413314;
    v33 = self;
    v34 = 2112;
    v35 = v12;
    v36 = 1024;
    v37 = v13;
    v38 = 1024;
    v39 = v14;
    v40 = 2048;
    v41 = v15;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@ Updating audio manager state with manager: %@, stream audio enabled: %d, microphone enabled: %d, stream audio volume: %f", (uint8_t *)&v32, 0x2Cu);

  }
  -[HFCameraLiveStreamController audioManager](self, "audioManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HFCameraLiveStreamController _derivedAudioStreamSetting](self, "_derivedAudioStreamSetting");
    -[HFCameraLiveStreamController audioManager](self, "audioManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "audioStreamSetting");

    if (v17 != v19)
    {
      -[HFCameraLiveStreamController audioManager](self, "audioManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v20, "updateAudioStreamSetting:", -[HFCameraLiveStreamController _derivedAudioStreamSetting](self, "_derivedAudioStreamSetting"));

    }
    -[HFCameraLiveStreamController streamAudioVolume](self, "streamAudioVolume");
    v23 = v22;
    -[HFCameraLiveStreamController audioManager](self, "audioManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "incomingAudioVolume");
    v26 = v25;

    if (v23 != v26)
    {
      if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
      {
        HFLogForCategory(0x1CuLL);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          -[HFCameraLiveStreamController streamAudioVolume](self, "streamAudioVolume");
          v32 = 138412546;
          v33 = self;
          v34 = 2048;
          v35 = v28;
          _os_log_impl(&dword_1DD34E000, v27, OS_LOG_TYPE_DEFAULT, "%@ Performing volume update to %.02f on Mac", (uint8_t *)&v32, 0x16u);
        }

        -[HFCameraLiveStreamController audioManager](self, "audioManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCameraLiveStreamController streamAudioVolume](self, "streamAudioVolume");
        v30 = (id)objc_msgSend(v29, "setIncomingAudioVolume:");
      }
      else
      {
        -[HFCameraLiveStreamController audioManager](self, "audioManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "incomingAudioVolume");
        self->_streamAudioVolume = v31;
      }

    }
  }
}

- (unint64_t)_derivedAudioStreamSetting
{
  if (-[HFCameraLiveStreamController isMicrophoneEnabled](self, "isMicrophoneEnabled"))
    return 3;
  if (-[HFCameraLiveStreamController isStreamAudioEnabled](self, "isStreamAudioEnabled"))
    return 2;
  return 1;
}

- (void)cameraStreamControlDidUpdateStreamState:(id)a3
{
  id v4;

  -[HFCameraLiveStreamController _updateAudioManagerState](self, "_updateAudioManagerState", a3);
  -[HFCameraLiveStreamController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streamControllerStateDidUpdate:", self);

}

- (void)cameraStreamControlDidUpdateManagerState:(id)a3
{
  id v4;

  -[HFCameraLiveStreamController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streamControllerStateDidUpdate:", self);

}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HFCameraLiveStreamController liveCameraSource](self, "liveCameraSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mostRecentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[HFCameraLiveStreamController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "streamControllerStateDidUpdate:", self);

  }
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  -[HFCameraLiveStreamController setInferredStreamState:](self, "setInferredStreamState:", 2);
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  -[HFCameraLiveStreamController setInferredStreamState:](self, "setInferredStreamState:", 4, a4);
  if (-[HFCameraLiveStreamController startStreamingAfterStop](self, "startStreamingAfterStop"))
  {
    -[HFCameraLiveStreamController setStartStreamingAfterStop:](self, "setStartStreamingAfterStop:", 0);
    -[HFCameraLiveStreamController startStreaming](self, "startStreaming");
  }
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFCameraLiveStreamController isStreamingEnabled](self, "isStreamingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCameraLiveStreamController streamState](self, "streamState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraLiveStreamController streamError](self, "streamError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFCameraLiveStreamController isMicrophoneEnabled](self, "isMicrophoneEnabled");
  v6 = -[HFCameraLiveStreamController isStreamAudioEnabled](self, "isStreamAudioEnabled");
  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "streamControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraLiveStreamController cameraProfile](self, "cameraProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mostRecentSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("\n%@ - profile:%@/%@ StreamingEnabled:%d Stream State:%@ Stream Error:%@ Microphone Enabled:%d Stream Audio Enabled:%d CameraStream:%@ Snapshot:%@"), self, v17, v16, v15, v3, v4, v5, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  HFCameraLiveStreamController *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x1AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_INFO, "%@ settings updated:%@", (uint8_t *)&v6, 0x16u);
  }

}

- (HFCameraLiveStreamControllerDelegate)delegate
{
  return (HFCameraLiveStreamControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isStreamAudioEnabled
{
  return self->_streamAudioEnabled;
}

- (float)streamAudioVolume
{
  return self->_streamAudioVolume;
}

- (HMHome)home
{
  return self->_home;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HFCameraAudioManager)audioManager
{
  return self->_audioManager;
}

- (void)setAudioManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioManager, a3);
}

- (unint64_t)inferredStreamState
{
  return self->_inferredStreamState;
}

- (void)setInferredStreamState:(unint64_t)a3
{
  self->_inferredStreamState = a3;
}

- (BOOL)startStreamingAfterStop
{
  return self->_startStreamingAfterStop;
}

- (void)setStartStreamingAfterStop:(BOOL)a3
{
  self->_startStreamingAfterStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioManager, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_liveCameraSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
