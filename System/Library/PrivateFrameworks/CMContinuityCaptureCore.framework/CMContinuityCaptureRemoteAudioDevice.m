@implementation CMContinuityCaptureRemoteAudioDevice

- (CMContinuityCaptureRemoteAudioDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 captureSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CMContinuityCaptureRemoteAudioDevice *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  objc_msgSend(v9, "server");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  self = -[CMContinuityCaptureDeviceBase initWithCapabilities:compositeDelegate:transportDevice:queue:](&v17, sel_initWithCapabilities_compositeDelegate_transportDevice_queue_, v8, v9, v13, v14);

  if (self)
  {
    objc_storeStrong((id *)&self->_captureSession, a5);
    self->_disableBufferBlockSizeCheck = 0;
    self = self;
    v15 = self;
  }
  else
  {
LABEL_4:
    v15 = 0;
  }

  return v15;
}

- (CMContinuityCaptureAVCaptureAudioSession)captureSession
{
  return self->_captureSession;
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
  v17[2] = __87__CMContinuityCaptureRemoteAudioDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
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

void __87__CMContinuityCaptureRemoteAudioDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  char v18;
  int v19;
  CMContinuityCaptureRemoteAudioDevice *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  LODWORD(v10) = objc_msgSend(v9, "isEqualToString:", CFSTR("active"));
  if (!(_DWORD)v10)
    goto LABEL_13;
  v11 = *MEMORY[0x24BDD0E70];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "BOOLValue"))
  {

  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543362;
        v20 = self;
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ active 1 -> 0", (uint8_t *)&v19, 0xCu);
      }

      -[CMContinuityCaptureRemoteAudioDevice stopCaptureStack:completion:](self, "stopCaptureStack:completion:", 4, &__block_literal_global_18);
      goto LABEL_13;
    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v16 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject BOOLValue](v16, "BOOLValue") & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if ((v18 & 1) == 0)
  {
    CMContinuityCaptureLog(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = self;
      _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ active 0 -> 1", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)didStartStreamInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  CMContinuityCaptureRemoteAudioDevice *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544130;
    v9 = self;
    v10 = 2048;
    v11 = objc_msgSend(v6, "currentSessionID");
    v12 = 2080;
    v13 = "-[CMContinuityCaptureRemoteAudioDevice didStartStreamInput:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCInput setup complete %s %@", (uint8_t *)&v8, 0x2Au);

  }
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  self->_avcStreamInputActive = 1;
}

- (void)didStopStreamInput:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  CMContinuityCaptureRemoteAudioDevice *v7;
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
    v9 = "-[CMContinuityCaptureRemoteAudioDevice didStopStreamInput:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_avcStreamInputActive = 0;
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  CMContinuityCaptureRemoteAudioDevice *v9;
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
    v11 = "-[CMContinuityCaptureRemoteAudioDevice stream:didStart:error:]";
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
    v11 = "-[CMContinuityCaptureRemoteAudioDevice streamDidStop:]";
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
  block[2] = __54__CMContinuityCaptureRemoteAudioDevice_streamDidStop___block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

void __54__CMContinuityCaptureRemoteAudioDevice_streamDidStop___block_invoke(uint64_t a1)
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
    v3 = WeakRetained[43];
    v6 = v2;
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)v6[43];
      v6[43] = 0;

      v2 = v6;
    }
    v5 = (void *)v2[29];
    v2[29] = 0;

    v2 = v6;
    *((_BYTE *)v6 + 336) = 0;
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
    v11 = "-[CMContinuityCaptureRemoteAudioDevice streamDidServerDie:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureRemoteAudioDevice_streamDidServerDie___block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

void __59__CMContinuityCaptureRemoteAudioDevice_streamDidServerDie___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[29];
    WeakRetained[29] = 0;

    v2 = (void *)WeakRetained[28];
    WeakRetained[28] = 0;

    *((_BYTE *)WeakRetained + 336) = 0;
    v3 = WeakRetained[43];
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)WeakRetained[43];
      WeakRetained[43] = 0;

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
    v9 = "-[CMContinuityCaptureRemoteAudioDevice postAVCStreamInterruption]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CMContinuityCaptureRemoteAudioDevice_postAVCStreamInterruption__block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __65__CMContinuityCaptureRemoteAudioDevice_postAVCStreamInterruption__block_invoke(uint64_t a1)
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
  CMContinuityCaptureRemoteAudioDevice *v7;
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
    v9 = "-[CMContinuityCaptureRemoteAudioDevice streamDidRTPTimeOut:]";
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
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRemoteAudioDevice *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v12 = self;
    v13 = 2080;
    v14 = "-[CMContinuityCaptureRemoteAudioDevice streamDidRTCPTimeOut:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s %@", buf, 0x20u);
  }

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2080;
    v14 = "-[CMContinuityCaptureRemoteAudioDevice streamDidRTCPTimeOut:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_INFO, "%@ %s %@", buf, 0x20u);
  }

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__CMContinuityCaptureRemoteAudioDevice_streamDidRTCPTimeOut___block_invoke;
  v8[3] = &unk_24F06AE60;
  objc_copyWeak(&v9, &location);
  dispatch_async(v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __61__CMContinuityCaptureRemoteAudioDevice_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
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
  AVCStreamInput *avcStreamInput;
  char v10;
  id v11;
  NSObject *v12;
  objc_super v13;
  id v14;

  v7 = (void (**)(id, id))a5;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (self->_avcStreamInputActive)
  {
    avcStreamInput = self->_avcStreamInput;
    v14 = 0;
    v10 = -[AVCStreamInput pushSampleBuffer:error:](avcStreamInput, "pushSampleBuffer:error:", a3, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      CMContinuityCaptureLog(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:].cold.2();

    }
  }
  else
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1003, 0);
  }
  v13.receiver = self;
  v13.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  -[CMContinuityCaptureDeviceBase dispatchFrame:entity:completion:](&v13, sel_dispatchFrame_entity_completion_, a3, -[CMContinuityCaptureDeviceBase entity](self, "entity"), &__block_literal_global_3);
  v7[2](v7, v11);

}

