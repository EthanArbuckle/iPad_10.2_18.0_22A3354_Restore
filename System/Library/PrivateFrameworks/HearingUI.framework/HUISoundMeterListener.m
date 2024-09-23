@implementation HUISoundMeterListener

- (HUISoundMeterListener)initWithDelgate:(id)a3 source:(unint64_t)a4
{
  id v6;
  HUISoundMeterListener *v7;
  HUISoundMeterListener *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUISoundMeterListener;
  v7 = -[HUISoundMeterListener init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HUISoundMeterListener setSource:](v7, "setSource:", a4);
    -[HUISoundMeterListener setDelegate:](v8, "setDelegate:", v6);
  }

  return v8;
}

- (void)start
{
  -[HUISoundMeterListener _startLocalLevels](self, "_startLocalLevels");
  -[HUISoundMeterListener _startRemoteLevels](self, "_startRemoteLevels");
}

- (void)stop
{
  -[HUISoundMeterListener _stopLocalLevels](self, "_stopLocalLevels");
  -[HUISoundMeterListener _stopRemoteLevels](self, "_stopRemoteLevels");
  -[HUISoundMeterListener _updateSoundMeterAvailableLocally:remotely:](self, "_updateSoundMeterAvailableLocally:remotely:", 0, 0);
}

- (BOOL)shouldShow
{
  return -[HUISoundMeterListener areLocalLevelsAvailable](self, "areLocalLevelsAvailable")
      || -[HUISoundMeterListener areRemoteLevelsAvailable](self, "areRemoteLevelsAvailable");
}

- (void)_updateSoundMeterAvailableLocally:(BOOL)a3 remotely:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  const char *v30;
  uint64_t v31;

  v4 = a4;
  v5 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = -[HUISoundMeterListener shouldShow](self, "shouldShow");
  v8 = -[HUISoundMeterListener areLocalLevelsAvailable](self, "areLocalLevelsAvailable");
  v9 = -[HUISoundMeterListener areRemoteLevelsAvailable](self, "areRemoteLevelsAvailable");
  v10 = v5 | v4;
  -[HUISoundMeterListener setAreLocalLevelsAvailable:](self, "setAreLocalLevelsAvailable:", v5);
  -[HUISoundMeterListener setAreRemoteLevelsAvailable:](self, "setAreRemoteLevelsAvailable:", v4);
  v11 = -[HUISoundMeterListener areLocalLevelsAvailable](self, "areLocalLevelsAvailable");
  v12 = v9 ^ -[HUISoundMeterListener areRemoteLevelsAvailable](self, "areRemoteLevelsAvailable");
  if (v8 != v11)
  {
    -[HUISoundMeterListener delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[HUISoundMeterListener delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[HUISoundMeterListener delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localSourceAvailableDidUpdate:", v5);

      }
    }
  }
  v18 = v10 ^ v7;
  if (v12)
  {
    -[HUISoundMeterListener delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[HUISoundMeterListener delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        -[HUISoundMeterListener delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "remoteSourceAvailableDidUpdate:", v4);

      }
    }
  }
  if (v18)
  {
    HCLogSoundMeter();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = "Hiding";
      if ((_DWORD)v10)
        v25 = "Showing";
      v29 = 136315138;
      v30 = v25;
      _os_log_impl(&dword_21A95E000, v24, OS_LOG_TYPE_INFO, "%s sound meter", (uint8_t *)&v29, 0xCu);
    }

    -[HUISoundMeterListener delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
    {
      -[HUISoundMeterListener delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "liveLevelMeteringDisplayStateChanged:", v10);

    }
  }
}

- (void)_startLocalLevels
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (-[HUISoundMeterListener source](self, "source") != 2
    && !-[HUISoundMeterListener isListeningForLocalLevels](self, "isListeningForLocalLevels"))
  {
    HCLogSoundMeter();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A95E000, v3, OS_LOG_TYPE_INFO, "Start listening for local headphone levels", (uint8_t *)buf, 2u);
    }

    -[HUISoundMeterListener setIsListeningForLocalLevels:](self, "setIsListeningForLocalLevels:", 1);
    objc_initWeak(buf, self);
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __42__HUISoundMeterListener__startLocalLevels__block_invoke;
    v5[3] = &unk_24DD617E8;
    objc_copyWeak(&v6, buf);
    objc_msgSend(v4, "registerListener:forLiveHeadphoneLevelHandler:", self, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __42__HUISoundMeterListener__startLocalLevels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE18]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE28]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");

    AXPerformBlockOnMainThread();
    v10 = objc_msgSend(WeakRetained, "isListeningForRemoteLevels");
    if (v6)
    {
      if (v10)
      {
        HCLogSoundMeter();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21A95E000, v11, OS_LOG_TYPE_INFO, "local headphone levels enabled", buf, 2u);
        }

        objc_msgSend(WeakRetained, "_stopRemoteLevels");
      }
    }
    else if ((v10 & 1) == 0)
    {
      HCLogSoundMeter();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A95E000, v12, OS_LOG_TYPE_INFO, "local headphone levels not enabled", buf, 2u);
      }

      objc_msgSend(WeakRetained, "_startRemoteLevels");
    }
    if (v6 != objc_msgSend(WeakRetained, "areLocalLevelsAvailable"))
    {
      HCLogSoundMeter();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = "unavailable";
        if (v6)
          v14 = "available";
        *(_DWORD *)buf = 136315138;
        v16 = v14;
        _os_log_impl(&dword_21A95E000, v13, OS_LOG_TYPE_INFO, "Local headphone levels %s", buf, 0xCu);
      }

      AXPerformBlockOnMainThread();
    }
  }

}

