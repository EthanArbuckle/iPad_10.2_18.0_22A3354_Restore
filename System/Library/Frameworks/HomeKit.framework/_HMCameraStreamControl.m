@implementation _HMCameraStreamControl

- (_HMCameraStreamControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4
{
  _HMCameraStreamControl *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HMCameraStreamControl;
  result = -[_HMCameraControl initWithCameraProfile:profileUniqueIdentifier:](&v5, sel_initWithCameraProfile_profileUniqueIdentifier_, a3, a4);
  if (result)
    result->_streamState = 4;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_HMCameraControl context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  v5.receiver = self;
  v5.super_class = (Class)_HMCameraStreamControl;
  -[_HMCameraStreamControl dealloc](&v5, sel_dealloc);
}

- (void)__configureWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HMCameraStreamControl;
  -[_HMCameraControl __configureWithContext:](&v12, sel___configureWithContext_, v4);
  -[_HMCameraControl context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:selector:", CFSTR("HMCameraStreamStoppedMessage"), self, sel__handleVideoStreamStopped_);

  objc_initWeak(&location, self);
  -[_HMCameraControl context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xpcClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49___HMCameraStreamControl___configureWithContext___block_invoke;
  v9[3] = &unk_1E3AB61D0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "registerReconnectionHandler:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (HMCameraStream)cameraStream
{
  os_unfair_lock_s *p_lock;
  HMCameraStream *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cameraStream;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)streamState
{
  os_unfair_lock_s *p_lock;
  unint64_t streamState;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  streamState = self->_streamState;
  os_unfair_lock_unlock(p_lock);
  return streamState;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamSessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraStream, 0);
}

- (_HMCameraStreamControlDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (_HMCameraStreamControlDelegate *)WeakRetained;
}

- (void)setCameraStream:(id)a3
{
  HMCameraStream *v4;
  HMCameraStream *cameraStream;

  v4 = (HMCameraStream *)a3;
  os_unfair_lock_lock_with_options();
  cameraStream = self->_cameraStream;
  self->_cameraStream = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setStreamState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_streamState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)streamSessionID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_streamSessionID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStreamSessionID:(id)a3
{
  NSString *v4;
  NSString *streamSessionID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  streamSessionID = self->_streamSessionID;
  self->_streamSessionID = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_resetStateWithError:(id)a3
{
  id v4;
  void *v5;
  _HMCameraStreamControl *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting all the stream control state with error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[_HMCameraStreamControl setCameraStream:](v6, "setCameraStream:", 0);
  -[_HMCameraStreamControl setStreamSessionID:](v6, "setStreamSessionID:", 0);
  -[_HMCameraStreamControl setStreamState:](v6, "setStreamState:", 4);
  -[_HMCameraStreamControl _callVideoStoppedDelegate:](v6, "_callVideoStoppedDelegate:", v4);

}

- (void)_handleVideoStreamStopped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _HMCameraStreamControl *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _HMCameraStreamControl *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _HMCameraStreamControl *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMCameraStreamControl streamSessionID](self, "streamSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringForKey:", CFSTR("kCameraSessionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
    {
      objc_msgSend(v4, "errorForKey:", CFSTR("kCameraSessionError"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v11;
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Video stream has stopped for the session ID %@ with error %@", (uint8_t *)&v20, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      -[_HMCameraStreamControl _resetStateWithError:](v9, "_resetStateWithError:", v7);

    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v19;
        v22 = 2112;
        v23 = v6;
        v24 = 2112;
        v25 = v5;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring stopped stream session ID %@ that does not match current stream session ID: %@", (uint8_t *)&v20, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring stream stopped message because there is no current stream", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)startStreamWithPreferences:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  _HMCameraStreamControl *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _HMCameraStreamControl *v13;
  NSObject *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _HMCameraStreamControl *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  void *v38;
  _HMCameraStreamControl *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  -[_HMCameraControl context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v10;
      v43 = 2112;
      v44 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting stream with preferences: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[_HMCameraStreamControl streamSessionID](v7, "streamSessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = v7;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMCameraStreamControl streamSessionID](v13, "streamSessionID");
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v15;
        v43 = 2112;
        v44 = v16;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Stream session is already in progress: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl _callVideoStoppedDelegate:](v13, "_callVideoStoppedDelegate:", v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[_HMCameraStreamControl setStreamSessionID:](v7, "setStreamSessionID:", v20);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl streamSessionID](v7, "streamSessionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("kCameraSessionID"));

      if (v4)
      {
        encodeRootObject(v4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("kCameraSessionPreference"));

      }
      v24 = objc_alloc(MEMORY[0x1E0D285F8]);
      v25 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[_HMCameraControl profileUniqueIdentifier](v7, "profileUniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithTarget:", v26);
      v28 = (void *)objc_msgSend(v24, "initWithName:destination:payload:", CFSTR("HMCameraStreamNegotiateStreamMessage"), v27, v21);

      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __53___HMCameraStreamControl_startStreamWithPreferences___block_invoke;
      v38 = &unk_1E3AB6200;
      v39 = v7;
      v29 = v20;
      v40 = v29;
      v30 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v28, "setResponseHandler:", &v35));
      v31 = v7;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v33;
        v43 = 2112;
        v44 = (const char *)v29;
        _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_INFO, "%{public}@Sending negotiate stream message for session ID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v5, "messageDispatcher", v35, v36, v37, v38, v39);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sendMessage:", v28);

      -[_HMCameraStreamControl setStreamState:](v31, "setStreamState:", 1);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v18;
      v43 = 2080;
      v44 = "-[_HMCameraStreamControl startStreamWithPreferences:]";
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_handleStreamStartedWithResponse:(id)a3 sessionID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _HMCameraStreamControl *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _HMCameraStreamControl *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _HMCameraStreamControl *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMCameraStream *v31;
  void *v32;
  void *v33;
  HMCameraStream *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HMCameraStreamControl streamSessionID](self, "streamSessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if ((v12 & 1) != 0)
  {
    if (v10)
    {
      v13 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v16;
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to start video stream: %@", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[_HMCameraStreamControl _resetStateWithError:](v14, "_resetStateWithError:", v10);
    }
    else
    {
      objc_msgSend(v8, "hmf_stringForKey:", CFSTR("kCameraSessionID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl setStreamSessionID:](self, "setStreamSessionID:", v22);

      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMCameraStreamControl streamSessionID](v24, "streamSessionID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v26;
        v39 = 2112;
        v40 = v27;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Successfully started video stream for session ID: %@", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kSlotIdentifierKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kAudioStreamSetting"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kSourceAspectRatioKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = [HMCameraStream alloc];
      -[_HMCameraControl profileUniqueIdentifier](v24, "profileUniqueIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl streamSessionID](v24, "streamSessionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[HMCameraStream initWithProfileUniqueIdentifier:sessionID:slotIdentifier:aspectRatio:audioStreamSetting:](v31, "initWithProfileUniqueIdentifier:sessionID:slotIdentifier:aspectRatio:audioStreamSetting:", v32, v33, v28, v30, objc_msgSend(v29, "unsignedIntegerValue"));
      -[_HMCameraStreamControl setCameraStream:](v24, "setCameraStream:", v34);

      -[_HMCameraControl context](v24, "context");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl cameraStream](v24, "cameraStream");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setContext:", v35);

      -[_HMCameraStreamControl setStreamState:](v24, "setStreamState:", 2);
      -[_HMCameraStreamControl _callVideoStartedDelegate](v24, "_callVideoStartedDelegate");

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl streamSessionID](v18, "streamSessionID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543874;
      v38 = v20;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v21;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle start stream response: Received session ID %@ does not match the existing one %@", (uint8_t *)&v37, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)stopStream
{
  void *v3;
  void *v4;
  _HMCameraStreamControl *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _HMCameraStreamControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _HMCameraStreamControl *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _HMCameraStreamControl *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  void *v34;
  _HMCameraStreamControl *v35;
  id v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[_HMCameraControl context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping the stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[_HMCameraStreamControl streamSessionID](v5, "streamSessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (-[_HMCameraStreamControl streamState](v5, "streamState") == 3)
      {
        v10 = (void *)MEMORY[0x1A1AC1AAC]();
        v11 = v5;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v13;
          _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not stopping stream because it is already being stopped", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        goto LABEL_19;
      }
      -[_HMCameraStreamControl setStreamState:](v5, "setStreamState:", 3);
      v20 = (void *)MEMORY[0x1E0D285F8];
      v21 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[_HMCameraControl profileUniqueIdentifier](v5, "profileUniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithTarget:", v22);
      v37 = CFSTR("kCameraSessionID");
      v38 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "messageWithName:destination:payload:", CFSTR("HMCameraStreamStopStreamMessage"), v23, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __36___HMCameraStreamControl_stopStream__block_invoke;
      v34 = &unk_1E3AB6200;
      v35 = v5;
      v25 = v9;
      v36 = v25;
      v26 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v19, "setResponseHandler:", &v31));
      v27 = v5;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v29;
        v41 = 2112;
        v42 = (const char *)v25;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Sending stop video stream message for session ID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(v3, "messageDispatcher", v31, v32, v33, v34, v35);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sendMessage:", v19);

      -[_HMCameraStreamControl setStreamState:](v27, "setStreamState:", 3);
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = v5;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v18;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot stop stream because no stream session ID exists", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraStreamControl _callVideoStoppedDelegate:](v16, "_callVideoStoppedDelegate:", v19);
    }

LABEL_19:
    goto LABEL_20;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v14;
    v41 = 2080;
    v42 = "-[_HMCameraStreamControl stopStream]";
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
LABEL_20:

}

- (void)_handleVideoStopResponse:(id)a3 error:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _HMCameraStreamControl *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  _HMCameraStreamControl *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HMCameraStreamControl streamSessionID](self, "streamSessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if ((v12 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v9)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v17;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v9;
        v18 = "%{public}@Failed to stop stream for session ID %@: %@";
        v19 = v16;
        v20 = OS_LOG_TYPE_ERROR;
        v21 = 32;
LABEL_10:
        _os_log_impl(&dword_19B1B0000, v19, v20, v18, (uint8_t *)&v27, v21);

      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v17;
      v29 = 2112;
      v30 = v10;
      v18 = "%{public}@Successfully stopped stream for session ID: %@";
      v19 = v16;
      v20 = OS_LOG_TYPE_INFO;
      v21 = 22;
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v13);
    -[_HMCameraStreamControl _resetStateWithError:](v14, "_resetStateWithError:", v9);
    goto LABEL_12;
  }
  v22 = (void *)MEMORY[0x1A1AC1AAC]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMCameraStreamControl streamSessionID](v23, "streamSessionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v25;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v26;
    _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Stop response: Received session ID %@ does not match with the existing one %@", (uint8_t *)&v27, 0x20u);

  }
  objc_autoreleasePoolPop(v22);
LABEL_12:

}

- (void)_callVideoStartedDelegate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  -[_HMCameraStreamControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[_HMCameraControl context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51___HMCameraStreamControl__callVideoStartedDelegate__block_invoke;
    v6[3] = &unk_1E3AB6240;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    objc_msgSend(v5, "invokeBlock:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_callVideoStoppedDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[_HMCameraStreamControl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[_HMCameraControl context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52___HMCameraStreamControl__callVideoStoppedDelegate___block_invoke;
    v8[3] = &unk_1E3AB6268;
    objc_copyWeak(&v11, &location);
    v9 = v5;
    v10 = v4;
    objc_msgSend(v7, "invokeBlock:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_57068 != -1)
    dispatch_once(&logCategory__hmf_once_t28_57068, &__block_literal_global_57069);
  return (id)logCategory__hmf_once_v29_57070;
}

@end