- (id)createAVCAudioStream
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;
  uint8_t buf[4];
  CMContinuityCaptureRemoteAudioDevice *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase transportStream](self, "transportStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v14 = 0;
    v13 = 0;
    v5 = 0;
LABEL_19:
    v10 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "streamUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2048;
    v25 = objc_msgSend(v7, "currentSessionID");
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCAudioStream StreamUUID %@", buf, 0x20u);

  }
  if (!v5)
  {
    v14 = 0;
    v13 = 0;
    goto LABEL_19;
  }
  -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v11 = 0;
LABEL_9:
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      v24 = 2112;
      v25 = (uint64_t)v11;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid avcStreamInitOptions, error %@", buf, 0x16u);
    }

    v11 = 0;
    v10 = (void *)MEMORY[0x24BDBD1B8];
    goto LABEL_12;
  }
  -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "generateMediaStreamInitOptionsWithError:", &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;

  if (!v10)
    goto LABEL_9;
LABEL_12:
  v20 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD9D8]), "initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:", v5, 0, v10, &v20);
  v14 = v20;

  if (v13)
  {
    objc_msgSend(v13, "setDelegate:", self);
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "currentSessionID");
      *(_DWORD *)buf = 138543874;
      v23 = self;
      v24 = 2048;
      v25 = v17;
      v26 = 2048;
      v27 = v13;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCAudioStream %p success", buf, 0x20u);

    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteAudioDevice createAVCAudioStream].cold.1();
    v13 = 0;
  }

LABEL_16:
  v18 = v13;

  return v18;
}