void __42__HUISoundMeterListener__startLocalLevels__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateViewsWith:fastLeq:thresholdLevel:", *(_QWORD *)(a1 + 40), *(float *)(a1 + 48), *(float *)(a1 + 52));

  }
}

uint64_t __42__HUISoundMeterListener__startLocalLevels__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSoundMeterAvailableLocally:remotely:", *(unsigned __int8 *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "areRemoteLevelsAvailable"));
}

- (void)_stopLocalLevels
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HCLogSoundMeter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A95E000, v3, OS_LOG_TYPE_INFO, "Stop listening for local headphone levels", v5, 2u);
  }

  -[HUISoundMeterListener setIsListeningForLocalLevels:](self, "setIsListeningForLocalLevels:", 0);
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterLiveHeadphoneLevelHandler:", self);

}

- (void)_startRemoteLevels
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (-[HUISoundMeterListener source](self, "source") != 1
    && !-[HUISoundMeterListener isListeningForRemoteLevels](self, "isListeningForRemoteLevels"))
  {
    HCLogSoundMeter();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A95E000, v3, OS_LOG_TYPE_INFO, "Start listening for remote headphone levels", (uint8_t *)buf, 2u);
    }

    -[HUISoundMeterListener setIsListeningForRemoteLevels:](self, "setIsListeningForRemoteLevels:", 1);
    objc_initWeak(buf, self);
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__HUISoundMeterListener__startRemoteLevels__block_invoke;
    v5[3] = &unk_24DD617E8;
    objc_copyWeak(&v6, buf);
    objc_msgSend(v4, "registerListener:forRemoteLiveHeadphoneLevelHandler:", self, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __43__HUISoundMeterListener__startRemoteLevels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE18]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE28]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");

    AXPerformBlockOnMainThread();
    if (v6 != objc_msgSend(WeakRetained, "areRemoteLevelsAvailable"))
    {
      HCLogSoundMeter();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = "unavailable";
        if (v6)
          v11 = "available";
        *(_DWORD *)buf = 136315138;
        v13 = v11;
        _os_log_impl(&dword_21A95E000, v10, OS_LOG_TYPE_INFO, "Remote headphone levels %s", buf, 0xCu);
      }

      AXPerformBlockOnMainThread();
    }
  }

}

void __43__HUISoundMeterListener__startRemoteLevels__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateViewsWith:fastLeq:thresholdLevel:", *(_QWORD *)(a1 + 40), *(float *)(a1 + 48), *(float *)(a1 + 52));

  }
}

uint64_t __43__HUISoundMeterListener__startRemoteLevels__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSoundMeterAvailableLocally:remotely:", objc_msgSend(*(id *)(a1 + 32), "areLocalLevelsAvailable"), *(unsigned __int8 *)(a1 + 40));
}

- (void)_stopRemoteLevels
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HCLogSoundMeter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A95E000, v3, OS_LOG_TYPE_INFO, "Stop listening for remote headphone levels", v5, 2u);
  }

  -[HUISoundMeterListener setIsListeningForRemoteLevels:](self, "setIsListeningForRemoteLevels:", 0);
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterRemoteLiveHeadphoneLevelHandler:", self);

}

- (HUISoundMeterListenerDelegate)delegate
{
  return (HUISoundMeterListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isListeningForLocalLevels
{
  return self->_isListeningForLocalLevels;
}

- (void)setIsListeningForLocalLevels:(BOOL)a3
{
  self->_isListeningForLocalLevels = a3;
}

- (BOOL)isListeningForRemoteLevels
{
  return self->_isListeningForRemoteLevels;
}

- (void)setIsListeningForRemoteLevels:(BOOL)a3
{
  self->_isListeningForRemoteLevels = a3;
}

- (BOOL)areLocalLevelsAvailable
{
  return self->_areLocalLevelsAvailable;
}

- (void)setAreLocalLevelsAvailable:(BOOL)a3
{
  self->_areLocalLevelsAvailable = a3;
}

- (BOOL)areRemoteLevelsAvailable
{
  return self->_areRemoteLevelsAvailable;
}

- (void)setAreRemoteLevelsAvailable:(BOOL)a3
{
  self->_areRemoteLevelsAvailable = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
