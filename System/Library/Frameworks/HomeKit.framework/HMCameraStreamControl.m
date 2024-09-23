@implementation HMCameraStreamControl

- (HMCameraStream)cameraStream
{
  void *v2;
  void *v3;

  -[HMCameraStreamControl streamControl](self, "streamControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraStream *)v3;
}

- (HMCameraStreamState)streamState
{
  void *v2;
  HMCameraStreamState v3;

  -[HMCameraStreamControl streamControl](self, "streamControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "streamState");

  return v3;
}

- (_HMCameraStreamControl)streamControl
{
  return (_HMCameraStreamControl *)objc_getProperty(self, a2, 24, 1);
}

- (HMCameraStreamControl)initWithStreamControl:(id)a3
{
  id v5;
  HMCameraStreamControl *v6;
  HMCameraStreamControl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraStreamControl;
  v6 = -[HMCameraControl init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_streamControl, a3);
    -[_HMCameraStreamControl setDelegate:](v7->_streamControl, "setDelegate:", v7);
  }

  return v7;
}

- (void)setDelegate:(id)delegate
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMCameraStreamControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraStreamControl;
  return -[HMCameraControl init](&v3, sel_init);
}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

- (void)startStream
{
  id v2;

  -[HMCameraStreamControl streamControl](self, "streamControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startStreamWithPreferences:", 0);

}

- (void)startStreamWithPreferences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMCameraStreamControl streamControl](self, "streamControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startStreamWithPreferences:", v4);

}

- (void)stopStream
{
  id v2;

  -[HMCameraStreamControl streamControl](self, "streamControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopStream");

}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  id v4;

  -[HMCameraStreamControl delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "cameraStreamControlDidStartStream:", self);

}

- (void)cameraStreamControl:(id)a3 didStopStream:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[HMCameraStreamControl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "cameraStreamControl:didStopStreamWithError:", self, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52___HMCameraStreamControl__callVideoStoppedDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "hmPublicError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cameraStreamControl:didStopStream:", WeakRetained, v3);

  }
}

void __51___HMCameraStreamControl__callVideoStartedDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "cameraStreamControlDidStartStream:", WeakRetained);
    WeakRetained = v3;
  }

}

uint64_t __36___HMCameraStreamControl_stopStream__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleVideoStopResponse:error:sessionID:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __53___HMCameraStreamControl_startStreamWithPreferences___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStreamStartedWithResponse:sessionID:error:", a3, *(_QWORD *)(a1 + 40), a2);
}

void __49___HMCameraStreamControl___configureWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "streamState") == 2)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting state due to reconnection handler", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v3, "_resetStateWithError:", 0);
  }

}

void __37___HMCameraStreamControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29_57070;
  logCategory__hmf_once_v29_57070 = v0;

}

@end