- (id)newAudioStreamCurrentConfiguration:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
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
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  id v33;
  uint64_t v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  CMContinuityCaptureRemoteAudioDevice *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase transportStream](self, "transportStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      v40 = 2080;
      v41 = "-[CMContinuityCaptureRemoteAudioDevice newAudioStreamCurrentConfiguration:]";
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

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
        v37 = 0;
        objc_msgSend(v15, "generateMediaStreamConfigurationWithError:", &v37);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v37;

        if (v10)
        {
          objc_msgSend(v10, "setRtcpSendInterval:", 1.0);
          objc_msgSend(v10, "setRtcpTimeOutEnabled:", 1);
          v16 = objc_msgSend(v8, "currentTransport");
          v17 = 12.0;
          if (v16 == 2)
            v17 = 8.0;
          objc_msgSend(v10, "setRtcpTimeOutInterval:", v17);
          objc_msgSend(v10, "setSRTPCipherSuite:", 5);
          objc_msgSend(v10, "setSRTCPCipherSuite:", 5);
          objc_msgSend(v10, "setSendMediaKey:", v12);
          objc_msgSend(v10, "setReceiveMediaKey:", v12);
          objc_msgSend(v10, "setStreamInputID:", a3);
          objc_msgSend(v10, "setJitterBufferMode:", 2);
          objc_msgSend(v10, "setFixedJitterBufferSize:", 20);
          objc_msgSend(v8, "timeSyncClock");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v8, "timeSyncClock");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setNetworkClockID:", objc_msgSend(v19, "clockIdentifier"));

          }
          objc_msgSend(v10, "audio");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setPtime:", 10);

          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "audioDeviceMode");

          if (v22 == 1667329132)
          {
            objc_msgSend(v10, "audio");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setCodecType:", 16);

            objc_msgSend(v10, "audio");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setChannelCount:", 4);

          }
          CMContinuityCaptureLog(2);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v36, "currentSessionID");
            v26 = objc_msgSend(v10, "networkClockID");
            v27 = v12;
            v28 = v8;
            v29 = v7;
            v30 = v5;
            v31 = objc_msgSend(v10, "localSSRC");
            v32 = objc_msgSend(v10, "remoteSSRC");
            *(_DWORD *)buf = 138413314;
            v39 = self;
            v40 = 2048;
            v41 = (const char *)v35;
            v42 = 2048;
            v43 = v26;
            v44 = 1024;
            v45 = v31;
            v5 = v30;
            v7 = v29;
            v8 = v28;
            v12 = v27;
            v46 = 1024;
            v47 = v32;
            _os_log_impl(&dword_227C5D000, v25, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] networkClockID %llu localSSRC %x remoteSSRC %x", buf, 0x2Cu);

          }
        }
        else
        {
          CMContinuityCaptureLog(2);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
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
    v33 = v10;

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  NSObject *v5;
  id stopCompletionBlock;
  AVCAudioStream *v7;
  AVCAudioStream *avcAudioStream;
  void *v9;
  int v10;
  OSStatus v11;
  CMAudioFormatDescriptionRef v12;
  NSObject *v13;
  NSObject *v14;
  AVCAudioStream *v15;
  id v16;
  void *v17;
  AVCStreamInput *v18;
  id v19;
  AVCStreamInput *avcStreamInput;
  AVCStreamInput *v21;
  NSObject *v22;
  AVCAudioStream *v23;
  char v24;
  id v25;
  BOOL v26;
  NSObject *v28;
  objc_super v29;
  id v30;
  id v31;
  AudioStreamBasicDescription asbd;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  uint8_t buf[4];
  CMContinuityCaptureRemoteAudioDevice *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  CMAudioFormatDescriptionRef v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  formatDescriptionOut = 0;
  *(_OWORD *)&asbd.mSampleRate = ContinuityCaptureDefaultModeInputASBD;
  *(_OWORD *)&asbd.mBytesPerPacket = unk_227CED610;
  *(_QWORD *)&asbd.mBitsPerChannel = 32;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v35 = self;
    v36 = 2080;
    v37 = "-[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  stopCompletionBlock = self->_stopCompletionBlock;
  self->_stopCompletionBlock = 0;

  self->_avcStreamInputActive = 0;
  if (!self->_avcAudioStream)
  {
    -[CMContinuityCaptureRemoteAudioDevice createAVCAudioStream](self, "createAVCAudioStream");
    v7 = (AVCAudioStream *)objc_claimAutoreleasedReturnValue();
    avcAudioStream = self->_avcAudioStream;
    self->_avcAudioStream = v7;

    if (!self->_avcAudioStream)
    {
      v26 = 0;
      v19 = 0;
      goto LABEL_17;
    }
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "audioDeviceMode");

  if (v10 == 1667329132)
  {
    *(_OWORD *)&asbd.mSampleRate = ContinuityCaptureTelephonyModeInputASBD;
    *(_OWORD *)&asbd.mBytesPerPacket = unk_227CED660;
    *(_QWORD *)&asbd.mBitsPerChannel = 32;
  }
  v11 = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  v12 = formatDescriptionOut;
  CMContinuityCaptureLog(2);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_avcAudioStream;
      *(_DWORD *)buf = 138543874;
      v35 = self;
      v36 = 2048;
      v37 = (const char *)v15;
      v38 = 2112;
      v39 = formatDescriptionOut;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ AVCAudioStream %p setup for format %@", buf, 0x20u);
    }

    -[CMContinuityCaptureRemoteAudioDevice _resetNetworkSampleTime](self, "_resetNetworkSampleTime");
    v16 = objc_alloc(MEMORY[0x24BDFDA30]);
    -[CMContinuityCaptureDeviceBase queue](self, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v18 = (AVCStreamInput *)objc_msgSend(v16, "initWithDelegate:delegateQueue:format:options:error:", self, v17, formatDescriptionOut, 0, &v31);
    v19 = v31;
    avcStreamInput = self->_avcStreamInput;
    self->_avcStreamInput = v18;

    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    v21 = self->_avcStreamInput;
    if (v21)
    {
      v22 = -[CMContinuityCaptureRemoteAudioDevice newAudioStreamCurrentConfiguration:](self, "newAudioStreamCurrentConfiguration:", -[AVCStreamInput streamInputID](v21, "streamInputID"));
      if (!v22)
      {
        v26 = 0;
        goto LABEL_17;
      }
      v14 = v22;
      v23 = self->_avcAudioStream;
      v30 = v19;
      v24 = -[AVCAudioStream configure:error:](v23, "configure:error:", v14, &v30);
      v25 = v30;

      if ((v24 & 1) != 0)
      {
        -[AVCAudioStream start](self->_avcAudioStream, "start");
        v26 = 1;
      }
      else
      {
        CMContinuityCaptureLog(2);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:].cold.3();

        v26 = 0;
      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:].cold.2();
      v26 = 0;
      v25 = v19;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:].cold.1((uint64_t)self, v11, v14);
    v26 = 0;
    v25 = 0;
  }

  v19 = v25;
LABEL_17:
  v29.receiver = self;
  v29.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  -[CMContinuityCaptureDeviceBase startAVConferenceStack:](&v29, sel_startAVConferenceStack_, a3);

  return v26;
}

- (BOOL)stopAVConferenceStack
{
  NSObject *v3;
  AVCAudioStream *avcAudioStream;
  BOOL v5;
  AVCStreamInput *avcStreamInput;
  int v8;
  CMContinuityCaptureRemoteAudioDevice *v9;
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
    v11 = "-[CMContinuityCaptureRemoteAudioDevice stopAVConferenceStack]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }

  if (self->_avcStreamInput && (avcAudioStream = self->_avcAudioStream) != 0)
  {
    -[AVCAudioStream stop](avcAudioStream, "stop");
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
  AVCAudioStream *avcAudioStream;
  NSObject *v10;
  void *v11;
  void *v12;
  id stopCompletionBlock;
  dispatch_time_t v14;
  NSObject *v15;
  _BOOL4 v16;
  AVCAudioStream *v17;
  AVCStreamInput *avcStreamInput;
  AVCAudioStream *v19;
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
      v27 = "-[CMContinuityCaptureRemoteAudioDevice stopCaptureStack:completion:]";
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s already in progress", buf, 0x16u);
    }

    if ((a3 & 4) != 0)
    {
      avcAudioStream = self->_avcAudioStream;
      self->_avcAudioStream = 0;

      CMContinuityCaptureLog(2);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCAudio reference", buf, 0xCu);
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
      block[2] = __68__CMContinuityCaptureRemoteAudioDevice_stopCaptureStack_completion___block_invoke;
      block[3] = &unk_24F06AE60;
      objc_copyWeak(&v24, (id *)buf);
      dispatch_after(v14, v15, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
    v16 = -[CMContinuityCaptureRemoteAudioDevice stopAVConferenceStack](self, "stopAVConferenceStack");
    -[CMContinuityCaptureRemoteAudioDevice stopCameraCaptureStack:](self, "stopCameraCaptureStack:", a3);
    if ((a3 & 4) != 0)
    {
      v17 = self->_avcAudioStream;
      if (v17)
        -[AVCAudioStream stop](v17, "stop");
      avcStreamInput = self->_avcStreamInput;
      self->_avcStreamInput = 0;

      v19 = self->_avcAudioStream;
      self->_avcAudioStream = 0;

      self->_avcStreamInputActive = 0;
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCAudio reference", buf, 0xCu);
      }

    }
    v22.receiver = self;
    v22.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
    -[CMContinuityCaptureDeviceBase stopCaptureStack:completion:](&v22, sel_stopCaptureStack_completion_, a3, &__block_literal_global_11);
    if (!v16 || !self->_avcStreamInputActive)
    {
      v21 = self->_stopCompletionBlock;
      self->_stopCompletionBlock = 0;

      v6[2](v6, 0);
    }
  }

}

