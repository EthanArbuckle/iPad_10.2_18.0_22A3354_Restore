@implementation HMAudioControl

uint64_t __46___HMAudioControl__handleAudioControlUpdated___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "audioControl:didUpdateVolume:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __46___HMAudioControl__handleAudioControlUpdated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioControl:didUpdateMuted:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __49___HMAudioControl_updateMuted_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  id location;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("muted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWithName:destination:payload:", CFSTR("HMAC.sa"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___HMAudioControl_updateMuted_completionHandler___block_invoke_2;
  v8[3] = &unk_1E3AB1998;
  objc_copyWeak(&v10, &location);
  v11 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "setResponseHandler:", v8);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:completionHandler:", v6, 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __49___HMAudioControl_updateMuted_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set the mute state to %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "setMuted:", *(unsigned __int8 *)(a1 + 48));
  }
  objc_msgSend(WeakRetained, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "delegateCaller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

}

void __50___HMAudioControl_updateVolume_completionHandler___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  int v12;
  id location;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("volume");
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWithName:destination:payload:", CFSTR("HMAC.sa"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___HMAudioControl_updateVolume_completionHandler___block_invoke_2;
  v9[3] = &unk_1E3AAEC68;
  objc_copyWeak(&v11, &location);
  v12 = *(_DWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v7, "setResponseHandler:", v9);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMessage:completionHandler:", v7, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50___HMAudioControl_updateVolume_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = *(_DWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set the volume to %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    LODWORD(v14) = *(_DWORD *)(a1 + 48);
    objc_msgSend(v9, "setVolume:", v14);
  }
  objc_msgSend(WeakRetained, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

}

void __38___HMAudioControl_mergeFromNewObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E3AAEC40;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[1] = 3221225472;
  v7 = *(_DWORD *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __38___HMAudioControl_mergeFromNewObject___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke_2_23;
  v6[3] = &unk_1E3AB57F8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __38___HMAudioControl_mergeFromNewObject___block_invoke_2_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioControl:didUpdateMuted:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __38___HMAudioControl_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = *(_DWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateVolume : %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  LODWORD(v8) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 40), "audioControl:didUpdateVolume:", *(_QWORD *)(a1 + 32), v8);
}

- (HMAudioControl)initWithMediaSession:(id)a3
{
  id v4;
  HMAudioControl *v5;
  _HMAudioControl *v6;
  _HMAudioControl *audioControl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAudioControl;
  v5 = -[HMAudioControl init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_HMAudioControl initWithMediaSession:]([_HMAudioControl alloc], "initWithMediaSession:", v4);
    audioControl = v5->_audioControl;
    v5->_audioControl = v6;

    -[_HMAudioControl setDelegate:](v5->_audioControl, "setDelegate:", v5);
  }

  return v5;
}

- (void)__configureWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMAudioControl audioControl](self, "audioControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__configureWithContext:", v4);

}

- (void)_unconfigure
{
  id v2;

  -[HMAudioControl audioControl](self, "audioControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unconfigure");

}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMAudioControl audioControl](self, "audioControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[HMAudioControl audioControl](self, "audioControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  double v4;
  id v5;

  -[HMAudioControl audioControl](self, "audioControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolume:", v4);

}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[HMAudioControl audioControl](self, "audioControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HMAudioControl audioControl](self, "audioControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMuted:", v3);

}

- (void)updateVolume:(float)a3 completionHandler:(id)a4
{
  void *v7;
  double v8;
  void *v9;
  HMAudioControl *v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  if (a3 < 0.0 || a3 > 1.0)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Volume must be between 0.0 - 1.0", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_exception_throw(objc_retainAutorelease((id)*MEMORY[0x1E0C99858]));
  }
  -[HMAudioControl audioControl](self, "audioControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "updateVolume:completionHandler:", v14, v8);

}

- (void)updateMuted:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[HMAudioControl audioControl](self, "audioControl");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateMuted:completionHandler:", v4, v6);

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAudioControl audioControl](self, "audioControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "mergeFromNewObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)audioControl:(id)a3 didUpdateVolume:(float)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMAudioControl *v15;
  float v16;

  -[HMAudioControl delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HMAudioControl delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAudioControl audioControl](self, "audioControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__HMAudioControl_audioControl_didUpdateVolume___block_invoke;
    v13[3] = &unk_1E3AAEC40;
    v14 = v8;
    v15 = self;
    v16 = a4;
    v12 = v8;
    objc_msgSend(v11, "invokeBlock:", v13);

  }
}

- (void)audioControl:(id)a3 didUpdateMuted:(BOOL)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMAudioControl *v15;
  BOOL v16;

  -[HMAudioControl delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HMAudioControl delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAudioControl audioControl](self, "audioControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__HMAudioControl_audioControl_didUpdateMuted___block_invoke;
    v13[3] = &unk_1E3AB57F8;
    v14 = v8;
    v15 = self;
    v16 = a4;
    v12 = v8;
    objc_msgSend(v11, "invokeBlock:", v13);

  }
}

- (HMAudioControlDelegate)delegate
{
  return (HMAudioControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMMediaSession)mediaSession
{
  return (HMMediaSession *)objc_loadWeakRetained((id *)&self->_mediaSession);
}

- (void)setMediaSession:(id)a3
{
  objc_storeWeak((id *)&self->_mediaSession, a3);
}

- (_HMAudioControl)audioControl
{
  return self->_audioControl;
}

- (void)setAudioControl:(id)a3
{
  objc_storeStrong((id *)&self->_audioControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_destroyWeak((id *)&self->_mediaSession);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __46__HMAudioControl_audioControl_didUpdateMuted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioControl:didUpdateMuted:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __47__HMAudioControl_audioControl_didUpdateVolume___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "audioControl:didUpdateVolume:", *(_QWORD *)(a1 + 40), a2);
}

@end