void __68__CMContinuityCaptureRemoteAudioDevice_stopCaptureStack_completion___block_invoke(uint64_t a1)
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
    v3 = WeakRetained[43];
    if (v3)
    {
      v5 = v2;
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)v5[43];
      v5[43] = 0;

      v2 = v5;
    }
  }

}

- (BOOL)stopCameraCaptureStack:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVCaptureAudioDataOutput *audioDataOutput;
  AVCaptureDeviceInput *audioDeviceInput;
  AVCaptureDevice *audioDevice;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSUUID *cameraCaptureStreamSessionID;
  unint64_t audioBufferDropCounter;
  int v23;
  CMContinuityCaptureRemoteAudioDevice *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = self;
    v25 = 2048;
    v26 = objc_msgSend(v7, "currentSessionID");
    v27 = 2080;
    v28 = "-[CMContinuityCaptureRemoteAudioDevice stopCameraCaptureStack:]";
    v29 = 1024;
    LODWORD(v30) = v3;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option %d", (uint8_t *)&v23, 0x26u);

  }
  if (self->_captureStackActive)
  {
    -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

    -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "captureSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "willConfigure");

    if (self->_audioDataOutput)
      objc_msgSend(v10, "removeOutput:");
    if (self->_audioDeviceInput)
      objc_msgSend(v10, "removeInput:");
    -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didConfigure");

    audioDataOutput = self->_audioDataOutput;
    self->_audioDataOutput = 0;

    audioDeviceInput = self->_audioDeviceInput;
    self->_audioDeviceInput = 0;

    audioDevice = self->_audioDevice;
    self->_audioDevice = 0;

    self->_captureStackActive = 0;
  }
  +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor](CMContinuityCaptureMSNExceptionMonitor, "sharedMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "decrementExceptionCountForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

  CMContinuityCaptureLog(2);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "currentSessionID");
    cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
    audioBufferDropCounter = self->_audioBufferDropCounter;
    v23 = 138544130;
    v24 = self;
    v25 = 2048;
    v26 = v19;
    v27 = 2114;
    v28 = (const char *)cameraCaptureStreamSessionID;
    v29 = 2048;
    v30 = audioBufferDropCounter;
    _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] #of frame drops for streamSessionID:%{public}@ %lld", (uint8_t *)&v23, 0x2Au);

  }
  return 1;
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  -[CMContinuityCaptureDeviceBase invalidate](&v2, sel_invalidate);
  +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", 0);
}

- (BOOL)startCameraCaptureStack:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSUUID *v9;
  NSUUID *cameraCaptureStreamSessionID;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSUUID *v14;
  void *v15;
  void *v16;
  AVCaptureDevice *v17;
  AVCaptureDevice *audioDevice;
  void *v19;
  void *v20;
  AVCaptureDevice *v21;
  AVCaptureDeviceInput *v22;
  NSObject *v23;
  AVCaptureDeviceInput *audioDeviceInput;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int DeviceClass;
  uint64_t v30;
  BOOL v31;
  NSObject *v32;
  NSObject *v33;
  AVCaptureDeviceInput *v34;
  AVCaptureAudioDataOutput *v35;
  AVCaptureAudioDataOutput *audioDataOutput;
  AVCaptureAudioDataOutput *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  int v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  objc_super v53;
  id v54;
  uint8_t buf[4];
  CMContinuityCaptureRemoteAudioDevice *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  NSUUID *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_captureStackActive || -[CMContinuityCaptureDeviceBase invalidated](self, "invalidated"))
    {
      v31 = 0;
      goto LABEL_26;
    }
    v9 = (NSUUID *)objc_opt_new();
    cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
    self->_cameraCaptureStreamSessionID = v9;

    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "currentSessionID");
      v14 = self->_cameraCaptureStreamSessionID;
      *(_DWORD *)buf = 138544386;
      v56 = self;
      v57 = 2048;
      v58 = v13;
      v59 = 2080;
      v60 = "-[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:]";
      v61 = 1024;
      v62 = a3;
      v63 = 2114;
      v64 = v14;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option:%d streamSessionID:%{public}@", buf, 0x30u);

    }
    +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor](CMContinuityCaptureMSNExceptionMonitor, "sharedMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "incrementExceptionCountForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

    -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "willConfigure");

    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithMediaType:", *MEMORY[0x24BDB1CF0]);
    v17 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
    audioDevice = self->_audioDevice;
    self->_audioDevice = v17;

    if (self->_audioDevice)
    {
      objc_msgSend(v8, "timeSyncClock");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clockDeviceUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureDevice setClientAudioClockDeviceUID:](self->_audioDevice, "setClientAudioClockDeviceUID:", v20);

      v21 = self->_audioDevice;
      v54 = 0;
      objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v21, &v54);
      v22 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
      v23 = v54;
      audioDeviceInput = self->_audioDeviceInput;
      self->_audioDeviceInput = v22;

      if (self->_audioDeviceInput)
      {
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "audioDeviceMode");

        CMContinuityCaptureLog(2);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = self;
          v57 = 2112;
          v58 = (uint64_t)v28;
          _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, " %{public}@ got mode %@", buf, 0x16u);

        }
        if ((_DWORD)v26 == 1684434036)
        {
          DeviceClass = GestaltGetDeviceClass();
          if (DeviceClass != 1)
          {
            if (DeviceClass == 3)
            {
              v30 = 4;
LABEL_20:
              -[AVCaptureDeviceInput setAudioCaptureMode:](self->_audioDeviceInput, "setAudioCaptureMode:", v30);
              CMContinuityCaptureLog(2);
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = self->_audioDeviceInput;
                *(_DWORD *)buf = 138543618;
                v56 = self;
                v57 = 2112;
                v58 = (uint64_t)v34;
                _os_log_impl(&dword_227C5D000, v33, OS_LOG_TYPE_DEFAULT, " %{public}@ input %@", buf, 0x16u);
              }

              v35 = (AVCaptureAudioDataOutput *)objc_alloc_init(MEMORY[0x24BDB2438]);
              audioDataOutput = self->_audioDataOutput;
              self->_audioDataOutput = v35;

              v37 = self->_audioDataOutput;
              -[CMContinuityCaptureDeviceBase queue](self, "queue");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[AVCaptureAudioDataOutput setSampleBufferDelegate:queue:](v37, "setSampleBufferDelegate:queue:", self, v38);

              -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "configureSessionWithInput:andOutput:", self->_audioDeviceInput, self->_audioDataOutput);

              -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "didConfigure");

              self->_audioBufferOutputCounter = 0;
              self->_audioBufferDropCounter = 0;
              self->_audioSampleRate = 0.0;
              self->_audioBytesPerSample = 0;
              -[CMContinuityCaptureRemoteAudioDevice _resetNetworkSampleTime](self, "_resetNetworkSampleTime");
              -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "start");

              CMContinuityCaptureLog(2);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                -[CMContinuityCaptureRemoteAudioDevice captureSession](self, "captureSession");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "state");
                *(_DWORD *)buf = 138543618;
                v56 = self;
                v57 = 1024;
                LODWORD(v58) = v44;
                _os_log_impl(&dword_227C5D000, v42, OS_LOG_TYPE_DEFAULT, " %{public}@ state %d", buf, 0x12u);

              }
              self->_captureStackActive = 1;
              v53.receiver = self;
              v53.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
              v31 = -[CMContinuityCaptureDeviceBase startCameraCaptureStack:](&v53, sel_startCameraCaptureStack_, a3);
              goto LABEL_25;
            }
            CMContinuityCaptureLog(2);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:].cold.3();

          }
          v30 = 3;
          goto LABEL_20;
        }
        v30 = 5;
        goto LABEL_20;
      }
      CMContinuityCaptureLog(2);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:].cold.2();

    }
    else
    {
      CMContinuityCaptureLog(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:].cold.1((uint64_t)self, v23, v46, v47, v48, v49, v50, v51);
    }
    v31 = 0;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v31 = 0;
LABEL_27:

  return v31;
}

- (void)handleSynchronizeAudioClockCompletion
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
  v4[2] = __77__CMContinuityCaptureRemoteAudioDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __77__CMContinuityCaptureRemoteAudioDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_loadWeakRetained(v1);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Got SynchronizeAudioClockCompletion message", (uint8_t *)&v5, 0xCu);

    }
    WeakRetained[296] = 1;
  }

}

- (BOOL)_shouldPrintDroppedSampleBufferLog:(int64_t)a3
{
  return a3 < 5 || 0xEEEEEEEEEEEEEEEFLL * a3 < 0x1111111111111112;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  NSObject *v7;

  -[CMContinuityCaptureDeviceBase queue](self, "queue", a3, a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  ++self->_audioBufferOutputCounter;
  if (self->_avcStreamInputActive)
    -[CMContinuityCaptureRemoteAudioDevice _processIncomingAudioBuffer:](self, "_processIncomingAudioBuffer:", a4);
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  unint64_t *p_audioBufferDropCounter;
  NSObject *v7;
  NSObject *v8;

  p_audioBufferDropCounter = &self->_audioBufferDropCounter;
  ++self->_audioBufferDropCounter;
  -[CMContinuityCaptureDeviceBase queue](self, "queue", a3, a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[CMContinuityCaptureRemoteAudioDevice _shouldPrintDroppedSampleBufferLog:](self, "_shouldPrintDroppedSampleBufferLog:", *p_audioBufferDropCounter))
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteAudioDevice captureOutput:didDropSampleBuffer:fromConnection:].cold.1((uint64_t)self, p_audioBufferDropCounter, v8);

  }
}

- (void)_processIncomingAudioBuffer:(opaqueCMSampleBuffer *)a3
{
  double mSampleRate;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unsigned int mBytesPerFrame;
  OpaqueCMBlockBuffer *DataBuffer;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  unint64_t requiredAudioSampleCountPerBuffer;
  uint64_t v17;
  CMTimeValue value;
  uint64_t v19;
  CMTimeEpoch epoch;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  opaqueCMSampleBuffer *v24;
  opaqueCMSampleBuffer *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSData *remainingAudioDataFromPreviousSbuf;
  void *v30;
  id v31;
  NSData *v32;
  NSData *v33;
  NSObject *v34;
  NSObject *v35;
  double audioSampleRate;
  unsigned int audioBytesPerSample;
  unint64_t v38;
  void *v39;
  const opaqueCMFormatDescription *desc;
  CMTime v41;
  CMTime v42;
  CMTime rhs;
  CMTime lhs;
  char *dataPointerOut;
  size_t totalLengthOut;
  CMTime v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  dataPointerOut = 0;
  totalLengthOut = 0;
  desc = CMSampleBufferGetFormatDescription(a3);
  if (!self->_audioBytesPerSample || (mSampleRate = self->_audioSampleRate, mSampleRate == 0.0))
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(desc);
    mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
    self->_audioBytesPerSample = mBytesPerFrame;
    if ((StreamBasicDescription->mFormatFlags & 0x20) != 0)
      self->_audioBytesPerSample = StreamBasicDescription->mChannelsPerFrame * mBytesPerFrame;
    mSampleRate = StreamBasicDescription->mSampleRate;
    self->_audioSampleRate = StreamBasicDescription->mSampleRate;
    self->_requiredAudioSampleCountPerBuffer = (mSampleRate * 0.01);
    if (!self->_audioBytesPerSample)
      goto LABEL_26;
  }
  if (mSampleRate == 0.0)
  {
LABEL_26:
    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      audioSampleRate = self->_audioSampleRate;
      audioBytesPerSample = self->_audioBytesPerSample;
      LODWORD(v47.value) = 134218240;
      *(double *)((char *)&v47.value + 4) = audioSampleRate;
      LOWORD(v47.flags) = 1024;
      *(CMTimeFlags *)((char *)&v47.flags + 2) = audioBytesPerSample;
      _os_log_error_impl(&dword_227C5D000, v34, OS_LOG_TYPE_ERROR, "Trying to process audio buffer but couldn't retrieve valid audioSampleRate %f and audioBytesPerSample %d", (uint8_t *)&v47, 0x12u);
    }

  }
  else
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut))
    {
      CMContinuityCaptureLog(2);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteAudioDevice _processIncomingAudioBuffer:].cold.2();

    }
    else
    {
      v9 = -[NSData length](self->_remainingAudioDataFromPreviousSbuf, "length");
      v10 = self->_audioBytesPerSample;
      v11 = v9 / v10;
      v12 = totalLengthOut / v10 + v9 / v10;
      if (v9 < v10 && v12 == self->_requiredAudioSampleCountPerBuffer)
      {
LABEL_15:
        -[CMContinuityCaptureRemoteAudioDevice _dispatchAudioFrame:](self, "_dispatchAudioFrame:", a3);
        return;
      }
      if (self->_disableBufferBlockSizeCheck
        || (-[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "audioDeviceMode"),
            v13,
            v14 == 1667329132))
      {
        CMContinuityCaptureLog(2);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureRemoteAudioDevice _processIncomingAudioBuffer:].cold.1(v11, v12, v15);

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", self->_remainingAudioDataFromPreviousSbuf);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "appendBytes:length:", dataPointerOut, totalLengthOut);
      requiredAudioSampleCountPerBuffer = self->_requiredAudioSampleCountPerBuffer;
      v38 = v12 / requiredAudioSampleCountPerBuffer;
      CMSampleBufferGetPresentationTimeStamp(&lhs, a3);
      CMTimeMake(&rhs, v11, (int)self->_audioSampleRate);
      CMTimeSubtract(&v47, &lhs, &rhs);
      if (v12 >= requiredAudioSampleCountPerBuffer)
      {
        v17 = 0;
        value = v47.value;
        v19 = *(_QWORD *)&v47.timescale;
        epoch = v47.epoch;
        if (v38 <= 1)
          v21 = 1;
        else
          v21 = v38;
        do
        {
          v22 = self->_requiredAudioSampleCountPerBuffer;
          memset(&v47, 170, sizeof(v47));
          CMTimeMake(&v42, v22 * v17, (int)self->_audioSampleRate);
          v41.value = value;
          *(_QWORD *)&v41.timescale = v19;
          v41.epoch = epoch;
          CMTimeAdd(&v47, &v41, &v42);
          v23 = self->_audioBytesPerSample * self->_requiredAudioSampleCountPerBuffer;
          v41 = v47;
          v24 = -[CMContinuityCaptureRemoteAudioDevice _createSampleBufferForAudioData:dataRange:pts:formatDescription:](self, "_createSampleBufferForAudioData:dataRange:pts:formatDescription:", v39, (v23 * v17), v23, &v41, desc);
          if (v24)
          {
            v25 = v24;
            -[CMContinuityCaptureRemoteAudioDevice _dispatchAudioFrame:](self, "_dispatchAudioFrame:", v24);
            CFRelease(v25);
          }
          ++v17;
        }
        while (v21 != v17);
      }
      v26 = v38 * self->_requiredAudioSampleCountPerBuffer * self->_audioBytesPerSample;
      v27 = objc_msgSend(v39, "length");
      v28 = v27 - v26;
      if (v27 == v26)
      {
        remainingAudioDataFromPreviousSbuf = self->_remainingAudioDataFromPreviousSbuf;
        self->_remainingAudioDataFromPreviousSbuf = 0;

      }
      else
      {
        v30 = (void *)MEMORY[0x24BDBCE50];
        v31 = objc_retainAutorelease(v39);
        objc_msgSend(v30, "dataWithBytes:length:", objc_msgSend(v31, "bytes") + v26, v28);
        v32 = (NSData *)objc_claimAutoreleasedReturnValue();
        v33 = self->_remainingAudioDataFromPreviousSbuf;
        self->_remainingAudioDataFromPreviousSbuf = v32;

      }
    }
  }
}

- (opaqueCMSampleBuffer)_createSampleBufferForAudioData:(id)a3 dataRange:(_NSRange)a4 pts:(id *)a5 formatDescription:(opaqueCMFormatDescription *)a6
{
  size_t length;
  NSUInteger location;
  id v11;
  __int128 v12;
  const AudioStreamBasicDescription *StreamBasicDescription;
  size_t v14;
  unsigned int *p_requiredAudioSampleCountPerBuffer;
  uint64_t v16;
  _BOOL4 v17;
  double *p_mSampleRate;
  const __CFAllocator *v19;
  opaqueCMSampleBuffer *v20;
  _BOOL4 v21;
  NSObject *v23;
  size_t sampleSizeArray;
  CMSampleTimingInfo v26;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;
  CMSampleBufferRef v29;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  blockBufferOut = 0;
  v29 = 0;
  dataPointerOut = (char *)0xAAAAAAAAAAAAAAAALL;
  v26.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v26.presentationTimeStamp.timescale = v12;
  *(_OWORD *)&v26.decodeTimeStamp.value = v12;
  *(_OWORD *)&v26.duration.value = v12;
  *(_OWORD *)&v26.duration.epoch = v12;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a6);
  sampleSizeArray = StreamBasicDescription->mBytesPerFrame;
  v14 = length / sampleSizeArray;
  p_requiredAudioSampleCountPerBuffer = &self->_requiredAudioSampleCountPerBuffer;
  v16 = *p_requiredAudioSampleCountPerBuffer;
  v17 = length / sampleSizeArray == v16;
  if (length / sampleSizeArray == v16)
  {
    p_mSampleRate = &StreamBasicDescription->mSampleRate;
    v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, length, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, length, 1u, &blockBufferOut))
    {
      CMContinuityCaptureLog(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.5();
    }
    else if (CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut))
    {
      CMContinuityCaptureLog(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.4();
    }
    else
    {
      memcpy(dataPointerOut, (const void *)(objc_msgSend(objc_retainAutorelease(v11), "bytes") + location), length);
      CMTimeMake(&v26.duration, 1, (int)*p_mSampleRate);
      v26.presentationTimeStamp = (CMTime)*a5;
      v26.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      if (!CMSampleBufferCreate(v19, blockBufferOut, 1u, 0, 0, a6, v14, 1, &v26, 1, &sampleSizeArray, &v29))
      {
        v17 = 0;
        goto LABEL_7;
      }
      CMContinuityCaptureLog(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRemoteAudioDevice _createSampleBufferForAudioData:dataRange:pts:formatDescription:].cold.1();
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteAudioDevice _createSampleBufferForAudioData:dataRange:pts:formatDescription:].cold.4(v14, p_requiredAudioSampleCountPerBuffer, v23);
  }

LABEL_7:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  v20 = v29;
  if (v29)
    v21 = v17;
  else
    v21 = 0;
  if (v21)
  {
    CFRelease(v29);
    v20 = 0;
  }

  return v20;
}

- (void)_resetNetworkSampleTime
{
  NSObject *v3;
  NSObject *v4;
  NSData *remainingAudioDataFromPreviousSbuf;
  int v6;
  CMContinuityCaptureRemoteAudioDevice *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureRemoteAudioDevice _resetNetworkSampleTime]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  self->_audioClockIsSynchronized = 0;
  self->_networkAudioSampleTime = 0;
  self->_lastAudioSynchronizationNetworkSampleTime = 0;
  remainingAudioDataFromPreviousSbuf = self->_remainingAudioDataFromPreviousSbuf;
  self->_remainingAudioDataFromPreviousSbuf = 0;

}

- (void)_dispatchAudioFrame:(opaqueCMSampleBuffer *)a3
{
  void *NumSamples;
  int64_t v6;
  _QWORD v7[5];
  id v8[3];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  NumSamples = (void *)CMSampleBufferGetNumSamples(a3);
  v6 = -[CMContinuityCaptureDeviceBase entity](self, "entity");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke;
  v7[3] = &unk_24F06CDD0;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = a3;
  v8[2] = NumSamples;
  -[CMContinuityCaptureRemoteAudioDevice dispatchFrame:entity:completion:](self, "dispatchFrame:entity:completion:", a3, v6, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CMClockRef HostTimeClock;
  void *v23;
  const void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  Float64 Seconds;
  Float64 v31;
  void *v32;
  Float64 v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime time;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  Float64 v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v7, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v3)
    {
      v20 = *(_QWORD *)(v5 + 304);
      if (!*(_BYTE *)(v5 + 296)
        && (!v20 || (double)(unint64_t)(v20 - *(_QWORD *)(v5 + 312)) / *(double *)(v5 + 272) > 0.05))
      {
        objc_msgSend(v9, "timeSyncClock");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = *(_QWORD *)(v5 + 304);
        if (v21)
        {
          *(_QWORD *)(v5 + 312) = v20;
          HostTimeClock = CMClockGetHostTimeClock();
          objc_msgSend((id)v5, "captureSession");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (const void *)objc_msgSend(v23, "synchronizationClock");

          memset(&v41, 170, sizeof(v41));
          CMSampleBufferGetPresentationTimeStamp(&v41, *(CMSampleBufferRef *)(a1 + 48));
          memset(&v40, 170, sizeof(v40));
          time = v41;
          CMSyncConvertTime(&v40, &time, v24, HostTimeClock);
          objc_msgSend(v10, "timeSyncClock");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          time = v40;
          v26 = objc_msgSend(v25, "domainTimeForMachAbsoluteTime:", CMClockConvertHostTimeToSystemUnits(&time));

          objc_msgSend(v10, "timeSyncClock");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "grandMasterIdentifier");

          CMContinuityCaptureLog(2);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            time = v41;
            Seconds = CMTimeGetSeconds(&time);
            time = v40;
            v31 = CMTimeGetSeconds(&time);
            time = v40;
            v37 = CMClockConvertHostTimeToSystemUnits(&time);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v26);
            v38 = v28;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            CMTimeMake(&v39, v26, 1000000000);
            v33 = CMTimeGetSeconds(&v39);
            v34 = *MEMORY[0x24BEB70D8];
            v35 = v26 != *MEMORY[0x24BEB70D8];
            LODWORD(time.value) = 134219266;
            *(Float64 *)((char *)&time.value + 4) = Seconds;
            LOWORD(time.flags) = 2048;
            *(Float64 *)((char *)&time.flags + 2) = v31;
            HIWORD(time.epoch) = 2048;
            v43 = v37;
            v44 = 2112;
            v45 = v32;
            v46 = 2048;
            v47 = v33;
            v48 = 1024;
            v49 = v35;
            _os_log_impl(&dword_227C5D000, v29, OS_LOG_TYPE_DEFAULT, "Converted audio PTS %.4f to host time PTS %.4f, mach_absolute_time %llu networkTime %@ %.5f valid %d", (uint8_t *)&time, 0x3Au);

            v28 = v38;
          }
          else
          {
            v34 = *MEMORY[0x24BEB70D8];
          }

          if (v26 != v34)
          {
            objc_msgSend((id)v5, "transportDevice");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", *(_QWORD *)(v5 + 304), v26, v28);

          }
          v20 = *(_QWORD *)(v5 + 304);
        }
      }
      *(_QWORD *)(v5 + 304) = v20 + *(_QWORD *)(a1 + 56);
      goto LABEL_22;
    }
    objc_msgSend(v3, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ContinuityCapture"));

    if (v12)
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_1(v5, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      *(_BYTE *)(v5 + 296) = 0;
      if (!CMContinityCaptureDebugLogEnabled())
      {
LABEL_22:

        goto LABEL_23;
      }
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_2();
    }

    goto LABEL_22;
  }
LABEL_24:

}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v8 = a4;
  v9 = v8;
  if (a3 == 3)
  {
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamInterrupted"));

    if (v11)
      -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v14, sel_postActionOfType_forEvent_option_, 13, v9, a5, v12.receiver, v12.super_class, v13.receiver, v13.super_class, self, CMContinuityCaptureRemoteAudioDevice);
    else
      -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v13, sel_postActionOfType_forEvent_option_, 12, v9, a5, v12.receiver, v12.super_class, self, CMContinuityCaptureRemoteAudioDevice, v14.receiver, v14.super_class);
  }
  else
  {
    -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v12, sel_postActionOfType_forEvent_option_, a3, v8, a5, self, CMContinuityCaptureRemoteAudioDevice, v13.receiver, v13.super_class, v14.receiver, v14.super_class);
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
  v14.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](&v14, sel_postActionCompletionForEventName_eventData_error_, v8, v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCaptureStreamSessionID, 0);
  objc_storeStrong((id *)&self->_audioDevice, 0);
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_remainingAudioDataFromPreviousSbuf, 0);
  objc_storeStrong((id *)&self->_audioDeviceInput, 0);
  objc_storeStrong((id *)&self->_audioDataOutput, 0);
  objc_storeStrong((id *)&self->_avcStreamInput, 0);
  objc_storeStrong((id *)&self->_avcAudioStream, 0);
}

- (void)createAVCAudioStream
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCAudioStream create error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "%{public}@ CMAudioFormatDescriptionCreate returned err %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCAudioInput Error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCAudioStream configure error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startCameraCaptureStack:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, a2, a3, "%{public}@ Could not find audio device", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)startCameraCaptureStack:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ Error creating audio device input: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startCameraCaptureStack:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "Unexpected device class %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)captureOutput:(uint64_t)a1 didDropSampleBuffer:(_QWORD *)a2 fromConnection:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, (uint64_t)a2, a3, "%{public}@ Dropped %lld audio buffers", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processIncomingAudioBuffer:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_4_0(&dword_227C5D000, a2, a3, "Buffer reconstruction for required block size is disabled, but received a buffer with unexpected block size. Remaining sample count:%d, buffer sample count:%d", 67109376, v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processIncomingAudioBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "Failed to retrieve data bytes from incoming audio sample buffer. error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_createSampleBufferForAudioData:dataRange:pts:formatDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "CMSampleBufferCreate(audio) failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_createSampleBufferForAudioData:(NSObject *)a3 dataRange:pts:formatDescription:.cold.4(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  uint64_t v3;

  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *a2;
  OUTLINED_FUNCTION_4_0(&dword_227C5D000, (uint64_t)a2, a3, "Failed to create audio sample buffer with invalid number of samples: %d. Requiring %d samples", 67109376, v3);
  OUTLINED_FUNCTION_1_0();
}

void __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, a2, a3, "Received error in ContinuityCapture domain when pushing buffer #%llu. Expected during transport switch where AVC session is restarting but capture session is kept running.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_227C5D000, v0, OS_LOG_TYPE_DEBUG, "%@ Error pushing buffer %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
